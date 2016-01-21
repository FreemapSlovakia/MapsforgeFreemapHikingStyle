# MapsforgeHikingStyle - generator

## how to run
* dowload JAVA - https://www.java.com/en/download/
* download osmosis - http://wiki.openstreetmap.org/wiki/Osmosis
* download mapwrite plugin - https://github.com/mapsforge/mapsforge/blob/master/docs/Getting-Started-Map-Writer.md
* run osmosis

osmosis -v --rb file=INPUT_FILE.osm.pbf --bp file=CLIP_POLYGON.txt clipIncompleteEntities=true --tt file=tag-transform.xml --mw file=OUTPUT_FILE.map bbox=MIN_LAT,MIN_LON,MAX_LAT,MAX_LON tag-conf-file=tag-mapping-fm.xml type=hd preferred-language=sk simplification-factor=3 map-start-zoom=9 comment="MAP COMMENT" bbox-enlargement=32