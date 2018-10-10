<?xml-stylesheet type="text/xsl"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://mapsforge.org/renderTheme" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template name="amenity_ways">
        <rule e="way" k="amenity" v="*">
            <rule e="way" k="amenity" v="kindergarten|school|college|university" zoom-min="15">
                <area fill="#DFAFDD" stroke="#e9dd72" stroke-width="0.2dp"/>
                <rule e="way" k="*" v="*" zoom-min="17">
                   <caption k="name" font-style="normal" font-size="9dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
                </rule>
            </rule>
            <rule e="way" k="amenity" v="grave_yard">
                <area src="file:/patterns/cemetery.png" stroke="#e4e4e4" stroke-width="0.2dp"/>
            </rule>
            <rule e="way" k="amenity" v="parking">
                <area fill="#F7EFB7" stroke="#E9DD72" stroke-width="0.2dp"/>
                <rule e="way" k="access" v="private" zoom-min="15">
                    <area src="file:/patterns/access-private.png"/>
                </rule>
                <rule e="way" k="*" v="*" zoom-min="17">
                    <symbol src="file:/symbols/parking.svg" symbol-width="12dp"/>
                </rule>
            </rule>
            <rule e="way" k="amenity" v="fountain" closed="yes" zoom-min="16">
                <area fill="#b5d6f1" stroke="#000080" stroke-width="0.15dp"/>
                <rule e="way" k="*" v="*" zoom-min="17">
                    <symbol src="file:/symbols/fountain.png" symbol-width="12dp"/>
                    <caption k="name" dy="18dp" font-style="bold_italic" font-size="8dp" fill="#4040ff" stroke="#ffffff" stroke-width="2dp"/>
                </rule>
            </rule>
            <rule e="way" k="amenity" v="hospital" zoom-min="15">
                <symbol src="file:/symbols/hospital.svg" symbol-width="12dp"/>
                <caption k="name" dy="18dp" font-style="bold" font-size="9dp" fill="#0066FF" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="way" k="amenity" v="clinic" zoom-min="15">
                <symbol src="file:/symbols/clinic.svg" symbol-width="12dp"/>
                <caption k="name" dy="18dp" font-style="bold" font-size="9dp" fill="#0066FF" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="way" k="amenity" v="theatre" zoom-min="17">
                <symbol src="file:/symbols/theatre.png" symbol-width="12dp"/>
            </rule>
            <rule e="way" k="amenity" v="toilets" zoom-min="17">
                <symbol src="file:/symbols/toilets.png" symbol-width="12dp"/>
            </rule>
            <rule e="way" k="amenity" v="place_of_worship" zoom-min="17">
                <rule e="way" k="denomination|religion" v="jewish">
                    <symbol src="file:/symbols/synagogue.png" symbol-width="12dp"/>
                </rule>
                <rule e="way" k="denomination|religion" v="muslim|moslem">
                    <symbol src="file:/symbols/mosque.png" symbol-width="12dp"/>
                </rule>
                <rule e="way" k="denomination|religion" v="christian">
                    <symbol src="file:/symbols/church.png" symbol-width="12dp"/>
                </rule>
                <caption k="name" dy="20dp" font-style="bold" font-size="10dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
        </rule>
    </xsl:template>

    <xsl:template name="amenity_nodes">
        <rule e="node" k="amenity" v="*">
            <rule e="node" k="amenity" v="atm" zoom-min="17">
                <symbol src="file:/symbols/atm.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="bank" zoom-min="17">
                <symbol src="file:/symbols/bank.png" symbol-width="12dp"/>
                <caption k="name" dy="18dp" font-style="normal" font-size="10dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="amenity" v="bench" zoom-min="17">
                <symbol src="file:/symbols/bench.svg" symbol-width="12dp" scale-icon-size="18,1.2"/>
            </rule>
            <rule e="node" k="amenity" v="bicycle_rental" zoom-min="17">
                <symbol src="file:/symbols/bicycle_rental.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="bus_station" zoom-min="14">
                <symbol src="file:/symbols/bus_station.png" symbol-width="22dp"/>
            </rule>
            <rule e="node" k="railway" v="station" zoom-min="14">
                <symbol src="file:/symbols/bus_station.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="cafe" zoom-min="17">
                <symbol src="file:/symbols/cafe.png" symbol-width="12dp"/>
                <caption k="name" dy="18dp" font-style="bold" font-size="10dp" fill="#815c21" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="amenity" v="cinema" zoom-min="17">
                <symbol src="file:/symbols/cinema.png" symbol-width="12dp"/>
                <caption k="name" dy="18dp" font-style="normal" font-size="10dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="amenity" v="fast_food" zoom-min="17">
                <symbol src="file:/symbols/fastfood.png" symbol-width="12dp"/>
                <caption k="name" dy="18dp" font-style="normal" font-size="9dp" fill="#815c21" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="amenity" v="fire_station" zoom-min="17">
                <symbol src="file:/symbols/firebrigade.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="fountain" zoom-min="17">
                <symbol src="file:/symbols/fountain.png" symbol-width="12dp"/>
                <caption k="name" dy="18dp" font-style="bold_italic" font-size="8dp" fill="#4040ff" stroke="#ffffff" stroke-width="2dp"/>
            </rule>
            <rule e="node" k="amenity" v="fuel" zoom-min="17">
                <symbol src="file:/symbols/petrolStation.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="hospital" zoom-min="15">
                <symbol src="file:/symbols/hospital.svg" symbol-width="12dp"/>
                <caption k="name" dy="18dp" font-style="bold" font-size="9dp" fill="#0066FF" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="amenity" v="clinic" zoom-min="15">
                <symbol src="file:/symbols/clinic.svg" symbol-width="12dp"/>
                <caption k="name" dy="18dp" font-style="bold" font-size="9dp" fill="#0066FF" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="amenity" v="kindergarten" zoom-min="17">
                <symbol src="file:/symbols/kindergarten.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="library" zoom-min="17">
                <symbol src="file:/symbols/library.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="parking" zoom-min="17">
                <symbol src="file:/symbols/parking.svg" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="pharmacy" zoom-min="17">
                <symbol src="file:/symbols/pharmacy.svg" symbol-width="12dp"/>
                <caption k="name" dy="18dp" font-style="bold" font-size="9dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="amenity" v="place_of_worship" zoom-min="17">
                <rule e="node" k="denomination|religion" v="jewish">
                    <symbol src="file:/symbols/synagogue.png" symbol-width="12dp"/>
                </rule>
                <rule e="node" k="denomination|religion" v="muslim|moslem">
                    <symbol src="file:/symbols/mosque.png" symbol-width="12dp"/>
                </rule>
                <rule e="node" k="denomination|religion" v="christian">
                    <symbol src="file:/symbols/church.png" symbol-width="12dp"/>
                </rule>
                <caption k="name" dy="20dp" font-style="bold" font-size="10dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="amenity" v="post_box" zoom-min="17">
                <symbol src="file:/symbols/postbox.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="post_office" zoom-min="17">
                <symbol src="file:/symbols/postoffice.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="pub|bar" zoom-min="17">
                <symbol src="file:/symbols/pub.png" symbol-width="12dp"/>
                <caption k="name" dy="18dp" font-style="bold" font-size="10dp" fill="#815c21" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="amenity" v="recycling" zoom-min="17">
                <symbol src="file:/symbols/recycling.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="restaurant" zoom-min="17">
                <symbol src="file:/symbols/restaurant.png" symbol-width="12dp"/>
                <caption k="name" dy="18dp" font-style="bold" font-size="10dp" fill="#815c21" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="amenity" v="shelter" zoom-min="17">
                <symbol src="file:/symbols/shelter.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="telephone" zoom-min="17">
                <symbol src="file:/symbols/telephone.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="theatre" zoom-min="17">
                <symbol src="file:/symbols/theatre.png" symbol-width="12dp"/>
                <caption k="name" dy="20dp" font-style="bold" font-size="10dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="amenity" v="toilets" zoom-min="17">
                <symbol src="file:/symbols/toilets.png" symbol-width="12dp"/>
            </rule>
            <rule e="node" k="amenity" v="school" zoom-min="17">
                <symbol src="file:/symbols/school.png" symbol-width="12dp"/>
                <caption k="name" dy="20dp" font-style="normal" font-size="9dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
            <rule e="node" k="amenity" v="university|college" zoom-min="17">
                <symbol src="file:/symbols/university.png" symbol-width="12dp"/>
                <caption k="name" dy="20dp" font-style="normal" font-size="9dp" fill="#000000" stroke="#ffffff" stroke-width="2.0dp"/>
            </rule>
        </rule>
    </xsl:template>

</xsl:stylesheet>
