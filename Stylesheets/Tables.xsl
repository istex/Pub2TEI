<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:els1="http://www.elsevier.com/xml/ja/dtd"    
    xmlns:els2="http://www.elsevier.com/xml/cja/dtd"
    xmlns:s1="http://www.elsevier.com/xml/si/dtd"
    xmlns:cals="http://www.elsevier.com/xml/common/cals/dtd"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns:wiley="http://www.wiley.com/namespaces/wiley"
    xmlns:oasis="http://www.niso.org/standards/z39-96/ns/oasis-exchange/table"
    xmlns:rsc="http://www.rsc.org/schema/rscart38"
	exclude-result-prefixes="#all" version="2.0"
	xmlns="http://www.tei-c.org/ns/1.0">

    <!-- Royal Chemical Society: table-entry; NLM: table-wrap -->
    <xsl:template match="table-entry |rsc:table-entry | table-wrap | table">
        <xsl:choose>
            <xsl:when test="oasis:table">
                <table>
                    <xsl:if test="@id">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="label">
                        <head type="label">
                            <xsl:value-of select="label"/>
                        </head>
                    </xsl:if>
                    <!--<xsl:apply-templates select="* except tgroup"/>-->
                    <xsl:apply-templates/>
                </table>
            </xsl:when>
            <xsl:when test="ancestor::p  and not(../row)">
                <figure>
                    <xsl:if test="@id">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="label">
                        <head type="label">
                            <xsl:value-of select="label"/>
                        </head>
                    </xsl:if>
                    <!--<xsl:apply-templates select="* except tgroup"/>-->
                    <xsl:apply-templates/>
                </figure>
            </xsl:when>
            <xsl:when test="ancestor::p | ancestor::rsc:p">
                <table>
                    <xsl:if test="@id">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="oasis:table/@rowsep">
                        <xsl:attribute name="rows">
                            <xsl:value-of select="oasis:table/@rowsep"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="oasis:table/@colsep">
                        <xsl:attribute name="cols">
                            <xsl:value-of select="oasis:table/@colsep"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@id">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@position">
                        <xsl:attribute name="rend">
                            <xsl:value-of select="@position"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="label | rsc:label">
                        <head type="label">
                            <xsl:value-of select="label| rsc:label"/>
                        </head>
                    </xsl:if>
                    <!-- <xsl:apply-templates select="* except tgroup"/>-->
                    <xsl:apply-templates/>
                </table>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="not(oasis:table | table | rsc:table| ancestor::div1)">
                        <figure>
                            <xsl:if test="@id">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="@id"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="graphic/@xlink:href |rsc:graphic/@xlink:href">
                                <xsl:attribute name="n">
                                    <xsl:value-of select="graphic/@xlink:href|rsc:graphic/@xlink:href"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="oasis:table/@rowsep">
                                <xsl:attribute name="rows">
                                    <xsl:value-of select="oasis:table/@rowsep"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="oasis:table/@colsep">
                                <xsl:attribute name="cols">
                                    <xsl:value-of select="oasis:table/@colsep"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="@id">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="@id"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="@position">
                                <xsl:attribute name="rend">
                                    <xsl:value-of select="@position"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="label| rsc:label">
                                <head type="label">
                                    <xsl:if test="label/xref/@id | rsc:label/rsc:xref/@id">
                                        <xsl:attribute name="corresp">
                                            <xsl:text>#</xsl:text>
                                            <xsl:value-of select="label/xref/@id| rsc:label/rsc:xref/@id"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="label| rsc:label"/>
                                </head>
                            </xsl:if>
                            <!-- <xsl:apply-templates select="* except tgroup"/>-->
                            <xsl:apply-templates select="* except(label/xref | graphic | rsc:graphic |rsc:label/rsc:xref)"/>
                        </figure>
                    </xsl:when>
                    <xsl:otherwise>
                        <table>
                            <xsl:if test="@id">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="@id"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="graphic/@xlink:href">
                                <xsl:attribute name="n">
                                    <xsl:value-of select="graphic/@xlink:href"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="oasis:table/@rowsep">
                                <xsl:attribute name="rows">
                                    <xsl:value-of select="oasis:table/@rowsep"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="oasis:table/@colsep">
                                <xsl:attribute name="cols">
                                    <xsl:value-of select="oasis:table/@colsep"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="@id">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="@id"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="@position">
                                <xsl:attribute name="rend">
                                    <xsl:value-of select="@position"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="label">
                                <head type="label">
                                    <xsl:if test="label/xref/@id">
                                        <xsl:attribute name="corresp">
                                            <xsl:text>#</xsl:text>
                                            <xsl:value-of select="label/xref/@id"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="label"/>
                                </head>
                            </xsl:if>
                            <!-- <xsl:apply-templates select="* except tgroup"/>-->
                            <xsl:apply-templates select="* except(label/xref | graphic)"/>
                        </table>
                    </xsl:otherwise>
                </xsl:choose>
                
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- American chemical Society: oasis:table; oasis:table-wrap -->
    <xsl:template match="oasis:table">
        <xsl:apply-templates select="*"/>
    </xsl:template>
    
    <xsl:template match="label | rsc:label">
                <xsl:apply-templates select="*"/>
    </xsl:template>
    <!--elsevier-->
    <xsl:template match="ce:table">
        <xsl:choose>
            <xsl:when test="parent::ce:display">
                <table>
                    <xsl:if test="@id">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates select="*"/>
                </table>
            </xsl:when>
            <xsl:otherwise>
                <div type="table">
                    <table>
                        <xsl:if test="@id">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@id"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="ce:label[string-length() &gt; 0]">
                            <head>
                                <xsl:value-of select="ce:label"/>
                            </head>
                        </xsl:if>
                        <xsl:apply-templates select="*"/>
                    </table>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="table-entry/title|rsc:table-entry/rsc:title| ce:table/ce:caption">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    <xsl:template match="ce:legend">
        <note type="legend">
            <xsl:if test="ce:label">
                <label>
                    <xsl:value-of select="ce:label"/>
                </label>
            </xsl:if>
            <xsl:apply-templates select="ce:simple-para"/>
        </note>
    </xsl:template>
    <xsl:template match="ce:table-footnote">
        <note type="foot-note">
            <xsl:if test="ce:label">
                <label>
                    <xsl:value-of select="ce:label"/>
                </label>
            </xsl:if>
            <xsl:apply-templates select="ce:note-para"/>
        </note>
    </xsl:template>
    <!-- le label est reporté dans l'attribut "@n"
        <xsl:template match="table-wrap/label">
        <label>
            <xsl:apply-templates/>
        </label>
    </xsl:template>-->

    <xsl:template match="table-wrap-foot">
        <note type="table-wrap-foot">
            <xsl:apply-templates/>
        </note>
    </xsl:template>

    <xsl:template match="table-wrap-foot/fn">
        <note place="inline">
            <xsl:if test="@fn-type">
                <xsl:attribute name="type">
                    <xsl:value-of select="@fn-type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </note>
    </xsl:template>

    <xsl:template match="thead/tr |rsc:thead/rsc:tr | cals:thead/cals:row |els1:thead|els2:thead">
        <row role="label">
            <xsl:apply-templates/>
        </row>
    </xsl:template>
    
    <!-- SG - traitement tables WILEY -->
    <xsl:template match="wiley:thead">
            <xsl:apply-templates select="wiley:row"/>
    </xsl:template>
    <xsl:template match="wiley:tbody">
        <xsl:apply-templates select="wiley:row"/>
    </xsl:template>
    <xsl:template match="wiley:row">
        <row role="data">
            <xsl:if test="@rowsep">
                <xsl:attribute name="role">label</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="wiley:entry"/>
        </row>
    </xsl:template>
    <xsl:template match="wiley:entry">
        <cell>
            <xsl:if test="@rowsep">
                <xsl:attribute name="role">label</xsl:attribute>
            </xsl:if>
            <xsl:if test="@morerows">
                <xsl:attribute name="role">label</xsl:attribute>
            </xsl:if>
            <xsl:if test="@align">
                <xsl:attribute name="style"><xsl:text>align(</xsl:text><xsl:apply-templates select="@align"/><xsl:text>)</xsl:text></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </cell>
    </xsl:template>
    <xsl:template match="wiley:colspec">
        <!-- not obvious to use in TEI transformation -->
        <xsl:apply-templates select="*"/>
    </xsl:template>
    

    <xsl:template match="tr | cals:row">
        <row role="data">
            <xsl:apply-templates/>
        </row>
    </xsl:template>

    <xsl:template match="thead |rsc:thead | cals:thead">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tbody |rsc:tbody | cals:tbody | cals:tgroup">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="oasis:tgroup">
        <xsl:apply-templates select="* except oasis:colspec"/>
    </xsl:template>

    <xsl:template match="table-entry/table |rsc:table-entry/rsc:table | table-wrap/table | rsc:table-wrap/rsc:table | els1:display[not(parent::ce:para)]/ce:table| els2:display[not(parent::ce:para)]/ce:table">
       <!-- <ab>
            <table>
                <xsl:apply-templates/>
            </table>
        </ab>-->
        <xsl:apply-templates/>
    </xsl:template>

    <!-- exception Elsevier si on est déjà dans un paragraph et Wiley dans un <tabular> -->
    <xsl:template match="ce:para/els1:display/ce:table |ce:para/els2:display/ce:table">
        <table>
            <xsl:apply-templates/>
        </table>
    </xsl:template>
    <xsl:template match="wiley:table">
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="wiley:tgroup">
        <table>
            <xsl:if test="@cols">
                <xsl:attribute name="cols">
                    <xsl:value-of select="@cols"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xsl:template match="wiley:chemicalStructure">
                <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="array">
        <ref type="array">
            <table>
                <xsl:apply-templates/>
            </table>
        </ref>
    </xsl:template>

    <xsl:template match="th">
        <cell role="th">
            <xsl:if test="@align">
                <xsl:attribute name="rend">align(<xsl:value-of select="@align"/>)</xsl:attribute>
            </xsl:if>
            <xsl:if test="@rowspan">
                <xsl:attribute name="rows"><xsl:value-of select="@rowspan"/></xsl:attribute>
            </xsl:if>
            <xsl:if test="@colspan">
                <xsl:attribute name="cols"><xsl:value-of select="@colspan"/></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </cell>
    </xsl:template>

    <xsl:template match="td">
        <cell role="td">
            <xsl:if test="@align">
                <xsl:attribute name="rend">align(<xsl:value-of select="@align"/>)</xsl:attribute>
            </xsl:if>
            <xsl:if test="@rowspan">
                <xsl:attribute name="rows"><xsl:value-of select="@rowspan"/></xsl:attribute>
            </xsl:if>
            <xsl:if test="@colspan">
                <xsl:attribute name="cols"><xsl:value-of select="@colspan"/></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </cell>
    </xsl:template>

    <xsl:template match="ce:entry">
        <cell>
            <xsl:apply-templates/>
        </cell>
    </xsl:template>
    <xsl:template match="els1:entry |els2:entry">
        <cell>
            <xsl:if test="ancestor::thead">
                <xsl:attribute name="role">label</xsl:attribute>
            </xsl:if>
            <xsl:if test="@colname">
                <xsl:attribute name="cols">
                    <xsl:choose>
                        <xsl:when test="contains(@colname,'col')">
                            <xsl:value-of select="substring-after(@colname,'col')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@colname"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </cell>
    </xsl:template>

    <xsl:template match="cals:colspec">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="bm/table">
        <figure>
            <xsl:attribute name="type">table</xsl:attribute>
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </figure>
    </xsl:template>
	
    <xsl:template match="table/title | wiley:tabular/wiley:title">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    <xsl:template match="wiley:tabular/wiley:noteGroup/wiley:note">
        <note>
            <xsl:if test="@xml:id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    <xsl:template match="wiley:note/wiley:label">
        <label><xsl:apply-templates/></label>
    </xsl:template>
    <xsl:template match="wiley:p/wiley:label">
        <label><xsl:value-of select="text()"/></label>
    </xsl:template>
	
   <xsl:template match="wiley:tabular">
        <figure>
            <xsl:attribute name="type">table</xsl:attribute>
            <xsl:if test="@xml:id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="*"/>
        </figure>
    </xsl:template>
    
    <!-- SG - traitement tables ACS -->
    <xsl:template match="oasis:thead">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="oasis:tbody">
        <xsl:apply-templates select="oasis:row"/>
    </xsl:template>
    <xsl:template match="oasis:row">
        <row role="data">
            <xsl:if test="@rowsep or parent::oasis:thead">
                <xsl:attribute name="role">label</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="oasis:entry"/>
        </row>
    </xsl:template>
    <xsl:template match="oasis:entry">
        <cell>
            <xsl:if test="@rowsep">
                <xsl:attribute name="role">label</xsl:attribute>
            </xsl:if>
            <xsl:if test="@morerows &gt;1">
                <xsl:attribute name="role">label</xsl:attribute>
            </xsl:if>
            <xsl:if test="@align">
                <xsl:attribute name="style"><xsl:text>align(</xsl:text><xsl:apply-templates select="@align"/><xsl:text>)</xsl:text></xsl:attribute>
            </xsl:if>
            <xsl:if test="@colname">
                <xsl:attribute name="cols"><xsl:value-of select="@colname"></xsl:value-of></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </cell>
    </xsl:template>
</xsl:stylesheet>
