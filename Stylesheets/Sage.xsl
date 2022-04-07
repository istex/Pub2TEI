<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:m="http://www.w3.org/1998/Math/MathML" exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>
    
    <xsl:template match="SAGEmeta">
        <TEI  xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
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
                            <xsl:choose>
                                <xsl:when test="$codeGenreAll">
                                    <xsl:attribute name="subtype">
                                        <xsl:value-of select="$codeGenreIstex"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="source">
                                        <xsl:value-of select="normalize-space($codeGenreAll)"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="scheme">
                                        <xsl:value-of select="$codeGenreArk"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$codeGenreIstex"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="subtype">N/A</xsl:attribute>
                                    <xsl:attribute name="source">ISTEX</xsl:attribute>
                                    <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:attribute>
                                    <xsl:text>other</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
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
                    <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
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
    
    <!-- traitement des references -->
    <xsl:template match="references">
            <xsl:apply-templates select="citation" mode="sage"/>
    </xsl:template>
    <!-- Traitement des méta-données (génération de l'entête TEI) -->

    <!-- We do not care about components from <article-meta> which have 
    not been explicitely addressed -->
   <!-- <xsl:template match="article-meta"/>-->


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
                    <address>
                        <addrLine>
                        <xsl:value-of select="normalize-space(substring-after(.,','))"/>
                        </addrLine>
                    </address>
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
                <xsl:apply-templates/>
            </persName>
        </author>
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
