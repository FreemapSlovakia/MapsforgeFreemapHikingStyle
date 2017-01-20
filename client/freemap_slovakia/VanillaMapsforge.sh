#!/bin/sh

# script removes all Locus specific tags from xml style file 

sed -i 's/ locus-extended="1"//g' freemap_slovakia.xml
sed -i 's/ curve="cubic"//g' freemap_slovakia.xml
sed -i 's/ force-draw="1"//g' freemap_slovakia.xml
sed -i 's/dp"/"/g' freemap_slovakia.xml

sed -i 's/ scale-icon-size="[0-9]*,[0-9]*.[0-9]*"//g' freemap_slovakia.xml
sed -i 's/ scale-font-size="[0-9]*,[0-9]*.[0-9]*"//g' freemap_slovakia.xml
sed -i 's/ scale-dy-size="[0-9]*,[0-9]*.[0-9]*"//g' freemap_slovakia.xml
sed -i 's/ bg-rect-fill="#[a-zA-Z0-9]*"//g' freemap_slovakia.xml
sed -i 's/ bg-rect-over="[0-9]*"//g' freemap_slovakia.xml
sed -i 's/ bg-rect-rounded="[0-9]*"//g' freemap_slovakia.xml
