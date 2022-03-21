<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rsc="http://www.rsc.org/schema/rscart38" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" method="xml"/>

    <!-- TEI document structure, creation of main header components, front (abstract), body, and back -->
    <!-- Le format de la RCS utilise essentiellement des composant NLM en ayant pris le soin (!) de définir ses propres constructions ici el là. -->
    <!-- On sent le travail visionaire du grouillot... -->
    <xsl:template match="article[art-admin] | rsc:article[rsc:art-admin]">
        <TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <xsl:choose>
                            <xsl:when test=" //art-body/news-section/news-article/art-front/titlegrp/title | //rsc:art-body/rsc:news-section/rsc:news-article/rsc:art-front/rsc:titlegrp/title">
                                <xsl:for-each select="//art-body/news-section/news-article/art-front/titlegrp/title | //rsc:art-body/rsc:news-section/rsc:news-article/rsc:art-front/rsc:titlegrp/title">
                                    <title level="a" type="main">
                                        <xsl:value-of select="p | rsc:p"/>
                                    </title>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="//article/art-front/titlegrp/title/fnoteref | //rsc:article/rsc:art-front/rsc:titlegrp/rsc:title/rsc:fnoteref">
                                    <title level="a" type="main">
                                        <xsl:value-of select="//article/art-front/titlegrp/title/text() | //rsc:article/rsc:art-front/rsc:titlegrp/rsc:title/text()"/>
                                    </title>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="art-front/titlegrp/title | rsc:art-front/rsc:titlegrp/rsc:title"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <publisher>
                        <xsl:choose>
                            <xsl:when test="//article/published[@type='subsyear'][1]/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt !=''">
                                    <xsl:value-of select="//article/published[@type='subsyear'][1]/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt"/>
                            </xsl:when>
                            <xsl:when test="//article/published[@type='book']/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt !=''">
                                    <xsl:value-of select="//article/published[@type='book']/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt"/>
                            </xsl:when>
                            <xsl:when test="//article/published[@type='print']/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt !=''">
                                <xsl:value-of select="//article/published[@type='print']/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt"/>
                            </xsl:when>
                            <xsl:otherwise>The Royal Society of Chemistr</xsl:otherwise>
                        </xsl:choose>
                        </publisher>
                        <availability>
                            <xsl:if test="//@price-code='free'">
                                <xsl:attribute name="status">free</xsl:attribute>
                                <p>Open Access</p>
                            </xsl:if>
                            <p>
                                <xsl:choose>
                                    <xsl:when test="//article/published[@type='subsyear'][1]/journalref/cpyrt | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:cpyrt!=''">
                                        <xsl:value-of select="//article/published[@type='subsyear'][1]/journalref/cpyrt | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:cpyrt"/>
                                    </xsl:when>
                                    <xsl:when test="//article/published[@type='book']/journalref/cpyrt | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:cpyrt !=''">
                                        <xsl:value-of select="//article/published[@type='book']/journalref/cpyrt | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:cpyrt"/>
                                    </xsl:when>
                                    <xsl:when test="//article/published[@type='print']/journalref/cpyrt | //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:cpyrt !=''">
                                        <xsl:value-of select="//article/published[@type='print']/journalref/cpyrt | //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:cpyrt"/>
                                    </xsl:when>
                                    <xsl:otherwise>The Royal Society of Chemistr</xsl:otherwise>
                                </xsl:choose>
                            </p>
                        </availability>
                        <date type="published">
                            <xsl:attribute name="when">
                                <xsl:value-of select="//article/published[@type='subsyear'][1]/pubfront/date/year
                                    |//article/published[@type='book']/pubfront/date/year
                                    | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:pubfront/rsc:date/rsc:year
                                    |//rsc:article/rsc:published[@type='book']/rsc:pubfront/rsc:date/rsc:year"/>
                            </xsl:attribute>
                            <xsl:value-of select="//article/published[@type='subsyear'][1]/pubfront/date/year
                                |//article/published[@type='book']/pubfront/date/year
                                | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:pubfront/rsc:date/rsc:year
                                |//rsc:article/rsc:published[@type='book']/rsc:pubfront/rsc:date/rsc:year"/>
                        </date>
                    </publicationStmt>
                    <notesStmt>
                        <note type="content-type">
                            <xsl:variable name="articleType" select="normalize-space(//articletype/@pubmedForm |//rsc:articletype/@pubmedForm)"/>
                            <xsl:variable name="codeGenreRSCSource">
                                <xsl:choose>
                                    <xsl:when test="//article/@type | //rsc:article/@type='ART'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='REV'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='EDI'">editorial</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='EDG'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='FEA'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='TRV'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='CRV'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='CVR'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='CRV'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='BKR'">book-reviews</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='ASU'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='COM'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='ESS'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='NTP'">research-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='RES'">research-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='KEY'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='PER'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='LET'">research-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='TRV'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='TEC'">research-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='HIG'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='INV'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='FOC'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='DIS'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='HOT'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='OTH'">other</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='SAB'">abstract</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='EMA'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='CMT'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='OPN'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='APP'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='FRO'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='AFO'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='CRP'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='EDU'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='MET'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='IRE'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='VPT'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='FOR'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='ILN'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='MES'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='AMS'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='ESS'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='WAT'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='NTP'">research-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='RES'">research-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='KEY'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='ANL'">research-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='TWA'">research-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='MRV'">review-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='FAB'">research-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='CAR'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='NWS'">article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='TIN'">research-article</xsl:when>
                                    <xsl:when test="//article/@type | //rsc:article/@type='PRO'">other</xsl:when>
                                    <!-- pubmed mis en second plan car non fiable!-->
                                    <xsl:when test="$articleType='abstract'">abstract</xsl:when>
                                    <xsl:when test="$articleType='addendum'">other</xsl:when>
                                    <xsl:when test="$articleType='announcement'">other</xsl:when>
                                    <xsl:when test="$articleType='article-commentary'">review-article</xsl:when>
                                    <xsl:when test="$articleType='book-review'">book-reviews</xsl:when>
                                    <xsl:when test="$articleType='books-received'">other</xsl:when>
                                    <xsl:when test="$articleType='other'">other</xsl:when>
                                    <xsl:when test="$articleType='brief-report'">brief-communication</xsl:when>
                                    <xsl:when test="$articleType='calendar'">other</xsl:when>
                                    <xsl:when test="$articleType='case-report'">case-report</xsl:when>
                                    <xsl:when test="$articleType='collection'">other</xsl:when>
                                    <xsl:when test="$articleType='correction'">article</xsl:when>
                                    <xsl:when test="$articleType='dissertation'">other</xsl:when>
                                    <xsl:when test="$articleType='discussion'">other</xsl:when>
                                    <xsl:when test="$articleType='editorial'">editorial</xsl:when>
                                    <xsl:when test="$articleType='in-brief'">other</xsl:when>
                                    <xsl:when test="$articleType='introduction'">other</xsl:when>
                                    <xsl:when test="$articleType='letter'">article</xsl:when>
                                    <xsl:when test="$articleType='meeting-report'">conference</xsl:when>
                                    <xsl:when test="$articleType='news'">article</xsl:when>
                                    <xsl:when test="$articleType='obituary'">other</xsl:when>
                                    <xsl:when test="$articleType='oration'">other</xsl:when>
                                    <xsl:when test="$articleType='other'">
                                        <xsl:choose>
                                            <xsl:when test="//abstract |rsc:abstract[string-length() &gt; 0] and contains(//article-meta/fpage |//rsc:article-meta/rsc:fpage,'s') or contains(//article-meta/fpage | //rsc:article-meta/rsc:fpage,'S')">article</xsl:when>
                                            <xsl:otherwise>other</xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="$articleType='partial-retraction'">other</xsl:when>
                                    <xsl:when test="$articleType='poster'">conference</xsl:when>
                                    <xsl:when test="$articleType='product-review'">other</xsl:when>
                                    <xsl:when test="$articleType='rapid-communication'">brief-communication</xsl:when>
                                    <xsl:when test="$articleType='reply'">article</xsl:when>
                                    <xsl:when test="$articleType='reprint'">other</xsl:when>
                                    <xsl:when test="$articleType='research-article'">research-article</xsl:when>
                                    <xsl:when test="$articleType='retraction'">other</xsl:when>
                                    <xsl:when test="$articleType='review-article'">review-article</xsl:when>
                                    <xsl:when test="$articleType='translation'">other</xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="//abstract |rsc:abstract[string-length() &gt; 0]">article</xsl:when>
                                            <xsl:otherwise>other</xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="codeGenreRSCArk">
                                <xsl:choose>
                                    <xsl:when test="$codeGenreRSCSource='research-article'">https://content-type.data.istex.fr/ark:/67375/XTP-1JC4F85T-7</xsl:when>
                                    <xsl:when test="$codeGenreRSCSource='article'">https://content-type.data.istex.fr/ark:/67375/XTP-6N5SZHKN-D</xsl:when>
                                    <xsl:when test="$codeGenreRSCSource='other'">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:when>
                                    <xsl:when test="$codeGenreRSCSource='book-reviews'">https://content-type.data.istex.fr/ark:/67375/XTP-PBH5VBM9-4</xsl:when>
                                    <xsl:when test="$codeGenreRSCSource='abstract'">https://content-type.data.istex.fr/ark:/67375/XTP-HPN7T1Q2-R</xsl:when>
                                    <xsl:when test="$codeGenreRSCSource='review-article'">https://content-type.data.istex.fr/ark:/67375/XTP-L5L7X3NF-P</xsl:when>
                                    <xsl:when test="$codeGenreRSCSource='brief-communication'">https://content-type.data.istex.fr/ark:/67375/XTP-S9SX2MFS-0</xsl:when>
                                    <xsl:when test="$codeGenreRSCSource='editorial'">https://content-type.data.istex.fr/ark:/67375/XTP-STW636XV-K</xsl:when>
                                    <xsl:when test="$codeGenreRSCSource='case-report'">https://content-type.data.istex.fr/ark:/67375/XTP-29919SZJ-6</xsl:when>
                                    <xsl:when test="$codeGenreRSCSource='conference'">https://content-type.data.istex.fr/ark:/67375/XTP-BFHXPBJJ-3</xsl:when>
                                    <xsl:when test="$codeGenreRSCSource='chapter'">https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6</xsl:when>
                                    <xsl:when test="$codeGenreRSCSource='book'">https://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T</xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <!-- niveau article / chapter -->
                            <xsl:attribute name="source">
                                <xsl:choose>
                                    <xsl:when test="//article/@type | //rsc:article/@type |//@articleType">
                                        <xsl:value-of select="$codeGenreRSCSource"/>
                                    </xsl:when>
                                    <xsl:when test="$articleType">
                                        <xsl:value-of select="$articleType"/>
                                    </xsl:when>
                                    <xsl:otherwise>N/A</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:attribute name="scheme">
                                <xsl:value-of select="$codeGenreRSCArk"/>
                            </xsl:attribute>
                            <xsl:value-of select="$codeGenreRSCSource"/>
                        </note>
                        <note type="publication-type">
                            <xsl:choose>
                                <xsl:when test="//published[@type='book']/journalref/issn[@type='isbn'] | //rsc:published[@type='book']/rsc:journalref/rsc:issn[@type='isbn'][string-length() &gt; 0] and //published[@type='subsyear'][1]/journalref/issn[@type='print'] | //rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:issn[@type='print'][string-length() &gt; 0]">
                                <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                <xsl:text>book-series</xsl:text>
                            </xsl:when>
                                <xsl:when test="//published[@type='book'] | //rsc:published[@type='book']">
                                <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                <xsl:text>book</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0GLKJH51-B</xsl:attribute>
                                <xsl:text>journal</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                        </note>
                    </notesStmt>
                    <sourceDesc>
                        <xsl:apply-templates select="." mode="sourceDesc"/>
                    </sourceDesc>
                </fileDesc>
                <!-- versionning -->
                <xsl:call-template name="insertVersion"/>
                
                    <profileDesc>
                        <!-- ******************* Language / eng par défaut voir xsd ******************************-->
                        <langUsage>
                            <language ident="en">en</language>
                        </langUsage>
                        <xsl:if test="art-front/abstract | rsc:art-front/rsc:abstract">
                            <!-- PL: abstract is moved from <front> to here -->
                            <xsl:apply-templates select="art-front/abstract | rsc:art-front/rsc:abstract"/>
                            
                        </xsl:if>
                        <xsl:if test="art-front/keyword | rsc:art-front/rsc:keyword">
                            <textClass>
                                <keywords scheme="keyword">
                                    <xsl:apply-templates select="art-front/keyword | rsc:art-front/rsc:keyword"/>
                                </keywords>
                            </textClass>
                        </xsl:if>
                    </profileDesc>
                
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$releasedate}" who="istex" xml:id="pub2tei">formatting</change>
                </revisionDesc>
            </teiHeader>
            <text>
                <xsl:choose>
                    <xsl:when test="//news-section | //rsc:news-section">
                        <body>
                        <div type="news-section">
                            <xsl:apply-templates select="art-body/* | rsc:art-body/*"/> 
                        </div>
                        </body>
                    </xsl:when>
                    <xsl:otherwise>
                        <body>
                            <xsl:choose>
                                <xsl:when test="art-body | rsc:art-body !=''">
                                    <xsl:apply-templates select="art-body/* | rsc:art-body/*"/> 
                                </xsl:when>
                                <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                                    <div>
                                        <p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
                                    </div>
                                </xsl:when>
                                <xsl:otherwise>
                                    <div><p></p></div>
                                </xsl:otherwise>
                            </xsl:choose>
                        </body>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="art-back | rsc:art-back !=''">
                <back>
                    <xsl:apply-templates select="art-back/*| rsc:art-back/*"/>
                </back>
               </xsl:if>
            </text>
        </TEI>
    </xsl:template>

    <!-- Traitement des méta-données (génération de l'entête TEI) -->


    <!-- Building the sourceDesc bibliographical representation -->
    <xsl:template match="article[art-admin] | rsc:article[rsc:art-admin]" mode="sourceDesc">
        <biblStruct type="article">
            <analytic>
                <!-- Title information related to the paper goes here -->
                <xsl:choose>
                    <xsl:when test="//art-body/news-section/news-article/art-front/titlegrp/title
                        |//rsc:art-body/rsc:news-section/rsc:news-article/rsc:art-front/rsc:titlegrp/rsc:title">
                        <xsl:for-each select="//art-body/news-section/news-article/art-front/titlegrp/title|//rsc:art-body/rsc:news-section/rsc:news-article/rsc:art-front/rsc:titlegrp/rsc:title">
                            <title level="a" type="main">
                                <xsl:value-of select="p | rsc:p"/>
                            </title>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="art-front/titlegrp/title | rsc:art-front/rsc:titlegrp/rsc:title"/>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- All authors are included here -->
                <xsl:apply-templates select="//art-front/authgrp/author | //rsc:art-front/rsc:authgrp/rsc:author"/>
                
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
                
                <xsl:apply-templates select="art-admin/doi | rsc:art-admin/rsc:doi"/>
                <xsl:apply-templates select="art-admin/sici | rsc:art-admin/rsc:sici"/>
                <xsl:apply-templates select="art-admin/pii | rsc:art-admin/rsc:pii"/>
                <xsl:apply-templates select="art-admin/ms-id | rsc:art-admin/rsc:ms-id"/>
            </analytic>
            <monogr>
                <xsl:choose>
                    <xsl:when test="//article/published[@type='print']/journalref/title[@type='full'] | //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:title[@type='full'] !=''">
                        <title level="j" type="main">
                            <xsl:value-of select="//article/published[@type='print']/journalref/title[@type='full']| //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:title[@type='full']"/>
                        </title>
                    </xsl:when>
                    <xsl:when test="//article/published[@type='subsyear'][1]/journalref/title[@type='full'] | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:title[@type='full'] !=''">
                        <title level="j" type="main">
                            <xsl:value-of select="//article/published[@type='subsyear'][1]/journalref/title[@type='full']| //rsc:article/rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:title[@type='full']"/>
                        </title>
                    </xsl:when>
                    <xsl:when test="//article/published[@type='print']/journalref/title | //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:title !=''">
                        <title level="j" type="main">
                            <xsl:value-of select="//article/published[@type='print']/journalref/title| //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:title "/>
                        </title>
                    </xsl:when>
                    <xsl:when test="//article/published[@type='book']/journalref/title[@type='full'] | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:title[@type='full'] !=''">
                        <title level="m" type="main">
                            <xsl:value-of select="//article/published[@type='book']/journalref/title[@type='full']| //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:title[@type='full']"/>
                        </title>
                    </xsl:when>
                    <xsl:when test="//article/published[@type='book']/journalref/title | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:title !=''">
                        <title level="m" type="main">
                            <xsl:value-of select="//article/published[@type='book']/journalref/title | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:title"/>
                        </title>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="code">
                            <xsl:value-of select="normalize-space(//rsc:published[@type='print']/rsc:journalref/rsc:link | //published[@type='print']/journalref/link)"/>
                        </xsl:variable>
                        <xsl:variable name="code2">
                            <xsl:choose>
                                <xsl:when test="$code='AA'">Annual Reports on Analytical Atomic Spectroscopy</xsl:when>
                                <xsl:when test="$code='AC'">Analytical Communications</xsl:when>
                                <xsl:when test="$code='AD'">Proceedings of the Analytical Division of the Chemical Society</xsl:when>
                                <xsl:when test="$code='AP'">Analytical Proceedings</xsl:when>
                                <xsl:when test="$code='AI'">Analytical Proceedings including Analytical Communications</xsl:when>
                                <xsl:when test="$code='AN'">The Analyst</xsl:when>
                                <xsl:when test="$code='AR'">Annual Reports on the Progress of Chemistry</xsl:when>
                                <xsl:when test="$code='AS'">Selected Annual Reviews of the Analytical Sciences</xsl:when>
                                <xsl:when test="$code='AY'">Analytical Methods</xsl:when>
                                <xsl:when test="$code='C1'">Chemical Communications (London)</xsl:when>
                                <xsl:when test="$code='C2'">Journal of the Chemical Society D: Chemical Communications</xsl:when>
                                <xsl:when test="$code='C3'">Journal of the Chemical Society, Chemical Communications</xsl:when>
                                <xsl:when test="$code='CA'">Journal of the Chemical Society, Abstracts</xsl:when>
                                <xsl:when test="$code='CC'">Chemical Communications</xsl:when>
                                <xsl:when test="$code='CE'">Crystal Engineering Communications</xsl:when>
                                <xsl:when test="$code='CO'">Contemporary Organic Synthesis</xsl:when>
                                <xsl:when test="$code='CP'">Physical Chemistry Chemical Physics</xsl:when>
                                <xsl:when test="$code='CS'">Chemical Society Reviews</xsl:when>
                                <xsl:when test="$code='CT'">Journal of the Chemical Society, Transactions</xsl:when>
                                <xsl:when test="$code='CW'">Chemistry World</xsl:when>
                                <xsl:when test="$code='CY'">Catalysis Science &amp; Technology</xsl:when>
                                <xsl:when test="$code='DC'">Faraday Discussions of the Chemical Society</xsl:when>
                                <xsl:when test="$code='DF'">Discussions of the Faraday Society</xsl:when>
                                <xsl:when test="$code='DT'">Dalton Transactions</xsl:when>
                                <xsl:when test="$code='EC'">Education in Chemistry</xsl:when>
                                <xsl:when test="$code='EE'">Energy &amp; Environmental Science</xsl:when>
                                <xsl:when test="$code='EM'">Journal of Environmental Monitoring</xsl:when>
                                <xsl:when test="$code='ET'">Issues in Environmental Science and Technology</xsl:when>
                                <xsl:when test="$code='F1'">Journal of the Chemical Society, Faraday Transactions 1: Physical Chemistry in Condensed Phases</xsl:when>
                                <xsl:when test="$code='F2'">Journal of the Chemical Society, Faraday Transactions 2: Molecular and Chemical Physics</xsl:when>
                                <xsl:when test="$code='FD'">Faraday Discussions</xsl:when>
                                <xsl:when test="$code='FO'">Food &amp; Function</xsl:when>
                                <xsl:when test="$code='FS'">Faraday Symposia of the Chemical Society</xsl:when>
                                <xsl:when test="$code='FT'">Journal of the Chemical Society, Faraday Transactions</xsl:when>
                                <xsl:when test="$code='GC'">Green Chemistry</xsl:when>
                                <xsl:when test="$code='GR'">Annual Reports on the Progress of Chemistry, Sect. A: General Physical and Inorganic Chemistry</xsl:when>
                                <xsl:when test="$code='GT'">Geochemical Transactions</xsl:when>
                                <xsl:when test="$code='IB'">Integrative Biology</xsl:when>
                                <xsl:when test="$code='IC'">Annual Reports Section "A" (Inorganic Chemistry)</xsl:when>
                                <xsl:when test="$code='J1'">Journal of the Chemical Society A: Inorganic, Physical, Theoretical</xsl:when>
                                <xsl:when test="$code='J2'">Journal of the Chemical Society B: Physical Organic</xsl:when>
                                <xsl:when test="$code='J3'">Journal of the Chemical Society C: Organic</xsl:when>
                                <xsl:when test="$code='JA'">Journal of Analytical Atomic Spectrometry</xsl:when>
                                <xsl:when test="$code='JC'">Journal of Chemical Research, Synopses</xsl:when>
                                <xsl:when test="$code='JG'">Journal and Proceedings of the Institute of Chemistry of Great Britain and Ireland</xsl:when>
                                <xsl:when test="$code='JI'">Journal of the Royal Institute of Chemistry</xsl:when>
                                <xsl:when test="$code='JM'">Journal of Materials Chemistry</xsl:when>
                                <xsl:when test="$code='JP'">Journal and Proceedings of the Royal Institute of Chemistry</xsl:when>
                                <xsl:when test="$code='JR'">Journal of the Chemical Society (Resumed)</xsl:when>
                                <xsl:when test="$code='JS'">Journal of the Chemical Society</xsl:when>
                                <xsl:when test="$code='LC'">Lab on a Chip</xsl:when>
                                <xsl:when test="$code='M1'">Jubilee of the Chemical Society</xsl:when>
                                <xsl:when test="$code='MB'">Molecular BioSystems</xsl:when>
                                <xsl:when test="$code='MC'">Mendeleev Communications</xsl:when>
                                <xsl:when test="$code='MD'">Medicinal Chemistry Communications</xsl:when>
                                <xsl:when test="$code='MP'">Memoirs and Proceedings of the Chemical Society</xsl:when>
                                <xsl:when test="$code='MT'">Metallomics</xsl:when>
                                <xsl:when test="$code='NJ'">New Journal of Chemistry</xsl:when>
                                <xsl:when test="$code='NP'">Natural Product Reports</xsl:when>
                                <xsl:when test="$code='NR'">Nanoscale</xsl:when>
                                <xsl:when test="$code='OB'">Organic &amp; Biomolecular Chemistry</xsl:when>
                                <xsl:when test="$code='OC'">Annual Reports Section "B" (Organic Chemistry)</xsl:when>
                                <xsl:when test="$code='P1'">Journal of the Chemical Society, Perkin Transactions 1</xsl:when>
                                <xsl:when test="$code='P2'">Journal of the Chemical Society, Perkin Transactions 2</xsl:when>
                                <xsl:when test="$code='PC'">Annual Reports Section "C" (Physical Chemistry)</xsl:when>
                                <xsl:when test="$code='PG'">Proceedings of the Institute of Chemistry of Great Britain and Ireland</xsl:when>
                                <xsl:when test="$code='PL'">Proceedings of the Chemical Society, London</xsl:when>
                                <xsl:when test="$code='PO'">Pesticide Outlook</xsl:when>
                                <xsl:when test="$code='PP'">Photochemical &amp; Photobiological Sciences</xsl:when>
                                <xsl:when test="$code='PR'">Annual Reports on the Progress of Chemistry, Sect. A: Physical and Inorganic Chemistry</xsl:when>
                                <xsl:when test="$code='PS'">Proceedings of the Chemical Society</xsl:when>
                                <xsl:when test="$code='PY'">Polymer Chemistry</xsl:when>
                                <xsl:when test="$code='QJ'">Quarterly Journal of the Chemical Society</xsl:when>
                                <xsl:when test="$code='QR'">Quarterly Review of the Chemical Society</xsl:when>
                                <xsl:when test="$code='QU'">Physical Chemistry Communications</xsl:when>
                                <xsl:when test="$code='RA'">RSC Advances</xsl:when>
                                <xsl:when test="$code='RC'">Russian Chemical Reviews</xsl:when>
                                <xsl:when test="$code='RG'">Journal and Proceedings of the Royal Institute of Chemistry of Great Britain and Ireland</xsl:when>
                                <xsl:when test="$code='RP'">Chemistry Education Research and Practice</xsl:when>
                                <xsl:when test="$code='RR'">Royal Institute of Chemistry Reviews</xsl:when>
                                <xsl:when test="$code='S1'">Faraday Special Discussions of the Chemical Society</xsl:when>
                                <xsl:when test="$code='SA'">Proceedings of the Society for Analytical Chemistry</xsl:when>
                                <xsl:when test="$code='SC'">Chemical Science</xsl:when>
                                <xsl:when test="$code='SD'">Special Discussions of the Faraday Society</xsl:when>
                                <xsl:when test="$code='SF'">Symposia of the Faraday Society</xsl:when>
                                <xsl:when test="$code='SM'">Soft Matter</xsl:when>
                                <xsl:when test="$code='TF'">Transactions of the Faraday Society</xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="code3">
                            <xsl:choose>
                                <xsl:when test="$code='AA'">Annu. Rep. Anal. At. Spectrosc.</xsl:when>
                                <xsl:when test="$code='AC'">Anal. Commun.</xsl:when>
                                <xsl:when test="$code='AD'">Proc. Anal. Div. Chem. Soc.</xsl:when>
                                <xsl:when test="$code='AP'">Anal. Proc.</xsl:when>
                                <xsl:when test="$code='AI'">Anal. Proc.</xsl:when>
                                <xsl:when test="$code='AN'">Analyst</xsl:when>
                                <xsl:when test="$code='AR'">Annu. Rep. Prog. Chem.</xsl:when>
                                <xsl:when test="$code='AS'">Sel. Annu. Rev. Anal.</xsl:when>
                                <xsl:when test="$code='AY'">Anal. Methods</xsl:when>
                                <xsl:when test="$code='C1'">Chem. Commun. (London)</xsl:when>
                                <xsl:when test="$code='C2'">J. Chem. Soc. D</xsl:when>
                                <xsl:when test="$code='C3'">J. Chem. Soc., Chem. Commun.</xsl:when>
                                <xsl:when test="$code='CA'">J. Chem. Soc., Abstr.</xsl:when>
                                <xsl:when test="$code='CC'">Chem. Commun.</xsl:when>
                                <xsl:when test="$code='CE'">CrystEngComm</xsl:when>
                                <xsl:when test="$code='CO'">Contemp. Org. Synth.</xsl:when>
                                <xsl:when test="$code='CP'">Phys. Chem. Chem. Phys.</xsl:when>
                                <xsl:when test="$code='CS'">Chem. Soc. Rev.</xsl:when>
                                <xsl:when test="$code='CT'">J. Chem. Soc., Trans.</xsl:when>
                                <xsl:when test="$code='CW'">Chemistry world</xsl:when>
                                <xsl:when test="$code='CY'">Catal. Sci. Technol.</xsl:when>
                                <xsl:when test="$code='DC'">Faraday Discuss. Chem. Soc.</xsl:when>
                                <xsl:when test="$code='DF'">Discuss. Faraday Soc.</xsl:when>
                                <xsl:when test="$code='DT'">Dalton Trans.</xsl:when>
                                <xsl:when test="$code='EC'">Education in chemistry</xsl:when>
                                <xsl:when test="$code='EE'">Energy Environ. Sci.</xsl:when>
                                <xsl:when test="$code='EM'">J. Environ. Monit.</xsl:when>
                                <xsl:when test="$code='ET'">Issues in environmental science and technology</xsl:when>
                                <xsl:when test="$code='F1'">J. Chem. Soc., Faraday Trans. 1</xsl:when>
                                <xsl:when test="$code='F2'">J. Chem. Soc., Faraday Trans. 2</xsl:when>
                                <xsl:when test="$code='FD'">Faraday Discuss.</xsl:when>
                                <xsl:when test="$code='FO'">Food Funct.</xsl:when>
                                <xsl:when test="$code='FS'">Faraday Symp. Chem. Soc.</xsl:when>
                                <xsl:when test="$code='FT'">J. Chem. Soc., Faraday Trans.</xsl:when>
                                <xsl:when test="$code='GC'">Green Chem.</xsl:when>
                                <xsl:when test="$code='GR'">Annu. Rep. Prog. Chem., Sect. A. Gen. Phys and Inorg. Chem.</xsl:when>
                                <xsl:when test="$code='GT'">Geochem. Trans.</xsl:when>
                                <xsl:when test="$code='IB'">Integr. Biol.</xsl:when>
                                <xsl:when test="$code='IC'">Annu. Rep. Prog. Chem., Sect. A: Inorg. Chem.</xsl:when>
                                <xsl:when test="$code='J1'">J. Chem. Soc. A</xsl:when>
                                <xsl:when test="$code='J2'">J. Chem. Soc. B</xsl:when>
                                <xsl:when test="$code='J3'">J. Chem. Soc. C</xsl:when>
                                <xsl:when test="$code='JA'">J. Anal. At. Spectrom.</xsl:when>
                                <xsl:when test="$code='JC'">J. Chem. Res. (S)</xsl:when>
                                <xsl:when test="$code='JG'">J. Proc. Inst. Chem. GB Irel.</xsl:when>
                                <xsl:when test="$code='JI'">J. R. Inst. Chem.</xsl:when>
                                <xsl:when test="$code='JM'">J. Mater. Chem.</xsl:when>
                                <xsl:when test="$code='JP'">J. Proc. R. Inst. Chem.</xsl:when>
                                <xsl:when test="$code='JR'">J. Chem. Soc.</xsl:when>
                                <xsl:when test="$code='JS'">J. Chem. Soc.</xsl:when>
                                <xsl:when test="$code='LC'">Lab Chip</xsl:when>
                                <xsl:when test="$code='M1'">Jubilee Chem. Soc. London</xsl:when>
                                <xsl:when test="$code='MB'">Mol. BioSyst.</xsl:when>
                                <xsl:when test="$code='MC'">Mendeleev Commun.</xsl:when>
                                <xsl:when test="$code='MD'">Med. Chem. Commun.</xsl:when>
                                <xsl:when test="$code='MP'">Mem. Proc. Chem. Soc.</xsl:when>
                                <xsl:when test="$code='MT'">Metallomics</xsl:when>
                                <xsl:when test="$code='NJ'">NewJ. Chem.</xsl:when>
                                <xsl:when test="$code='NP'">Nat. Prod. Rep.</xsl:when>
                                <xsl:when test="$code='NR'">Nanoscale</xsl:when>
                                <xsl:when test="$code='OB'">Org. Biomol. Chem.</xsl:when>
                                <xsl:when test="$code='OC'">Annu. Rep. Prog. Chem., Sect. B: Org. Chem.</xsl:when>
                                <xsl:when test="$code='P1'">J. Chem. Soc., Perkin Trans. 1</xsl:when>
                                <xsl:when test="$code='P2'">J. Chem. Soc., Perkin Trans. 2</xsl:when>
                                <xsl:when test="$code='PC'">Annu. Rep. Prog. Chem., Sect. C: Phys. Chem.</xsl:when>
                                <xsl:when test="$code='PG'">Proc. Inst. Chem. GB Irel.</xsl:when>
                                <xsl:when test="$code='PL'">Proc. Chem. Soc., London</xsl:when>
                                <xsl:when test="$code='PO'">Pest. Outlook</xsl:when>
                                <xsl:when test="$code='PP'">Photochem. Photobiol. Sci.</xsl:when>
                                <xsl:when test="$code='PR'">Annu. Rep. Prog. Chem., Sect. A. Inorg. and Phys. Chem</xsl:when>
                                <xsl:when test="$code='PS'">Proc. Chem. Soc.</xsl:when>
                                <xsl:when test="$code='PY'">Polym. Chem.</xsl:when>
                                <xsl:when test="$code='QJ'">Q.J. Chem. Soc.</xsl:when>
                                <xsl:when test="$code='QR'">Q. Rev. Chem. Soc.</xsl:when>
                                <xsl:when test="$code='QU'">PhysChemComm</xsl:when>
                                <xsl:when test="$code='RA'">RSC Adv.</xsl:when>
                                <xsl:when test="$code='RC'">Russ. Chem. Rev.</xsl:when>
                                <xsl:when test="$code='RG'">J. Proc. R. Inst. Chem. GB Irel.</xsl:when>
                                <xsl:when test="$code='RP'">Chem. Educ. Res. Pract.</xsl:when>
                                <xsl:when test="$code='RR'">R. Inst. Chem., Rev.</xsl:when>
                                <xsl:when test="$code='S1'">Faraday Spec. Discuss. Chem. Soc.</xsl:when>
                                <xsl:when test="$code='SA'">Proc. Soc. Anal. Chem.</xsl:when>
                                <xsl:when test="$code='SC'">Chem. Sci.</xsl:when>
                                <xsl:when test="$code='SD'">Spec. Discuss. Faraday Soc.</xsl:when>
                                <xsl:when test="$code='SF'">Symp. Faraday Soc.</xsl:when>
                                <xsl:when test="$code='SM'">Soft Matter</xsl:when>
                                <xsl:when test="$code='TF'">Trans. Faraday Soc.</xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <title level="j" type="main">
                            <xsl:value-of select="$code2"/>
                        </title>
                        <title level="j" type="abbrev">
                            <xsl:value-of select="$code3"/> 
                        </title>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="//article/published[@type='print']/journalref/title[@type='abbreviated'] | //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:title[@type='abbreviated'] !=''">
                        <title level="j" type="abbrev">
                            <xsl:value-of select="//article/published[@type='print']/journalref/title[@type='abbreviated']| //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:title[@type='abbreviated']"/>
                        </title>
                    </xsl:when>
                    <xsl:when test="//article/published[@type='subsyear'][1]/journalref/title[@type='abbreviated'] | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:title[@type='abbreviated'] !=''">
                        <title level="j" type="abbrev">
                            <xsl:value-of select="//article/published[@type='subsyear'][1]/journalref/title[@type='abbreviated']| //rsc:article/rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:title[@type='abbreviated']"/>
                        </title>
                    </xsl:when>
                    <xsl:when test="//article/published[@type='book']/journalref/title[@type='abbreviated'] | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:title[@type='abbreviated'] !=''">
                        <title level="m" type="abbrev">
                            <xsl:value-of select="//article/published[@type='book']/journalref/title[@type='abbreviated']| //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:title[@type='abbreviated']"/>
                        </title>
                    </xsl:when>
                    <xsl:when test="//article/published[@type='print']/journalref/sercode | //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:sercode !=''">
                        <idno type="sercode">
                            <xsl:value-of select="//article/published[@type='print']/journalref/sercode | //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:sercode"/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="//article/published[@type='book']/journalref/sercode | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:sercode !=''">
                        <idno type="sercode">
                            <xsl:value-of select="//article/published[@type='book']/journalref/sercode | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:sercode"/>
                        </idno>
                    </xsl:when>
                </xsl:choose>
                
                <xsl:choose>
                    <xsl:when test="//article/published[@type='subsyear'][1]/journalref/issn | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:issn[string-length() &gt; 0]">
                        <xsl:for-each select="//article/published[@type='subsyear'][1]/journalref/issn | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:issn">
                        <idno>
                        <xsl:choose>
                            <xsl:when test=".[@type='isbn']"><xsl:attribute name="type">ISBN</xsl:attribute></xsl:when>
                            <xsl:when test=".[@type='print']"><xsl:attribute name="type">pISSN</xsl:attribute></xsl:when>
                            <xsl:when test=".[@type='online']"><xsl:attribute name="type">eISSN</xsl:attribute></xsl:when>
                        </xsl:choose>
                            <xsl:value-of select="."/>
                        </idno>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="//article/published[@type='print']/journalref/issn | //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:issn[string-length() &gt; 0]">
                        <xsl:for-each select="//article/published[@type='print']/journalref/issn| //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:issn">
                            <idno>
                                <xsl:choose>
                                    <xsl:when test=".[@type='isbn']"><xsl:attribute name="type">ISBN</xsl:attribute></xsl:when>
                                    <xsl:when test=".[@type='print']"><xsl:attribute name="type">pISSN</xsl:attribute></xsl:when>
                                    <xsl:when test=".[@type='online']"><xsl:attribute name="type">eISSN</xsl:attribute></xsl:when>
                                </xsl:choose>
                                <xsl:value-of select="."/>
                            </idno>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="//article/published[@type='web']/journalref/issn | //rsc:article/rsc:published[@type='web']/rsc:journalref/rsc:issn[string-length() &gt; 0]">
                        <xsl:for-each select="//article/published[@type='web']/journalref/issn | //rsc:article/rsc:published[@type='web']/rsc:journalref/rsc:issn">
                            <idno>
                                <xsl:choose>
                                    <xsl:when test=".[@type='isbn']"><xsl:attribute name="type">ISBN</xsl:attribute></xsl:when>
                                    <xsl:when test=".[@type='print']"><xsl:attribute name="type">pISSN</xsl:attribute></xsl:when>
                                    <xsl:when test=".[@type='online']"><xsl:attribute name="type">eISSN</xsl:attribute></xsl:when>
                                </xsl:choose>
                                <xsl:value-of select="."/>
                            </idno>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="//article/published[@type='book']/journalref/issn | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:issn[string-length() &gt; 0]">
                        <xsl:for-each select="//article/published[@type='book']/journalref/issn | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:issn">
                            <idno>
                                <xsl:choose>
                                    <xsl:when test=".[@type='isbn']"><xsl:attribute name="type">ISBN</xsl:attribute></xsl:when>
                                    <xsl:when test=".[@type='print']"><xsl:attribute name="type">pISSN</xsl:attribute></xsl:when>
                                    <xsl:when test=".[@type='online']"><xsl:attribute name="type">eISSN</xsl:attribute></xsl:when>
                                </xsl:choose>
                                <xsl:value-of select="."/>
                            </idno>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="//published[@type='print']/journalref/coden | //rsc:published[@type='print']/rsc:journalref/rsc:coden">
                        <idno type="CODEN">
                            <xsl:value-of select="//published[@type='print']/journalref/coden | //rsc:published[@type='print']/rsc:journalref/rsc:coden"/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="//published[@type='subsyear'][1]/journalref/coden | //rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:coden">
                        <idno type="CODEN">
                            <xsl:value-of select="//published[@type='subsyear'][1]/journalref/coden | //rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:coden"/>
                        </idno>
                    </xsl:when>
                </xsl:choose>
                <imprint>
                    <xsl:for-each select="article-meta/pub-date | rsc:article-meta/rsc:pub-date">
                        <xsl:message>Current: <xsl:value-of select="@pub-type"/></xsl:message>
                        <xsl:if test="year|rsc:year != '' and year|rsc:year !='0000'">
                            <xsl:message>Pubdate year: <xsl:value-of select="year|rsc:year"/></xsl:message>
                            <xsl:apply-templates select="."/>
                        </xsl:if>
                    </xsl:for-each>
                    <!-- publisher -->
                    <publisher>
                        <xsl:choose>
                            <xsl:when test="//article/published[@type='subsyear'][1]/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt !=''">
                                <xsl:value-of select="//article/published[@type='subsyear'][1]/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt"/>
                            </xsl:when>
                            <xsl:when test="//article/published[@type='book']/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt !=''">
                                <xsl:value-of select="//article/published[@type='book']/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='book']/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt"/>
                            </xsl:when>
                            <xsl:when test="//article/published[@type='print']/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt !=''">
                                <xsl:value-of select="//article/published[@type='print']/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt"/>
                            </xsl:when>
                            <xsl:otherwise>The Royal Society of Chemistr</xsl:otherwise>
                        </xsl:choose>
                    </publisher>
                    <!-- date de publication -->
                    <date type="published">
                        <xsl:attribute name="when">
                            <xsl:value-of select="//article/published[@type='subsyear'][1]/pubfront/date/year
                                |//article/published[@type='book']/pubfront/date/year
                                | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:pubfront/rsc:date/rsc:year
                                |//rsc:article/rsc:published[@type='book']/rsc:pubfront/rsc:date/rsc:year"/>
                        </xsl:attribute>
                        <xsl:value-of select="//article/published[@type='subsyear'][1]/pubfront/date/year
                            |//article/published[@type='book']/pubfront/date/year
                            | //rsc:article/rsc:published[@type='subsyear'][1]/rsc:pubfront/rsc:date/rsc:year
                            |//rsc:article/rsc:published[@type='book']/rsc:pubfront/rsc:date/rsc:year"/>
                    </date>
                    <!-- volume -->
                    <xsl:variable name="volume">
                        <xsl:variable name="book">
                            <xsl:value-of select="normalize-space(//published[@type='book']/volumeref/link | //rsc:published[@type='book']/rsc:volumeref/rsc:link)"/>
                        </xsl:variable>
                        <xsl:variable name="subsyear">
                            <xsl:value-of select="normalize-space(//published[@type='subsyear'][1]/volumeref/link |//rsc:published[@type='subsyear'][1]/rsc:volumeref/rsc:link)"/>
                        </xsl:variable>
                        <xsl:variable name="print">
                            <xsl:value-of select="normalize-space(//published[@type='print'][1]/volumeref/link |//rsc:published[@type='print'][1]/rsc:volumeref/rsc:link)"/>
                        </xsl:variable>
                        <xsl:variable name="web">
                            <xsl:value-of select="normalize-space(//published[@type='web']/volumeref/link |//rsc:published[@type='web']/rsc:volumeref/rsc:link)"/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="$print !='0' and not(starts-with($print,'00'))">
                                <xsl:if test="$print!='Unassigned'">
                                    <xsl:if test="$print!='Advance Articles'">
                                        <xsl:value-of select="$print"/>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test="$subsyear!='0'">
                                <xsl:if test="$subsyear!='Unassigned'">
                                    <xsl:if test="$subsyear!='Advance Articles'">
                                        <xsl:value-of select="$subsyear"/>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test="$web!='0'">
                                <xsl:if test="$web!='Unassigned'">
                                    <xsl:if test="$web!='Advance Articles'">
                                        <xsl:value-of select="$web"/>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="$book!='0'">
                                <xsl:if test="$book!='Unassigned'">
                                    <xsl:if test="$book!='Advance Articles'">
                                        <xsl:value-of select="$book"/>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:if test="$volume!=''">
                        <biblScope unit="vol">
                            <xsl:value-of select="$volume"/>
                        </biblScope>
                    </xsl:if>
                    <!-- issue -->
                    <xsl:variable name="issue">
                        <xsl:variable name="book">
                            <xsl:value-of select="normalize-space(//published[@type='book']/issueref/link | //rsc:published[@type='book']/rsc:issueref/rsc:link)"/>
                        </xsl:variable>
                        <xsl:variable name="subsyear">
                            <xsl:value-of select="normalize-space(//published[@type='subsyear'][1]/issueref/link | //rsc:published[@type='subsyear'][1]/rsc:issueref/rsc:link)"/>
                        </xsl:variable>
                        <xsl:variable name="print">
                            <xsl:value-of select="normalize-space(//published[@type='print'][1]/issueref/link | //rsc:published[@type='print'][1]/rsc:issueref/rsc:link)"/>
                        </xsl:variable>
                        <xsl:variable name="web">
                            <xsl:value-of select="normalize-space(//published[@type='web']/issueref/link | //rsc:published[@type='web']/rsc:issueref/rsc:link)"/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="not(//published[@type='book'] | //rsc:published[@type='book'] )">
                                <xsl:choose>
                                    <xsl:when test="$print!='0'">
                                        <xsl:if test="$print!='Unassigned'">
                                            <xsl:if test="$print!='Advance Articles'">
                                                <xsl:value-of select="$print"/>
                                            </xsl:if>
                                        </xsl:if>
                                        
                                    </xsl:when>
                                    <xsl:when test="$subsyear!='0'">
                                        <xsl:if test="$subsyear!='Unassigned'">
                                            <xsl:if test="$subsyear!='Advance Articles'">
                                                <xsl:value-of select="$subsyear"/>
                                            </xsl:if>
                                        </xsl:if>
                                        
                                    </xsl:when>
                                    <xsl:when test="$web!='0'">
                                        <xsl:if test="$web!='Unassigned'">
                                            <xsl:if test="$web!='Advance Articles'">
                                                <xsl:value-of select="$web"/>
                                            </xsl:if>
                                        </xsl:if>
                                        
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="$book!='0'">
                                <xsl:if test="$book!='Unassigned'">
                                    <xsl:if test="$book!='Advance Articles'">
                                        <xsl:value-of select="$book"/>
                                    </xsl:if>
                                </xsl:if> 
                            </xsl:when>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:if test="$issue !=''">
                        <biblScope unit="issue">
                            <xsl:value-of select="$issue"/>
                        </biblScope>
                    </xsl:if>
                    <xsl:if test="published[@type='print']/pubfront/fpage |published[@type='book']/pubfront/fpage
                        | rsc:published[@type='print']/rsc:pubfront/rsc:fpage |rsc:published[@type='book']/rsc:pubfront/rsc:fpage !=''">
                        <xsl:apply-templates select="published[@type='print']/pubfront/fpage |published[@type='book']/pubfront/fpage
                            | rsc:published[@type='print']/rsc:pubfront/rsc:fpage |rsc:published[@type='book']/rsc:pubfront/rsc:fpage"/>
                    </xsl:if>
                    <xsl:if test="published[@type='print']/pubfront/lpage |published[@type='book']/pubfront/lpage
                        | rsc:published[@type='print']/rsc:pubfront/rsc:lpage |rsc:published[@type='book']/rsc:pubfront/rsc:lpage !=''">
                        <xsl:apply-templates select="published[@type='print']/pubfront/lpage |published[@type='book']/pubfront/lpage
                            | rsc:published[@type='print']/rsc:pubfront/rsc:lpage |rsc:published[@type='book']/rsc:pubfront/rsc:lpage"/>
                    </xsl:if>
                    <xsl:if test="published[@type='print']/pubfront/no-of-pages |published[@type='book']/pubfront/no-of-pages
                        | rsc:published[@type='print']/rsc:pubfront/rsc:no-of-pages |rsc:published[@type='book']/rsc:pubfront/rsc:no-of-pages !=''">
                        <xsl:apply-templates select="published[@type='print']/pubfront/no-of-pages |published[@type='book']/pubfront/no-of-pages
                            | rsc:published[@type='print']/rsc:pubfront/rsc:no-of-pages |rsc:published[@type='book']/rsc:pubfront/rsc:no-of-pages"/>
                    </xsl:if>
                    <xsl:if test="published[@type='subsyear'][1]/publisher/orgname/nameelt | published[@type='book']/publisher/orgname/nameelt
                        | rsc:published[@type='subsyear'][1]/rsc:publisher/rsc:orgname/rsc:nameelt | rsc:published[@type='book']/rsc:publisher/rsc:orgname/rsc:nameelt !=''">
                        <xsl:apply-templates select="published[@type='subsyear'][1]/publisher/orgname/nameelt | published[@type='book']/publisher/orgname/nameelt
                            | rsc:published[@type='subsyear'][1]/rsc:publisher/rsc:orgname/rsc:nameelt | rsc:published[@type='book']/rsc:publisher/rsc:orgname/rsc:nameelt"/>
                    </xsl:if>
                </imprint>
            </monogr>
        </biblStruct>
    </xsl:template>
    
    <xsl:template match="art-body | rsc:art-body">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="news-section | rsc:news-section">
        <xsl:apply-templates select="news-section/title | rsc:news-section/rsc:title"/>
        <xsl:apply-templates select="news-article | rsc:news-article"/>
        <xsl:apply-templates select="news-item | rsc:news-item"/>
    </xsl:template>
    <xsl:template match="news-item| rsc:news-item">
        <div type="item">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="footer| rsc:footer">
        <note type="footnote">
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    <xsl:template match="news-article| rsc:news-article">
        <text type="article">
            <xsl:apply-templates/>
            
        </text>
    </xsl:template>
    <xsl:template match="news-article/art-front | rsc:news-article/rsc:art-front">
        <front>
            <div>
                <biblFull>
                    <fileDesc>
                        <titleStmt>
                            <xsl:apply-templates select="*[not(self::abstract | self::rsc:abstract)]"/>
                        </titleStmt>
                        <publicationStmt><publisher>RSC</publisher></publicationStmt>
                        <sourceDesc>
                            <bibl></bibl>
                        </sourceDesc>
                    </fileDesc>
                    <!-- versionning -->
                    <xsl:call-template name="insertVersion"/>
                    <profileDesc>
                        <xsl:apply-templates select="abstract | rsc:abstract"/>
                    </profileDesc>
                </biblFull>
            </div>
        </front>
    </xsl:template>
    <xsl:template match="news-article/art-body | rsc:news-article/rsc:art-body">
        <body>
            <xsl:apply-templates/>
        </body>
    </xsl:template>
    <xsl:template match="titlegrp | rsc:titlegrp">
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="box | rsc:box">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- +++++++++++++++++++++++++++++++++++++++++++++ -->
    <!-- author related information -->

    <xsl:template match="/article/art-front/authgrp/author | /rsc:article/rsc:art-front/rsc:authgrp/rsc:author">
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
            <xsl:if test="@role='corres'">
                <xsl:attribute name="role">
                    <xsl:text>corresp</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="person/* | rsc:person/*"/>
            <xsl:apply-templates select="footnote | rsc:footnote"/>
            <xsl:if test="@aff">
                <xsl:call-template name="Affiliation"/>
            </xsl:if>
        </author>
    </xsl:template>
    
    <xsl:template match="biography |rsc:biography">
        <state type="biography">
            <xsl:if test="@id">
                <xsl:attribute name="type">
                <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@xsrc">
                <xsl:attribute name="corresp">
                    <xsl:value-of select="@xsrc"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </state>
    </xsl:template>
    <xsl:template match="plate |rsc:plate">
        <desc>
            <xsl:apply-templates/>
        </desc>
    </xsl:template>
    <xsl:template match="jnltrans |rsc:jnltrans">
        <bibl type="journal">
        <xsl:apply-templates/>
        </bibl>
    </xsl:template>
    <xsl:template match="sertitle |rsc:sertitle">
        <title type="main" level="j">
            <xsl:apply-templates/>
        </title>
    </xsl:template>

    <!-- Specific to RCS: references to compound -->

    <xsl:template match="compoundref | rsc:compoundref">
        <ref type="compound">
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <!-- Traitement des affiliations -->
    <xsl:template name="Affiliation">
        <xsl:call-template name="tokenize"/>
    </xsl:template>
    <xsl:template match="@aff" name="tokenize">
        <xsl:param name="text" select="@aff"/>
        <xsl:param name="separator" select="' '"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <xsl:if test="//art-front/authgrp/aff[@id=$text] | //rsc:art-front/rsc:authgrp/rsc:aff[@id=$text]">
                    <affiliation>
                        <xsl:apply-templates select="//aff[@id=$text]/org/orgname/* | //rsc:aff[@id=$text]/rsc:org/rsc:orgname/*"/>
                        <xsl:if test="//aff[@id=$text]/address | //rsc:aff[@id=$text]/rsc:address">
                            <address>
                                <xsl:apply-templates select="//aff[@id=$text]/address | //rsc:aff[@id=$text]/rsc:address" mode="rsc"/>
                            </address>
                        </xsl:if>
                    </affiliation>
                    <!-- EMAIL -->
                    <xsl:if test="//art-front/authgrp/aff[@id=$text]/email | //rsc:art-front/rsc:authgrp/rsc:aff[@id=$text]/rsc:email[string-length() &gt; 0 ]">
                        <xsl:apply-templates select="//art-front/authgrp/aff[@id=$text]/email |//rsc:art-front/rsc:authgrp/rsc:aff[@id=$text]/rsc:email"/>
                    </xsl:if>   
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="aff">
                    <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                </xsl:variable>
                <affiliation>
                    <xsl:apply-templates select="//aff[@id=$aff]/org/orgname/* | //rsc:aff[@id=$aff]/rsc:org/rsc:orgname/*"/>
                    <xsl:if test="//aff[@id=$aff]/address | //rsc:aff[@id=$aff]/rsc:address">
                        <address>
                            <xsl:apply-templates select="//aff[@id=$aff]/address| //rsc:aff[@id=$aff]/rsc:address" mode="rsc"/>
                        </address>
                    </xsl:if>
                   
                </affiliation>
                <!-- EMAIL -->
                <xsl:if test="//art-front/authgrp/aff[@id=$aff]/email | //rsc:art-front/rsc:authgrp/rsc:aff[@id=$aff]/rsc:email[string-length() &gt; 0 ]">
                    <xsl:apply-templates select="//art-front/authgrp/aff[@id=$aff]/email |//rsc:art-front/rsc:authgrp/rsc:aff[@id=$aff]/rsc:email"/>
                </xsl:if> 
                <xsl:call-template name="tokenize">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="address | rsc:address" mode="rsc">
            <xsl:apply-templates/>
    </xsl:template>
    
    <!-- What is below has not been checked... -->
    

    <xsl:template match="dateStruct | rsc:dateStruct">
        <date>
            <xsl:value-of select="."/>
        </date>
    </xsl:template>

    <!--<xsl:template match="title-group/fn-group"/>-->

    <!-- Inline affiliation (embedded in <contrib>)
    <xsl:template match="authgrp/aff | rsc:authgrp/rsc:aff">
        <affiliation>
            <xsl:apply-templates select="org/orgname/* | rsc:org/rsc:orgname/*"/>
            <xsl:apply-templates select="address | rsc:address"/>
            <xsl:apply-templates select="email | rsc:email"/>
        </affiliation>
    </xsl:template> -->

    <!-- Treating organisation names -->

    <xsl:template match="nameelt | rsc:nameelt">
        <xsl:variable name="organisation">
            <xsl:call-template name="identifyOrgLevel">
                <xsl:with-param name="theOrg">
                    <xsl:value-of select="."/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <orgName>
            <xsl:attribute name="type">
                <xsl:choose>
                    <xsl:when test="$organisation !=''">
                        <xsl:value-of select="$organisation"/>
                    </xsl:when>
                    <xsl:otherwise>institution</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </orgName>
    </xsl:template>


    <!-- Macrostructure of main body if the text -->
    <xsl:template match="section | rsc:section">
        <xsl:choose>
            <xsl:when test="ancestor::box |ancestor::rsc:box">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="ancestor::biography |ancestor::rsc:biography">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <div>
                    <xsl:if test="@type|no| rsc:no">
                        <xsl:attribute name="type">
                            <xsl:value-of select="@type|no| rsc:no"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="p/box/@id | rsc:p/rsc:box/@id !=''">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="p/box/@id| rsc:p/rsc:box/@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="*[starts-with(name(),'subsect')]">
        <div>
            <xsl:if test="@type|no| rsc:no">
                <xsl:attribute name="type">
                    <xsl:value-of select="@type|no| rsc:no"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template
        match="section/title | subsect1/title | subsect1/title | subsect2/title | subsect3/title | subsect4/title | subsect5/title | subsect6/title
        |rsc:section/rsc:title | rsc:subsect1/rsc:title | rsc:subsect1/rsc:title | rsc:subsect2/rsc:title | rsc:subsect3/rsc:title | rsc:subsect4/rsc:title | rsc:subsect5/rsc:title | rsc:subsect6/rsc:title">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    
    <!-- footnote -->
    <xsl:template match="footnote | rsc:footnote">
        <xsl:choose>
            <xsl:when test="parent::surname|parent::rsc:surname"/>
            <xsl:otherwise>
                <note place="foot">
                    <!-- id -->
                    <xsl:attribute name="xml:id" select="@id"/>
                    <xsl:value-of select="normalize-space(.)"/>
                </note>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- pagination linéaire dans les références -->
    <xsl:template match="biblscope|rsc:biblscope">
        <xsl:choose>
            <xsl:when test="contains(.,'pp.')">
                <biblScope unit="pages">
                    <xsl:value-of select="normalize-space(.)"/>
                </biblScope>
            </xsl:when>
            <xsl:otherwise>
                <biblScope>
                    <xsl:value-of select="normalize-space(.)"/>
                </biblScope>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="no-of-pages|rsc:no-of-pages">
        <xsl:if test=".!=''and not(contains(.,'Unassigned'))">
        <biblScope unit="no-of-pages">
            <xsl:value-of select="normalize-space(.)"/>
        </biblScope>
        </xsl:if>
    </xsl:template>
    <!--compound-->
    <xsl:template match="compoundgrp | rsc:compoundgrp">
        <xsl:if test="compound/@id | rsc:compound/@id |compound | rsc:compound!=''">
        <div type="compoundgrp">
            <list type="compound">
                <xsl:apply-templates/>
            </list>
        </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="compound |rsc:compound">
        <item>
            <xsl:if test="@id !=''">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:variable name="compound">
                <xsl:apply-templates/>
            </xsl:variable>
           <xsl:value-of select="normalize-space($compound)"/>
        </item>
    </xsl:template>
    
    <xsl:template match="arttitle |rsc:arttitle">
        <title level="a" type="main">
            <xsl:apply-templates/>
        </title>
    </xsl:template>
</xsl:stylesheet>
