<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- Feuille de style concernant les données en Jsonxml-->
    
    <!-- lien vers donnée externe grobid -->
    <xsl:param name="grobidPath"/>
    <xsl:variable name ="grobid" select="document($grobidPath)"/>
    
   <xsl:variable name="genreJson">
        <xsl:value-of select="//doc/genre"/>
    </xsl:variable>
    <xsl:variable name="codeGenreJson">
        <xsl:choose>
            <xsl:when test="$genreJson='journal-article'">research-article</xsl:when>
            <xsl:otherwise>other</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="codeLangSubstring">
        <xsl:value-of select="substring-after(//doc/oa_locations[1]/url,'lang=')"/>
    </xsl:variable>
    <xsl:variable name="codeLangBefore">
        <xsl:value-of select="substring-before($codeLangSubstring,'&amp;format')"/>
    </xsl:variable>
    <xsl:variable name="codeLangJson">
        <xsl:choose>
            <xsl:when test="//doc/glutton/language">
                <xsl:value-of select="/doc/glutton/language"/>
            </xsl:when>
            <xsl:when test="$codeLangBefore !=''">
                <xsl:value-of select="$codeLangBefore"/>
            </xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    <!-- ******************* TRAITEMENT PRINCIPAL ******************************-->
    <xsl:template match="text()">
        <xsl:value-of select="normalize-space(translate(., '&#9;&#13;&#10;&#133;&#8232;&#8233;&#8234;&#8235;&#8236;&#8237;', ''))"/>
    </xsl:template>
     
    <xsl:template match="doc">
        <TEI  xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="xml:lang" select="$codeLangJson"/>
            <teiHeader>
                <fileDesc>
                    <!-- SG - titre brut -->
                    <titleStmt>
            <xsl:apply-templates select="//doc/title"/>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <publisher>
                            <xsl:apply-templates select="//doc/publisher" mode="json"/>
                        </publisher>
                        <availability>
                            <xsl:attribute name="status">free</xsl:attribute>
                            <licence>cc-by</licence>
                        </availability>
                        <date type="published" when="{//doc/year}"/>
                    </publicationStmt>
                    <notesStmt>
                        <note type="content-type">
                            <xsl:choose>
                                <xsl:when test="$genreJson">
                                    <xsl:attribute name="subtype">
                                        <xsl:value-of select="$genreJson"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="source">
                                        <xsl:text>journal-article</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="scheme">
                                        <xsl:value-of select="$codeGenreArk"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$genreJson"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="subtype">other</xsl:attribute>
                                    <xsl:attribute name="source">N/A</xsl:attribute>
                                    <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:attribute>
                                    <xsl:text>other</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </note>
                        <note type="publication-type" source="journal" subtype="journal" scheme="https://publication-type.data.istex.fr/ark:/67375/JMC-0GLKJH51-B">journal</note>
                    </notesStmt>
                    <sourceDesc>
                        <biblStruct type="article">
                            <analytic>
                                <xsl:apply-templates select="//doc/title"/>
                                <!-- auteurs -->
                                <xsl:if test="//doc/z_authors !='null'">
                                    <xsl:apply-templates select="//doc/z_authors"/>
                                </xsl:if>
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
                                <!-- identifiants niveau article -->
                                <xsl:apply-templates select="/doc/id"/>
                                <xsl:apply-templates select="/doc/doi"/>
                                <xsl:apply-templates select="/doc/glutton/URL" mode="json"/>
                                <xsl:apply-templates select="/doc/glutton/link/URL" mode="json"/>
                                <xsl:apply-templates select="//glutton/reference-count"/>
                            </analytic>
                            <monogr>
                                <title level="m" type="main">
                                    <xsl:apply-templates select="/doc/journal_name"/>
                                </title>
                                <xsl:apply-templates select="/doc/glutton/short-container-title"/>
                                <!-- identifiant niveau journal -->
                                <xsl:apply-templates select="/doc/journal_issns"/>
                                <imprint>
                                    <publisher>
                                        <xsl:apply-templates select="//doc/publisher" mode="json"/>
                                    </publisher>
                                    <date type="published" when="{//doc/year}"/>
                                    <xsl:if test="/doc/glutton/issued/date-parts[2]">
                                        <biblScope unit="vol">
                                                <xsl:value-of select="/doc/glutton/issued/date-parts[2]"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:apply-templates select="/doc/glutton/issue"/>
                                    <!-- pagination -->
                                    <xsl:apply-templates select="/doc/glutton/page"/>
                                </imprint>
                            </monogr>
                        </biblStruct>
                    </sourceDesc>
                </fileDesc>
                <xsl:call-template name="insertVersion"/>
                <profileDesc>
                    <!--  reprise des abstracts depuis les données GROBID-->
                    <xsl:if test ="$grobid//tei:TEI/tei:teiHeader/tei:profileDesc/tei:abstract !=''">
                        <xsl:copy-of select="$grobid//tei:TEI/tei:teiHeader/tei:profileDesc/tei:abstract"/>
                    </xsl:if>
                    <!-- reprise des mots clés depuis les données GROBID-->
                    <xsl:if test ="$grobid//tei:TEI/tei:teiHeader/tei:profileDesc/tei:textClass !=''">
                        <xsl:copy-of select="$grobid//tei:TEI/tei:teiHeader/tei:profileDesc/tei:textClass"/>
                    </xsl:if>
                    <langUsage>
                        <language>
                            <xsl:attribute name="ident">
                                <xsl:value-of select="$codeLangJson"/>
                            </xsl:attribute>
                        </language>
                    </langUsage>
                </profileDesc>
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
                </revisionDesc>
            </teiHeader>
   
            <xsl:choose>
                <!-- reprise du body et du back dans le tei GROBID en format TEI-->
                <xsl:when test ="$grobid//tei:TEI/tei:text !=''">
                    <xsl:copy-of select="$grobid//tei:TEI/tei:text"/>
                </xsl:when>
                <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                    <text>
                        <body>
                            <div>
                                <p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
                            </div>
                        </body>
                    </text>
                </xsl:when>
                <xsl:otherwise>
                    <text>
                        <body>
                            <div><p></p></div>
                        </body>
                    </text>
                </xsl:otherwise>
            </xsl:choose>
        </TEI>
    </xsl:template>
    
    <!-- ***********************Début des templates d'appel *************************-->
