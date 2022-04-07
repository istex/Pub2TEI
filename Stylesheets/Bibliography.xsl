<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:sb="http://www.elsevier.com/xml/common/struct-bib/dtd"
    xmlns:rsc="http://www.rsc.org/schema/rscart38"
    xmlns:wiley="http://www.wiley.com/namespaces/wiley" exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>

    <!-- Références bibliographiques à la fin d'un article -->
    <!-- ref-list: NLM article, ScholarOne -->

    <xsl:template match="biblist | rsc:biblist | ce:bibliography | bibl | wiley:bibliography">
        <xsl:choose>
            <xsl:when test="ce:bibliography-sec">
                <div type="references">
                    <xsl:apply-templates select="ce:section-title"/>
                    <listBibl>
                        <xsl:apply-templates select="ce:bibliography-sec"/>
                    </listBibl>
                </div>
            </xsl:when>
            <xsl:when test="ref | bib | wiley:bib | wiley:bibSection">
                <div type="references">
                    <xsl:apply-templates select="title | rsc:title"/>
                    <listBibl>
                        <!-- SG - attention parfois 2 voir 3 citations par <bibl> pour Wiley -->
                        <xsl:apply-templates
                            select="ref | citgroup | rsc:citgroup | bib | wiley:bib | wiley:bibSection"
                        />
                    </listBibl>
                </div>
            </xsl:when>

            <!-- rsc references / citations -->
            <xsl:when test="citgroup | rsc:citgroup">
                <div type="references">
                    <listBibl>
                        <xsl:for-each select="rsc:citgroup | citgroup">
                            <xsl:variable name="id">
                                <xsl:value-of select="normalize-space(@id)"/>
                            </xsl:variable>
                            <bibl type="citation">
                                <xsl:if test="$id">
                                    <xsl:attribute name="xml:id">
                                        <xsl:value-of select="normalize-space($id)"/>
                                    </xsl:attribute>
                                </xsl:if>

                                <xsl:if test="rsc:citext | citext">
                                    <xsl:for-each select="rsc:citext | citext">
                                        <title>
                                            <xsl:apply-templates/>
                                        </title>
                                    </xsl:for-each>
                                </xsl:if>

                                <xsl:for-each
                                    select="rsc:citation[@type = 'other'] | citation[@type = 'other']">
                                    <bibl type="other">
                                        <xsl:apply-templates/>
                                    </bibl>
                                </xsl:for-each>

                                <xsl:for-each
                                    select="rsc:journalcit | rsc:citation[@type = 'book'] | journalcit | citation[@type = 'book']">
                                    <bibl type="journal">
                                        <xsl:apply-templates
                                            select="* except (journalcit/jnltrans | rsc:journalcit/rsc:jnltrans)"
                                        />
                                    </bibl>

                                </xsl:for-each>

                                <xsl:apply-templates
                                    select="journalcit/jnltrans | rsc:journalcit/rsc:jnltrans"/>
                                <!-- citations particulieres -->
                                <xsl:if
                                    test="rsc:citation or citation and rsc:citation/rsc:citauth or citation/citauth or rsc:citation/rsc:title or citation/title and not(rsc:citation/@type = 'book' or citation/@type = 'book')">
                                    <xsl:for-each select="rsc:citation | citation">
                                        <xsl:choose>
                                            <xsl:when
                                                test="rsc:arttitle[string-length() &gt; 0] | arttitle[string-length() &gt; 0]">
                                                <bibl type="journal">
                                                  <xsl:apply-templates/>
                                                </bibl>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </xsl:if>
                                <!-- citations particulieres -->
                                <xsl:if
                                    test="rsc:citation | citation and rsc:citation/rsc:citauth | rsc:citation/rsc:title | citation/citauth | citation/title">
                                    <xsl:for-each select="rsc:citation | citation">
                                        <xsl:choose>
                                            <xsl:when
                                                test="rsc:arttitle[string-length() &gt; 0] | arttitle[string-length() &gt; 0]">
                                                <bibl type="journal">
                                                  <xsl:apply-templates/>
                                                </bibl>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </xsl:if>
                                <!-- niveau citgroup supplémentaire -->
                                <xsl:for-each select="rsc:citgroup | citgroup">
                                    <xsl:variable name="id">
                                        <xsl:value-of select="@id"/>
                                    </xsl:variable>
                                    <bibl type="journal">
                                        <xsl:attribute name="xml:id">
                                            <xsl:value-of select="normalize-space($id)"/>
                                        </xsl:attribute>
                                        <xsl:for-each
                                            select="
                                                rsc:journalcit | rsc:citation[@type = 'book'] | rsc:citation[@type = 'patent']
                                                | journalcit | citation[@type = 'book'] | citation[@type = 'patent']">
                                            <bibl type="journal">
                                                <xsl:apply-templates/>
                                            </bibl>
                                        </xsl:for-each>
                                    </bibl>
                                </xsl:for-each>
                            </bibl>
                        </xsl:for-each>
                    </listBibl>
                </div>
            </xsl:when>
            <xsl:when test="p">
                <div type="references">
                    <listBibl>
                        <bibl>
                            <xsl:value-of select="p"/>
                        </bibl>
                    </listBibl>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ce:bibliography-sec">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Références simples Elsevier -->

    <xsl:template match="ce:bib-reference[ce:other-ref]">
        <bibl xml:id="{@id}">
            <xsl:if test="ce:label[string-length() &gt; 0]">
                <xsl:attribute name="n">
                    <xsl:value-of select="normalize-space(ce:label)"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="*[name() != 'ce:label']"/>
        </bibl>
    </xsl:template>

    <xsl:template match="ce:other-ref">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Sage -->
    <xsl:template match="other-ref">
        <bibl type="other">
            <xsl:apply-templates/>
        </bibl>
    </xsl:template>

    <!-- Sage -->
    <xsl:template match="art-ref">
        <xsl:apply-templates/>
    </xsl:template>
    <!--  <xsl:template match="atl">
        <xsl:apply-templates/>
    </xsl:template>-->

    <xsl:template match="ce:textref">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Références complexes Elsevier -->

    <!-- Traitement des références structurées Elsevier -->

    <xsl:template match="ce:bib-reference[sb:reference]">
        <biblStruct xml:id="{@id}" n="{ce:label}">
            <xsl:choose>
                <xsl:when test="sb:reference/sb:host/sb:edited-book | sb:reference/sb:host/sb:book">
                    <xsl:attribute name="type">book</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="type">journal</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="sb:reference/sb:contribution">
                <analytic>
                    <xsl:if test="sb:reference/@id">
                        <ref xml:id="{sb:reference/@id}"/>
                    </xsl:if>
                    <xsl:apply-templates select="sb:reference/sb:contribution/*"/>
                </analytic>
            </xsl:if>
            <monogr>
                <xsl:apply-templates select="sb:reference/sb:host/sb:issue/sb:series/sb:title/*"/>
                <xsl:choose>
                    <xsl:when test="sb:reference/sb:host/sb:edited-book/sb:title">
                        <xsl:apply-templates select="sb:reference/sb:host/sb:edited-book/sb:title/*"
                        />
                    </xsl:when>
                    <xsl:otherwise>
                        <!--pour le cas ou le book aurait son titre au niveau de sb:reference-->
                        <xsl:if
                            test="sb:reference/sb:contribution/sb:title/sb:maintitle[string-length() &gt; 0] and sb:reference/sb:host/sb:edited-book">
                            <title level="m" type="main">
                                <xsl:if test="@Language | @xml:lang">
                                    <xsl:attribute name="xml:lang">
                                        <xsl:choose>
                                            <xsl:when test="@Language = '' or @xml:lang = ''">
                                                <xsl:text>en</xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:call-template name="Varia2ISO639">
                                                  <xsl:with-param name="code"
                                                  select="@Language | @xml:lang"/>
                                                </xsl:call-template>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:apply-templates
                                    select="sb:reference/sb:contribution/sb:title/sb:maintitle"/>
                            </title>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:apply-templates
                    select="sb:reference/sb:host/sb:edited-book/sb:book-series/sb:series/sb:title/*"/>
                <xsl:apply-templates select="sb:reference/sb:host/sb:edited-book/sb:editors/*"/>
                <xsl:apply-templates select="sb:reference/sb:host/sb:book/sb:title/*"/>
                <xsl:apply-templates select="sb:reference/sb:host/sb:book/sb:editors/*"/>
                <imprint>
                    <xsl:apply-templates
                        select="sb:reference/sb:host/sb:issue/sb:series/*[name() != 'sb:title']"/>
                    <xsl:apply-templates
                        select="sb:reference/sb:host/sb:edited-book/*[name() != 'sb:editors'][name() != 'sb:title']"/>
                    <xsl:apply-templates
                        select="sb:reference/sb:host/sb:book/*[name() != 'sb:editors'][name() != 'sb:title']"/>
                    <xsl:apply-templates select="sb:reference/sb:host/sb:issue/sb:issue-nr"/>
                    <xsl:apply-templates
                        select="sb:reference/sb:host/sb:edited-book/sb:book-series/sb:series/sb:volume-nr"/>
                    <xsl:apply-templates
                        select="sb:reference/sb:host/sb:edited-book/sb:book-series/sb:series/sb:issue-nr"/>
                    <xsl:apply-templates select="sb:reference/sb:host/sb:issue/sb:date"/>
                    <xsl:apply-templates select="sb:reference/sb:host/sb:pages/*"/>
                </imprint>
            </monogr>
        </biblStruct>
    </xsl:template>


    <!-- Journal paper -->

    <xsl:template match="ref[*/@citation-type = 'journal']">
        <xsl:call-template name="createArticle">
            <xsl:with-param name="entry" select="*[@citation-type = 'journal']"/>
        </xsl:call-template>
    </xsl:template>

    <!-- Journal paper -->

    <xsl:template match="ref[*/@citation-type = 'web']">
        <xsl:call-template name="createArticle">
            <xsl:with-param name="entry" select="*[@citation-type = 'web']"/>
        </xsl:call-template>
    </xsl:template>

    <!-- Journal paper in RCS -->

    <xsl:template match="citgroup | rsc:citgroup">
        <xsl:if test="journalcit | rsc:journalcit">
            <xsl:call-template name="createArticle">
                <xsl:with-param name="entry" select="journalcit | rsc:journalcit"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="citation[@type = 'book'] | rsc:citation[@type = 'book']">
            <xsl:call-template name="createBook">
                <xsl:with-param name="entry"
                    select="citation[@type = 'book'] | rsc:citation[@type = 'book']"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="citation[@type = 'other'] | rsc:citation[@type = 'other']">
            <xsl:call-template name="createOther">
                <xsl:with-param name="entry"
                    select="citation[@type = 'other'] | rsc:citation[@type = 'other']"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>


    <xsl:template name="createArticle">
        <xsl:param name="entry"/>
        <xsl:variable name="countCitation">
            <xsl:value-of select="//citgroup/journalcit | //rsc:citgroup/rsc:journalcit"/>
        </xsl:variable>
        <xsl:choose>
            <!-- enléve les mixed-citation contenant des informations de type abbreviation
            - enléve tout ce qui n'est pas des références pures-->
            <xsl:when test="contains(../@id, 'jn')"/>
            <xsl:when test="element-citation | mixed-citation">
                <xsl:apply-templates select="element-citation | mixed-citation"/>
            </xsl:when>
            <xsl:otherwise>
                <biblStruct type="article">
                    <xsl:if test="@id | citation/@id | ../@id">
                        <xsl:attribute name="xml:id">
                            <xsl:choose>
                                <xsl:when test="@id">
                                    <xsl:value-of select="@id"/>
                                </xsl:when>
                                <xsl:when test="citation/@id">
                                    <xsl:value-of select="citation/@id"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="../@id"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                    </xsl:if>
                    <!-- <xsl:attribute name="xml:id">
                <xsl:apply-templates select="$entry/@id | @id"/>
            </xsl:attribute>-->
                    <xsl:variable name="countTitle">
                        <xsl:value-of select="count($entry/article-title)"/>
                    </xsl:variable>
                    <xsl:if test="$entry/article-title | $entry/arttitle | $entry/rsc:arttitle">
                        <analytic>
                            <!-- Title information related to the paper goes here -->
                            <xsl:apply-templates
                                select="$entry/article-title | $entry/arttitle | $entry/rsc:arttitle"/>
                            <!-- All authors are included here -->
                            <xsl:apply-templates
                                select="$entry/person-group | $entry/citauth | $entry/rsc:citauth | $entry/name"/>
                            <xsl:apply-templates select="$entry/object-id"/>
                        </analytic>
                    </xsl:if>
                    <monogr>
                        <!-- palier à l'absence de titre qui est obligatoire dans monogr -->
                        <xsl:choose>
                            <xsl:when test="$entry/source | $entry/title | $entry/rsc:title">
                                <xsl:apply-templates
                                    select="$entry/source | $entry/title | $entry/rsc:title"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <title/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="not($entry/article-title)">
                            <xsl:apply-templates select="$entry/person-group"/>
                        </xsl:if>
                        <xsl:if test="$entry/collab">
                            <author>
                                <xsl:apply-templates select="$entry/collab"/>
                            </author>
                        </xsl:if>
                        <xsl:apply-templates
                            select="$entry/citauth | $entry/rsc:citauth | $entry/name"/>
                        <xsl:apply-templates select="$entry/comment"/>
                        <xsl:apply-templates select="$entry/conference"/>
                        <xsl:apply-templates select="$entry/conf-name"/>
                        <xsl:choose>
                            <xsl:when
                                test="$entry/year | $entry/rsc:year | $entry/volume | $entry/volumeno | $entry/rsc:volumeno | $entry/issue | $entry/descendant::fpage | $entry/descendant::lpage">
                                <note type="content">
                                    <xsl:value-of select="normalize-space(.)"/>
                                </note>
                                <xsl:apply-templates select="$entry/access-date"/>
                                <imprint>
                                    <xsl:apply-templates select="$entry/citpub | $entry/rsc:citpub"/>
                                    <xsl:apply-templates
                                        select="$entry/pubplace | $entry/rsc:pubplace"/>
                                    <xsl:apply-templates select="$entry/year | $entry/rsc:year"/>
                                    <xsl:apply-templates
                                        select="$entry/volume | $entry/volumeno | $entry/rsc:volumeno"/>
                                    <xsl:apply-templates select="$entry/issue | $entry/rsc:issue"/>
                                    <xsl:apply-templates
                                        select="$entry/descendant::fpage | $entry/descendant::rsc:fpage"/>
                                    <xsl:apply-templates
                                        select="$entry/descendant::lpage | $entry/descendant::rsc:lpage"
                                    />
                                </imprint>
                            </xsl:when>
                            <xsl:otherwise>
                                <imprint>
                                    <date/>
                                </imprint>
                            </xsl:otherwise>
                        </xsl:choose>
                    </monogr>
                    <xsl:apply-templates select="nlm-citation/pub-id"/>
                </biblStruct>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="createOther">
        <xsl:param name="entry"/>
        <xsl:variable name="countTitle">
            <xsl:value-of select="count($entry/article-title)"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$entry/source">
                <biblStruct type="other">
                    <xsl:attribute name="xml:id">
                        <xsl:apply-templates select="$entry/@id | @id"/>
                    </xsl:attribute>
                    <xsl:if test="$entry/article-title">
                        <analytic>
                            <xsl:choose>
                                <xsl:when test="$countTitle &gt; 2">
                                    <xsl:for-each select="$entry/article-title">
                                        <title>
                                            <xsl:value-of select="."/>
                                        </title>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="$entry/article-title"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="$countTitle &gt; 2">
                                    <xsl:for-each select="$entry/article-title">
                                        <title>
                                            <xsl:value-of select="."/>
                                        </title>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="$entry/article-title"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <!-- All authors are included here -->
                            <xsl:apply-templates
                                select="$entry/person-group | $entry/citauth | $entry/name"/>
                            <xsl:apply-templates select="$entry/object-id"/>
                        </analytic>
                    </xsl:if>
                    <monogr>
                        <xsl:apply-templates select="$entry/source | $entry/title"/>
                        <xsl:if test="not($entry/article-title)">
                            <xsl:apply-templates select="$entry/person-group"/>
                        </xsl:if>
                        <xsl:apply-templates select="$entry/citauth | $entry/name"/>
                        <xsl:apply-templates select="$entry/comment"/>
                        <xsl:apply-templates select="$entry/conference"/>
                        <xsl:apply-templates select="$entry/conf-name"/>
                        <xsl:choose>
                            <xsl:when
                                test="$entry/year | $entry/volume | $entry/volumeno | $entry/issue | $entry/descendant::fpage | $entry/descendant::lpage">
                                <note type="content">
                                    <xsl:value-of select="normalize-space(.)"/>
                                </note>
                                <imprint>
                                    <xsl:apply-templates select="$entry/citpub"/>
                                    <xsl:apply-templates select="$entry/pubplace"/>
                                    <xsl:apply-templates select="$entry/year"/>
                                    <xsl:apply-templates select="$entry/volume | $entry/volumeno"/>
                                    <xsl:apply-templates select="$entry/issue"/>
                                    <xsl:apply-templates select="$entry/descendant::fpage"/>
                                    <xsl:apply-templates select="$entry/descendant::lpage"/>
                                </imprint>
                            </xsl:when>
                            <xsl:otherwise>
                                <imprint>
                                    <date/>
                                </imprint>
                            </xsl:otherwise>
                        </xsl:choose>
                    </monogr>
                    <xsl:apply-templates select="nlm-citation/pub-id"/>
                </biblStruct>
            </xsl:when>
            <xsl:otherwise>
                <bibl type="other">
                    <xsl:attribute name="xml:id">
                        <xsl:apply-templates select="$entry/@id | @id"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </bibl>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Reference to a journal article (3.0 style) -->
    <xsl:template match="ref[element-citation/@publication-type = 'journal']">
        <xsl:call-template name="createArticle">
            <xsl:with-param name="entry" select="*[@publication-type = 'journal']"/>
        </xsl:call-template>
    </xsl:template>

    <!-- Reference to a journal article (3.0 style) -->
    <xsl:template
        match="
            ref[element-citation/@citation-type = 'other']
            | ref[nlm-citation/@citation-type = 'other']">
        <xsl:call-template name="createOther">
            <xsl:with-param name="entry" select="*[@citation-type = 'other']"/>
        </xsl:call-template>
    </xsl:template>

    <!-- Conference paper - generic -->

    <xsl:template match="ref[*/@citation-type = 'confproc']">
        <xsl:call-template name="createInConf">
            <xsl:with-param name="entry" select="*[@citation-type = 'confproc']"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="createInConf">
        <xsl:param name="entry"/>
        <biblStruct type="inproceedings">
            <xsl:apply-templates select="@id"/>
            <analytic>
                <!-- All authors are included here -->
                <xsl:apply-templates select="$entry/person-group"/>
                <xsl:apply-templates select="$entry/string-name"/>
                <xsl:apply-templates select="$entry/collab" mode="editors"/>
                <!-- Title information related to the paper goes here -->
                <xsl:apply-templates select="$entry/article-title"/>
            </analytic>
            <monogr>
                <xsl:apply-templates select="$entry/source"/>
                <xsl:apply-templates select="$entry/conf-name"/>
                <xsl:apply-templates select="$entry/publisher-name" mode="conf"/>
                <imprint>
                    <xsl:apply-templates select="$entry/publisher-name"/>
                    <xsl:apply-templates select="$entry/conf-loc"/>
                    <xsl:apply-templates select="$entry/conf-date"/>
                    <xsl:apply-templates select="$entry/year"/>
                    <xsl:apply-templates select="$entry/volume"/>
                    <xsl:apply-templates select="$entry/issue"/>
                    <xsl:apply-templates select="$entry/fpage"/>
                    <xsl:apply-templates select="$entry/lpage"/>
                </imprint>
            </monogr>
            <xsl:apply-templates select="$entry/pub-id"/>
        </biblStruct>
    </xsl:template>

    <!-- Reference to a conference paper (3.0 style) -->
    <xsl:template match="ref[*/@publication-type = 'confproc']">
        <xsl:choose>
            <xsl:when test="not(ref[*/source])">
                    <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="createInConf">
                    <xsl:with-param name="entry" select="*[@publication-type = 'confproc']"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Book - generic -->

    <xsl:template match="ref[*/@citation-type = 'book']">
        <xsl:call-template name="createBook">
            <xsl:with-param name="entry" select="*[@citation-type = 'book']"/>
        </xsl:call-template>
    </xsl:template>

    <!-- Reference to a book (old style)

    <xsl:template match="ref[*/@publication-type='book']">
        <xsl:call-template name="createBook">
            <xsl:with-param name="entry" select="*[@publication-type='book']"/>
        </xsl:call-template>
    </xsl:template>-->

    <xsl:template name="createBook">
        <xsl:param name="entry"/>

        <xsl:choose>
            <xsl:when test="$entry/../nlm-citation">
                <xsl:variable name="countID">
                    <xsl:value-of select="count($entry/../nlm-citation)"/>
                </xsl:variable>
                <xsl:variable name="position">
                    <xsl:value-of select="count($entry/../nlm-citation)"/>
                </xsl:variable>
                <xsl:for-each select="$entry/../nlm-citation">
                    <biblStruct type="book">
                        <!-- SG - pour pallier référence multiple contenu dans un même bloc
                            ayant le même ID-->
                        <xsl:attribute name="xml:id">
                            <xsl:choose>
                                <xsl:when test="$countID != 1">
                                    <xsl:value-of select="ancestor::ref/@id"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:value-of select="position()"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="xml:id">
                                        <xsl:value-of select="ancestor::ref/@id"/>
                                    </xsl:attribute>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:if test="./article-title">
                            <analytic>
                                <xsl:apply-templates select="./article-title"/>
                                <xsl:apply-templates select="./person-group"/>
                                <xsl:apply-templates select="./name"/>
                                <xsl:apply-templates select="./citauth | ./name"/>
                            </analytic>
                        </xsl:if>
                        <monogr>
                            <!-- palier à l'absence de titre qui est obligatoire dans monogr -->
                            <xsl:choose>
                                <xsl:when test="./source">
                                    <xsl:apply-templates select="./source"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:variable name="normalize">
                                        <xsl:value-of select="article-title"/>
                                    </xsl:variable>
                                    <title level="m" type="main">
                                        <xsl:value-of select="normalize-space($normalize)"/>
                                    </title>
                                </xsl:otherwise>
                            </xsl:choose>

                            <xsl:apply-templates select="./uri" mode="citation"/>
                            <xsl:apply-templates select="./pub-id"/>
                            <!-- All authors are included here -->
                            <xsl:if test="not(./article-title)">
                                <xsl:apply-templates select="./person-group"/>
                                <xsl:apply-templates select="./name"/>
                                <xsl:apply-templates select="./citauth | ./name"/>
                            </xsl:if>
                            <xsl:apply-templates select="./editor"/>
                            <imprint>
                                <xsl:apply-templates select="./year"/>
                                <xsl:apply-templates select="./publisher-loc"/>
                                <xsl:apply-templates select="./publisher-name"/>
                                <xsl:apply-templates select="./citpub"/>
                                <xsl:apply-templates select="./pubplace"/>
                                <xsl:apply-templates select="./fpage"/>
                                <xsl:apply-templates select="./lpage"/>
                                <xsl:apply-templates select="./edition"/>
                            </imprint>
                        </monogr>
                    </biblStruct>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="countTitle">
                    <xsl:value-of select="count($entry/article-title)"/>
                </xsl:variable>
                <biblStruct type="book">
                    <xsl:if test="$entry/@id | @id != ''">
                        <xsl:attribute name="xml:id">
                            <xsl:apply-templates select="$entry/@id | @id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="$entry/article-title">
                        <analytic>
                            <xsl:apply-templates select="$entry/article-title"/>
                            <xsl:apply-templates select="$entry/person-group"/>
                            <xsl:apply-templates select="$entry/name"/>
                            <xsl:apply-templates select="$entry/citauth | $entry/name"/>
                        </analytic>
                    </xsl:if>
                    <monogr>
                        <!-- palier à l'absence de titre qui est obligatoire dans monogr -->
                        <xsl:choose>
                            <!--La référence en position 2 correspond à la source -->
                            <xsl:when test="$countTitle = 2">
                                <title level="m" type="main">
                                    <xsl:value-of
                                        select="normalize-space($entry/article-title[position() = 2])"
                                    />
                                </title>
                            </xsl:when>
                            <xsl:when test="$entry/source">
                                <xsl:apply-templates select="$entry/source"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <title level="m" type="main">
                                    <xsl:value-of select="normalize-space($entry/article-title)"/>
                                </title>
                            </xsl:otherwise>
                        </xsl:choose>

                        <xsl:apply-templates select="$entry/uri" mode="citation"/>
                        <xsl:apply-templates select="$entry/pub-id"/>
                        <!-- All authors are included here -->
                        <xsl:if test="not($entry/article-title)">
                            <xsl:apply-templates select="$entry/person-group"/>
                            <xsl:apply-templates select="$entry/name"/>
                            <xsl:apply-templates select="$entry/citauth | $entry/name"/>
                        </xsl:if>
                        <xsl:apply-templates select="$entry/editor"/>
                        <imprint>
                            <xsl:apply-templates select="$entry/year"/>
                            <xsl:apply-templates select="$entry/publisher-loc"/>
                            <xsl:apply-templates select="$entry/publisher-name"/>
                            <xsl:apply-templates select="$entry/citpub"/>
                            <xsl:apply-templates select="$entry/pubplace"/>
                            <xsl:apply-templates select="$entry/fpage"/>
                            <xsl:apply-templates select="$entry/lpage"/>
                            <xsl:apply-templates select="$entry/edition"/>
                        </imprint>
                    </monogr>
                </biblStruct>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="citpub | rsc:citpub">
        <publisher>
            <xsl:apply-templates/>
        </publisher>
    </xsl:template>
    <xsl:template match="pubplace | rsc:pubplace">
        <pubPlace>
            <xsl:apply-templates/>
        </pubPlace>
    </xsl:template>
    <!-- Unspecified reference (old style) -->
    <xsl:template match="ref">
        <xsl:choose>
            <xsl:when test="note">
                <bibl type="note">
                    <xsl:apply-templates/>
                </bibl>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="element-citation"/>
                <xsl:choose>
                    <xsl:when test="count(mixed-citation) &gt;= 2">
                        <bibl xml:id="{@id}">
                            <xsl:apply-templates select="mixed-citation" mode="multiple"/>
                        </bibl>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="mixed-citation"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="citation">
                    <bibl>
                        <xsl:attribute name="type">
                            <xsl:choose>
                                <xsl:when
                                    test="
                                        citation/@publication-type
                                        | citation/@citation-type
                                        | nlm-citation/@publication-type
                                        | nlm-citation/@citation-type
                                        | mixed-citation/@publication-type
                                        | mixed-citation/@citation-type">
                                    <xsl:value-of
                                        select="
                                            citation/@publication-type
                                            | citation/@citation-type
                                            | nlm-citation/@publication-type
                                            | nlm-citation/@citation-type
                                            | mixed-citation/@publication-type
                                            | mixed-citation/@citation-type"
                                    />
                                </xsl:when>
                                <xsl:when test="citation/@xlink:type">
                                    <xsl:value-of select="citation/@xlink:type"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <!-- ACS ex: <ref id="bc980059jn00002">
            <mixed-citation><comment>Abbreviations:  Abz, <italic toggle="yes">o</italic>-aminobenzoyl; Abz-OH, o-aminobenzoic acid; BTEE, <italic toggle="yes">N</italic>-benzoyl tyrosine ethyl ester; Bop, (benzotriazolyloxy)tris-(dimethylamino)phosphonium hexafluorophosphate; Boc, <italic toggle="yes">tert</italic>-butoxycarbonyl; <italic toggle="yes">  t-</italic>Bu, <italic toggle="yes">tert</italic>-butyl; DCC, <italic toggle="yes">N</italic>,<italic toggle="yes">N</italic>‘-dicyclohexylcarbodiimide; dhbt, 3,4-dihydro-4-oxo-1,2,3-benzotriazo-3-yl; DIEA, diisopropylethylamine; DMF, <italic toggle="yes">N</italic>,<italic toggle="yes">N</italic>-dimethylformamide; DTT, dithiothreitol; DOTA, 1,4,7,10-tetraazacyclododecane-<italic toggle="yes">N</italic>,<italic toggle="yes">N</italic>‘,<italic toggle="yes">N</italic>‘ ‘,<italic toggle="yes">N</italic>‘ ‘‘-tetraacetic acid; EtOH, ethanol; EtOAc, ethyl acetate; EDTA; ethylenediaminetetraacetic acid; Fmoc, fluoren-9-ylmethyloxycarbonyl; HOBt, 1-hydroxybenzotriazole; NO<sub>2</sub>Phe, <italic toggle="yes">p</italic>-nitrophenylalanine; NO<sub>2</sub>Tyr, 3-nitrotyrosine; NMP, 1-methyl-2-pyrrolidone; PEGA, bis(2-acrylamido-1-yl)poly(ethylene glycol) (800) cross-linked dimethyl acrylamide and mono-2-acrylamidoprop-1-yl [2-aminoprop-1-yl]poly(ethylene glycol); pfp, pentafluorophenol; THF, tetrahydrofuran; trt, trityl.</comment></mixed-citation>-->
                                        <xsl:when test="contains(@id, 'jn')">footnote</xsl:when>
                                        <xsl:when test="contains(@id, 'jb')"
                                            >miscellaneous</xsl:when>
                                        <xsl:otherwise>citation</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:attribute>
                        <xsl:choose>
                            <xsl:when test="citation/@id | mixed-citation/@id">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="citation/@id | mixed-citation/@id"/>
                                </xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@id">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="@id"/>
                                </xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:if test="label">
                            <xsl:attribute name="n">
                                <xsl:value-of select="label"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:apply-templates select="citation"/>
                        <xsl:apply-templates select="mixed-citation"/>
                        <xsl:apply-templates select="nlm-citation"/>
                    </bibl>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="citation">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="citation" mode="sage">
        <xsl:apply-templates select="journal-ref"/>
        <xsl:apply-templates select="book-ref"/>
        <xsl:apply-templates select="other-ref"/>
        <xsl:apply-templates select="conference-ref"/>
    </xsl:template>
    
    <xsl:template match="note">
        <xsl:choose>
            <xsl:when test="ancestor::ref"/>
            <xsl:otherwise>
                <note>
                    <xsl:if test="@id[string-length() &gt; 0]">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </note>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="pb">
        <xsl:choose>
            <xsl:when test="parent::div1">
                <ab>
                    <ptr>
                        <xsl:if test="@id[string-length() &gt; 0]">
                            <xsl:attribute name="target">
                                <xsl:value-of select="@id"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@n[string-length() &gt; 0]">
                            <xsl:attribute name="n">
                                <xsl:value-of select="@n"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@ref[string-length() &gt; 0]">
                            <xsl:attribute name="cRef">
                                <xsl:value-of select="@ref"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:apply-templates/>
                    </ptr>
                </ab>
            </xsl:when>
            <xsl:otherwise>
                <ptr>
                    <xsl:if test="@id[string-length() &gt; 0]">
                        <xsl:attribute name="target">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@n[string-length() &gt; 0]">
                        <xsl:attribute name="n">
                            <xsl:value-of select="@n"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@ref[string-length() &gt; 0]">
                        <xsl:attribute name="cRef">
                            <xsl:value-of select="@ref"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </ptr>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- Unspecified reference (3.0 style) -->
    <!-- <xsl:template match="ref[mixed-citation]">
        <bibl>
            <xsl:apply-templates select="@id"/>
            <xsl:apply-templates select="mixed-citation"/>
        </bibl>
    </xsl:template>-->

    <!-- <xsl:template match="mixed-citation">
        <xsl:apply-templates/>
    </xsl:template>-->

    <xsl:template match="elocation-id">
        <idno type="elocation-id">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>

    <xsl:template match="person-group[@person-group-type = 'author']">
        <xsl:apply-templates select="name" mode="authors"/>
        <xsl:apply-templates select="string-name" mode="authors"/>
        <xsl:apply-templates select="collab" mode="authors"/>
        <xsl:apply-templates select="etal"/>
    </xsl:template>

    <xsl:template match="person-group[@person-group-type = 'editor']">
        <xsl:apply-templates select="name" mode="editors"/>
        <xsl:apply-templates select="string-name" mode="editors"/>
        <xsl:apply-templates select="etal"/>
    </xsl:template>

    <xsl:template match="person-group">
        <xsl:apply-templates select="name" mode="authors"/>
        <xsl:apply-templates select="name" mode="editors"/>
        <xsl:apply-templates select="string-name" mode="authors"/>
        <xsl:apply-templates select="string-name" mode="editors"/>
        <xsl:apply-templates select="etal"/>
    </xsl:template>

    <xsl:template match="name" mode="editors">
        <editor>
            <xsl:if test="not(ancestor::ref)">
                <xsl:attribute name="xml:id">
                    <xsl:variable name="i" select="position() - 1"/>
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
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </editor>
    </xsl:template>
    <xsl:template match="edg">
        <xsl:apply-templates select="editor"/>
    </xsl:template>
    <xsl:template match="etal">
        <author>
            <xsl:attribute name="role">et-al</xsl:attribute>
            <xsl:text>et al.</xsl:text>
        </author>
    </xsl:template>
    <xsl:template match="editor | rsc:editor">
        <editor>
            <xsl:if test="not(ancestor::citation | ancestor::rsc:citation)">
                <xsl:attribute name="xml:id">
                    <xsl:variable name="i" select="position() - 1"/>
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
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </editor>
    </xsl:template>
    <xsl:template match="role">
        <xsl:if test="ancestor::contrib | parent::editor| parent::author">
            <roleName>
                <xsl:apply-templates/>
            </roleName>
        </xsl:if>
    </xsl:template>

    <xsl:template match="ed">
        <edition>
            <xsl:apply-templates/>
        </edition>
    </xsl:template>

    <xsl:template match="name" mode="authors">
        <author>
            <xsl:apply-templates select="."/>
            <xsl:if test="following-sibling::*[1][name() = 'aff']/email">
                <xsl:apply-templates select="following-sibling::*[1][name() = 'aff']/email"/>
            </xsl:if>
        </author>
    </xsl:template>
    <xsl:template match="string-name" mode="authors">
        <xsl:choose>
            <xsl:when test="ancestor::ref">
                <xsl:apply-templates select="."/>
                <xsl:if test="following-sibling::*[1][name() = 'aff']/email">
                    <xsl:apply-templates select="following-sibling::*[1][name() = 'aff']/email"/>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <author>
                    <xsl:apply-templates select="."/>
                    <xsl:if test="following-sibling::*[1][name() = 'aff']/email">
                        <xsl:apply-templates select="following-sibling::*[1][name() = 'aff']/email"
                        />
                    </xsl:if>
                </author>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="string-name" mode="editors">
        <xsl:choose>
            <xsl:when test="ancestor::ref">
                <xsl:apply-templates select="."/>
                <xsl:if test="following-sibling::*[1][name() = 'aff']/email">
                    <xsl:apply-templates select="following-sibling::*[1][name() = 'aff']/email"/>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <editor>
                    <xsl:apply-templates select="."/>
                    <xsl:if test="following-sibling::*[1][name() = 'aff']/email">
                        <xsl:apply-templates select="following-sibling::*[1][name() = 'aff']/email"
                        />
                    </xsl:if>
                </editor>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="collab" mode="authors">
        <author role="collab">
            <name>
                <xsl:value-of select="."/>
            </name>
        </author>
    </xsl:template>
    <xsl:template match="collab" mode="editors">
        <editor role="collab">
            <name>
                <xsl:value-of select="."/>
            </name>
        </editor>
    </xsl:template>

    <xsl:template match="citauth | rsc:citauth | wiley:author">
        <xsl:choose>
            <xsl:when test="ancestor::name-alternatives">
                <persName type="byline">
                    <xsl:apply-templates/>
                </persName>
            </xsl:when>
            <xsl:otherwise>
                <author>
                    <persName>
                        <xsl:apply-templates select="surname | rsc:surname"/>
                        <xsl:apply-templates select="given-names"/>
                        <xsl:apply-templates select="fname | rsc:fname"/>
                        <xsl:apply-templates select="wiley:givenNames"/>
                        <xsl:apply-templates select="wiley:familyName"/>
                    </persName>
                </author>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="string-name">
        <xsl:choose>
            <xsl:when test="wiley:givenNames | wiley:familyName">
                <persName>
                    <xsl:apply-templates select="wiley:givenNames"/>
                    <xsl:apply-templates select="wiley:familyName"/>
                </persName>
            </xsl:when>
            <xsl:when test="surname | given-names">
                <xsl:choose>
                    <xsl:when test="ancestor::ref">
                        <author>
                            <persName>
                                <xsl:apply-templates select="surname"/>
                                <xsl:apply-templates select="given-names"/>
                                <xsl:apply-templates select="../contrib-id"/>
                            </persName>
                        </author>
                    </xsl:when>
                    <xsl:otherwise>
                        <persName>
                            <xsl:apply-templates select="surname"/>
                            <xsl:apply-templates select="given-names"/>
                            <xsl:apply-templates select="../contrib-id"/>
                        </persName>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="ancestor::name-alternatives">
                    <name type="person">
                        <xsl:apply-templates/>
                    </name>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- SG ajout refs groupName -->
    <xsl:template match="wiley:groupName">
        <orgName>
            <xsl:apply-templates/>
        </orgName>
    </xsl:template>

    <xsl:template match="wiley:url">
        <xsl:text> </xsl:text>
        <idno type="url">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>

    <xsl:template match="wiley:editor">
        <editor>
            <persName>
                <xsl:apply-templates/>
            </persName>
        </editor>
    </xsl:template>

    <!-- Journal information for <monogr> -->
    <xsl:template match="source">
        <title>
            <xsl:attribute name="level">
                <xsl:choose>
                    <xsl:when
                        test="ancestor::citation/@citation-type = 'journal' or ancestor::mixed-citation/@publication-type = 'journal'
                        or ancestor::*/@publication-type='journal'">j</xsl:when>
                    <xsl:when
                        test="ancestor::citation/@citation-type = 'book' or ancestor::nlm-citation/@citation-type = 'book' or ancestor::mixed-citation/@publication-type = 'book'">m</xsl:when>
                    <xsl:otherwise>j</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:if test="@xml:lang">
                <xsl:copy-of select="@xml:lang"/>
            </xsl:if>
            <xsl:apply-templates/>
        </title>
    </xsl:template>

    <xsl:template match="pub-id">
        <idno>
            <xsl:attribute name="type">
                <xsl:value-of select="@pub-id-type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="object-id">
        <idno>
            <xsl:attribute name="type">doi</xsl:attribute>
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <!-- Generic transformation of the @id attribute -->
    <!-- If the source contains duplicated values (it does exist!) than the duplicated are renamed by order of appearance -->

    <xsl:template match="@id">
        <xsl:variable name="countIdenticalBefore">
            <xsl:value-of
                select="count(./preceding::*/@id[. = current()]) + count(./parent::*/ancestor::*/@id[. = current()])"
            />
        </xsl:variable>
        <xsl:attribute name="xml:id">
            <xsl:choose>
                <xsl:when test="$countIdenticalBefore = 0">
                    <xsl:value-of select="."/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat(., '-', $countIdenticalBefore)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>

    <!-- Titles -->

    <!-- Elsevier -->

    <xsl:template match="sb:maintitle">
        <xsl:choose>
            <xsl:when test="ancestor::sb:series/sb:title">
                <title level="s" type="main">
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:when test="ancestor::sb:edited-book/sb:title | ancestor::sb:book/sb:title">
                <title level="m" type="main">
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="sb:subtitle">
        <xsl:choose>
            <xsl:when test="ancestor::sb:series/sb:title">
                <title level="s" type="sub">
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:when test="ancestor::sb:edited-book/sb:title | ancestor::sb:book/sb:title">
                <title level="m" type="sub">
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Dates -->

    <!-- Elsevier -->
    <xsl:template match="sb:date">
        <!-- ne garder que les chiffres dans @when -->
        <date when="{translate(.,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ. /,–;','')}">
            <xsl:apply-templates/>
        </date>
    </xsl:template>

    <xsl:template match="sb:publisher">
        <publisher>
            <xsl:value-of select="sb:name"/>
        </publisher>
        <xsl:if test="sb:location">
            <pubPlace>
                <xsl:value-of select="sb:location"/>
            </pubPlace>
        </xsl:if>
    </xsl:template>

    <!-- Authors -->

    <xsl:template match="sb:authors">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="sb:editors">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="sb:et-al">
        <author role="et-al"/>
    </xsl:template>

    <xsl:template match="refau">
        <author>
            <persName>
                <xsl:apply-templates select="fnm"/>
                <xsl:apply-templates select="snm"/>
            </persName>
        </author>
    </xsl:template>
    <xsl:template match="sb:author">
        <author>
            <persName>
                <xsl:apply-templates/>
            </persName>
        </author>
    </xsl:template>
    <xsl:template match="sb:editor">
        <editor>
            <persName>
                <xsl:apply-templates/>
            </persName>
        </editor>
    </xsl:template>

    <xsl:template match="bib">

        <xsl:variable name="count">
            <xsl:value-of select="count(reftxt)"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$count &gt; 1">
                <xsl:apply-templates select="reftxt" mode="plusieursRef"/>
            </xsl:when>
            <xsl:otherwise>
                <biblStruct>
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <analytic>
                        <xsl:choose>
                            <xsl:when test="reftxt/atl">
                                <xsl:apply-templates select="reftxt/atl"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="reftxt/jtl"/>
                                    <xsl:when test="reftxt/btl"/>
                                    <xsl:otherwise>
                                        <xsl:for-each select="reftxt">
                                            <title>
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </title>
                                        </xsl:for-each>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:apply-templates select="reftxt/refau"/>
                        <xsl:apply-templates select="reftxt/i"/>
                    </analytic>
                    <monogr>
                        <xsl:if test="reftxt/jtl | reftxt/btl">
                            <xsl:apply-templates select="reftxt/jtl | reftxt/btl"/>
                        </xsl:if>
                        <imprint>
                            <xsl:choose>
                                <xsl:when test="reftxt/vid | reftxt/ppf | reftxt/ppl | reftxt/cd">
                                    <xsl:apply-templates
                                        select="reftxt/vid | reftxt/ppf | reftxt/ppl | reftxt/cd"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!-- ajout <publisher> vide pour validation TEI quand <imprint> est vide -->
                                    <publisher/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </imprint>
                    </monogr>
                </biblStruct>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="reftxt" mode="plusieursRef">
        <biblStruct>
            <analytic>
                <xsl:choose>
                    <xsl:when test="atl">
                        <xsl:apply-templates select="atl"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="jtl"/>
                            <xsl:when test="btl"/>
                            <xsl:otherwise>
                                <title>
                                    <xsl:value-of select="normalize-space(.)"/>
                                </title>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:apply-templates select="refau"/>
                <xsl:apply-templates select="i"/>
            </analytic>
            <monogr>
                <xsl:if test="jtl | btl">
                    <xsl:apply-templates select="jtl | btl"/>
                </xsl:if>
                <imprint>
                    <xsl:choose>
                        <xsl:when test="vid | ppf | ppl | cd">
                            <xsl:apply-templates select="vid | ppf | ppl | cd"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- ajout <publisher> vide pour validation TEI quand <imprint> est vide -->
                            <publisher/>
                        </xsl:otherwise>
                    </xsl:choose>
                </imprint>
            </monogr>
        </biblStruct>
    </xsl:template>
    <xsl:template match="wiley:bibSection">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="wiley:bib | wiley:bibSection/wiley:bib">
        <!-- SG - reprise ref structurées et ref non structurées -->
        <xsl:variable name="id">
            <xsl:value-of select="@xml:id"/>
        </xsl:variable>
        <bibl type="citation">
            <xsl:attribute name="xml:id">
                <xsl:value-of select="$id"/>
            </xsl:attribute>
            <xsl:for-each select="wiley:citation">
                <xsl:choose>
                    <xsl:when test="wiley:articleTitle | wiley:journalTitle">
                        <bibl type="journal">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@xml:id"/>
                            </xsl:attribute>
                            <xsl:if
                                test="wiley:articleTitle | wiley:chapterTitle | wiley:author | wiley:groupName">
                                <xsl:apply-templates select="wiley:articleTitle"/>
                                <!-- SG - ajout chapterTitle -->
                                <xsl:apply-templates select="wiley:chapterTitle"/>
                                <xsl:apply-templates select="wiley:author"/>
                                <xsl:apply-templates select="wiley:groupName"/>

                            </xsl:if>
                            <xsl:apply-templates select="wiley:journalTitle"/>

                            <xsl:choose>
                                <xsl:when
                                    test="wiley:vol | wiley:pageFirst | wiley:pageLast | wiley:pubYear">
                                    <xsl:apply-templates select="wiley:vol"/>
                                    <xsl:apply-templates select="wiley:issue"/>
                                    <xsl:apply-templates select="wiley:pageFirst"/>
                                    <xsl:apply-templates select="wiley:pageLast"/>
                                    <xsl:apply-templates select="wiley:pubYear"/>

                                </xsl:when>
                            </xsl:choose>
                        </bibl>
                    </xsl:when>
                    <!-- SG - ajout book / book-series -  chapterTitle -->
                    <xsl:when test="wiley:bookSeriesTitle">
                        <bibl type="book-series">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@xml:id"/>
                            </xsl:attribute>
                            <xsl:apply-templates select="wiley:author"/>
                            <xsl:apply-templates select="wiley:editor"/>
                            <xsl:apply-templates select="wiley:chapterTitle"/>
                            <xsl:apply-templates select="wiley:bookTitle"/>
                            <xsl:choose>
                                <xsl:when
                                    test="wiley:vol | wiley:pageFirst | wiley:pageLast | wiley:pubYear">
                                    <xsl:apply-templates select="wiley:vol"/>
                                    <xsl:apply-templates select="wiley:pageFirst"/>
                                    <xsl:apply-templates select="wiley:pageLast"/>
                                    <xsl:apply-templates select="wiley:pubYear"/>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="wiley:bookSeriesTitle">
                                <series>
                                    <xsl:apply-templates select="wiley:bookSeriesTitle"/>
                                </series>
                            </xsl:if>
                        </bibl>
                    </xsl:when>
                    <!-- SG - reprise refs book -->
                    <xsl:when test="wiley:bookTitle">
                        <bibl type="book">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@xml:id"/>
                            </xsl:attribute>
                            <xsl:if test="wiley:chapterTitle">
                                <xsl:apply-templates select="wiley:author"/>
                                <xsl:apply-templates select="wiley:editor"/>
                                <xsl:apply-templates select="wiley:chapterTitle"/>

                            </xsl:if>
                            <xsl:apply-templates select="wiley:bookTitle"/>
                            <xsl:if test="not(wiley:chapterTitle)">
                                <xsl:apply-templates select="wiley:author"/>
                                <xsl:apply-templates select="wiley:editor"/>
                            </xsl:if>

                            <xsl:choose>
                                <xsl:when
                                    test="wiley:vol | wiley:pageFirst | wiley:pageLast | wiley:pubYear">

                                    <xsl:apply-templates select="wiley:vol"/>
                                    <xsl:apply-templates select="wiley:pageFirst"/>
                                    <xsl:apply-templates select="wiley:pageLast"/>
                                    <xsl:apply-templates select="wiley:pubYear"/>
                                    <xsl:apply-templates select="wiley:publisherLoc"/>
                                    <xsl:apply-templates select="wiley:publisherName"/>

                                </xsl:when>
                            </xsl:choose>

                        </bibl>
                    </xsl:when>
                    <xsl:when test="wiley:otherTitle">
                        <bibl type="other">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@xml:id"/>
                            </xsl:attribute>
                            <xsl:apply-templates select="wiley:otherTitle"/>
                            <xsl:apply-templates select="wiley:groupName"/>
                            <xsl:apply-templates select="wiley:author"/>
                            <xsl:apply-templates select="wiley:editor"/>


                            <xsl:apply-templates select="wiley:journalTitle"/>
                            <!-- SG reprise lien url dans référence -->
                            <xsl:if test="wiley:url">
                                <idno type="URI">
                                    <xsl:apply-templates select="wiley:url"/>
                                </idno>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when
                                    test="wiley:vol | wiley:pageFirst | wiley:pageLast | wiley:pubYear">

                                    <xsl:apply-templates select="wiley:vol"/>
                                    <xsl:apply-templates select="wiley:pageFirst"/>
                                    <xsl:apply-templates select="wiley:pageLast"/>
                                    <xsl:apply-templates select="wiley:pubYear"/>

                                </xsl:when>
                            </xsl:choose>

                        </bibl>
                    </xsl:when>
                    <xsl:otherwise>
                        <bibl type="other">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@xml:id"/>
                            </xsl:attribute>
                            <xsl:apply-templates/>
                        </bibl>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </bibl>
    </xsl:template>

    <!-- références structurées
         ++++++++++++++++++++++
        IN:  article/back/references/reference-list/.
             article/back/references/reference-list/multipart//.
             article/back/references/reference-list/ref-group//.
             << journal-ref
             << book-ref
             << conf-ref
             << misc-ref
        
        +++++++++++++++++++        
        OUT: biblStruct +/*
        +++++++++++++++++++
        
        TODO prise en compte des 2 attributs
             optionnels author et year-label
             *-ref/@author       ex: "Bousis et al"
             *-ref/@year-label   ex: "1963a"
             
             référencer la template des links autre qu'archive 
             (2 cas avec que des idno multiples : SPIRES et aps)
        
    -->


    <!--journal-ref
        (refbib article de périodique)
    -->
    <xsl:template match="journal-ref">
        <biblStruct type="article">

            <!-- attributs courants -->
            <xsl:if test="@id">
                <xsl:attribute name="xml:id" select="@id"/>
            </xsl:if>
            <xsl:if test="@num">
                <xsl:attribute name="n" select="@num"/>
            </xsl:if>

            <!-- partie analytique (article) -->
            <analytic>
                <xsl:apply-templates select="authors/au"/>
                <!--<xsl:for-each select="authors/au">
                    <author>
                        <persName>
                            <surname>
                                <xsl:value-of select="second-name"/>
                            </surname>
                            <forename type="first">
                                <xsl:value-of select="first-names"/>
                            </forename>
                        </persName>
                    </author>
                </xsl:for-each>-->
                <xsl:for-each select="authors/others">
                    <author>
                        <xsl:value-of select="italic"/>
                    </author>
                </xsl:for-each>
                <!-- utilisation pipe xpath => ne préjuge pas de l'ordre -->
                <xsl:apply-templates
                    select="
                        authors | aut
                        | art-title | art-ref/atl
                        | art-number
                        | preprint-info/art-number
                        | misc-text/extdoi
                        | crossref/cr_doi"/>

                <xsl:apply-templates select="url" mode="citation"/>
            </analytic>

            <!-- partie monographique (périodique) -->
            <monogr>
                <xsl:apply-templates
                    select="
                        jnl-title | jtl
                        | conf-title
                        | editors | ed
                        | crossref/cr_issn"/>
                <!-- dont imprint -->
                <imprint>
                    <xsl:apply-templates
                        select="
                            year
                            | volume | vid | dte | iid
                            | part
                            | issno
                            | art-ref/ppf
                            | art-ref/ppl
                            | pages"
                    />
                </imprint>
            </monogr>
            <!-- notes et url -->
            <xsl:apply-templates
                select="
                    preprint-info/preprint
                    | misc-text[not(extdoi)]
                    | links/arxiv"
            />
        </biblStruct>
    </xsl:template>

    <!--book-ref
        (refbib livre ou chapitre de livre)
    -->
    <xsl:template match="book-ref">
        <biblStruct type="book">
            <!-- attributs courants -->
            <xsl:if test="@id">
                <xsl:attribute name="xml:id" select="@id"/>
            </xsl:if>
            <xsl:if test="@num">
                <xsl:attribute name="n" select="@num"/>
            </xsl:if>

            <xsl:choose>
                <!-- art-title indique que c'est un chapitre -->
                <!--Du coup les auteurs passent dans analytic (est-ce tjs valable?)-->
                <xsl:when test="art-title | chaptl">
                    <analytic>
                        <xsl:apply-templates
                            select="
                                authors
                                | art-title | chaptl | aut"
                        />
                    </analytic>
                    <monogr>
                        <xsl:apply-templates
                            select="
                                book-title | btl
                                | editors | ed | edg
                                | misc-text[matches(normalize-space(.), '^ISBN(-1[03])?\s?:?\s[-0-9xX ]{10,17}$')]"/>
                        <xsl:apply-templates select="url" mode="citation"/>
                        <xsl:if test="isbn">
                            <xsl:apply-templates/>
                        </xsl:if>
                        <imprint>
                            <xsl:choose>
                                <xsl:when
                                    test="
                                        year
                                        | volume
                                        | part
                                        | chap
                                        | pages
                                        | publication/place
                                        | publication/publisher
                                        | pub-ref
                                        | pub-place
                                        | pub-name">
                                    <xsl:apply-templates
                                        select="
                                            year
                                            | volume
                                            | part
                                            | chap
                                            | pages
                                            | publication/place
                                            | publication/publisher
                                            | pub-ref
                                            | pub-place
                                            | pub-name"
                                    />
                                </xsl:when>
                                <xsl:otherwise>
                                    <date/>
                                </xsl:otherwise>
                            </xsl:choose>

                        </imprint>
                    </monogr>
                </xsl:when>

                <!-- Cas général -->
                <xsl:otherwise>
                    <monogr>
                        <xsl:apply-templates
                            select="
                                book-title | btl | aut
                                | authors
                                | editors | ed | edg
                                | misc-text[matches(normalize-space(.), '^ISBN(-1[03])?\s?:?\s[-0-9xX ]{10,17}$')]"/>
                        <xsl:apply-templates select="url" mode="citation"/>
                        <xsl:if test="isbn">
                            <xsl:apply-templates/>
                        </xsl:if>
                        <imprint>
                            <xsl:choose>
                                <xsl:when
                                    test="
                                        year | dte
                                        | volume
                                        | part
                                        | chap
                                        | pages
                                        | publication/place
                                        | publication/publisher
                                        | pub-ref
                                        | pub-place
                                        | pub-name">
                                    <xsl:apply-templates
                                        select="
                                            year | dte
                                            | volume
                                            | part
                                            | chap
                                            | pages
                                            | publication/place
                                            | publication/publisher
                                            | pub-ref
                                            | pub-place
                                            | pub-name"
                                    />
                                </xsl:when>
                                <xsl:otherwise>
                                    <date/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </imprint>
                    </monogr>
                </xsl:otherwise>
            </xsl:choose>

            <!-- tout le reste : série, notes, url -->
            <xsl:apply-templates
                select="
                    series
                    | preprint-info/preprint
                    | misc-text[not(extdoi) and not(matches(normalize-space(.), '^ISBN(-1[03])?\s?:?\s[-0-9xX ]{10,17}$'))]
                    | links/arxiv"
            />
        </biblStruct>
    </xsl:template>

    <!--conf-ref
        (refbib actes et confs)
        NB : meeting créé sur place à partir de conf-title et conf-place
        TODO : extraire la date qu'on trouve parfois dans les conf-place ?
    -->
    <xsl:template match="conf-ref">
        <biblStruct type="conf">
            <!-- attributs courants -->
            <xsl:attribute name="xml:id" select="@id"/>
            <xsl:if test="@num">
                <xsl:attribute name="n" select="@num"/>
            </xsl:if>
            <monogr>
                <xsl:choose>
                    <xsl:when test="art-title">
                        <xsl:apply-templates select="art-title"/>
                    </xsl:when>
                    <xsl:when test="conf-title">
                        <title>
                            <xsl:value-of select="conf-title"/>
                        </title>
                    </xsl:when>
                </xsl:choose>

                <xsl:for-each select="authors/au">
                    <author>
                        <persName>
                            <surname>
                                <xsl:value-of select="second-name"/>
                            </surname>
                            <forename type="first">
                                <xsl:value-of select="first-names"/>
                            </forename>
                        </persName>
                    </author>
                </xsl:for-each>
                <xsl:for-each select="authors/others">
                    <author>
                        <xsl:value-of select="italic"/>
                    </author>
                </xsl:for-each>
                <xsl:apply-templates
                    select="
                        editors
                        | misc-text[matches(normalize-space(.), '^ISBN(-1[03])?\s?:?\s[-0-9xX ]{10,17}$')]"/>
                <!-- conf-title 
                    ex: "Proc. 9th Int. Conf. on Hyperbolic Problems" -->
                <xsl:if test="conf-title | conf-place">
                    <meeting>
                        <name>
                            <xsl:value-of select="conf-title"/>
                        </name>
                        <xsl:if test="conf-place">
                            <!-- conf-place
                                ex: "Toulouse, 14–17 June 1999" -->
                            <placeName>
                                <xsl:value-of select="conf-place"/>
                            </placeName>
                        </xsl:if>
                    </meeting>
                </xsl:if>

                <xsl:if test="isbn">
                    <xsl:apply-templates/>
                </xsl:if>
                <imprint>
                    <xsl:apply-templates
                        select="
                            year
                            | volume
                            | pages
                            | publication/place
                            | publication/publisher"
                    />
                </imprint>
            </monogr>


            <!-- tout le reste : série, notes, url -->
            <xsl:apply-templates
                select="
                    series
                    | preprint-info/preprint
                    | misc-text[not(extdoi) and not(matches(normalize-space(.), '^ISBN(-1[03])?\s?:?\s[-0-9xX ]{10,17}$'))]
                    | links/arxiv"
            />
        </biblStruct>
    </xsl:template>
    <xsl:template match="conference-ref">
        <biblStruct type="conf">
            <!-- attributs courants -->
            <xsl:if test="@id">
                <xsl:attribute name="xml:id" select="@id"/>
            </xsl:if>
            <xsl:if test="@num">
                <xsl:attribute name="n" select="@num"/>
            </xsl:if>

            <analytic>
                <xsl:apply-templates
                    select="
                        conf-tl
                        | art-title | authors | aut"
                />
            </analytic>
            <monogr>
                <!-- conf-title 
                    ex: "Proc. 9th Int. Conf. on Hyperbolic Problems" -->
                <xsl:if test="conf-title | conf-place | conftl">
                    <meeting>
                        <xsl:value-of select="conf-title | conftl"/>
                        <xsl:if test="conf-place | confloc">
                            <!-- conf-place
                                ex: "Toulouse, 14–17 June 1999" -->
                            <placeName>
                                <xsl:value-of select="conf-place | confloc"/>
                            </placeName>
                        </xsl:if>
                        <xsl:if test="conf-date | confdate">
                            <!-- conf-place
                                ex: "Toulouse, 14–17 June 1999" -->
                            <date>
                                <xsl:value-of select="conf-date | confdate"/>
                            </date>
                        </xsl:if>
                    </meeting>
                </xsl:if>

                <xsl:apply-templates
                    select="
                        editors | edg | editor
                        | misc-text[matches(normalize-space(.), '^ISBN(-1[03])?\s?:?\s[-0-9xX ]{10,17}$')]"/>
                <xsl:apply-templates select="url" mode="sage"/>
                <imprint>
                    <xsl:apply-templates
                        select="
                            year | conf-date
                            | volume
                            | pages
                            | publication/place
                            | publication/publisher"
                    />
                </imprint>
            </monogr>


            <!-- tout le reste : série, notes, url -->
            <xsl:apply-templates
                select="
                    series
                    | preprint-info/preprint
                    | misc-text[not(extdoi) and not(matches(normalize-space(.), '^ISBN(-1[03])?\s?:?\s[-0-9xX ]{10,17}$'))]
                    | links/arxiv"
            />
        </biblStruct>
    </xsl:template>
    <!--misc-ref 
        (refbib de type thèse, brevet, logiciel, lien, ...)
    -->
    <xsl:template match="misc-ref">
        <biblStruct>

            <!-- attribut type (pas aussi univoque que pour les autres ref) -->
            <xsl:attribute name="type">
                <xsl:choose>
                    <!-- ne pas hésiter à ajouter d'autres tests -->
                    <xsl:when test="thesis">thesis</xsl:when>
                    <xsl:when test="patent-number">patent</xsl:when>
                    <!-- heuristiques -->
                    <xsl:when test="misc-title and contains('Report', misc-title)">report</xsl:when>
                    <xsl:when test="misc-text and starts-with('PAT', misc-text)">patent</xsl:when>
                    <xsl:otherwise>misc</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>

            <!-- attributs courants -->
            <xsl:attribute name="xml:id" select="@id"/>
            <xsl:if test="@num">
                <xsl:attribute name="n" select="@num"/>
            </xsl:if>


            <xsl:choose>
                <!-- comme pour book-ref -->
                <xsl:when test="art-title | authors/au">
                    <analytic>
                        <xsl:apply-templates select="art-title"/>
                        <xsl:apply-templates select="authors"/>
                    </analytic>
                    <monogr>
                        <xsl:apply-templates
                            select="
                                editors | ed
                                | misc-title
                                | patent-number
                                | misc-text[matches(normalize-space(.), '^ISBN(-1[03])?\s?:?\s[-0-9xX ]{10,17}$')]"/>
                        <imprint>
                            <xsl:apply-templates
                                select="
                                    year
                                    | volume
                                    | pages
                                    | publication/place
                                    | publication/publisher
                                    | source"
                            />
                        </imprint>
                    </monogr>
                </xsl:when>
                <!-- cas général -->
                <xsl:otherwise>
                    <monogr>
                        <xsl:apply-templates
                            select="
                                authors
                                | editors
                                | misc-title
                                | misc-textr
                                | misc-text[matches(normalize-space(.), '^ISBN(-1[03])?\s?:?\s[-0-9xX ]{10,17}$')]"/>
                        <imprint>
                            <xsl:apply-templates
                                select="
                                    year
                                    | pages
                                    | publication/place
                                    | publication/publisher
                                    | source"
                            />
                        </imprint>
                    </monogr>
                </xsl:otherwise>
            </xsl:choose>

            <!-- tout le reste : série, notes, url -->
            <xsl:apply-templates
                select="
                    thesis
                    | preprint-info/preprint
                    | misc-text[not(extdoi) and not(matches(normalize-space(.), '^ISBN(-1[03])?\s?:?\s[-0-9xX ]{10,17}$'))]
                    | links/arxiv"
            />
        </biblStruct>
    </xsl:template>

    <!-- références -->
    <xsl:template match="element-citation | mixed-citation">
        <xsl:variable name="count">
            <xsl:value-of select="number(':')"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="contains(../@id, 'jn')">
                <bibl>
                    <xsl:attribute name="type">
                        <xsl:text>footnote</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </bibl>
            </xsl:when>
            <xsl:when test="starts-with(., 'http')">
                <bibl>
                    <xsl:attribute name="type">
                        <xsl:text>web</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </bibl>
            </xsl:when>
            <xsl:when test="not(source)">
                <xsl:if test="contains(., 'guidelines') or contains(., 'www') or contains(., 'CD-ROM')">
                <bibl>
                    <xsl:attribute name="type">
                        <xsl:text>in-line</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </bibl>
                </xsl:if>
            </xsl:when>
            <xsl:when test="contains(., ':') and $count and //publisher-name='S. Karger AG'">
                <biblStruct>
                    <xsl:choose>
                        <xsl:when test="@id">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@id"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="../@id">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="../@id"/>
                                </xsl:attribute>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="contains(., ':')">
                            <analytic>
                                <title level="a" type="main">
                                    <xsl:call-template name="articleInLine"/>
                                </title>
                                <xsl:call-template name="authorInLine"/>
                                <xsl:apply-templates select="pub-id"/>
                            </analytic>
                            <monogr>
                                <xsl:call-template name="titleInLine"/>
                                <imprint>
                                    <xsl:call-template name="yearInLine"/>
                                    <xsl:call-template name="volInLine"/>
                                    <xsl:call-template name="pageInLine"/>
                                </imprint>
                            </monogr>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates/>
                        </xsl:otherwise>
                    </xsl:choose>
                </biblStruct>
            </xsl:when>
            <xsl:when test="source|person-group|year">
                <biblStruct>
                    <xsl:if test="@citation-type | @publication-type">
                        <xsl:attribute name="type">
                            <xsl:apply-templates select="@citation-type | @publication-type"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="@id">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@id"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="../@id">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="../@id"/>
                                </xsl:attribute>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="article-title | chapter-title">
                        <analytic>
                            <xsl:apply-templates select="article-title | chapter-title"/>
                            <xsl:apply-templates select="name"/>
                            <xsl:apply-templates select="string-name"/>
                            <xsl:apply-templates select="person-group[@person-group-type='author']"/>
                            <xsl:apply-templates select="elocation-id"/>
                        </analytic>
                    </xsl:if>
                    <monogr>
                        <xsl:apply-templates select="source"/>
                        <!-- cas particulier chez ACS le titre de la 
                        ressource est contenue parfois dans italic@toggle
                        dans les mixed-citation-->
                        <xsl:apply-templates select="italic" mode="toggle"/>
                        <xsl:if test="not(article-title | chapter-title)">
                            <xsl:apply-templates select="name"/>
                            <xsl:apply-templates select="string-name"/>
                            <xsl:apply-templates select="person-group"/>
                            <xsl:apply-templates select="elocation-id"/>
                        </xsl:if>
                        <xsl:if test="person-group[@person-group-type='editor']">
                            <xsl:apply-templates select="person-group[@person-group-type='editor']"/>
                        </xsl:if>
                        <imprint>
                            <xsl:choose>
                                <xsl:when test="publisher-name | publisher-loc | year| date/year">
                                    <xsl:apply-templates select="publisher-name"/>
                                    <xsl:apply-templates select="publisher-loc"/>
                                    <xsl:apply-templates select="date/year"/>
                                    <xsl:apply-templates select="year"/>
                                    <xsl:apply-templates select="volume"/>
                                    <xsl:apply-templates select="fpage"/>
                                    <xsl:apply-templates select="lpage"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!-- imprint ne doit pas rester vide de contenu -->
                                    <publisher/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </imprint>
                    </monogr>
                </biblStruct>
            </xsl:when>
            <xsl:when test="not(contains(., ':'))">
                <bibl>
                    <xsl:attribute name="type">
                        <xsl:text>in-line</xsl:text>
                    </xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="@id">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@id"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="../@id">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="../@id"/>
                                </xsl:attribute>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:apply-templates/>
                </bibl>
            </xsl:when>
            <xsl:when test="not(//publisher-name='S. Karger AG')">
                <bibl>
                    <xsl:attribute name="type">
                        <xsl:text>in-line</xsl:text>
                    </xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="@id">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@id"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="../@id">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="../@id"/>
                                </xsl:attribute>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:apply-templates/>
                </bibl>
            </xsl:when>
            <xsl:otherwise>
                <biblStruct>
                    <xsl:if test="@citation-type | @publication-type">
                        <xsl:attribute name="type">
                            <xsl:apply-templates select="@citation-type | @publication-type"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="@id">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@id"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="../@id">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="../@id"/>
                                </xsl:attribute>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="article-title | chapter-title">
                        <analytic>
                            <xsl:apply-templates select="article-title | chapter-title"/>
                            <xsl:apply-templates select="name"/>
                            <xsl:apply-templates select="string-name"/>
                            <xsl:apply-templates select="person-group"/>
                            <xsl:apply-templates select="elocation-id"/>
                        </analytic>
                    </xsl:if>
                    <monogr>
                        <xsl:apply-templates select="source"/>
                        <!-- cas particulier chez ACS le titre de la 
                        ressource est contenue parfois dans italic@toggle
                        dans les mixed-citation-->
                        <xsl:apply-templates select="italic" mode="toggle"/>
                        <xsl:if test="not(article-title | chapter-title)">
                            <xsl:apply-templates select="name"/>
                            <xsl:apply-templates select="string-name"/>
                            <xsl:apply-templates select="person-group"/>
                            <xsl:apply-templates select="elocation-id"/>
                        </xsl:if>
                        <imprint>
                            <xsl:choose>
                                <xsl:when test="publisher-name | publisher-loc | year">
                                    <xsl:apply-templates select="publisher-name"/>
                                    <xsl:apply-templates select="publisher-loc"/>
                                    <xsl:apply-templates select="year"/>
                                    <xsl:apply-templates select="volume"/>
                                    <xsl:apply-templates select="fpage"/>
                                    <xsl:apply-templates select="lpage"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!-- imprint ne doit pas rester vide de contenu -->
                                    <publisher/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </imprint>
                    </monogr>
                </biblStruct>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="mixed-citation" mode="multiple">
        <xsl:choose>
            <xsl:when test="contains(../@id, 'jn')">
                <bibl>
                    <xsl:attribute name="type">
                        <xsl:text>footnote</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </bibl>
            </xsl:when>
            <xsl:when test="not(article-title | source)">
                <bibl>
                    <xsl:attribute name="type">
                        <xsl:text>in-line</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </bibl>
            </xsl:when>
            <!-- références contenant plusieurs citations non
                déterminées-->
            <xsl:when test="contains(., ';') or contains(., ':')">
                <bibl>
                    <xsl:attribute name="type">
                        <xsl:text>in-line</xsl:text>
                    </xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="@id">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@id"/>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:apply-templates/>
                </bibl>
            </xsl:when>
            <xsl:otherwise>
                <biblStruct>
                    <xsl:if test="@citation-type | @publication-type">
                        <xsl:attribute name="type">
                            <xsl:apply-templates select="@citation-type | @publication-type"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="@id">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@id"/>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:if test="article-title | chapter-title">
                        <analytic>
                            <xsl:apply-templates select="article-title | chapter-title"/>
                            <xsl:apply-templates select="name"/>
                            <xsl:apply-templates select="string-name"/>
                            <xsl:apply-templates select="person-group"/>
                            <xsl:apply-templates select="elocation-id"/>
                        </analytic>
                    </xsl:if>
                    <monogr>
                        <xsl:apply-templates select="source"/>
                        <!-- cas particulier chez ACS le titre de la 
                        ressource est contenue parfois dans italic@toggle
                        dans les mixed-citation-->
                        <xsl:apply-templates select="italic" mode="toggle"/>
                        <xsl:if test="not(article-title | chapter-title)">
                            <xsl:apply-templates select="name"/>
                            <xsl:apply-templates select="string-name"/>
                            <xsl:apply-templates select="person-group"/>
                            <xsl:apply-templates select="elocation-id"/>
                        </xsl:if>
                        <imprint>
                            <xsl:choose>
                                <xsl:when test="publisher-name | publisher-loc | year">
                                    <xsl:apply-templates select="publisher-name"/>
                                    <xsl:apply-templates select="publisher-loc"/>
                                    <xsl:apply-templates select="year"/>
                                    <xsl:apply-templates select="volume"/>
                                    <xsl:apply-templates select="fpage"/>
                                    <xsl:apply-templates select="lpage"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <!-- imprint ne doit pas rester vide de contenu -->
                                    <publisher/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </imprint>
                    </monogr>
                </biblStruct>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
    <xsl:template match="italic" mode="toggle">
        <title level="j">
            <xsl:apply-templates/>
        </title>
    </xsl:template>

    <!-- découpage des auteurs -->
    <xsl:template name="authorInLine" match="mixed-citation" mode="inLine">
        <xsl:param name="text" select="normalize-space(substring-before(., ':'))"/>
        <xsl:param name="separator" select="','"/>
        <xsl:variable name="authorInLine">
            <xsl:value-of select="normalize-space($text)"/>
        </xsl:variable>
        <xsl:if test="$authorInLine[string-length() &gt; 0]">
            <xsl:choose>
                <xsl:when test="not(contains($text, $separator))">
                    <xsl:variable name="avant">
                        <xsl:value-of select="substring-before($authorInLine, ' ')"/>
                    </xsl:variable>
                    <xsl:variable name="apres">
                        <xsl:value-of select="substring-after($authorInLine, ' ')"/>
                    </xsl:variable>
                    <xsl:if test="not(contains($authorInLine, 'Anon'))">
                        <author>
                            <xsl:choose>
                                <xsl:when test="not(contains($authorInLine, ' '))">
                                    <orgName type="institution">
                                        <xsl:value-of select="$authorInLine"/>
                                    </orgName>
                                </xsl:when>
                                <xsl:when test="contains($authorInLine, 'et al')">
                                        <xsl:value-of select="$authorInLine"/>
                                </xsl:when>
                                <xsl:when test="contains($authorInLine, 'International Clearinghouse for Birth Defects Surveillance and Research')">
                                    <orgName type="institution">International Clearinghouse for Birth Defects Surveillance and Research</orgName>
                                </xsl:when>
                                <xsl:otherwise>
                                    <persName>
                                        <surname>
                                            <xsl:value-of select="$avant"/>
                                        </surname>
                                        <forename type="first">
                                            <xsl:choose>
                                                <xsl:when test="contains($apres, ';')">
                                                  <xsl:value-of select="substring-before(substring-before($apres, ';'),'.')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                  <xsl:value-of select="$apres"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </forename>
                                    </persName>
                                </xsl:otherwise>
                            </xsl:choose>
                        </author>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <author>
                        <xsl:variable name="orgName">
                            <xsl:value-of
                                select="normalize-space(substring-before($text, $separator))"/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="not(contains($orgName, ' '))">
                                <orgName type="institution">
                                    <xsl:value-of select="$orgName"/>
                                </orgName>
                            </xsl:when>
                            <xsl:otherwise>
                                <persName>
                                    <xsl:variable name="surname">
                                        <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                                    </xsl:variable>
                                    <surname>
                                        <xsl:value-of select="normalize-space(substring-before($surname, ' '))"/>
                                    </surname>
                                    <forename type="first">
                                        <xsl:choose>
                                            <xsl:when test="contains($surname,';')">
                                                <xsl:value-of select="normalize-space(substring-before(substring-after($surname, ' '),';'))"/> 
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="normalize-space(substring-after($surname, ' '))"/> 
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </forename>
                                </persName>
                            </xsl:otherwise>
                        </xsl:choose>
                    </author>
                    <xsl:call-template name="authorInLine">
                        <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>

        </xsl:if>
    </xsl:template>

    <!-- titre de la revue -->
    <xsl:template name="titleInLine" match="mixed-citation" mode="inLine">
        <xsl:param name="text"
            select="normalize-space(substring-before(substring-after(., '.'), ':'))"/>
        <xsl:param name="separator" select="'.'"/>
        <xsl:variable name="titleInLine">
            <xsl:value-of select="normalize-space($text)"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <xsl:choose>
                    <xsl:when test="contains($titleInLine, ' 18')">
                        <title level="j">
                            <xsl:value-of
                                select="normalize-space(substring-before($titleInLine, '18'))"/>
                        </title>
                    </xsl:when>
                    <xsl:when test="contains($titleInLine, ' 19')">
                        <title level="j">
                            <xsl:value-of
                                select="normalize-space(substring-before($titleInLine, '19'))"/>
                        </title>
                    </xsl:when>
                    <xsl:when test="contains($titleInLine, ' 20')">
                        <title level="j">
                            <xsl:value-of
                                select="normalize-space(substring-before($titleInLine, '20'))"/>
                        </title>
                    </xsl:when>
                    <xsl:otherwise>
                        <title level="m">
                            <xsl:call-template name="articleInLine"/>
                        </title>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="contains(.,'Six-minute walk test in children and adolescents')">
                    <title level="j">J Pediatr</title> 
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- année de parution de la revue -->
    <xsl:template name="yearInLine" match="mixed-citation" mode="inLine">
        <xsl:param name="text"
            select="normalize-space(substring-before(substring-after(., '.'), ';'))"/>
        <xsl:param name="text2" select="."/>
        <xsl:variable name="yearInLine">
            <xsl:value-of select="normalize-space($text)"/>
        </xsl:variable>
        <xsl:variable name="yearInLine2">
            <xsl:value-of select="normalize-space($text2)"/>
        </xsl:variable>
        <!-- pour enlever les balises polluants le texte contenant des identifiants -->
        <xsl:variable name="yearInLine3">
            <xsl:value-of select="./text() except (bold/italic | pub-id)"/>
        </xsl:variable>
       <!-- <year>
         <xsl:value-of select="normalize-space($text2)"/>
        </year>-->
        <xsl:choose>
            <xsl:when test="pub-id">
                <xsl:choose>
                    
                    <xsl:when
                        test="(contains($yearInLine3, '19') or contains($yearInLine3, '20')) and contains($yearInLine3, ';') or contains($text2, '.')">
                        <date type="published">
                            <xsl:choose>
                                <xsl:when test="contains(.,'The economic burden of lung disease')">2013</xsl:when><xsl:when test="contains(.,'209 (arbaclofen) on neurobehavioral')">2012</xsl:when>
                                <xsl:when test="contains($yearInLine3, '19')">
                                    <xsl:text>19</xsl:text>
                                    <xsl:choose>
                                        <xsl:when
                                            test="contains(substring-after($yearInLine3, '19'), ';')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($yearInLine3, '19'), ';')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($yearInLine3, ', 19'), ';')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($yearInLine3, ', 19'), ';')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($yearInLine3, ', 19'), ',')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($yearInLine3, '19'), ',')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($yearInLine3, ', 19'), '.')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($yearInLine3, ', 19'), '.')"
                                            />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of
                                                select="substring-before(substring-after($yearInLine3, '19'), ',')"
                                            />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:when test="contains($yearInLine3, '20')">
                                    <xsl:choose>
                                        <xsl:when
                                            test="contains(substring-after($yearInLine3, ', 20'), ', vol')">
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="substring-before(substring-after($yearInLine3, ', 20'), ', vol')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-before(substring-after($yearInLine3, ', 20'), ':'), '2013')"
                                            >2013</xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($yearInLine3, ', 20'), ':') and not(contains($yearInLine3, 'http'))">
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="substring-before(substring-after($yearInLine3, ', 20'), ':')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($yearInLine3, ', 20'), 'http')">
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="normalize-space(translate(substring-before(substring-after($yearInLine3, ', 20'), 'http'), '.', ''))"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($yearInLine3, ', 20'), '.')">
                                            <xsl:text>20</xsl:text>
                                            <xsl:variable name="nettoie">
                                                <xsl:value-of select="translate(substring-before(substring-after($yearInLine3, ', 20'), '.'), ')', '')" />
                                            </xsl:variable>
                                            <xsl:choose>
                                                <xsl:when test="contains($nettoie,',')">
                                                    <xsl:value-of select="substring-before($nettoie,',')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$nettoie" />
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($yearInLine3, ', 20'), ',')">
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="substring-before(substring-after($yearInLine3, '20'), ',')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($yearInLine3, '20'), ';')">
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="substring-before(substring-after($yearInLine3, '20'), ';')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($yearInLine3, ', 20'), ';')">
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="substring-before(substring-after($yearInLine3, ', 20'), ';')"
                                            />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="substring-before(substring-after($yearInLine3, '20'), ',')"
                                            />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                            </xsl:choose>
                        </date>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <!-- pas de date de publication lors de la présence de 'accepted' dans la ligne de référence -->
            <xsl:when test="contains($yearInLine,'accepted')">
                <date/>
            </xsl:when>
            <xsl:when test="contains($yearInLine, ' 20')">
                <date type="published">
                    <xsl:text>20</xsl:text>
                    <xsl:value-of select="normalize-space(substring-after($yearInLine, '20'))"/>
                </date>
            </xsl:when>
            <xsl:when test="contains($yearInLine, ' 18')">
                <date type="published">
                    <xsl:text>18</xsl:text>
                    <xsl:value-of select="normalize-space(substring-after($yearInLine, '18'))"/>
                </date>
            </xsl:when>
            <xsl:when test="contains($yearInLine, ' 19')">
                <date type="published">
                    <xsl:text>19</xsl:text>
                    <xsl:value-of select="normalize-space(substring-after($yearInLine, '19'))"/>
                </date>
            </xsl:when>
            <xsl:when test="contains($text2, ' ')">
                <xsl:choose>
                    <xsl:when test="contains($text2, ', pp') and not(contains($text2, 'vol'))">
                        <date type="published">
                            <xsl:choose>
                                <xsl:when
                                    test="contains(substring-before(substring-after($text2, ','), ', pp'), ', 20')">
                                    <xsl:text>20</xsl:text>
                                    <xsl:value-of
                                        select="substring-after(substring-before(substring-after($text2, ','), ', pp'), ', 20')"
                                    />
                                </xsl:when>
                                <xsl:when test="contains($text2, ' 20')">
                                    <xsl:text>20</xsl:text>
                                    <xsl:value-of
                                        select="substring-after(substring-before($text2, ', pp'), '20')"
                                    />
                                </xsl:when>
                                <xsl:when
                                    test="contains(substring-before(substring-after($text2, ','), ', pp'), ', 19')">
                                    <xsl:text>19</xsl:text>
                                    <xsl:value-of
                                        select="substring-after(substring-before(substring-after($text2, ','), ', pp'), ', 19')"
                                    />
                                </xsl:when>
                                <xsl:when test="contains($text2, ' 19')">
                                    <xsl:text>19</xsl:text>
                                    <xsl:value-of
                                        select="substring-after(substring-before($text2, ', pp'), '19')"
                                    />
                                </xsl:when>
                                <xsl:when
                                    test="contains(substring-before(substring-after($text2, ','), ', pp'), ', 18')">
                                    <xsl:text>18</xsl:text>
                                    <xsl:value-of
                                        select="substring-after(substring-before(substring-after($text2, ','), ', pp'), ', 18')"
                                    />
                                </xsl:when>
                                <xsl:when test="contains($text2, ' 18')">
                                    <xsl:text>18</xsl:text>
                                    <xsl:value-of
                                        select="substring-after(substring-before($text2, ', pp'), '18')"
                                    />
                                </xsl:when>
                                <xsl:when
                                    test="contains(substring-before(substring-after($text2, ','), ', pp'), ', ')">
                                    <xsl:value-of
                                        select="substring-after(substring-before(substring-after($text2, ','), ', pp'), ', ')"
                                    />
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of
                                        select="normalize-space(substring-before(substring-after($text2, ','), ', pp'))"
                                    />
                                </xsl:otherwise>
                            </xsl:choose>
                        </date>
                    </xsl:when>
                    <xsl:when
                        test="(contains($text2, '18') or contains($text2, '19') or contains($text2, '20')) and contains($text2, ';') or contains($text2, '.')">
                        <date type="published">
                            <xsl:choose>
                                <xsl:when test="contains($text2, 'http')">
                                    <xsl:variable name="text3">
                                        <xsl:value-of select="substring-before($text2, ' http')"/>
                                    </xsl:variable>
                                   <xsl:choose>
                                       <xsl:when test="contains($text3, '17')">
                                           <xsl:text>17</xsl:text>
                                           <xsl:value-of select="translate(substring-after($text3, '17'),'.,;','')" />
                                       </xsl:when>
                                       <xsl:when test="contains($text3, '18')">
                                           <xsl:text>18</xsl:text>
                                           <xsl:value-of select="translate(substring-after($text3, '18'),'.,;','')" />
                                       </xsl:when>
                                       <xsl:when test="contains($text3, '19')">
                                           <xsl:text>19</xsl:text>
                                           <xsl:value-of select="translate(substring-after($text3, '19'),'.,;','')" />
                                       </xsl:when>
                                       <xsl:when test="contains($text3, '20')">
                                           <xsl:text>20</xsl:text>
                                           <xsl:value-of select="translate(substring-after($text3, '20'),'.,;','')" />
                                       </xsl:when>
                                   </xsl:choose>
                                </xsl:when>
                                <xsl:when test="contains($text2, '20')">
                                    <xsl:choose>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 20'), ', vol')">
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, ', 20'), ', vol')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-before(substring-after($text2, ', 20'), ':'), '2013')"
                                            >2013</xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 20'), ':') and not(contains($text2, 'http'))">
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, ', 20'), ':')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 20'), 'http')">
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="normalize-space(translate(substring-before(substring-after($text2, ', 20'), 'http'), '.', ''))"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 20'), '.')">
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="translate(substring-before(substring-after($text2, ', 20'), '.'), ')', '')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 20'), ',')">
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, '20'), ',')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, '20'), ';')">
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, '20'), ';')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 20'), ';')">
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, ', 20'), ';')"
                                            />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>20</xsl:text>
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, '20'), ',')"
                                            />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:when test="contains($text2, '19')">
                                    <xsl:text>19</xsl:text>
                                    <xsl:choose>
                                        <xsl:when
                                            test="contains(substring-after($text2, '19'), ';')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, '19'), ';')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 19'), ';')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, ', 19'), ';')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 19'), ',')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, '19'), ',')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 19'), '.')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, ', 19'), '.')"
                                            />
                                        </xsl:when>
                                        <xsl:when test="contains($text2, 'Mount Kisco, Futura')">93</xsl:when>
                                        <xsl:when test="contains($text2, '19')">
                                            <xsl:value-of select="translate(substring-after($text2, '19'),'.','')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="substring-before(substring-after($text2, '19'), ',')" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:when test="contains($text2, '18')">
                                    <xsl:text>18</xsl:text>
                                    <xsl:choose>
                                        <xsl:when
                                            test="contains(substring-after($text2, '18'), ';')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, '18'), ';')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 18'), ';')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, ', 18'), ';')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 18'), ',')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, '18'), ',')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 18'), '.')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, ', 18'), '.')"
                                            />
                                        </xsl:when>
                                        <xsl:when test="contains($text2, '18')">
                                            <xsl:value-of select="translate(substring-after($text2, '18'),'.','')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="substring-before(substring-after($text2, '18'), ',')" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                                <xsl:when test="contains($text2, '17')">
                                    <xsl:text>17</xsl:text>
                                    <xsl:choose>
                                        <xsl:when
                                            test="contains(substring-after($text2, '17'), ';')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, '17'), ';')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 17'), ';')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, ', 17'), ';')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 17'), ',')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, '17'), ',')"
                                            />
                                        </xsl:when>
                                        <xsl:when
                                            test="contains(substring-after($text2, ', 17'), '.')">
                                            <xsl:value-of
                                                select="substring-before(substring-after($text2, ', 17'), '.')"
                                            />
                                        </xsl:when>
                                        <xsl:when test="contains($text2, '17')">
                                            <xsl:value-of select="translate(substring-after($text2, '17'),'.','')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="substring-before(substring-after($text2, '17'), ',')" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                            </xsl:choose>
                            <!--<xsl:value-of select="substring-before(substring-after($text2,'19'),',')"/>-->
                            <!-- <xsl:value-of select="normalize-space(substring-before(substring-after($text2,','),', 19'))"/>-->
                        </date>
                    </xsl:when>
                    <xsl:otherwise>
                        <date type="published">
                            <xsl:value-of
                                select="normalize-space(translate(substring-after($text2, ','), '.', ''))"
                            />
                        </date>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- volume de la revue -->
    <xsl:template name="volInLine" match="mixed-citation" mode="inLine">
        <xsl:param name="text"
            select="normalize-space(substring-before(substring-after(., ';'), ':'))"/>
        <xsl:param name="text2" select="substring-after(substring-after(., ';'), ';')"/>
        <xsl:param name="separator" select="';'"/>
        <xsl:variable name="volInLine">
            <xsl:value-of select="normalize-space($text)"/>
        </xsl:variable>
        <!--<volume>
            <xsl:value-of select="$text2"/>
        </volume>-->
        <xsl:choose>
            <xsl:when test="contains($text2, ':')">
                <biblScope unit="vol">
                    <xsl:value-of select="normalize-space(substring-before($text2, ':'))"/>
                </biblScope>
            </xsl:when>
            <xsl:when test="contains($volInLine, 'vol')">
                <biblScope unit="vol">
                    <xsl:value-of select="$volInLine"/>
                </biblScope>
            </xsl:when>
            <xsl:when test="contains($volInLine, 'pii')"/>
            <xsl:when test="contains($volInLine, ' ')"/>
            <xsl:otherwise>
                <xsl:if test="$volInLine[string-length() &gt; 0]">
                    <biblScope unit="vol">
                        <xsl:value-of select="$volInLine"/>
                    </biblScope>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- pagination de la revue -->
    <xsl:template name="pageInLine" match="mixed-citation" mode="inLine">
        <xsl:param name="text"
            select="translate(substring-after(substring-after(., ';'), ':'), '.', '')"/>
        <xsl:param name="text2" select="."/>
        <xsl:param name="separator" select="';'"/>
        <xsl:variable name="pageInLine">
            <xsl:value-of select="normalize-space($text)"/>
        </xsl:variable>
        <xsl:variable name="pageInLine2">
            <xsl:value-of select="normalize-space($text2)"/>
        </xsl:variable>
        <xsl:variable name="nettoiePage1">
            <xsl:value-of select="substring-after(substring-after($pageInLine2, ';'), ':')"/>
        </xsl:variable>
        <xsl:variable name="nettoiePage3">
            <xsl:value-of select="substring-after(substring-after($nettoiePage1, ';'), ':')"/>
        </xsl:variable>
        <!-- pour enlever les balises polluants le texte contenant des identifiants -->
        <xsl:variable name="text3">
            <xsl:value-of select="./text() except (bold/italic | pub-id)"/>
        </xsl:variable>
        <xsl:variable name="nettoiePubId">
            <xsl:value-of select="substring-after(substring-after($text3, ';'), ':')"/>
        </xsl:variable>
        <xsl:variable name="nettoiePubId2">
            <xsl:value-of select="substring-before(substring-after($text3, ';'), '. DOI:')"/>
        </xsl:variable>
        <!--<page>
            <xsl:value-of select="$nettoiePubId2"/>
        </page>-->
        <xsl:choose>
            <xsl:when test="pub-id">
                <xsl:choose>
                    <xsl:when test="contains(., 'The economic burden of lung disease')"/>
                    <xsl:when test="contains($nettoiePage1, 'www')">
                        <xsl:variable name="nettoiePage2">
                            <xsl:value-of select="substring-before($nettoiePage1, 'www')"/>
                        </xsl:variable>
                        <biblScope unit="page" from="{substring-before($nettoiePage2, '-')}">
                            <xsl:value-of select="substring-before($nettoiePage2, '-')" />
                        </biblScope>
                        <biblScope unit="page" to="{normalize-space(translate(substring-after($nettoiePage2, '-'),'.',''))}">
                            <xsl:value-of select="normalize-space(translate(substring-after($nettoiePage2, '-'),'.',''))" />
                        </biblScope>
                    </xsl:when>
                    <xsl:when test="contains($nettoiePubId, 'discussion')">
                        <xsl:variable name="disc">
                            <xsl:value-of select="substring-before($nettoiePubId,'; discussion')"/>
                        </xsl:variable>
                        <biblScope unit="page"
                            from="{substring-before($disc,'-')}">
                            <xsl:value-of
                                select="substring-before($disc, '-')"/>
                        </biblScope>
                        <biblScope unit="page"
                            to="{substring-after($disc,'-')}">
                            <xsl:value-of
                                select="substring-after($disc, '-')"/>
                        </biblScope>
                    </xsl:when>
                    <xsl:when test="contains($nettoiePubId, 'quiz')">
                        <xsl:variable name="disc">
                            <xsl:value-of select="substring-before($nettoiePubId,'; quiz')"/>
                        </xsl:variable>
                        <biblScope unit="page"
                            from="{substring-before($disc,'-')}">
                            <xsl:value-of
                                select="substring-before($disc, '-')"/>
                        </biblScope>
                        <biblScope unit="page"
                            to="{substring-after($disc,'-')}">
                            <xsl:value-of
                                select="substring-after($disc, '-')"/>
                        </biblScope>
                    </xsl:when>
                    <xsl:when test="contains($nettoiePubId, '-')">
                        <xsl:choose>
                            <xsl:when test="contains($nettoiePage1,':')">
                               <!-- <year>
                                    <xsl:value-of select="$nettoiePage1"/>
                                </year>-->
                                <xsl:choose>
                                    <xsl:when test="contains($nettoiePage1,';') and contains($nettoiePage1,'-')">
                                        <xsl:variable name="resultat">
                                            <xsl:value-of select="substring-before(substring-after($nettoiePage1,':'),'-')"/>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="contains($resultat,':')">
                                                <biblScope unit="page" from="{substring-after($resultat,':')}">
                                                    <xsl:value-of select="substring-after($resultat,':')"/>
                                                </biblScope>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <biblScope unit="page" from="{$resultat}">
                                                    <xsl:value-of select="$resultat"/>
                                                </biblScope>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <biblScope unit="page" to="{substring-before(substring-after(substring-after($nettoiePage1,':'),'-'),'.')}">
                                            <xsl:value-of select="substring-before(substring-after(substring-after($nettoiePage1,':'),'-'),'.')"/>
                                        </biblScope>
                                    </xsl:when>
                                    <xsl:when test="contains($nettoiePage1,'.') and contains($nettoiePage1,'-')">
                                        <biblScope unit="page" from="{substring-before(substring-before($nettoiePage1,'.'),'-')}">
                                            <xsl:value-of select="substring-before(substring-before($nettoiePage1,'.'),'-')"/>
                                        </biblScope>
                                        <biblScope unit="page" to="{substring-after(substring-before($nettoiePage1,'.'),'-')}">
                                            <xsl:value-of select="substring-after(substring-before($nettoiePage1,'.'),'-')"/>
                                        </biblScope>
                                    </xsl:when>
                                    <xsl:when test="contains($nettoiePage1,'.')">
                                        <biblScope unit="page">
                                            <xsl:value-of select="substring-before($nettoiePage1,'.')"/>
                                        </biblScope>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <biblScope unit="page">
                                            <xsl:value-of select="substring-before(substring-after($nettoiePage1,':'),'.')"/>
                                        </biblScope>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="contains($nettoiePage1,'pp ')">
                                <xsl:variable name="nettoiePP">
                                    <xsl:value-of select="substring-after($nettoiePage1, 'pp ')"/>
                                </xsl:variable>
                                <biblScope unit="page"
                                    from="{substring-before($nettoiePP,'-')}">
                                    <xsl:value-of
                                        select="substring-before($nettoiePP,'-')"/>
                                </biblScope>
                                <biblScope unit="page"
                                    to="{substring-before(substring-after($nettoiePP,'-'),'.')}">
                                    <xsl:value-of select="substring-before(substring-after($nettoiePP,'-'),'.')" />
                                </biblScope>
                            </xsl:when>
                            <xsl:when test="contains($nettoiePage1,',')">
                                <biblScope unit="page"
                                    from="{substring-before($nettoiePage1,'-')}">
                                    <xsl:value-of
                                        select="substring-before($nettoiePage1, '-')"/>
                                </biblScope>
                                <biblScope unit="page"
                                    to="{translate(substring-before(substring-after($nettoiePubId,'-'),','),'.','')}">
                                    <xsl:value-of select="translate(substring-before(substring-after($nettoiePubId,'-'),','),'.','')" />
                                </biblScope>
                            </xsl:when>
                            <xsl:otherwise>
                                <biblScope unit="page"
                                    from="{substring-before($nettoiePage1,'-')}">
                                    <xsl:value-of
                                        select="substring-before($nettoiePage1, '-')"/>
                                </biblScope>
                                <xsl:variable name="resultat">
                                    <xsl:value-of select="substring-after($nettoiePubId,'-'),'.'" />
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="contains($resultat,' ')">
                                        <biblScope unit="page" to="{translate(substring-before($resultat,' '),'.','')}">
                                            <xsl:value-of select="translate(substring-before($resultat,' '),'.','')" />
                                        </biblScope>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <biblScope unit="page" to="{translate($resultat,'.','')}">
                                            <xsl:value-of select="translate($resultat,'.','')" />
                                        </biblScope>
                                    </xsl:otherwise>
                                </xsl:choose>
                                
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="contains($nettoiePubId, ' p ')">
                        <biblScope unit="page">
                            <xsl:value-of select="translate(substring-after($nettoiePubId, ' p '),'.','')"/>
                        </biblScope>
                    </xsl:when>
                    <xsl:otherwise>
                        <biblScope unit="page">
                            <xsl:value-of
                                select="substring-before($nettoiePubId, '.')"/>
                        </biblScope>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains($pageInLine2, ';') and contains($pageInLine2, ':')">
                <xsl:choose>
                    <xsl:when test="contains($nettoiePage1, 'pp')">
                        <xsl:variable name="nettoiePage2">
                            <xsl:value-of select="substring-after($nettoiePage1, 'pp ')"/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="contains($nettoiePage2, '-')">
                                <biblScope unit="page" from="{substring-before($nettoiePage2,'-')}">
                                    <xsl:value-of select="substring-before($nettoiePage2, '-')"/>
                                </biblScope>
                                <xsl:choose>
                                    <xsl:when test="contains($nettoiePage2,',')">
                                        <biblScope unit="page"
                                            to="{translate(substring-before(substring-after($nettoiePage2,'-'),','),'.','')}">
                                            <xsl:value-of select="translate(substring-before(substring-after($nettoiePage2,'-'),','),'.','')"/>
                                        </biblScope>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <biblScope unit="page"
                                            to="{translate(substring-after($nettoiePage2,'-'),'.','')}">
                                            <xsl:value-of select="translate(substring-after($nettoiePage2, '-'), '.', '')"/>
                                        </biblScope>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="contains($pageInLine, ';')">
                                        <xsl:variable name="nettoiePage3">
                                            <xsl:value-of select="substring-after(substring-after($pageInLine, ';'), ':')"/>
                                        </xsl:variable>
                                        <biblScope unit="page"
                                            from="{substring-before($nettoiePage3,'-')}">
                                            <xsl:value-of
                                                select="substring-before($nettoiePage3, '-')"/>
                                        </biblScope>
                                        <biblScope unit="page"
                                            to="{translate(substring-after($nettoiePage3,'-'),'.','')}">
                                            <xsl:value-of
                                                select="translate(substring-after($nettoiePage3, '-'), '.', '')"
                                            />
                                        </biblScope>
                                    </xsl:when>
                                    <xsl:when test="contains($pageInLine, '(suppl)')">
                                        <xsl:variable name="nettoiePage3">
                                            <xsl:value-of select="normalize-space(translate(replace($pageInLine,'(suppl)',''),'()',''))"/>
                                        </xsl:variable>
                                        <biblScope unit="page"
                                            from="{substring-before($nettoiePage3,'-')}">
                                            <xsl:value-of
                                                select="substring-before($nettoiePage3, '-')"/>
                                        </biblScope>
                                        <biblScope unit="page"
                                            to="{translate(substring-after($nettoiePage3,'-'),'.','')}">
                                            <xsl:value-of
                                                select="translate(substring-after($nettoiePage3, '-'), '.', '')"
                                            />
                                        </biblScope>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="contains($pageInLine,',')"/>
                                            <xsl:otherwise>
                                                <biblScope unit="page">
                                                    <xsl:value-of select="$pageInLine"/>
                                                </biblScope>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="contains($nettoiePage1, ':')">
                        <xsl:choose>
                            <xsl:when test="contains($nettoiePage3, '-')">
                                <biblScope unit="page" from="{substring-before($nettoiePage3,'-')}">
                                    <xsl:value-of select="substring-before($nettoiePage3, '-')"/>
                                </biblScope>
                                <biblScope unit="page"
                                    to="{translate(substring-after($nettoiePage3,'-'),'.','')}">
                                    <xsl:value-of
                                        select="translate(substring-after($nettoiePage3, '-'), '.', '')"
                                    />
                                </biblScope>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="contains($nettoiePage1, ';')">
                                        <xsl:variable name="nettoiePage4">
                                            <xsl:value-of
                                                select="substring-after($nettoiePage1, ';')"/>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="contains($nettoiePage4, '-')">
                                                <xsl:variable name="resultat">
                                                    <xsl:value-of
                                                        select="substring-before($nettoiePage4, '-')"/>
                                                </xsl:variable>
                                                <xsl:choose>
                                                    <xsl:when test="contains($resultat,',')">
                                                        <biblScope unit="page"
                                                            from="{normalize-space(substring-after($resultat,','))}">
                                                            <xsl:value-of select="normalize-space(substring-after($resultat,','))"/>
                                                        </biblScope>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <biblScope unit="page"
                                                            from="{$resultat}">
                                                            <xsl:value-of
                                                                select="$resultat"/>
                                                        </biblScope>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                                <biblScope unit="page"
                                                    to="{translate(substring-after($nettoiePage4,'-'),'.','')}">
                                                    <xsl:value-of
                                                        select="translate(substring-after($nettoiePage4, '-'), '.', '')"
                                                    />
                                                </biblScope>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <biblScope unit="page">
                                                  <xsl:value-of
                                                  select="normalize-space(translate(substring-after($nettoiePage4, ':'), '.', ''))"
                                                  />
                                                </biblScope>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <biblScope unit="page">
                                            <xsl:value-of select="$nettoiePage1"/>
                                        </biblScope>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="contains($nettoiePage1, '-')">
                                <xsl:choose>
                                    <xsl:when test="contains($nettoiePage1,'accepted')"/>
                                    <xsl:when test="contains($nettoiePage1,'Geschichte der Kaiser')"/>
                                    <xsl:when test="contains($nettoiePage1,'Limited contribution of NR5A1 (SF')">
                                        <biblScope unit="vol">97</biblScope>
                                        <biblScope unit="page" from="141">141</biblScope>
                                        <biblScope unit="page" to="146">146</biblScope>
                                    </xsl:when>
                                    <xsl:when test="contains($nettoiePage1,'1010 CONCL')">
                                        <biblScope unit="page" from="1003">1003</biblScope>
                                        <biblScope unit="page" to="1010">1010</biblScope>
                                    </xsl:when>
                                    <xsl:when test="contains($nettoiePage1, ';')">
                                        <xsl:variable name="nettoiePage2">
                                            <xsl:value-of select="substring-before($nettoiePage1, ';')"/>
                                        </xsl:variable>
                                        <biblScope unit="page" from="{substring-before($nettoiePage2, '-')}">
                                            <xsl:value-of select="substring-before($nettoiePage2, '-')" />
                                        </biblScope>
                                        <biblScope unit="page" to="{substring-after($nettoiePage2, '-')}">
                                            <xsl:value-of select="substring-after($nettoiePage2, '-')" />
                                        </biblScope>
                                    </xsl:when>
                                    <xsl:when test="contains($nettoiePage1, ',')">
                                        <biblScope unit="page" from="{substring-before(substring-before($nettoiePage1,','),'-')}">
                                            <xsl:value-of select="substring-before(substring-before($nettoiePage1,','), '-')"/>
                                        </biblScope>
                                        <biblScope unit="page" to="{substring-after(substring-before($nettoiePage1,','),'-')}">
                                            <xsl:value-of select="substring-after(substring-before($nettoiePage1,','), '-')"/>
                                        </biblScope>
                                    </xsl:when>
                                    <xsl:when test="contains($nettoiePage1, '- ')">
                                        <biblScope unit="page" from="{substring-before($nettoiePage1,'-')}">
                                            <xsl:value-of select="substring-before($nettoiePage1,'-')" />
                                        </biblScope>
                                        <biblScope unit="page" to="{normalize-space(translate(substring-after($nettoiePage1,'-'),'.',''))}">
                                            <xsl:value-of select="normalize-space(translate(substring-after($nettoiePage1, '-'), '.', ''))" />
                                        </biblScope>
                                    </xsl:when>
                                    <xsl:when test="contains($nettoiePage1, ' ')">
                                        <biblScope unit="page" from="{substring-after(substring-before($nettoiePage1,'-'),' ')}">
                                            <xsl:value-of select="substring-after(substring-before($nettoiePage1, '-'), ' ')" />
                                        </biblScope>
                                        <biblScope unit="page" to="{translate(substring-after($nettoiePage1,'-'),'.','')}">
                                            <xsl:value-of select="translate(substring-after($nettoiePage1, '-'), '.', '')" />
                                        </biblScope>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <biblScope unit="page" from="{substring-before($nettoiePage1,'-')}">
                                            <xsl:value-of select="substring-before($nettoiePage1, '-')"/>
                                        </biblScope>
                                        <biblScope unit="page" to="{translate(substring-after($nettoiePage1,'-'),'.','')}">
                                            <xsl:value-of select="translate(substring-after($nettoiePage1, '-'), '.', '')" />
                                        </biblScope>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="contains($nettoiePage1, '–')">
                                <biblScope unit="page"
                                    from="{normalize-space(substring-before($nettoiePage1,'–'))}">
                                    <xsl:value-of
                                        select="normalize-space(substring-before($nettoiePage1, '–'))"
                                    />
                                </biblScope>
                                <xsl:variable name="resultat">
                                    <xsl:value-of
                                        select="normalize-space(translate(substring-after($nettoiePage1, '–'), '.', ''))"
                                    />
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="contains($resultat,',')">
                                        <biblScope unit="page"
                                            to="{substring-before($resultat,',')}">
                                            <xsl:value-of
                                                select="substring-before($resultat,',')"
                                            />
                                        </biblScope>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <biblScope unit="page"
                                            to="{$resultat}">
                                            <xsl:value-of
                                                select="$resultat"
                                            />
                                        </biblScope>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="contains($nettoiePage1, '®')"/>
                            <xsl:when test="contains($nettoiePage1, 'db')"/>
                            <xsl:when test="contains($nettoiePage1, 'The Natural and Modified History of Congenital Heart Disease')"/>
                            <xsl:when test="contains($text3, '. DOI:')">
                                <biblScope unit="page">
                                    <xsl:value-of select="normalize-space($nettoiePubId2)"/>
                                </biblScope>
                            </xsl:when>
                            <xsl:when test="contains($text3, ' p ')">
                                <biblScope unit="page">
                                    <xsl:value-of select="translate(substring-after($text3,' p '),'.','')"/>
                                </biblScope>
                            </xsl:when>
                            <xsl:when test="contains($nettoiePage1, '.')">
                                <biblScope unit="page">
                                    <xsl:value-of select="normalize-space(substring-before($nettoiePage1, '.'))"/>
                                </biblScope>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="contains($pageInLine2, 'http')"/>
                                    <xsl:when test="not(contains($pageInLine2, ';'))"/>
                                    <xsl:when test="contains($pageInLine2, '.')">
                                        <biblScope unit="page">
                                            <xsl:value-of select="translate(substring-after($pageInLine2, ';'),'.','')"/>
                                        </biblScope>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <biblScope unit="page">
                                            <xsl:value-of select="$pageInLine2"/>
                                        </biblScope>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains($pageInLine, ':')">
                <xsl:variable name="nettoiePage">
                    <xsl:value-of select="substring-after(substring-after($pageInLine, ':'), ':')"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="contains($nettoiePage, '-')">
                        <biblScope unit="page" from="{substring-before($nettoiePage,'-')}">
                            <xsl:value-of select="substring-before($nettoiePage, '-')"/>
                        </biblScope>
                        <biblScope unit="page" to="{substring-after($nettoiePage,'-')}">
                            <xsl:value-of select="substring-after($nettoiePage, '-')"/>
                        </biblScope>
                    </xsl:when>
                    <xsl:otherwise>
                        <biblScope unit="page">
                            <xsl:value-of select="$pageInLine"/>
                        </biblScope>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains($pageInLine2, 'pp')">
                <xsl:variable name="nettoiePage2">
                    <xsl:value-of select="substring-after($pageInLine2, 'pp ')"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="contains($pageInLine2,'Sex-, age-, and height-specific reference curves for the 6-min walk test in healthy children and adolescents')"/>
                    <xsl:when test="contains($nettoiePage2, '-')">
                        <biblScope unit="page" from="{substring-before($nettoiePage2,'-')}">
                            <xsl:value-of select="substring-before($nettoiePage2, '-')"/>
                        </biblScope>
                        <biblScope unit="page"
                            to="{translate(substring-after($nettoiePage2,'-'),'.','')}">
                            <xsl:value-of
                                select="translate(substring-after($nettoiePage2, '-'), '.', '')"/>
                        </biblScope>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="$pageInLine[string-length() &gt; 0]">
                            <biblScope unit="page">
                                <xsl:value-of select="$pageInLine"/>
                            </biblScope>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="$pageInLine[string-length() &gt; 0]">
                    <xsl:choose>
                        <xsl:when test="contains($pageInLine, 'pp')">
                            <xsl:variable name="pagePPinline">
                                <xsl:value-of select="substring-after($pageInLine, 'pp ')"/>
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="contains($pagePPinline, '-')">
                                    <biblScope unit="page"
                                        from="{substring-before($pagePPinline,'-')}">
                                        <xsl:value-of select="substring-before($pagePPinline, '-')"
                                        />
                                    </biblScope>
                                    <biblScope unit="page" to="{substring-after($pagePPinline,'-')}">
                                        <xsl:value-of select="substring-after($pagePPinline, '-')"/>
                                    </biblScope>
                                </xsl:when>
                                <xsl:otherwise>
                                    <biblScope unit="page">
                                        <xsl:value-of select="$pagePPinline"/>
                                    </biblScope>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when test="contains($pageInLine, '-')">
                            <biblScope unit="page" from="{substring-before($pageInLine,'-')}">
                                <xsl:value-of select="substring-before($pageInLine, '-')"/>
                            </biblScope>
                            <biblScope unit="page" to="{substring-after($pageInLine,'-')}">
                                <xsl:value-of select="substring-after($pageInLine, '-')"/>
                            </biblScope>
                        </xsl:when>
                        <xsl:otherwise>
                            <biblScope unit="page">
                                <xsl:value-of select="$pageInLine"/>
                            </biblScope>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- titre de l'article -->
    <xsl:template name="articleInLine" match="mixed-citation" mode="inLine">
        <xsl:param name="text"
            select="normalize-space(substring-before(substring-after(., ':'), '.'))"/>
        <xsl:param name="separator" select="'.'"/>
        <xsl:variable name="articleInLine">
            <xsl:value-of select="normalize-space($text)"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$articleInLine='395-399, 399'">
                <xsl:text>Six-minute walk test in children and adolescents.</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$articleInLine"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="roman">
        <hi rend="roman">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
</xsl:stylesheet>
