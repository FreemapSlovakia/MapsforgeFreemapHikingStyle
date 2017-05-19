<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="waterways">
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
            <rule e="way" k="waterway" v="ditch" zoom-min="13">
                <line stroke="#8DB0DD" stroke-width="0.1dp"/>
                <rule e="way" k="*" v="*" zoom-min="16">
                    <lineSymbol src="file:/symbols/waterflow.svg" align-center="true" repeat="true" symbol-width="7dp" repeat-gap="50dp"/>
                </rule>
            </rule>
            <rule e="way" k="waterway" v="drain" zoom-min="13">
                <line stroke="#8DB0DD" stroke-width="0.8dp"/>
                <rule e="way" k="*" v="*" zoom-min="16">
                    <lineSymbol src="file:/symbols/waterflow.svg" align-center="true" repeat="true" symbol-width="7dp" repeat-gap="40dp"/>
                </rule>
            </rule>
            <rule e="way" k="waterway" v="canal" zoom-min="13">
                <pathText k="name" font-style="bold_italic" font-size="9dp" fill="#0000fc" stroke="#ffffff" stroke-width="2.5dp"/>
                <line stroke="#8DB0DD" stroke-width="0.8dp" />
                <rule e="way" k="*" v="*" zoom-min="15" zoom-max="17">
                    <lineSymbol src="file:/symbols/waterflow.svg" align-center="true" repeat="true" symbol-width="9dp" repeat-gap="30dp"/>
                </rule>
                <rule e="way" k="*" v="*" zoom-min="18">
                    <lineSymbol src="file:/symbols/waterflow.svg" align-center="true" repeat="true" symbol-width="9dp" repeat-gap="50dp"/>
                </rule>
            </rule>
            <rule e="way" k="waterway" v="stream" zoom-min="14">
                <pathText k="name" font-style="bold_italic" font-size="8dp" fill="#0000fc" stroke="#ffffff" stroke-width="2dp"/>
                <rule e="way" k="tunnel" v="yes|culvert">
                    <line stroke="#8DB0DD" stroke-dasharray="4,8" stroke-width="0.3dp"/>
                </rule>
                <rule e="way" k="tunnel" v="~|no">
                    <line stroke="#8DB0DD" stroke-width="0.3dp"/>
                </rule>
                <rule e="way" k="*" v="*" zoom-min="15" zoom-max="17">
                    <lineSymbol src="file:/symbols/waterflow.svg" align-center="true" repeat="true" symbol-width="8dp" repeat-gap="30dp"/>
                </rule>
                <rule e="way" k="*" v="*" zoom-min="18">
                    <lineSymbol src="file:/symbols/waterflow.svg" align-center="true" repeat="true" symbol-width="9dp" repeat-gap="50dp"/>
                </rule>
            </rule>
            <rule e="way" k="waterway" v="river">
                <pathText k="name" font-style="bold_italic" font-size="9dp" fill="#0000fc" stroke="#ffffff" stroke-width="2.6dp"/>
                <rule e="way" k="tunnel" v="yes|culvert">
                    <line stroke="#8DB0DD" stroke-dasharray="5,12" stroke-width="1.0dp"/>
                </rule>
                <rule e="way" k="tunnel" v="~|no">
                    <line stroke="#8DB0DD" stroke-width="1.5dp"/>
                </rule>
                <rule e="way" k="*" v="*" zoom-min="13" zoom-max="17">
                    <lineSymbol src="file:/symbols/waterflow.svg" align-center="true" repeat="true" symbol-width="7dp" scale-icon-size="16,1.1" repeat-gap="30dp"/>
                </rule>
                <rule e="way" k="*" v="*" zoom-min="18">
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
    </xsl:template>

</xsl:stylesheet>
