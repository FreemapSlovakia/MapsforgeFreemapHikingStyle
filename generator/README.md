# MapsforgeFreemapHikingStyle - generator

## how to run
* dowload JAVA - https://www.java.com/en/download/
* download osmosis - http://wiki.openstreetmap.org/wiki/Osmosis
* download mapwrite plugin - https://github.com/mapsforge/mapsforge/blob/master/docs/Getting-Started-Map-Writer.md
* run addfmreltag.pl (add special tags to ways from relations)
* run osmosis


example: 

addfmreltag.pl INPUT_FILE.osm.pbf 

osmosis -v --rb file=INPUT_FILE-fmrel.osm.pbf --bp file=CLIP_POLYGON.poly clipIncompleteEntities=true --tt file=tag-transform.xml --mw file=OUTPUT_FILE.map bbox=MIN_LAT,MIN_LON,MAX_LAT,MAX_LON tag-conf-file=tag-mapping-fm.xml type=hd preferred-languages=sk simplification-factor=3 map-start-zoom=9 comment="MAP COMMENT" bbox-enlargement=32


INPUT_FILE.osm.pbf - OpenStreetMap data file
 
CLIP_POLYGON.poly - polygon file (http://wiki.openstreetmap.org/wiki/Osmosis/Polygon_Filter_File_Format) for clipping (OPTIONAL)

Note: OSM data don't contain countours. Use http://wiki.openstreetmap.org/wiki/Phyghtmap (or other program) to convert hgt files to pbf. When merge INPUT_FILE-fmrel.osm.pbf with contours.pbf

phyghtmap  --jobs=6 --pbf  --source=srtm1 --polygon=CLIP_POLYGON.poly --max-nodes-per-way=1000 --start-node-id=100000000000 --start-way-id=100000000000 -s 10 -c 100,50 
osmosis --rb file=INPUT_FILE-fmrel.osm.pbf  --rb file=CONTOURS.osm.pbf --merge --wb file=MERGED_DATA.osm.pbf  omitmetadata=true 
       