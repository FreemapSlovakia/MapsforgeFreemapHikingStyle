<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="shops">
        <rule e="any" k="shop" v="*" zoom-min="17">
            <rule e="any" k="shop" v="bakery">
                <symbol src="file:/symbols/bakery.png" symbol-width="12dp"/>
            </rule>
            <rule e="any" k="shop" v="department_store|mall|convenience|supermarket|organic|greengrocer">
                <symbol src="file:/symbols/supermarket.png" symbol-width="12dp"/>
            </rule>
            <caption k="name" dy="16dp" font-style="bold" font-size="10dp" fill="#001AFF" stroke="#ffffff" stroke-width="2.0dp"/>
        </rule>
    </xsl:template>

</xsl:stylesheet>
