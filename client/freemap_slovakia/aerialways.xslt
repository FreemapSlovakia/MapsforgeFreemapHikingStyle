<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="aerialways">
        <rule e="way" k="aerialway" v="*">
            <line stroke="#202020" stroke-width="0.4dp" stroke-linecap="butt"/>
            <line stroke="#202020" stroke-width="4.0dp" stroke-dasharray="2,200" stroke-linecap="butt"/>
            <rule e="way" k="aerialway" v="cable_car">
                <lineSymbol src="file:/symbols/cable_car.png"/>
            </rule>
            <rule e="way" k="aerialway" v="chair_lift">
                <lineSymbol src="file:/symbols/chair_lift_2.png"/>
            </rule>
            <rule e="way" k="aerialway" v="gondola">
                <lineSymbol src="file:/symbols/gondola.png"/>
            </rule>
            <rule e="way" k="*" v="*" zoom-min="14">
                <pathText k="name" font-style="bold" font-size="10dp" fill="#606060" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
        </rule>
    </xsl:template>

</xsl:stylesheet>
