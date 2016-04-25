<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="contour_labels">
        <rule e="way" k="contour_ext" v="*">
            <rule e="way" k="contour_ext" v="elevation_major" zoom-min="13">
                <pathText k="ele" font-size="8dp" font-style="bold" fill="#A86868" stroke="#FFFFFF" stroke-width="1dp" curve="cubic"/>
            </rule>
            <rule e="way" k="contour_ext" v="elevation_medium" zoom-min="14">
                <pathText k="ele" font-size="8dp" font-style="bold" fill="#A86868" stroke="#FFFFFF" stroke-width="1dp" curve="cubic"/>
            </rule>
            <rule e="way" k="contour_ext" v="elevation_minor" zoom-min="16">
                <pathText k="ele" font-size="5dp" font-style="bold" fill="#A86868" stroke="#FFFFFF" stroke-width="1dp" curve="cubic"/>
            </rule>
        </rule>
    </xsl:template>

    <xsl:template name="contour_lines">
        <rule e="way" k="contour_ext" v="elevation_major" zoom-min="13" zoom-max="15">
            <line stroke="#DDA86868" stroke-width="0.13dp" stroke-linecap="butt" curve="cubic"/>
        </rule>
        <rule e="way" k="contour_ext" v="elevation_major" zoom-min="16">
            <line stroke="#DDA86868" stroke-width="0.15dp" stroke-linecap="butt" curve="cubic"/>
        </rule>
        <rule e="way" k="contour_ext" v="elevation_medium" zoom-min="13" zoom-max="15">
            <line stroke="#DDC27878" stroke-width="0.13dp" stroke-linecap="butt" curve="cubic"/>
        </rule>
        <rule e="way" k="contour_ext" v="elevation_medium" zoom-min="16">
            <line stroke="#DDC27878" stroke-width="0.13dp" stroke-linecap="butt" curve="cubic"/>
        </rule>

        <rule e="way" k="contour_ext" v="elevation_minor" zoom-min="14" zoom-max="15">
            <line stroke="#DDDB8888" stroke-width="0.08dp" stroke-linecap="butt" curve="cubic"/>
        </rule>
        <rule e="way" k="contour_ext" v="elevation_minor" zoom-min="16">
            <line stroke="#DDDB8888" stroke-width="0.10dp" stroke-linecap="butt" curve="cubic"/>
        </rule>
    </xsl:template>

</xsl:stylesheet>
