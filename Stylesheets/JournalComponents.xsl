<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:sb="http://www.elsevier.com/xml/common/struct-bib/dtd"
    xmlns:els1="http://www.elsevier.com/xml/ja/dtd" xmlns:els2="http://www.elsevier.com/xml/cja/dtd"
    xmlns:s1="http://www.elsevier.com/xml/si/dtd" xmlns:mml="http://www.w3.org/1998/Math/MathML"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:wiley="http://www.wiley.com/namespaces/wiley"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:rsc="http://www.rsc.org/schema/rscart38"
    exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:variable name="journalList" select="document('JournalList.xml')"/>


    <xsl:template
        match="fm/atl | article-title/title | article-title | atl | ce:title | art_title | rsc:art_title | article_title | nihms-submit/title | chapter-title | wiley:chapterTitle | titlegrp/title | rsc:titlegrp/rsc:title | wiley:articleTitle | chaptl">
        <xsl:choose>
            <xsl:when
                test="ancestor::news-article/art-front/titlegrp | ancestor::rsc:news-article/rsc:art-front/rsc:titlegrp">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="//ce:doi = '10.1016/S0140-7007(01)00037-8'">
                <title level="a" type="main">A Word from the Director / Le mot du Directeur</title>
            </xsl:when>
            <xsl:when test="//ce:doi = '10.1016/S0923-5965(97)00056-8'">
                <title level="a" type="main">Foreword</title>
            </xsl:when>
            <xsl:when test="//ce:doi = '10.1016/S0377-8398(00)00009-8'">
                <title level="a" type="main">Introduction : Nannoplankton ecology and
                    palaeoecology</title>
            </xsl:when>
            <xsl:when test="//ce:doi = '10.1006/jfca.1996.0012'">
                <title level="a" type="main">Book review : The Pacific Islands Food Composition
                    Tables by C. A. Dignan, B. A. Burlingame, J. M. Arthur, R. J. Quigley, and G. C.
                    Milligan</title>
            </xsl:when>
            <xsl:when test="//ce:doi = '10.1016/S0165-1684(98)00205-9'">
                <title level="a" type="main">Editorial</title>
            </xsl:when>
            <xsl:when test="//ce:doi = '10.1006/jfca.1996.0013'">
                <title level="a" type="main">Book review : Fats and Fatty Acids in New Zealand
                    Foods, by R. J. Quigley, B. A. Burlingame, G. C. Milligan, and J. J.
                    Gibson</title>
            </xsl:when>
            <xsl:when test="//ce:doi = '10.1006/jfca.1996.0014'">
                <title level="a" type="main">Book review : Quality and Accessibility of Food Related
                    Data, by Heather Greenfield</title>
            </xsl:when>
            <xsl:when test="//ce:doi = '10.1016/S0142-9418(00)00029-5'">
                <title level="a" type="main">Editorial</title>
            </xsl:when>
            <xsl:when test="//ce:doi = '10.1016/S0168-9002(99)01283-8'">
                <title level="a" type="main">Index</title>
            </xsl:when>
            <xsl:when test="//ce:doi = '10.1053/smrv.1999.0085'">
                <title level="a" type="main">Table of contents</title>
            </xsl:when>
            <xsl:when test="//ce:doi = '10.1016/S1049-3867(01)00088-3'">
                <title level="a" type="main">Erratum to 'An Intersection of Women’s and Perinatal
                    Health: The Role of Chronic Disease'</title>
            </xsl:when>
            <xsl:when test="//ce:doi = '10.1016/S0009-2509(99)00312-7'">
                <title level="a" type="main">Erratum to 'Conversion-temperature trajectories for
                    well mixed adsorptive reactorsa'</title>
            </xsl:when>
           <xsl:when test="/article/front/article-meta/title-group/article-title ='' and /article/front/journal-meta/publisher/publisher-name='Cambridge University Press'">
                <title level="a" type="main">
                    <xsl:choose>
                        <xsl:when test="/article/front/article-meta/product/source[string-length()&gt; 0]">
                            <xsl:apply-templates select="/article/front/article-meta/product" mode="title"/>
                        </xsl:when>
                        <xsl:otherwise>Book review</xsl:otherwise>
                    </xsl:choose>
                </title>
            </xsl:when>
            <xsl:when test="ancestor::reftxt">
                <xsl:text> </xsl:text>
                <title level="a" type="main">
                   <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:otherwise>
                <title level="a" type="main">
                    <xsl:choose>
                        <xsl:when test=". != ''">
                            <xsl:choose>
                                <xsl:when test="@Language != '--'">
                                    <xsl:attribute name="xml:lang">
                                        <xsl:value-of select="translate(@Language, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
                                    </xsl:attribute>
                                </xsl:when>
                                <xsl:when test="ancestor::ref-list"/>
                                <xsl:when test="ancestor::article/@xml:lang != ''">
                                    <xsl:attribute name="xml:lang">
                                        <xsl:choose>
                                            <xsl:when test="//article/front/article-meta/article-id[@pub-id-type='doi']='10.1017/S181638311800067X'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:when>
                                            <xsl:when test="//article/front/article-meta/article-id[@pub-id-type='doi']='10.1017/S1816383118000462'"><xsl:attribute name="xml:lang">en</xsl:attribute></xsl:when>
                                            <xsl:when test="//article/front/article-meta/article-id[@pub-id-type='doi']='10.1017/S2078633610000706'"><xsl:attribute name="xml:lang">fr</xsl:attribute></xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="translate(ancestor::article/@xml:lang, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:apply-templates/>
                            <xsl:if test="//article/front/article-meta/title-group/subtitle[string-length() &gt; 0]">
                                <xsl:text> : </xsl:text>
                                <xsl:value-of select="//article/front/article-meta/title-group/subtitle"/>
                            </xsl:if>
                            <xsl:if test="//article/front/article-meta/title-group/article-title = 'REVIEWS' and //product/source">
                                <xsl:variable name="countProduct">
                                    <xsl:value-of select="count(//product)"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="$countProduct = 1">
                                        <xsl:text> : </xsl:text>
                                        <xsl:value-of select="//product/source"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:if>
                        </xsl:when>
                    </xsl:choose>
                </title>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- wiley -->
    <xsl:template match="wiley:otherTitle">
        <xsl:choose>
            <xsl:when test="parent::wiley:citation and following-sibling::wiley:bookSeriesTitle!=''">
                <xsl:text> </xsl:text>
                <title level="m" type="main">
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text> </xsl:text>
                <title level="a" type="main">
                    <xsl:apply-templates/>
                </title>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- elsevier -->
    <xsl:template match="sb:title">
        <xsl:if test="normalize-space(sb:maintitle)">
            <title level="a" type="main">
                <xsl:if test="@Language | @xml:lang">
                    <xsl:attribute name="xml:lang">
                        <xsl:choose>
                            <xsl:when test="@Language = '' or @xml:lang = ''">
                                <xsl:text>en</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="Varia2ISO639">
                                    <xsl:with-param name="code" select="@Language | @xml:lang"/>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates select="sb:maintitle"/>
            </title>
        </xsl:if>
        <xsl:if test="normalize-space(sb:subtitle)">
            <title level="a" type="sub">
                <xsl:if test="@Language | @xml:lang">
                    <xsl:attribute name="xml:lang">
                        <xsl:choose>
                            <xsl:when test="@Language = '' or @xml:lang = ''">
                                <xsl:text>en</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="Varia2ISO639">
                                    <xsl:with-param name="code" select="@Language | @xml:lang"/>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates select="sb:subtitle"/>
            </title>
        </xsl:if>
    </xsl:template>
    <xsl:template match="book-title" mode="article">
        <title level="a">
            <xsl:choose>
                <!-- traitement degruyter ebooks special 
                exemple 10.1515/9781501504396-->
                <xsl:when test=". = 'Homer’s Iliad'">
                    <xsl:value-of select="/book/book-meta/volume[@xml:lang = 'de']"/>
                    <xsl:text> - </xsl:text>
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </title>
    </xsl:template>
    <xsl:template match="book-title">
        <title level="m">
            <xsl:choose>
                <!-- traitement degruyter ebooks special 
                exemple 10.1515/9781501504396-->
                <xsl:when test=". = 'Homer’s Iliad'">
                    <xsl:value-of select="/book/book-meta/volume[@xml:lang = 'de']"/>
                    <xsl:text> - </xsl:text>
                    <xsl:apply-templates/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </title>
    </xsl:template>
    <xsl:template match="ce:subtitle">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- EDP - trans-title-group -->
    <xsl:template match="trans-title-group">
        <xsl:if test=". != ''">
            <title level="a" type="alt">
                <xsl:if test="@xml:lang">
                    <xsl:attribute name="xml:lang">
                        <xsl:choose>
                            <xsl:when test="@xml:lang = ''">
                                <xsl:text>en</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="Varia2ISO639">
                                    <xsl:with-param name="code" select="@xml:lang"/>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates select="trans-title"/>
            </title>
        </xsl:if>
    </xsl:template>
    <!--SG - <topic> dans titre remplacé par <hi>-->
    <xsl:template match="atl/topic">
        <hi>
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <!-- BMJ: short-title -->
    <xsl:template match="short-title">
        <xsl:if test=". != ''">
            <title level="a" type="short">
                <xsl:if test="@Language">
                    <xsl:attribute name="xml:lang">
                        <xsl:call-template name="Varia2ISO639">
                            <xsl:with-param name="code" select="@Language"/>
                        </xsl:call-template>
                    </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates/>
            </title>
        </xsl:if>
    </xsl:template>

    <xsl:template match="subtitle | article_sub_title | art_stitle">
        <xsl:choose>
            <xsl:when test="ancestor::collection-meta">
                <title level="s" type="sub">
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:when test="//issue-title | parent::book-title-group">
                <title level="m" type="sub">
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:otherwise>
                <title level="a" type="sub">
                    <xsl:apply-templates/>
                </title>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="subtitle" mode="monogr">
        <xsl:if test=". != ''">
            <title level="m" type="sub">
                <xsl:apply-templates/>
            </title>
        </xsl:if>
    </xsl:template>
    <!-- EDP trans-title -->
    <xsl:template match="trans-title">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="vernacular_title">
        <xsl:if test=". != ''">
            <title level="a" type="vernacular">
                <xsl:apply-templates/>
            </title>
        </xsl:if>
    </xsl:template>

    <xsl:template match="alt-title">
        <xsl:choose>
            <xsl:when test="ancestor::sec | ancestor::ack | ancestor::app">
                <head>
                    <xsl:if test="@alt-title-type">
                        <xsl:attribute name="rend">
                            <xsl:value-of select="@alt-title-type"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </head>
            </xsl:when>
            <xsl:otherwise>
                <title level="a" type="{@alt-title-type}">
                    <xsl:choose>
                        <xsl:when test="@alt-title-type">
                            <xsl:attribute name="type">
                                <xsl:value-of select="@alt-title-type"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="type">
                                <xsl:text>alt</xsl:text>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:apply-templates/>
                </title>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Elements for general Journal components in ScholarOne (full_journal_title, journal_abbreviation) -->
    <!-- Elements for general Journal components in ArticleSetNLM 2.0 (JournalTitle, Issn) -->
    <!-- NLM 2.3 article: journal-title, journal-id, abbrev-journal-title -->
    <!-- Elements for general Journal components in SAGE (jrn_title, ISSN) -->
    <!-- Elements for general Journal components in Springer Stage2 (JournalTitle) -->
    <!-- Nature: journal-title -->
    <!-- Elsevier: els1:jid |els2:jid, ce:issn -->

    <xsl:template
        match="j-title | JournalTitle | full_journal_title | jrn_title | journal-title | tei:cell[@role = 'Journal'] | journalcit/title | rsc:journalcit/rsc:title | jtl | wiley:journalTitle">
        <xsl:choose>
            <!-- SAGE - traitement des titres de journaux non verbalisés -->
            <xsl:when test="normalize-space(.)">
                <xsl:choose>
                    <xsl:when
                        test="//publicationMeta/isbn[string-length() &gt; 0] and //publicationMeta/issn">
                        <title level="m" type="main">
                            <xsl:apply-templates/>
                        </title>
                    </xsl:when>
                    <xsl:when
                        test="//article-meta/isbn[string-length() &gt; 0] | //journal-meta/isbn[string-length() &gt; 0] and //journal-meta/issn and //issue-title">
                        <title level="s" type="main">
                            <xsl:apply-templates/>
                        </title>
                    </xsl:when>
                    <xsl:when
                        test="//article-meta/isbn[string-length() &gt; 0] | //journal-meta/isbn[string-length() &gt; 0] and //journal-meta/issn">
                        <title level="m" type="main">
                            <xsl:apply-templates/>
                        </title>
                    </xsl:when>
                    <xsl:when
                        test="//journal-meta/issn[@pub-type = 'isbn'][string-length() &gt; 0] and contains(//journal-meta/issn/@pub-type, 'pub')[string-length() &gt; 0]">
                        <title level="m" type="main">
                            <xsl:apply-templates/>
                        </title>
                    </xsl:when>
                    <xsl:when
                        test="//publicationMeta/isbn[string-length() &gt; 0] and not(//publicationMeta/issn)">
                        <title level="m" type="main">
                            <xsl:apply-templates/>
                        </title>
                    </xsl:when>
                    <xsl:when test="//JournalTitle = 'J Biosci'">
                        <title level="j" type="main">Journal of Biosciences</title>
                    </xsl:when>
                    <xsl:when test="//journal-title = 'Geological Society, London, Special Publications'">
                        <title level="s" type="main">
                            <xsl:apply-templates/>
                        </title>
                    </xsl:when>
                    <xsl:when test="ancestor::reftxt">
                        <title level="j" type="main">
                            <xsl:value-of select="."/>
                        </title>
                        <xsl:text> </xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <title level="j" type="main">
                            <xsl:apply-templates/>
                        </title>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="suppttl">
        <xsl:if test=". != ''">
            <title level="j" type="sub">
                <xsl:apply-templates/>
            </title>
        </xsl:if>
    </xsl:template>
    <xsl:template match="journal-subtitle">
        <xsl:choose>
            <xsl:when
                test="//journal-meta/isbn[string-length() &gt; 0] and not(//publicationMeta/issn)">
                <title level="m" type="sub">
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:otherwise>
                <title level="j" type="sub">
                    <xsl:apply-templates/>
                </title>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- SG - ajout des refs book -->
    <xsl:template match="wiley:bookTitle">
        <xsl:if test=". != ''">
            <title level="m" type="main">
                <xsl:apply-templates/>
            </title>
        </xsl:if>
    </xsl:template>

    <!-- SG - ajout des refs series -->
    <xsl:template match="wiley:bookSeriesTitle">
        <xsl:if test=". != ''">
            <title level="s" type="main">
                <xsl:apply-templates/>
            </title>
        </xsl:if>
    </xsl:template>

    <xsl:template match="btl">
        <xsl:if test=". != ''">
            <title level="m" type="main">
                <xsl:apply-templates/>
            </title>
        </xsl:if>
    </xsl:template>

    <!-- Additional journal namings -->

    <xsl:template
        match="journal_abbreviation | abbrev-journal-title | els1:jid | els2:jid | JournalShortTitle | j-shorttitle | JournalAbbreviatedTitle">
        <xsl:if test=". != ''">
            <xsl:choose>
                <!-- edp 10.1051/epjconf/20122407002 -->
                <xsl:when test="//article-meta/issue-title!=''"/>
                <xsl:when test="//publicationMeta/isbn[string-length() &gt; 0] and //publicationMeta/issn">
                    <title level="m" type="abbrev">
                        <xsl:apply-templates/>
                    </title>
                </xsl:when>
                <xsl:when test="//publicationMeta/isbn[string-length() &gt; 0] and //publicationMeta/issn">
                    <title level="m" type="abbrev">
                        <xsl:apply-templates/>
                    </title>
                </xsl:when>
                <xsl:when test="//article-meta/isbn[string-length() &gt; 0] | //journal-meta/isbn[string-length() &gt; 0] and //journal-meta/issn">
                    <title level="s" type="abbrev">
                        <xsl:apply-templates/>
                    </title>
                </xsl:when>
                <xsl:when
                    test="//journal-meta/issn[@pub-type = 'isbn'][string-length() &gt; 0] and contains(//journal-meta/issn/@pub-type, 'pub')[string-length() &gt; 0]">
                    <title level="m" type="abbrev">
                        <xsl:apply-templates/>
                    </title>
                </xsl:when>
                <xsl:when
                    test="//publicationMeta/isbn[string-length() &gt; 0] and not(//publicationMeta/issn)">
                    <title level="m" type="abbrev">
                        <xsl:apply-templates/>
                    </title>
                </xsl:when>
                <!-- degruyter-->
                <xsl:when test="//journal-meta/journal-title-group/abbrev-journal-title and not(//journal-meta/journal-title-group/journal-title)"/>
                <xsl:otherwise>
                    <title level="j" type="abbrev">
                        <xsl:apply-templates/>
                    </title>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    <!-- edp 10.1051/epjconf/20122407002 -->
    <xsl:template match="abbrev-journal-title" mode="edp">
        <title level="s" type="abbrev">
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <xsl:template match="pubmed_abbreviation">
        <xsl:if test=". != ''">
            <title level="j" type="pubmed">
                <xsl:value-of select="normalize-space()"/>
            </title>
        </xsl:if>
    </xsl:template>

    <xsl:template match="journal-id">
        <xsl:choose>
            <!-- rsc-ebooks -->
            <xsl:when test="@journal-id-type = 'book_series'"/>
            <xsl:when test="@journal-id-type = 'publisher-id'"/>
            <xsl:when test="@journal-id-type = 'nlm-ta'"/>
            <xsl:when test="@journal-id-type = 'series'"/>
            <xsl:when test="@journal-id-type = 'print' and //journal-meta/issn != ''"/>
            <xsl:when test="@journal-id-type = 'online' and //@journal-id-type = 'series'"/>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@journal-id-type = 'print'">
                        <idno type="pISSN">
                            <xsl:apply-templates/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="@journal-id-type = 'online'">
                        <idno type="eISSN">
                            <xsl:apply-templates/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="@journal-id-type = 'isbn'">
                        <idno type="pISBN">
                            <xsl:apply-templates/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="@journal-id-type = 'eisbn'">
                        <idno type="eISBN">
                            <xsl:apply-templates/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="@journal-id-type = 'doi' and //journal-meta/issn and //journal-meta/isbn"/>
                    <xsl:otherwise>
                        <xsl:if test=". != ''">
                            <idno>
                                <xsl:attribute name="type">
                                    <xsl:choose>
                                        <xsl:when test="@journal-id-type = 'doi'">DOI</xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="@journal-id-type"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:apply-templates/>
                            </idno>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="j-edpsname | JournalEDPSName">
        <xsl:if test=". != ''">
            <title level="j" type="EDPSName">
                <xsl:apply-templates/>
            </title>
        </xsl:if>
    </xsl:template>

    <!-- Issue titles -->
    <xsl:template match="issue_description | issue-title | IssueTitle">
        <xsl:if test=". != ''">
            <xsl:choose>
                <xsl:when test="//volume-id[@pub-id-type='isbn'][string-length() &gt; 0]">
                    <title level="m" type="main">
                        <xsl:apply-templates/>
                    </title>
                </xsl:when>
                <xsl:when
                    test="//publicationMeta/isbn[string-length() &gt; 0] and //publicationMeta/issn">
                    <title level="m" type="issue">
                        <xsl:apply-templates/>
                    </title>
                </xsl:when>
                <xsl:when
                    test="//article-meta/isbn[string-length() &gt; 0] | //journal-meta/isbn[string-length() &gt; 0] and //journal-meta/issn">
                    <title level="m" type="main">
                        <xsl:apply-templates/>
                    </title>
                </xsl:when>
                <xsl:when
                    test="//journal-meta/issn[@pub-type = 'isbn'][string-length() &gt; 0] and contains(//journal-meta/issn/@pub-type, 'pub')[string-length() &gt; 0]">
                    <title level="m" type="issue">
                        <xsl:apply-templates/>
                    </title>
                </xsl:when>
                <xsl:when
                    test="//publicationMeta/isbn[string-length() &gt; 0] and not(//publicationMeta/issn)">
                    <title level="m" type="issue">
                        <xsl:apply-templates/>
                    </title>
                </xsl:when>
                <xsl:when test="//isbn[string-length() &gt; 0]">
                    <title level="m" type="main">
                        <xsl:apply-templates/>
                    </title>
                    <xsl:if test="//subtitle">
                        <xsl:apply-templates select="//subtitle"/>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <title level="j" type="sub">
                        <xsl:choose>
                            <xsl:when test="@content-type='short'">
                               <xsl:attribute name="rendition">short</xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:apply-templates/>
                    </title>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <!-- ISSN numbers -->
    <!-- Nature issn/@pub-type -->
    <!-- BMJ: issn/@issn_type -->
    <!-- NLM 2.3 article: issn -->
    <!-- Elsevier: ce:issn -->
    <!-- Rem.: @pub-typr not considered -->

    <xsl:template match="Issn[string-length() &gt; 0] | ISSN[string-length() &gt; 0] | ce:issn[string-length() &gt; 0]">
        <xsl:choose>
            <xsl:when test="@publication-format = 'print'">
                <idno type="pISSN">
                    <xsl:apply-templates/>
                </idno>
            </xsl:when>
            <xsl:when test="@publication-format = 'online'">
                <idno type="eISSN">
                    <xsl:apply-templates/>
                </idno>
            </xsl:when>
            <xsl:when test="@publication-format = 'electronic'">
                <idno type="eISSN">
                    <xsl:apply-templates/>
                </idno>
            </xsl:when>
            <xsl:when test="normalize-space(.)">
                <xsl:variable name="ISSNCode">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:variable>
                <xsl:variable name="journalEntry"
                    select="$journalList/descendant::tei:row[tei:cell/text() = $ISSNCode]"/>
                <xsl:message>ISSN: <xsl:value-of select="$ISSNCode"/></xsl:message>
                <xsl:message>Journal: <xsl:value-of
                        select="$journalEntry/tei:cell[@role = 'Journal']"/></xsl:message>
                <idno type="pISSN">
                    <xsl:choose>
                        <xsl:when test="$ISSNCode or normalize-space(.)">
                            <xsl:value-of select="$ISSNCode"/>
                        </xsl:when>
                        <!-- BMJ -->
                        <xsl:when
                            test="//journal-meta/journal-title = 'Association Medical Journal'"
                            >2041-9996</xsl:when>
                        <xsl:when test="//journal-meta/journal-title = 'London journal of medicine'"
                            >2041-9988</xsl:when>
                        <xsl:when
                            test="//journal-meta/journal-title = 'BMJ : British Medical Journal'"
                            >0959-8138</xsl:when>
                        <xsl:when
                            test="//journal-meta/journal-title = 'The British Edition of the Medical Letter on Drugs and Therapeutics'"
                            >0543-2766</xsl:when>
                        <xsl:when
                            test="//journal-meta/journal-title = 'Provincial Medical and Surgical Journal' and //pub-date[@pub-type = 'ppub']/year = '1842' or //pub-date[@pub-type = 'ppub']/year = '1843' or //pub-date[@pub-type = 'ppub']/year = '1844'"
                            >2041-9961</xsl:when>
                        <xsl:when
                            test="//journal-meta/journal-title = 'Provincial Medical and Surgical Journal' and //pub-date[@pub-type = 'ppub']/year = '1840' or //pub-date[@pub-type = 'ppub']/year = '1841'"
                            >2041-9953</xsl:when>
                        <xsl:when
                            test="//journal-meta/journal-title = 'Provincial Medical and Surgical Journal' and //pub-date[@pub-type = 'ppub']/year = '1845' or //pub-date[@pub-type = 'ppub']/year = '1846' or //pub-date[@pub-type = 'ppub']/year = '1847' or //pub-date[@pub-type = 'ppub']/year = '1848' or //pub-date[@pub-type = 'ppub']/year = '1849' or //pub-date[@pub-type = 'ppub']/year = '1850' or //pub-date[@pub-type = 'ppub']/year = '1851' or //pub-date[@pub-type = 'ppub']/year = '1852'"
                            >2041-997X</xsl:when>
                        <xsl:otherwise>
                            <!-- SAGE - ajout des issns -->
                            <xsl:value-of select="$result_ISSN_NLM"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </idno>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="$result_ISSN_NLM or $result_eISSN_NLM">
                    <idno type="pISSN">
                        <!-- SAGE - ajout des pissns -->
                        <xsl:value-of select="$result_ISSN_NLM"/>
                    </idno>
                    <idno type="eISSN">
                        <!-- SAGE - ajout des eissns -->
                        <xsl:value-of select="$result_eISSN_NLM"/>
                    </idno>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template
        match="JournalPrintISSN | issn[@issn_type = 'print'][string-length() &gt; 0] | issn[@pub-type = 'ppub'][string-length() &gt; 0] | PrintISSN | issn-paper | SeriesPrintISSN | SubSeriesPrintISSN | issn[@type = 'print'] | wiley:issn[@type = 'print'] |issn">
        <xsl:variable name="ISSNCode">
            <xsl:choose>
                <!-- BMJ -->
                <xsl:when test="//journal-meta/journal-title = 'Association Medical Journal'"
                    >2041-9996</xsl:when>
                <xsl:when test="//journal-meta/journal-title = 'London journal of medicine'"
                    >2041-9988</xsl:when>
                <xsl:when test="normalize-space(.)">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$result_ISSN_NLM"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!-- Vieux morceau de code du projet PEER où l'on vérifiait dans une liste de journaux... -->
        <!--<xsl:variable name="journalEntry"
                select="$journalList/descendant::tei:row[tei:cell/text()=$ISSNCode]"/>
            <xsl:message>pISSN: <xsl:value-of select="$ISSNCode"/></xsl:message>
            <xsl:message>Journal: <xsl:value-of select="$journalEntry/tei:cell[@role='Journal']"
                /></xsl:message>-->
        <xsl:choose>
            <xsl:when
                test="//wiley:publicationMeta/wiley:issn[@type = 'print'] = '0009-9163' and contains(//wiley:publicationMeta/wiley:coverDate/@startDate, '2003') and //wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalVolume'] = '43'">
                <idno type="pISSN">0914-3505</idno>
            </xsl:when>
            <xsl:when
                test="//issn[@pub-type = 'ppub'] = '0947-3580' and contains(//journal-id[@journal-id-type = 'publisher-id'], 'acsm')">
                <idno type="pISSN">0151-9107</idno>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@publication-format='electronic'or @publication-format='online'">
                        <idno type="eISSN">
                            <xsl:value-of select="$ISSNCode"/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="@publication-format='print'">
                        <idno type="pISSN">
                            <xsl:value-of select="$ISSNCode"/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="//issue-title !=''"/>
                    <xsl:otherwise>
                        <idno type="pISSN">
                            <xsl:value-of select="$ISSNCode"/>
                        </idno> 
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="isbn">
        <xsl:if test=". != ''">
            <idno>
                <xsl:attribute name="type">
                    <xsl:choose>
                        <xsl:when test="@content-type = 'e-isbn'">eISBN</xsl:when>
                        <xsl:when test="@content-type = 'epub'">eISBN</xsl:when>
                        <xsl:when test="@publication-format = 'pbk'">ISBN</xsl:when>
                        <xsl:when test="@publication-format = 'ebk'">eISBN</xsl:when>
                        <xsl:when test="@publication-format !=''">
                            <xsl:value-of select="@publication-format"/>
                        </xsl:when>
                        <xsl:when test="@publication-format = 'epub'">eISBN</xsl:when>
                        <xsl:otherwise>ISBN</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:apply-templates/>
            </idno>
        </xsl:if>
    </xsl:template>

    <xsl:template
        match="JournalElectronicISSN | ElectronicISSN | issn[@issn_type = 'digital'] | issn[@pub-type = 'epub'] | issn-elec | SeriesElectronicISSN | SubSeriesElectronicISSN | issn[@type = 'electronic'] | wiley:issn[@type = 'electronic'] | E-ISSN">
        <xsl:variable name="eISSNCode">
            <xsl:if test=". != ''">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:if>
        </xsl:variable>
        <!-- Vieux morceau de code du projet PEER où l'on vérifiait dans une liste de journaux... -->
        <!--<xsl:variable name="journalEntry"
                select="$journalList/descendant::tei:row[tei:cell/text()=$ISSNCode]"/>
            <xsl:message>eISSN: <xsl:value-of select="$ISSNCode"/></xsl:message>
            <xsl:message>Journal: <xsl:value-of select="$journalEntry/tei:cell[@role='Journal']"
                /></xsl:message>-->
        <xsl:choose>
            <xsl:when
                test="//wiley:publicationMeta/wiley:issn[@type = 'print'] = '0009-9163' and contains(//wiley:publicationMeta/wiley:coverDate/@startDate, '2003') and //wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalVolume'] = '43'">
                <idno type="eISSN">1741-4520</idno>
            </xsl:when>
            <xsl:when
                test="/article/front/article-meta/article-id[@pub-id-type='doi']='10.1051/limn/2022010'">
                <idno type="eISSN">2823-1465</idno>
            </xsl:when>
            <xsl:when
                test="/article/front/article-meta/article-id[@pub-id-type='doi']='10.1051/limn/2022010'">
                <idno type="eISSN">2823-1465</idno>
            </xsl:when>
            <xsl:when test="//article-meta/issue-title!=''"/>
            <xsl:otherwise>
                <xsl:if test=". != ''">
                    <idno type="eISSN">
                        <xsl:value-of select="$eISSNCode"/>
                    </idno>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- SG - ajout DOI niveau book - pour matcher avec les reversement du Hub de métadonnées-->
    <xsl:template match="wiley:publicationMeta[@level = 'product']/wiley:doi">
        <xsl:if test=". != ''">
            <xsl:variable name="DOIValue" select="string(.)"/>
            <idno type="book-DOI">
                <xsl:choose>
                    <xsl:when test="starts-with($DOIValue, 'DOI')">
                        <xsl:value-of select="normalize-space(substring-after($DOIValue, 'DOI'))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$DOIValue"/>
                    </xsl:otherwise>
                </xsl:choose>
            </idno>
        </xsl:if>
    </xsl:template>

    <!-- SG - ajout DOI niveau book-part-->
    <xsl:template match="wiley:publicationMeta[@level = 'part']/wiley:doi">
        <xsl:if test=". != ''">
            <xsl:variable name="DOIValue" select="normalize-space(string(.))"/>
            <idno type="book-part-DOI">
                <xsl:choose>
                    <xsl:when test="starts-with($DOIValue, 'DOI')">
                        <xsl:value-of select="normalize-space(substring-after($DOIValue, 'DOI'))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$DOIValue"/>
                    </xsl:otherwise>
                </xsl:choose>
            </idno>
        </xsl:if>
    </xsl:template>

    <!-- SG - ajout identifiants de production-->
    <xsl:template match="wiley:publicationMeta[@level = 'product']/wiley:idGroup/wiley:id">
        <xsl:choose>
            <xsl:when
                test="//wiley:publicationMeta/wiley:issn[@type = 'print'] = '0009-9163' and contains(//wiley:publicationMeta/wiley:coverDate/@startDate, '2003') and //wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalVolume'] = '43'">
                <idno>
                    <xsl:attribute name="type">
                        <xsl:apply-templates select="@type"/>
                    </xsl:attribute>
                    <xsl:text>CGA</xsl:text>
                </idno>
            </xsl:when>
            <xsl:otherwise>
                <idno>
                    <xsl:attribute name="type">
                        <xsl:apply-templates select="@type"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="@value"/>
                </idno>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <!-- DOI numbers -->
    <!-- BMJ: doi -->
    <!-- Elsevier: ce:doi -->
    <!-- NLM 2.3 article: article-id[@pub-id-type='doi'] -->

    <xsl:template
        match="article_id[@id_type = 'doi'] | article-id[@pub-id-type = 'doi'] | ArticleDOI | doi | rsc:doi | ArticleId[@IdType = 'doi'] | ce:doi | @doi | DOI | ChapterDOI | wiley:publicationMeta[@level = 'unit']/wiley:doi">
        <xsl:if test=". != ''">
            <xsl:variable name="DOIValue" select="string(.)"/>
            <idno type="DOI">
                <xsl:choose>
                    <!-- rattrapage de 7 doublons de DOI RSL et non de contenu -->
                    <xsl:when
                        test="normalize-space(//article/front/article-meta/article-id[@pub-id-type = 'doi']) = '10.1098/rspb.1936.0078' and //article/front/article-meta/title-group/article-title = 'Photoelectric methods of measuring the velocity of rapid reactions I—General principles and controls'"
                        >10.1098/rspa.1936.0097</xsl:when>
                    <xsl:when
                        test="normalize-space(//article/front/article-meta/article-id[@pub-id-type = 'doi']) = '10.1098/rspl.1871.0105' and //article/front/article-meta/title-group/article-title = 'Presents list, March 7, 1872'"
                        >10.1098/rspl.1871.0104</xsl:when>
                    <xsl:when
                        test="normalize-space(//article/ront/article-meta/article-id[@pub-id-type = 'doi']) = '10.1098/rspl.1884.0134' and //article/front/article-meta/title-group/article-title = 'Publication announcements'"
                        >10.1098/rspl.1884.0135</xsl:when>
                    <xsl:when
                        test="normalize-space(//article/front/article-meta/article-id[@pub-id-type = 'doi']) = '10.1098/rspl.1890.0008' and //article/front/article-meta/title-group/article-title = 'III. On barometric oscillations during thunderstorms, and on the brontometer, an instrument designed to facilitate their study.'"
                        >10.1098/rspl.1890.0130</xsl:when>
                    <xsl:when
                        test="normalize-space(//article/front/article-meta/article-id[@pub-id-type = 'doi']) = '10.1098/rsta.2003.1183' and //article/front/article-meta/title-group/article-title = 'General discussion'"
                        ><!-- pas de doi connu --></xsl:when>
                    <xsl:when
                        test="normalize-space(//article/front/article-meta/article-id[@pub-id-type = 'doi']) = '10.1098/rstl.1735.0085' and //article/front/article-meta/title-group/article-title = 'VIII. An extraordinary case of the foramen ovale of the heart, being found open in an adult, communicated by Claudius Amyand, Esq; Serjeant Surgeon to his Majesty, and F. R. S.'"
                        ><!-- pas de doi connu --></xsl:when>
                    <xsl:when
                        test="normalize-space(//article/front/article-meta/article-id[@pub-id-type = 'doi']) = '10.1098/rstl.1746.0124' and //article/front/article-meta/title-group/article-title = 'Figures 1 - 3 of issue 482'"
                        >10.1098/rstl.1746.0127</xsl:when>
                    <xsl:when test="starts-with($DOIValue, 'DOI')">
                        <xsl:value-of select="normalize-space(substring-after($DOIValue, 'DOI'))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </idno>
        </xsl:if>
    </xsl:template>
    <xsl:template match="ecs">
        <xsl:if test=". != ''">
            <idno type="ecs">
                <xsl:value-of select="normalize-space(.)"/>
            </idno>
        </xsl:if>
    </xsl:template>
    <xsl:template match="serial">
        <xsl:if test=". != ''">
            <idno type="serial">
                <xsl:value-of select="normalize-space(.)"/>
            </idno>
        </xsl:if>
    </xsl:template>
    <xsl:template match="ms-id | rsc:ms-id">
        <xsl:if test=". != ''">
            <idno type="ms-id">
                <xsl:value-of select="normalize-space(.)"/>
            </idno>
        </xsl:if>
    </xsl:template>
    <xsl:template match="pii | rsc:pii">
        <xsl:if test=". != ''">
            <idno type="pii">
                <xsl:value-of select="normalize-space(.)"/>
            </idno>
        </xsl:if>
    </xsl:template>
    <xsl:template match="sici | rsc:sici">
        <xsl:if test=". != ''">
            <idno type="sici">
                <xsl:value-of select="normalize-space(.)"/>
            </idno>
        </xsl:if>
    </xsl:template>
    <xsl:template match="wiley:publicationMeta[@level = 'unit']/wiley:idGroup/wiley:id">
        <idno>
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:value-of select="@value"/>
        </idno>
    </xsl:template>
    <xsl:template match="wiley:publicationMeta[@level = 'unit']/wiley:linkGroup/wiley:link">
        <idno>
            <xsl:attribute name="type">
                <xsl:apply-templates select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates select="@href"/>
        </idno>
    </xsl:template>

    <!-- pii -->
    <!-- Elsevier: ce:pii -->
    <!-- Scholar one: article_id[@id_type='pii'] -->
    <!-- NLM 2.2:  article-id[@pub-id-type='pii'] -->


    <xsl:template
        match="ce:pii | article_id[@id_type = 'pii'] | article-id[@pub-id-type = 'pii'] | ArticleId[@IdType = 'pii']">
        <xsl:if test=". != ''">
            <idno type="PII">
                <xsl:value-of select="normalize-space(.)"/>
            </idno>
        </xsl:if>
    </xsl:template>

    <!-- Manuscript number -->
    <!-- BMJ: manuscript-number; Springer: ArticleID -->

    <xsl:template match="manuscript-number | @ms_no | ArticleID">
        <xsl:if test=". != ''">
            <idno type="manuscript">
                <xsl:value-of select="normalize-space(.)"/>
            </idno>
        </xsl:if>
    </xsl:template>

    <!-- Publisher IDs when different from above -->
    <!-- NLM 2.2: article-id[@pub-id-type='publisher-id'] -->

    <xsl:template match="EDPSRef | edps-ref | Article/@ID">
        <xsl:if test="normalize-space(.) and not(//publisher-name = 'Cambridge University Press')">
            <idno type="publisher-id">
                <xsl:value-of select="."/>
            </idno>
        </xsl:if>
    </xsl:template>

    <xsl:template match="article/@id">
        <xsl:if test="normalize-space(.) and //cpn = 'Nature Publishing Group'">
            <idno type="article-id">
                <xsl:value-of select="."/>
            </idno>
        </xsl:if>
    </xsl:template>

    <!-- Elements for Imprint components in ScholarOne (volume, issue) -->
    <!-- Elements for Imprint components in ArticleSetNLM 2.0 (Volume, Issue, FirstPage, LastPage) -->
    <!-- NLM 2.3 article: volume, issue, fpage, lpage -->
    <!-- Elements for Imprint components in SAGE (vol, iss, spn, epn) -->
    <!-- Elements for Imprint components in Springer Stage 2 (VolumeID, IssueID, FirstPage, LastPage) -->
    <!-- Elements for Imprint components in Springer Stage 3 (ArticleFirstPage, ArticleLastPage) -->
    <!-- Elements for Imprint components in BMJ (issue-number, volume) -->
    <!-- Elements for Imprint components in Elsevier () -->

    <xsl:template
        match="vol | VolumeID | volume | volumeref | volumeno | rsc:volumeno | sb:volume-nr | vid | wiley:numbering[@type = 'journalVolume'] | wiley:vol">
        <xsl:choose>
            <xsl:when
                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0883-024X' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '4‐1'">
                <biblScope unit="vol">
                    <xsl:text>14</xsl:text>
                </biblScope>
            </xsl:when>
            <xsl:when
                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0066-4812' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '3‐1'">
                <biblScope unit="vol">
                    <xsl:text>11</xsl:text>
                </biblScope>
            </xsl:when>
            <xsl:when
                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0019-1019' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '17'">
                <biblScope unit="vol">
                    <xsl:text>11</xsl:text>
                </biblScope>
            </xsl:when>
            <xsl:when
                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0019-1019' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '10'">
                <biblScope unit="vol">
                    <xsl:text>33</xsl:text>
                </biblScope>
            </xsl:when>
            <xsl:when
                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0019-1019' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '11'">
                <biblScope unit="vol">
                    <xsl:text>33</xsl:text>
                </biblScope>
            </xsl:when>
            <xsl:when
                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0019-1019' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '18'">
                <biblScope unit="vol">
                    <xsl:text>11</xsl:text>
                </biblScope>
            </xsl:when>
            <xsl:when
                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0957-7734' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = 'S7'">
                <biblScope unit="vol">
                    <xsl:text>17</xsl:text>
                </biblScope>
            </xsl:when>
            <xsl:when test="ancestor::mixed-citation">
                <biblScope unit="vol">
                    <xsl:apply-templates/>
                </biblScope>
            </xsl:when>
            <xsl:when test="ancestor::p/citation | ancestor::p/mixed-citation | ancestor::p">
                <bibl>
                    <biblScope unit="vol">
                        <xsl:apply-templates/>
                    </biblScope>
                </bibl>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="normalize-space(.) and ancestor::bold">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:when>
                    <xsl:when test="ancestor::reftxt">
                        <biblScope unit="vol">
                            <xsl:value-of select="."/>
                        </biblScope>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test=". = '0'"/>
                            <xsl:otherwise>
                                <xsl:if test=". != ''">
                                    <biblScope unit="vol">
                                        <xsl:value-of
                                            select="normalize-space(replace(., 'Band', ''))"/>
                                    </biblScope>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="cd">
        <xsl:choose>
            <xsl:when test="ancestor::p/citation | ancestor::p/mixed-citation | ancestor::p">
                <bibl>
                    <date when="{.}">
                        <xsl:apply-templates/>
                    </date>
                </bibl>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test=". != ''">
                    <date when="{.}">
                        <xsl:apply-templates/>
                    </date>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- 2 special rules for Springer that provides, beginning and end volume number -->

    <xsl:template match="VolumeIDStart">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="VolumeIDEnd">
        <xsl:apply-templates/>
    </xsl:template>


    <!-- Rule for RCS data -->
    <xsl:template match="volumeref/link">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="supplement">
        <biblScope unit="supplement">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>

    <xsl:template
        match="iid | iss | Issue | issue | issue-number | IssueID | issueref | wiley:numbering[@type = 'journalIssue'] | wiley:numbering[@type = 'supplement'] | wiley:issue | sb:issue-nr">
        <xsl:choose>
            <xsl:when test="ancestor::p/citation | ancestor::p/mixed-citation">
                <biblScope unit="issue">
                    <xsl:apply-templates/>
                </biblScope>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="normalize-space(.) and . != '0'">
                    <biblScope unit="issue">
                        <xsl:choose>
                            <xsl:when
                                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0019-1019' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '17'">
                                <xsl:text>1</xsl:text>
                            </xsl:when>
                            <xsl:when
                                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0019-1019' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '18'">
                                <xsl:text>2</xsl:text>
                            </xsl:when>
                            <xsl:when
                                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0019-1019' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '10'">
                                <xsl:text>1</xsl:text>
                            </xsl:when>
                            <xsl:when
                                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0019-1019' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '11'">
                                <xsl:text>2</xsl:text>
                            </xsl:when>
                            <xsl:when
                                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0066-4812' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '3‐1'">
                                <xsl:text>1</xsl:text>
                            </xsl:when>
                            <xsl:when
                                test="//wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0066-4812' and //wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalVolume'] = '10-11'">
                                <xsl:text>1</xsl:text>
                            </xsl:when>
                            <xsl:when
                                test="//wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0883-024X' and //wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalVolume'] = '17'">
                                <xsl:text>1-2</xsl:text>
                            </xsl:when>
                            <xsl:when
                                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0883-024X' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '4‐1'">
                                <xsl:text>1</xsl:text>
                            </xsl:when>
                            <xsl:when
                                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0883-024X' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '2'">
                                <xsl:text>2-3</xsl:text>
                            </xsl:when>
                            <xsl:when
                                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '03‐04'">
                                <xsl:text>3-4</xsl:text>
                            </xsl:when>
                            <xsl:when
                                test="//wiley:component/wiley:header/wiley:publicationMeta/wiley:issn[@type = 'print'] = '0931-2439' and //wiley:component/wiley:header/wiley:publicationMeta/wiley:numberingGroup/wiley:numbering[@type = 'journalIssue'] = '3‐4–4'">
                                <xsl:text>3-4</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="normalize-space(translate(., 'n', ''))"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </biblScope>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- 2 special rules for Springer that provides, beginning and end volume number -->

    <xsl:template match="IssueIDStart">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="IssueIDEnd">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Rule for RCS data -->
    <xsl:template match="issueref/link">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- we do not consider the number of issues in a volume (Springer <Publisher>) -->

    <xsl:template match="VolumeIssueCount"/>

    <xsl:template match="BookVolumeNumber | book-volume-number">
        <biblScope unit="vol" from="{.}" to="{.}">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>

    <!-- Pagination -->

    <xsl:template
        match="spn | FirstPage | ArticleFirstPage | fpage | rsc:fpage | first-page | sb:first-page | ChapterFirstPage | ppf | wiley:numbering[@type = 'pageFirst'] | wiley:pageFirst">
        <xsl:choose>
            <xsl:when test="ancestor::mixed-citation">
                <biblScope unit="page" from="{translate(normalize-space(.),' ','')}">
                    <xsl:value-of select="normalize-space(.)"/>
                </biblScope>
            </xsl:when>
            <xsl:when
                test="ancestor::p/citation | ancestor::p/mixed-citation | ancestor::product/. | ancestor::p">
                <bibl>
                    <biblScope unit="page" from="{translate(normalize-space(.),' ','')}">
                        <xsl:value-of select="normalize-space(.)"/>
                    </biblScope>
                </bibl>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if
                    test="normalize-space(.) and not(contains(., 'n/a')) and not(contains(., 'Unassigned'))">
                    <biblScope unit="page" from="{translate(normalize-space(.),'  p.','')}">
                        <xsl:value-of select="."/>
                    </biblScope>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="pages | rsc:pages">
        <xsl:apply-templates/>
    </xsl:template>


    <!-- SG: nettoyage caractéres polluants dans les données -->
    <xsl:template
        match="epn | LastPage | ArticleLastPage | lpage | rsc:lpage | last-page | ChapterLastPage | sb:last-page | ppl | wiley:numbering[@type = 'pageLast'] | wiley:pageLast">
        <xsl:choose>
            <xsl:when test="ancestor::mixed-citation">
                <biblScope unit="page" to="{translate(normalize-space(.),' ','')}">
                    <xsl:value-of select="translate(normalize-space(.), ' ', '')"/>
                </biblScope>
            </xsl:when>
            <xsl:when test="ancestor::p/citation | ancestor::p/mixed-citation | ancestor::p">
                <bibl>
                    <biblScope unit="page" to="{translate(normalize-space(.),' ','')}">
                        <xsl:value-of select="translate(normalize-space(.), ' ', '')"/>
                    </biblScope>
                </bibl>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if
                    test="normalize-space(.) and not(contains(., 'n/a')) and not(contains(., 'Unassigned'))">
                    <biblScope unit="page" to="{translate(normalize-space(.),' ','')}">
                        <xsl:value-of select="normalize-space(.)"/>
                    </biblScope>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="BookChapterCount">
        <biblScope unit="chapter-count">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>
    <xsl:template match="PartChapterCount">
        <biblScope unit="part-chapter-count">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>

    <!--SG - ajout nombre de pages -->
    <xsl:template match="wiley:count[@type = 'pageTotal']">
        <xsl:if test="normalize-space(@number)">
            <biblScope unit="page-count">
                <xsl:value-of select="@number"/>
            </biblScope>
        </xsl:if>
    </xsl:template>

    <!-- Publishers -->
    <!-- NLM V2.0: PublisherName -->
    <!-- NLM V2.3 article: publisher-loc, publisher-name  -->
    <!-- BMJ: publisher_name ??????, publisher-loc -->
    <!-- ScholarOne: publisher_name -->
    <!-- Sage: pub_name, pub_location -->
    <!-- Springer: PublisherName, PublisherLocation -->

    <xsl:template
        match="PublisherName | publisher_name | pub_name | publisher-name | tei:cell[@role = 'Publisher'] | wiley:publisherName | publisher/orgname/nameelt">
        <xsl:choose>
            <xsl:when test="ancestor::mixed-citation">
                <publisher>
                    <xsl:apply-templates/>
                </publisher>
            </xsl:when>
            <xsl:when test="ancestor::p/.">
                <bibl>
                    <publisher>
                        <xsl:apply-templates/>
                    </publisher>
                </bibl>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test=". != ''">
                    <publisher>
                        <xsl:choose>
                            <xsl:when test="contains(., 'Springer')">
                                <xsl:attribute name="ref"
                                    >https://scientific-publisher.data.istex.fr/ark:/67375/H02-SWLMH5L1-1</xsl:attribute>
                                <xsl:apply-templates/>
                            </xsl:when>
                            <xsl:when test="contains(., 'S. Karger AG')">
                                <xsl:attribute name="ref"
                                    >https://scientific-publisher.data.istex.fr/ark:/67375/H02-C761LTQC-4</xsl:attribute>
                                <xsl:apply-templates/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </publisher>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="publisher-name" mode="conf">
        <respStmt>
            <resp>Programme Organizer</resp>
            <name>
                <xsl:apply-templates/>
            </name>
        </respStmt>
    </xsl:template>

    <xsl:template match="publisher-loc | pub_location | PublisherLocation | wiley:publisherLoc">
        <xsl:choose>
            <xsl:when test="ancestor::mixed-citation">
                <pubPlace>
                    <xsl:apply-templates/>
                </pubPlace>
            </xsl:when>
            <xsl:when test="ancestor::p/citation">
                <pubPlace>
                    <xsl:apply-templates/>
                </pubPlace>
            </xsl:when>
            <xsl:when test="ancestor::p/.">
                <bibl>
                    <pubPlace>
                        <xsl:apply-templates/>
                    </pubPlace>
                </bibl>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test=". != ''">
                    <pubPlace>
                        <xsl:apply-templates/>
                    </pubPlace>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="reftxt/cd">
        <xsl:choose>
            <xsl:when test="contains(@year, 'in the press')">
                <date/>
            </xsl:when>
            <xsl:otherwise>
                <date>
                    <xsl:attribute name="when">
                        <!-- SG reprise de la date (ex:nrn3258_subject.xml)(26 Aug  2011)
                cibler sur attribut @year et non plus sur le text() + PL: cleaning of alphabetical characters in the year string -->
                        <!--xsl:apply-templates select="@year"/-->
                        <xsl:value-of select="replace(@year, '[a-zA-Z]', '')"/>
                    </xsl:attribute>
                    <xsl:value-of select="replace(@year, '[a-zA-Z]', '')"/>
                </date>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- SG: nettoyage caractéres polluants dans les données -->
    <xsl:template match="wiley:pubYear">
        <date>
            <xsl:attribute name="when">
                <xsl:choose>
                    <xsl:when test="@year">
                        <xsl:value-of
                            select="translate(@year, ',.[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ]', '')"
                        />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of
                            select="translate(., ',.[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ]', '')"
                        />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="@year">
                    <xsl:value-of
                        select="translate(@year, ',.[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ]', '')"
                    />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of
                        select="translate(., ',.[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ]', '')"
                    />
                </xsl:otherwise>
            </xsl:choose>
        </date>
    </xsl:template>
    <!-- conference -->
    <xsl:template match="ConferenceInfo">
        <meeting>
            <xsl:apply-templates select="ConfSeriesName"/>
            <xsl:apply-templates select="ConfEventAbbreviation"/>
            <xsl:apply-templates select="ConfNumber"/>
            <xsl:apply-templates select="ConfSeriesID"/>
            <xsl:apply-templates select="ConfEventID"/>
            <xsl:apply-templates select="ConfEventLocation"/>
            <xsl:if test="ConfEventDateStart | ConfEventDateEnd">
                <date>
                    <xsl:attribute name="from">
                        <xsl:apply-templates select="ConfEventDateStart"/>
                    </xsl:attribute>
                    <xsl:attribute name="to">
                        <xsl:apply-templates select="ConfEventDateEnd"/>
                    </xsl:attribute>
                </date>
            </xsl:if>
        </meeting>
    </xsl:template>
    <xsl:template match="ConfSeriesName">
        <title type="name">
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <xsl:template match="ConfEventAbbreviation">
        <title type="abbrev">
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <xsl:template match="ConfNumber">
        <idno type="conf-number">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="ConfEventID">
        <idno type="conf-ID">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="ConfSeriesID">
        <idno type="{@Type}">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="ConfEventLocation">
        <xsl:if test="City">
            <settlement>
                <xsl:value-of select="City"/>
            </settlement>
        </xsl:if>
        <xsl:if test="Country">
            <country>
                <xsl:value-of select="Country"/>
            </country>
        </xsl:if>
    </xsl:template>
    <xsl:template match="ConfEventDateStart">
        <xsl:value-of
            select="concat(Year, (format-number(Month, '00')), (format-number(Day, '00')))"/>
    </xsl:template>
    <xsl:template match="ConfEventDateEnd">
        <xsl:value-of
            select="concat(Year, (format-number(Month, '00')), (format-number(Day, '00')))"/>
    </xsl:template>
    <xsl:template name="codeLang">
        <xsl:variable name="codeDoi">
            <xsl:value-of
                select="//article_id[@id_type = 'doi'] | //article-id[@pub-id-type = 'doi']"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$codeDoi = '10.1093/mnras/144.4.449'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/97.6.423'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/50.4.217'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/150.1.111'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/qmath/os-7.1.20'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/161.4.421'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/120.1.43'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/187.4.797'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/144.3.359'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/107.5-6.433'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/92.9.868'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/153.2.241'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/113.6.683'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/92.4.322'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/114.4.490'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/43.3.97'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/91.2.242'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/148.3.239'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/93.5.325'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/161.3.331'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/50.5.310'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/89.4.367'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/117.2.212'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/108.6.446'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/136.1.51'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/bjps/IX.34.178'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/bjps/XV.60.281'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/141.1.109'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/150.3.279'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/183.4.595'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/qmath/os-4.1.258'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/108.3.252'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/145.4.457'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/116.1.10'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/88.3.213'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/182.3.423'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/189.3.601'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1046/j.1365-8711.2000.03538.x'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/145.2.131'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/187.3.405'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/143.1.55'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/93.4.283'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/153.1.41'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/90.3.306'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/140.3.331'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/92.6.500'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/119.6.657'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/30.2.36'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/157.4.433'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/101.3.143'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/126.6.519'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.2307/1234967'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/199.3.735'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/90.4.457'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/148.1.103'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/114.5.583'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/161.3.213'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/91.1.128'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/115.2.131'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/91.1.109'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/156.2.165'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/157.2.171'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/128.4.307'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/154.2.125'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/110.1.15'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/129.6.419'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/90.1.17'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/91.2.239'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/180.4.551'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/59.6.358'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/193.3.525'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/158.4.463'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/112.2.177'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/115.3.338'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/91.5.483'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1112/jlms/s1-3.2.137'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/104.2.99'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/163.2.209'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/128.4.295'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/142.4.473'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1111/j.1365-246X.1962.tb02977.x'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/177.3.687'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/144.4.425'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/70.4.338'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/128.5.389'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/115.1.3'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/152.2.197'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/103.4.173'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/91.3.274'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/91.5.490'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/144.2.159'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/101.2.52'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/117.1.95'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/89.6.589'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/96.5.402'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/91.4.396'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/125.2.169'">en</xsl:when>
            <xsl:when test="$codeDoi = '10.1093/mnras/90.3.326'">en</xsl:when>
            <xsl:otherwise>en</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="refdoi">
        <idno type="doi">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
</xsl:stylesheet>
