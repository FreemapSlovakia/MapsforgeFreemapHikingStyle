<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="landuses">

        <!-- landuse -->
        <rule e="way" k="natural|landuse" v="forest|wood"  zoom-min="10">
            <rule e="way" k="wood|forest" v="*">
                <rule e="way" k="wood|forest" v="coniferous">
                    <area fill="#B6D9BE"/>
                </rule>
                <rule e="way" k="wood|forest" v="deciduous">
                    <area fill="#D1E5C0"/>
                </rule>
                <rule e="way" k="wood|forest" v="mixed">
                    <area fill="#BFDEBA"/>
                </rule>
            </rule>
            <rule e="way" k="wood" v="~">
                <area fill="#C7DBBB"/>
            </rule>
            <rule e="way" k="*" v="*" zoom-min="16">
                <caption k="name" font-style="bold" font-size="10dp" fill="#40ff40" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
        </rule>
        <rule e="way" k="landuse" v="*">
            <rule e="way" k="landuse" v="farmyard">
                <area fill="#80DFCFBC"/>
            </rule>
            <rule e="way" k="landuse" v="residential">
                <area fill="#80E5E1DC"/>
            </rule>
            <rule e="way" k="landuse" v="retail">
                <area fill="#FFEBEB"/>
            </rule>
            <rule e="way" k="landuse" v="industrial">
                <area fill="#80C0C0C0"/>
            </rule>
            <rule e="way" k="landuse" v="railway">
                <area fill="#C0C0C0"/>
            </rule>
            <rule e="way" k="landuse" v="brownfield">
                <area fill="#80B5988B"/>
            </rule>
            <rule e="way" k="landuse" v="commercial">
                <area fill="#80FCFFC9"/>
            </rule>
            <rule e="way" k="landuse" v="greenfield">
                <area fill="#C4E3B1"/>
            </rule>
            <rule e="way" k="landuse" v="construction">
                <area fill="#80d0d0d0"/>
            </rule>
            <rule e="way" k="landuse" v="garages">
                <area fill="#d6d6e4"/>
            </rule>
            <rule e="way" k="landuse" v="landfill|quarry">
                <area fill="#A0e1e1e1"/>
                <area src="file:/patterns/quarry.png"/>
            </rule>
            <rule e="way" k="landuse" v="cemetery">
                <area fill="#E9F6EE" stroke="#C0C0C0" stroke-width="0.2dp"/>
                <area src="file:/patterns/cemetery.png"/>
            </rule>
            <rule e="way" k="landuse" v="field|farm|farmland">
                <area fill="#A0FAFAF0"/>
            </rule>
            <rule e="way" k="landuse" v="village_green|meadow|grass|recreation_ground|grassland">
                <area fill="#A0E7FAD7"/>
            </rule>
            <rule e="way" k="landuse" v="allotments">
                <area fill="#FAF1D7"/>
            </rule>
            <rule e="way" k="landuse" v="reservoir|basin">
                <area fill="#b5d6f1"/>
            </rule>
            <rule e="way" k="*" v="*" zoom-min="16">
                <caption k="name" font-style="bold" font-size="10dp" fill="#808080" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
        </rule>
        <rule e="way" k="landuse" v="military">
            <area src="file:/patterns/military.png"/>
        </rule>

    </xsl:template>

</xsl:stylesheet>
