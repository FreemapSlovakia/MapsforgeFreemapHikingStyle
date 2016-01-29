#!/usr/bin/perl
# read the given .pbf/.osm file and add fmrel* tags for ways in relations (type=route, route=*)
#
# Parameters:
# <1> - imported file
# [2] - working directory, where temporary files will be stored
#
# some of the functions in this script comes from the osm.pm module 
# (http://svn.openstreetmap.org/applications/utils/gary68/OSM/osm.pm) written by Gerhard Schwanz
#
#    Copyright (C) 2016  Tibor Jamecny <tibor.jamecny (at) freemap.sk>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#


use 5.010;
use strict;
use warnings;

my @allowedHikingSymbols = qw(cave edu education interesting_object local major none peak roundtrip ruin shelter spring stripe yes);
my $line;

# input file
if (!defined($ARGV[0])) {
	print STDERR "Input file not specified!\n";
	exit 1;
}
my $inFile = $ARGV[0];
if (! -s $inFile) {
	print STDERR "File $inFile does not exist or is empty!\n";
	exit 2;
}
my ($ext) = $inFile =~ /(\.[^.]+)$/;
if (($ext ne ".osm") and ($ext ne ".pbf")) {
	print STDERR "Unsupported extension \"$ext\" of the input file!\n";
	exit 3;
}

# working directory
my $workDir=".";
if (defined($ARGV[1])) { $workDir=$ARGV[1]; }
if (! -d $workDir) {
	print STDERR "Working directory \"$workDir\" does not exist!\n";
	exit 4;
}
if (! -w $workDir) {
	print STDERR "Cannot create files in the working directory \"$workDir\"!\n";
	exit 5;
}

# temporary files
my $tmpWayFile = "$workDir/tmpways.osm";
my $finalWayFile = "$workDir/finalways.osm";
my $tmpRelFile = "$workDir/tmprels.osm";

# redirect output to file
my $redirOutput = "$workDir/addfmreltags.log 2>&1";
# osmosis parameters based on input file extension
my $inputTypeParam = "--rx";
my $outputTypeParam = "--wx";
if ($ext eq ".pbf") {
	$inputTypeParam = "--rbf";
	$outputTypeParam = "--wb";
}

my $command = "osmosis $inputTypeParam $inFile --tf reject-nodes --tf reject-ways --tf accept-relations --wx $tmpRelFile 1>$redirOutput";
print("Extracting Relations using osmosis... ");
runCommand($command);
if (! -s $tmpRelFile) {
	print STDERR "Temporary file with Relations not created!\n";
	print STDERR "Cmd: $command\n";
	exit 6;
}
print("DONE.\n");

print("Reading Relations file... ");
my ($fmRelTags) = processRelations($tmpRelFile);
print("DONE.\n");
deletetmpfile($tmpRelFile);

$command = "osmosis $inputTypeParam $inFile --tf reject-nodes --tf reject-relations --tf accept-ways --wx $tmpWayFile 1>>$redirOutput";
print("Extracting Ways using osmosis... ");
runCommand($command);
if (! -s $tmpWayFile) {
	print STDERR "Temporary file with Ways not created!\n";
	print STDERR "Cmd: $command\n";
	exit 7;
}
print("DONE.\n");

print("Adding FmRel* tags to Ways... ");
addFmRelTagsToWays($fmRelTags, $tmpWayFile, $finalWayFile);
print("DONE.\n");
# cleanup
deletetmpfile($tmpWayFile);

my $finalFile = "$inFile-fmrel$ext";
$command = "osmosis --rx $finalWayFile $inputTypeParam $inFile --merge $outputTypeParam $finalFile 1>>$redirOutput";
print("Merging Ways with the original file... ");
runCommand($command);
if (! -s $finalFile) {
	print STDERR "Final file not created!\n";
	print STDERR "Cmd: $command\n";
	exit 8;
}
print("DONE.\n");
deletetmpfile($finalWayFile);
exit;

sub addFmRelTagsToWays {
	my ($tags, $inputFile, $outputFile) = @_;

	my ($inFh, $header) = openOsmFile($inputFile);
	open(my $outFh, ">", $outputFile) or die("Can't create file: $!\n");
	print $outFh $header;

	# read the Ways one by one, add tags and write them to a file
	my ($wayProps, $wayNodes, $wayTags) = getWay3($inFh);
	while (defined($wayProps)) {
		my $wayId = $wayProps->{id};
		if (defined($tags->{$wayId})) {	# add all fmRel* tags
			for my $key (keys(%{$tags->{$wayId}})) {
				$wayTags->{$key} = $tags->{$wayId}->{$key};
			}
		}
		writeWay($outFh, $wayProps, $wayNodes, $wayTags); 
		($wayProps, $wayNodes, $wayTags) = getWay3($inFh);
	}
	print $outFh "</osm>\n";
	close($inFh);
	close($outFh);
}

