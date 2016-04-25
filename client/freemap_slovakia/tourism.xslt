<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="tourism_informations">
        <rule e="node" k="tourism" v="information">
            <rule e="node" k="information" v="guidepost" zoom-min="13">
                <rule e="node" k="bicycle" v="yes" zoom-min="13" zoom-max="13" style="cycle">
                    <caption dy="-8dp" k="name" font-style="bold" force-draw="1" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <symbol src="file:/symbols/guidepost_cycle.svg" force-draw="1" symbol-width="12dp"/>
                </rule>
                <rule e="node" k="bicycle" v="yes" zoom-min="14" style="cycle">
                    <caption dy="-11dp" k="name" font-style="bold" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <caption dy="18dp" k="ele" font-style="normal" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <symbol src="file:/symbols/guidepost_cycle.svg" force-draw="1" symbol-width="18dp"/>
                </rule>
                <rule e="node" k="bicycle" v="~" zoom-min="14" style="cycle">
                    <caption dy="-8dp" k="name" font-style="bold" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <caption dy="15dp" k="ele" font-style="normal" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <symbol src="file:/symbols/guidepost.svg" symbol-width="18dp"/>
                </rule>
                <rule e="node" k="hiking" v="yes" zoom-min="13" zoom-max="13" style="hiking">
                    <caption dy="-8dp" k="name" font-style="bold" force-draw="1" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <symbol src="file:/symbols/guidepost_hiking.svg" force-draw="1" symbol-width="12dp"/>
                </rule>
                <rule e="node" k="hiking" v="yes" zoom-min="14" style="hiking">
                    <caption dy="-11dp" k="name" font-style="bold" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <caption dy="18dp" k="ele" font-style="normal" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <symbol src="file:/symbols/guidepost_hiking.svg" force-draw="1" symbol-width="18dp"/>
                </rule>
                <rule e="node" k="hiking" v="~" zoom-min="14" style="hiking">
                    <caption dy="-8dp" k="name" font-style="bold" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <caption dy="15dp" k="ele" font-style="normal" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <symbol src="file:/symbols/guidepost.svg" symbol-width="18dp"/>
                </rule>
            </rule>
        </rule>
    </xsl:template>

    <xsl:template name="tourism_areas">
        <rule e="way" k="tourism" v="*">
            <rule e="way" k="tourism" v="attraction">
                <area fill="#F2CAEA"/>
            </rule>
            <rule e="way" k="tourism" v="zoo|picnic_site|caravan_site|camp_site">
                <area fill="#90c7f1a3" stroke="#6fc18e" stroke-width="0.2dp"/>
            </rule>
            <rule e="way" k="*" v="*" zoom-min="16">
                <caption k="name" font-style="bold" font-size="10dp" fill="#4040ff" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
        </rule>
    </xsl:template>

    <xsl:template name="tourism_nodes">
        <rule e="node" k="tourism" v="*">
            <rule e="node" k="tourism" v="camp_site" zoom-min="17">
                <symbol src="file:/symbols/campSite.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="tourism" v="hostel" zoom-min="17">
                <symbol src="file:/symbols/hostel.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="tourism" v="hotel" zoom-min="17">
                <symbol src="file:/symbols/hotel.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="tourism" v="information" zoom-min="17">
                <symbol src="file:/symbols/information.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="tourism" v="viewpoint" zoom-min="15">
                <symbol src="file:/symbols/viewpoint.png" symbol-width="12dp"/>
            </rule>
        </rule>
    </xsl:template>

</xsl:stylesheet>
