<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns:m="http://www.w3.org/1998/Math/MathML"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:variable name="docIssue" select="document($partOfSetXmlPath)"/>
    <!-- todo : abstract niveau supérieur book / series
    todo: issue
    todo: completer book-categories
    todo : publisher depuis $docIssue
    todo : type de publication / type de contenu-->
    <!-- TEI document structure, creation of main header components, front (summary), body, and back -->
    <!-- ******************* Genre ******************************-->
    <xsl:variable name="codeGenreBrepolsBook">
        <xsl:value-of select="//body/book-part/@book-part-type"/>
    </xsl:variable>
    <xsl:variable name="codeGenreBrepols">
        <xsl:choose>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='abstract'">abstract</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='addendum'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='announcement'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='article-commentary'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='book-review'">book-reviews</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='books-received'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='brief-report'">brief-communication</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='calendar'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='case-report'">case-report</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='chapter'">chapter</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='collection'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='correction'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='dissertation'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='discussion'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='editorial'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='in-brief'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='introduction'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='letter'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='meeting-report'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='news'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='obituary'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='oration'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='other'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0] and contains(//article-meta/fpage,'s') or contains(//article-meta/fpage,'S')">article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='partial-retraction'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='poster'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='product-review'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='rapid-communication'">brief-communication</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='reply'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='reprint'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='research-article'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='retraction'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='review-article'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepolsBook)='translation'">other</xsl:when>
            <xsl:otherwise>
                <xsl:text>other</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <!-- lien vers data.istex.fr -->
    <xsl:variable name="codeGenreArkBrepolsBook">
        <xsl:choose>
            <xsl:when test="normalize-space($codeGenreBrepols)='research-article'">https://content-type.data.istex.fr/ark:/67375/XTP-1JC4F85T-7</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepols)='article'">https://content-type.data.istex.fr/ark:/67375/XTP-6N5SZHKN-D</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepols)='other'">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepols)='book-reviews'">https://content-type.data.istex.fr/ark:/67375/XTP-PBH5VBM9-4</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepols)='abstract'">https://content-type.data.istex.fr/ark:/67375/XTP-HPN7T1Q2-R</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepols)='review-article'">https://content-type.data.istex.fr/ark:/67375/XTP-L5L7X3NF-P</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepols)='brief-communication'">https://content-type.data.istex.fr/ark:/67375/XTP-S9SX2MFS-0</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepols)='editorial'">https://content-type.data.istex.fr/ark:/67375/XTP-STW636XV-K</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepols)='case-report'">https://content-type.data.istex.fr/ark:/67375/XTP-29919SZJ-6</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepols)='conference'">https://content-type.data.istex.fr/ark:/67375/XTP-BFHXPBJJ-3</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepols)='chapter'">https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6</xsl:when>
            <xsl:when test="normalize-space($codeGenreBrepols)='book'">https://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T</xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="langBrill">
        <xsl:choose>
            <xsl:when test="//isbn[@publication-format='online']='9789004294967'
                or //isbn[@publication-format='online']='9789004295261'
                or //isbn[@publication-format='online']='9789004295476'
                or //isbn[@publication-format='online']='9789004295568'
                or //isbn[@publication-format='online']='9789004295643'
                or //isbn[@publication-format='online']='9789004295667'
                or //isbn[@publication-format='online']='9789004295704'
                or //isbn[@publication-format='online']='9789004296497'
                or //isbn[@publication-format='online']='9789004296565'
                or //isbn[@publication-format='online']='9789004296541'
                or //isbn[@publication-format='online']='9789004296640'
                or //isbn[@publication-format='online']='9789004295780'
                or //isbn[@publication-format='online']='9789004295797'">
                <xsl:text>it</xsl:text>
            </xsl:when>
            <xsl:when test="//isbn[@publication-format='online']='9789004296138'
                or //isbn[@publication-format='online']='9789004296145'
                or //isbn[@publication-format='online']='9789004296152'
                or //isbn[@publication-format='online']='9789004294769'
                or //isbn[@publication-format='online']='9789004294790'
                or //isbn[@publication-format='online']='9789004296213'
                or //isbn[@publication-format='online']='9789004294806'
                or //isbn[@publication-format='online']='9789004294813'
                or //isbn[@publication-format='online']='9789004294820'
                or //isbn[@publication-format='online']='9789004296237'
                or //isbn[@publication-format='online']='9789004296244'
                or //isbn[@publication-format='online']='9789004294899'
                or //isbn[@publication-format='online']='9789004294912'
                or //isbn[@publication-format='online']='9789004294929'
                or //isbn[@publication-format='online']='9789004294950'
                or //isbn[@publication-format='online']='9789004296275'
                or //isbn[@publication-format='online']='9789004296329'
                or //isbn[@publication-format='online']='9789004296282'
                or //isbn[@publication-format='online']='9789004296305'
                or //isbn[@publication-format='online']='9789004294981'
                or //isbn[@publication-format='online']='9789004295032'
                or //isbn[@publication-format='online']='9789004295124'
                or //isbn[@publication-format='online']='9789004295131'
                or //isbn[@publication-format='online']='9789004295148'
                or //isbn[@publication-format='online']='9789004295186'
                or //isbn[@publication-format='online']='9789004295247'
                or //isbn[@publication-format='online']='9789004295278'
                or //isbn[@publication-format='online']='9789004295285'
                or //isbn[@publication-format='online']='9789004301672'
                or //isbn[@publication-format='online']='9789004295308'
                or //isbn[@publication-format='online']='9789004295315'
                or //isbn[@publication-format='online']='9789004295322'
                or //isbn[@publication-format='online']='9789004296404'
                or //isbn[@publication-format='online']='9789004295339'
                or //isbn[@publication-format='online']='9789004295421'
                or //isbn[@publication-format='online']='9789004295438'
                or //isbn[@publication-format='online']='9789004295452'
                or //isbn[@publication-format='online']='9789004295469'
                or //isbn[@publication-format='online']='9789004295483'
                or //isbn[@publication-format='online']='9789004295490'
                or //isbn[@publication-format='online']='9789004295551'
                or //isbn[@publication-format='online']='9789004295544'
                or //isbn[@publication-format='online']='9789004295636'
                or //isbn[@publication-format='online']='9789004295650'
                or //isbn[@publication-format='online']='9789004296459'
                or //isbn[@publication-format='online']='9789004296466'
                or //isbn[@publication-format='online']='9789004295728'
                or //isbn[@publication-format='online']='9789004296480'
                or //isbn[@publication-format='online']='9789004301412'
                or //isbn[@publication-format='online']='9789004295933'
                or //isbn[@publication-format='online']='9789004301504'
                or //isbn[@publication-format='online']='9789004295988'
                or //isbn[@publication-format='online']='9789047412328'
                or //isbn[@publication-format='online']='9789047415855'
                or //isbn[@publication-format='online']='9789047408277'
                or //isbn[@publication-format='online']='9789047410331'
                or //isbn[@publication-format='online']='9789004210912'
                or //isbn[@publication-format='online']='9789004263246'">
                <xsl:text>fr</xsl:text>
            </xsl:when>
            <xsl:when test="//isbn[@publication-format='online']='9789004296077'
                or //isbn[@publication-format='online']='9789004296091'
                or //isbn[@publication-format='online']='9789004294738'
                or //isbn[@publication-format='online']='9789004294776'
                or //isbn[@publication-format='online']='9789004294974'
                or //isbn[@publication-format='online']='9789004294998'
                or //isbn[@publication-format='online']='9789004295001'
                or //isbn[@publication-format='online']='9789004301344'
                or //isbn[@publication-format='online']='9789004295087'
                or //isbn[@publication-format='online']='9789004295292'
                or //isbn[@publication-format='online']='9789004301689'
                or //isbn[@publication-format='online']='9789004295377'
                or //isbn[@publication-format='online']='9789004295407'
                or //isbn[@publication-format='online']='9789004295506'
                or //isbn[@publication-format='online']='9789004295513'
                or //isbn[@publication-format='online']='9789004295537'
                or //isbn[@publication-format='online']='9789004296435'
                or //isbn[@publication-format='online']='9789004296442'
                or //isbn[@publication-format='online']='9789004295711'
                or //isbn[@publication-format='online']='9789004301375'
                or //isbn[@publication-format='online']='9789004295742'
                or //isbn[@publication-format='online']='9789004295858'
                or //isbn[@publication-format='online']='9789004295896'">
                <xsl:text>de</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>en</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:template match="book">
        <TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:choose>
               <!-- traitement spécial TaylorFrancis -->
                <xsl:when test="starts-with(book-meta/book-id[@pub-id-type='doi'],'10.4324/') or contains(book/book-meta/publisher/publisher-name,'Routledge')">
                    <xsl:apply-templates select="book-meta" mode="TF"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="//book-meta/book-id[@pub-id-type='doi']='10.1484/M.IPM-EB.5.112141'">
                            <xsl:attribute name="xml:lang">fr</xsl:attribute>
                        </xsl:when>
                        <!-- numerique premium -->
                        <xsl:when test="//abstract/@xml:lang[string-length() &gt; 0]">
                            <xsl:for-each select="//abstract/@xml:lang">
                                <xsl:attribute name="xml:lang">
                                    <xsl:value-of select="translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                </xsl:attribute>
                            </xsl:for-each>
                        </xsl:when>
                        <!-- brepols book -->
                        <xsl:when test="//body/book-part/@xml:lang[string-length()&gt; 0]">
                            <xsl:for-each select="//body/book-part/@xml:lang">
                                <xsl:attribute name="xml:lang">
                                    <xsl:value-of select="translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                </xsl:attribute>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                    <teiHeader>
                        <fileDesc>
                            <titleStmt>
                                <xsl:choose>
                                    <!-- brill-hacco -->
                                    <xsl:when test="//book/entryGroup/entry/headGroup/head[string-length()&gt; 0]">
                                        <title level="a" type="main">
                                            <xsl:if test="//book/entryGroup/entry/headGroup/label[string-length()&gt; 0]">
                                            <xsl:value-of select="/book/entryGroup/entry/headGroup/label"/>
                                                <xsl:text> - </xsl:text>
                                            </xsl:if>
                                            <xsl:value-of select="/book/entryGroup/entry/headGroup/head"/>
                                        </title>
                                    </xsl:when>
                                    <xsl:when test="//body/book-part/book-part-meta/title-group/title[string-length()&gt; 0]">
                                        <xsl:apply-templates select="//body/book-part/book-part-meta/title-group/title"/>
                                    </xsl:when>
                                    <xsl:when test="/book/book-body/book-part/book-part-meta/title-group/title[string-length()&gt; 0]">
                                        <xsl:apply-templates select="/book/book-body/book-part/book-part-meta/title-group/title"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//book-title-group/book-title" mode="article"></xsl:apply-templates>
                                        <xsl:apply-templates select="//book-title-group/subtitle"></xsl:apply-templates>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </titleStmt>
                            <publicationStmt>
                                <authority>ISTEX</authority>
                                <xsl:choose>
                                    <xsl:when test="book-meta/publisher/publisher-name='De Gruyter'">
                                        <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-1JLL5NJT-J">
                                            <xsl:value-of select="book-meta/publisher/publisher-name"/></publisher>
                                    </xsl:when>
                                    <xsl:when test="book-meta/publisher/publisher-name[string-length() &gt; 0]">
                                        <xsl:choose>
                                            <xsl:when test="book-meta/publisher[1]/publisher-name[string-length() &gt; 0]">
                                                <publisher>
                                                    <xsl:if test="book-meta/publisher[1]/publisher-name='Cambridge University Press'">
                                                        <xsl:attribute name="ref">https://scientific-publisher.data.istex.fr/ark:/67375/H02-7XSK0Q94-6</xsl:attribute>
                                                    </xsl:if>
                                                    <xsl:value-of select="normalize-space(book-meta/publisher[1]/publisher-name)"/></publisher>
                                            </xsl:when>
                                            <xsl:when test="book-meta/publisher[1]/publisher-loc[string-length() &gt; 0]">
                                                <pubPlace><xsl:value-of select="normalize-space(book-meta/publisher[1]/publisher-loc)"/></pubPlace>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:if test="contains(//self-uri/@xlink:href,'numeriquepremium')">
                                                    <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-ZX4M1CKJ-Z">Numérique Premium</publisher>
                                                </xsl:if>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:if test="book-meta/pub-date/year[string-length() &gt; 0] |$docIssue//pub-date/year[string-length() &gt; 0] | /book/metadata/pubDate[string-length() &gt; 0]">
                                    <availability>
                                        <xsl:if test="/book/body/book-part/book-part-meta/permissions/license/@license-type='free'">
                                            <xsl:attribute name="status">free</xsl:attribute>
                                        </xsl:if>
                                        <licence>
                                            <xsl:if test="/book/body/book-part/book-part-meta/permissions/license/@license-type='free'">
                                                <xsl:if test="/book/body/book-part/book-part-meta/permissions/license/license-p[string-length() &gt; 0]">
                                                <p>
                                                    <xsl:value-of select="/book/body/book-part/book-part-meta/permissions/license/license-p"/>
                                                </p>
                                                </xsl:if>
                                            </xsl:if>
                                            <xsl:choose>
                                                <xsl:when test="book-meta/permissions/copyright-statement[string-length() &gt; 0] |//book/metadata/copyright[string-length() &gt; 0]">
                                                    <p>
                                                        <xsl:value-of select="book-meta/permissions/copyright-statement |//book/metadata/copyright[string-length() &gt; 0]"/>
                                                    </p>
                                                </xsl:when>
                                                <xsl:when test="book-meta/pub-date/year[string-length() &gt; 0]">
                                                    <p>©<xsl:value-of select="book-meta/pub-date[1]/year"/> Numérique Premium</p>
                                                </xsl:when>
                                                <xsl:when test="/book/metadata/pubDate[string-length() &gt; 0]">
                                                    <p>©<xsl:value-of select="/book/metadata/pubDate"/> Brill</p>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:if test="$docIssue//pub-date/year">
                                                        <p>©<xsl:value-of select="$docIssue//pub-date/year"/> Brepols Publishers</p>
                                                    </xsl:if>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </licence>
                                    </availability>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="book-meta/pub-date[@publication-format='print']/year[string-length() &gt; 0]">
                                        <date type="published">
                                            <xsl:attribute name="when">
                                                <xsl:value-of select="book-meta/pub-date[@publication-format='print']/year"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="book-meta/pub-date[@publication-format='print']/year"/>
                                        </date>
                                    </xsl:when>
                                    <xsl:when test="book-meta/pub-date[@pub-type='ppub']/year[string-length() &gt; 0]">
                                        <date type="published">
                                            <xsl:attribute name="when">
                                                <xsl:value-of select="book-meta/pub-date[@pub-type='ppub']/year"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="book-meta/pub-date[@pub-type='ppub']/year"/>
                                        </date>
                                    </xsl:when>
                                    <xsl:when test="book-meta/pub-date[@pub-type='epub']/year[string-length() &gt; 0]">
                                        <date type="epublished">
                                            <xsl:attribute name="when">
                                                <xsl:value-of select="book-meta/pub-date[@pub-type='epub']/year"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="book-meta/pub-date[@pub-type='epub']/year"/>
                                        </date>
                                    </xsl:when>
                                    <xsl:when test="book-meta/pub-date[1]/year[string-length() &gt; 0]">
                                        <date type="published">
                                            <xsl:attribute name="when">
                                                <xsl:value-of select="book-meta/pub-date[1]/year"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="book-meta/pub-date[1]/year"/>
                                        </date>
                                    </xsl:when>
                                    <xsl:when test="$docIssue//pub-date[1]/year">
                                        <date type="published" when="{$docIssue//pub-date[1]/year}">
                                            <xsl:value-of select="$docIssue//pub-date[1]/year[string-length()&gt; 0]"/>
                                        </date>
                                    </xsl:when>
                                </xsl:choose>
                            </publicationStmt>
                            
                            <!-- SG - ajout du codeGenre book -->
                            <notesStmt>
                                <!-- niveau chapter -->
                                <note type="content-type">
                                    <xsl:choose>
                                        <!-- Brill-ebooks -->
                                        <xsl:when test="/book/book-body/book-part/book-part-meta/title-group/title">
                                            <xsl:attribute name="source">chapter</xsl:attribute>
                                            <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6</xsl:attribute>
                                            <xsl:text>chapter</xsl:text>
                                        </xsl:when>
                                        <!-- Numérique premium -->
                                        <xsl:when test="collection-meta">
                                            <xsl:attribute name="source">book</xsl:attribute>
                                            <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T</xsl:attribute>
                                            <xsl:text>book</xsl:text>
                                        </xsl:when>
                                        <!-- Brill-hacco -->
                                        <xsl:when test="//book[metadata]/@type">
                                            <xsl:attribute name="source"><xsl:value-of select="//book[metadata]/@type"/></xsl:attribute>
                                            <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-36WXPZKG-C</xsl:attribute>
                                            <xsl:text>collected-courses</xsl:text>
                                        </xsl:when>
                                        <!-- brepols -->
                                        <xsl:when test="$codeGenreBrepolsBook">
                                            <xsl:attribute name="source">
                                                <xsl:value-of select="$codeGenreBrepolsBook"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="scheme">
                                                <xsl:value-of select="$codeGenreArkBrepolsBook"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="$codeGenreBrepolsBook"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </note>
                                <!-- niveau revue / book -->
                                <xsl:choose>
                                    <xsl:when test="$docIssue//book/book-series-meta">
                                        <note type="publication-type">
                                            <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                            <xsl:text>book-series</xsl:text>
                                        </note>
                                    </xsl:when>
                                    <!-- Brill-ebooks-->
                                    <xsl:when test="//book/collection-meta">
                                        <note type="publication-type">
                                            <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                            <xsl:text>book-series</xsl:text>
                                        </note>
                                    </xsl:when>
                                    <!-- Brill-hacco -->
                                    <xsl:when test="//book[metadata]/@type">
                                        <note type="publication-type">
                                            <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5540BQ2P-Q</xsl:attribute>
                                            <xsl:text>reference-works</xsl:text>
                                        </note>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <!-- niveau revue -->
                                        <note type="publication-type">
                                            <xsl:attribute name="subtype">book</xsl:attribute>
                                            <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                            <xsl:text>book</xsl:text>
                                        </note>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="front/article-meta/volume-id">
                                    <xsl:apply-templates select="front/article-meta/volume-id"/>
                                </xsl:if>
                            </notesStmt>
                            <sourceDesc>
                                <xsl:choose>
                                    <xsl:when test="//body/book-part[@book-part-type='chapter']/book-part-meta">
                                        <xsl:apply-templates select="//book" mode="editor"/>
                                    </xsl:when>
                                    <xsl:when test="//body/book-part/book-part-meta">
                                        <xsl:apply-templates select="//book-part" mode="sourceDesc"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//book" mode="editor"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </sourceDesc>
                        </fileDesc>
                        <!-- versionning -->
                        <xsl:call-template name="insertVersion"/>
                        
                        <xsl:choose>
                            <xsl:when test="//body/book-part/book-part-meta/abstract |$docIssue//subj-group/subject">
                                <profileDesc>
                                    <langUsage>
                                        <language>
                                            <xsl:attribute name="ident">
                                                <xsl:choose>
                                                    <xsl:when test="//body/book-part/@xml:lang">
                                                        <xsl:value-of select="//body/book-part/@xml:lang"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="$langBrill"/>
                                                    </xsl:otherwise>
                                                </xsl:choose> 
                                            </xsl:attribute>
                                        </language>
                                    </langUsage>
                                    
                                    <xsl:apply-templates select="//body/book-part/book-part-meta/abstract"/>
                                    <xsl:if test="$docIssue//subj-group/subject[string-length() &gt; 0]">
                                        <textClass ana="subject">
                                            <xsl:apply-templates select="$docIssue//book-categories/subj-group"/>
                                        </textClass>
                                    </xsl:if>
                                    <!-- brill-ebooks -->
                                    <xsl:if test="//book-part[@book-part-type='chapter']/book-part-meta/kwd-group">
                                        <textClass ana="keyword">
                                            <keywords>
                                                <xsl:apply-templates select="//book-part[@book-part-type='chapter']/book-part-meta/kwd-group/kwd"/>
                                            </keywords>
                                        </textClass>
                                    </xsl:if>
                                </profileDesc>
                            </xsl:when>
                            <xsl:when test="//book/entryGroup/keywordGroup | //book[metadata]/../abstract| /book/metadata/title/@lang">
                                <profileDesc>
                                    <xsl:apply-templates select="//book[metadata]/../abstract"/>
                                    <xsl:if test="//book/entryGroup/keywordGroup/keyword[string-length() &gt; 0]">
                                        <xsl:for-each select="//book/entryGroup/keywordGroup">
                                        <textClass ana="subject">
                                            <xsl:if test="@type">
                                                <xsl:attribute name="xml:lang">
                                                    <xsl:value-of select="@type"/>
                                                </xsl:attribute>
                                            </xsl:if>
                                            <keywords>
                                                <xsl:apply-templates select="keyword"/>
                                            </keywords>
                                        </textClass>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="/book/metadata/title/@lang[string-length()&gt; 0]">
                                        <langUsage>
                                            <language>
                                                <xsl:attribute name="ident">
                                                    <xsl:value-of select="/book/metadata/title/@lang"/>
                                                </xsl:attribute>
                                            </language>
                                        </langUsage>
                                    </xsl:if>
                                    
                                </profileDesc>
                            </xsl:when>
                            <xsl:when test="book-meta/abstract[string-length() &gt; 0] |$docIssue//book-meta/pub-date">
                                <profileDesc>
                                    <creation>
                                        <xsl:apply-templates select="$docIssue//book-meta/pub-date | //book-meta/pub-date"/>
                                    </creation>
                                    <!-- PL: abstract is moved from <front> to here -->
                                    <xsl:choose>
                                        <!-- ne pas reprendre les abstracts du livre si on traite les chapitres-->
                                        <xsl:when test="/book/book-meta/abstract and /book/body/book-part/book-part-meta/title-group/title"/>
                                        <xsl:otherwise>
                                            <xsl:if test="book-meta/abstract[string-length() &gt; 0]">
                                                <xsl:apply-templates select="book-meta/abstract"/>
                                            </xsl:if>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    
                                    <!-- NPremium - book_collection -->
                                    <xsl:if test="collection-meta[@collection-type='book collection']/title-group/title[string-length() &gt; 0]">
                                        <textClass ana="collection">
                                            <keywords>
                                                <xsl:for-each select="collection-meta[@collection-type='book collection']/title-group">
                                                    <xsl:choose>
                                                        <xsl:when test="title">
                                                            <term>
                                                                <xsl:value-of select="title"/>
                                                            </term>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </xsl:for-each>
                                                
                                            </keywords>
                                        </textClass>
                                    </xsl:if>
                                    <xsl:if test="book-meta/subj-group[string-length() &gt; 0]">
                                        <textClass ana="subject">
                                            <xsl:for-each select="book-meta/subj-group">
                                                <xsl:if test="subject">
                                                    <keywords>
                                                        <list>
                                                            <xsl:if test="subj-group/subject[string-length() &gt; 0]">
                                                                <item>
                                                                    <xsl:value-of select="subj-group/subject"/>
                                                                </item>
                                                            </xsl:if>
                                                            <xsl:if test="subj-group/subj-group/subj-group/subj-group/subject">
                                                                <item>
                                                                    <xsl:value-of select="normalize-space(subj-group/subj-group/subj-group/subj-group/subject)"/>
                                                                </item>
                                                            </xsl:if>
                                                            <xsl:if test="subj-group/subj-group/subject">
                                                                <item>
                                                                    <xsl:value-of select="normalize-space(./subj-group/subj-group/subject)"/>
                                                                </item>
                                                            </xsl:if>
                                                            <xsl:if test="subj-group/subj-group/subj-group/subject">
                                                                <item>
                                                                    <xsl:value-of select="normalize-space(subj-group/subj-group/subj-group/subject)"/>
                                                                </item>
                                                            </xsl:if>
                                                        </list>
                                                    </keywords>
                                                </xsl:if>
                                            </xsl:for-each>
                                        </textClass>
                                    </xsl:if>
                                    <xsl:if test="$docIssue//book-meta/book-categories[string-length() &gt; 0]">
                                        <textClass ana="journal-subject">
                                            <xsl:for-each select="$docIssue//book-meta/book-categories/subj-group">
                                                <keywords scheme="journal-subject">
                                                    <list>
                                                        <xsl:apply-templates select="subject" mode="brepols"/>
                                                    </list>
                                                </keywords>
                                            </xsl:for-each>
                                        </textClass>
                                    </xsl:if>
                                    <xsl:if test="book-meta/book-categories[string-length() &gt; 0]">
                                        <textClass ana="book-subject">
                                            <xsl:for-each select="book-meta/book-categories/subj-group">
                                                <keywords scheme="book-subject">
                                                    <list>
                                                        <xsl:apply-templates select="subject" mode="degruyter"/>
                                                    </list>
                                                </keywords>
                                            </xsl:for-each>
                                        </textClass>
                                    </xsl:if>
                                    <xsl:if test="book-meta/kwd-group[string-length() &gt; 0]">
                                        <xsl:apply-templates select="book-meta/kwd-group"/>
                                    </xsl:if>
                                    
                                    <!-- language -->
                                    <xsl:choose>
                                        <xsl:when test="book-meta/volume[1]/@xml:lang">
                                            <langUsage>
                                                <language>
                                                    <xsl:attribute name="ident">
                                                        <xsl:value-of select="translate(book-meta/volume[1]/@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                    </xsl:attribute>
                                                </language>
                                            </langUsage>
                                        </xsl:when>
                                        <xsl:when test="book-meta/abstract[1]/@xml:lang">
                                            <langUsage>
                                                <language>
                                                    <xsl:attribute name="ident">
                                                        <xsl:value-of select="translate(book-meta/abstract[1]/@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                    </xsl:attribute>
                                                </language>
                                            </langUsage></xsl:when>
                                    </xsl:choose>
                                </profileDesc>
                            </xsl:when>
                            <xsl:otherwise>
                                <profileDesc>
                                    <xsl:choose>
                                        <!-- brill-ebooks -->
                                        <xsl:when test="//isbn[@publication-format='online']='9789004294967'
                                            or //isbn[@publication-format='online']='9789004295261'
                                            or //isbn[@publication-format='online']='9789004295476'
                                            or //isbn[@publication-format='online']='9789004295568'
                                            or //isbn[@publication-format='online']='9789004295643'
                                            or //isbn[@publication-format='online']='9789004295667'
                                            or //isbn[@publication-format='online']='9789004295704'
                                            or //isbn[@publication-format='online']='9789004296497'
                                            or //isbn[@publication-format='online']='9789004296565'
                                            or //isbn[@publication-format='online']='9789004296541'
                                            or //isbn[@publication-format='online']='9789004296640'
                                            or //isbn[@publication-format='online']='9789004295780'
                                            or //isbn[@publication-format='online']='9789004295797'">
                                            <langUsage>
                                                <language ident="it"/>
                                            </langUsage>
                                        </xsl:when>
                                        <xsl:when test="//isbn[@publication-format='online']='9789004296138'
                                            or //isbn[@publication-format='online']='9789004296145'
                                            or //isbn[@publication-format='online']='9789004296152'
                                            or //isbn[@publication-format='online']='9789004294769'
                                            or //isbn[@publication-format='online']='9789004294790'
                                            or //isbn[@publication-format='online']='9789004296213'
                                            or //isbn[@publication-format='online']='9789004294806'
                                            or //isbn[@publication-format='online']='9789004294813'
                                            or //isbn[@publication-format='online']='9789004294820'
                                            or //isbn[@publication-format='online']='9789004296237'
                                            or //isbn[@publication-format='online']='9789004296244'
                                            or //isbn[@publication-format='online']='9789004294899'
                                            or //isbn[@publication-format='online']='9789004294912'
                                            or //isbn[@publication-format='online']='9789004294929'
                                            or //isbn[@publication-format='online']='9789004294950'
                                            or //isbn[@publication-format='online']='9789004296275'
                                            or //isbn[@publication-format='online']='9789004296329'
                                            or //isbn[@publication-format='online']='9789004296282'
                                            or //isbn[@publication-format='online']='9789004296305'
                                            or //isbn[@publication-format='online']='9789004294981'
                                            or //isbn[@publication-format='online']='9789004295032'
                                            or //isbn[@publication-format='online']='9789004295124'
                                            or //isbn[@publication-format='online']='9789004295131'
                                            or //isbn[@publication-format='online']='9789004295148'
                                            or //isbn[@publication-format='online']='9789004295186'
                                            or //isbn[@publication-format='online']='9789004295247'
                                            or //isbn[@publication-format='online']='9789004295278'
                                            or //isbn[@publication-format='online']='9789004295285'
                                            or //isbn[@publication-format='online']='9789004301672'
                                            or //isbn[@publication-format='online']='9789004295308'
                                            or //isbn[@publication-format='online']='9789004295315'
                                            or //isbn[@publication-format='online']='9789004295322'
                                            or //isbn[@publication-format='online']='9789004296404'
                                            or //isbn[@publication-format='online']='9789004295339'
                                            or //isbn[@publication-format='online']='9789004295421'
                                            or //isbn[@publication-format='online']='9789004295438'
                                            or //isbn[@publication-format='online']='9789004295452'
                                            or //isbn[@publication-format='online']='9789004295469'
                                            or //isbn[@publication-format='online']='9789004295483'
                                            or //isbn[@publication-format='online']='9789004295490'
                                            or //isbn[@publication-format='online']='9789004295551'
                                            or //isbn[@publication-format='online']='9789004295544'
                                            or //isbn[@publication-format='online']='9789004295636'
                                            or //isbn[@publication-format='online']='9789004295650'
                                            or //isbn[@publication-format='online']='9789004296459'
                                            or //isbn[@publication-format='online']='9789004296466'
                                            or //isbn[@publication-format='online']='9789004295728'
                                            or //isbn[@publication-format='online']='9789004296480'
                                            or //isbn[@publication-format='online']='9789004301412'
                                            or //isbn[@publication-format='online']='9789004295933'
                                            or //isbn[@publication-format='online']='9789004301504'
                                            or //isbn[@publication-format='online']='9789004295988'
                                            or //isbn[@publication-format='online']='9789047412328'
                                            or //isbn[@publication-format='online']='9789047415855'
                                            or //isbn[@publication-format='online']='9789047408277'
                                            or //isbn[@publication-format='online']='9789047410331'
                                            or //isbn[@publication-format='online']='9789004210912'
                                            or //isbn[@publication-format='online']='9789004263246'">
                                            <langUsage>
                                                <language ident="fr"/>
                                            </langUsage>
                                        </xsl:when>
                                        <xsl:when test="//isbn[@publication-format='online']='9789004296077'
                                            or //isbn[@publication-format='online']='9789004296091'
                                            or //isbn[@publication-format='online']='9789004294738'
                                            or //isbn[@publication-format='online']='9789004294776'
                                            or //isbn[@publication-format='online']='9789004294974'
                                            or //isbn[@publication-format='online']='9789004294998'
                                            or //isbn[@publication-format='online']='9789004295001'
                                            or //isbn[@publication-format='online']='9789004301344'
                                            or //isbn[@publication-format='online']='9789004295087'
                                            or //isbn[@publication-format='online']='9789004295292'
                                            or //isbn[@publication-format='online']='9789004301689'
                                            or //isbn[@publication-format='online']='9789004295377'
                                            or //isbn[@publication-format='online']='9789004295407'
                                            or //isbn[@publication-format='online']='9789004295506'
                                            or //isbn[@publication-format='online']='9789004295513'
                                            or //isbn[@publication-format='online']='9789004295537'
                                            or //isbn[@publication-format='online']='9789004296435'
                                            or //isbn[@publication-format='online']='9789004296442'
                                            or //isbn[@publication-format='online']='9789004295711'
                                            or //isbn[@publication-format='online']='9789004301375'
                                            or //isbn[@publication-format='online']='9789004295742'
                                            or //isbn[@publication-format='online']='9789004295858'
                                            or //isbn[@publication-format='online']='9789004295896'">
                                            <langUsage>
                                                <language ident="de"/>
                                            </langUsage>
                                        </xsl:when>
                                       <!-- fin brill-ebooks -->
                                        <xsl:when test="/book/metadata/title/@lang">
                                            <langUsage>
                                                <language>
                                                    <xsl:attribute name="ident">
                                                        <xsl:value-of select="translate(/book/metadata/title/@lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                    </xsl:attribute>
                                                </language>
                                            </langUsage>
                                        </xsl:when>
                                        <xsl:when test="//book-meta/book-id[@pub-id-type='doi']='10.1484/M.IPM-EB.5.112141'">
                                            <langUsage>
                                                <language>
                                                    <xsl:attribute name="ident">fr</xsl:attribute>
                                                </language>
                                            </langUsage>
                                        </xsl:when>
                                        <xsl:when test="//book-meta/book-id[@pub-id-type='doi']='10.1484/M.TEMA-EB.4.00775'">
                                            <langUsage>
                                                <language>
                                                    <xsl:attribute name="ident">en</xsl:attribute>
                                                </language>
                                            </langUsage>
                                        </xsl:when>
                                        <xsl:when test="//book-meta/book-id[@pub-id-type='doi']='10.1484/M.IPM-EB.4.2017034'">
                                            <langUsage>
                                                <language>
                                                    <xsl:attribute name="ident">la</xsl:attribute>
                                                </language>
                                            </langUsage>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <langUsage>
                                                <language>
                                                    <xsl:attribute name="ident">en</xsl:attribute>
                                                </language>
                                            </langUsage>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </profileDesc>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- traceability -->
                        <revisionDesc>
                            <change when="{$releasedate}" who="istex" xml:id="pub2tei">formatting</change>
                        </revisionDesc>
                    </teiHeader>
                    <text>
                        <xsl:if test="//book-part[@book-part-type='part']/book-part-meta/title-group/title[string-length()&gt; 0]">
                            <front>
                                <titlePage>
                                    <docTitle>
                                        <titlePart>
                                            <xsl:if test="//book-part[@book-part-type='part']/book-part-meta/title-group/label[string-length()&gt; 0]">
                                                <xsl:value-of select="normalize-space(//book-part[@book-part-type='part']/book-part-meta/title-group/label)"/>
                                                <xsl:text> - </xsl:text>
                                            </xsl:if>
                                            <xsl:value-of select="normalize-space(//book-part[@book-part-type='part']/book-part-meta/title-group/title)"/>
                                        </titlePart>
                                    </docTitle>
                                </titlePage>
                            </front>
                        </xsl:if>
                        <body>
                            <xsl:choose>
                                <!-- brill-ebooks -->
                                <xsl:when test="//book-part[@book-part-type='chapter']/body">
                                    <xsl:apply-templates select="//book-part[@book-part-type='chapter']/body"/>
                                </xsl:when>
                                <!-- sauf degruyter ebooks -->
                                <xsl:when test="//book/body/book-part/body and not(contains(/book/book-meta/book-id[@pub-id-type='doi'],'10.1515/'))">
                                    <xsl:apply-templates select="/book/body/book-part/body"/>
                                </xsl:when>
                                <xsl:when test="//book/book-body/book-part/body">
                                    <xsl:apply-templates select="//book/book-body/book-part/body"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <div>
                                        <xsl:choose>
                                            <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                                                <p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <p></p>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </div>
                                </xsl:otherwise>
                            </xsl:choose>
                        </body>
                        <xsl:choose>
                            <!-- brill-ebooks -->
                            <xsl:when test="//book-part[@book-part-type='chapter']/back">
                                <back>
                                <xsl:apply-templates select="//book-part[@book-part-type='chapter']/back"/>
                                </back>
                            </xsl:when>
                            <xsl:when test="//book/body/book-part/back">
                                <back>
                                    <xsl:apply-templates select="//book/body/book-part/back/*"/>
                                </back>
                            </xsl:when>
                            <xsl:when test="//book/book-body/book-part/back">
                                <back>
                                    <xsl:apply-templates select="//book/book-body/book-part/back/*"/>
                                </back>
                            </xsl:when>
                        </xsl:choose>
                    </text>
                </xsl:otherwise>
            </xsl:choose>
        </TEI>
    </xsl:template>

    <!-- Building the sourceDesc bibliographical representation -->
    <xsl:template match="book-part" mode="sourceDesc">
        <biblStruct>
            <analytic>
                <!-- Title information related to the chapter goes here -->
                <xsl:apply-templates select="//body/book-part/book-part-meta/title-group/title"/>
                <!-- All authors are included here -->
                <xsl:apply-templates select="//body/book-part/book-part-meta/contrib-group/contrib"/>
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
                <xsl:if test="//body/book-part/book-part-meta/book-part-id[@pub-id-type='doi'] | //book-part[@book-part-type='chapter']/book-part-meta/book-part-id[@book-part-id-type='doi']">
                    <idno type="DOI">
                        <xsl:value-of select="//body/book-part/book-part-meta/book-part-id[@pub-id-type='doi'] | //book-part[@book-part-type='chapter']/book-part-meta/book-part-id[@book-part-id-type='doi']"/>
                    </idno>
                </xsl:if>
                <xsl:if test="//book-part-meta/alternate-form">
                    <xsl:for-each select="//book-part-meta/alternate-form">
                        <idno type="{@alternate-form-type}">
                            <xsl:value-of select="normalize-space(@xlink:href)"/>
                        </idno>
                    </xsl:for-each>
                </xsl:if>
            </analytic>
            <monogr>
                <xsl:apply-templates select="//book/book-meta/book-title-group/book-title"/>
                <xsl:apply-templates select="//book/book-meta/book-title-group/subtitle" mode="monogr"/>
                <xsl:if test="$docIssue//book-meta/isbn[@pub-type='ppub'] | //book/book-meta/isbn[@pub-type='ppub']">
                    <idno type="ISBN">
                        <xsl:value-of select="$docIssue//book-meta/isbn[@pub-type='ppub'] | //book/book-meta/isbn[@pub-type='ppub']"/>
                    </idno>
                </xsl:if>
                <xsl:if test="$docIssue//book-meta/isbn[@pub-type='epub'] | //book/book-meta/isbn[@pub-type='epub']">
                    <idno type="eISBN">
                        <xsl:value-of select="$docIssue//book-meta/isbn[@pub-type='epub'] | //book/book-meta/isbn[@pub-type='epub']"/>
                    </idno>
                </xsl:if>
                <xsl:if test="//book/book-meta/book-id[@pub-id-type='doi']">
                    <idno type="DOI">
                        <xsl:value-of select="//book/book-meta/book-id[@pub-id-type='doi']"/>
                    </idno>
                </xsl:if>
                <xsl:apply-templates select="//body/book-part/book-part-meta/book-part-id[@pub-id-type='doi']"/>
                <xsl:apply-templates select="$docIssue//book-meta/counts/page-count"/>
                <xsl:apply-templates select="//body/book-part/book-part-meta/counts"/>
                <xsl:apply-templates select="$docIssue//book-meta/contrib-group/contrib"/>
                <xsl:apply-templates select="//book/book-meta/contrib-group/contrib"/>
                <imprint>
                    <!-- publisher-->
                    <xsl:apply-templates select="$docIssue//book-meta/publisher"/>
                    <!-- traiter volume numéro pubdate depuis fichier externe -->
                    <xsl:choose>
                        <xsl:when test="$docIssue//book-meta/pub-date/year">
                            <xsl:apply-templates select="$docIssue//book-meta/pub-date/year"/>
                        </xsl:when>
                        <xsl:when test="$docIssue//body/book-meta/pub-date/year">
                            <xsl:apply-templates select="$docIssue//body/book-meta/pub-date/year"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="//book/book-meta/volume[1]">
                            <xsl:apply-templates select="//book/book-meta/volume [1]"/>
                        </xsl:when>
                        <xsl:when test="$docIssue//book-meta/volume">
                            <xsl:apply-templates select="$docIssue//book-meta/volume"/>
                        </xsl:when>
                        <xsl:when test="$docIssue//body/book-meta/volume">
                            <xsl:apply-templates select="$docIssue//body/book-meta/volume"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:apply-templates select="//body/book-part/book-part-meta/fpage"/>
                    <xsl:apply-templates select="//body/book-part/book-part-meta/lpage"/>
                </imprint>
            </monogr>
            <!-- faire un if et gérer le niveau série dans fichier externe -->
            <xsl:choose>
                <!-- traitement degruyter ebooks special 
                exemple 10.1515/9781501504396-->
                <xsl:when test="contains(/book/book-meta/book-title-group/book-title,'Homer’s Iliad')">
                    <series>
                        <title level="s" type="main">
                            <xsl:value-of select="/book/book-meta/book-title-group/book-title"/>
                        </title>
                        <editor>
                            <persName>
                                <surname>Bierl</surname>
                                <forename type="first">Anton</forename>
                            </persName>
                        </editor>
                        <editor>
                            <persName>
                                <surname>Joachim Latacz</surname>
                                <forename type="first">Joachim</forename>
                            </persName>
                        </editor>
                    </series>
                </xsl:when>
                <xsl:when test="$docIssue//book-series-meta/book-title-group/book-title">
                    <series>
                        <xsl:apply-templates select="$docIssue//book-series-meta/book-title-group/book-title"/>
                        <xsl:apply-templates select="SeriesInfo/SeriesTitle"/>
                        <xsl:apply-templates select="SeriesInfo/SeriesPrintISSN"/>
                        <xsl:apply-templates select="SeriesInfo/SeriesElectronicISSN"/>
                        <xsl:apply-templates select="$docIssue//book-series-meta/book-id[@pub-id-type='doi']"/>
                    </series>
                </xsl:when>
                <xsl:when test="//book/book-series-meta/book-id">
                    <series>
                        <xsl:variable name="titreSerieDG">
                            <xsl:choose>
                                <xsl:when test="/book/book-series-meta/book-id[@pub-id-type='doi']='10.1515/ba'">Byzantinisches Archiv</xsl:when>
                                <xsl:when test="/book/book-series-meta/book-id[@pub-id-type='doi']='10.1515/icon'">Image &amp; Context</xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="issnSerieDG">
                            <xsl:choose>
                                <xsl:when test="/book/book-series-meta/book-id[@pub-id-type='doi']='10.1515/ba'">1864-9785</xsl:when>
                                <xsl:when test="/book/book-series-meta/book-id[@pub-id-type='doi']='10.1515/icon'">1868-4777</xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="eissnSerieDG">
                            <xsl:choose>
                                <xsl:when test="/book/book-series-meta/book-id[@pub-id-type='doi']='10.1515/ba'">2366-7052</xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:if test="contains(/book/book-series-meta/book-id[@pub-id-type='doi'],'10.1515/')">
                            <title level="s" type="main">
                                <xsl:value-of select="$titreSerieDG"/>
                            </title>
                            <idno type="ISSN">
                                <xsl:value-of select="$issnSerieDG"/>
                            </idno>
                            <idno type="eISSN">
                                <xsl:value-of select="$eissnSerieDG"/>
                            </idno>
                       </xsl:if>
                        <xsl:apply-templates select="//book/book-series-meta/book-id[@pub-id-type='doi']"/>
                    </series>
                </xsl:when>
            </xsl:choose>
        </biblStruct>
    </xsl:template>
    
    <!-- Building the sourceDesc bibliographical representation -->
    <xsl:template match="book" mode="editor">
        <biblStruct>
            <!-- Genre     -->
            <xsl:if test="@type[string-length()&gt; 0]">
                <xsl:attribute name="type">
                    <xsl:value-of select="normalize-space(@type)"/>
                </xsl:attribute>
            </xsl:if>
            <analytic>
                <!-- Title information related to the paper goes here -->
                <xsl:choose>
                    <xsl:when test="//book/entryGroup/entry/headGroup/head[string-length()&gt; 0]">
                        <title level="a" type="main">
                            <xsl:if test="//book/entryGroup/entry/headGroup/label[string-length()&gt; 0]">
                                <xsl:value-of select="/book/entryGroup/entry/headGroup/label"/>
                                <xsl:text> - </xsl:text>
                            </xsl:if>
                            <xsl:value-of select="/book/entryGroup/entry/headGroup/head"/>
                        </title>
                    </xsl:when>
                    <xsl:when test="//book-part[@book-part-type='chapter']/book-part-meta/title-group/title[string-length()&gt; 0]">
                        <xsl:apply-templates select="//book-part[@book-part-type='chapter']/book-part-meta/title-group/title"/>
                    </xsl:when>
                    <xsl:when test="/book/book-body/book-part/book-part-meta/title-group/title[string-length()&gt; 0]">
                        <xsl:apply-templates select="/book/book-body/book-part/book-part-meta/title-group/title"/>
                    </xsl:when>
                    <xsl:when test="book-meta/book-title-group/book-title">
                        <xsl:apply-templates select="book-meta/book-title-group/book-title" mode="analytic"/>
                    </xsl:when>
                </xsl:choose>
                
                
                <!-- All authors are included here -->
                <xsl:choose>
                    <xsl:when test="//book-part[@book-part-type='chapter']/book-part-meta/contrib-group/contrib[@contrib-type='author'][string-length()&gt; 0]">
                        <xsl:apply-templates select="//book-part[@book-part-type='chapter']/book-part-meta/contrib-group/contrib[@contrib-type='author']"/>
                    </xsl:when>
                    <xsl:when test="/book/book-meta/contrib-group/contrib[@contrib-type='editor']">
                        <xsl:apply-templates select="/book/book-meta/contrib-group/contrib[@contrib-type='editor']" mode="analytic"/>
                    </xsl:when>
                    <xsl:when test="//metadata/author[string-length()&gt; 0]">
                        <xsl:apply-templates select="//metadata/author"/>
                    </xsl:when>
                    <xsl:when test="//metadata/editor[string-length()&gt; 0]">
                        <xsl:apply-templates select="//metadata/editor"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="book-meta/contrib-group"/>
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
                <xsl:if test="/book/entryGroup/entry/identifier[string-length() &gt; 0]">
                    <xsl:for-each select="/book/entryGroup/entry/identifier">
                        <idno type="{translate(@type,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')}">
                            <xsl:value-of select="normalize-space(.)"/>
                        </idno>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="//entryGroup/@id[string-length() &gt; 0]">
                    <idno type="ArticleID">
                        <xsl:value-of select="normalize-space(//entryGroup/@id)"/>
                    </idno>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="//book-part[@book-part-type='chapter']/book-part-meta/book-part-id[@book-part-id-type='doi']">
                        <idno type="DOI">
                            <xsl:value-of select="normalize-space(//book-part[@book-part-type='chapter']/book-part-meta/book-part-id[@book-part-id-type='doi'])"/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="/book/book-body/book-part/book-part-meta/book-part-id[@book-part-id-type='doi']">
                        <idno type="DOI">
                            <xsl:value-of select="normalize-space(/book/book-body/book-part/book-part-meta/book-part-id[@book-part-id-type='doi'])"/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="book-meta/book-id[string-length() &gt; 0]">
                        <xsl:for-each select="book-meta/book-id">
                            <idno type="{translate(@book-id-type,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')}">
                                <xsl:choose>
                                    <xsl:when test="@book-id-type='doi'[string-length() &gt; 0]">
                                        <xsl:choose>
                                            <xsl:when test="starts-with(.,'10')">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>10.14375/NP.</xsl:text>
                                                <xsl:value-of select="normalize-space(@book-id-type)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </idno>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
                
                <xsl:if test="book-meta/self-uri">
                    <xsl:for-each select="book-meta/self-uri">
                            <idno>
                                <xsl:if test="@content-type">
                                    <xsl:attribute name="type">
                                        <xsl:value-of select="normalize-space(@content-type)"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="contains(.,'http://dx.doi.org/')">
                                    <xsl:attribute name="type">URI-DOI</xsl:attribute>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="@xlink:href">
                                        <xsl:value-of select="normalize-space(@xlink:href)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="."/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </idno>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="//toc/item/@id[string-length() &gt; 0]">
                    <xsl:for-each select="//toc/item/@id">
                        <idno>
                            <xsl:attribute name="type">ArticleNumber</xsl:attribute>
                            <xsl:value-of select="normalize-space(.)"/>
                        </idno>
                    </xsl:for-each>
                </xsl:if>
            </analytic>
            <monogr>
                <xsl:choose>
                    <xsl:when test="//book/collection-meta[2]">
                        <title level="m" type="main">
                            <xsl:apply-templates select="//book/collection-meta[2]" mode="brill-ebooks"/>
                        </title>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="book-meta/book-title-group/book-title" mode="monogr"/>
                        <xsl:apply-templates select="book-meta/book-title-group/subtitle"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:apply-templates select="metadata/title"/>
                <xsl:apply-templates select="metadata/subtitle"/>
                

                <!-- ********************************** Identifier *******************************-->
                <xsl:if test="book-meta/isbn[string-length() &gt; 0]">
                    <xsl:for-each select="book-meta/isbn">
                        <xsl:choose>
                            <xsl:when test="@publication-format='online'">
                                <idno type='eISBN'>
                                    <xsl:value-of select="normalize-space(.)"/>
                                </idno>
                            </xsl:when>
                            <xsl:otherwise>
                                <idno type='ISBN'>
                                    <xsl:if test="@content-type[string-length() &gt; 0]">
                                        <xsl:attribute name="subtype">
                                            <xsl:value-of select="@content-type"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="normalize-space(.)"/>
                                </idno>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="metadata/isbn[string-length() &gt; 0]">
                    <xsl:for-each select="metadata/isbn">
                        <idno type="ISBN">
                            <xsl:value-of select="normalize-space(.)"/>
                        </idno>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="/book/@id[string-length() &gt; 0]">
                    <idno type="bookID">
                        <xsl:value-of select="normalize-space(/book/@id)"/>
                    </idno>
                </xsl:if>
                <xsl:if test="/book/metadata/identifier[string-length() &gt; 0]">
                    <xsl:for-each select="/book/metadata/identifier">
                        <idno type="{translate(@type,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')}">
                            <xsl:value-of select="normalize-space(.)"/>
                        </idno>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="/book/book-meta/book-id[@book-id-type='doi']">
                    <idno type="DOI">
                        <xsl:value-of select="normalize-space(/book/book-meta/book-id[@book-id-type='doi'])"/>
                    </idno>
                </xsl:if>
                <!-- All authors are included here -->
                <xsl:apply-templates select="/book/book-meta/contrib-group/contrib"/>
                <xsl:apply-templates select="/book/book-meta/contrib-group/contrib[@contrib-type='editor']" mode="editor"/>       
                
                <imprint>
                    <xsl:if test="book-meta/publisher[1]/publisher-name | metadata/publisher">
                        <publisher><xsl:value-of select="book-meta/publisher[1]/publisher-name |metadata/publisher"/></publisher>
                    </xsl:if>
                    <xsl:if test="book-meta/publisher[1]/publisher-loc | metadata/pubPlace">
                        <pubPlace><xsl:value-of select="book-meta/publisher[1]/publisher-loc | metadata/pubPlace"/></pubPlace>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="book-meta/pub-date[@publication-format='print']/year[string-length() &gt; 0]">
                            <date type="published">
                                <xsl:attribute name="when">
                                    <xsl:value-of select="book-meta/pub-date[@publication-format='print']/year"/>
                                </xsl:attribute>
                                <xsl:value-of select="book-meta/pub-date[@publication-format='print']/year"/>
                            </date>
                        </xsl:when>
                        <xsl:when test="book-meta/pub-date/year">
                            <date type="published">
                                <xsl:attribute name="when">
                                    <xsl:value-of select="normalize-space(book-meta/pub-date[1]/year)"/>
                                </xsl:attribute>
                                <xsl:value-of select="normalize-space(book-meta/pub-date[1]/year)"/>
                            </date>
                        </xsl:when>
                        <xsl:when test="//metadata/pubDate[string-length() &gt; 0] != 'na'">
                            <date type="published">
                                <xsl:attribute name="when">
                                    <xsl:value-of select="//metadata/pubDate"/>
                                </xsl:attribute>
                                <xsl:value-of select="//metadata/pubDate"/>
                            </date>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="//metadata/date[@type='course'][string-length() &gt; 0] != 'na'">
                                <date type="published">
                                    <xsl:attribute name="when">
                                        <xsl:value-of select="//metadata/date[@type='course']"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="//metadata/date[@type='course']"/>
                                </date>   
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="/book/collection-meta[2]/volume-in-collection/volume-number">
                            <biblScope unit="vol">
                                <xsl:value-of select="/book/collection-meta[2]/volume-in-collection/volume-number"/>
                            </biblScope>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="/book/collection-meta/volume-in-collection/volume-number"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="//series[1]/@n[string-length() &gt; 0] and not(contains(//series[1]/@n,'978'))">
                            <biblScope unit="vol">
                                <xsl:choose>
                                    <xsl:when test="starts-with(//series[1]/@n, '00')">
                                        <xsl:value-of select="substring-after(//series[1]/@n,'00')"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with(//series[1]/@n, '0')">
                                        <xsl:value-of select="substring-after(//series[1]/@n,'0')"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with(//series[1]/@n, '-')">
                                        <xsl:value-of select="substring-after(//series[1]/@n,'-')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="//series[1]/@n"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </biblScope>
                        </xsl:when>
                    </xsl:choose>
                    <!-- ******************* pagination ******************************-->
                    <xsl:if test="//book/entryGroup/entry/@startpage[string-length() &gt; 0] | /book/book-body/book-part/book-part-meta/fpage[string-length() &gt; 0] |//book-part[@book-part-type='chapter']/book-part-meta/fpage[string-length() &gt; 0]">
                        <biblScope unit="page" from="{//book/entryGroup/entry/@startpage| /book/book-body/book-part/book-part-meta/fpage |//book-part[@book-part-type='chapter']/book-part-meta/fpage}">
                            <xsl:value-of select="//book/entryGroup/entry/@startpage| /book/book-body/book-part/book-part-meta/fpage |//book-part[@book-part-type='chapter']/book-part-meta/fpage"/>
                        </biblScope>
                        <biblScope unit="page" to="{//book/entryGroup/entry/@endpage| /book/book-body/book-part/book-part-meta/lpage |//book-part[@book-part-type='chapter']/book-part-meta/lpage}">
                            <xsl:value-of select="//book/entryGroup/entry/@endpage| /book/book-body/book-part/book-part-meta/lpage |//book-part[@book-part-type='chapter']/book-part-meta/lpage"/>
                        </biblScope>
                    </xsl:if>
                    <xsl:apply-templates select="book-meta/counts/book-page-count"/>
                    <xsl:apply-templates select="book-body/book-part/book-part-meta/counts/book-page-count"/>
                </imprint>
            </monogr>
                
            <xsl:apply-templates select="collection-meta"/>
            
            <xsl:if test="//metadata/series[string-length() &gt; 0]">
                <series>
                    <xsl:apply-templates select="//metadata/series"/>
                </series>
            </xsl:if>
            <xsl:if test="/book/book-meta/related-object">
                <xsl:apply-templates select="/book/book-meta/related-object"/>
            </xsl:if>
        </biblStruct>
    </xsl:template>
    <xsl:template match="//book-categories/subj-group">
        <keywords>
            <xsl:attribute name="scheme">
                <xsl:choose>
                    <xsl:when test="@subj-group-type">
                        <xsl:value-of select="@subj-group-type"/>
                    </xsl:when>
                    <xsl:otherwise>subject</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="subject/@code">
                    <list>
                        <xsl:apply-templates/>
                    </list>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </keywords>
    </xsl:template>
    <xsl:template match="//book-categories/subj-group/subject">
        <xsl:choose>
            <xsl:when test="@code">
                <label>
                    <xsl:value-of select="@code"/>
                </label>
                <item>
                    <xsl:apply-templates/>
                </item>
            </xsl:when>
            <xsl:otherwise>
                <term>
                    <xsl:apply-templates/>
                </term>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="//book-categories/subj-group/subject" mode="brepols">
        <xsl:choose>
            <xsl:when test="@code">
                <item>
                <label>
                    <xsl:value-of select="@code"/>
                </label>
                <term>
                    <xsl:apply-templates/>
                </term>
                </item>
            </xsl:when>
            <xsl:otherwise>
                <term>
                    <xsl:apply-templates/>
                </term>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="//book-categories/subj-group/subject" mode="degruyter">
        <item>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="."/>
            </xsl:attribute>
            <term>
            <xsl:call-template name="identifySubjectCode">
                <xsl:with-param name="theCode">
                    <xsl:value-of select="."/>
                </xsl:with-param>
            </xsl:call-template>
            </term>
        </item>
    </xsl:template>
    
    <!-- Numérique Premium -->
    <!-- author related information -->
  <xsl:template match="book-meta/contrib-group">
        <xsl:apply-templates select="contrib"/>
    </xsl:template>
    
    
    <!-- page-count-->
    <xsl:template match="book-meta/counts/book-page-count">
        <biblScope unit="page-count">
            <xsl:value-of select="@count"/>
        </biblScope>
    </xsl:template>
    <xsl:template match="book-body/book-part/book-part-meta/counts/book-page-count">
        <biblScope unit="chapter-count">
            <xsl:value-of select="@count"/>
        </biblScope>
    </xsl:template>
    
    <xsl:template match="contrib" mode="editorSeries">
        <editor>
            <xsl:apply-templates/>
            <xsl:if test="@contrib-type[string-length() &gt; 0]">
                <roleName>
                    <xsl:value-of select="@contrib-type"/>
                </roleName>
            </xsl:if>
        </editor>
    </xsl:template>
    <xsl:template match="contrib" mode="editor">
        <editor>
            <xsl:variable name="i" select="position()-1"/>
            <xsl:variable name="editorNumber">
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
            </xsl:variable>
            <xsl:if test="not(ancestor::sub-article | ancestor::ref)">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="$editorNumber"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
            <xsl:if test="@contrib-type[string-length() &gt; 0]">
                <roleName>
                    <xsl:value-of select="@contrib-type"/>
                </roleName>
            </xsl:if>
        </editor>
    </xsl:template>
    <xsl:template match="contrib" mode="author">
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
            <xsl:if test="not(ancestor::sub-article | ancestor::ref)">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="$authorNumber"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
            <xsl:if test="@contrib-type[string-length() &gt; 0]">
                <roleName>
                    <xsl:value-of select="@contrib-type"/>
                </roleName>
            </xsl:if>
        </author>
    </xsl:template>
    <xsl:template match="book-title" mode="analytic">
        <title level="a" type="main">
            <xsl:if test="@Language | @xml:lang">
                <xsl:attribute name="xml:lang">
                    <xsl:choose>
                        <xsl:when test="@Language='' or @xml:lang=''">
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
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <xsl:template match="book-title" mode="monogr">
        <title level="m" type="main">
            <xsl:if test="@Language | @xml:lang">
                <xsl:attribute name="xml:lang">
                    <xsl:choose>
                        <xsl:when test="@Language='' or @xml:lang=''">
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
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    
    <xsl:template match="contrib[@contrib-type = 'editor']" mode="analytic">
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
            <xsl:if test="not(ancestor::sub-article)">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="$authorNumber"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </author>
    </xsl:template>
    <xsl:template match="counts">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="page-count">
        <idno type="page-count">
            <xsl:apply-templates select="@count"/>
        </idno>
    </xsl:template>
    <xsl:template match="publisher">
        <xsl:apply-templates select="publisher-name"/>
        <xsl:apply-templates select="publisher-loc"/>
    </xsl:template>
    <xsl:template match="persName">
        <persName>
            <xsl:apply-templates select="foreName"/>
            <xsl:apply-templates select="surname"/>
        </persName>
    </xsl:template>
    
    <!-- liens vers images externes en relation chez Cambridge ebooks -->
    <xsl:template match="related-object">
        <relatedItem>
            <xsl:if test="@content-type">
                <xsl:attribute name="type">
                    <xsl:value-of select="@content-type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@object-type">
                <xsl:attribute name="subtype">
                    <xsl:value-of select="@object-type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@xlink:href">
                <ref>
                    <xsl:value-of select="@xlink:href"/>
                </ref>
            </xsl:if>
        </relatedItem>
    </xsl:template>
    
    <xsl:template match="series">
        <title level="s" type="main">
            <xsl:if test="@lang">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="@lang"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    
    <xsl:template match="target">
        <ptr target="#{@id}"/>
    </xsl:template>
    
    <xsl:template match="volume-in-collection/volume-number">
        <biblScope unit="vol">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>
    <xsl:template match="collection-id">
        <idno type="collection-id">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="collection-meta">
        <series>
            <xsl:choose>
                <xsl:when test="@collection-type='series'">
                    <xsl:attribute name="ana">series</xsl:attribute>
                </xsl:when>
                <xsl:when test="@collection-type='book-set'">
                    <xsl:attribute name="ana">sub-series</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="title-group/title"/>
            <xsl:apply-templates select="title-group/subtitle"/>
            <xsl:apply-templates select="contrib-group/contrib" mode="editorSeries"/>
            <xsl:apply-templates select="issn"/>
            <xsl:apply-templates select="collection-id"/>
            <xsl:apply-templates select="volume-in-collection/volume-number"/>
        </series>
    </xsl:template>
    <xsl:template match="collection-meta[2]" mode="brill-ebooks">
            <xsl:value-of select=".[@collection-type='book-set']/title-group/title"/>
            <xsl:text> : </xsl:text>
            <xsl:value-of select="//book/book-meta/book-title-group/book-title[1]"/>
    </xsl:template>
</xsl:stylesheet>