sub addNewTags2Cache {
	my ($destTags, $newTags, $relItems) = @_;

	for my $itemArr (@$relItems) {
		if ($itemArr->[0] eq "way") {
			my $wayId = $itemArr->[1];
			if (!defined($destTags->{$wayId})) { $destTags->{$wayId} = {}; }
			my $wayTags = $destTags->{$wayId};
			for my $tag (keys(%$newTags)) {
				if (index($tag, "ref") != -1) {	# add Ref to an array
					if (!defined($wayTags->{$tag})) { $wayTags->{$tag} = (); }
					push @{$wayTags->{$tag}}, $newTags->{$tag};
				}
				else { $wayTags->{$tag} = $newTags->{$tag}; }
			}
		}
	}
}

sub closeOsmFile {
	my ($fileIn) = @_;

	close($fileIn);
}

sub collectFmRelAdminTags {
	my ($destTags, $relTags, $relItems) = @_;

	if (hasTagWithValue($relTags, "boundary", "administrative") and hasTag($relTags, "admin_level")) {
		my $admName = "";
		my $admLevel = $relTags->{"admin_level"};
		if (defined($relTags->{"name"})) { $admName = $relTags->{"name"}; }
		for my $itemArr (@$relItems) {
			if ($itemArr->[0] eq "way") {
				my $wayId = $itemArr->[1];
				if (!defined($destTags->{$wayId})) { $destTags->{$wayId} = {}; }
				my $wayTags = $destTags->{$wayId};
				if (!defined($wayTags->{"fmreladminlevel"}) or
						($wayTags->{"fmreladminlevel"} > $admLevel)) {
					$wayTags->{"fmreladminlevel"} = $admLevel;
					if ($admName ne "") { $wayTags->{"fmreladminname"} = $admName; }
				}
			}
		}
	}
}

sub collectFmRelRouteTags {
	my ($destTags, $relTags, $relItems) = @_;
	our $dispatchTable ||= {
		bicycle => \&getFmRelBicycleTags,
		bus		=> \&getFmRelBusTags,
		foot	=> \&getFmRelFootTags,
		hiking	=> \&getFmRelHikingTags,
		horse	=> \&getFmRelHorseTags,
		mtb		=> \&getFmRelMtbTags,
		ski		=> \&getFmRelSkiTags,
		tram	=> \&getFmRelTramTags,
		trolleybus => \&getFmRelTrolleybusTags
	};

	my $action = $relTags->{"route"};
	if (defined($dispatchTable->{$action})) {
		my $newTags = $dispatchTable->{$action}->($relTags);
		addNewTags2Cache($destTags, $newTags, $relItems);
	}
}

sub	convertArrayToString {
	my ($tags) = @_;

	for my $wayId (keys(%$tags)) {
		my $wayTags = $tags->{$wayId};
		for my $tag (keys(%$wayTags)) {
			if (index($tag, "ref") != -1) {	# convert Ref from array to plain string
				if (scalar(@{$wayTags->{$tag}}) > 1) {
					$wayTags->{$tag} = join(",", sort(uniq(@{$wayTags->{$tag}})));
				}
				else { $wayTags->{$tag} = $wayTags->{$tag}->[0]; }
			}
		}
	}
}

sub deletetmpfile {
	my ($file) = @_;

	unlink $file if (-f $file);
}

sub getColour {
	my ($relTags) = @_;
	my $colour = "";
	our @colours = ("red", "blue", "green", "yellow", "black", "white");

	if (defined($relTags->{"osmc:symbol"})) { # get the colour from the osmc:symbol
		my $osmc = $relTags->{"osmc:symbol"};
		for my $tmpColour (@colours) {
			if (index($osmc, $tmpColour . ":") == 0) {
				$colour = $tmpColour;
				last;
			}
		}
	}
	if ($colour eq "") {	# get the colour from the tag of the relation itself
		if (defined($relTags->{"colour"})) { $colour = $relTags->{"colour"}; }
		elsif (defined($relTags->{"color"})) { $colour = $relTags->{"color"}; }
	}
	if (!grep(/^$colour$/, @colours)) { $colour = "default"; }

	return $colour;
}

