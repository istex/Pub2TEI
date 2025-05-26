<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- Feuille de style concernant les données en Jsonxml-->
    
    <!-- lien vers donnée externe grobid -->
    <xsl:param name="grobidFulltextEnrichmentPath"/>
    <xsl:variable name ="grobid" select="document($grobidFulltextEnrichmentPath)"/>
    
   <xsl:variable name="genreJson">
        <xsl:value-of select="//doc/genre"/>
    </xsl:variable>
    <xsl:variable name="codeGenreJson">
        <xsl:choose>
            <xsl:when test="$genreJson='journal-article'">research-article</xsl:when>
            <xsl:when test="$genreJson='journal-issue'">research-article</xsl:when>
            <xsl:when test="$genreJson='journal'">research-article</xsl:when>
            <xsl:otherwise>other</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="codeLangSubstring">
        <!-- la langue est contenue dans <oa_locations><url> dans un fragment du lien hypertexte
        "?lang=en"
    parfois dans oa_location position 1, 2, ou...
    je parcours donc toute l'xml afin de la cibler-->
        <xsl:choose>
            <xsl:when test="contains(.,'lang=')">
                <xsl:value-of select="substring-after(.,'lang=')"/>
            </xsl:when>
            <xsl:when test="contains(.,'lng=')">
                <xsl:value-of select="substring-after(.,'lng=')"/>
            </xsl:when>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="codeLangString">
        <!-- Renvoie la sous-chaîne de la position de départ à la longueur spécifiée.
        L'index du premier caractère est 1. 
        Si la longueur est omise, la sous-chaîne est renvoyée de la position de départ à la fin.
 -->
        <xsl:value-of select="substring($codeLangSubstring,1,2)"/>
    </xsl:variable>
    <xsl:variable name="codeLangJson">
        <xsl:choose>
            <xsl:when test="/doc/glutton/language">
                <xsl:value-of select="/doc/glutton/language"/>
            </xsl:when>
            <xsl:when test="$codeLangString !=''">
                <xsl:value-of select="$codeLangString"/>
            </xsl:when>
            <!--<xsl:when test="$grobid//tei:TEI/tei:teiHeader/@xml:lang !=''">
                <xsl:value-of select="$grobid//tei:TEI/tei:teiHeader/@xml:lang"/>
            </xsl:when>-->
        </xsl:choose>
    </xsl:variable>
    
    <!-- ******************* TRAITEMENT PRINCIPAL ******************************-->
    <xsl:template match="text()">
        <xsl:value-of select="normalize-space(translate(., '&#9;&#13;&#10;&#133;&#8232;&#8233;&#8234;&#8235;&#8236;&#8237;', ''))"/>
    </xsl:template>
     
    <xsl:template match="doc">
        <TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="xml:lang" select="$codeLangJson"/>
            <teiHeader>
                <fileDesc>
                    <!-- SG - titre brut -->
                     <titleStmt>
                        <!-- titre de l'article si vide ou [NO TITLE AVAILABLE] prendre le contenu dans les fichiers grobid.tei-->
                        <xsl:choose>
                            <xsl:when test="//doc/title ='[NO TITLE AVAILABLE]'">
                                <xsl:apply-templates select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                            </xsl:when>
                            <xsl:when test="//doc/title !=''">
                                <xsl:apply-templates select="//doc/title"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <xsl:apply-templates select="//doc/publisher" mode="json"/>
                        <availability>
                            <xsl:attribute name="status">free</xsl:attribute>
                            <licence>cc-by</licence>
                        </availability>
                        <xsl:choose>
                            <xsl:when test="//doc/year !=''">
                                <date type="published" when="{//doc/year}">
                                    <xsl:value-of select="//doc/year"/>
                                </date>
                            </xsl:when>
                            <xsl:when test="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published'] !=''">
                                <date type="published" when="{$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published']}">
                                    <xsl:value-of select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published']"/>
                                </date>
                            </xsl:when>
                        </xsl:choose>
                    </publicationStmt>
                    <notesStmt>
                        <note type="content-type">
                            <xsl:choose>
                                <xsl:when test="$genreJson !=''">
                                    <xsl:attribute name="subtype">
                                        <xsl:value-of select="$codeGenreJson"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="source">
                                        <xsl:value-of select="$genreJson"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="scheme">
                                        <xsl:value-of select="$codeGenreArk"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$codeGenreJson"/>
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
                                <xsl:choose>
                                    <xsl:when test="//doc/z_authors !=''">
                                        <xsl:apply-templates select="//doc/z_authors"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:copy-of select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:analytic"/>
                                    </xsl:otherwise>
                                </xsl:choose>
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
                                <xsl:apply-templates select="/doc/glutton/pmid"/>
                                <xsl:apply-templates select="/doc/glutton/pmcid"/>
                                <xsl:apply-templates select="/doc/doi_url"/>
                                <xsl:apply-templates select="/doc/glutton/URL" mode="json"/>
                                <xsl:apply-templates select="/doc/glutton/link/URL" mode="json"/>
                                <xsl:apply-templates select="//glutton/reference-count"/>
                            </analytic>
                            <monogr>
                                <xsl:apply-templates select="/doc/journal_name"/>
                                <!-- titre abrégé -->
                                <xsl:choose>
                                    <xsl:when test="/doc/glutton/short-container-title !=''">
                                        <xsl:apply-templates select="/doc/glutton/short-container-title"/>
                                    </xsl:when>
                                    <xsl:when test="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title[@type='abbrev'] !=''">
                                        <xsl:apply-templates select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title[@type='abbrev']"/>
                                    </xsl:when>
                                </xsl:choose>
                                <!-- identifiant ISSN niveau journal -->
                                <xsl:choose>
                                    <xsl:when test="/doc/glutton/issn-type !=''">
                                        <xsl:apply-templates select="/doc/glutton/issn-type"/>
                                    </xsl:when>
                                    <xsl:when test="/doc/journal_issns !=''">
                                        <xsl:apply-templates select="/doc/journal_issns"/>
                                    </xsl:when>
                                </xsl:choose>
                                <imprint>
                                    <xsl:apply-templates select="//doc/publisher" mode="json"/>
                                    <xsl:choose>
                                        <xsl:when test="//doc/year !=''">
                                            <date type="published" when="{//doc/year}">
                                                <xsl:value-of select="//doc/year"/>
                                            </date>
                                        </xsl:when>
                                        <xsl:when test="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published'] !=''">
                                            <date type="published" when="{$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published']}">
                                                <xsl:value-of select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published']"/>
                                            </date>
                                        </xsl:when>
                                    </xsl:choose>
                                    <!-- volume -->
                                    <xsl:choose>
                                        <xsl:when test="/doc/glutton/volume !=''">
                                            <xsl:apply-templates select="/doc/glutton/volume"/>
                                        </xsl:when>
                                        <xsl:when test="/doc/glutton/issued/date-parts[2]">
                                            <biblScope unit="vol">
                                                <xsl:value-of select="/doc/glutton/issued/date-parts[2]"/>
                                            </biblScope>
                                        </xsl:when>
                                        <xsl:when test="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='volume'] !=''">
                                            <xsl:apply-templates select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='volume']"/>
                                        </xsl:when>
                                    </xsl:choose>
                                    <!-- numéro -->
                                    <xsl:choose>
                                        <xsl:when test="/doc/glutton/issue !=''">
                                            <xsl:apply-templates select="/doc/glutton/issue"/>
                                        </xsl:when>
                                        <xsl:when test="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='issue'] !=''">
                                            <xsl:apply-templates select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='issue']"/>
                                        </xsl:when>
                                    </xsl:choose>
                                    <!-- pagination -->
                                    <xsl:choose>
                                        <xsl:when test="/doc/glutton/page !=''">
                                            <xsl:apply-templates select="/doc/glutton/page"/>
                                        </xsl:when>
                                    </xsl:choose>
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
                    <!-- reprise des classifications depuis Json quand présence-->
                    <xsl:if test ="/doc/glutton/subject !=''">
                        <textClass ana="subject">
                            <keywords scheme="journal-subject">
                                <list>
                                    <item>
                                        <xsl:apply-templates select="/doc/glutton/subject" mode="json"/>
                                    </item>
                                </list>
                            </keywords>
                        </textClass>
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
            <!-- body et back -->
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
                    <xsl:apply-templates select="family"/>
                    <xsl:apply-templates select="given"/>
                    <xsl:apply-templates select="affiliation" mode="json"/>
                    <xsl:apply-templates select="ORCID"/>
                    <roleName>author</roleName>
                </persName>
            </author>
    </xsl:template>
    <xsl:template match="family">
        <surname>
            <xsl:apply-templates/>
        </surname>
    </xsl:template>
    <!-- affiliation -->
    <xsl:template match="affiliation" mode="json">
        <affiliation>
            <xsl:value-of select="name"/>
        </affiliation>
    </xsl:template>
    <!-- ORCID -->
    <xsl:template match="ORCID">
        <idno type="ORCID">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <!-- publisher -->
    <xsl:template match="publisher" mode="json">
        <publisher>
        <xsl:apply-templates/>
        </publisher>
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
    <xsl:template match="issn-type">
        <idno>
            <xsl:attribute name="type">
                <xsl:choose>
                    <xsl:when test="type='electronic'">eISSN</xsl:when>
                    <xsl:otherwise>ISSN</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates select="value"/>
        </idno>
    </xsl:template>
    <xsl:template match="value">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="id">
        <idno>
            <xsl:attribute name="type">ArticleID</xsl:attribute>
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="doi_url"> 
        <idno>
            <xsl:attribute name="type">URLdoi</xsl:attribute>
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
    <xsl:template match="pmid"> 
        <idno>
            <xsl:attribute name="type">pmid</xsl:attribute> 
            <xsl:apply-templates/> 
        </idno>
    </xsl:template>
    <xsl:template match="pmcid"> 
        <idno>
            <xsl:attribute name="type">pmcid</xsl:attribute> 
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
    <xsl:template match="subject" mode="json"> 
        <term type="Primary">
            <xsl:apply-templates/>
        </term>            
    </xsl:template>
</xsl:stylesheet>
