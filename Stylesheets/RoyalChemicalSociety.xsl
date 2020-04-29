<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:rsc="http://www.rsc.org/schema/rscart38" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" method="xml"/>

    <!-- TEI document structure, creation of main header components, front (abstract), body, and back -->
    <!-- Le format de la RCS utilise essentiellement des composant NLM en ayant pris le soin (!) de définir ses propres constructions ici el là. -->
    <!-- On sent le travail visionaire du grouillot... -->
    <xsl:template match="article[art-admin] | rsc:article[rsc:art-admin]">
        <TEI xmlns:ns1="http://standoff.proposal">
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
                        <xsl:if test="//article/published[@type='subsyear']/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='subsyear']/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt">
                            <publisher>
                                <xsl:value-of select="//article/published[@type='subsyear']/journalref/publisher/orgname/nameelt | //rsc:article/rsc:published[@type='subsyear']/rsc:journalref/rsc:publisher/rsc:orgname/rsc:nameelt"/>
                            </publisher>
                        </xsl:if>
                        <xsl:if test="//article/published[@type='subsyear']/journalref/cpyrt | //rsc:article/rsc:published[@type='subsyear']/rsc:journalref/rsc:cpyrt">
                            <availability>
                                <p>
                                    <xsl:value-of select="//article/published[@type='subsyear']/journalref/cpyrt | //rsc:article/rsc:published[@type='subsyear']/rsc:journalref/rsc:cpyrt"/>
                                </p>
                            </availability>
                        </xsl:if>
                        <xsl:if test="@price-code[string(.)='free']">
                            <availability status="free">
                                <p>Open Access</p>
                            </availability>
                        </xsl:if>
                        <date type="published">
                            <xsl:attribute name="when">
                                <xsl:value-of select="//article/published[@type='subsyear']/pubfront/date/year
                                    |//article/published[@type='book']/pubfront/date/year
                                    | //rsc:article/rsc:published[@type='subsyear']/rsc:pubfront/rsc:date/rsc:year
                                    |//rsc:article/rsc:published[@type='book']/rsc:pubfront/rsc:date/rsc:year"/>
                            </xsl:attribute>
                            <xsl:value-of select="//article/published[@type='subsyear']/pubfront/date/year
                                |//article/published[@type='book']/pubfront/date/year
                                | //rsc:article/rsc:published[@type='subsyear']/rsc:pubfront/rsc:date/rsc:year
                                |//rsc:article/rsc:published[@type='book']/rsc:pubfront/rsc:date/rsc:year"/>
                        </date>
                    </publicationStmt>
                    <notesStmt>
                        <note type="content-type">
                            <xsl:variable name="articleType" select="//articletype/@pubmedForm |//rsc:articletype/@pubmedForm"/>
                            <xsl:variable name="codeGenreRSCSource">
                                <xsl:choose>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='ART'">article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='REV'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='EDI'">editorial</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='FEA'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='TRV'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='CRV'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='CVR'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='CRV'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='BKR'">book-reviews</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='ASU'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='COM'">article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='ESS'">article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='NTP'">research-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='RES'">research-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='KEY'">article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='PER'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='LET'">research-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='TRV'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='TEC'">research-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='HIG'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='INV'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='FOC'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='DIS'">article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='HOT'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='OTH'">other</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='SAB'">abstract</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='EMA'">article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='CMT'">article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='OPN'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='APP'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='FRO'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='AFO'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='CRP'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='EDU'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='MET'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='IRE'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='VPT'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='FOR'">article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='ILN'">article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='MES'">article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='AMS'">article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='ESS'">article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='WAT'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='NTP'">research-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='RES'">research-article</xsl:when>
                                    <xsl:when test="normalize-space(//article/@type | //rsc:article/@type)='KEY'">article</xsl:when>
                                    <xsl:when test="normalize-space($articleType)='abstract'">abstract</xsl:when>
                                    <xsl:when test="normalize-space($articleType)='addendum'">other</xsl:when>
                                    <xsl:when test="normalize-space($articleType)='announcement'">other</xsl:when>
                                    <xsl:when test="normalize-space($articleType)='article-commentary'">review-article</xsl:when>
                                    <xsl:when test="normalize-space($articleType)='book-review'">book-reviews</xsl:when>
                                    <xsl:when test="normalize-space($articleType)='books-received'">other</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='brief-report'">brief-communication</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='calendar'">other</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='case-report'">case-report</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='collection'">other</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='correction'">article</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='dissertation'">other</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='discussion'">other</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='editorial'">editorial</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='in-brief'">other</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='introduction'">other</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='letter'">article</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='meeting-report'">conference</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='news'">article</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='obituary'">other</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='oration'">other</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='other'">
                                        <xsl:choose>
                                            <xsl:when test="//abstract |rsc:abstract[string-length() &gt; 0] and contains(//article-meta/fpage |//rsc:article-meta/rsc:fpage,'s') or contains(//article-meta/fpage | //rsc:article-meta/rsc:fpage,'S')">article</xsl:when>
                                            <xsl:otherwise>other</xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='partial-retraction'">other</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='poster'">conference</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='product-review'">other</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='rapid-communication'">brief-communication</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='reply'">article</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='reprint'">other</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='research-article'">research-article</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='retraction'">other</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='review-article'">review-article</xsl:when>
                                    <xsl:when test="normalize-space(//@articleType)='translation'">other</xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>other</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:variable name="codeGenreRSCArk">
                                <xsl:choose>
                                    <xsl:when test="normalize-space($codeGenreRSCSource)='research-article'">https://content-type.data.istex.fr/ark:/67375/XTP-1JC4F85T-7</xsl:when>
                                    <xsl:when test="normalize-space($codeGenreRSCSource)='article'">https://content-type.data.istex.fr/ark:/67375/XTP-6N5SZHKN-D</xsl:when>
                                    <xsl:when test="normalize-space($codeGenreRSCSource)='other'">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:when>
                                    <xsl:when test="normalize-space($codeGenreRSCSource)='book-reviews'">https://content-type.data.istex.fr/ark:/67375/XTP-PBH5VBM9-4</xsl:when>
                                    <xsl:when test="normalize-space($codeGenreRSCSource)='abstract'">https://content-type.data.istex.fr/ark:/67375/XTP-HPN7T1Q2-R</xsl:when>
                                    <xsl:when test="normalize-space($codeGenreRSCSource)='review-article'">https://content-type.data.istex.fr/ark:/67375/XTP-L5L7X3NF-P</xsl:when>
                                    <xsl:when test="normalize-space($codeGenreRSCSource)='brief-communication'">https://content-type.data.istex.fr/ark:/67375/XTP-S9SX2MFS-0</xsl:when>
                                    <xsl:when test="normalize-space($codeGenreRSCSource)='editorial'">https://content-type.data.istex.fr/ark:/67375/XTP-STW636XV-K</xsl:when>
                                    <xsl:when test="normalize-space($codeGenreRSCSource)='case-report'">https://content-type.data.istex.fr/ark:/67375/XTP-29919SZJ-6</xsl:when>
                                    <xsl:when test="normalize-space($codeGenreRSCSource)='conference'">https://content-type.data.istex.fr/ark:/67375/XTP-BFHXPBJJ-3</xsl:when>
                                    <xsl:when test="normalize-space($codeGenreRSCSource)='chapter'">https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6</xsl:when>
                                    <xsl:when test="normalize-space($codeGenreRSCSource)='book'">https://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T</xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <!-- niveau article / chapter -->
                            <xsl:attribute name="source">
                                <xsl:choose>
                                    <xsl:when test="//article/@type | //rsc:article/@type">
                                        <xsl:value-of select="//article/@type | //rsc:article/@type"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$articleType"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:attribute name="scheme">
                                <xsl:value-of select="$codeGenreRSCArk"/>
                            </xsl:attribute>
                            <xsl:value-of select="$codeGenreRSCSource"/>
                        </note>
                        <note type="publication-type">
                            <xsl:choose>
                                <xsl:when test="//published[@type='book']/journalref/issn[@type='isbn'] | //rsc:published[@type='book']/rsc:journalref/rsc:issn[@type='isbn'][string-length() &gt; 0] and //published[@type='subsyear']/journalref/issn[@type='print'] | //rsc:published[@type='subsyear']/rsc:journalref/rsc:issn[@type='print'][string-length() &gt; 0]">
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
                <xsl:if test="toBeCompleted | rsc:toBeCompleted">
                    <profileDesc>
						<!-- PL: abstract is moved from <front> to here -->
                        <xsl:apply-templates select="art-front/abstract | rsc:art-front/rsc:abstract"/>
						
                        <xsl:apply-templates select="front/article-meta/kwd-group | rsc:front/rsc:article-meta/rsc:kwd-group"/>
                    </profileDesc>
                </xsl:if>
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$datecreation}" who="istex" xml:id="pub2tei">formatting</change>
                </revisionDesc>
            </teiHeader>
            <text>
                <xsl:choose>
                    <xsl:when test="//news-section | //rsc:news-section">
                        <group type="sub-article">
                            <xsl:apply-templates select="art-body/* | rsc:art-body/*"/> 
                        </group>
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
                    <xsl:when test="//article/published[@type='subsyear']/journalref/title[@type='full'] | //rsc:article/rsc:published[@type='subsyear']/rsc:journalref/rsc:title[@type='full'] !=''">
                        <title level="j" type="main">
                            <xsl:value-of select="//article/published[@type='subsyear']/journalref/title[@type='full']| //rsc:article/rsc:published[@type='subsyear']/rsc:journalref/rsc:title[@type='full']"/>
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
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="//article/published[@type='print']/journalref/title[@type='abbreviated'] | //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:title[@type='abbreviated'] !=''">
                        <title level="j" type="abbrev">
                            <xsl:value-of select="//article/published[@type='print']/journalref/title[@type='abbreviated']| //rsc:article/rsc:published[@type='print']/rsc:journalref/rsc:title[@type='abbreviated']"/>
                        </title>
                    </xsl:when>
                    <xsl:when test="//article/published[@type='subsyear']/journalref/title[@type='abbreviated'] | //rsc:article/rsc:published[@type='subsyear']/rsc:journalref/rsc:title[@type='abbreviated'] !=''">
                        <title level="j" type="abbrev">
                            <xsl:value-of select="//article/published[@type='subsyear']/journalref/title[@type='abbreviated']| //rsc:article/rsc:published[@type='subsyear']/rsc:journalref/rsc:title[@type='abbreviated']"/>
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
                    <xsl:when test="//article/published[@type='subsyear']/journalref/issn | //rsc:article/rsc:published[@type='subsyear']/rsc:journalref/rsc:issn[string-length() &gt; 0]">
                        <xsl:for-each select="//article/published[@type='subsyear']/journalref/issn | //rsc:article/rsc:published[@type='subsyear']/rsc:journalref/rsc:issn">
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
                <xsl:if test="//coden | //rsc:coden">
                    <idno type="CODEN">
                        <xsl:value-of select="//coden | //rsc:coden"/>
                    </idno>
                </xsl:if>
                <imprint>
                    <xsl:for-each select="article-meta/pub-date | rsc:article-meta/rsc:pub-date">
                        <xsl:message>Current: <xsl:value-of select="@pub-type"/></xsl:message>
                        <xsl:if test="year|rsc:year != '' and year|rsc:year !='0000'">
                            <xsl:message>Pubdate year: <xsl:value-of select="year|rsc:year"/></xsl:message>
                            <xsl:apply-templates select="."/>
                        </xsl:if>
                    </xsl:for-each>
                    <!-- volume -->
                    <xsl:variable name="volume">
                        <xsl:variable name="book">
                            <xsl:value-of select="normalize-space(//published[@type='book']/volumeref/link | //rsc:published[@type='book']/rsc:volumeref/rsc:link)"/>
                        </xsl:variable>
                        <xsl:variable name="subsyear">
                            <xsl:value-of select="normalize-space(//published[@type='subsyear']/volumeref/link |//rsc:published[@type='subsyear']/rsc:volumeref/rsc:link)"/>
                        </xsl:variable>
                        <xsl:variable name="print">
                            <xsl:value-of select="normalize-space(//published[@type='print']/volumeref/link |//rsc:published[@type='print']/rsc:volumeref/rsc:link)"/>
                        </xsl:variable>
                        <xsl:variable name="web">
                            <xsl:value-of select="normalize-space(//published[@type='web']/volumeref/link |//rsc:published[@type='web']/rsc:volumeref/rsc:link)"/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="$print !='0'">
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
                            <xsl:value-of select="normalize-space(//published[@type='subsyear']/issueref/link | //rsc:published[@type='subsyear']/rsc:issueref/rsc:link)"/>
                        </xsl:variable>
                        <xsl:variable name="print">
                            <xsl:value-of select="normalize-space(//published[@type='print']/issueref/link | //rsc:published[@type='print']/rsc:issueref/rsc:link)"/>
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
                    <xsl:apply-templates select="published[@type='print']/pubfront/fpage |published[@type='book']/pubfront/fpage
                        | rsc:published[@type='print']/rsc:pubfront/rsc:fpage |rsc:published[@type='book']/rsc:pubfront/rsc:fpage"/>
                    <xsl:apply-templates select="published[@type='print']/pubfront/lpage |published[@type='book']/pubfront/lpage
                        | rsc:published[@type='print']/rsc:pubfront/rsc:lpage |rsc:published[@type='book']/rsc:pubfront/rsc:lpage"/>
                    <xsl:apply-templates select="published[@type='subsyear']/publisher/orgname/nameelt | published[@type='book']/publisher/orgname/nameelt
                        | rsc:published[@type='subsyear']/rsc:publisher/rsc:orgname/rsc:nameelt | rsc:published[@type='book']/rsc:publisher/rsc:orgname/rsc:nameelt"/>
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
        <figure type="item">
            <xsl:apply-templates/>
        </figure>
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
                    <encodingDesc>
                        <appInfo>
                            <application ident="pub2tei" version="" when="{$datecreation}">
                                <label>pub2TEI</label>
                                <desc>A set of style sheets for converting XML documents encoded in various scientific publisher formats into a common TEI format</desc>
                            </application>
                        </appInfo>
                    </encodingDesc>
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
            <xsl:apply-templates/>
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
                        <xsl:apply-templates select="//aff[@id=$text]/address | //rsc:aff[@id=$text]/rsc:address" mode="rsc"/>
                    </affiliation>
                    <!-- EMAIL -->
                    <xsl:if test="//art-front/authgrp/aff[@id=$text]/email | //rsc:art-front/rsc:authgrp/rsc:aff[@id=$text]/rsc:email[string-length() &gt; 0 ]">
                        <email>                                     
                            <xsl:value-of select="normalize-space(//art-front/authgrp/aff[@id=$text]/email |//rsc:art-front/rsc:authgrp/rsc:aff[@id=$text]/rsc:email)"/>
                        </email>
                    </xsl:if>   
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="aff">
                    <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                </xsl:variable>
                <affiliation>
                    <xsl:apply-templates select="//aff[@id=$aff]/org/orgname/* | //rsc:aff[@id=$aff]/rsc:org/rsc:orgname/*"/>
                    <xsl:apply-templates select="//aff[@id=$aff]/address| //rsc:aff[@id=$aff]/rsc:address" mode="rsc"/>
                </affiliation>
                <!-- EMAIL -->
                <xsl:if test="//art-front/authgrp/aff[@id=$aff]/email | //rsc:art-front/rsc:authgrp/rsc:aff[@id=$aff]/rsc:email[string-length() &gt; 0 ]">
                    <email>                                     
                        <xsl:value-of select="normalize-space(//art-front/authgrp/aff[@id=$aff]/email |//rsc:art-front/rsc:authgrp/rsc:aff[@id=$aff]/rsc:email)"/>
                    </email>
                </xsl:if>   
                <xsl:call-template name="tokenize">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="address | rsc:address" mode="rsc">
        <address>
            <xsl:apply-templates/>
        </address>
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
                <xsl:value-of select="$organisation"/>
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
        <note place="foot">
            <!-- id -->
            <xsl:attribute name="xml:id" select="@id"/>
            <xsl:value-of select="normalize-space(.)"/>
        </note>
    </xsl:template>
</xsl:stylesheet>
