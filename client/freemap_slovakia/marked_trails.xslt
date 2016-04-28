<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:variable name="yellow">#C0FFEE00</xsl:variable>
    <xsl:variable name="green">#C0009900</xsl:variable>
    <xsl:variable name="blue">#C03233FF</xsl:variable>
    <xsl:variable name="red">#C0FE0000</xsl:variable>
    <xsl:variable name="alternative">#C0FF00FF</xsl:variable>
    <xsl:variable name="fallback">#C0000000</xsl:variable>

    <xsl:variable name="offset1">2.0</xsl:variable>
    <xsl:variable name="offset2">3.5</xsl:variable>
    <xsl:variable name="offset3">5.0</xsl:variable>
    <xsl:variable name="offset4">6.5</xsl:variable>

    <xsl:variable name="markedTrailWidth">0.95dp</xsl:variable>
    <xsl:variable name="scaleDySize">14,1.45</xsl:variable>

    <xsl:template name="markedTrailsAll">
        <!-- turistika -->
        <rule e="way" k="highway" v="*" style="hiking" zoom-min="11">
            <!-- CZT -->
            <rule e="way" k="fmrelbicyclered|fmrelbicycleblue|fmrelbicyclegreen|fmrelbicycleyellow|fmrelbicyclewhite|fmrelbicycleblack|fmrelbicycledefault" v="*">
                <line stroke="{$alternative}" dy="{concat(-1 * $offset1, 'dp')}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
            </rule>

            <!-- TZT -->
            <xsl:call-template name="markedTrails">
                <xsl:with-param name="redKey" select="'fmrelhikingred'"/>
                <xsl:with-param name="blueKey" select="'fmrelhikingblue'"/>
                <xsl:with-param name="greenKey" select="'fmrelhikinggreen|fmreleducation'"/>
                <xsl:with-param name="yellowKey" select="'fmrelhikingyellow'"/>
                <xsl:with-param name="fallbackKey" select="'fmrelhikingwhite|fmrelhikingblack|fmrelhikingdefault'"/>
                <xsl:with-param name="side" select="1"/>
            </xsl:call-template>
        </rule>

        <!-- cyklistika -->
        <rule e="way" k="highway" v="*" style="cycle" zoom-min="11">
            <!-- TZT -->
            <rule e="way" k="fmrelhikingred|fmrelhikingblue|fmrelhikinggreen|fmrelhikingyellow|fmrelhikingwhite|fmrelhikingblack|fmrelhikingdefault|fmreleducation" v="*">
                <line stroke="{$alternative}" dy="{concat($offset1, 'dp')}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
            </rule>

            <!-- CZT -->
            <xsl:call-template name="markedTrails">
                <xsl:with-param name="redKey" select="'fmrelbicyclered'"/>
                <xsl:with-param name="blueKey" select="'fmrelbicycleblue'"/>
                <xsl:with-param name="greenKey" select="'fmrelbicyclegreen'"/>
                <xsl:with-param name="yellowKey" select="'fmrelbicycleyellow'"/>
                <xsl:with-param name="fallbackKey" select="'fmrelbicyclewhite|fmrelbicycleblack|fmrelbicycledefault'"/>
                <xsl:with-param name="side" select="-1"/>
            </xsl:call-template>
        </rule>
    </xsl:template>

    <xsl:template name="markedTrails">
        <xsl:param name="redKey" />
        <xsl:param name="blueKey" />
        <xsl:param name="greenKey" />
        <xsl:param name="yellowKey" />
        <xsl:param name="fallbackKey" />

        <xsl:param name="side" />

        <xsl:variable name="off1"><xsl:value-of select="concat($side * $offset1, 'dp')"/></xsl:variable>
        <xsl:variable name="off2"><xsl:value-of select="concat($side * $offset2, 'dp')"/></xsl:variable>
        <xsl:variable name="off3"><xsl:value-of select="concat($side * $offset3, 'dp')"/></xsl:variable>
        <xsl:variable name="off4"><xsl:value-of select="concat($side * $offset4, 'dp')"/></xsl:variable>

        <rule e="way" k="{$redKey}" v="*">
            <rule e="way" k="{$blueKey}" v="*">
                <rule e="way" k="{$greenKey}" v="*">
                    <rule e="way" k="{$yellowKey}" v="*">
                        <line stroke="{$red}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$blue}" dy="{$off2}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$green}" dy="{$off3}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$yellow}" dy="{$off4}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>

                    <rule e="way" k="{$yellowKey}" v="~">
                        <line stroke="{$red}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$blue}" dy="{$off2}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$green}" dy="{$off3}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>
                </rule>

                <rule e="way" k="{$greenKey}" v="~">
                    <rule e="way" k="{$yellowKey}" v="*">
                        <line stroke="{$red}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$blue}" dy="{$off2}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$yellow}" dy="{$off3}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>

                    <rule e="way" k="{$yellowKey}" v="~">
                        <line stroke="{$red}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$blue}" dy="{$off2}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>
                </rule>
            </rule>

            <rule e="way" k="{$blueKey}" v="~">
                <rule e="way" k="{$greenKey}" v="*">
                    <rule e="way" k="{$yellowKey}" v="*">
                        <line stroke="{$red}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$green}" dy="{$off2}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$yellow}" dy="{$off3}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>

                    <rule e="way" k="{$yellowKey}" v="~">
                        <line stroke="{$red}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$green}" dy="{$off2}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>
                </rule>

                <rule e="way" k="{$greenKey}" v="~">
                    <rule e="way" k="{$yellowKey}" v="*">
                        <line stroke="{$red}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$yellow}" dy="{$off2}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>

                    <rule e="way" k="{$yellowKey}" v="~">
                        <line stroke="{$red}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>
                </rule>
            </rule>
        </rule>

        <rule e="way" k="{$redKey}" v="~">
            <rule e="way" k="{$blueKey}" v="*">
                <rule e="way" k="{$greenKey}" v="*">
                    <rule e="way" k="{$yellowKey}" v="*">
                        <line stroke="{$blue}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$green}" dy="{$off2}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$yellow}" dy="{$off3}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>

                    <rule e="way" k="{$yellowKey}" v="~">
                        <line stroke="{$blue}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$green}" dy="{$off2}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>
                </rule>

                <rule e="way" k="{$greenKey}" v="~">
                    <rule e="way" k="{$yellowKey}" v="*">
                        <line stroke="{$blue}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$yellow}" dy="{$off2}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>

                    <rule e="way" k="{$yellowKey}" v="~">
                        <line stroke="{$blue}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>
                </rule>
            </rule>

            <rule e="way" k="{$blueKey}" v="~">
                <rule e="way" k="{$greenKey}" v="*">
                    <rule e="way" k="{$yellowKey}" v="*">
                        <line stroke="{$green}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        <line stroke="{$yellow}" dy="{$off2}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>

                    <rule e="way" k="{$yellowKey}" v="~">
                        <line stroke="{$green}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>
                </rule>

                <rule e="way" k="{$greenKey}" v="~">
                    <rule e="way" k="{$yellowKey}" v="*">
                        <line stroke="{$yellow}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                    </rule>

                    <rule e="way" k="{$yellowKey}" v="~">
                        <rule e="way" k="{$fallbackKey}" v="*">
                            <line stroke="{$fallback}" dy="{$off1}" scale-dy-size="{$scaleDySize}" stroke-width="{$markedTrailWidth}"/>
                        </rule>
                    </rule>
                </rule>
            </rule>
        </rule>

    </xsl:template>
</xsl:stylesheet>