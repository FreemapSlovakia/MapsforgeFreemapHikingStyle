<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="menu">
        <stylemenu id="fmskmenu" defaultvalue="topo" defaultlang="sk">
        <layer id="contours" enabled="true" visible="false">
            <name lang="en" value="Contours" />
            <name lang="sk" value="Vrstevnice" />
            <cat id="contours" />
        </layer>
        <layer id="hiking" enabled="true" visible="false">
            <name lang="en" value="Hiking trails" />
            <name lang="sk" value="Turistické značky" />
            <cat id="hiking2" />
        </layer>
        <layer id="cycle" enabled="true" visible="false">
            <name lang="en" value="Cycle trails" />
            <name lang="sk" value="Cyklo značky" />
            <cat id="cycle2" />
        </layer>
        <layer id="default" visible="true">
            <name lang="en" value="Default" />
            <name lang="sk" value="Všeobecná" />
        </layer>
        <layer id="topo" visible="true">
            <name lang="en" value="Topo" />
            <name lang="sk" value="Topo" />
            <cat id="topo" />
            <overlay id="contours" />
            <overlay id="hiking2" />
            <overlay id="cycle2" />
        </layer>
        <layer id="hiking_old" visible="true">
            <name lang="en" value="Hiking" />
            <name lang="sk" value="Turistika" />
            <cat id="hiking" />
            <overlay id="contours" />
        </layer>
        <layer id="cycle_old" visible="true">
            <name lang="en" value="Cycle" />
            <name lang="sk" value="Cyklo" />
            <cat id="cycle" />
            <overlay id="contours" />
        </layer>
        </stylemenu>
    </xsl:template>

</xsl:stylesheet>