<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="tourism_informations">
        <rule cat="topo_common" e="node" k="tourism" v="information">
            <rule e="node" k="information" v="guidepost" zoom-min="13">
                <rule cat="cycle_old" e="node" k="bicycle" v="yes" zoom-min="13" zoom-max="13">
                    <caption dy="-8dp" k="name" font-style="bold" force-draw="1" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <symbol src="file:/symbols/guidepost_cycle.svg" force-draw="1" symbol-width="12dp"/>
                </rule>
                <rule cat="cycle_old" e="node" k="bicycle" v="yes" zoom-min="14">
                    <caption dy="-11dp" k="name" font-style="bold" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <caption dy="18dp" k="ele" font-style="normal" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <symbol src="file:/symbols/guidepost_cycle.svg" force-draw="1" symbol-width="18dp"/>
                </rule>
                <rule cat="cycle_old" e="node" k="bicycle" v="~" zoom-min="14">
                    <caption dy="-8dp" k="name" font-style="bold" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <caption dy="15dp" k="ele" font-style="normal" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <symbol src="file:/symbols/guidepost.svg" symbol-width="18dp"/>
                </rule>
                <rule cat="hiking_old" e="node" k="hiking" v="yes" zoom-min="13" zoom-max="13">
                    <caption dy="-8dp" k="name" font-style="bold" force-draw="1" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <symbol src="file:/symbols/guidepost_hiking.svg" force-draw="1" symbol-width="12dp"/>
                </rule>
                <rule cat="hiking_old" e="node" k="hiking" v="yes" zoom-min="14">
                    <caption dy="-11dp" k="name" font-style="bold" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <caption dy="18dp" k="ele" font-style="normal" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <symbol src="file:/symbols/guidepost_hiking.svg" force-draw="1" symbol-width="18dp"/>
                </rule>
                <rule cat="hiking_old" e="node" k="hiking" v="~" zoom-min="14">
                    <caption dy="-8dp" k="name" font-style="bold" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <caption dy="15dp" k="ele" font-style="normal" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <symbol src="file:/symbols/guidepost.svg" symbol-width="18dp"/>
                </rule>

                <rule cat="hiking" e="node" k="hiking" v="yes" zoom-min="13" zoom-max="13">
                  <rule e="node" k="bicycle" v="~">
                    <caption dy="-8dp" k="name" font-style="bold" force-draw="1" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <symbol src="file:/symbols/guidepost_hiking.svg" force-draw="1" symbol-width="12dp"/>
                  </rule>
                </rule>
                <rule cat="hiking" e="node" k="hiking" v="yes" zoom-min="14">
                  <rule e="node" k="bicycle" v="~">
                    <caption dy="-11dp" k="name" font-style="bold" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <caption dy="18dp" k="ele" font-style="normal" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <symbol src="file:/symbols/guidepost_hiking.svg" force-draw="1" symbol-width="18dp"/>
                  </rule>
                </rule>

                <rule cat="cycle" e="node" k="bicycle" v="yes" zoom-min="13" zoom-max="13">
                  <rule e="node" k="hiking" v="~">
                    <caption dy="-8dp" k="name" font-style="bold" force-draw="1" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <symbol src="file:/symbols/guidepost_cycle.svg" force-draw="1" symbol-width="12dp"/>
                  </rule>
                </rule>
                <rule cat="cycle" e="node" k="bicycle" v="yes" zoom-min="14">
                  <rule e="node" k="hiking" v="~">
                    <caption dy="-11dp" k="name" font-style="bold" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <caption dy="18dp" k="ele" font-style="normal" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <symbol src="file:/symbols/guidepost_cycle.svg" force-draw="1" symbol-width="18dp"/>
                  </rule>
                </rule>

                <rule cat="hikingcycle" e="node" k="bicycle" v="yes" zoom-min="13" zoom-max="13">
                  <rule e="node" k="hiking" v="yes">
                    <caption dy="-8dp" k="name" font-style="bold" force-draw="1" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                    <symbol src="file:/symbols/guidepost_hikingcycle.svg" force-draw="1" symbol-width="12dp"/>
                  </rule>
                </rule>
                <rule cat="hikingcycle" e="node" k="bicycle" v="yes" zoom-min="14">
                  <rule e="node" k="hiking" v="yes">
                    <caption dy="-11dp" k="name" font-style="bold" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <caption dy="18dp" k="ele" font-style="normal" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                    <symbol src="file:/symbols/guidepost_hikingcycle.svg" force-draw="1" symbol-width="18dp"/>
                  </rule>
                </rule>

                <rule cat="hikingcycle" e="node" k="hiking|bicycle" v="~" zoom-min="14">
                  <caption dy="-8dp" k="name" font-style="bold" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                  <caption dy="15dp" k="ele" font-style="normal" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                  <symbol src="file:/symbols/guidepost.svg" symbol-width="18dp"/>
                </rule>

                <rule cat="ski" e="node" k="ski" v="yes" zoom-min="13" zoom-max="13">
                  <caption dy="-8dp" k="name" font-style="bold" force-draw="1" font-size="8dp" fill="#000000" stroke="#90ffffff" stroke-width="2dp"/>
                  <symbol src="file:/symbols/guidepost_ski.svg" force-draw="1" symbol-width="12dp"/>
                </rule>
                <rule cat="ski" e="node" k="ski" v="yes" zoom-min="14">
                  <caption dy="-11dp" k="name" font-style="bold" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                  <caption dy="18dp" k="ele" font-style="normal" force-draw="1" font-size="10dp" fill="#000000" stroke="#90ffffff" stroke-width="3dp"/>
                  <symbol src="file:/symbols/guidepost_ski.svg" force-draw="1" symbol-width="18dp"/>
                </rule>

                    </rule>
                </rule>

    </xsl:template>

    <xsl:template name="tourism_areas">
        <rule e="way" k="tourism" v="*">
            <rule e="way" k="tourism" v="attraction">
                <area fill="#F2CAEA"/>
                <symbol src="file:/symbols/attraction.svg" symbol-width="18dp"/>
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
            <rule  cat="topo_common" e="node" k="amenity" v="feeding_place|game_feeding" zoom-min="15">
                <symbol src="file:/symbols/feeding_place.svg" symbol-width="18dp"/>
            </rule>
            <rule e="node" k="tourism" v="attraction">
                <symbol src="file:/symbols/attraction.svg" symbol-width="18dp"/>
            </rule>
        </rule>
    </xsl:template>

</xsl:stylesheet>