<!-- table des auteurs -->
    <xsl:template match="z_authors">
        <xsl:for-each select="given">
            <xsl:variable name="i" select="position()-1"/>
            <xsl:variable name="authorNumber">
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
            </xsl:variable>
            <author>
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="$authorNumber"/>
                </xsl:attribute>
                <persName>
                    <forename type="first">
                    <xsl:value-of select="."/>
                    </forename>
                    <surname>
                    <xsl:value-of select="following-sibling::family[1]"/>
                    </surname>
                <xsl:if test="following-sibling::affiliation[1]/name !=''">
                    <affiliation>
                        <xsl:value-of select="following-sibling::affiliation[1]/name"/>
                    </affiliation>
                </xsl:if>
                    <roleName>author</roleName>
                </persName>
            </author>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="publisher" mode="json">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- dateIssued -->
    <xsl:template match="year">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- titre du journal -->
    <xsl:template match="journal_name">
        <title level="m" type="main">
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    
    <xsl:template match="short-container-title">
        <title level="m" type="abbreviated">
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    
    <xsl:template match="journal_issns">
        <idno>
            <xsl:attribute name="type">ISSN</xsl:attribute>
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    
    <xsl:template match="id">
        <idno>
            <xsl:attribute name="type">ArticleID</xsl:attribute>
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="URL" mode="json"> 
        <idno>
            <xsl:choose>
                <xsl:when test="parent::glutton">
                    <xsl:attribute name="type">URLdoi</xsl:attribute> 
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="type">URLpdf</xsl:attribute> 
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:apply-templates/> 
        </idno>
    </xsl:template>
    
    <xsl:template match="reference-count"> 
        <idno type="ref-count" >
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    
    <xsl:template match="page"> 
        <xsl:choose>
            <xsl:when test="contains(.,'-')">
                <biblScope unit="page" from="{substring-before(.,'-')}">
                    <xsl:value-of select="substring-before(.,'-')"/>
                </biblScope>
                <biblScope unit="page" to="{substring-after(.,'-')}">
                    <xsl:value-of select="substring-after(.,'-')"/>
                </biblScope>
            </xsl:when>
            <xsl:when test=".!=''">
                <biblScope unit="page" from="{.}">
                    <xsl:value-of select="."/>
                </biblScope>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
