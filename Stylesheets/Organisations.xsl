<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" version="2.0" exclude-result-prefixes="#all">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> May 27, 2010</xd:p>
            <xd:p><xd:b>Author:</xd:b> romary</xd:p>
            <xd:p>Parsing of organisation names to detect the type of orgName</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="identifyOrgLevel">
        <xsl:param name="theOrg"/>
        <xsl:choose>
            <xsl:when test="contains($theOrg,'IB')  or
                contains($theOrg,'Study') or
                contains($theOrg,'CCS') or
                contains($theOrg,'College of') or
                contains($theOrg,'Universidad') or
                contains($theOrg,'Hospi') or
                contains($theOrg,'Osservatorio') or
                contains($theOrg,'Museum') or
                contains($theOrg,'Center') or
                contains($theOrg,'Institute') or
                contains($theOrg,'Institut') or
                contains($theOrg,'Campus') or
                contains($theOrg,' Universit') or
                contains($theOrg,'University of') or
                contains($theOrg,'Academy') or
                contains($theOrg,'Pasteur') or
                contains($theOrg,'Registry') or
                contains($theOrg,'Register') or
                contains($theOrg,'Registro') or
                contains($theOrg,'Eurocat') or
                contains($theOrg,'Fundação') or
                contains($theOrg,'Network') or
                starts-with($theOrg,'Inserm') or
                starts-with($theOrg,'Ministr')">
                <xsl:text>institution</xsl:text>
            </xsl:when>
            <xsl:when test=" 
                ends-with($theOrg,'ogy') or
                contains($theOrg,'School') or 
                contains($theOrg,'Ecole')or 
                contains($theOrg,'Facul')">
                <xsl:text>department</xsl:text>
            </xsl:when>
            <xsl:when test="contains($theOrg,'Branch') or
                contains($theOrg,'Centre') or
                contains($theOrg,'Centro') or
                contains($theOrg,'Section') or
                contains($theOrg,'Division') or
                contains($theOrg,'Dpto') or
                contains($theOrg,'depart') or
                contains($theOrg,'Depart') or
                contains($theOrg,'Dept') or
                contains($theOrg,'Dipart') or
                contains($theOrg,'Départ')">
                <xsl:text>division</xsl:text>
            </xsl:when>
            <xsl:when test="contains($theOrg,'Research') or
                contains($theOrg,'Unit') or
                contains($theOrg,'Labo') or
                contains($theOrg,'Servic') or
                contains($theOrg,'Biol')">
                <xsl:text>laboratory</xsl:text>
            </xsl:when>
            <xsl:when test="contains($theOrg,'Group') or
                contains($theOrg,'Program')">
                <xsl:text>group</xsl:text>
            </xsl:when>
<xsl:otherwise>
                <xsl:message>Org inconnue: <xsl:value-of select="$theOrg"/></xsl:message>
                <xsl:text></xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
