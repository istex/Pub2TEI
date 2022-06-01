<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:marc="http://www.loc.gov/MARC21/slim" xmlns:tei="http://www.tei-c.org/ns/1.0"
	exclude-result-prefixes="#all" version="2.0"
	xmlns="http://www.tei-c.org/ns/1.0">

    <xsl:template name="insertVersion">
        <encodingDesc>
            <schemaRef type="ODD" url="https://xml-schema.delivery.istex.fr/tei-istex.odd"/>
            <appInfo>
                <application ident="pub2tei" version="{$xslversion}" when="{$releasedate}">
                    <label>pub2TEI-ISTEX</label>
                    <desc>A set of style sheets for converting XML documents encoded in various scientific publisher formats into a common TEI format.
                        <ref target="http://www.tei-c.org/">We use TEI</ref></desc>
                </application>
            </appInfo>
            <!-- reprise du stylage QUE pour openEdition -->
            <xsl:if test="//tei:distributor='OpenEdition'">
                <tagsDecl>
                    <rendition xml:id="style01" scheme="css">font-style:italic;</rendition>
                    <rendition xml:id="style02" scheme="css">font-variant:small-caps;</rendition>
                    <rendition xml:id="style03" scheme="css">vertical-align:super;</rendition>
                    <rendition xml:id="style04" scheme="css">font-weight:bold;</rendition>
                </tagsDecl>
            </xsl:if>
            <!-- ECCO -->
            <xsl:if test="//bookInfo | //marc:datafield[@tag='650']">
                <classDecl>
                    <xsl:if test="//bookInfo | //marc:datafield[@ind2='0'][@tag='650']">
                        <taxonomy xml:id="LCSH">
                            <bibl>Library of Congress Subject Headings</bibl>
                        </taxonomy>
                    </xsl:if>
                    <xsl:if test="//marc:datafield[@ind2='1'][@tag='650']">
                        <taxonomy xml:id="LCSHA">
                            <bibl>Library of Congress Subject Headings</bibl>
                        </taxonomy>
                    </xsl:if>
                    <xsl:if test="//marc:datafield[@ind2='2'][@tag='650']">
                        <taxonomy xml:id="MESH">
                            <bibl>Medical Subject Headings of the National Library of Medicine.</bibl>
                        </taxonomy>
                    </xsl:if>
                    <xsl:if test="//marc:datafield[@ind2='3'][@tag='650']">
                        <taxonomy xml:id="NAL">
                            <bibl>US National Library of Agriculture</bibl>
                        </taxonomy>
                    </xsl:if>
                    <xsl:if test="//marc:datafield[@ind2='5'][@tag='650']">
                        <taxonomy xml:id="CSH">
                            <bibl>Canadian Subject Headings</bibl>
                        </taxonomy>
                    </xsl:if>
                    <xsl:if test="//marc:datafield[@ind2='6'][@tag='650']">
                        <taxonomy xml:id="RVM">
                            <bibl>Répertoire de vedettes-matière, Bibliothèque de l'Université Laval, Canada</bibl>
                        </taxonomy>
                    </xsl:if>
                </classDecl>
            </xsl:if>
        </encodingDesc>
    </xsl:template>

</xsl:stylesheet>