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
            <cat id="hiking" />
            <cat id="hikingcycle" />
        </layer>
        <layer id="cycle" enabled="true" visible="false">
            <name lang="en" value="Cycle trails" />
            <name lang="sk" value="Cyklo značky" />
            <cat id="cycle" />
            <cat id="hikingcycle" />
        </layer>
        <layer id="topo" visible="true">
            <name lang="en" value="Topo" />
            <name lang="sk" value="Topo" />
            <cat id="topo" />
            <cat id="topo_common" />
            <overlay id="contours" />
            <overlay id="hiking" />
            <overlay id="cycle" />
        </layer>
        <layer id="default" visible="true">
            <name lang="en" value="Default" />
            <name lang="sk" value="Všeobecná" />
        </layer>
        <layer id="hiking_old" visible="true">
            <name lang="en" value="Hiking (old version)" />
            <name lang="sk" value="Turistika (stará verzia)" />
            <cat id="hiking_old" />
            <cat id="topo_common" />
            <overlay id="contours" />
        </layer>
        <layer id="cycle_old" visible="true">
            <name lang="en" value="Cycle (old version)" />
            <name lang="sk" value="Cyklo (stará verzia)" />
            <cat id="cycle_old" />
            <cat id="topo_common" />
            <overlay id="contours" />
        </layer>
        </stylemenu>
    </xsl:template>

</xsl:stylesheet>