<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:mml="http://www.w3.org/1998/Math/MathML" exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- ******************* Genre ******************************-->
    <xsl:variable name="codeGenreSage1">
        <xsl:value-of select="//SAGEmeta/@type"/>
    </xsl:variable>
    <xsl:variable name="codeGenreSage">
        <xsl:choose>
            <xsl:when test="normalize-space($codeGenreSage1)='Editorial'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='Journal Article'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='Article'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='Reviews'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='Letter'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='Conference'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='News'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='abstract'">abstract</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='addendum'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='announcement'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='article-commentary'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='book-review'">book-reviews</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='books-received'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='brief-report'">brief-communication</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='calendar'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='case-report'">case-report</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='collection'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='correction'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='dissertation'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='discussion'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='editorial'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='in-brief'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='introduction'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='letter'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='meeting-report'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='news'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='obituary'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='oration'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='other'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='partial-retraction'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='product-review'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='rapid-communication'">brief-communication</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='reply'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='reprint'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='research-article'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='retraction'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='review-article'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='short-reports'">brief-communication</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage1)='translation'">other</xsl:when>
            <xsl:otherwise>
                <xsl:text>other</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="codeGenreSageArk">
        <xsl:choose>
            <xsl:when test="normalize-space($codeGenreSage)='research-article'">https://content-type.data.istex.fr/ark:/67375/XTP-1JC4F85T-7</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage)='article'">https://content-type.data.istex.fr/ark:/67375/XTP-6N5SZHKN-D</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage)='other'">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage)='book-reviews'">https://content-type.data.istex.fr/ark:/67375/XTP-PBH5VBM9-4</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage)='abstract'">https://content-type.data.istex.fr/ark:/67375/XTP-HPN7T1Q2-R</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage)='review-article'">https://content-type.data.istex.fr/ark:/67375/XTP-L5L7X3NF-P</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage)='brief-communication'">https://content-type.data.istex.fr/ark:/67375/XTP-S9SX2MFS-0</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage)='editorial'">https://content-type.data.istex.fr/ark:/67375/XTP-STW636XV-K</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage)='case-report'">https://content-type.data.istex.fr/ark:/67375/XTP-29919SZJ-6</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage)='conference'">https://content-type.data.istex.fr/ark:/67375/XTP-BFHXPBJJ-3</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage)='chapter'">https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6</xsl:when>
            <xsl:when test="normalize-space($codeGenreSage)='book'">https://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T</xsl:when>
        </xsl:choose>
    </xsl:variable>
    <xsl:template match="SAGEmeta">
        <TEI>
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <xsl:apply-templates select="header/art_info/art_title"/>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <xsl:if test="header/jrn_info/pub_info/pub_name">
                            <xsl:apply-templates select="header/jrn_info/pub_info/pub_name"/>
                        </xsl:if>
                        <xsl:if test="not(header/jrn_info/pub_info/pub_name)">
                            <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-7W6GJSM4-X">Sage Publishing Ltd</publisher>
                        </xsl:if>
                        <!-- SG ajout publisherLoc -->
                        <xsl:if test="header/jrn_info/pub_info/pub_location">
                            <xsl:apply-templates select="header/jrn_info/pub_info/pub_location"/>
                        </xsl:if>
                        <xsl:if test="header/art_info/access">
                            <availability>
                                <xsl:if test="header/art_info/access[@type='free'] | header/art_info/access[@type='openaccess']">
                                    <xsl:attribute name="status">free</xsl:attribute>
                                </xsl:if>
                                <xsl:if test="header/art_info/access[@type='creativecommons']">
                                    <xsl:attribute name="status">restricted</xsl:attribute>
                                </xsl:if>
                                <licence>
                                    <xsl:apply-templates select="header/art_info/access/@type"/>
                                </licence>
                            </availability>
                        </xsl:if>
                        <!-- date -->
                        <xsl:if test="header/jrn_info/date/yy">
                            <date type="published">
                                <xsl:attribute name="when"><xsl:value-of select="header/jrn_info/date/yy"/></xsl:attribute>
                            </date>
                        </xsl:if>
                    </publicationStmt>
                    <!-- genre -->
                    <notesStmt>
                        <!-- niveau article / chapter -->
                        <note type="content-type">
                            <xsl:attribute name="subtype">
                                <xsl:value-of select="$codeGenreSage"/>
                            </xsl:attribute>
                            <xsl:attribute name="source">
                                <xsl:value-of select="$codeGenreSage1"/>
                            </xsl:attribute>
                            <xsl:attribute name="scheme">
                                <xsl:value-of select="$codeGenreSageArk"/>
                            </xsl:attribute>
                            <xsl:value-of select="$codeGenreSage"/>
                        </note>
                        <!-- niveau revue / book -->
                        <xsl:choose>
                            <xsl:when test="//ISBN[string-length() &gt; 0] and //ISSN">
                                <note type="publication-type" subtype="book-series">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//ISBN[string-length() &gt; 0] and not(//ISSN)">
                                <note type="publication-type" subtype="book">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                    <xsl:text>book</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:otherwise>
                                <note type="publication-type" subtype="journal">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0GLKJH51-B</xsl:attribute>
                                    <xsl:text>journal</xsl:text>
                                </note>
                            </xsl:otherwise>
                        </xsl:choose>
                    </notesStmt>
                    <sourceDesc>
                        <biblStruct type="article">
                            <analytic>
                                <!-- Title information related to the paper goes here -->
                                <xsl:apply-templates select="header/art_info/art_title"/>
                                <xsl:apply-templates select="header/art_info/art_stitle"/>
                                <!-- All authors are included here -->
                                <xsl:apply-templates select="header/art_info/art_author/*"/>
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
                                <xsl:apply-templates select="@doi"/>
                            </analytic>
                            <monogr>
                                <xsl:apply-templates select="header/jrn_info/jrn_title"/>
                                <xsl:apply-templates select="header/jrn_info/ISSN"/>
                                <xsl:apply-templates select="header/jrn_info/E-ISSN"/>
                                <xsl:apply-templates select="//ISBN"/>
                                <imprint>
                                    <xsl:apply-templates select="header/jrn_info/pub_info/pub_name"/>
                                    <xsl:apply-templates select="header/jrn_info/pub_info/pub_location"/>
                                    <xsl:apply-templates select="header/jrn_info/date | header/jrn_info/vol | header/jrn_info/iss| header/art_info/spn | header/art_info/epn"
                                    />
                                </imprint>
                            </monogr>
                        </biblStruct>
                    </sourceDesc>
                </fileDesc>
                <!-- versionning -->
                <xsl:call-template name="insertVersion"/>
                <xsl:if test="body/keywords|body/abstract">
                    <profileDesc>
						<!-- PL: abstract is moved from <front> to here -->
						<xsl:apply-templates select="body/abstract"/>
						
                        <xsl:apply-templates select="body/keywords"/>
                    </profileDesc>
                </xsl:if>
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$datecreation}" who="istex" xml:id="pub2tei">formatting</change>
                </revisionDesc>
            </teiHeader>
            <text>
				<!-- PL: abstract is moved to <abstract> under <profileDesc> -->
                <!--front>
                    <xsl:apply-templates select="body/abstract"/>
                </front-->
                <xsl:choose>
                    <xsl:when test="body/*[name()!='keywords' and name()!='abstract']">
                        <body>
                            <xsl:apply-templates select="body/*[name()!='keywords' and name()!='abstract']"/>
                        </body>
                    </xsl:when>
                    <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                        <body>
                            <div>
                                <p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
                            </div>
                        </body>
                    </xsl:when>
                    <xsl:otherwise>
                        <body>
                            <div><p></p></div>
                        </body>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="note|references">
                    <back>
                        <xsl:if test="note">
                            <div type="notes">
                                <xsl:apply-templates select="note/*"/>
                            </div>
                        </xsl:if>
                        <xsl:if test="references">
                            <div type="references">
                                <head>REFERENCES</head>
                                <listBibl>
                                    <xsl:apply-templates select="references"/>
                                </listBibl>
                            </div>
                        </xsl:if>
                    </back>
                </xsl:if>
            </text>
        </TEI>
    </xsl:template>

    <xsl:template match="note/p">
        <xsl:choose>
            <xsl:when test="ancestor::ref"/>
            <xsl:otherwise>
                <note>
                    <xsl:apply-templates/>
                </note>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- traitement des references -->
    <xsl:template match="references">
            <xsl:apply-templates select="citation" mode="sage"/>
    </xsl:template>
    <!-- Traitement des méta-données (génération de l'entête TEI) -->

    <!-- We do not care about components from <article-meta> which have 
    not been explicitely addressed -->
    <xsl:template match="article-meta"/>


    <xsl:template match="full_text">
        <div type="fullText">
            <head>Full text</head>
            <p>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>

    <!-- Inline affiliation -->
    <xsl:template match="affil">
        <xsl:choose>
            <xsl:when test="not(contains(.,','))">
                <affiliation>
                    <xsl:apply-templates/>
                </affiliation>
            </xsl:when>
            <xsl:otherwise>
                <affiliation>
                    <orgName type="department">
                        <xsl:value-of select="normalize-space(substring-before(.,','))"/>
                    </orgName>
                    <orgName type="institution">
                        <xsl:value-of select="normalize-space(substring-after(.,','))"/>
                    </orgName>
                </affiliation>
                <xsl:if test="eml">
                    <xsl:apply-templates select="eml"/>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Fin de la bibliographie -->

    <xsl:template match="per_aut">
        <author>
            <xsl:attribute name="xml:id">
                <xsl:variable name="i" select="position()-1"/>
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
            <persName>
                <xsl:apply-templates select="fn | mn | ln"/>
            </persName>
            <xsl:apply-templates
                select="*[not(name() = 'fn') and not(name() = 'mn') and not(name() = 'ln')]"/>
        </author>
    </xsl:template>
    
    <xsl:template match="aut">
        <author>
            <persName>
                <xsl:apply-templates select="au"/>
            </persName>
        </author>
    </xsl:template>
    
    <xsl:template match="au">
       <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="dte">
        <date type="year" when="{translate(.,' abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ','')}">
        <xsl:apply-templates/>
        </date>
    </xsl:template>
    
    <xsl:template match="pub-ref">
        <xsl:apply-templates select="pub-name"/>
        <xsl:apply-templates select="pub-place"/>
    </xsl:template>
    
    <xsl:template match="pub-name">
        <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-7W6GJSM4-X">
            <xsl:apply-templates/>
        </publisher>
    </xsl:template>
    <xsl:template match="pub-place">
        <pubPlace>
            <xsl:apply-templates/>
        </pubPlace>
    </xsl:template>

    <xsl:template match="jrn_info/date">
        <date type="Published">
            <xsl:attribute name="when">
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldDay" select="dd"/>
                    <xsl:with-param name="oldMonth" select="mm"/>
                    <xsl:with-param name="oldYear" select="yy"/>
                </xsl:call-template>
            </xsl:attribute>
        </date>
    </xsl:template>

</xsl:stylesheet>