sub getFmRelBicycleTags {
	my ($relTags) = @_;
	my $fmRelTags = {};
	my $colour = getColour($relTags);
	my $symbol = getSymbol($relTags);

	if (defined($relTags->{"ref"})) { $fmRelTags->{"fmrelbicycleref"} = $relTags->{"ref"}; }
	$fmRelTags->{"fmrelbicycle" . $colour} = $symbol;

	return $fmRelTags;
}

sub getFmRelBusTags {
	my ($relTags) = @_;
	my $fmRelTags = {};

	$fmRelTags->{"fmrelbus"} = "yes";
	if (defined($relTags->{"ref"})) { $fmRelTags->{"fmrelbusref"} = $relTags->{"ref"}; }

	return $fmRelTags;
}

sub getFmRelFootTags {
	my ($relTags) = @_;
	my $fmRelTags = {};
	my @colours = ("red", "blue", "green", "yellow");

	my $key = "";
	for my $colour (@colours) {
		if (defined($relTags->{"kct_" . $colour})) {
			$key = $colour;
			last;
		}
	}
	if ($key ne "") {
		$fmRelTags->{"fmrelhiking" . $key} = $relTags->{"kct_" . $key};
	}
	return $fmRelTags;
}

sub getFmRelHikingTags {
	my ($relTags) = @_;
	my $fmRelTags = {};
	my $symbol = getSymbol($relTags);

	if (!isValidHikingSymbol($symbol)) { return $fmRelTags; }	# avoid strange relations
	my $colour = getColour($relTags);
	my $ref = undef;

	if (defined($relTags->{"ref"})) { $ref = $relTags->{"ref"}; }
	if (($symbol eq "edu") or ($symbol eq "education")) { # education trails
		$fmRelTags->{"fmreleducation"} =  $symbol;
		if (defined($ref)) { $fmRelTags->{"fmreleducationref"} = $ref; }
	} else {	# hiking trails
		my $network = "";	# distinguish the official trail from the local/unknown trails
		if (defined($relTags->{"network"})) { $network = $relTags->{"network"}; }
		if ($network eq "lwn") { $network = "local"; }
		elsif (($network eq "rwn") or ($network eq "nwn") or ($network eq "iwn")) { $network = ""; }
		else { $network = "unknown"; }
		$fmRelTags->{"fmrelhiking" . $network . $colour} = $symbol;
		$fmRelTags->{"fmrelhiking" . $colour} = $symbol; # tag duplication, reason unknown :(
		if (defined($ref)) {
			$fmRelTags->{"fmrelhikingref"} = $ref;
			$fmRelTags->{"fmrelhiking" . $network . $colour . "ref"} = $ref;
			$fmRelTags->{"fmrelhiking" . $colour . "ref"} = $ref; # tag duplication
		}
	}
	return $fmRelTags;
}

sub getFmRelHorseTags {
	my ($relTags) = @_;

	my $fmRelTags = {};
	my $colour = getColour($relTags);
	my $symbol = getSymbol($relTags);

	if (defined($relTags->{"ref"})) { $fmRelTags->{"fmrelhorseref"} = $relTags->{"ref"}; }
	$fmRelTags->{"fmrelhorse" . $colour} = $symbol;

	return $fmRelTags;
}

sub getFmRelMtbTags {
	my ($relTags) = @_;
	my $fmRelTags = {};
	my $colour = getColour($relTags);
	my $symbol = getSymbol($relTags);

	if (defined($relTags->{"ref"})) { $fmRelTags->{"fmrelmtbref"} = $relTags->{"ref"}; }
	$fmRelTags->{"fmrelmtb" . $colour} = $symbol;

	return $fmRelTags;
}

sub getFmRelSkiTags {
	my ($relTags) = @_;
	my $fmRelTags = {};
	my $colour = getColour($relTags);
	my $symbol = getSymbol($relTags);

	if (defined($relTags->{"ref"})) { $fmRelTags->{"fmrelskiref"} = $relTags->{"ref"}; }
	$fmRelTags->{"fmrelski" . $colour} = $symbol;

	return $fmRelTags;
}

sub getFmRelTramTags {
	my ($relTags) = @_;
	my $fmRelTags = {};

	$fmRelTags->{"fmreltram"} = "yes";
	if (defined($relTags->{"ref"})) { $fmRelTags->{"fmreltramref"} = $relTags->{"ref"}; }

	return $fmRelTags;
}

