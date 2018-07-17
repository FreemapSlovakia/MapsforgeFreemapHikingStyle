<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="railways_no_tunnel">
        <rule e="way" k="railway" v="*">
            <rule e="way" k="tunnel" v="~|false|no">
                <rule e="way" k="railway" v="station">
                    <area fill="#9b9b79" stroke="#707070" stroke-width="0.3dp"/>
                </rule>
                <!-- railway bridge casings -->
                <rule e="way" k="bridge" v="yes|true" zoom-min="12">
                    <rule e="way" k="railway" v="tram">
                        <line stroke="#000000" stroke-width="0.4dp" stroke-linecap="butt"/>
                    </rule>
                    <rule e="way" k="railway" v="subway|light_rail|narrow_gauge|funicular">
                        <line stroke="#000000" stroke-width="0.6dp" stroke-linecap="butt"/>
                    </rule>
                    <rule e="way" k="railway" v="rail">
                        <line stroke="#000000" stroke-width="0.8dp" stroke-linecap="butt"/>
                    </rule>
                </rule>
                <!-- railway casings and cores -->
                <rule e="way" k="railway" v="tram" zoom-min="12">
                    <line stroke="#e6b7e6" stroke-width="0.25dp" stroke-linecap="butt"/>
                    <rule e="way" k="*" v="*" zoom-max="16">
                        <line stroke="#4c0f4c" stroke-width="0.25dp" stroke-dasharray="12,18" stroke-linecap="butt"/>
                    </rule>
                    <rule e="way" k="*" v="*" zoom-min="17">
                        <line stroke="#4c0f4c" stroke-width="0.25dp" stroke-dasharray="8,12" stroke-linecap="butt"/>
                    </rule>
                </rule>
                <rule e="way" k="railway" v="subway" zoom-min="12">
                    <line stroke="#0f0f4c" stroke-width="0.4dp" stroke-linecap="butt"/>
                    <line stroke="#b7b7e6" stroke-width="0.25dp" stroke-dasharray="12,18" stroke-linecap="butt"/>
                </rule>
                <rule e="way" k="railway" v="light_rail">
                    <line stroke="#0f4c0f" stroke-width="0.4dp" stroke-linecap="butt"/>
                    <line stroke="#b7e6e6" stroke-width="0.25dp" stroke-linecap="butt"/>
                    <line stroke="#0f4c0f" stroke-width="0.25dp" stroke-dasharray="12,18" stroke-linecap="butt"/>
                </rule>
                <rule e="way" k="railway" v="narrow_gauge|funicular" zoom-min="12">
                    <rule e="way" k="*" v="*" zoom-min="12" zoom-max="16">
                        <line stroke="#222222" stroke-width="0.6dp" stroke-linecap="butt"/>
                        <line stroke="#cccccc" stroke-width="0.5dp" stroke-linecap="butt"/>
                        <line stroke="#222222" stroke-width="0.5dp" stroke-dasharray="10,10" stroke-linecap="butt"/>
                    </rule>
                    <rule e="way" k="*" v="*" zoom-min="17">
                        <line stroke="#222222" stroke-width="0.45dp" stroke-linecap="butt"/>
                        <line stroke="#cccccc" stroke-width="0.3dp" stroke-linecap="butt"/>
                        <line stroke="#222222" stroke-width="0.3dp" stroke-dasharray="8,8" stroke-linecap="butt"/>
                    </rule>
                </rule>
                <rule e="way" k="railway" v="preserved" zoom-min="13">
                    <rule e="way" k="*" v="*" zoom-min="13" zoom-max="16">
                        <line stroke="#000000" stroke-width="0.6dp" stroke-linecap="butt"/>
                        <line stroke="#ffff99" stroke-width="0.4dp" stroke-linecap="butt"/>
                        <line stroke="#000000" stroke-width="0.4dp" stroke-dasharray="10,10" stroke-linecap="butt"/>
                    </rule>
                    <rule e="way" k="*" v="*" zoom-min="17">
                        <line stroke="#000000" stroke-width="0.45dp" stroke-linecap="butt"/>
                        <line stroke="#ffff99" stroke-width="0.3dp" stroke-linecap="butt"/>
                        <line stroke="#000000" stroke-width="0.3dp" stroke-dasharray="8,8" stroke-linecap="butt"/>
                    </rule>
                </rule>
                <rule e="way" k="railway" v="rail">
                    <rule e="way" k="service" v="~" zoom-max="16">
                        <line stroke="#000000" stroke-width="0.6dp" stroke-linecap="butt"/>
                        <line stroke="#f2f2f2" stroke-width="0.5dp" stroke-linecap="butt"/>
                        <line stroke="#000000" stroke-width="0.5dp" stroke-dasharray="12,12" stroke-linecap="butt"/>
                    </rule>
                    <rule e="way" k="service" v="~" zoom-min="17">
                        <line stroke="#000000" stroke-width="0.45dp" stroke-linecap="butt"/>
                        <line stroke="#f2f2f2" stroke-width="0.3dp" stroke-linecap="butt"/>
                        <line stroke="#000000" stroke-width="0.3dp" stroke-dasharray="10,10" stroke-linecap="butt"/>
                    </rule>
                    <rule e="way" k="service" v="*" zoom-min="16">
                        <line stroke="#000000" stroke-width="0.30dp" stroke-linecap="butt"/>
                        <line stroke="#f2f2f2" stroke-width="0.20dp" stroke-linecap="butt"/>
                        <line stroke="#000000" stroke-width="0.20dp" stroke-dasharray="4,5" stroke-linecap="butt"/>
                    </rule>
                </rule>
            </rule>
        </rule>
    </xsl:template>

    <xsl:template name="railway_tunnels">
        <rule e="way" k="railway" v="*">
            <rule e="way" k="railway" v="tram|subway|light_rail|narrow_gauge" zoom-min="12">
                <line stroke="#880f0f4c" stroke-width="0.25dp" stroke-dasharray="4,4" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="railway" v="rail">
                <line stroke="#aa333333" stroke-width="0.4dp" stroke-dasharray="4,4" stroke-linecap="butt"/>
            </rule>
        </rule>
    </xsl:template>

    <xsl:template name="railway_nodes">
        <rule e="node" k="railway" v="*">
            <rule e="node" k="railway" v="crossing" zoom-min="16">
                <symbol src="file:/symbols/railway-crossing-small.png"/>
            </rule>
            <rule e="node" k="railway" v="level_crossing" zoom-min="16">
                <symbol src="file:/symbols/railway-crossing.png" symbol-width="16dp"/>
                <rule e="node" k="*" v="*" zoom-min="18">
                    <caption k="ref" dy="10dp" font-style="bold" font-size="8dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
                </rule>
            </rule>
            <rule e="node" k="railway" v="station" zoom-min="14">
                <circle r="6" fill="#ec2d2d" stroke="#606060" stroke-width="1.5dp"/>
                <caption k="name" dy="-10dp" font-style="bold" font-size="10dp" fill="#ec2d2d" stroke="#ffffff" stroke-width="2dp"/>
            </rule>
            <rule e="node" k="railway" v="halt|tram_stop" zoom-min="16">
                <circle r="4" fill="#ec2d2d" stroke="#606060" stroke-width="1.5dp"/>
                <caption k="name" dy="-10dp" font-style="bold" font-size="10dp" fill="#ec2d2d" stroke="#ffffff" stroke-width="1.5dp"/>
            </rule>
        </rule>
    </xsl:template>

</xsl:stylesheet>
