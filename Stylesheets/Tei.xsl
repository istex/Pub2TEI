<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- Feuille de style concernant les données:
    - DROZ
    - Open Edition Revues
    -->
   
    <xsl:template match="tei:TEI">
        <TEI xsi:noNamespaceSchemaLocation="https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd" xmlns:ns1="http://standoff.proposal">
            <xsl:apply-templates select="tei:teiHeader"/>
            <xsl:apply-templates select="tei:text"/>
        </TEI>
    </xsl:template>
    <xsl:template match="tei:teiHeader">
        <teiHeader>
            <fileDesc>
                <xsl:apply-templates select="tei:fileDesc"/>
                <xsl:if test="contains(.,'Droz')">
                    <notesStmt>
                        <note type="content-type" subtype="chapter" source="chapter" scheme="https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6">chapter</note>
                        <note type="publication-type" subtype="book" scheme="https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F">book</note>
                        <xsl:copy-of select="//tei:fileDesc/tei:notesStmt/tei:note"/>
                    </notesStmt>
                </xsl:if>
                <sourceDesc>
                    <biblStruct>
                        <xsl:attribute name="type">
                            <xsl:choose>
                                <xsl:when test="contains(.,'Droz')">inbook</xsl:when>
                                <xsl:otherwise>article</xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <analytic>
                            <xsl:choose>
                                <!-- DROZ -->
                                <xsl:when test="contains(.,'Droz')">
                                    <xsl:apply-templates select="//tei:fileDesc/tei:titleStmt/tei:title" mode="chap"/>
                                    <xsl:if test="//tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:author">
                                        <xsl:for-each select="//tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:author">
                                                <author>
                                                    <xsl:variable name="i" select="position() - 1"/>
                                                    <xsl:attribute name="xml:id">
                                                        <xsl:choose>
                                                            <xsl:when test="$i &lt; 10">
                                                                <xsl:value-of select="concat('author-000', $i)"/>
                                                            </xsl:when>
                                                            <xsl:when test="$i &lt; 100">
                                                                <xsl:value-of select="concat('author-00', $i)"/>
                                                            </xsl:when>
                                                            <xsl:when test="$i &lt; 1000">
                                                                <xsl:value-of select="concat('author-0', $i)"/>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:value-of select="concat('author-', $i)"/>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:attribute>
                                                    <xsl:copy-of select="@* except(@role,@ref)"/>
                                                    <persName>
                                                        <xsl:if test="substring-after(@key,', ')[string-length()&gt; 0]">
                                                            <forename type="first">
                                                                <xsl:value-of select="substring-after(@key,', ')"/>
                                                            </forename>
                                                        </xsl:if>
                                                        <surname>
                                                            <xsl:value-of select="substring-before(@key,',')"/>
                                                        </surname>
                                                    </persName>
                                                </author>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="//tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:editor and not(//tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:author)">
                                        <xsl:for-each select="//tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:editor">
                                            <xsl:if test="@role !='edition_direction'">
                                            <author>
                                                <xsl:variable name="i" select="position() - 1"/>
                                                <xsl:attribute name="xml:id">
                                                    <xsl:choose>
                                                        <xsl:when test="$i &lt; 10">
                                                            <xsl:value-of select="concat('author-000', $i)"/>
                                                        </xsl:when>
                                                        <xsl:when test="$i &lt; 100">
                                                            <xsl:value-of select="concat('author-00', $i)"/>
                                                        </xsl:when>
                                                        <xsl:when test="$i &lt; 1000">
                                                            <xsl:value-of select="concat('author-0', $i)"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="concat('author-', $i)"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:attribute>
                                                <xsl:copy-of select="@* except(@role,@ref)"/>
                                                <persName>
                                                    <forename type="first">
                                                        <xsl:value-of select="substring-after(@key,', ')"/>
                                                    </forename>
                                                    <surname>
                                                        <xsl:value-of select="substring-before(@key,',')"/>
                                                    </surname>
                                                </persName>
                                            </author>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="//tei:fileDesc/tei:titleStmt/tei:author"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <!-- autre éditeur -->
                            <xsl:copy-of select="//tei:fileDesc/tei:titleStmt/tei:editor"/>
                            <xsl:copy-of select="//tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:respStmt"/>
                            <!-- ajout identifiants ISTEX et ARK -->
                            <xsl:if test="string-length($idistex) &gt; 0 ">
                                <idno type="istex">
                                    <xsl:value-of select="$idistex"/>
                                </idno>
                            </xsl:if>
                            <xsl:if test="string-length($arkistex) &gt; 0 ">
                                <idno type="ark">
                                    <xsl:value-of select="$arkistex"/>
                                </idno>
                            </xsl:if>
                            <xsl:copy-of select="//tei:fileDesc/tei:publicationStmt/tei:idno[@type='doi']"/>
                            <xsl:copy-of select="//tei:fileDesc/tei:publicationStmt/tei:idno[@type='url']"/>
                        </analytic>
                        <monogr>
                            <xsl:choose>
                                <!-- DROZ -->
                                <xsl:when test="contains(.,'Droz')">
                                    <title level="m" type="main">
                                        <xsl:choose>
                                            <xsl:when test="//tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title[@type='main']">
                                                <xsl:value-of select="//tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title[@type='main']"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="//tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </title>
                                    <xsl:if test="//tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title[@type='sub']">
                                        <title level="m" type="sub">
                                            <xsl:value-of select="//tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:title[@type='sub']"/>
                                        </title>
                                    </xsl:if>
                                    <xsl:copy-of select="//tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:idno"/>
                                    <xsl:if test="//tei:sourceDesc/tei:bibl/tei:author">
                                        <xsl:for-each select="//tei:sourceDesc/tei:bibl/tei:author">
                                            <author>
                                                <persName>
                                                    <xsl:if test="substring-after(.,', ')[string-length()&gt; 0]">
                                                        <forename type="first">
                                                            <xsl:value-of select="substring-after(.,', ')"/>
                                                        </forename>
                                                    </xsl:if>
                                                    <surname>
                                                        <xsl:value-of select="substring-before(.,',')"/>
                                                    </surname>
                                                </persName>
                                            </author>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="//tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:editor">
                                        <xsl:for-each select="//tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:editor">
                                            <editor>
                                                <xsl:variable name="i" select="position() - 1"/>
                                                <xsl:attribute name="xml:id">
                                                    <xsl:choose>
                                                        <xsl:when test="$i &lt; 10">
                                                            <xsl:value-of select="concat('editor-000', $i)"/>
                                                        </xsl:when>
                                                        <xsl:when test="$i &lt; 100">
                                                            <xsl:value-of select="concat('editor-00', $i)"/>
                                                        </xsl:when>
                                                        <xsl:when test="$i &lt; 1000">
                                                            <xsl:value-of select="concat('editor-0', $i)"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="concat('editor-', $i)"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:attribute>
                                                    <xsl:copy-of select="@* except(@ref)"/>
                                                <persName>
                                                    <forename type="first">
                                                        <xsl:value-of select="substring-after(@key,', ')"/>
                                                    </forename>
                                                    <surname>
                                                        <xsl:value-of select="substring-before(@key,',')"/>
                                                    </surname>
                                                </persName>
                                            </editor>
                                        </xsl:for-each>
                                    </xsl:if>
                                <imprint>
                                    <xsl:copy-of select="//tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:publisher"/>
                                    <xsl:copy-of select="//tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:pubPlace"/>
                                    <xsl:copy-of select="//tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:date"/>
                                    <xsl:if test="//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='page']/@from">
                                        <biblScope unit="page" from="{//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='page']/@from}">
                                            <xsl:value-of select="//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='page']/@from"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:if test="//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='page']/@to">
                                        <biblScope unit="page" to="{//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='page']/@to}">
                                            <xsl:value-of select="//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='page']/@to"/>
                                        </biblScope>
                                    </xsl:if>
                                </imprint>
                                </xsl:when>
                                <!-- autres corpus -->
                                <xsl:when test="normalize-space(//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title[1])[string-length()&gt; 0]">
                                    <xsl:copy-of select="//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title"/>
                                    <xsl:copy-of select="//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:idno"/>
                                    <imprint>
                                    <xsl:copy-of select="//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:publisher"/>
                                        <xsl:copy-of select="//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:date"/>
                                        <!-- volume et numero -->
                                        <xsl:choose>
                                            <xsl:when test="contains(//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='issue'],'Volume')">
                                                <xsl:variable name="volume1">
                                                    <xsl:value-of select="substring-before(//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='issue'],'Numéro')"/>
                                                </xsl:variable>
                                                <xsl:variable name="numero">
                                                    <xsl:value-of select="substring-after(//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='issue'],'Numéro')"/>
                                                </xsl:variable>
                                                <xsl:variable name="volume">
                                                    <xsl:value-of select="substring-after($volume1,' ')"/>
                                                </xsl:variable>
                                                <xsl:if test="$volume">
                                                    <biblScope unit="volume">
                                                        <xsl:value-of select="normalize-space($volume)"/>
                                                    </biblScope>
                                                </xsl:if>
                                                <xsl:if test="$numero">
                                                    <biblScope unit="issue">
                                                        <xsl:value-of select="normalize-space($numero)"/>
                                                    </biblScope>
                                                </xsl:if>
                                            </xsl:when>
                                            <xsl:when test="contains(//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='issue'],'Hors-série')">
                                                <xsl:variable name="HorsSerie">
                                                    <xsl:value-of select="substring-after(//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='issue'],'Hors-série')"/>
                                                </xsl:variable>
                                                <xsl:if test="$HorsSerie">
                                                    <biblScope unit="issue">
                                                        <xsl:text>HS</xsl:text>
                                                        <xsl:value-of select="normalize-space($HorsSerie)"/>
                                                    </biblScope>
                                                </xsl:if>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="//tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='issue']"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <!-- pagination -->
                                        <xsl:choose>
                                            <!-- découpage des pages -->
                                            <xsl:when test="contains(//tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='page'],'-')">
                                                <xsl:variable name="firstPage">
                                                    <xsl:value-of select="substring-before(//tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='page'],'-')"/>
                                                </xsl:variable>
                                                <xsl:variable name="lastPage">
                                                    <xsl:value-of select="substring-after(//tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='page'],'-')"/>
                                                </xsl:variable>
                                                <xsl:if test="$firstPage">
                                                    <biblScope unit="page" from="{$firstPage}">
                                                        <xsl:value-of select="$firstPage"/>
                                                    </biblScope>
                                                </xsl:if>
                                                <xsl:if test="$lastPage">
                                                    <biblScope unit="page" to="{$lastPage}">
                                                        <xsl:value-of select="$lastPage"/>
                                                    </biblScope>
                                                </xsl:if>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="//tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='page']"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </imprint>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="//tei:fileDesc/tei:titleStmt/tei:title" mode="mono"/>
                                    <xsl:copy-of select="//tei:fileDesc/tei:publicationStmt/tei:idno"/>
                                    <xsl:copy-of select="//tei:fileDesc/tei:titleStmt/tei:author"/>
                                        <imprint>
                                            <xsl:if test="//tei:fileDesc/tei:publicationStmt/tei:publisher[string-length()&gt; 0]">
                                                <xsl:copy-of select="//tei:fileDesc/tei:publicationStmt/tei:publisher"/>
                                            </xsl:if>
                                            <xsl:copy-of select="//tei:fileDesc/tei:publicationStmt/tei:distributor"/>
                                            <xsl:copy-of select="//tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:date"/>
                                            <xsl:if test="//tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:idno[@type='pp'][string-length()&gt; 0]">
                                                <xsl:variable name="pageStart">
                                                    <xsl:value-of select="substring-before(//tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:idno[@type='pp'],'-')"/>
                                                </xsl:variable>
                                                <xsl:variable name="pageEnd">
                                                    <xsl:value-of select="substring-after(//tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:idno[@type='pp'],'-')"/>
                                                </xsl:variable>
                                                <biblScope unit='page' from="{normalize-space($pageStart)}">
                                                    <xsl:value-of select="normalize-space($pageStart)"/>
                                                </biblScope>
                                                <biblScope unit='page' to="{normalize-space($pageEnd)}">
                                                    <xsl:value-of select="normalize-space($pageEnd)"/>
                                                </biblScope>
                                            </xsl:if>
                                        </imprint>
                                </xsl:otherwise>
                            </xsl:choose>
                        </monogr>
                        <xsl:choose>
                            <xsl:when test="contains(.,'Droz')">
                                <xsl:if test="//tei:sourceDesc/tei:biblFull/tei:seriesStmt">
                                    <series>
                                        <xsl:copy-of select="//tei:sourceDesc/tei:biblFull/tei:seriesStmt/tei:title"/>
                                        <xsl:copy-of select="//tei:sourceDesc/tei:biblFull/tei:seriesStmt/tei:idno"/>
                                    </series>
                                </xsl:if>
                            </xsl:when>
                        </xsl:choose>
                    </biblStruct>
                </sourceDesc>
            </fileDesc>
            <xsl:call-template name="insertVersion"/>
            <xsl:choose>
                <xsl:when test="//tei:front/tei:div[@type='abstract']">
                    <profileDesc>
                        <xsl:copy-of select="//tei:langUsage"/>
                        <xsl:if test="//tei:textClass/tei:keywords">
                            <xsl:apply-templates select="//tei:textClass"/>
                        </xsl:if>
                        <xsl:for-each select="//tei:front/tei:div[@type='abstract']">
                            <abstract>
                                <xsl:if test="//tei:front/tei:div[@type='abstract']/@xml:lang[string-length()&gt; 0]">
                                    <xsl:attribute name="xml:lang">
                                        <xsl:value-of select="./@xml:lang"/>
                                    </xsl:attribute>
                                    <xsl:copy-of select="./*"/>
                                </xsl:if>
                            </abstract>
                        </xsl:for-each>
                    </profileDesc>
                </xsl:when>
                <!-- pour enlever les cas particuliers comme:
                 <profileDesc>
                          <langUsage>
                                 <language ident="fr">fr</language>
                           </langUsage>

                           <textClass> </textClass>
                   </profileDesc>
                -->
                <xsl:when test="not(//tei:profileDesc/tei:textClass/tei:keywords)">
                    <profileDesc>
                        <xsl:copy-of select="//tei:langUsage"/>
                    </profileDesc>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="//tei:profileDesc"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- traceability -->
            <revisionDesc>
                <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
            </revisionDesc>
        </teiHeader>
    </xsl:template>
    <xsl:template match="tei:textClass">
        <textClass>
            <xsl:apply-templates select="tei:keywords"/>
        </textClass>
    </xsl:template>
    <xsl:template match="tei:keywords">
        <keywords scheme="{@scheme}">
            <xsl:if test="./@xml:lang">
                <xsl:copy-of select="./@xml:lang"/>
            </xsl:if>
               <xsl:apply-templates select="tei:list"/> 
        </keywords>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <list>
           <xsl:apply-templates select="tei:item"/>
        </list>
    </xsl:template>
    <xsl:template match="tei:item">
        <item>
            <term>
                <xsl:apply-templates/>
            </term>
        </item>
    </xsl:template>
    <xsl:template match="tei:text">
        <text>
            <xsl:if test="//tei:text/tei:front/tei:div[@type='ack'][string-length()&gt; 0]">
                <front>
                    <xsl:copy-of select="//tei:text/tei:front/tei:div[@type='ack']"/>
                </front>
            </xsl:if>
            <xsl:copy-of select="//tei:text/tei:body"/>
            <xsl:apply-templates select="//tei:text/tei:back"/>
        </text>
    </xsl:template>
    <xsl:template match="tei:back">
        <back>
            <div>
                <xsl:apply-templates select="//tei:listBibl"/>
            </div>
        </back>
    </xsl:template>
    <xsl:template match="tei:listBibl">
        <listBibl type="references">
            <xsl:copy-of select="//tei:text/tei:back/tei:div/tei:listBibl/tei:bibl"/>
        </listBibl>
    </xsl:template>
    <xsl:template match="tei:fileDesc">
        <xsl:apply-templates select="tei:titleStmt"/>
        <xsl:apply-templates select="tei:editionStmt"/>
        <xsl:apply-templates select="tei:publicationStmt"/>
    </xsl:template>
    <xsl:template match="tei:titleStmt">
        <titleStmt>
            <xsl:choose>
                <xsl:when test="contains(.,'Droz')">
                    <xsl:apply-templates select="tei:title" mode="chap"/>
                    <xsl:copy-of select="tei:funder"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="tei:title"/>
                </xsl:otherwise>
            </xsl:choose>
        </titleStmt>
    </xsl:template>
    <xsl:template match="tei:title" mode="chap">
        <title level='a' type='main'>
            <xsl:choose>
                <xsl:when test="//tei:idno[@type='nom_pdf']=''
                    or //tei:idno[@type='nom_pdf']='9782600004190_front-1.pdf'
                    or //tei:idno[@type='nom_pdf']='9782600000321_front-1.pdf'
                    or //tei:idno[@type='nom_pdf']='9782600000482_front-1.pdf'
                    or //tei:idno[@type='nom_pdf']='9782600001533_front-1.pdf'
                    or //tei:idno[@type='nom_pdf']='9782600002226_body-1.pdf'"><xsl:text>Dédicace</xsl:text></xsl:when>
                <xsl:when test="//tei:idno[@type='nom_pdf']='9782600001533_body-3-1.pdf'"><xsl:text>DE L'IMMOBILITE COMME PERFECTION ?</xsl:text></xsl:when>
                <xsl:when test="//tei:idno[@type='nom_pdf']='9782600002882_front-2.pdf'"><xsl:text>Citations</xsl:text></xsl:when>
                <xsl:when test="//tei:idno[@type='nom_pdf']='9782600002288_front-1.pdf'"><xsl:text>NOUVELLES FRANÇAISES DU XVIe SIÈCLE - IMAGES DE LA VIE DU TEMPS</xsl:text></xsl:when>
                <xsl:when test="//tei:idno[@type='nom_pdf']='9782600003551_front-1.pdf'"><xsl:text>Cliché Bibliothèque nationale de France, Paris.</xsl:text></xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </title>
    </xsl:template>
    <xsl:template match="tei:title" mode="mono">
        <xsl:variable name="recupTitMono">
            <xsl:value-of select="substring-after(//idno[@type='url'],'http://books.openedition.org/')"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="contains(//tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='url'],'alpara')">
                <title level='m' type='main'>Alpara</title>
            </xsl:when>
            <xsl:otherwise>
                <title level='m' type='main'>
                    <xsl:value-of select="normalize-space(.)"/>
                </title>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:editionStmt">
        <editionStmt>
            <xsl:copy-of select="tei:edition"/>
        </editionStmt>
    </xsl:template>
    <xsl:template match="tei:publicationStmt">
        <publicationStmt>
            <authority>ISTEX</authority>
            <xsl:choose>
                <xsl:when test="tei:publisher[string-length()&gt; 0]">
                    <xsl:copy-of select="tei:publisher"/>
                </xsl:when>
                <xsl:otherwise>
                    <publisher>OpenEdition</publisher>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:copy-of select="tei:address"/>
            <xsl:choose>
                <xsl:when test="contains(tei:availability/tei:licence,'Droz')">
                    <availability status="{tei:availability/@status}">
                        <xsl:copy-of select="tei:availability/tei:licence"/>
                        <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-984PFWH6-T">droz</p>
                    </availability>
                </xsl:when>
                <xsl:when test="normalize-space(tei:availability/tei:p)[string-length()&gt; 0]">
                    <xsl:copy-of select="tei:availability"/>
                    <availability>
                        <licence>© <xsl:value-of select="tei:date"/> OpenEdition</licence>
                        <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-Z4364Z68-Q">open-edition</p>
                    </availability>
                </xsl:when>
                <xsl:otherwise>
                    <availability>
                        <licence>© <xsl:value-of select="tei:date"/> OpenEdition</licence>
                        <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-Z4364Z68-Q">open-edition</p>
                    </availability>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:copy-of select="//tei:fileDesc/tei:publicationStmt/tei:distributor"/>
            <xsl:apply-templates select="tei:date"/>
            <xsl:if test="tei:availability/tei:licence/tei:date">
                <date type="Copyright" when="{tei:availability/tei:licence/tei:date}"/>
            </xsl:if>
        </publicationStmt>
    </xsl:template>
    <xsl:template match="tei:date">
        <xsl:choose>
            <xsl:when test="@when">
                <date type="published" when="{@when}"/>
            </xsl:when>
            <xsl:otherwise>
                <date type="published" when="{.}"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:author">
        <author>
            <xsl:copy-of select="tei:persName"/>
            <!-- reprise de l'adresse email -->
            <xsl:choose>
                <xsl:when test="tei:affiliation/tei:hi[@rend='author-email']">
                    <email>
                        <xsl:value-of select="normalize-space(tei:affiliation/tei:hi[@rend='author-email'])"/>
                    </email>
                </xsl:when>
                <xsl:when test="contains(tei:affiliation,'Courriel')">
                    <email>
                        <xsl:value-of select="normalize-space(substring-after(tei:affiliation,'Courriel : '))"/>
                    </email>
                </xsl:when>
            </xsl:choose>
            <!-- affiliation découpée et structurée -->
            <xsl:apply-templates select="tei:affiliation"/>
        </author>
    </xsl:template>
    
    <xsl:template match="tei:affiliation">
        <!-- pour distinguer les biographies des vrais affiliations
        rechercher le nom de l'auteur-->
        <xsl:variable name="auteur">
            <xsl:value-of select="ancestor::tei:author/tei:persName/tei:surname"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="contains(.,$auteur)">
                <note type="biography">
                    <xsl:value-of select="normalize-space(.)"/>
                </note>
            </xsl:when>
            <xsl:otherwise>
                <affiliation>
                    <xsl:choose>
                        <xsl:when test="not(contains(.,','))">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:when>
                        <xsl:when test="contains(.,'(')">
                            <!-- <affiliation>
                        CEMAf (CNRS, EPHE, Paris I, Université d’Aix-en-Provence)
                    </affiliation> -->
                            <orgName type="institution">
                                <xsl:value-of select="normalize-space(.)"/>
                            </orgName>
                        </xsl:when>
                        <xsl:when test="contains(.,', Courriel')">
                            <xsl:call-template name="OpenEdParseAffiliation">
                                <xsl:with-param name="theAffil">
                                    <xsl:value-of select="normalize-space(substring-before(.,', Courriel'))"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="contains(.,'téléphone')">
                            <xsl:value-of select="normalize-space(substring-before(.,', téléphone'))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="OpenEdParseAffiliation">
                                <xsl:with-param name="theAffil">
                                    <xsl:value-of select="normalize-space(substring-after(.,'– '))"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </affiliation>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- parseAffiliation -->
    <xsl:template name="OpenEdParseAffiliation">
        <xsl:param name="theAffil"/>
        <xsl:param name="inAddress" select="false()"/>
        <xsl:for-each select="$theAffil">
            <xsl:message>Un bout: <xsl:value-of select="."/></xsl:message>
        </xsl:for-each>
        <xsl:variable name="avantVirgule">
            <xsl:choose>
                <xsl:when test="contains($theAffil,',')">
                    <xsl:value-of select="normalize-space(substring-before($theAffil,','))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space($theAffil)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apresVirgule">
            <xsl:choose>
                <xsl:when test="contains($theAffil,',')">
                    <xsl:value-of select="normalize-space(substring-after($theAffil,','))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="testOrganisation">
            <xsl:call-template name="identifyOrgLevel">
                <xsl:with-param name="theOrg">
                    <xsl:value-of select="$avantVirgule"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="not($inAddress)">
                <xsl:choose>
                    <xsl:when test="$testOrganisation!=''">
                        <orgName>
                            <xsl:attribute name="type">
                                <xsl:value-of select="$testOrganisation"/>
                            </xsl:attribute>
                            <xsl:value-of select="$avantVirgule"/>
                        </orgName>
                        <xsl:if test="$apresVirgule !=''">
                            <xsl:call-template name="OpenEdParseAffiliation">
                                <xsl:with-param name="theAffil" select="$apresVirgule"/>
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <address>
                            <xsl:call-template name="OpenEdParseAffiliation">
                                <xsl:with-param name="theAffil" select="$theAffil"/>
                                <xsl:with-param name="inAddress" select="true()"/>
                            </xsl:call-template>
                        </address>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="testCountry">
                    <xsl:call-template name="normalizeISOCountry">
                        <xsl:with-param name="country" select="translate($avantVirgule,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$testCountry != ''">
                        <!-- en français -->
                        <country>
                            <xsl:attribute name="key">
                                <xsl:value-of select="$testCountry"/>
                            </xsl:attribute>
                           <xsl:call-template name="normalizeISOCountryNameFR">
                                <xsl:with-param name="country" select="translate($avantVirgule,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
                            </xsl:call-template>
                        </country>
                        <!-- en anglais -->
                        <country>
                            <xsl:attribute name="key">
                                <xsl:value-of select="$testCountry"/>
                            </xsl:attribute>
                            <xsl:call-template name="normalizeISOCountryName">
                                <xsl:with-param name="country" select="translate($avantVirgule,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
                            </xsl:call-template>
                        </country>
                    </xsl:when>
                    <xsl:otherwise>
                        <addrLine>
                            <xsl:value-of select="$avantVirgule"/>
                        </addrLine>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="$apresVirgule !=''">
                    <xsl:call-template name="OpenEdParseAffiliation">
                        <xsl:with-param name="theAffil" select="$apresVirgule"/>
                        <xsl:with-param name="inAddress" select="true()"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>