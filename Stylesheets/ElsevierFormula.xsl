<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:els1="http://www.elsevier.com/xml/ja/dtd"    
    xmlns:els2="http://www.elsevier.com/xml/cja/dtd"
    xmlns:s1="http://www.elsevier.com/xml/si/dtd"
    xmlns:sb="http://www.elsevier.com/xml/common/struct-bib/dtd"
    exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>

    <xsl:template match="els1:formula |els2:formula">
        <formula>
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </formula>
    </xsl:template>
    
    <xsl:template match="els1:cp">
        <hi rendition="{@type}">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="els2:cp">
        <hi rendition="{@type}">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    
    <xsl:template match="els1:ll">
        <hi rend="subscript">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="els2:ll">
        <hi rend="subscript">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
        
    <xsl:template match="els1:fen">
        <m:mfenced>
            <xsl:apply-templates/>
        </m:mfenced>
    </xsl:template>
    <xsl:template match="els2:fen">
        <m:mfenced>
            <xsl:apply-templates/>
        </m:mfenced>
    </xsl:template>
    
    <xsl:template match="els1:lim">
        <m:mrow>
            <xsl:apply-templates/>
        </m:mrow>
    </xsl:template>
    <xsl:template match="els2:lim">
        <m:mrow>
            <xsl:apply-templates/>
        </m:mrow>
    </xsl:template>
    <xsl:template match="els1:ul">
        <hi rend="underline">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="els2:ul">
        <hi rend="underline">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    
    <xsl:template match="els1:op">
        <m:mi>
            <xsl:apply-templates/>
        </m:mi>
    </xsl:template>
    <xsl:template match="els2:op">
        <m:mi>
            <xsl:apply-templates/>
        </m:mi>
    </xsl:template>
    
    <xsl:template match="els1:inf">
        <hi rend="subscript">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="els2:inf">
        <hi rend="subscript">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
</xsl:stylesheet>
