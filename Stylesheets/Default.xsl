<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    xmlns:m="http://www.w3.org/1998/Math/MathML" 
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" 
    xmlns:sb="http://www.elsevier.com/xml/common/struct-bib/dtd"
    xmlns:wiley="http://www.wiley.com/namespaces/wiley/wiley"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all">

    <!-- Default rules -->
    <xsl:template match="*">
        <xsl:message terminate="no">Element inconnu: name: <xsl:value-of
            select="name()"/> - local-name: <xsl:value-of select="local-name()"/> -
            namespace-uri: <xsl:value-of select="namespace-uri()"/> -
                <xsl:for-each select="attribute::*">
                <xsl:value-of select="name(.)"/>="<xsl:value-of select="."/>" </xsl:for-each>
        </xsl:message>
        <!-- SG - récuperation de tous les éléments pour validation -->
        <!--xsl:if test="normalize-space(.)">
            <xsl:element name="{name(.)}">
                <xsl:apply-templates select="@*"/>
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:if-->
    </xsl:template>
    
    <!-- SG - récupération des attributs -->
    <!--xsl:template match="@*">
        <xsl:attribute name="{name(.)}">
            <xsl:value-of select=". "/>
        </xsl:attribute>
    </xsl:template-->

    <!-- Default rules for MathML, PL: copy is via template to allow selective copy -->
    <xsl:template match="m:math">
        <xsl:message terminate="no">MathML: <xsl:value-of select="name(.)"/> - <xsl:for-each
            select="attribute::*">
            <xsl:value-of select="name(.)"/>="<xsl:value-of select="."/>" </xsl:for-each>
        </xsl:message>
        <formula>
            <xsl:copy copy-namespaces="no">
                <xsl:apply-templates select="node() | @* except(@type)" mode="mathml"/>
            </xsl:copy>
        </formula>
    </xsl:template>
    
    <xsl:template match="node() | @*" mode="mathml">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="node() | @* except(@displaystyle)" mode="mathml"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="tei:text" mode="openEditionBook">
        <text>
            <xsl:apply-templates select="tei:*" mode="tei"/>
        </text>
    </xsl:template>
    <xsl:template match="tei:*" mode="tei"> 
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="node()|@*" mode="tei"/>
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template match="node() | @*" mode="tei">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="node() | @*" mode="tei"/>
        </xsl:copy>
    </xsl:template>

	<!-- PL: to avoid unwanted/extra line break and spaces -->
	<!--xsl:strip-space elements="*" /-->

</xsl:stylesheet>
