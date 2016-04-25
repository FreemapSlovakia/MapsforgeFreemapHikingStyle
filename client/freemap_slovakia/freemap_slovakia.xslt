<?xml-stylesheet type="text/xsl" href="freemap_slovakia.xslt"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:include href="marked_trails.xslt" />
    <xsl:include href="contours.xslt" />
    <xsl:include href="places.xslt" />
    <xsl:include href="amenities.xslt" />
    <xsl:include href="landuses.xslt" />
    <xsl:include href="naturals.xslt" />
    <xsl:include href="tourism.xslt" />
    <xsl:include href="shops.xslt" />
    <xsl:include href="railways.xslt" />

    <xsl:template match="/">

        <rendertheme version="4" map-background="#FBFBF9" map-background-outside="#dddddd">
            <!-- ways -->
            <rule e="way" k="*" v="*">

                <!-- landuse -->
                <xsl:call-template name="landuses"/>

                <!-- amenity -->
                <xsl:call-template name="amenity_ways"/>

                <!-- natural -->
                <xsl:call-template name="natural_ways"/>

                <!-- leisure -->
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

                <rule e="way" k="admin_level" v="*">
                    <rule e="way" k="admin_level" v="2">
                        <line stroke="#70EDC2EC" stroke-width="8dp" stroke-linecap="butt"/>
                    </rule>
                    <rule e="way" k="admin_level" v="4|5|6">
                        <line stroke="#70EDC2EC" stroke-width="5dp" stroke-linecap="butt"/>
                    </rule>
                </rule>

                <xsl:call-template name="contour_lines"/>

                <!-- tunnel -->
                <rule e="way" k="tunnel" v="true|yes" zoom-min="12">
                    <!-- highway tunnels -->
                    <rule e="way" k="highway" v="*">
                        <!-- highway tunnel casings -->
                        <rule e="way" k="highway" v="steps|footway|path">
                            <line stroke="#707070" stroke-width="0.6dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="track|cycleway|bridleway|service" zoom-min="12">
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
                        <!-- highway tunnel cores -->
                        <rule e="way" k="highway" v="steps|footway|path">
                            <line stroke="#ffffff" stroke-width="0.45dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="track">
                            <line stroke="#ffffff" stroke-width="0.7dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
                        </rule>
                        <rule e="way" k="highway" v="cycleway|bridleway|service" zoom-min="12">
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

                    <!-- railway tunnel -->
                    <xsl:call-template name="railway_tunnels"/>
                </rule>
                <!-- waterways -->
                <rule e="way" k="waterway" v="*">
                    <!-- waterway casings -->
                    <rule e="way" k="waterway" v="drain" zoom-min="13">
                        <rule e="way" k="tunnel" v="yes|culvert">
                            <line stroke="#647FC5" stroke-dasharray="5,5" stroke-width="1.0dp"/>
                        </rule>
                        <rule e="way" k="tunnel" v="~|no">
                            <line stroke="#647FC5" stroke-width="1.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="waterway" v="canal" zoom-min="13">
                        <line stroke="#647FC5" stroke-width="1.0dp"/>
                    </rule>
                    <!-- waterway cores -->
                    <rule e="way" k="waterway" v="ditch">
                        <line stroke="#8DB0DD" stroke-width="0.1dp" zoom-min="13"/>
                        <rule e="way" k="*" v="*" zoom-min="16">
                            <lineSymbol src="file:/symbols/waterflow.svg" align-center="true" repeat="true" symbol-width="7dp" repeat-gap="50dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="waterway" v="drain">
                        <line stroke="#8DB0DD" stroke-width="0.8dp" zoom-min="13"/>
                        <rule e="way" k="*" v="*" zoom-min="16">
                            <lineSymbol src="file:/symbols/waterflow.svg" align-center="true" repeat="true" symbol-width="7dp" repeat-gap="50dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="waterway" v="canal">
                        <line stroke="#8DB0DD" stroke-width="0.8dp" zoom-min="13"/>
                        <rule e="way" k="*" v="*" zoom-min="16">
                            <lineSymbol src="file:/symbols/waterflow.svg" align-center="true" repeat="true" symbol-width="7dp" repeat-gap="50dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="waterway" v="stream" zoom-min="14">
                        <pathText k="name" font-style="bold_italic" font-size="8dp" fill="#8DB0DD" stroke="#ffffff" stroke-width="2dp"/>
                        <rule e="way" k="tunnel" v="yes|culvert">
                            <line stroke="#8DB0DD" stroke-dasharray="5,15" stroke-width="0.3dp"/>
                        </rule>
                        <rule e="way" k="tunnel" v="~|no">
                            <line stroke="#8DB0DD" stroke-width="0.3dp"/>
                        </rule>
                        <rule e="way" k="*" v="*" zoom-min="15">
                            <lineSymbol src="file:/symbols/waterflow.svg" align-center="true" repeat="true" symbol-width="7dp" repeat-gap="50dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="waterway" v="river">
                        <pathText k="name" font-style="bold_italic" font-size="9dp" fill="#8DB0DD" stroke="#ffffff" stroke-width="2.6dp"/>
                        <rule e="way" k="tunnel" v="yes|culvert">
                            <line stroke="#8DB0DD" stroke-dasharray="5,15" stroke-width="1.0dp"/>
                        </rule>
                        <rule e="way" k="tunnel" v="~|no">
                            <line stroke="#8DB0DD" stroke-width="1.5dp"/>
                        </rule>
                        <rule e="way" k="*" v="*" zoom-min="13">
                            <lineSymbol src="file:/symbols/waterflow.svg" align-center="true" repeat="true" symbol-width="7dp" scale-icon-size="16,1.1" repeat-gap="50dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="waterway" v="dock">
                        <area fill="#b5d6f1"/>
                    </rule>
                    <rule e="way" k="waterway" v="riverbank">
                        <area fill="#8DB0DD"/>
                    </rule>
                    <rule e="way" k="waterway" v="weir">
                        <line stroke="#000044" stroke-width="0.375dp"/>
                    </rule>
                    <rule e="way" k="waterway" v="dam">
                        <line stroke="#000000" stroke-width="0.5dp"/>
                    </rule>
                    <rule e="way" k="lock" v="yes|true">
                        <line stroke="#000000" stroke-width="2.0dp" stroke-linecap="butt"/>
                        <line stroke="#f8f8f8" stroke-width="1.5dp" stroke-linecap="butt"/>
                    </rule>
                </rule>
                <!-- military -->
                <rule e="way" k="military" v="*">
                    <area src="file:/patterns/military.png" stroke="#e4e4e4" stroke-width="0.2dp"/>
                </rule>
                <!-- historic -->
                <rule e="any" k="historic" v="ruins" zoom-min="16">
                    <symbol src="file:/symbols/ruins.png" symbol-width="16dp"/>
                    <caption dy="12dp" k="name" font-style="bold" font-size="10dp" fill="#000000" stroke="#ffffff" stroke-width="2dp"/>
                </rule>
                <rule e="any" k="ruins" v="yes" zoom-min="16">
                    <symbol src="file:/symbols/ruins.png" symbol-width="16dp"/>
                    <caption dy="12dp" k="name" font-style="bold" font-size="10dp" fill="#000000" stroke="#ffffff" stroke-width="2dp"/>
                </rule>
                <rule e="any" k="historic" v="castle" zoom-min="15">
                    <rule e="any" k="ruins" v="~" zoom-min="15">
                        <caption k="name" dy="12dp" font-style="bold" font-family="serif" font-size="10dp" fill="#760000" stroke="#ffffff" stroke-width="2dp"/>
                    </rule>
                </rule>
                <!-- sport -->
                <rule e="way" k="sport" v="*">
                    <rule e="way" k="sport" v="soccer" zoom-min="17">
                        <symbol src="file:/symbols/soccer-borderless.png"/>
                    </rule>
                    <rule e="way" k="sport" v="swimming|canoe|diving|scuba_diving">
                        <area fill="#b5d6f1" stroke="#6060ff" stroke-width="0.2dp"/>
                    </rule>
                    <rule e="way" k="sport" v="tennis">
                        <area fill="#d18a6a" stroke="#b36c4c" stroke-width="0.2dp"/>
                        <rule e="way" k="*" v="*" zoom-min="17">
                            <symbol src="file:/symbols/tennis.png"/>
                        </rule>
                    </rule>
                </rule>
                <!-- tourism areas -->
                <xsl:call-template name="tourism_areas"/>

                <rule e="way" k="natural" v="water">
                    <area fill="#8DB0DD"/>
                    <rule e="way" k="*" v="*" zoom-min="13">
                        <caption k="name" font-style="bold_italic" font-size="8dp" fill="#4040ff" stroke="#ffffff" stroke-width="2dp"/>
                    </rule>
                </rule>

                <!-- highway area -->
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
                <!-- platform cores -->
                <rule e="way" k="highway|railway|public_transport" v="platform">
                    <rule e="way" k="*" v="*" closed="yes">
                        <area fill="#9b9b79"/>
                    </rule>
                    <rule e="way" k="*" v="*" closed="no">
                        <line stroke="#9b9b79" stroke-width="0.3dp"/>
                    </rule>
                </rule>
                <!-- runways casings and areas -->
                <rule e="way" k="aeroway" v="*" zoom-min="11">
                    <rule e="way" k="aeroway" v="aerodrome" closed="yes">
                        <area fill="#d8dcce" stroke="#000000" stroke-width="0.5dp"/>
                    </rule>
                    <rule e="way" k="aeroway" v="apron">
                        <area fill="#f0f0f0"/>
                    </rule>
                    <rule e="way" k="aeroway" v="terminal">
                        <area fill="#f3d6b6" stroke="#6a5a8e" stroke-width="0.2dp"/>
                    </rule>
                    <rule e="way" k="aeroway" v="runway">
                        <line stroke="#000000" stroke-width="7dp" stroke-linecap="square"/>
                    </rule>
                    <rule e="way" k="aeroway" v="taxiway">
                        <line stroke="#000000" stroke-width="3dp" stroke-linecap="butt"/>
                    </rule>
                    <rule e="way" k="*" v="*" zoom-min="16">
                        <caption k="name" font-style="bold" font-size="9dp" fill="#4040ff" stroke="#ffffff" stroke-width="2.0dp"/>
                    </rule>
                </rule>
            </rule>
            <!-- turning circles -->
            <rule e="node" k="highway" v="turning_circle">
                <circle r="1.5" scale-radius="true" fill="#707070"/>
            </rule>
            <!-- ways -->
            <rule e="way" k="*" v="*">
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
                                    <line stroke="#707070" stroke-width="0.6dp"/>
                                </rule>
                                <rule e="way" k="highway" v="footway|path" zoom-min="13">
                                    <line stroke="#c2b5a3" stroke-width="0.4dp"/>
                                </rule>
                                <rule e="way" k="highway" v="track" zoom-min="13">
                                    <line stroke="#c2b5a3" stroke-width="0.7dp"/>
                                </rule>
                                <rule e="way" k="highway" v="cycleway|bridleway|service" zoom-min="12">
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

                            </rule>
                            <!-- bridge -->
                            <rule e="way" k="bridge" v="yes|true" zoom-min="15">
                                <!-- highway casings -->
                                <rule e="way" k="highway" v="steps|footway|path">
                                    <line stroke="#000000" stroke-width="0.5dp" stroke-linecap="butt"/>
                                </rule>
                                <rule e="way" k="highway" v="track|cycleway|bridleway|service">
                                    <line stroke="#000000" stroke-width="0.6dp" stroke-linecap="butt"/>
                                </rule>
                                <rule e="way" k="highway" v="construction">
                                    <line stroke="#000000" stroke-width="0.6dp" stroke-linecap="butt"/>
                                </rule>
                                <rule e="way" k="highway" v="road">
                                    <line stroke="#000000" stroke-width="0.6dp" stroke-linecap="butt"/>
                                </rule>
                                <rule e="way" k="highway" v="pedestrian|unclassified|residential|living_street|byway">
                                    <line stroke="#000000" stroke-width="0.7dp" stroke-linecap="butt"/>
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
                            </rule>
                        </rule>
                    </rule>
                </rule>
                <!-- building -->
                <rule e="way" k="building" v="*" zoom-min="14">
                    <area fill="#CBCBCB" stroke="#8F8F8F" stroke-width="0.2dp"/>
                </rule>
                <rule e="way" k="highway" v="*">
                    <!-- no tunnel -->
                    <rule e="way" k="tunnel" v="~|no|false">
                        <!-- no area -->
                        <rule e="way" k="area" v="~|no|false">
                            <!-- highway cores -->
                            <rule e="way" k="highway" v="steps" zoom-min="14">
                                <line stroke="#e5e0c2" stroke-width="0.45dp" stroke-dasharray="3,1" stroke-linecap="butt"/>
                                <rule e="way" k="*" v="*" zoom-min="15">
                                    <pathText k="name" font-style="bold" font-size="10dp" stroke="#e5e0c2" stroke-width="2.0dp"/>
                                </rule>
                            </rule>
                            <rule e="way" k="highway" v="footway" zoom-min="13">
                                <line stroke="#e5e0c2" stroke-width="0.4dp"/>
                                <rule e="way" k="*" v="*" zoom-min="15">
                                    <pathText k="name" font-style="bold" font-size="10dp" stroke="#e5e0c2" stroke-width="2.0dp"/>
                                </rule>
                            </rule>
                            <rule e="way" k="highway" v="path" zoom-min="13">
                                <line stroke="#6A5B47" stroke-width="0.3dp" stroke-dasharray="5,5" stroke-linecap="butt"/>
                                <rule e="way" k="*" v="*" zoom-min
                                    ="15">
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
                            <rule e="way" k="highway" v="cycleway" zoom-min="11">
                                <line stroke="#d1fad1" stroke-width="0.85dp"/>
                                <rule e="way" k="*" v="*" zoom-min="15">
                                    <pathText k="name" font-style="bold" font-size="10dp" stroke="#d1fad1" stroke-width="2.0dp"/>
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
                                <line stroke="#e5e0c2" stroke-width="1.35dp"/>
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
                                    <caption k="ref" font-style="bold" font-size="6dp" fill="#000000" stroke="#ffff90" stroke-width="1dp" bg-rect-fill="#ffff90" bg-rect-over="2dp"/>
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
                                    <caption k="ref" font-style="bold" scale-font-size="17,1.1" font-size="6dp" stroke="#fdbf6f" stroke-width="1dp" bg-rect-fill="#fdbf6f" bg-rect-over="2dp"/>
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
                                    <caption k="ref" font-style="bold" scale-font-size="17,1.1" font-size="6dp" fill="#ffffff" bg-rect-fill="#e46d71" bg-rect-over="2dp"/>
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
                                    <caption k="ref" font-style="bold" scale-font-size="17,1.2" font-size="7dp" fill="#FFFFFF" stroke="#000000" stroke-width="1dp" bg-rect-fill="#7fc97f" bg-rect-over="3" bg-rect-rounded="2"/>
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
                                    <caption k="ref" font-style="bold" scale-font-size="17,1.2" font-size="7dp" fill="#FFFFFF" stroke="#000000" stroke-width="1dp" bg-rect-fill="#809bc0" bg-rect-over="3" bg-rect-rounded="2"/>
                                </rule>
                                <rule e="way" k="*" v="*" zoom-min="14">
                                    <pathText k="name" font-style="bold" font-size="11dp" stroke="#809bc0" stroke-width="2.0dp"/>
                                </rule>
                            </rule>
                            <rule e="way" k="highway" v="*" zoom-min="16">
                                <rule e="way" k="access" v="destination">
                                    <line src="file:/patterns/access-destination.png" stroke-width="1.5dp"/>
                                </rule>
                                <rule e="way" k="access" v="private">
                                    <line src="file:/patterns/access-private.png" stroke-width="1.5dp"/>
                                </rule>
                            </rule>
                        </rule>
                    </rule>
                </rule>
                <!-- runways cores -->
                <rule e="way" k="aeroway" v="*" zoom-min="11">
                    <rule e="way" k="aeroway" v="runway">
                        <line stroke="#d4dcbd" stroke-width="5dp" stroke-linecap="square"/>
                    </rule>
                    <rule e="way" k="aeroway" v="taxiway">
                        <line stroke="#d4dcbd" stroke-width="2dp" stroke-linecap="butt"/>
                    </rule>
                </rule>
                <!-- man_made features -->
                <rule e="way" k="man_made" v="pier">
                    <rule e="way" k="*" v="*" closed="no">
                        <line stroke="#d0d0d0" stroke-width="0.4dp" stroke-linecap="butt"/>
                        <line stroke="#e4e4e4" stroke-width="0.3dp" stroke-linecap="butt"/>
                    </rule>
                    <rule e="way" k="*" v="*" closed="yes">
                        <area fill="#e4e4e4" stroke="#d0d0d0" stroke-width="0.05dp"/>
                    </rule>
                </rule>
                <!-- barriers -->
                <rule e="way" k="barrier" v="*">
                    <rule e="way" k="barrier" v="fence|wall|city_wall">
                        <line stroke="#000000" stroke-width="0.1dp" stroke-linecap="butt"/>
                        <lineSymbol src="file:/symbols/fence.svg" align-center="true" repeat="true" symbol-width="8dp" repeat-gap="8dp" scale-icon-size="14,1.1"/>
                    </rule>
                    <rule e="way" k="barrier" v="retaining_wall">
                        <line stroke="#888888" stroke-width="0.1dp" stroke-linecap="butt"/>
                    </rule>
                </rule>
                <!-- non-physical routes -->
                <rule e="way" k="route" v="ferry">
                    <line stroke="#707070" stroke-width="0.3dp" stroke-dasharray="15,10" stroke-linecap="butt"/>
                </rule>
                <!-- highway one-way markers -->
                <rule e="way" k="area" v="~|false|no">
                    <rule e="way" k="highway" v="*">
                        <rule e="way" k="oneway" v="yes|true" zoom-min="16">
                            <lineSymbol src="file:/symbols/oneway.svg" align-center="true" repeat="true" symbol-width="16dp"/>
                        </rule>
                        <rule e="way" k="junction" v="roundabout" zoom-min="16">
                            <lineSymbol src="file:/symbols/oneway.svg" align-center="true" repeat="true" symbol-width="16dp" repeat-gap="16dp"/>
                        </rule>
                    </rule>
                </rule>
                <!-- pistes -->
                <rule e="way" k="piste:type" v="*" zoom-min="11">
                    <!-- piste areas -->
                    <rule e="way" k="piste:type" v="downhill" closed="yes">
                        <rule e="way" k="piste:difficulty" v="novice">
                            <area fill="#5540ff40" stroke="#5540ff40" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="piste:difficulty" v="easy">
                            <area fill="#554040ff" stroke="#554040ff" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="piste:difficulty" v="intermediate">
                            <area fill="#55ff4040" stroke="#55ff4040" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="piste:difficulty" v="advanced">
                            <area fill="#55000000" stroke="#55000000" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="piste:difficulty" v="expert">
                            <area fill="#55f6800a" stroke="#55f6800a" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="piste:difficulty" v="freeride">
                            <area fill="#55f6dd0a" stroke="#55f6dd0a" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="piste:difficulty" v="~">
                            <area fill="#55505050" stroke="#55505050" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="*" v="*" zoom-min="16">
                            <caption k="name" font-style="bold" font-size="10dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <!-- piste ways -->
                    <rule e="way" k="piste:type" v="downhill" closed="no">
                        <rule e="way" k="piste:difficulty" v="novice">
                            <line stroke="#5540ff40" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="piste:difficulty" v="easy">
                            <line stroke="#554040ff" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="piste:difficulty" v="intermediate">
                            <line stroke="#55ff4040" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="piste:difficulty" v="advanced">
                            <line stroke="#55000000" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="piste:difficulty" v="expert">
                            <line stroke="#55f6800a" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="piste:difficulty" v="freeride">
                            <line stroke="#55f6dd0a" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="piste:difficulty" v="~">
                            <line stroke="#55505050" stroke-width="5.0dp"/>
                        </rule>
                        <rule e="way" k="*" v="*" zoom-min="14">
                            <pathText k="name" font-style="bold" font-size="10dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="piste:type" v="sled">
                        <line stroke="#cdabde" stroke-width="2.5dp"/>
                    </rule>
                    <rule e="way" k="piste:type" v="nordic">
                        <line stroke="#c00000" stroke-width="1.0dp" stroke-dasharray="30,5" stroke-linecap="butt"/>
                    </rule>
                </rule>
                <!-- aerial ways -->
                <rule e="way" k="aerialway" v="*">
                    <line stroke="#202020" stroke-width="0.4dp" stroke-linecap="butt"/>
                    <line stroke="#202020" stroke-width="4.0dp" stroke-dasharray="2,200" stroke-linecap="butt"/>
                    <rule e="way" k="aerialway" v="cable_car">
                        <lineSymbol src="file:/symbols/cable_car.png"/>
                    </rule>
                    <rule e="way" k="aerialway" v="chair_lift">
                        <lineSymbol src="file:/symbols/chair_lift_2.png"/>
                    </rule>
                    <rule e="way" k="aerialway" v="gondola">
                        <lineSymbol src="file:/symbols/gondola.png"/>
                    </rule>
                    <rule e="way" k="*" v="*" zoom-min="14">
                        <pathText k="name" font-style="bold" font-size="10dp" fill="#606060" stroke="#ffffff" stroke-width="2.0dp"/>
                    </rule>
                </rule>
                <!-- railway (no tunnel) -->
                <xsl:call-template name="railways_no_tunnel"/>

                <!-- non-physical boundaries -->
                <rule e="way" k="boundary" v="protected_area">
                    <rule e="way" k="protect_class" v="2|5">
                        <line stroke="#404ef94b" stroke-width="2.4dp" stroke-dasharray="15,5,5,5"/>
                        <rule e="way" k="*" v="*" zoom-min="14">
                            <pathText k="name" font-style="bold" font-size="15dp" fill="#12D51C" stroke="#ffffff" stroke-width="4.0dp"/>
                        </rule>
                    </rule>
                    <rule e="way" k="protect_class" v="1|3|4">
                        <line stroke="#404ef94b" stroke-width="1.8dp" stroke-dasharray="10,5,10,5"/>
                        <rule e="way" k="*" v="*" zoom-min="14">
                            <pathText k="name" font-style="bold" font-size="15dp" fill="#12D51C" stroke="#ffffff" stroke-width="4.0dp"/>
                        </rule>
                    </rule>
                </rule>
                <rule e="way" k="admin_level" v="*">
                    <rule e="way" k="admin_level" v="11">
                        <line stroke="#9A3996" stroke-width="0.1dp" stroke-dasharray="1,5"/>
                    </rule>
                    <rule e="way" k="admin_level" v="10">
                        <line stroke="#9A3996" stroke-width="0.1dp" stroke-dasharray="5,25"/>
                    </rule>
                    <rule e="way" k="admin_level" v="9">
                        <line stroke="#9A3996" stroke-width="0.1dp" stroke-dasharray="15,15"/>
                    </rule>
                    <rule e="way" k="admin_level" v="8">
                        <line stroke="#9A3996" stroke-width="0.1dp" stroke-dasharray="15, 5, 5, 5"/>
                    </rule>
                    <rule e="way" k="admin_level" v="7">
                        <line stroke="#9A3996" stroke-width="0.1dp"/>
                    </rule>
                    <rule e="way" k="admin_level" v="6">
                        <line stroke="#9A3996" stroke-width="0.25dp" stroke-dasharray="5, 5"/>
                    </rule>
                    <rule e="way" k="admin_level" v="5">
                        <line stroke="#9A3996" stroke-width="0.25dp" stroke-dasharray="15, 15"/>
                    </rule>
                    <rule e="way" k="admin_level" v="4">
                        <line stroke="#9A3996" stroke-width="0.25dp" stroke-dasharray="15, 5, 5, 5"/>
                    </rule>
                    <rule e="way" k="admin_level" v="3">
                        <line stroke="#9A3996" stroke-width="0.25dp"/>
                    </rule>
                    <rule e="way" k="admin_level" v="2">
                        <line stroke="#9A3996" stroke-width="0.25dp" stroke-dasharray="15, 15"/>
                    </rule>
                    <rule e="way" k="admin_level" v="1">
                        <line stroke="#9A3996" stroke-width="0.25dp" stroke-dasharray="15, 5, 5, 5"/>
                    </rule>
                </rule>
            </rule>

            <rule e="way" k="addr:housenumber" v="*" zoom-min="18">
                <caption k="addr:housenumber" font-style="bold" font-size="8dp" fill="#606060" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <!-- nodes -->
            <rule e="node" k="*" v="*">
                <xsl:call-template name="tourism_informations"/>

                <!-- aeroway -->
                <rule e="node" k="aeroway" v="*">
                    <rule e="node" k="aeroway" v="helipad" zoom-min="17">
                        <symbol src="file:/symbols/helipad.png"/>
                    </rule>
                    <rule e="node" k="aeroway" v="aerodrome|airport" zoom-max="13">
                        <symbol src="file:/symbols/airport.png"/>
                    </rule>
                </rule>

                <!-- amenity -->
                <xsl:call-template name="amenity_nodes"/>

                <!-- barrier -->
                <rule e="node" k="barrier" v="bollard">
                    <circle r="1.5" fill="#707070"/>
                </rule>
                <!-- highway -->
                <rule e="node" k="highway" v="*">
                    <rule e="node" k="highway" v="bus_stop" zoom-min="16">
                        <symbol src="file:/symbols/bus.png" symbol-width="12dp"/>
                    </rule>
                    <rule e="node" k="highway" v="traffic_signals" zoom-min="17">
                        <symbol src="file:/symbols/traffic_signal.png" symbol-width="6dp"/>
                    </rule>
                    <rule e="node" k="highway" v="turning_circle">
                        <circle r="1.4" scale-radius="true" fill="#ffffff"/>
                    </rule>
                </rule>
                <!-- historic -->
                <rule e="node" k="historic" v="*">
                    <circle r="3" fill="#4040ff" stroke="#606060" stroke-width="1.5dp"/>
                    <rule e="node" k="*" v="*" zoom-min="17">
                        <caption k="name" dy="-10dp" font-style="bold" font-size="10dp" fill="#4040ff" stroke="#ffffff" stroke-width="2.0dp"/>
                    </rule>
                </rule>
                <!-- house numbers -->
                <rule e="node" k="addr:housenumber" v="*" zoom-min="18">
                    <caption k="addr:housenumber" font-style="bold" font-size="8dp" fill="#606060" stroke="#ffffff" stroke-width="2.0dp"/>
                </rule>
                <!-- leisure -->
                <rule e="node" k="leisure" v="playground" zoom-min="17">
                    <symbol src="file:/symbols/playground.png" symbol-width="12dp"/>
                </rule>
                <!-- man_made -->
                <rule e="node" k="man_made" v="windmill" zoom-min="17">
                    <symbol src="file:/symbols/windmill.png"/>
                </rule>
                <rule e="node" k="man_made" v="adit" zoom-min="14">
                    <rule e="node" k="disused" v="yes" zoom-min="14">
                        <symbol src="file:/symbols/adit2.svg" symbol-width="16dp"/>
                        <rule e="node" k="*" v="*" zoom-min="16">
                            <caption k="name" dy="15dp" font-style="bold" font-size="10dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                    <rule e="node" k="disused" v="~|no" zoom-min="14">
                        <symbol src="file:/symbols/adit.svg" symbol-width="16dp"/>
                        <rule e="node" k="*" v="*" zoom-min="16">
                            <caption k="name" dy="15dp" font-style="bold" font-size="10dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
                        </rule>
                    </rule>
                </rule>
                <rule e="node" k="man_made" v="mineshaft" zoom-min="14">
                    <symbol src="file:/symbols/mine.png" symbol-width="12dp"/>
                    <rule e="node" k="*" v="*" zoom-min="16">
                        <caption k="name" dy="15dp" font-style="bold" font-size="10dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
                    </rule>
                </rule>
                <!-- natural -->
                <xsl:call-template name="natural_nodes"/>

                <!-- place -->
                <xsl:call-template name="places"/>

                <!-- railway -->
                <xsl:call-template name="railway_nodes"/>

                <!-- shop -->
                <xsl:call-template name="shops"/>

                <!-- tourism -->
                <xsl:call-template name="tourism_nodes"/>
            </rule>
            <rule e="way" k="power" v="*">
                <rule e="way" k="power" v="line" zoom-min="13">
                    <line stroke="#80000000" stroke-width="0.2dp"/>
                    <lineSymbol src="file:/symbols/way_powerline.svg" align-center="true" repeat="true" symbol-width="16dp" repeat-gap="35dp"/>
                </rule>
                <!--
        <rule e="way" k="power" v="minor_line" zoom-min="17">
        <line stroke="#80000000" stroke-width="0.4dp" />
      </rule>
    -->
            </rule>

            <xsl:call-template name="contour_labels"/>

            <xsl:call-template name="markedTrailsAll"/>

        </rendertheme>
    </xsl:template>

</xsl:stylesheet>
