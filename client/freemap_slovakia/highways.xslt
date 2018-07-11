<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="highways_no_tunnel">
        <!-- no tunnel -->
        <rule e="way" k="tunnel" v="~|no|false">
            <!-- no area -->
            <rule e="way" k="area" v="~|no|false">
                <!-- highway -->
                <rule e="way" k="highway" v="*">
                    <!-- no bridge -->
                    <rule e="way" k="bridge" v="~|no|false">
                        <!-- highway casings -->
                        <rule e="way" k="highway" v="steps" zoom-min="14">
                            <line stroke="#707070" stroke-width="0.5dp"/>
                        </rule>
                        <rule e="way" k="highway" v="footway|path" zoom-min="13">
                            <line stroke="#c2b5a3" stroke-width="0.4dp"/>
                        </rule>
                        <rule e="way" k="highway" v="track" zoom-min="13">
                            <line stroke="#c2b5a3" stroke-width="0.7dp"/>
                        </rule>
                        <rule e="way" k="highway" v="bridleway|service" zoom-min="12">
                            <line stroke="#707070" stroke-width="0.7dp"/>
                        </rule>
                        <rule e="way" k="highway" v="byway" zoom-min="12">
                            <line stroke="#707070" stroke-width="1.5dp" stroke-dasharray="7,2" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="pedestrian|unclassified|residential|living_street" zoom-min="12">
                            <line stroke="#707070" stroke-width="0.9dp"/>
                        </rule>
                        <rule e="way" k="highway" v="tertiary|secondary_link|secondary" zoom-min="10">
                            <line stroke="#707070" stroke-width="1.1dp" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="primary_link|primary">
                            <line stroke="#707070" stroke-width="1.2dp" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="trunk_link">
                            <line stroke="#7fc97f" stroke-width="0.8dp" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="trunk">
                            <line stroke="#7fc97f" stroke-width="1.8dp" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="motorway_link">
                            <line stroke="#ff0000" stroke-width="0.8dp" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="motorway">
                            <line stroke="#ff0000" stroke-width="2dp" stroke-linecap="butt"/>
                        </rule>
                        <rule cat="cycle" e="way" k="highway" v="cycleway" zoom-min="13">
                            <line stroke="#006F00" stroke-width="0.45dp"/>
                        </rule>
                    </rule>
                    <!-- bridge -->
                    <rule e="way" k="bridge" v="yes|true" zoom-min="15">
                        <!-- highway casings -->
                        <rule e="way" k="highway" v="steps|footway|path">
                            <line stroke="#000000" stroke-width="0.6dp" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="track|bridleway|service">
                            <line stroke="#000000" stroke-width="0.5dp" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="construction">
                            <line stroke="#000000" stroke-width="0.6dp" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="road">
                            <line stroke="#000000" stroke-width="0.6dp" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="pedestrian|unclassified|residential|living_street|byway">
                            <line stroke="#000000" stroke-width="1.2dp" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="secondary|secondary_link|tertiary">
                            <line stroke="#000000" stroke-width="1.3dp" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="primary|primary_link">
                            <line stroke="#000000" stroke-width="1.4dp" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="trunk_link|motorway_link">
                            <line stroke="#000000" stroke-width="1.2dp" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="trunk|motorway">
                            <line stroke="#000000" stroke-width="2.2dp" stroke-linecap="butt"/>
                        </rule>
                        <rule cat="cycle" e="way" k="highway" v="cycleway" zoom-min="13">
                            <line stroke="#000000" stroke-width="0.6dp" stroke-linecap="butt"/>
                        </rule>
                    </rule>
                </rule>
            </rule>
        </rule>
    </xsl:template>

    <xsl:template name="highway_tunnels">
        <rule e="way" k="highway" v="*">
            <!-- highway tunnel casings -->
            <rule e="way" k="highway" v="steps|footway|path">
                <line stroke="#707070" stroke-width="0.6dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="track|bridleway|service" zoom-min="12">
                <line stroke="#707070" stroke-width="1.0dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="construction">
                <line stroke="#707070" stroke-width="1.1dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="road">
                <line stroke="#707070" stroke-width="1.3dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="pedestrian|unclassified|residential|living_street|byway">
                <line stroke="#707070" stroke-width="1.5dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="tertiary|secondary_link|primary_link|trunk_link|motorway_link|secondary|primary|trunk">
                <line stroke="#707070" stroke-width="1.8dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="motorway">
                <line stroke="#707070" stroke-width="2.0dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="cycleway" zoom-min="13">
                <line stroke="#707070" stroke-width="0.8dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <!-- highway tunnel cores -->
            <rule e="way" k="highway" v="steps|footway|path">
                <line stroke="#ffffff" stroke-width="0.45dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="track">
                <line stroke="#ffffff" stroke-width="0.7dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="bridleway|service" zoom-min="12">
                <line stroke="#ffffff" stroke-width="0.85dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule cat="cycle" e="way" k="highway" v="cycleway" zoom-min="13">
                <line stroke="#ffffff" stroke-width="0.85dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="construction">
                <line stroke="#ffffff" stroke-width="1.0dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="road">
                <line stroke="#ffffff" stroke-width="1.25dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="pedestrian|unclassified|residential|living_street|byway">
                <line stroke="#ffffff" stroke-width="1.35dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="tertiary|secondary_link|primary_link|trunk_link|motorway_link|secondary|primary|trunk">
                <line stroke="#ffffff" stroke-width="1.5dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="highway" v="motorway">
                <line stroke="#ffffff" stroke-width="1.7dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
            </rule>
        </rule>
    </xsl:template>

    <xsl:template name="highway_areas">
        <rule e="way" k="area" v="yes|true">
            <rule e="way" k="highway" v="*">
                <rule e="way" k="highway" v="footway|footpath" zoom-min="12">
                    <area fill="#e5e0c2" stroke="#707070" stroke-width="0.15dp"/>
                </rule>
                <rule e="way" k="highway" v="pedestrian" zoom-min="11">
                    <area fill="#e5e0c2" stroke="#707070" stroke-width="0.15dp"/>
                </rule>
                <rule e="way" k="highway" v="path" zoom-min="12">
                    <area fill="#d0d0d0" stroke="#d0d0d0" stroke-width="0.45dp"/>
                </rule>
                <rule e="way" k="highway" v="service" zoom-min="12">
                    <area fill="#ffffff" stroke="#707070" stroke-width="0.15dp"/>
                </rule>
                <rule e="way" k="highway" v="unclassified" zoom-min="11">
                    <area fill="#ffffff" stroke="#707070" stroke-width="0.3dp"/>
                </rule>
                <rule e="way" k="highway" v="residential" zoom-min="11">
                    <area fill="#ffffff" stroke="#707070" stroke-width="0.15dp"/>
                </rule>
                <rule e="way" k="highway" v="road" zoom-min="11">
                    <area fill="#d0d0d0"/>
                </rule>
                <rule e="way" k="highway" v="living_street" zoom-min="11">
                    <area fill="#ffffff" stroke="#ffffff" stroke-width="0.15dp"/>
                </rule>
            </rule>
        </rule>
    </xsl:template>

    <xsl:template name="highway_cores">
        <rule e="way" k="highway" v="*">
            <!-- no tunnel -->
            <rule e="way" k="tunnel" v="~|no|false">
                <!-- no area -->
                <rule e="way" k="area" v="~|no|false">
                    <!-- highway cores -->
                    <rule e="way" k="highway" v="steps" zoom-min="14">
                        <line stroke="#e5e0c2" stroke-width="0.25dp" stroke-dasharray="3,1" stroke-linecap="butt"/>
                        <rule e="way" k="*" v="*" zoom-min="15">
                            <pathText k="name" font-style="bold" font-size="10dp" stroke="#e5e0c2" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="footway" zoom-min="13">
                        <line stroke="#e5e0c2" stroke-width="0.15dp"/>
                        <rule e="way" k="*" v="*" zoom-min="15">
                            <pathText k="name" font-style="bold" font-size="10dp" stroke="#e5e0c2" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="path" zoom-min="13">
                        <line stroke="#6A5B47" stroke-width="0.4dp" stroke-dasharray="3,3" stroke-linecap="butt"/>
                        <rule e="way" k="*" v="*" zoom-min="15">
                            <pathText k="name" font-style="bold" font-size="10dp" stroke="#d0d0d0" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="track" zoom-min="11">
                        <rule e="way" k="tracktype" v="grade1">
                            <line stroke="#6A5B47" stroke-width="0.5dp"/>
                            <rule e="way" k="*" v="*" zoom-min="15">
                                <pathText k="name" font-style="bold" font-size="10dp" stroke="#fffaf2" stroke-width="2.0dp"/>
                            </rule>
                        </rule>
                        <rule e="way" k="tracktype" v="grade2">
                            <line stroke="#6A5B47" stroke-width="0.5dp" stroke-dasharray="18,4" stroke-linecap="butt"/>
                            <rule e="way" k="*" v="*" zoom-min="15">
                                <pathText k="name" font-style="bold" font-size="10dp" stroke="#fff2de" stroke-width="2.0dp"/>
                            </rule>
                        </rule>
                        <rule e="way" k="tracktype" v="grade3">
                            <line stroke="#6A5B47" stroke-width="0.5dp" stroke-dasharray="12,8" stroke-linecap="butt"/>
                            <rule e="way" k="*" v="*" zoom-min="15">
                                <pathText k="name" font-style="bold" font-size="10dp" stroke="#fff2de" stroke-width="2.0dp"/>
                            </rule>
                        </rule>
                        <rule e="way" k="tracktype" v="grade4">
                            <line stroke="#6A5B47" stroke-width="0.5dp" stroke-dasharray="8,12" stroke-linecap="butt"/>
                            <rule e="way" k="*" v="*" zoom-min="15">
                                <pathText k="name" font-style="bold" font-size="10dp" stroke="#fff2de" stroke-width="2.0dp"/>
                            </rule>
                        </rule>
                        <rule e="way" k="tracktype" v="grade5">
                            <line stroke="#6A5B47" stroke-width="0.5dp" stroke-dasharray="4,16" stroke-linecap="butt"/>
                            <rule e="way" k="*" v="*" zoom-min="15">
                                <pathText k="name" font-style="bold" font-size="10dp" stroke="#fff2de" stroke-width="2.0dp"/>
                            </rule>
                        </rule>
                        <rule e="way" k="tracktype" v="~|no|false">
                            <line stroke="#6A5B47" stroke-width="0.5dp" stroke-dasharray="18,4,8,12" stroke-linecap="butt"/>
                            <rule e="way" k="*" v="*" zoom-min="15">
                                <pathText k="name" font-style="bold" font-size="10dp" stroke="#fff2de" stroke-width="2.0dp"/>
                            </rule>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="bridleway" zoom-min="11">
                        <line stroke="#d3cb98" stroke-width="0.85dp"/>
                        <rule e="way" k="*" v="*" zoom-min="15">
                            <pathText k="name" font-style="bold" font-size="10dp" stroke="#d3cb98" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="service" zoom-min="12">
                        <line stroke="#F0F0F0" stroke-width="0.45dp"/>
                        <rule e="way" k="*" v="*" zoom-min="15">
                            <pathText k="name" font-style="bold" font-size="10dp" stroke="#ffffff" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="construction">
                        <line stroke="#d0d0d0" stroke-width="1.0dp"/>
                        <rule e="way" k="*" v="*" zoom-min="15">
                            <pathText k="name" font-style="bold" font-size="10dp" stroke="#d0d0d0" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="road" zoom-min="11">
                        <line stroke="#d0d0d0" stroke-width="1.25dp"/>
                        <rule e="way" k="*" v="*" zoom-min="15">
                            <pathText k="name" font-style="bold" font-size="10dp" stroke="#d0d0d0" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="pedestrian" zoom-min="11">
                        <line stroke="#e5e0c2" stroke-width="0.7dp"/>
                        <rule e="way" k="*" v="*" zoom-min="15">
                            <pathText k="name" font-style="bold" font-size="11dp" stroke="#e5e0c2" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="unclassified|residential|living_street" zoom-min="11">
                        <line stroke="#F8F8F8" stroke-width="0.75dp"/>
                        <rule e="way" k="*" v="*" zoom-min="15">
                            <pathText k="name" font-style="bold" font-size="10dp" stroke="#ffffff" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="byway" zoom-min="11">
                        <line stroke="#efadaa" stroke-width="1.35dp"/>
                        <rule e="way" k="*" v="*" zoom-min="15">
                            <pathText k="name" font-style="bold" font-size="10dp" stroke="#efadaa" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="tertiary" zoom-min="9">
                        <line stroke="#FEF9B9" stroke-width="0.9dp"/>
                        <rule e="way" k="*" v="*" zoom-min="15">
                            <caption k="ref" font-style="bold" font-size="6dp" fill="#000000" stroke="#ffff90" stroke-width="1dp" bg-rect-fill="#AAffff90" bg-rect-over="2dp"/>
                            <pathText k="name" font-style="bold" font-size="10dp" stroke="#ffff90" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="secondary_link">
                        <line stroke="#FDBF6F" stroke-width="0.9dp"/>
                        <rule e="way" k="*" v="*" zoom-min="14">
                            <pathText k="name" font-style="bold" font-size="10dp" stroke="#fdbf6f" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="secondary">
                        <line stroke="#FDBF6F" stroke-width="0.9dp"/>
                        <rule e="way" k="*" v="*" zoom-min="14">
                            <caption k="ref" font-style="bold" scale-font-size="17,1.1" font-size="6dp" stroke="#fdbf6f" stroke-width="1dp" bg-rect-fill="#AAfdbf6f" bg-rect-over="2dp"/>
                            <pathText k="name" font-style="bold" font-size="11dp" stroke="#fdbf6f" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="primary_link">
                        <line stroke="#FF9988" stroke-width="1dp"/>
                        <rule e="way" k="*" v="*" zoom-min="14">
                            <pathText k="name" font-style="bold" font-size="10dp" stroke="#e46d71" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="primary">
                        <line stroke="#FF9988" stroke-width="1dp"/>
                        <rule e="way" k="*" v="*" zoom-min="14">
                            <caption k="ref" font-style="bold" scale-font-size="17,1.1" font-size="6dp" fill="#ffffff" bg-rect-fill="#AAe46d71" bg-rect-over="2dp"/>
                            <pathText k="name" font-style="bold" font-size="11dp" stroke="#ffffff" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="trunk_link">
                        <line stroke="#FFFF00" stroke-width="1.5dp"/>
                        <rule e="way" k="*" v="*" zoom-min="14">
                            <pathText k="name" font-style="bold" font-size="11dp" stroke="#7fc97f" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="trunk">
                        <line stroke="#FFFF00" stroke-width="1.5dp"/>
                        <rule e="way" k="*" v="*" zoom-min="11">
                            <caption k="ref" font-style="bold" scale-font-size="17,1.2" font-size="7dp" fill="#FFFFFF" stroke="#000000" stroke-width="0.6dp" bg-rect-fill="#7fc97f" bg-rect-over="3" bg-rect-rounded="2"/>
                        </rule>
                        <rule e="way" k="*" v="*" zoom-min="14">
                            <pathText k="name" font-style="bold" font-size="11dp" stroke="#7fc97f" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="motorway_link">
                        <line stroke="#FFFF00" stroke-width="1.5dp"/>
                        <rule e="way" k="*" v="*" zoom-min="14">
                            <pathText k="name" font-style="bold" font-size="11dp" stroke="#809bc0" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="motorway">
                        <line stroke="#FFFF00" stroke-width="1.6dp"/>
                        <rule e="way" k="*" v="*" zoom-min="11">
                            <caption k="ref" font-style="bold" scale-font-size="17,1.2" font-size="7dp" fill="#FFFFFF" stroke="#000000" stroke-width="0.6dp" bg-rect-fill="#809bc0" bg-rect-over="3" bg-rect-rounded="2"/>
                        </rule>
                        <rule e="way" k="*" v="*" zoom-min="14">
                            <pathText k="name" font-style="bold" font-size="11dp" stroke="#809bc0" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule cat="cycle" e="way" k="highway" v="cycleway" zoom-min="13">
                        <line stroke="#d1fad1" stroke-width="0.2dp"/>
                        <rule e="way" k="*" v="*" zoom-min="15">
                            <pathText k="name" font-style="bold" font-size="10dp" stroke="#d1fad1" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="highway" v="*" zoom-min="15">
                        <rule e="way" k="access" v="destination">
                            <line src="file:/patterns/access-destination.png" stroke-width="1.5dp"/>
                        </rule>
                        <rule e="way" k="access" v="private|no">
                            <line src="file:/patterns/access-private.png" stroke-width="1.5dp"/>
                        </rule>
                    </rule>
                </rule>
            </rule>
        </rule>
    </xsl:template>


</xsl:stylesheet>
