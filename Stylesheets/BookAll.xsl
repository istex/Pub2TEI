<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns:mml="http://www.w3.org/1998/Math/MathML"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- traitement des ebooks complets comme pour taylor & francis -->
    <xsl:template match="book-meta" mode="TF">
        <teiHeader>
            <fileDesc>
                <titleStmt>
                    <xsl:apply-templates select="book-title-group/book-title" mode="TF"/>
                    <xsl:apply-templates select="book-title-group/subTitle" mode="TF"/>
                    <xsl:apply-templates select="contrib-group/contrib" mode="TF"/>
                </titleStmt>
                <xsl:apply-templates select="edition" mode="TF"/>
                <publicationStmt>
                    <authority>ISTEX</authority>
                    <!-- AJOUTER LES ARKS -->
                    <publisher scheme="https://scientific-publisher.data.istex.fr/ark:/67375/H02-">Taylor &amp; Francis</publisher>
                    <xsl:apply-templates select="publisher" mode="TF"/>
                    <availability>
                        <licence>
                            <p>Taylor &amp; Francis – ebooks</p>   
                        </licence>
                        <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-">taylor-francis</p>
                    <xsl:apply-templates select="permissions" mode="TF"/>
                    <xsl:apply-templates select="imprint-meta" mode="TF"/>
                    </availability>
                    <!-- date -->
                    <xsl:apply-templates select="pub-date"/>
                </publicationStmt>
                <notesStmt>
                    <!-- genre de publication -->
                    <xsl:choose>
                        <xsl:when test="issn[string-length()&gt; 0] | series[string-length()&gt; 0]">
                            <note type="book-series" scheme="https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z">book-series</note>
                        </xsl:when>
                        <xsl:when test="//book">
                            <note type="book" scheme="https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F">book</note>
                        </xsl:when>
                    </xsl:choose>
                    
                </notesStmt>
                <sourceDesc>
                    <biblStruct type="inbook">
                        <analytic>
                            <xsl:apply-templates select="book-title-group/book-title" mode="TF"/>
                            <xsl:apply-templates select="book-title-group/subTitle" mode="TF"/>
                            <xsl:apply-templates select="contrib-group/contrib" mode="TFana"/>
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
                            <xsl:if test="//body/book-id[@pub-id-type='doi']">
                                <idno type="DOI">
                                    <xsl:value-of select="//body/book-id[@pub-id-type='doi']"/>
                                </idno>
                            </xsl:if>
                        </analytic>
                        <monogr>
                            <xsl:apply-templates select="book-title-group/book-title" mode="TF"/>
                            <xsl:apply-templates select="book-title-group/subTitle" mode="TF"/>
                            <xsl:if test="//body/book-id[@pub-id-type='doi']">
                                <idno type="DOI">
                                    <xsl:value-of select="//body/book-id[@pub-id-type='doi']"/>
                                </idno>
                            </xsl:if>
                            <xsl:apply-templates select="isbn" mode="TF"/>
                            
                            <imprint>
                                <!-- date -->
                                <xsl:apply-templates select="pub-date"/>
                                <!-- tomaison -->
                                <xsl:apply-templates select="volume"/>
                                <xsl:apply-templates select="issue"/>
                                <!-- recontruction de la pagination du book -->
                                <xsl:call-template name="pagination"/>
                                <!-- publisher -->
                                <xsl:apply-templates select="publisher" mode="TF"/>
                                <!-- date -->
                                <xsl:apply-templates select="pub-date" mode="TF"/>
                            </imprint>
                        </monogr>
                        <!-- ******************* serie ******************************-->
                        <xsl:choose>
                            <xsl:when test="issn[string-length() &gt; 0]">
                                <series>
                                    <xsl:variable name="titleSeries">
                                        <xsl:value-of select="issn"/>
                                    </xsl:variable>
                                    <!-- ********************************* Titre de la série ************************-->    
                                    <title level="s">
                                        <xsl:choose>
                                            <xsl:when test="$titleSeries='1467-1441'">Cass series : British politics and society</xsl:when>
                                            <xsl:when test="$titleSeries='1363-5670'">Cass series in regional and federal studies</xsl:when>
                                            <xsl:when test="$titleSeries='1362-9395'">Cass series : Mediterranean politics (London. 1996)</xsl:when>
                                            <xsl:when test="$titleSeries='1473-6403'">Cass series : Strategy and history</xsl:when>
                                            <xsl:when test="$titleSeries='1477-058X'">Cass series : Totalitarian movements and political religions</xsl:when>
                                            <xsl:when test="$titleSeries='1365-3733'">The Cummings Center Series</xsl:when>
                                            <xsl:when test="$titleSeries='0300-3930'">Local government studies</xsl:when>
                                        </xsl:choose>
                                    </title>
                                    <!-- identifiers -->
                                    <imprint>
                                    <idno>
                                        <xsl:attribute name="type">ISSN</xsl:attribute>
                                        <xsl:value-of select="normalize-space(issn)"/>
                                    </idno>
                                    </imprint>
                                </series>
                            </xsl:when>
                            <xsl:when test="series[string-length() &gt; 0]">
                                <series>
                                    <!-- ********************************* Titre de la série ************************-->    
                                    <title level="s">
                                        <xsl:value-of select="normalize-space(series)"/>
                                    </title>
                                </series>
                            </xsl:when>
                        </xsl:choose>
                    </biblStruct>
                </sourceDesc>
            </fileDesc>
            <xsl:call-template name="insertVersion"/>
            <xsl:if test="abstract">
                <profileDesc>
                    <!-- language -->
                    <xsl:variable name="langue">
                        <xsl:choose>
                            <xsl:when test="//@xml-lang">
                                <xsl:value-of select="//@xml-lang"/>
                            </xsl:when>
                            <xsl:otherwise>en</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <langUsage>
                        <language>
                            <xsl:attribute name="ident">
                                <xsl:value-of select="$langue"/>   
                            </xsl:attribute>
                            <xsl:value-of select="$langue"/>
                        </language>
                    </langUsage>
                    <!-- abstract-->
                    <xsl:apply-templates select="abstract"/>
                    
                    <!-- collection -->
                    <xsl:if test="series[string-length() &gt; 0 ]">
                        <textClass>
                            <keywords scheme="book-collection">
                                <xsl:for-each select="series">
                                    <term>
                                        <xsl:if test="@Code">
                                            <xsl:attribute name="authority">tf-subject-codes</xsl:attribute>
                                            <xsl:attribute name="authorityURI">
                                                <xsl:value-of select="@code"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </term>
                                </xsl:for-each>
                            </keywords>
                        </textClass>
                    </xsl:if>
                </profileDesc>
            </xsl:if>
            
            <!-- traceability -->
            <revisionDesc>
                <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
            </revisionDesc>
        </teiHeader>
        <!-- body -->
        <text>
            
            <xsl:if test="//book/book-front[string-length() &gt; 0 ]">
                <xsl:apply-templates select="//book/book-front" mode="TF"/>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="//book/body/book-part/body[string-length() &gt; 0 ]">
                    <body>
                        <xsl:apply-templates select="//book/body/book-part/body" mode="TF"/>
                    </body>
                </xsl:when>
                <xsl:otherwise>
                    <body>
                        <div>
                            <xsl:choose>
                                <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                                    <p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                    </body>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:if test="//book/back[string-length() &gt; 0 ]">
                <xsl:apply-templates select="//book/back"/>
            </xsl:if>
        </text>
    </xsl:template>
    <!-- taylor et francis -->
    <xsl:template match="book-title" mode="TF">
        <title level="a" type="main">
            <xsl:value-of select="normalize-space(.)"/>
        </title>
    </xsl:template>
    <xsl:template match="subTitle" mode="TF">
        <title level="a" type="sub">
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <xsl:template match="contrib" mode="TF">
        <xsl:choose>
            <xsl:when test="@contrib-type='editor'">
                <respStmt>
                    <resp>Editor</resp>
                    <xsl:apply-templates select="name" mode="TF"/>
                </respStmt>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="name" mode="TF">
        <name>
            <xsl:value-of select="surname"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="given-names"/>
        </name>
    </xsl:template>
    <xsl:template match="contrib" mode="TFana">
        <author>
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
            <xsl:apply-templates/>
        </author>
    </xsl:template>
    <xsl:template match="publisher" mode="TF">
        <publisher>
            <xsl:value-of select="publisher-name"/>
            <xsl:if test="publisher-loc">
                <xsl:text> - </xsl:text>
                <xsl:value-of select="publisher-loc"/>
            </xsl:if>
        </publisher>
    </xsl:template>
    <xsl:template match="isbn" mode="TF">
        <idno>
            <xsl:attribute name="type">
                <xsl:choose>
                    <xsl:when test="@pub-type='pbk'">pISBN</xsl:when>
                    <xsl:when test="@pub-type='ebk'">eISBN</xsl:when>
                    <xsl:when test="@pub-type='hbk'">hISBN</xsl:when>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="permissions" mode="TF">
            <xsl:apply-templates select="copyright-statement" mode="TF"/>
            <xsl:apply-templates select="copyright-year" mode="TF"/>
            <xsl:apply-templates select="copyright-holder" mode="TF"/>
    </xsl:template>
    <xsl:template match="copyright-statement" mode="TF">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="copyright-year" mode="TF">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="copyright-holder" mode="TF">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="imprint-meta" mode="TF">
        <xsl:apply-templates select="imprint-text" mode="TF"/>
    </xsl:template>
    <xsl:template match="imprint-text" mode="TF">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="pub-date" mode="TF">
        <xsl:if test="year!='0'">
            <date type="published">
                <xsl:choose>
                    <xsl:when test="@pub-type = 'epub'">
                        <xsl:attribute name="type">e-published</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="@publication-format='print'">
                        <xsl:attribute name="type">published</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="@publication-format='electronic'">
                        <xsl:attribute name="type">e-published</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="@pub-type = 'epub-original'">
                        <xsl:attribute name="type">original-e-published</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="@pub-type = 'collection'">
                        <xsl:attribute name="type">collection-published</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="@pub-type = 'final'">
                        <xsl:attribute name="type">final-published</xsl:attribute>
                    </xsl:when>
                </xsl:choose>
                <xsl:attribute name="when">
                    <xsl:call-template name="makeISODateFromComponents">
                        <xsl:with-param name="oldDay" select="day"/>
                        <xsl:with-param name="oldMonth" select="month"/>
                        <xsl:with-param name="oldYear" select="year"/>
                    </xsl:call-template>
                </xsl:attribute>
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldYear" select="year"/>
                </xsl:call-template>
            </date>
        </xsl:if>
    </xsl:template>
    <xsl:template match="edition" mode="TF">
        <editionStmt>
            <edition><xsl:apply-templates/></edition>
        </editionStmt>
    </xsl:template>
    <xsl:template name="pagination">
        <!-- page de début-->
        <xsl:choose>
            <xsl:when test="//book/back/ref-list/sec-meta/fpage">
                <biblScope unit="page">
                    <xsl:attribute name="from">
                        <xsl:value-of select="normalize-space(//book/back/ref-list/sec-meta/fpage)"/>
                    </xsl:attribute>
                    <xsl:value-of select="//book/back/ref-list/sec-meta/fpage"/>
                </biblScope>
            </xsl:when>
            <xsl:when test="//book/body/book-part/book-part-meta/fpage[string-length() &gt; 0]">
                <biblScope unit="page">
                    <xsl:attribute name="from">
                        <xsl:apply-templates select="//book/body/book-part/book-part-meta/fpage" mode="book"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="//book/body/book-part/book-part-meta/fpage" mode="book"/>
                </biblScope>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="//book/body/book-part/book-part-meta/title-group/title/xref[@ref-type='page']/@id">
                    <xsl:choose>
                        <xsl:when test="position() = 1">
                            <biblScope unit="page">
                                <xsl:attribute name="from">
                                    <xsl:value-of select="substring-after(.,'page_')"/>
                                </xsl:attribute>
                                <xsl:value-of select="substring-after(.,'page_')"/>
                            </biblScope> 
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
        <!-- page de fin-->
        <xsl:choose>
            <xsl:when test="//book/back/ref-list/sec-meta/lpage">
                <biblScope unit="page">
                    <xsl:attribute name="to">
                        <xsl:value-of select="normalize-space(//book/back/ref-list/sec-meta/lpage)"/>
                    </xsl:attribute>
                    <xsl:value-of select="//book/back/ref-list/sec-meta/lpage"/>
                </biblScope>
            </xsl:when>
            <xsl:when test="//book/body/book-part/book-part-meta/lpage[string-length() &gt; 0]">
                <biblScope unit="page">
                    <xsl:attribute name="to">
                        <xsl:apply-templates select="//book/body/book-part/book-part-meta/lpage" mode="book"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="//book/body/book-part/book-part-meta/lpage" mode="book"/>
                </biblScope>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="//title/xref[@ref-type='page']/@id">
                    <xsl:choose>
                        <xsl:when test="position() = last()">
                            <biblScope unit="page">
                                <xsl:attribute name="to">
                                    <xsl:value-of select="substring-after(.,'page_')"/>
                                </xsl:attribute>
                                <xsl:value-of select="substring-after(.,'page_')"/>
                            </biblScope>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
            <!--  nombre total de page-->
            <xsl:if test="//book-meta/counts/page-count/@count[string-length() &gt; 0]">
                <biblScope unit="page-count">
                    <xsl:value-of select="//book-meta/counts/page-count/@count"/>
                </biblScope>
            </xsl:if>
    </xsl:template>
    <xsl:template match="fpage" mode="book">
        <xsl:choose>
            <xsl:when test="position() = 1">
                <xsl:apply-templates/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="lpage" mode="book">
        <xsl:choose>
            <xsl:when test="position()=last()">
                <xsl:apply-templates/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="xref" mode="book">
        <start>
            <xsl:value-of select="substring-after(@id,'page_')"/>
        </start>
    </xsl:template>
    
    <xsl:template match="book-front" mode="TF">
        <front>
            <xsl:apply-templates select="* except(bio,ack)"/>
            <xsl:apply-templates select="bio" mode="TF"/>
        </front>
    </xsl:template>
    <xsl:template match="bio" mode="TF">
        <div>
            <xsl:attribute name="type">biography</xsl:attribute>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="book-part" mode="TF">
            <xsl:apply-templates select="book-part-meta/title-group/title" mode="TF"/>
            <xsl:apply-templates select="body" mode="TF"/>
    </xsl:template>
   <!-- <xsl:template match="book-part-meta" mode="TF">
        <xsl:apply-templates select="title-group" mode="TF"/>
    </xsl:template>
    <xsl:template match="title-group" mode="TF">
        <xsl:apply-templates select="title" mode="TF"/>
    </xsl:template>-->
    
    <xsl:template match="body" mode="TF">
        <xsl:choose>
            <xsl:when test="ancestor::book/body/book-part/book-part-meta/title-group/title and not(child::book-part/book-part-meta/title-group/title)">
                <div>
                    <xsl:if test="ancestor::book-part/@book-part-type">
                        <xsl:attribute name="type">
                            <xsl:value-of select="ancestor::book-part/@book-part-type"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="ancestor::book-part/@id">
                        <xsl:attribute name="subtype">
                            <xsl:value-of select="ancestor::book-part/@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <!-- traitement des sous-parties-->
                    <xsl:if test="ancestor::book/body/book-part/book-part-meta/title-group/title and not(child::book-part/book-part-meta/title-group/title)">
                        <head>
                            <xsl:value-of select="ancestor::book-part/book-part-meta/title-group/title"/>
                        </head>
                        <xsl:apply-templates select="* except(back)"/>
                    </xsl:if>
                </div>
            </xsl:when>
            <xsl:when test="child::book-part/book-part-meta/title-group/title">
                <xsl:apply-templates select="book-part" mode="child"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="book-part" mode="child">
        <xsl:if test="ancestor::book-part/book-part-meta/title-group/title">
                <div>
                    <xsl:if test="ancestor::book-part/@book-part-type">
                        <xsl:attribute name="type">
                            <xsl:value-of select="ancestor::book-part/@book-part-type"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="ancestor::book-part/@id">
                        <xsl:attribute name="subtype">
                            <xsl:value-of select="ancestor::book-part/@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <!-- traitement des sous-parties-->
                    <xsl:if test="ancestor::book-part/book-part-meta/title-group/title">
                        <head>
                            <xsl:value-of select="ancestor::book-part/book-part-meta/title-group/title"/>
                        </head>
                    </xsl:if>
                    <div>
                        <xsl:if test="@book-part-type">
                            <xsl:attribute name="type">
                                <xsl:value-of select="@book-part-type"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@id">
                            <xsl:attribute name="subtype">
                                <xsl:value-of select="@id"/>
                            </xsl:attribute>
                        </xsl:if>
                        <!-- traitement des sous-parties-->
                        <xsl:if test="book-part-meta/title-group/title">
                            <head>
                                <xsl:value-of select="book-part-meta/title-group/title"/>
                            </head>
                        </xsl:if>
                        <xsl:apply-templates select="* except(back)"/>
                    </div>
                </div>
        </xsl:if>
    </xsl:template>    
    <xsl:template match="body" mode="child">
        <div>
            <xsl:if test="ancestor::book-part/body/book-part/@book-part-type">
                <xsl:attribute name="type">
                    <xsl:value-of select="ancestor::book-part/body/book-part/@book-part-type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="ancestor::book-part/@id">
                <xsl:attribute name="subtype">
                    <xsl:value-of select="ancestor::book-part/@id"/>
                </xsl:attribute>
            </xsl:if>
            <!-- traitement des sous-parties-->
            <xsl:choose>
                <xsl:when test="ancestor::book/body/book-part/book-part-meta/title-group/title and not(child::book-part/book-part-meta/title-group/title)">
                    <head2>
                        <xsl:value-of select="ancestor::book-part/book-part-meta/title-group/title"/>
                    </head2>
                    <xsl:apply-templates select="book-part/body"/> 
                    <xsl:apply-templates select="* except(back)"/>
                </xsl:when>
                <xsl:when test="child::book-part/book-part-meta/title-group/title">
                    <head1>
                        <xsl:value-of select="ancestor::book-part/book-part-meta/title-group/title"/>
                    </head1>
                    <xsl:apply-templates select="book-part/body" mode="child"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="../book-part/book-part-meta/title-group/title">
                    <head3>
                        <xsl:value-of select="../book-part/book-part-meta/title-group/title [position()=last()]"/>
                    </head3>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="* except(back)"/>
        </div>
    </xsl:template>
    <xsl:template match="back">
        <back>
            <xsl:apply-templates select="//book/book-front/ack"/>
            <xsl:apply-templates select="* except(ancestor::book-part/book-part-meta/back)"/>
            <xsl:if test="//book/body/book-part/back/ref-list">
                <xsl:apply-templates select="//book/body/book-part/back/ref-list"/>
            </xsl:if>
        </back>
    </xsl:template>
</xsl:stylesheet>