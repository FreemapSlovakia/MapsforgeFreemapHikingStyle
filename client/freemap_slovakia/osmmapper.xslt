<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="fixme_node">
        <rule cat="osmmapper" e="node" k="fixme" v="*">
            <symbol src="file:/symbols/fixme.svg" symbol-width="16"  force-draw="1" />
        </rule>
        <rule cat="osmmapper" e="way" k="highway" v="track">
           <rule e="way" k="tracktype" v="~">
              <line stroke="#FF0000" stroke-width="1.6dp" stroke-dasharray="1,4" stroke-linecap="butt" />
           </rule> 
        </rule>
    </xsl:template>


</xsl:stylesheet>
