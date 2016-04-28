<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="leisure_ways">
        <rule e="way" k="leisure" v="*">
            <rule e="way" k="leisure" v="park|garden|golf_course|common|green">
                <area fill="#C7F1A3" stroke="#6FC18E" stroke-width="0.2dp"/>
            </rule>
            <rule e="way" k="leisure" v="playground|playing_fields|pitch|dog_park">
                <area fill="#BDE3CB" stroke="#6FC18E" stroke-width="0.2dp"/>
                <rule e="way" k="*" v="playground" zoom-min="17">
                    <symbol src="file:/symbols/playground.png" symbol-width="12dp"/>
                </rule>
            </rule>
            <rule e="way" k="leisure" v="nature_reserve">
                <area src="file:/patterns/nature-reserve.png" stroke="#6fc18e" stroke-width="0.2dp"/>
            </rule>
            <rule e="way" k="leisure" v="stadium|sports_centre|water_park">
                <area fill="#BDE3CB" stroke="#6FC18E" stroke-width="0.2dp"/>
            </rule>
            <rule e="way" k="leisure" v="track">
                <rule e="way" k="area" v="yes|true">
                    <area fill="#bde3cb" stroke="#6fc18e" stroke-width="0.025dp"/>
                </rule>
                <rule e="way" k="area" v="~|no|false">
                    <line stroke="#6fc18e" stroke-width="0.75dp"/>
                    <line stroke="#bde3cb" stroke-width="0.7dp"/>
                </rule>
            </rule>
            <rule e="way" k="leisure" v="swimming_pool">
                <area fill="#b5d6f1" stroke="#6060ff" stroke-width="0.2dp"/>
            </rule>
            <rule e="way" k="*" v="*" zoom-min="16">
                <caption k="name" font-style="bold" font-size="10dp" fill="#4040ff" stroke="#ffffff" stroke-width="2dp"/>
            </rule>
        </rule>
    </xsl:template>

    <xsl:template name="leisure_nodes">
        <rule e="node" k="leisure" v="playground" zoom-min="17">
            <symbol src="file:/symbols/playground.png" symbol-width="12dp"/>
        </rule>
    </xsl:template>

</xsl:stylesheet>
