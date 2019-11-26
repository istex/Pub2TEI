<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
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
            <xsl:if test="//tei:TEI">
                <tagsDecl>
                    <rendition xml:id="style01" scheme="css">font-style:italic;</rendition>
                    <rendition xml:id="style02" scheme="css">font-variant:small-caps;</rendition>
                    <rendition xml:id="style03" scheme="css">vertical-align:super;</rendition>
                    <rendition xml:id="style04" scheme="css">font-weight:bold;</rendition>
                </tagsDecl>
            </xsl:if>
        </encodingDesc>
    </xsl:template>

</xsl:stylesheet>