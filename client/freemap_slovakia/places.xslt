<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="places">
        <rule e="node" k="place" v="*">
            <rule e="node" k="place" v="city" zoom-max="14">
                <caption k="name" font-style="bold" font-size="16dp" fill="#000000" stroke="#ffffff" stroke-width="3dp"/>
            </rule>
            <rule e="node" k="place" v="town" zoom-min="8" zoom-max="10">
                <caption k="name" font-style="bold" font-size="9dp" fill="#000000" stroke="#ffffff" stroke-width="2dp"/>
            </rule>
            <rule e="node" k="place" v="town" zoom-min="11" zoom-max="15">
                <caption k="name" font-style="bold" font-size="14dp" fill="#000000" stroke="#ffffff" stroke-width="2dp"/>
            </rule>
            <rule e="node" k="place" v="suburb" zoom-min="14" zoom-max="16">
                <caption k="name" font-style="bold" font-size="12dp" fill="#6C6C6C" stroke="#ffffff" stroke-width="2dp"/>
            </rule>
            <rule e="node" k="place" v="village" zoom-min="12" zoom-max="12">
                <caption k="name" font-style="normal" font-size="7dp" fill="#000000" stroke="#ffffff" stroke-width="2dp"/>
            </rule>
            <rule e="node" k="place" v="village" zoom-min="13" zoom-max="18">
                <caption k="name" font-style="normal" font-size="12dp" fill="#000000" stroke="#ffffff" stroke-width="2dp"/>
            </rule>
            <rule e="node" k="place" v="hamlet" zoom-min="13" zoom-max="18">
                <caption k="name" font-style="normal" font-size="11dp" fill="#000000" stroke="#ffffff" stroke-width="1dp"/>
            </rule>
            <rule e="node" k="place" v="locality" zoom-min="15" zoom-max="16">
                <caption k="name" font-style="bold" font-size="7dp" fill="#A0666666" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="place" v="locality" zoom-min="17">
                <caption k="name" font-style="bold" font-size="10dp" fill="#A0666666" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="place" v="island" zoom-min="10">
                <caption k="name" font-style="bold" font-size="20dp" fill="#000000" stroke="#ffffff" stroke-width="3.0dp"/>
            </rule>
            <rule e="node" k="place" v="country" zoom-max="6">
                <caption k="name" font-style="bold" font-size="35dp" fill="#000000" stroke="#ffffff" stroke-width="4.0dp"/>
            </rule>
        </rule>
    </xsl:template>

</xsl:stylesheet>
