<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:mets="http://www.loc.gov/METS/" exclude-result-prefixes="#all">
    
    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:variable name="docIssueTEI" select="document($partOfSetXmlPath)"/>
    <xsl:variable name="codeGenreOE">
        <xsl:value-of select="//mets:xmlData[dcterms:type!='book']/dcterms:type"/>
    </xsl:variable>
    <xsl:variable name="codeGenreOE2">
        <xsl:choose>
            <xsl:when test="normalize-space($codeGenreOE)='chapter'">chapter</xsl:when>
            <xsl:when test="normalize-space($codeGenreOE)='avantpropos'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreOE)='index'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreOE)='bibliography'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreOE)='annexe'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreOE)='pageliminaire'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreOE)='preface'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreOE)='annexe'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreOE)='annexe'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreOE)='annexe'">other</xsl:when>
            <xsl:otherwise>
                <xsl:text>other</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <!-- lien vers data.istex.fr -->
    <xsl:variable name="codeGenreArkOE">
        <xsl:choose>
            <xsl:when test="normalize-space($codeGenreOE2)='chapter'">https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6</xsl:when>
            <xsl:when test="normalize-space($codeGenreOE2)='editorial'">https://content-type.data.istex.fr/ark:/67375/XTP-STW636XV-K</xsl:when>
            <xsl:when test="normalize-space($codeGenreOE2)='other'">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    
    <xsl:template match="oai:OAI-PMH">
        <TEI  xmlns:ns1="http://standoff.proposal">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:if test="//mets:xmlData[dcterms:type!='book']/dcterms:language">
                <xsl:attribute name="xml:lang" select="//mets:xmlData[dcterms:type!='book']/dcterms:language"/>
            </xsl:if>
            <teiHeader>
                <fileDesc>
                    <!-- SG - titre brut -->
                    <titleStmt>
                        <xsl:apply-templates select="//mets:xmlData[dcterms:type!='book']/dcterms:title"/>
                        <xsl:apply-templates select="//mets:xmlData[dcterms:type!='book']/dcterms:alternative"/>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <publisher>
                            <xsl:value-of select="//mets:xmlData[dcterms:type!='book']/dcterms:publisher"/>
                        </publisher>
                        <xsl:if test="//mets:xmlData[dcterms:type!='book']/dcterms:accessRights">
                            <availability>
                                <xsl:choose>
                                    <xsl:when test="contains(//mets:xmlData[dcterms:type!='book']/dcterms:accessRights,'openaccess')">
                                        <xsl:attribute name="status">free</xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="status">restricted</xsl:attribute>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <p><xsl:value-of select="//mets:xmlData[dcterms:type!='book']/dcterms:accessRights"/></p>
                                <xsl:if test="//mets:xmlData[dcterms:type='book']/dcterms:rights">
                                    <p><xsl:value-of select="//mets:xmlData[dcterms:type='book']/dcterms:rights"/></p>
                                </xsl:if>
                            </availability>
                        </xsl:if>
                        <date type="published" when="{//mets:xmlData[dcterms:type!='book']/dcterms:issued}"/>
                    </publicationStmt>
                    <notesStmt>
                        <note type="content-type">
                            <xsl:attribute name="subtype">
                                <xsl:value-of select="$codeGenreOE"/>
                            </xsl:attribute>
                            <xsl:attribute name="source">
                                <xsl:value-of select="$codeGenreOE2"/>
                            </xsl:attribute>
                            <xsl:attribute name="scheme"><xsl:value-of select="$codeGenreArkOE"/></xsl:attribute>
                            <xsl:value-of select="$codeGenreOE2"/>
                        </note>
                        <note type="publication-type" source="book" subtype="book" scheme="https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F">book</note>
                    </notesStmt>
                    <sourceDesc>
                        <biblStruct type="article">
                            <analytic>
                                <xsl:apply-templates select="//mets:xmlData[dcterms:type!='book']/dcterms:title"/>
                                <xsl:apply-templates select="//mets:xmlData[dcterms:type!='book']/dcterms:alternative"/>
                                <xsl:apply-templates select="//mets:xmlData[dcterms:type!='book']/dcterms:creator" mode="analytic"/>
                                <xsl:apply-templates select="//mets:xmlData[dcterms:type!='book']/dcterms:contributor"/>
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
                                <xsl:apply-templates select="//mets:xmlData[dcterms:type!='book']/dcterms:identifier[@scheme='URN']" mode="chapter"/>
                                <xsl:apply-templates select="//mets:xmlData[dcterms:type!='book']/dcterms:identifier[@scheme='URI']"/>
                            </analytic>
                            <monogr>
                                <title level="m" type="main">
                                    <xsl:value-of select="//mets:xmlData[dcterms:type='book']/dcterms:title"/>
                                </title>
                                <xsl:apply-templates select="//mets:xmlData[dcterms:type='book']/dcterms:identifier[@scheme='URN']" mode="book"/>
                                <xsl:apply-templates select="//mets:xmlData[dcterms:type='book']/dcterms:identifier[@scheme='URI']"/>
                                <xsl:choose>
                                    <xsl:when test="//mets:xmlData[dcterms:type='book']/dcterms:contributor">
                                        <xsl:apply-templates select="//mets:xmlData[dcterms:type='book']/dcterms:contributor"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="//mets:xmlData[dcterms:type='book']/dcterms:creator[position() =1] = //mets:xmlData[dcterms:type='book']/dcterms:creator[position() =2]">
                                                <xsl:variable name="parse">
                                                    <xsl:value-of select="//mets:xmlData[dcterms:type='book']/dcterms:creator[position() =1]"/>
                                                </xsl:variable>
                                                <author>
                                                    <persName>
                                                        <xsl:choose>
                                                            <xsl:when test="contains($parse,', ')">
                                                                <forename type="first">
                                                                    <xsl:value-of select="substring-after($parse,', ')"/>
                                                                </forename>
                                                                <surname>
                                                                    <xsl:value-of select="substring-before($parse,', ')"/>
                                                                </surname> 
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <surname>
                                                                    <xsl:value-of select="$parse"/>
                                                                </surname> 
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </persName>
                                                </author>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:apply-templates select="//mets:xmlData[dcterms:type='book']/dcterms:creator"/>
                                            </xsl:otherwise>
                                        </xsl:choose> 
                                    </xsl:otherwise>
                                </xsl:choose>
                                <imprint>
                                    <!--<biblScope unit="vol">73</biblScope>
                                    <biblScope unit="issue">1</biblScope>-->
                                    <xsl:variable name="pageFirst">
                                        <xsl:value-of select="normalize-space(substring-before(//mets:xmlData[dcterms:type!='book']/dcterms:extent,'-'))"/>
                                    </xsl:variable>
                                    <xsl:variable name="pageEnd">
                                        <xsl:value-of select="normalize-space(substring-after(//mets:xmlData[dcterms:type!='book']/dcterms:extent,'-'))"/>
                                    </xsl:variable>
                                    <xsl:if test="$pageFirst !=''">
                                    <biblScope unit="page" from="{$pageFirst}">
                                        <xsl:value-of select="$pageFirst"/>
                                    </biblScope>
                                    </xsl:if>
                                    <xsl:if test="$pageEnd !=''">
                                        <biblScope unit="page" to="{$pageEnd}">
                                            <xsl:value-of select="$pageEnd"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:if test="not(contains(//mets:xmlData[dcterms:type!='book']/dcterms:extent,'-'))">
                                        <biblScope unit="page" from="{//mets:xmlData[dcterms:type!='book']/dcterms:extent}" to="{//mets:xmlData[dcterms:type!='book']/dcterms:extent}">
                                            <xsl:value-of select="//mets:xmlData[dcterms:type!='book']/dcterms:extent"/>
                                        </biblScope>
                                    </xsl:if>
                                    <biblScope unit="total-page-issue">
                                        <xsl:value-of select="//mets:xmlData[dcterms:type='book']/dcterms:extent"/>
                                    </biblScope>
                                    <publisher>
                                        <xsl:value-of select="//mets:xmlData[dcterms:type!='book']/dcterms:publisher"/>
                                    </publisher>
                                    <date type="published" when="{//mets:xmlData[dcterms:type!='book']/dcterms:issued}"/>
                                </imprint>
                            </monogr>
                        </biblStruct>
                    </sourceDesc>
                </fileDesc>
                <xsl:call-template name="insertVersion"/>
                <profileDesc>
                    <xsl:apply-templates select="//mets:xmlData[dcterms:type!='book']/dcterms:description"/>
                    <xsl:apply-templates select="//mets:xmlData[dcterms:type!='book']/dcterms:abstract"/>
                    <xsl:apply-templates select="//mets:xmlData[dcterms:type!='book']/dcterms:spatial"/>
                    <xsl:if test="//mets:xmlData[dcterms:type!='book']/dcterms:subject[@scheme='keywords']">
                        <textClass>
                            <xsl:attribute name="ana">keyword</xsl:attribute>
                            <keywords>
                                <xsl:for-each select="//mets:xmlData[dcterms:type!='book']/dcterms:subject">
                                    <xsl:if test="@scheme='keywords'">
                                        <term>
                                            <xsl:if test="@xml:lang !=''">
                                                <xsl:copy-of select="@xml:lang"/>
                                            </xsl:if>
                                            <xsl:value-of select="."/>
                                        </term>
                                    </xsl:if>
                                </xsl:for-each>
                            </keywords>
                        </textClass>
                    </xsl:if>
                    <xsl:for-each select="//mets:xmlData[dcterms:type!='book']/dcterms:subject[@scheme !='keywords']">
                        <textClass ana="subject">
                            <keywords scheme="{@scheme}">
                                <term>
                                    <xsl:if test="@xml:lang !=''">
                                        <xsl:copy-of select="@xml:lang"/>
                                    </xsl:if>
                                    <xsl:value-of select="."/>
                                </term>
                            </keywords>
                        </textClass>
                    </xsl:for-each>
                    <xsl:if test="//mets:xmlData[dcterms:type!='book']/dcterms:language[string-length() &gt; 0]">
                        <langUsage>
                            <language>
                                <xsl:attribute name="ident">
                                <xsl:value-of select="//mets:xmlData[dcterms:type!='book']/dcterms:language"/>
                                </xsl:attribute>
                            </language>
                        </langUsage>
                    </xsl:if>
                    
                </profileDesc>
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
                </revisionDesc>
            </teiHeader>
            <xsl:choose>
                <!-- reprise du body dans le tei openEdition au 
                niveau du chapitre en format TEI-->
                <xsl:when test="$docIssueTEI/tei:text">
                    <xsl:copy-of select="$docIssueTEI/tei:text"/>
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
    <xsl:template match="dcterms:title">
        <title level="a" type="main">
            <xsl:if test="@xml:lang">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="@xml:lang"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <xsl:template match="dcterms:alternative">
        <title level="a" type="alt">
            <xsl:if test="@xml:lang">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="@xml:lang"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <xsl:template match="dcterms:creator" mode="analytic">
        <xsl:variable name="creator">
            <xsl:apply-templates/>
        </xsl:variable>
        <author>
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
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="$authorNumber"/>
                </xsl:attribute>
            <persName>
                <xsl:choose>
                    <xsl:when test="contains($creator,', ')">
                        <forename type="first">
                            <xsl:value-of select="substring-after($creator,', ')"/>
                        </forename>
                        <surname>
                            <xsl:value-of select="substring-before($creator,', ')"/>
                        </surname> 
                    </xsl:when>
                    <xsl:otherwise>
                        <surname>
                            <xsl:value-of select="$creator"/>
                        </surname> 
                    </xsl:otherwise>
                </xsl:choose>
            </persName>
            <roleName>author</roleName>
        </author>
    </xsl:template>
    <xsl:template match="dcterms:creator">
        <xsl:variable name="creator">
            <xsl:apply-templates/>
        </xsl:variable>
        <author>
            <xsl:variable name="i" select="position()-1"/>
            <xsl:variable name="authorNumber">
                <xsl:choose>
                    <xsl:when test="$i &lt; 10">
                        <xsl:value-of select="concat('book-author-000', $i)"/>
                    </xsl:when>
                    <xsl:when test="$i &lt; 100">
                        <xsl:value-of select="concat('book-author-00', $i)"/>
                    </xsl:when>
                    <xsl:when test="$i &lt; 1000">
                        <xsl:value-of select="concat('book-author-0', $i)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('book-author-', $i)"/>
                    </xsl:otherwise>
                </xsl:choose> 
            </xsl:variable>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="$authorNumber"/>
            </xsl:attribute>
            <persName>
                <xsl:choose>
                    <xsl:when test="contains($creator,', ')">
                        <forename type="first">
                            <xsl:value-of select="substring-after($creator,', ')"/>
                        </forename>
                        <surname>
                            <xsl:value-of select="substring-before($creator,', ')"/>
                        </surname> 
                    </xsl:when>
                    <xsl:otherwise>
                        <surname>
                            <xsl:value-of select="$creator"/>
                        </surname> 
                    </xsl:otherwise>
                </xsl:choose>
            </persName>
            <roleName>author</roleName>
        </author>
    </xsl:template>
    <xsl:template match="dcterms:contributor">
        <xsl:variable name="contributor">
            <xsl:apply-templates/>
        </xsl:variable>
        <author>
            <persName>
                <xsl:choose>
                    <xsl:when test="contains($contributor,', ')">
                        <forename type="first">
                            <xsl:value-of select="substring-after($contributor,', ')"/>
                        </forename>
                        <surname>
                            <xsl:value-of select="substring-before($contributor,', ')"/>
                        </surname> 
                    </xsl:when>
                    <xsl:otherwise>
                        <surname>
                            <xsl:value-of select="$contributor"/>
                        </surname> 
                    </xsl:otherwise>
                </xsl:choose>
            </persName>
            <roleName type="office">editor</roleName>
        </author>
    </xsl:template>
    <xsl:template match="dcterms:identifier">
        <xsl:if test="contains(@scheme,'URI')">
            <idno type="uri">
                <xsl:value-of select="."/>
            </idno>
        </xsl:if>
    </xsl:template>
    <xsl:template match="dcterms:identifier" mode="chapter">
        <xsl:if test="contains(.,'urn:doi:')">
            <idno type="doi">
                <xsl:value-of select="substring-after(.,'urn:doi:')"/>
            </idno>
        </xsl:if>
    </xsl:template>
    <xsl:template match="dcterms:identifier" mode="book">
        <xsl:if test="contains(.,'urn:doi:')">
            <idno type="doi">
                <xsl:value-of select="substring-after(.,'urn:doi:')"/>
            </idno>
        </xsl:if>
        <xsl:if test="contains(.,'urn:isbn:')">
            <idno type="ISBN">
                <xsl:value-of select="substring-after(.,'urn:isbn:')"/>
            </idno>
        </xsl:if>
        <xsl:if test="contains(.,'urn:eisbn:')">
            <idno type="eISBN">
                <xsl:value-of select="substring-after(.,'urn:eisbn:')"/>
            </idno>
        </xsl:if>
    </xsl:template>
    <xsl:template match="dcterms:description">
        <abstract ana="description">
            <xsl:if test="@xml:lang">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="@xml:lang"/>
                </xsl:attribute>
            </xsl:if>
            <p>
                <xsl:apply-templates/>
            </p>
        </abstract>
    </xsl:template>
    <xsl:template match="dcterms:abstract">
        <abstract ana="abstract">
            <xsl:if test="@xml:lang">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="@xml:lang"/>
                </xsl:attribute>
            </xsl:if>
            <p>
                <xsl:apply-templates/>
            </p>
        </abstract>
    </xsl:template>
    <xsl:template match="dcterms:spatial">
        <textClass ana="geo">
            <classCode scheme="spatial">
                <xsl:apply-templates/>
            </classCode>
        </textClass>
    </xsl:template>
</xsl:stylesheet>
