<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	exclude-result-prefixes="#all" version="2.0"
	xmlns="http://www.tei-c.org/ns/1.0">

    <xsl:template name="insertVersion">
        <xsl:param name="creationDate"/>
        <xsl:param name="versionNumber"/>
        <encodingDesc>
            <appInfo>
                <application ident="pub2tei" version="${versionNumber}" when="{$creationDate}">
                    <label>pub2TEI</label>
                    <desc>A set of style sheets for converting XML documents encoded in various scientific publisher formats into a common TEI format</desc>
                </application>
            </appInfo>
        </encodingDesc>
    </xsl:template>