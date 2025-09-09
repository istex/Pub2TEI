<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns:m="http://www.w3.org/1998/Math/MathML"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>
    
    <!-- TEI document structure, creation of main header components, front (summary), body, and back -->
    <xsl:template match="/Publisher[count(Series/descendant::Book[1]/descendant::Chapter)=1]|book-part-wrapper">
        <TEI  xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <xsl:apply-templates select="Series/descendant::Book/descendant::Chapter/ChapterInfo/ChapterTitle"/>
                        <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/title-group/title" mode="springer"/>
                        <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/title-group/alt-title"/>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <xsl:apply-templates select="PublisherInfo/PublisherName |book-meta/publisher"/>
                        <xsl:apply-templates select="Series/descendant::Book/descendant::Chapter/ChapterInfo/ChapterCopyright"/>
                        <xsl:if test="//ArticleGrants/BodyPDFGrant[string(@Grant)='OpenAccess']">
                            <availability status="free">
                                <p>Open Access</p>
                            </availability>
                        </xsl:if>
                        <xsl:apply-templates select="//book-part-wrapper/book-meta/pub-date" mode="TF"/>    
                        <xsl:apply-templates select="book-meta/permissions/copyright-year"/>
                        <xsl:apply-templates select="//ChapterCopyright/CopyrightYear"/>
                    </publicationStmt>
                    <notesStmt>
                        <!-- niveau book -->
                        <xsl:choose>
                            <xsl:when test="//BookBackmatter">
                                <note type="content-type">
                                    <xsl:attribute name="subtype">other</xsl:attribute>
                                    <xsl:attribute name="source">book-backmatter</xsl:attribute>
                                    <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:attribute>
                                    <xsl:text>other</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//BookFrontmatter">
                                <note type="content-type">
                                    <xsl:attribute name="subtype">other</xsl:attribute>
                                    <xsl:attribute name="source">book-frontmatter</xsl:attribute>
                                    <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:attribute>
                                    <xsl:text>other</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//Book/BookInfo/@BookProductType='Proceedings'">
                                <note type="content-type">
                                    <xsl:attribute name="type">conference</xsl:attribute>
                                    <xsl:attribute name="source">proceedings</xsl:attribute>
                                    <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-BFHXPBJJ-3</xsl:attribute>
                                <xsl:text>conference</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//book-part[not(body/book-part)]/@book-part-type='chapter'">
                                <note type="content-type">
                                    <xsl:attribute name="subtype">
                                        <xsl:text>chapter</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="source">
                                        <xsl:value-of select="//book-part[not(body/book-part)]/@book-part-type"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6</xsl:attribute>
                                    <xsl:text>chapter</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:otherwise>
                                <note type="content-type">
                                    <xsl:attribute name="subtype">other</xsl:attribute>
                                    <xsl:attribute name="source">book-frontmatter</xsl:attribute>
                                    <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:attribute>
                                    <xsl:text>other</xsl:text>
                                </note>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- niveau revue / book -->
                        <xsl:choose>
                            <xsl:when test="//Series">
                                <note type="publication-type" subtype="book-series">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//Book and not(//Series)">
                                <note type="publication-type" subtype="book">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                    <xsl:text>book</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="collection-meta[string-length() &gt; 0]">
                                <note type="publication-type" subtype="book-series">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:otherwise>
                                <note type="publication-type" subtype="book">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                    <xsl:text>book</xsl:text>
                                </note>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/notes"/>
                    </notesStmt>
                    <xsl:choose>
                        <xsl:when test="Series">
                            <sourceDesc>
                                <xsl:apply-templates select="Series" mode="sourceDesc"/>
                            </sourceDesc>
                        </xsl:when>
                        <xsl:otherwise>
                            <sourceDesc>
                                <biblStruct>
                                    <analytic>
                                        <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/title-group/title" mode="springer"/>
                                        <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/title-group/alt-title"/>
                                        <xsl:if test="//book-part[not(body/book-part)]/book-part-meta/contrib-group/contrib[string-length() &gt; 0]">
                                            <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/contrib-group" mode="springer"/>
                                        </xsl:if>
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
                                        <xsl:apply-templates select="//book-part[not(body/book-part)]/@id" mode="springer"/>
                                        <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/book-part-id"/>
                                        <!-- lien vers les chapitres corrigés -->
                                        <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/related-article"/>
                                    </analytic>
                                    <monogr>
                                        <xsl:if test="book-meta/book-title-group/book-title[string-length() &gt; 0]">
                                            <title level="m" type="main">
                                                <xsl:value-of select="normalize-space(book-meta/book-title-group/book-title)"/>
                                            </title>
                                        </xsl:if>
                                        <xsl:if test="book-meta/book-title-group/subtitle[string-length() &gt; 0]">
                                            <title level="m" type="sub">
                                                <xsl:value-of select="normalize-space(book-meta/book-title-group/subtitle)"/>
                                            </title>
                                        </xsl:if>
                                        <xsl:apply-templates select="book-meta/book-id"/>
                                        <xsl:apply-templates select="book-meta/isbn"/>
                                        <xsl:if test="book-meta/contrib-group[string-length() &gt; 0]">
                                            <xsl:apply-templates select="book-meta/contrib-group" mode="springer"/>
                                        </xsl:if>
                                        <imprint>
                                            <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/pub-date[@publication-format='print']/year"/>
                                            <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/pub-date[@publication-format='electronic']/year"/>
                                            <xsl:apply-templates select="//book-part[body/book-part]/book-part-meta/title-group/title" mode="issue"/>
                                            <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/fpage"/>
                                            <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/lpage"/>
                                        </imprint>
                                    </monogr>
                                    <xsl:apply-templates select="collection-meta"/>
                                </biblStruct>
                            </sourceDesc>
                        </xsl:otherwise>
                    </xsl:choose>
                </fileDesc>
                <!-- versionning -->
                <xsl:call-template name="insertVersion"/>
                <profileDesc>
                    <xsl:apply-templates select="//descendant::Book[1]/descendant::Chapter/ChapterHeader/Abstract"/>
                    <xsl:apply-templates select="//descendant::Book[1]/descendant::Chapter/ChapterHeader/AbbreviationGroup"/>
                    <xsl:apply-templates select="//descendant::Book[1]/descendant::Chapter/ChapterHeader/KeywordGroup"/>
                    <!-- ******************* Abstract ******************************-->
                    <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/abstract"/>
                    <!-- *************************************** Mots clés niveau book ******************************-->
                    <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/kwd-group"/>
                    <xsl:if test="book-meta/custom-meta-group/custom-meta">
                        <textClass>
                            <keywords ana="book-subject">
                                <xsl:apply-templates select="book-meta/custom-meta-group/custom-meta"/>
                            </keywords>
                        </textClass>
                    </xsl:if>
                    <xsl:if test="//descendant::Book[1]/descendant::SubjectCollection or //descendant::Book[1]/descendant::BookSubjectGroup">
                        <textClass ana="subject">
                            <xsl:apply-templates select="//descendant::Book[1]/descendant::SubjectCollection"/></textClass>
                        <textClass ana="subject"><xsl:apply-templates select="//descendant::Book[1]/descendant::BookSubjectGroup"/></textClass>
                    </xsl:if>
                    <!-- ******************* Language ******************************-->
                    <xsl:if test="//Chapter/@Language|@xml:lang">
                        <langUsage>
                            <language>
                                <xsl:attribute name="ident">
                                    <xsl:value-of select="translate(//Chapter/@Language|@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
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
            <text>
                <body>
                    <xsl:choose>
                        <xsl:when test="//book-part[not(body/book-part)]/body">
                            <xsl:apply-templates select="//book-part[not(body/book-part)]/body/*"/>
                        </xsl:when>
                        <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                            <div>
                                <p>
                                    <xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/>
                                </p>
                            </div>
                        </xsl:when>
                        <xsl:otherwise>
                            <div>
                                <p/>
                            </div>
                        </xsl:otherwise>
                    </xsl:choose>
                </body>
                <xsl:if test="//book-part[not(body/book-part)]/back/ref-list/ref-list/ref|fn-group">
                    <back>
                        <xsl:if test="//book-part[not(body/book-part)]/back/ref-list/ref-list/ref">
                            <xsl:apply-templates select="//book-part[not(body/book-part)]/back/ref-list"/>
                        </xsl:if>
                        <xsl:if test="//fn-group">
                            <xsl:apply-templates select="//fn-group"/>
                        </xsl:if>
                        <xsl:if test="//app-group">
                            <xsl:apply-templates select="//app-group"/>
                        </xsl:if>
                    </back>
                </xsl:if>
            </text>
        </TEI>
    </xsl:template>

    <!-- Building the sourceDesc bibliographical representation -->
    <xsl:template match="Series" mode="sourceDesc">
        <biblStruct>
            <analytic>
                <!-- Title information related to the chapter goes here -->
                <xsl:apply-templates select="descendant::Book/descendant::Chapter/ChapterInfo/ChapterTitle"/>
                <!-- All authors are included here -->
                <xsl:apply-templates select="descendant::Book/descendant::Chapter/ChapterHeader/AuthorGroup/Author" mode="springer"/>
                <xsl:apply-templates
                    select="descendant::Book/descendant::Chapter/ChapterHeader//AuthorGroup/InstitutionalAuthor" mode="springer"/>
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
                <xsl:apply-templates select="descendant::Book/Chapter/ChapterInfo/ChapterID"/>
                <xsl:apply-templates select="descendant::Book/descendant::Chapter/ChapterInfo/ChapterDOI"/>
            </analytic>
            <monogr>
                <xsl:apply-templates select="descendant::Book/BookInfo/BookTitle"/>
                <xsl:apply-templates select="descendant::Book/BookInfo/BookSubTitle"/>
                <xsl:apply-templates select="descendant::Book/Part/PartInfo/PartTitle"/>
                <xsl:apply-templates select="descendant::Book/BookInfo/BookDOI"/>
                <xsl:apply-templates select="descendant::Book/BookInfo/BookID"/>
                <xsl:apply-templates select="descendant::Book/BookInfo/BookTitleID"/>
                <xsl:apply-templates select="descendant::Book/BookInfo/BookPrintISBN"/>
                <xsl:apply-templates select="descendant::Book/BookInfo/BookElectronicISBN"/>
                <xsl:apply-templates select="//Chapter"/>
                <xsl:apply-templates select="//Part"/>
                <xsl:apply-templates select="descendant::Book/BookHeader/AuthorGroup/Author"/>
                <xsl:apply-templates select="descendant::Book/BookHeader/EditorGroup/Editor"/>
                <xsl:apply-templates select="descendant::Book/BookInfo/ConferenceInfo"/>
                <imprint>
                    <xsl:apply-templates select="descendant::Book/BookInfo/BookCopyright/CopyrightHolderName" mode="publisher"/>
                    <xsl:apply-templates select="descendant::Book/BookInfo/BookCopyright/CopyrightYear"/>
                    <xsl:apply-templates select="descendant::Book/BookInfo/BookVolumeNumber"/>
                    <xsl:apply-templates select="descendant::Book/descendant::Chapter/ChapterInfo/ChapterFirstPage"/>
                    <xsl:apply-templates select="descendant::Book/descendant::Chapter/ChapterInfo/ChapterLastPage"/>
                    <xsl:apply-templates select="Volume/VolumeInfo"/>
                    <xsl:apply-templates select="descendant::Book/BookInfo/BookChapterCount"/>
                    <xsl:apply-templates select="descendant::Book/Part/PartInfo/PartChapterCount"/>
                    <xsl:apply-templates select="Volume/Issue/IssueInfo/IssueIDStart"/>
                    <xsl:apply-templates select="Volume/Issue/IssueInfo/IssueIDEnd"/>
                </imprint>
            </monogr>
                <series>
                    <xsl:apply-templates select="SeriesInfo/SeriesTitle"/>
                    <xsl:apply-templates select="SeriesInfo/SeriesAbbreviatedTitle"/>
                    <xsl:apply-templates select="SeriesHeader/AuthorGroup/Author"/>
                    <xsl:apply-templates select="SeriesHeader/EditorGroup/Editor"/>
                    <xsl:apply-templates select="SeriesHeader/CollaboratorGroup/Collaborator"/>
                    <xsl:apply-templates select="SeriesInfo/SeriesPrintISSN"/>
                    <xsl:apply-templates select="SeriesInfo/SeriesElectronicISSN"/>
                    <xsl:apply-templates select="SeriesInfo/SeriesID"/>
                </series>
            <xsl:apply-templates select="SubSeries" mode="sourceDesc"/>
        </biblStruct>
    </xsl:template>
    <xsl:template match="SubSeries" mode="sourceDesc">
        <series xml:id="sub-series">
            <xsl:apply-templates select="SubSeriesInfo/SubSeriesTitle"/>
            <xsl:apply-templates select="SubSeriesInfo/SeriesAbbreviatedTitle"/>
            <xsl:apply-templates select="SubSeriesHeader/AuthorGroup/Author"/>
            <xsl:apply-templates select="SubSeriesHeader/EditorGroup/Editor"/>
            <xsl:apply-templates select="SubSeriesInfo/SubSeriesPrintISSN"/>
            <xsl:apply-templates select="SubSeriesInfo/SubSeriesElectronicISSN"/>
            <xsl:apply-templates select="SubSeriesInfo/SubSeriesID"/>
        </series>
    </xsl:template>
    <xsl:template match="title" mode="springer">
        <title level="a" type="main">
            <xsl:if test="../label[string-length() &gt; 0]">
                <xsl:value-of select="normalize-space(../label)"/>
                <xsl:text> - </xsl:text>
            </xsl:if>
            <xsl:apply-templates/>
        </title>
        <xsl:if test="../subtitle[string-length() &gt; 0]">
            <xsl:value-of select="normalize-space(../subtitle)"/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="custom-meta">
        <xsl:apply-templates select="meta-value"/>
    </xsl:template>
    
    <xsl:template match="meta-value">
        <xsl:choose>
            <xsl:when test="../meta-name=('book-subject-primary')">
                <term>
                    <xsl:value-of select="normalize-space(.)"/>
                </term>
            </xsl:when>
            <xsl:when test="../meta-name=('book-subject-secondary')">
                <term>
                    <xsl:value-of select="normalize-space(.)"/>
                </term>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="contrib-group" mode="springer">
        <xsl:apply-templates select="contrib" mode="springer"/>
    </xsl:template>
    
    <xsl:template match="contrib" mode="springer">
            <xsl:choose>
                <xsl:when test="@contrib-type='author'">
                    <author>
                        <persName>
                            <xsl:apply-templates select="name"/>
                            <xsl:if test="string-name/not[surname][string-length() &gt; 0]">
                                <xsl:apply-templates select="name"/>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="../aff[@id=current()/xref/@rid]">
                                    <xsl:apply-templates select="../aff[@id=current()/xref/@rid]" mode="springer"/>
                                </xsl:when>
                                <xsl:when test="ancestor::book-part-meta and //aff">
                                    <xsl:apply-templates select="//aff" mode="springer"/>
                                </xsl:when>
                                <xsl:when test="/book-part-meta/aff">
                                    <xsl:apply-templates select="//aff" mode="springer"/>
                                </xsl:when>
                            </xsl:choose>
                        </persName>
                        <xsl:if test="bio">
                            <state type="biography">
                                <desc>
                                    <xsl:value-of select="normalize-space(bio)"/>
                                </desc>
                            </state> 
                        </xsl:if>
                    </author>
                </xsl:when>
                <xsl:when test="@contrib-type='editor' or @contrib-type='Series Editor'">
                    <editor>
                        <persName>
                            <xsl:apply-templates select="name"/>
                            <xsl:choose>
                                <xsl:when test="../aff[@id=current()/xref/@rid]">
                                    <xsl:apply-templates select="../aff[@id=current()/xref/@rid]" mode="springer"/>
                                </xsl:when>
                                <xsl:when test="ancestor::book-part-meta and //aff">
                                    <xsl:apply-templates select="//aff" mode="springer"/>
                                </xsl:when>
                                <xsl:when test="/book-part-meta/aff">
                                    <xsl:apply-templates select="//aff" mode="springer"/>
                                </xsl:when>
                            </xsl:choose>
                        </persName>
                        <xsl:if test="bio">
                            <state type="biography">
                                <desc>
                                    <xsl:value-of select="normalize-space(bio)"/>
                                </desc>
                            </state> 
                        </xsl:if>
                        <roleName>editor</roleName>
                    </editor>
                </xsl:when>
            </xsl:choose>
    </xsl:template>
    <xsl:template match="aff" mode="springer">
        <affiliation>
            <xsl:apply-templates select="institution-wrap" mode="springer"/>
            <xsl:if test="addr-line">
                <address>
                    <xsl:apply-templates select="addr-line" mode="springer"/>
                    <xsl:apply-templates select="country"/>
                </address>
            </xsl:if>
        </affiliation>
    </xsl:template>
    <xsl:template match="institution-wrap" mode="springer">
        <xsl:apply-templates select="institution-id" mode="springer"/>
        <xsl:apply-templates select="institution" mode="springer"/>
    </xsl:template>
    <xsl:template match="institution" mode="springer">
        <xsl:choose>
            <xsl:when test="@content-type='org-name'">
                <orgName type="institution">
                    <xsl:apply-templates/>
                </orgName>
            </xsl:when>
            <xsl:when test="@content-type='org-division'">
                <orgName type="division">
                    <xsl:apply-templates/>
                </orgName>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="institution-id" mode="springer">
        <idno type="{@institution-id-type}">
        <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="addr-line" mode="springer">
        <xsl:choose>
            <xsl:when test="@content-type='street'">
                <street>
                    <xsl:apply-templates/>
                </street>
            </xsl:when>
            <xsl:when test="@content-type='postcode'">
                <postCode>
                    <xsl:apply-templates/>
                </postCode>
            </xsl:when>
            <xsl:when test="@content-type='city'">
                <settlement>
                    <xsl:apply-templates/>
                </settlement>
            </xsl:when>
            <xsl:when test="@content-type='state'">
                <region>
                    <xsl:apply-templates/>
                </region>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="@id" mode="springer">
        <idno>
            <xsl:attribute name="type">chapterID</xsl:attribute>
            <xsl:value-of select="normalize-space(.)"/>
        </idno>
    </xsl:template>
    
    <!-- Title Issue-->
    <xsl:template match="title" mode="issue">
        <biblScope>
            <xsl:attribute name="unit">titlePart</xsl:attribute>
            <xsl:if test="../label">
                <xsl:value-of select="../label"/>
                <xsl:text> - </xsl:text>
            </xsl:if>
            <xsl:value-of select="."/>
        </biblScope>
    </xsl:template>
    
    <xsl:template match="related-article"> 
        <ref type="{@related-article-type}">
            <idno>
                <xsl:attribute name="type">
                    <xsl:choose>
                        <xsl:when test="@ext-link-type='doi'">DOI</xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@ext-link-type"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:choose>
                    <xsl:when test="@elocation-id"><xsl:apply-templates select="@elocation-id"/></xsl:when>
                    <xsl:when test="@xlink:href"><xsl:apply-templates select="@xlink:href"/></xsl:when>
                </xsl:choose>
            </idno>
            <xsl:if test="@id">
                <idno>
                    <xsl:attribute name="type">related-article-id</xsl:attribute>
                    <xsl:apply-templates select="@id"/> 
                </idno>
            </xsl:if>
        </ref>
    </xsl:template>
</xsl:stylesheet>
