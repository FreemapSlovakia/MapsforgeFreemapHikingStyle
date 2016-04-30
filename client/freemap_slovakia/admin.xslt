<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="admin_major">
        <rule e="way" k="admin_level" v="*">
            <rule e="way" k="admin_level" v="2">
                <line stroke="#70EDC2EC" stroke-width="8dp" stroke-linecap="butt"/>
            </rule>
            <rule e="way" k="admin_level" v="4|5|6">
                <line stroke="#70EDC2EC" stroke-width="5dp" stroke-linecap="butt"/>
            </rule>
        </rule>
    </xsl:template>

    <xsl:template name="admin">
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
    </xsl:template>

</xsl:stylesheet>
