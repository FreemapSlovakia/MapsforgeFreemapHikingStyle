<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="shops">
        <rule e="node" k="shop" v="*">
            <rule e="node" k="shop" v="bakery" zoom-min="17">
                <symbol src="file:/symbols/bakery.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="shop" v="florist" zoom-min="17">
                <symbol src="file:/symbols/florist.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="shop" v="supermarket|organic" zoom-min="17">
                <symbol src="file:/symbols/supermarket.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="*" v="*" zoom-min="17">
                <caption k="name" dy="12dp" font-style="bold" font-size="10dp" fill="#4040ff" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
        </rule>
        <rule e="way" k="shop" v="*" zoom-min="16">
            <caption k="name" dy="12dp" font-style="bold" font-size="10dp" fill="#4040ff" stroke="#ffffff" stroke-width="2.0dp"/>
        </rule>
    </xsl:template>

</xsl:stylesheet>
