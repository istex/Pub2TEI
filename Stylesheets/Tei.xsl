<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- Feuille de style concernant les données:
    - DROZ
    - Open Edition Revues
    - Scielo
    -->
   
    <xsl:variable name="idnoUrl" select="string(/tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno[@type='url'])"/>
   
    <xsl:template match="tei:TEI">
        <TEI xsi:noNamespaceSchemaLocation="https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd" xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:apply-templates select="tei:teiHeader"/>
            <xsl:apply-templates select="tei:text"/>
        </TEI>
    </xsl:template>
    <xsl:template match="tei:teiHeader">
        <teiHeader>
            <fileDesc>
                <xsl:apply-templates select="tei:fileDesc"/>
                <xsl:if test="contains(.,'Droz')">
                    <!-- genre -->
                    <notesStmt>
                        <note type="content-type">
                            <xsl:attribute name="subtype">
                                <xsl:choose>
                                    <xsl:when test="contains(//tei:idno[@type='nom_pdf'],'body')">chapter</xsl:when>
                                    <xsl:otherwise>other</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:attribute name="source">
                                <xsl:choose>
                                    <xsl:when test="contains(//tei:idno[@type='nom_pdf'],'body')">body</xsl:when>
                                    <xsl:when test="contains(//tei:idno[@type='nom_pdf'],'front')">front</xsl:when>
                                    <xsl:when test="contains(//tei:idno[@type='nom_pdf'],'home')">home</xsl:when>
                                    <xsl:when test="contains(//tei:idno[@type='nom_pdf'],'home')">home</xsl:when>
                                    <xsl:when test="contains(//tei:idno[@type='nom_pdf'],'back')">back</xsl:when>
                                    <xsl:otherwise>cover</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:attribute name="scheme">
                                <xsl:choose>
                                    <xsl:when test="contains(//tei:idno[@type='nom_pdf'],'body')">https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6</xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="contains(//tei:idno[@type='nom_pdf'],'body')">chapter</xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>other</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </note>
                        <xsl:choose>
                            <xsl:when test="//tei:seriesStmt/tei:title[string-length()&gt; 0]">
                                <note type="publication-type" subtype="book-series" scheme="https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z"
                                    >book-series</note>
                            </xsl:when>
                            <xsl:otherwise>
                                <note type="publication-type" subtype="book" scheme="https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F"
                                    >book</note>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:copy-of select="//tei:fileDesc/tei:notesStmt/tei:note"/>
                    </notesStmt>
                </xsl:if>
                <sourceDesc>
                    <biblStruct>
                        <xsl:attribute name="type">
                            <xsl:choose>
                                <xsl:when test="contains(.,'Droz')">inbook</xsl:when>
                                <xsl:when test="$idnoUrl = 'http://journals.openedition.org/anglophonia/1027'">editorial</xsl:when>
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
                                                        <xsl:choose>
                                                            <xsl:when test="contains(@key,', ')">
                                                                <forename type="first">
                                                                    <xsl:value-of select="substring-after(@key,', ')"/>
                                                                </forename>
                                                                <surname>
                                                                    <xsl:value-of select="normalize-space(substring-before(@key,','))"/>
                                                                </surname>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:choose>
                                                                    <xsl:when test="contains(.,', ')">
                                                                        <forename type="first">
                                                                            <xsl:value-of select="substring-after(.,', ')"/>
                                                                        </forename>
                                                                        <surname>
                                                                            <xsl:value-of select="normalize-space(substring-before(.,','))"/>
                                                                        </surname>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <surname>
                                                                            <xsl:apply-templates/>
                                                                        </surname>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
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
                                                    <xsl:choose>
                                                        <xsl:when test="contains(@key,', ')">
                                                            <forename type="first">
                                                                <xsl:value-of select="substring-after(@key,', ')"/>
                                                            </forename>
                                                            <surname>
                                                                <xsl:value-of select="normalize-space(substring-before(@key,','))"/>
                                                            </surname>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:choose>
                                                                <xsl:when test="contains(.,', ')">
                                                                    <forename type="first">
                                                                        <xsl:value-of select="substring-after(.,', ')"/>
                                                                    </forename>
                                                                    <surname>
                                                                        <xsl:value-of select="normalize-space(substring-before(.,','))"/>
                                                                    </surname>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <surname>
                                                                        <xsl:apply-templates/>
                                                                    </surname>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </persName>
                                            </author>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:if>
                                </xsl:when>
                                <!-- scielo -->
                                <xsl:when test="contains(.,'[NO TITLE AVAILABLE]')">
                                    <title/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:copy-of select="tei:fileDesc/tei:titleStmt/tei:title"/>
                                    <xsl:apply-templates select="tei:fileDesc/tei:titleStmt/tei:author"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <!-- autre éditeur -->
                            <xsl:copy-of select="tei:fileDesc/tei:titleStmt/tei:editor"/>
                            <xsl:copy-of select="tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:titleStmt/tei:respStmt"/>
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
                            <xsl:copy-of select="tei:sourceDesc/tei:biblStruct/tei:monogr/tei:idno[@type='doi']"/>
                            <xsl:copy-of select="tei:sourceDesc/tei:biblStruct/tei:monogr/tei:idno[@type='url']"/>
                            <xsl:copy-of select="tei:fileDesc/tei:publicationStmt/tei:idno[@type='url']"/>
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
                                    <xsl:choose>
                                        <xsl:when test="//tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:idno[@type='EAN-13']">
                                            <idno type="ISBN">
                                                <xsl:value-of select="//tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:idno[@type='EAN-13']"/>
                                            </idno>
                                        </xsl:when>
                                        <xsl:when test="//tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:idno[@type='ISBN-13'] and not(contains(//tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:idno[@type='ISBN-13'],'-'))">
                                            <idno type="ISBN">
                                                <xsl:value-of select="//tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:idno[@type='ISBN-13']"/>
                                            </idno>
                                        </xsl:when>
                                        <xsl:when test="//tei:publicationStmt/tei:idno[@type='nom_pdf']">
                                            <idno type="ISBN">
                                                <xsl:value-of select="substring-before(//tei:publicationStmt/tei:idno[@type='nom_pdf'],'_')"/>
                                            </idno>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:copy-of select="//tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:idno"/>
                                    <xsl:if test="//tei:sourceDesc/tei:bibl/tei:author">
                                        <xsl:for-each select="//tei:sourceDesc/tei:bibl/tei:author">
                                            <author>
                                                <persName>
                                                    <xsl:choose>
                                                        <xsl:when test="contains(@key,', ')">
                                                            <forename type="first">
                                                                <xsl:value-of select="substring-after(@key,', ')"/>
                                                            </forename>
                                                            <surname>
                                                                <xsl:value-of select="normalize-space(substring-before(@key,','))"/>
                                                            </surname>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:choose>
                                                                <xsl:when test="contains(.,', ')">
                                                                    <forename type="first">
                                                                        <xsl:value-of select="substring-after(.,', ')"/>
                                                                    </forename>
                                                                    <surname>
                                                                        <xsl:value-of select="normalize-space(substring-before(.,','))"/>
                                                                    </surname>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <surname>
                                                                        <xsl:apply-templates/>
                                                                    </surname>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
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
                                                    <xsl:choose>
                                                        <xsl:when test="contains(@key,', ')">
                                                            <forename type="first">
                                                                <xsl:value-of select="substring-after(@key,', ')"/>
                                                            </forename>
                                                            <surname>
                                                                <xsl:value-of select="normalize-space(substring-before(@key,','))"/>
                                                            </surname>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:choose>
                                                                <xsl:when test="contains(.,', ')">
                                                                    <forename type="first">
                                                                        <xsl:value-of select="substring-after(.,', ')"/>
                                                                    </forename>
                                                                    <surname>
                                                                        <xsl:value-of select="normalize-space(substring-before(.,','))"/>
                                                                    </surname>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <surname>
                                                                        <xsl:apply-templates/>
                                                                    </surname>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </persName>
                                            </editor>
                                        </xsl:for-each>
                                    </xsl:if>
                                <imprint>
                                    <xsl:copy-of select="//tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:publisher"/>
                                    <xsl:copy-of select="//tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:pubPlace"/>
                                    <xsl:call-template name="fixAndCopyDate">
                                        <xsl:with-param name="date" select="//tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:date"/>
                                    </xsl:call-template>
                                   <!-- ajout des tomaisons quand seulement présente dans le titre de l'ouvrage -->
                            <xsl:choose>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600031660'
                                    or //tei:idno[@type='EAN-13']='9782600029896'
                                    or //tei:idno[@type='EAN-13']='9782600029827'
                                    or //tei:idno[@type='EAN-13']='9782600014465'
                                    or //tei:idno[@type='EAN-13']='9782600032636'
                                    or //tei:idno[@type='EAN-13']='9782600032186'
                                    or //tei:idno[@type='EAN-13']='9782600031592'
                                    or //tei:idno[@type='EAN-13']='9782600031981'
                                    or //tei:idno[@type='EAN-13']='9782600006750'
                                    or //tei:idno[@type='EAN-13']='9782600001670'
                                    or //tei:idno[@type='EAN-13']='9782600030564'">
                                    <biblScope unit="volume">Tome I</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600031998'
                                    or //tei:idno[@type='EAN-13']='9782600032629'
                                    or //tei:idno[@type='EAN-13']='9782600000130'
                                    or //tei:idno[@type='EAN-13']='9782600029919'
                                    or //tei:idno[@type='EAN-13']='9782600030854'
                                    or //tei:idno[@type='EAN-13']='9782600019408'
                                    or //tei:idno[@type='EAN-13']='9782600032643'
                                    or //tei:idno[@type='EAN-13']='9782600029940'
                                    or //tei:idno[@type='EAN-13']='9782600019712'
                                    or //tei:idno[@type='EAN-13']='9782600031998'
                                    or //tei:idno[@type='EAN-13']='9782600009003'
                                    or //tei:idno[@type='EAN-13']='9782600006385'
                                    or //tei:idno[@type='EAN-13']='9782600031431'">
                                    <biblScope unit="volume">Tome II</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600004275'
                                    or //tei:idno[@type='EAN-13']='9782600029964'
                                    or //tei:idno[@type='EAN-13']='9782600032650'
                                    or //tei:idno[@type='EAN-13']='9782600019729'
                                    or //tei:idno[@type='EAN-13']='9782600030298'
                                    or //tei:idno[@type='EAN-13']='9782600009263'
                                    or //tei:idno[@type='EAN-13']='9782600009393'">
                                    <biblScope unit="volume">Tome III</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600030045'
                                    or //tei:idno[@type='EAN-13']='9782600019736'
                                    or //tei:idno[@type='EAN-13']='9782600030526'
                                    or //tei:idno[@type='EAN-13']='9782600012973'
                                    or //tei:idno[@type='EAN-13']='9782600011693'
                                    or //tei:idno[@type='EAN-13']='9782600012867'">
                                    <biblScope unit="volume">Tome IV</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600030199'
                                    or //tei:idno[@type='EAN-13']='9782600019743'
                                    or //tei:idno[@type='EAN-13']='9782600030663'
                                    or //tei:idno[@type='EAN-13']='9782600014694'
                                    or //tei:idno[@type='EAN-13']='9782600014298'
                                    or //tei:idno[@type='EAN-13']='9782600029995'">
                                    <biblScope unit="volume">Tome V</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600030328'
                                    or //tei:idno[@type='EAN-13']='9782600032131'
                                    or //tei:idno[@type='EAN-13']='9782600019750'
                                    or //tei:idno[@type='EAN-13']='9782600030922'
                                    or //tei:idno[@type='EAN-13']='9782600015677'
                                    or //tei:idno[@type='EAN-13']='9782600030038'">
                                    <biblScope unit="volume">Tome VI</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600030519'
                                    or //tei:idno[@type='EAN-13']='9782600019767'
                                    or //tei:idno[@type='EAN-13']='9782600031097'
                                    or //tei:idno[@type='EAN-13']='9782600017237'
                                    or //tei:idno[@type='EAN-13']='9782600030151'">
                                    <biblScope unit="volume">Tome VII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600030601'
                                    or //tei:idno[@type='EAN-13']='9782600019774'
                                    or //tei:idno[@type='EAN-13']='9782600031264'
                                    or //tei:idno[@type='EAN-13']='9782600017787'
                                    or //tei:idno[@type='EAN-13']='9782600015134'
                                    or //tei:idno[@type='EAN-13']='9782600030229'">
                                    <biblScope unit="volume">Tome VIII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600030762'
                                    or //tei:idno[@type='EAN-13']='9782600019781'
                                    or //tei:idno[@type='EAN-13']='9782600031479'
                                    or //tei:idno[@type='EAN-13']='9782600018470'
                                    or //tei:idno[@type='EAN-13']='9782600030366'">
                                    <biblScope unit="volume">Tome IX</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600030939'
                                    or //tei:idno[@type='EAN-13']='9782600019798'
                                    or //tei:idno[@type='EAN-13']='9782600031639'
                                    or //tei:idno[@type='EAN-13']='9782600047104'">
                                    <biblScope unit="volume">Tome X</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600031066'
                                    or //tei:idno[@type='EAN-13']='9782600019804'
                                    or //tei:idno[@type='EAN-13']='9782600031851'
                                    or //tei:idno[@type='EAN-13']='9782600030540'">
                                    <biblScope unit="volume">Tome XI</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600031233'
                                    or //tei:idno[@type='EAN-13']='9782600019811'
                                    or //tei:idno[@type='EAN-13']='9782600000765'">
                                    <biblScope unit="volume">Tome XII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600031400'
                                    or //tei:idno[@type='EAN-13']='9782600019828'
                                    or //tei:idno[@type='EAN-13']='9782600006514'
                                    or //tei:idno[@type='EAN-13']='9782600030588'">
                                    <biblScope unit="volume">Tome XIII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600031530'
                                    or //tei:idno[@type='EAN-13']='9782600019835'
                                    or //tei:idno[@type='EAN-13']='9782600016438'
                                    or //tei:idno[@type='EAN-13']='9782600030748'">
                                    <biblScope unit="volume">Tome XIV</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600031653'
                                    or //tei:idno[@type='EAN-13']='9782600019842'
                                    or //tei:idno[@type='EAN-13']='9782600030878'">
                                    <biblScope unit="volume">Tome XV</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019859'
                                    or //tei:idno[@type='EAN-13']='9782600001625'">
                                    <biblScope unit="volume">Tome XVI</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019866'
                                    or //tei:idno[@type='EAN-13']='9782600000253'">
                                    <biblScope unit="volume">Tome XVII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019873'
                                    or //tei:idno[@type='EAN-13']='9782600031172'
                                    or //tei:idno[@type='EAN-13']='9782600000833'">
                                    <biblScope unit="volume">Tome XVIII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019880'
                                    or //tei:idno[@type='EAN-13']='9782600001625'">
                                    <biblScope unit="volume">Tome XIX</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019897'
                                    or //tei:idno[@type='EAN-13']='9782600002493'">
                                    <biblScope unit="volume">Tome XX</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019903'
                                    or //tei:idno[@type='EAN-13']='9782600003216'">
                                    <biblScope unit="volume">Tome XXI</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019910'
                                    or //tei:idno[@type='EAN-13']='9782600031394'
                                    or //tei:idno[@type='EAN-13']='9782600004015'">
                                    <biblScope unit="volume">Tome XXII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019927'
                                    or //tei:idno[@type='EAN-13']='9782600004879'">
                                    <biblScope unit="volume">Tome XXIII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019934'
                                    or //tei:idno[@type='EAN-13']='9782600006941'">
                                    <biblScope unit="volume">Tome XXIV</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019941'
                                    or //tei:idno[@type='EAN-13']='9782600031646'
                                    or //tei:idno[@type='EAN-13']='9782600008877'">
                                    <biblScope unit="volume">Tome XXV</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019958'
                                    or //tei:idno[@type='EAN-13']='9782600009256'">
                                    <biblScope unit="volume">Tome XXVI</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019965'
                                    or //tei:idno[@type='EAN-13']='9782600010191'">
                                    <biblScope unit="volume">Tome XXVII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019972'
                                    or //tei:idno[@type='EAN-13']='9782600010818'">
                                    <biblScope unit="volume">Tome XXVIII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019989'
                                    or //tei:idno[@type='EAN-13']='9782600031905'
                                    or //tei:idno[@type='EAN-13']='9782600011686'">
                                    <biblScope unit="volume">Tome XXIX</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019996'
                                    or //tei:idno[@type='EAN-13']='9782600000611'
                                    or //tei:idno[@type='EAN-13']='9782600012362'">
                                    <biblScope unit="volume">Tome XXX</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020008'
                                    or //tei:idno[@type='EAN-13']='9782600012775'">
                                    <biblScope unit="volume">Tome XXXI</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020015'
                                    or //tei:idno[@type='EAN-13']='9782600013307'">
                                    <biblScope unit="volume">Tome XXXII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020022'
                                    or //tei:idno[@type='EAN-13']='9782600014335'">
                                    <biblScope unit="volume">Tome XXXIII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020039'
                                    or //tei:idno[@type='EAN-13']='9782600014687'">
                                    <biblScope unit="volume">Tome XXXIV</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020046'
                                    or //tei:idno[@type='EAN-13']='9782600002615'
                                    or //tei:idno[@type='EAN-13']='9782600015509'">
                                    <biblScope unit="volume">Tome XXXV</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020053'
                                    or //tei:idno[@type='EAN-13']='9782600015912'
                                    or //tei:idno[@type='EAN-13']='9782600018128'">
                                    <biblScope unit="volume">Tome XXXVI</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020060'
                                    or //tei:idno[@type='EAN-13']='9782600017411'">
                                    <biblScope unit="volume">Tome XXXVII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020077'">
                                    <biblScope unit="volume">Tome XXXVIII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020084'
                                    or //tei:idno[@type='EAN-13']='9782600004787'
                                    or //tei:idno[@type='EAN-13']='9782600018593'">
                                    <biblScope unit="volume">Tome XXXIX</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020091'">
                                    <biblScope unit="volume">Tome XL</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020107'">
                                    <biblScope unit="volume">Tome XLI</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020114'">
                                    <biblScope unit="volume">Tome XLII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020138'">
                                    <biblScope unit="volume">Tome XLIII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020145'">
                                    <biblScope unit="volume">Tome XLIV</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020152'">
                                    <biblScope unit="volume">Tome XLV</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600019682'">
                                    <biblScope unit="volume">Tome XLVI</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020169'">
                                    <biblScope unit="volume">Tome XLVII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020176'">
                                    <biblScope unit="volume">Tome XLVIII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020183'">
                                    <biblScope unit="volume">Tome XLIX</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020190'
                                    or //tei:idno[@type='EAN-13']='9782600014267'">
                                    <biblScope unit="volume">Tome L</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020206'">
                                    <biblScope unit="volume">Tome LI</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020213'
                                    or //tei:idno[@type='EAN-13']='9782600008693'">
                                    <biblScope unit="volume">Tome LII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020220'">
                                    <biblScope unit="volume">Tome LIII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020237'
                                    or //tei:idno[@type='EAN-13']='9782600010467'">
                                    <biblScope unit="volume">Tome LIV</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020244'
                                    or //tei:idno[@type='EAN-13']='9782600011105'">
                                    <biblScope unit="volume">Tome LV</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020251'
                                    or //tei:idno[@type='EAN-13']='9782600012065'">
                                    <biblScope unit="volume">Tome LVI</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020268'">
                                    <biblScope unit="volume">Tome LVII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600020275'">
                                    <biblScope unit="volume">Tome LVIII-LVIX</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600018920'">
                                    <biblScope unit="volume">Tome XL</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600047197'">
                                    <biblScope unit="volume">Tome XLI</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600047661'">
                                    <biblScope unit="volume">Tome XLII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600058100'">
                                    <biblScope unit="volume">Tome XLIII</biblScope>
                                </xsl:when>
                                <xsl:when test="//tei:idno[@type='EAN-13']='9782600006767'
                                    or //tei:idno[@type='EAN-13']='9782600002226'
                                    or //tei:idno[@type='EAN-13']='9782600015929'">
                                    <biblScope unit="volume">2</biblScope>
                                </xsl:when>
                            </xsl:choose> 
                                    
                                    <xsl:if test="//tei:sourceDesc/tei:biblFull/tei:seriesStmt/tei:title[@type='sub-num']">
                                        <biblScope unit="issue">
                                            <xsl:value-of select="//tei:sourceDesc/tei:biblFull/tei:seriesStmt/tei:title[@type='sub-num']"/>
                                        </biblScope>
                                    </xsl:if>
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
                                    <xsl:variable name="eissn" select="string(//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:idno[@type = 'eISSN'])"/>
                                    <xsl:for-each select="//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title">
                                        <xsl:choose>
                                            <xsl:when test="@level = 'j'">
                                                <title level="j">
                                                    <xsl:choose>
                                                        <xsl:when test="$eissn = '1724-2150'">Mélanges de l’École française de Rome - Moyen Âge</xsl:when>
                                                        <xsl:when test="$eissn = '1724-2142'">Mélanges de l’École française de Rome - Italie et Méditerranée modernes et contemporaines</xsl:when>
                                                        <xsl:when test="$eissn = '1957-7761'">Cahiers de civilisation espagnole contemporaine (de 1808 au temps présent)</xsl:when>
                                                        <xsl:when test="$eissn = '2263-0856'">Revue française des sciences de l’information et de la communication</xsl:when>
                                                        <xsl:when test="$eissn = '1492-8442'">VertigO - la revue électronique en sciences de l’environnement</xsl:when>
                                                        <xsl:otherwise><xsl:value-of select="string(.)"/></xsl:otherwise>
                                                    </xsl:choose>
                                                </title>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="."/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                    <xsl:copy-of select="//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:idno"/>
                                    <imprint>
                                    <xsl:copy-of select="//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:publisher"/>
                                    <xsl:call-template name="fixAndCopyDate">
                                        <xsl:with-param name="date" select="//tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:date"/>
                                    </xsl:call-template>
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
                                            <xsl:when test="contains(//tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='page'],'-')">
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
                                                <xsl:copy-of select="//tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='page']"/>
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
                                            <xsl:call-template name="fixAndCopyDate">
                                                <xsl:with-param name="date" select="//tei:fileDesc/tei:sourceDesc/tei:biblFull/tei:publicationStmt/tei:date"/>
                                            </xsl:call-template>
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
                                        <xsl:for-each select="//tei:sourceDesc/tei:biblFull/tei:seriesStmt/tei:title">
                                            <xsl:choose>
                                                <xsl:when test="@type='main'">
                                                    <title level="s" type="main">
                                                    <xsl:value-of select=".[@type='main']"/>
                                                    </title>
                                                </xsl:when>
                                                <xsl:when test="@type='sub'">
                                                    <title level="s" type="sub">
                                                        <xsl:value-of select=".[@type='sub']"/>
                                                    </title>
                                                </xsl:when>
                                                <xsl:when test="@type='num'">
                                                    <biblScope unit="issue">
                                                        <xsl:value-of select=".[@type='num']"/>
                                                    </biblScope>
                                                </xsl:when>
                                                <xsl:when test="@type='sub-num'">
                                                    <biblScope unit="tome">
                                                        <xsl:value-of select=".[@type='sub-num']"/>
                                                    </biblScope>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:copy-of select="."/> 
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
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
                        <!-- OpenEdition Journals nettoyage de données erronnées type langue --> 
                        <xsl:choose>
                            <xsl:when test=" contains($idnoUrl,'journals.openedition.org') and (
                                ends-with($idnoUrl,'pyramides/1556')
                                or ends-with($idnoUrl,'textyles/2104') 
                                or ends-with($idnoUrl,'textyles/1712') 
                                or ends-with($idnoUrl,'rsr/365')
                                )">
                                <langUsage>
                                    <language ident="fr">fr</language>
                                </langUsage>
                            </xsl:when>
                            <xsl:when test="$idnoUrl = 'http://journals.openedition.org/ateliers/10883'">
                                <langUsage>
                                    <language ident="">way</language>
                                </langUsage>
                            </xsl:when>
                            <xsl:when test="$idnoUrl = 'http://journals.openedition.org/primatologie/1932'
                                or $idnoUrl = 'http://journals.openedition.org/primatologie/1561'">
                                <langUsage>
                                    <language ident="fr">fr</language>
                                </langUsage>
                            </xsl:when>
                            <!-- liste des documents contenant 2 langues -->
                            <xsl:when test="$idnoUrl = 'http://journals.openedition.org/primatologie/9047'
                                or $idnoUrl = 'http://journals.openedition.org/primatologie/3846'
                                or $idnoUrl = 'http://journals.openedition.org/primatologie/5996'">
                                <langUsage>
                                    <language ident="fr">fr</language>
                                    <language ident="en">en</language>
                                </langUsage>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="//tei:langUsage"/>
                            </xsl:otherwise>
                        </xsl:choose>

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
                <!--Droz  nettoyage de données erronées de la part de l'éditeur-->
                <xsl:when test="//tei:idno[@type='EAN-13']='9782600001922'">
                    <profileDesc>
                        <abstract xml:lang="de">
                            <xsl:copy-of select="//tei:abstract/tei:p"/>
                        </abstract>
                        <xsl:copy-of select="//tei:creation"/>
                        <langUsage>
                            <language ident="la">Latin</language>
                        </langUsage>
                        <xsl:copy-of select="//tei:textClass"/>
                    </profileDesc>
                </xsl:when>
                <xsl:when test="//tei:idno[@type='EAN-13']='9782600000215'">
                    <profileDesc>
                        <abstract xml:lang="de">
                            <xsl:copy-of select="//tei:abstract/tei:p"/>
                        </abstract>
                        <xsl:copy-of select="//tei:creation"/>
                        <xsl:copy-of select="//tei:langUsage"/>
                        <xsl:copy-of select="//tei:textClass"/>
                    </profileDesc>
                </xsl:when>
                <!-- Droz nettoyage de données erronnées type langue 
                    <langUsage>
                       <language ident="la">Lao People's Democratic Republic</language>
                    </langUsage>
                    au lieu de latin -->
                <xsl:when test="//tei:langUsage/tei:language[@ident='la']">
                    <profileDesc>
                            <xsl:copy-of select="//tei:abstract"/>
                        <xsl:copy-of select="//tei:creation"/>
                        <langUsage>
                            <language ident="la">Latin</language>
                        </langUsage>
                        <xsl:copy-of select="//tei:textClass"/>
                    </profileDesc>
                </xsl:when>
                <xsl:when test="not(//tei:profileDesc/tei:textClass/tei:keywords)">
                    <profileDesc>
                        <xsl:copy-of select="//tei:langUsage"/>
                        <xsl:copy-of select="//tei:abstract"/>
                    </profileDesc>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="//tei:profileDesc" />
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
            <xsl:choose>
                <xsl:when test="tei:p">
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                    <term>
                        <xsl:apply-templates/>
                    </term>
                </xsl:otherwise>
            </xsl:choose>
        </item>
    </xsl:template>
    <xsl:template match="tei:text">
        <text>
            <xsl:if test="//tei:text/tei:front/tei:div[@type='ack'][string-length()&gt; 0]">
                <front>
                    <xsl:copy-of select="//tei:text/tei:front/tei:div[@type='ack']"/>
                </front>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="//tei:text/tei:body !=''">
                    <xsl:copy-of select="//tei:text/tei:body"/>
                </xsl:when>
                <xsl:otherwise><body><div><p/></div></body></xsl:otherwise>
            </xsl:choose>
            <xsl:copy-of select="//tei:text/tei:back"/>
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
                <!-- scielo -->
                <xsl:when test="contains(.,'[NO TITLE AVAILABLE]')">
                    <title/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="tei:title"/>
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
                <xsl:when test="//tei:idno[@type='nom_pdf']='9782600032421_body-2-1.pdf'"><xsl:text>CHAPITRE XVI - La Poésie mondaine pendant les premières guerres civiles</xsl:text></xsl:when>
                <xsl:when test="//tei:idno[@type='nom_pdf']='9782600018890_back-5.pdf'"><xsl:text>APPENDIX</xsl:text></xsl:when>
                <xsl:when test=".=''"><xsl:text>--------------------- NO TITLE ---------------------</xsl:text></xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </title>
    </xsl:template>
    <xsl:template match="tei:title" mode="mono">
        <xsl:variable name="recupTitMono">
            <xsl:value-of select="substring-after(//tei:idno[@type='url'],'http://books.openedition.org/')"/>
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
    <xsl:variable name="publishersString">
        <xsl:for-each select="tei:publisher"><xsl:value-of select="."/> - </xsl:for-each>
    </xsl:variable>
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
                <xsl:when test="contains(string(tei:availability/tei:licence),'Droz')">
                    <availability status="{tei:availability/@status}">
                        <xsl:copy-of select="tei:availability/tei:licence"/>
                        <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-984PFWH6-T">droz</p>
                    </availability>
                </xsl:when>
                <xsl:when test="contains($publishersString,'Librairie Droz')">
                    <availability status="restricted">
                        <licence>Copyright <date><xsl:value-of select="tei:date/@when"/></date> Librairie Droz S.A.</licence>
                        <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-984PFWH6-T">droz</p>
                    </availability>
                </xsl:when>
                <xsl:when test="tei:availability/tei:p[string-length(normalize-space(text())) &gt; 0]">
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
        <xsl:call-template name="fixAndCopyDate">
            <xsl:with-param name="date" select="."/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="tei:author">
        <author>
            <xsl:copy-of select="tei:persName"/>
            <!-- reprise des adresses email -->
            <xsl:apply-templates select="tei:affiliation" mode="mail"/>
            <!-- affiliation découpée et structurée -->
            <xsl:apply-templates select="tei:affiliation"/>
        </author>
    </xsl:template>
    
    <xsl:template match="tei:affiliation" mode="mail">
        <xsl:for-each select="tei:hi[@rend='author-email']">
            <email>
                <xsl:value-of select="normalize-space(.)"/>
            </email>
        </xsl:for-each>
        <xsl:for-each select="text()">
            <xsl:if test="contains(.,'Courriel')">
                <email>
                    <xsl:value-of select="normalize-space(substring-after(text(),'Courriel : '))"/>
                </email>
            </xsl:if>
        </xsl:for-each>
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
                        <xsl:when test="contains(.,' Courriel')">
                            <xsl:value-of select="normalize-space(substring-before(.,' Courriel'))"/>
                        </xsl:when>
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
    
    <xsl:template name="fixAndCopyDate">
        <xsl:param name="date"/>
        <xsl:variable name="fixedDate">
            <xsl:choose>
                <xsl:when test="ends-with($idnoUrl,'mcv/8237')">2018</xsl:when>
                <xsl:when test="ends-with($idnoUrl,'eps/5530')">2013</xsl:when>
                <xsl:when test="ends-with($idnoUrl,'trace/972')">2013</xsl:when>
                <xsl:when test="ends-with($idnoUrl,'amerika/7001')">2015</xsl:when>
                <xsl:when test="ends-with($idnoUrl,'amerika/6883')">2015</xsl:when>
                <xsl:when test="ends-with($idnoUrl,'sociologies/11660')">2019</xsl:when>
                <xsl:when test="ends-with($idnoUrl,'sociologies/11087')">2019</xsl:when>
                <xsl:when test="ends-with($idnoUrl,'sociologies/11110')">2019</xsl:when>
                <xsl:when test="ends-with($idnoUrl,'resf/1215')">2018</xsl:when>
                <xsl:otherwise><xsl:value-of select="string($date)"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <date>
            <xsl:for-each select="$date/attribute()">
                <xsl:if test="local-name()='when'"><xsl:attribute name="when" select="$fixedDate"/></xsl:if>
                <xsl:if test="local-name()!='when'"><xsl:attribute name="{local-name()}" select="string()"/></xsl:if>
            </xsl:for-each>
            <xsl:value-of select="$fixedDate"/>
        </date>
    </xsl:template>
    
</xsl:stylesheet>