sub getFmRelTrolleybusTags {
	my ($relTags) = @_;
	my $fmRelTags = {};

	$fmRelTags->{"fmreltrolleybus"} = "yes";
	if (defined($relTags->{"ref"})) { $fmRelTags->{"fmreltrolleybusref"} = $relTags->{"ref"}; }

	return $fmRelTags;
}

sub getProperties {
	my ($line, $type, $id) = @_;
	my $version; my $timestamp; my $uid; my $lon; my $lat; my $u; my $cs; my $visible;
	my %properties = ();

	($u) = ($line =~ / user=[\'\"](.+?)[\'\"]/);
	($version) = ($line =~ / version=[\'\"](.+?)[\'\"]/);
	($timestamp) = ($line =~ / timestamp=[\'\"](.+?)[\'\"]/);
	($uid) = ($line =~ / uid=[\'\"](.+?)[\'\"]/);
	($cs) = ($line =~ / changeset=[\'\"](.+?)[\'\"]/);
	($visible) = ($line =~ / visible=[\'\"](.+?)[\'\"]/);
	$properties{"id"} = $id;
	if (defined $u) { $properties{"user"} = $u; }
	if (defined $uid) { $properties{"uid"} = $uid; }
	if (defined $version) { $properties{"version"} = $version; }
	if (defined $timestamp) { $properties{"timestamp"} = $timestamp; }
	if (defined $cs) { $properties{"changeset"} = $cs; }
	if (defined $visible) { $properties{"visible"} = $visible; }
	if ($type eq "node") {
		($lon) = ($line =~ / lon=[\'\"](.+?)[\'\"]/);
		($lat) = ($line =~ / lat=[\'\"](.+?)[\'\"]/);
		if (!defined $lon) { $lon = 0; }
		if (!defined $lat) { $lat = 0; }
		$properties{"lon"} = $lon;
		$properties{"lat"} = $lat;
	}
	return (\%properties);
}

sub getRelation3 {
	my ($fileIn) = @_;
	my $ref0; my $ref1; my $ref2;

	if ($line =~ /^\s*\<relation/) { ($ref0, $ref1, $ref2) = readRelation($fileIn); }
	else { return (undef, undef, undef); }
	return ($ref0, $ref1, $ref2);
}

sub getSymbol {
	my ($relTags) = @_;
	my $symbol = "";

	if (defined($relTags->{"symbol"})) { $symbol = $relTags->{"symbol"}; }
	if ($symbol eq "") { $symbol = "none"; }

	return $symbol;
}

sub getWay3 {
	my ($fileIn) = @_;
	my $ref0; my $ref1; my $ref3;

	if ($line =~ /^\s*\<way/) { ($ref0, $ref1, $ref3) = readWay($fileIn); }
	else { return (undef, undef, undef); }
	return ($ref0, $ref1, $ref3);
}

sub hasTag {
	my ($objTags, $tag) = @_;

	return (defined($objTags->{$tag}));
}

sub hasTagWithValue {
	my ($objTags, $tag, $val) = @_;

	return (hasTag($objTags, $tag) and ($objTags->{$tag} eq $val));
}

sub isValidHikingSymbol {
	my ($symbol) = @_;

	return grep(/^$symbol$/, @allowedHikingSymbols);	
}

sub nextLine {
	my ($fileIn) = @_;

	do {
		$line = <$fileIn>;
	} while (defined($line) and ($line =~ /^!--/));
}

sub openOsmFile {
	my ($fileName) = @_;
	my $osmFileHeader = '';

	open(my $fileIn, "<", $fileName) or die "Can't open OSM file: $!\n";
	nextLine($fileIn);
	while (defined($line) and !(grep /\<node/, $line) and
			!(grep /\<way/, $line) and !(grep /\<relation/, $line)) {
		if ((grep /\<\?xml /, $line) or (grep /\<osm /, $line) or (grep /\<bounds /, $line)) {
			$osmFileHeader .= $line;
		}
		nextLine($fileIn);
	}
	return ($fileIn, $osmFileHeader);
}

sub processRelations {
	my ($inputFile) = @_;
	my $tags = {};

	my ($inFh, $header) = openOsmFile($inputFile);
	my ($relProps, $relItems, $relTags) = getRelation3($inFh);
	while (defined($relProps)) {
		if (hasTagWithValue($relTags, "type", "route") and hasTag($relTags, "route")) {
			collectFmRelRouteTags($tags, $relTags, $relItems);
		} elsif (hasTagWithValue($relTags, "type", "boundary")) {
			collectFmRelAdminTags($tags, $relTags, $relItems);
		}
		($relProps, $relItems, $relTags) = getRelation3($inFh);
	}
	close($inFh);
	convertArrayToString($tags);
	return $tags;
}

sub readRelation {
	my ($fileIn) = @_;
	my $propRef;
	my @relMembers = ();
	my %relTags = ();

	my ($id) = ($line =~ / id=[\'\"](.+?)[\'\"]/);
	if (!defined($id)) { print("WARNING: reading osm file, line follows:\n$line\n"); }
	else {
		$propRef = getProperties($line, "relation", $id);
		if (!grep /\/>/, $line) {
			nextLine($fileIn);
			while (not($line =~ /\/relation>/)) { # more data
				if ($line =~ /<member/) {
					my ($memberType) = ($line =~ /^\s*\<member type=[\'\"]([\w]*)[\'\"]/);
					my ($memberRef) = ($line =~ /^.+ref=[\'\"]([\d\-]+)[\'\"]/);
					my ($memberRole) = ($line =~ /^.+role=[\'\"](.*)[\'\"]/);
					if (!$memberRole) { $memberRole = "none"; }
					my @member = [$memberType, $memberRef, $memberRole];
					push @relMembers, @member;
				}
				if ($line =~ /<tag/) {
					my ($k, $v) = ($line =~ /^\s*\<tag k=[\'\"](.+)[\'\"]\s*v=[\'\"](.+)[\'\"]/);
					if (!($k and defined($v))) {
						$k = "unknown";
						$v = "unknown";
					}
					$relTags{$k} = $v;
				}
				nextLine($fileIn);
			}
		}
		nextLine($fileIn);
	}
	return ($propRef, \@relMembers, \%relTags);
}

sub readWay {
	my ($fileIn) = @_;
	my $propRef;
	my @wayNodes = ();
	my %wayTags = ();

	my ($id) = ($line =~ / id=[\'\"](.+?)[\'\"]/);
	if (!defined($id)) { print("WARNING: reading osm file, line follows :\n$line\n"); }
	else {
		$propRef = getProperties($line, "way", $id);
		if (!grep /\/>/, $line) {
			nextLine($fileIn);
			while (not($line =~ /\/way>/)) { # more way data
				#get nodes and type
				my ($node) = ($line =~ /^\s*\<nd ref=[\'\"]([\d\-]+)[\'\"]/); # get node id
				my ($k, $v) = ($line =~ /^\s*\<tag k=[\'\"](.+)[\'\"]\s*v=[\'\"](.+)[\'\"]/);

				if (!(($node) or ($k and defined($v)))) {
					print("WARNING: tag not recognized: $line\n");
				}
				if ($node) { push @wayNodes, $node; }
				#get tags
				if ($k and defined($v)) { $wayTags{$k} = $v; }   
				nextLine($fileIn);
			}
		}
		nextLine($fileIn);
	}
	return ($propRef, \@wayNodes, \%wayTags);
}

sub runCommand {
	my ($cmd) = @_;

	my $retVal = system($cmd);
	if ($retVal < 0) {
		print STDERR "\nERROR: Could not run the following command:\n";
		print STDERR "  $cmd\n";
	}
}

sub uniq {
	my %seen;
	return grep { !$seen{$_}++ } @_;
}

sub writeWay {
	my ($fileOut, $props, $nodes, $tags) = @_;

	print $fileOut "<way ";
	writeWayProps($fileOut, $props);
	print $fileOut ">\n";
	writeWayNodes($fileOut, $nodes);
	writeWayTags($fileOut, $tags);
	print $fileOut "</way>\n";
}

sub writeWayNodes {
	my ($fileOut, $nodes) = @_;

	for my $nodeId (@$nodes) { print $fileOut "<nd ref=\"$nodeId\" />\n"; }
}

sub writeWayProps {
	my ($fileOut, $props) = @_;
	my @propsOrder = ("id", "timestamp", "uid", "user", "version", "changeset");
	our $defaultProps ||= {
		"id" => 0,
		"timestamp" => "1970-01-01T00:00:01Z",
		"uid" => 0,
		"user" => "",
		"version" => 0,
		"changeset" => 0
	};

	for my $prop (@propsOrder) {
		if (defined($props->{$prop})) { print $fileOut "$prop=\"$props->{$prop}\" "; }
		else { print $fileOut "$prop=\"$defaultProps->{$prop}\" "; }
	}
}

sub writeWayTags {
	my ($fileOut, $tags) = @_;

	for my $tagKey (sort keys(%$tags)) {
		print $fileOut "<tag k=\"$tagKey\" v=\"$tags->{$tagKey}\" />\n";
	}
}
