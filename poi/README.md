POI - generator

## how to run
* dowload JAVA - https://www.java.com/en/download/
* download osmosis - http://wiki.openstreetmap.org/wiki/Osmosis
* download poiwrite plugin - https://github.com/mapsforge/mapsforge/blob/master/docs/POI.md
* run osmosis

### example: 

osmosis --rb file=inputfile.osm.pbf --poi-writer file=output_file.poi tag-conf-file=poi-mapping-fm.xml

### Note:

This .poi file don't work with Locus Map! Locus Map uses own poi format -not mapsforge! 
Possible converter? http://help.locusmap.eu/topic/import-poi-file

Works for OruxMaps, ... 