<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:rsc="http://www.rsc.org/schema/rscart38" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:ali="http://www.niso.org/schemas/ali/1.0/" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="#all">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct. 2022</xd:p>
            <xd:p><xd:b>Author:</xd:b> Stéphanie Gregorio</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output encoding="UTF-8" method="xml" omit-xml-declaration="no"/>
   
   

    <!-- Feuille de style ISTEX Editeur Proquest / TCRT journals
         DTD "asp_istex.dtd" 
        =======================================================================================
        Auteur:  Stéphanie GREGORIO - INIST/CNRS
        =======================================================================================
        Version 0.1 du 13/06/2022
     -->
    <!-- ******************* TRAITEMENT PRINCIPAL ******************************-->
    <xsl:variable name="bibliographicalInformationsTable" select="document('aspBibliographicalInformations.xml')"/>
    <xsl:variable name="currentDorpID">
        <xsl:value-of select="substring-before(asp/a[1]|asp/text/a[1],'.pdf')"/>
    </xsl:variable>
    <xsl:variable name="currentTitleAsp" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='title']"/>
    <xsl:variable name="currentProductId" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='productID']"/>
    <xsl:variable name="currentPageCount" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='pageCount']"/>
    <xsl:variable name="currentLanguage" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='language']"/>
    <xsl:variable name="currentCopyright" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='copyright']"/>
    <xsl:variable name="currentAuthor" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='author']"/>
    <xsl:variable name="currentEditor" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='editor']"/>
    <xsl:variable name="currentDate" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='date']"/>
    <xsl:variable name="currentVolume" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='volume']"/>
    <xsl:variable name="currentIssue" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='issue']"/>
    <xsl:variable name="currentPages" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='pages']"/>
    <xsl:variable name="currentPublicationType" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='publicationType']"/>
    <xsl:variable name="currentReligionGenre" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='religionGenre']"/>
    <xsl:variable name="currentSocialSubject" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='socialSubject']"/>
    <xsl:variable name="currentReligionDiscussed" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='religionDiscussed']"/>
    <xsl:variable name="currentTheologicalDiscussed" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='theologicalDiscussed']"/>
    <xsl:variable name="currentHostTitle" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='hostTitle']"/>
    <xsl:variable name="currentAbstract" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='abstract']"/>
    <xsl:variable name="currentContentType" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='contentType']"/>
    <xsl:variable name="currentPageRange" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='pageRange']"/>
    <xsl:variable name="currentCollection" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='collection']"/>
    <xsl:variable name="currentIdeologicalSubject" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='ideologicalSubject']"/>
    <xsl:variable name="currentIsbn" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='isbn']"/>
    <xsl:variable name="currentPublisher" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='publisher']"/>
    <xsl:variable name="currentRameau" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau']"/>
    <xsl:variable name="currentRameauID" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau']/@corresp"/>
    <xsl:variable name="currentRameau2" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau2']"/>
    <xsl:variable name="currentRameauID2" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau2']/@corresp"/>
    <xsl:variable name="currentRameau3" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau3']"/>
    <xsl:variable name="currentRameauID3" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau3']/@corresp"/>
    <xsl:variable name="currentRameau4" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau4']"/>
    <xsl:variable name="currentRameauID4" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau4']/@corresp"/>
    <xsl:variable name="currentRameau5" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau5']"/>
    <xsl:variable name="currentRameauID5" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau5']/@corresp"/>
    <xsl:variable name="currentRameau6" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau6']"/>
    <xsl:variable name="currentRameauID6" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau6']/@corresp"/>
    <xsl:variable name="currentRameau7" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau7']"/>
    <xsl:variable name="currentRameauID7" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau7']/@corresp"/>
    <xsl:variable name="currentRameau8" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau8']"/>
    <xsl:variable name="currentRameauID8" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau9']/@corresp"/>
    <xsl:variable name="currentRameau9" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau9']"/>
    <xsl:variable name="currentRameauID9" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau9']/@corresp"/>
    <xsl:variable name="currentRameau10" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau10']"/>
    <xsl:variable name="currentRameauID10" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau10']/@corresp"/>
    <xsl:variable name="currentRameau11" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau11']"/>
    <xsl:variable name="currentRameauID11" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau11']/@corresp"/>
    <xsl:variable name="currentRameau12" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau12']"/>
    <xsl:variable name="currentRameauID12" select="$bibliographicalInformationsTable/descendant::tei:row[tei:cell[@role='dorpID'] = $currentDorpID]/tei:cell[@role='rameau12']/@corresp"/>
    <!-- langue du document-->
    <xsl:variable name="langue">
        <xsl:value-of select="asp/original_language |asp/text/original_language |$currentLanguage"/>
    </xsl:variable>
    <xsl:variable name="langue2">
        <xsl:choose>
            <xsl:when test="$langue='English'">en</xsl:when>
            <xsl:when test="$langue='German'">de</xsl:when>
            <xsl:when test="$langue='French'">fr</xsl:when>
            <xsl:when test="$langue='Portuguese'">pt</xsl:when>
            <xsl:when test="$langue='Spanish'">es</xsl:when>
            <xsl:when test="$langue='Greek'">el</xsl:when>
            <xsl:when test="$langue='Italian'">it</xsl:when>
            <xsl:when test="$langue='Latin'">la</xsl:when>
            <xsl:when test="$langue='Russian'">ru</xsl:when>
            <xsl:otherwise>en</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:template match="asp">
    <TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
        <xsl:attribute name="xsi:noNamespaceSchemaLocation">
            <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
        </xsl:attribute>
        <xsl:if test="language_of_edition | text/language_of_edition">
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="$langue2"/>
            </xsl:attribute>
        </xsl:if>
        <xsl:variable name="title">
            <xsl:choose>
                <xsl:when test="real_title">
                    <xsl:apply-templates select="real_title"/>
                </xsl:when>
                <xsl:when test="text/real_title">
                    <xsl:apply-templates select="text/real_title"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$currentTitleAsp"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="date">
            <xsl:choose>
                <xsl:when test="$currentDate">
                    <xsl:value-of select="$currentDate"/>
                </xsl:when>
                <xsl:when test="string-length(publication_year | text/publication_year)&gt; 0">
                    <xsl:apply-templates select="publication_year | text/publication_year"/>
                </xsl:when>
                <xsl:when test="source_title[string-length()&gt; 0]|text/source_title[string-length()&gt; 0]">
                    <date>
                        <xsl:apply-templates select="source_title|text/source_title" mode="date"/>
                    </date>
                </xsl:when>
                <xsl:otherwise>
                    <!-- ajout d'une date par défaut -->
                    <xsl:text>1950</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <teiHeader>
            <fileDesc>
                <titleStmt>
                    <title type="main" level="a">
                        <xsl:value-of select="normalize-space($title)"/>
                    </title>
                </titleStmt>
                <publicationStmt>
                    <authority>ISTEX</authority>
                    <date type="published">
                        <xsl:attribute name="when">
                            <xsl:value-of select="$date"/>
                        </xsl:attribute>
                        <xsl:value-of select="$date"/>
                    </date>
                    <xsl:choose>
                        <xsl:when test="publisher[string-length()&gt; 0]|text/publisher[string-length()&gt; 0]">
                            <xsl:apply-templates select="publisher[string-length()&gt; 0]|text/publisher" mode="asp"/>
                            <xsl:if test="publisher_place[string-length()&gt; 0]|text/publisher_place[string-length()&gt; 0]">
                                <xsl:apply-templates select="publisher_place|text/publisher_place"/>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="string-length($currentPublisher) &gt; 0">
                            <publisher ref="https://scientific-publisher.data.istex.fr">
                                <xsl:value-of select="$currentPublisher"/>
                            </publisher>
                        </xsl:when>
                        <xsl:when test="string-length($currentCopyright) &gt; 0">
                            <publisher ref="https://scientific-publisher.data.istex.fr">Alexander Street Press</publisher>
                        </xsl:when>
                        <xsl:otherwise>
                            <publisher ref="https://scientific-publisher.data.istex.fr">Alexander Street Press</publisher>
                        </xsl:otherwise>
                    </xsl:choose>
                    <availability status="restricted">
                        <licence>
                            <p>
                                <xsl:choose>
                                    <xsl:when test="$currentCopyright">
                                        <xsl:value-of select="$currentCopyright"/>
                                    </xsl:when>
                                    <xsl:when test="copyright_message|text/copyright_message">
                                        <xsl:value-of select="copyright_message|text/copyright_message"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>Copyright © Alexander Street Press is not aware of any existing copyright in this
                work. Alexander Street Press would like to hear from any copyright holder that is
                not cited in this database.</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </p>
                        </licence>
                    </availability>
                </publicationStmt>
                <!-- genre -->
                <notesStmt>
                    <xsl:choose>
                        <xsl:when test="document_type='Periodical article' or text/document_type='Periodical article'">
                            <note>
                                <xsl:attribute name="type">content-type</xsl:attribute>
                                <xsl:attribute name="subtype">article</xsl:attribute>
                                <xsl:attribute name="source">
                                    <xsl:value-of select="document_type | text/document_type"/>
                                </xsl:attribute>
                                <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-6N5SZHKN-D</xsl:attribute>
                                <xsl:text>article</xsl:text>
                            </note>
                        </xsl:when>
                        <xsl:when test="document_type[string-length()&gt; 0]|text/document_type[string-length()&gt; 0]">
                            <note>
                                <xsl:attribute name="type">content-type</xsl:attribute>
                                <xsl:attribute name="subtype">other</xsl:attribute>
                                <xsl:attribute name="source">
                                    <xsl:value-of select="document_type | text/document_type"/>
                                </xsl:attribute>
                                <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:attribute>
                                <xsl:text>other</xsl:text>
                            </note>
                        </xsl:when>
                        <xsl:otherwise>
                            <note>
                                <xsl:attribute name="type">content-type</xsl:attribute>
                                <xsl:attribute name="subtype">
                                    <xsl:choose>
                                        <xsl:when test="$currentContentType='Periodical article'">article</xsl:when>
                                        <xsl:when test="$currentContentType='Monograph'">book</xsl:when>
                                        <xsl:when test="$currentContentType='Book'">book</xsl:when>
                                        <xsl:when test="//publication_type[1]='Monograph'">book</xsl:when>
                                        <xsl:otherwise>other</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:attribute name="source">
                                    <xsl:value-of select="$currentContentType"/>
                                </xsl:attribute>
                                <xsl:attribute name="scheme"> 
                                    <xsl:choose>
                                        <xsl:when test="$currentContentType='Periodical article'">https://content-type.data.istex.fr/ark:/67375/XTP-6N5SZHKN-D</xsl:when>
                                        <xsl:when test="$currentContentType='Monograph'">https://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T</xsl:when>
                                        <xsl:when test="$currentContentType='Book'">https://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T</xsl:when>
                                        <xsl:when test="//publication_type[1]='Monograph'">https://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T</xsl:when>
                                        <xsl:otherwise>https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:choose>
                                    <xsl:when test="$currentContentType='Periodical article'">article</xsl:when>
                                    <xsl:when test="$currentContentType='Monograph'">book</xsl:when>
                                    <xsl:when test="$currentContentType='Book'">book</xsl:when>
                                    <xsl:otherwise>other</xsl:otherwise>
                                </xsl:choose>
                            </note> 
                        </xsl:otherwise>
                    </xsl:choose>
                    <note type="publication-type" subtype="database" scheme="http://publication-type.data.istex.fr/ark:/67375/JMC-NTSGR1R0-Z">database</note>
                </notesStmt>
                <sourceDesc>
                    <biblStruct>
                        <analytic>
                            <title type="main" level="a">
                                <xsl:value-of select="normalize-space($title)"/>
                            </title>
                            <!-- auteurs -->
                            <author>
                                <persName>   
                                    <xsl:choose>
                                        <xsl:when test="string-length(@author) &gt; 0">
                                            <xsl:apply-templates select="@author"/>
                                        </xsl:when>
                                        <xsl:when test="string-length(author|text/author) &gt; 0">
                                            <xsl:apply-templates select="author|text/author" mode="asp"/>
                                        </xsl:when>
                                        <xsl:when test="string-length($currentAuthor) &gt; 0">
                                            <forename type="first">
                                                    <xsl:value-of select="substring-before($currentAuthor,',')"/>
                                            </forename>
                                            <surname>
                                                    <xsl:value-of select="substring-after($currentAuthor,',')"/>
                                            </surname>
                                        </xsl:when>
                                    </xsl:choose>
                                </persName>
                            </author>
                            <!-- ******************* identifiant systéme (n'apparaît pas dans le résultat ******************************-->
                            <xsl:if test="string-length($idistex) &gt; 0 ">
                                <idno>
                                    <xsl:attribute name="type">istex</xsl:attribute>
                                    <xsl:value-of select="normalize-space($idistex)"/>
                                </idno>
                            </xsl:if>
                            <!-- mars 2017 - ajout identifiant ark utilisé par API web -->
                            <xsl:if test="string-length($arkistex) &gt; 0 ">
                                <idno>
                                    <xsl:attribute name="type">ark</xsl:attribute>
                                    <xsl:value-of select="$arkistex"/>
                                </idno>
                            </xsl:if>
                            
                            <!-- identifiants niveau article -->
                            <xsl:apply-templates select="dorpid|text/dorpid"/>
                            <xsl:apply-templates select="entity_id|text/entity_id"/>
                            <xsl:choose>
                                <xsl:when test="div1[1]/@dorpid|text/div1[1]/@dorpid">
                                    <idno type="dorpid">
                                        <xsl:value-of select="div1[1]/@dorpid|text/div1[1]/@dorpid"/>
                                    </idno>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="div1[1]/dorpid| text/div1[1]/dorpid"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="$currentDorpID">
                                <idno type="bookID">
                                    <xsl:value-of select="$currentDorpID"/>
                                </idno>
                            </xsl:if>
                            <xsl:if test="$currentProductId">
                                <idno type="ProductID">
                                    <xsl:value-of select="$currentProductId"/>
                                </idno>
                            </xsl:if>
                        </analytic>
                        <monogr>
                            <xsl:variable name="titleHost">
                                <xsl:choose>
                                    <xsl:when test="source_title[string-length()&gt; 0] | text/source_title[string-length()&gt; 0]">
                                        <xsl:apply-templates select="source_title | text/source_title" mode="title"/>
                                    </xsl:when>
                                    <xsl:when test="real_title[string-length()&gt; 0] |text/real_title[string-length()&gt; 0]">
                                        <xsl:apply-templates select="real_title|text/real_title"/>
                                    </xsl:when>
                                    <xsl:when test="$currentHostTitle[string-length()&gt; 0]">
                                        <xsl:value-of select="$currentHostTitle"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$currentTitleAsp"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <title type="main" level="m">
                                <xsl:value-of select="$titleHost"/> 
                            </title>
                            <xsl:if test="$currentDorpID">
                                <idno type="bookID">
                                    <xsl:value-of select="$currentDorpID"/>
                                </idno>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="@isbn[string-length()&gt; 0]">
                                    <idno type="ISBN">
                                        <xsl:value-of select="@isbn"/>
                                    </idno>
                                </xsl:when>
                                <xsl:when test="$currentIsbn[string-length()&gt; 0]">
                                    <idno type="ISBN">
                                        <xsl:value-of select="translate($currentIsbn,'-','')"/>
                                    </idno>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="@lccn[string-length() &gt; 0]">
                                <idno type="lccn">
                                    <xsl:value-of select="@lccn"/>
                                </idno>
                            </xsl:if>
                            <!-- auteurs -->
                            <author>
                                <persName>   
                                    <xsl:choose>
                                        <xsl:when test="string-length(@author) &gt; 0">
                                            <xsl:apply-templates select="@author"/>
                                        </xsl:when>
                                        <xsl:when test="string-length(author|text/author) &gt; 0">
                                            <xsl:apply-templates select="author|text/author" mode="asp"/>
                                        </xsl:when>
                                        <xsl:when test="string-length($currentAuthor) &gt; 0">
                                            <forename type="first">
                                                <xsl:value-of select="substring-before($currentAuthor,',')"/>
                                            </forename>
                                            <surname>
                                                <xsl:value-of select="substring-after($currentAuthor,',')"/>
                                            </surname>
                                        </xsl:when>
                                    </xsl:choose>
                                </persName>
                            </author>
                            <!-- editor -->
                            <xsl:if test="$currentEditor">
                                <xsl:call-template name="tokenizeEditor"/>
                            </xsl:if>
                            <imprint>
                                <xsl:choose>
                                    <xsl:when test="publisher[string-length()&gt; 0]|text/publisher[string-length()&gt; 0]">
                                        <xsl:apply-templates select="publisher|text/publisher" mode="asp"/>
                                        <xsl:if test="publisher_place[string-length()&gt; 0]|text/publisher_place[string-length()&gt; 0]">
                                            <xsl:apply-templates select="publisher_place|text/publisher_place"/>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="string-length($currentPublisher) &gt; 0">
                                        <publisher ref="https://scientific-publisher.data.istex.fr">
                                            <xsl:value-of select="$currentPublisher"/>
                                        </publisher>
                                    </xsl:when>
                                    <xsl:when test="string-length($currentCopyright) &gt; 0">
                                        <publisher>Alexander Street Press</publisher>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <publisher>Alexander Street Press</publisher>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <date type="published">
                                    <xsl:attribute name="when">
                                        <xsl:value-of select="$date"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$date"/>
                                </date>
                                
                                
                                <xsl:if test="contains(source_title,'pp') or contains(text/source_title,'pp')">
                                    <xsl:apply-templates select="source_title|text/source_title" mode="pages"/>
                                </xsl:if>
                                <xsl:if test="source_title[string-length()&gt; 0]|text/source_title[string-length()&gt; 0]">
                                    <xsl:apply-templates select="source_title|text/source_title" mode="volumeIssue"/>
                                </xsl:if>
                                <xsl:if test="$currentVolume[string-length()&gt; 0]">
                                    <biblScope unit="volume">
                                        <xsl:value-of select="$currentVolume"/>
                                    </biblScope>
                                </xsl:if>
                                <xsl:if test="$currentIssue[string-length()&gt; 0]">
                                    <biblScope unit="issue">
                                        <xsl:value-of select="$currentIssue"/>
                                    </biblScope>
                                </xsl:if>
                                <!-- pagination -->
                                <xsl:apply-templates select="page_count|text/page_count"/>
                                <xsl:if test="$currentPages[string-length()&gt; 0]">
                                    <xsl:choose>
                                        <xsl:when test="contains($currentPages,'-')">
                                            <biblScope unit="page" from="{substring-before($currentPages,'-')}">
                                                <xsl:value-of select="substring-before($currentPages,'-')"/>
                                            </biblScope>
                                            <biblScope unit="page" to="{substring-after($currentPages,'-')}">
                                                <xsl:value-of select="substring-after($currentPages,'-')"/>
                                            </biblScope>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <biblScope unit="page" from="{$currentPages}">
                                                <xsl:value-of select="$currentPages"/>
                                            </biblScope>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <xsl:if test="$currentPageCount[string-length()&gt; 0]">
                                    <biblScope>
                                        <xsl:attribute name="unit">total-issue-pages</xsl:attribute>
                                        <xsl:value-of select="$currentPageCount"/>
                                    </biblScope>
                                </xsl:if>
                            </imprint>
                        </monogr>
                        <!-- serie/collection -->
                        <series>
                            <title type="main" level="s">Twentieth Century Religious Thought: Volume I, Christianity</title>
                            <xsl:if test="$currentCollection[string-length()&gt; 0] | //archive_collection[1][string-length()&gt; 0]">
                                <title type="sub" level="s">
                                    <xsl:value-of select="$currentCollection| //archive_collection[1]"/>
                                </title>
                            </xsl:if>
                        </series>
                    </biblStruct>
                </sourceDesc>
            </fileDesc>
            <!-- versionning -->
            <xsl:call-template name="insertVersion"/>   
            <profileDesc>
                <creation>
                    <date>
                        <xsl:value-of select="$date"/>
                    </date>
                </creation>
                <xsl:choose>
                    <xsl:when test="contains(source_title,'pp') and not(div1/p[1]/@align)">
                        <abstract>
                            <p>
                                <xsl:apply-templates select="div1/p[1]" mode="abstractAsp"/>
                            </p>
                        </abstract>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="string-length($currentAbstract) &gt; 0">
                            <abstract>
                                <p>
                                    <xsl:value-of select="normalize-space($currentAbstract)"/>
                                </p>
                            </abstract>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- mots clés auteurs-->
                <xsl:if test="string-length(keyword) &gt; 0">
                    <textClass ana="keyword">
                        <keywords scheme="#keyword">
                            <xsl:apply-templates select="keyword | text/keyword"/>
                        </keywords>
                    </textClass>
                </xsl:if>
                <!-- subject -->
                <xsl:choose>
                    <xsl:when test="string-length(religion_genre|text/religion_genre)&gt; 0">
                        <textClass ana="religion_genre">
                            <keywords scheme="#subject">
                                <xsl:apply-templates select="religion_genre|text/religion_genre"/>
                            </keywords>
                        </textClass>
                    </xsl:when>
                    <xsl:when test="$currentReligionGenre">
                        <textClass ana="religion_genre">
                            <keywords scheme="#subject">
                                <xsl:call-template name="tokenizeReligionGenre"/>
                            </keywords>
                        </textClass>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="$currentReligionDiscussed">
                    <textClass ana="religion_discussed">
                        <keywords scheme="#subject">
                            <xsl:call-template name="tokenizeReligionDiscussed"/>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="$currentIdeologicalSubject">
                    <textClass ana="ideological">
                        <keywords scheme="#subject">
                            <xsl:call-template name="tokenizeIdeological"/>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="$currentTheologicalDiscussed">
                        <textClass ana="theological_discussed">
                            <keywords scheme="#subject">
                                <xsl:call-template name="tokenizeTheological"/>
                            </keywords>
                        </textClass>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="theological_subject_discussed[string-length()&gt; 0]|text/theological_subject_discussed[string-length()&gt; 0]">
                            <textClass ana="theological_subject_discussed">
                                <keywords scheme="#subject">
                                    <xsl:apply-templates select="theological_subject_discussed|text/theological_subject_discussed"/>
                                </keywords>
                            </textClass>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="$currentSocialSubject">
                    <textClass ana="social">
                        <keywords scheme="#subject">
                            <xsl:call-template name="tokenizeSocial"/>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="$currentRameau">
                    <textClass ana="rameau">
                        <classCode scheme="#rameau">
                            <xsl:value-of select="$currentRameauID"/>
                        </classCode>
                        <keywords scheme="#rameau">
                            <term>
                                <xsl:value-of select="$currentRameau"/>
                            </term>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="$currentRameau2">
                    <textClass ana="rameau">
                        <classCode scheme="#rameau">
                            <xsl:value-of select="$currentRameauID2"/>
                        </classCode>
                        <keywords scheme="#rameau">
                            <term>
                                <xsl:value-of select="$currentRameau2"/>
                            </term>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="$currentRameau3">
                    <textClass ana="rameau">
                        <classCode scheme="#rameau">
                            <xsl:value-of select="$currentRameauID3"/>
                        </classCode>
                        <keywords scheme="#rameau">
                            <term>
                                <xsl:value-of select="$currentRameau3"/>
                            </term>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="$currentRameau4">
                    <textClass ana="rameau">
                        <classCode scheme="#rameau">
                            <xsl:value-of select="$currentRameauID4"/>
                        </classCode>
                        <keywords scheme="#rameau">
                            <term>
                                <xsl:value-of select="$currentRameau4"/>
                            </term>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="$currentRameau5">
                    <textClass ana="rameau">
                        <classCode scheme="#rameau">
                            <xsl:value-of select="$currentRameauID5"/>
                        </classCode>
                        <keywords scheme="#rameau">
                            <term>
                                <xsl:value-of select="$currentRameau5"/>
                            </term>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="$currentRameau6">
                    <textClass ana="rameau">
                        <classCode scheme="#rameau">
                            <xsl:value-of select="$currentRameauID6"/>
                        </classCode>
                        <keywords scheme="#rameau">
                            <term>
                                <xsl:value-of select="$currentRameau6"/>
                            </term>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="$currentRameau7">
                    <textClass ana="rameau">
                        <classCode scheme="#rameau">
                            <xsl:value-of select="$currentRameauID7"/>
                        </classCode>
                        <keywords scheme="#rameau">
                            <term>
                                <xsl:value-of select="$currentRameau7"/>
                            </term>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="$currentRameau8">
                    <textClass ana="rameau">
                        <classCode scheme="#rameau">
                            <xsl:value-of select="$currentRameauID8"/>
                        </classCode>
                        <keywords scheme="#rameau">
                            <term>
                                <xsl:value-of select="$currentRameau8"/>
                            </term>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="$currentRameau9">
                    <textClass ana="rameau">
                        <classCode scheme="#rameau">
                            <xsl:value-of select="$currentRameauID9"/>
                        </classCode>
                        <keywords scheme="#rameau">
                            <term>
                                <xsl:value-of select="$currentRameau9"/>
                            </term>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="$currentRameau10">
                    <textClass ana="rameau">
                        <classCode scheme="#rameau">
                            <xsl:value-of select="$currentRameauID10"/>
                        </classCode>
                        <keywords scheme="#rameau">
                            <term>
                                <xsl:value-of select="$currentRameau10"/>
                            </term>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="$currentRameau11">
                    <textClass ana="rameau">
                        <classCode scheme="#rameau">
                            <xsl:value-of select="$currentRameauID11"/>
                        </classCode>
                        <keywords scheme="#rameau">
                            <term>
                                <xsl:value-of select="$currentRameau11"/>
                            </term>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="$currentRameau12">
                    <textClass ana="rameau">
                        <classCode scheme="#rameau">
                            <xsl:value-of select="$currentRameauID12"/>
                        </classCode>
                        <keywords scheme="#rameau">
                            <term>
                                <xsl:value-of select="$currentRameau12"/>
                            </term>
                        </keywords>
                    </textClass>
                </xsl:if>
                <xsl:if test="religion_social_subject_discussed[string-length()&gt; 0]|text/religion_social_subject_discussed[string-length()&gt; 0]">
                    <textClass ana="religion_social_subject_discussed">
                        <keywords scheme="#subject">
                            <xsl:apply-templates select="religion_social_subject_discussed|text/religion_social_subject_discussed"/>
                        </keywords>
                    </textClass>
                </xsl:if>
                <langUsage>
                    <language ident="{$langue2}"/>
                </langUsage>
            </profileDesc>
            <revisionDesc>
                <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
            </revisionDesc>
        </teiHeader>
        <text>
            <body>
                <xsl:choose>
                    <xsl:when test="div1/p[string-length()&gt; 0] | text/div1/p[string-length()&gt; 0] | div1/div2/p[string-length()&gt; 0] | text[div1/div2]/p[string-length()&gt; 0]">
                        <xsl:apply-templates select="div1| text/div1"/>
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
        </text>
    </TEI>
    </xsl:template>
    
    
    <!-- ***********************Début des templates d'appel *************************-->
    <xsl:template match="div1">
        <div type="1" subtype="{translate(@name,' ','_')}" n="{@idpaging}" ana="{translate(@type,' ','')}" xml:lang="{@lang}">
            <xsl:apply-templates select="* except(//entity_id|//dorpid|//real_title|//page_count|//page_range|//original_language|//publisher|//copyright_message|//author|//document_type|//author_statement|//language_of_edition|//material_type|//original_publication_type|//publication_year|//year_written|//keyword|//hub_collection|//place_discussed|//archive_collection|//aspgroup|//aspcommunity|//unitaccess|//asptertiarycommunity|//publication_type|//publisher_place|//religion_discussed|//asp_release_date|//theological_subject_discussed|//ideological_subject_discussed|//religion_genre|//religion_social_subject_discussed|//archive_box|//archive_document_number|//archive_box_title)"/>
        </div>
    </xsl:template>
    <xsl:template match="div2">
        <div type="2" subtype="{translate(@name,' ','_')}" n="{@idpaging}" ana="{translate(@type,' ','')}" xml:lang="{@lang}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="div3">
        <div type="3" subtype="{translate(@name,' ','_')}" n="{@idpaging}" ana="{translate(@type,' ','')}" xml:lang="{@lang}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="div4">
        <div type="4" subtype="{translate(@name,' ','_')}" n="{@idpaging}" ana="{translate(@type,' ','')}" xml:lang="{@lang}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="div5">
        <div type="5" subtype="{translate(@name,' ','_')}" n="{@idpaging}" ana="{translate(@type,' ','')}" xml:lang="{@lang}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <!-- titre-->
    <xsl:template match="real_title">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    <!-- accessCondition-->
    <xsl:template match="copyright_message">
            <xsl:apply-templates/>
    </xsl:template>
    
    <!-- table des auteurs -->
    <xsl:template match="@author">
        <xsl:choose>
            <xsl:when test="contains(.,'|')">
                <xsl:call-template name="tokenizeAuthor"/>
            </xsl:when>
            <xsl:otherwise>
            <forename type="first">
                <xsl:variable name="given">
                    <xsl:value-of select="substring-after(.,', ')"/>
                </xsl:variable>
                <xsl:value-of select="normalize-space($given)"/>
            </forename>
            <surname>
                <xsl:variable name="nomFamille">
                    <xsl:value-of select="substring-before(.,', ')"/>
                </xsl:variable>
                <!-- traduit des caractéres dans le résultat -->
                <xsl:value-of select="$nomFamille"/>
            </surname>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="author" mode="asp">
            <name>
                <xsl:choose>
                    <xsl:when test="contains(.,' (')">
                        <xsl:value-of select="normalize-space(substring-before(.,' ('))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </name>
    </xsl:template>
    
    <!-- publisher -->
    <xsl:template match="publisher" mode="asp">
        <publisher>
            <xsl:apply-templates/>
        </publisher>
    </xsl:template>
    <xsl:template match="publisher_place">
        <pubPlace>
            <xsl:choose>
                <xsl:when test="contains(.,':')">
                    <xsl:value-of select="substring-after(.,':')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/> 
                </xsl:otherwise>
            </xsl:choose>
        </pubPlace>
    </xsl:template>
    <xsl:template match="publication_year">
        <date type="published">
            <xsl:apply-templates/>
        </date>
    </xsl:template>
    <xsl:template match="page_count">
        <biblScope unit="totalPages">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>
    
    <!-- titre du journal -->
    <xsl:template match="source_title" mode="title">
        <title level="a" type="main">
                <xsl:value-of select="substring-before(.,',')"/>
            </title>
    </xsl:template>
    <!-- date -->
    <xsl:template match="source_title" mode="date">
        <xsl:variable name="line">
            <xsl:text>19</xsl:text>
            <xsl:value-of select="substring-before(substring-after(.,'19'),', pp')"/>
        </xsl:variable>
        <xsl:value-of select="$line"/>
    </xsl:template>
    <!-- volume -->
    <xsl:template match="source_title" mode="volumeIssue">
        <biblScope unit="volume">
            <xsl:choose>
                <xsl:when test="contains(substring-before(substring-after(.,'Vol'),','),'no')">
                    <xsl:value-of select="translate(substring-before(substring-before(substring-after(.,'Vol'),','),'no'),'. ','')"/>  
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="translate(substring-before(substring-after(.,'Vol'),','),'. ','')"/>
                    <xsl:value-of select="translate(substring-before(substring-after(.,'vol'),','),'. ','')"/>
                </xsl:otherwise>
            </xsl:choose>
        </biblScope>
        <biblScope unit="issue">
                <xsl:value-of select="translate(substring-before(substring-after(.,'No'),','),'. ','')"/>
                <xsl:value-of select="translate(substring-before(substring-after(.,'no'),','),'. ','')"/>
        </biblScope>
    </xsl:template>
    <!-- pages -->
    <xsl:template match="source_title" mode="pages">
        <xsl:variable name="line">
            <xsl:value-of select="substring-after(.,'pp.')"/>
        </xsl:variable>
        <biblScope unit="page" from="{normalize-space(substring-before($line,'-'))}">
            <xsl:value-of select="normalize-space(substring-before($line,'-'))"/>
        </biblScope>
        <biblScope unit="page" to="{substring-after($line,'-')}">
            <xsl:value-of select="normalize-space(substring-after($line,'-'))"/>
        </biblScope> 
    </xsl:template>
    <!-- identifier -->
    <xsl:template match="dorpid">
            <idno type="articleID">
                <xsl:apply-templates/>
            </idno>
    </xsl:template>
    <xsl:template match="entity_id">
        <idno type="productID">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="theological_subject_discussed">
            <xsl:call-template name="tokenizeAsp"/>
    </xsl:template>
    
    <xsl:template match="religion_genre">
            <xsl:call-template name="tokenizeAsp"/>
    </xsl:template>
    
    <xsl:template match="religion_social_subject_discussed">
            <xsl:call-template name="tokenizeAsp"/>
    </xsl:template>
    <xsl:template name="tokenizeAsp">
        <xsl:param name="text" select="."/>
        <xsl:param name="separator" select="';'"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <term>
                        <xsl:value-of select="normalize-space($text)"/>
                    </term>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="item">
                    <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                </xsl:variable>
                <term>
                    <xsl:value-of select="normalize-space($item)"/>
                </term>
                <xsl:call-template name="tokenizeAsp">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="tokenizeIdeological">
        <xsl:param name="text" select="$currentIdeologicalSubject"/>
        <xsl:param name="separator" select="';'"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <term>
                    <xsl:value-of select="normalize-space($text)"/>
                </term>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="item">
                    <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                </xsl:variable>
                <term>
                    <xsl:value-of select="normalize-space($item)"/>
                </term>
                <xsl:call-template name="tokenizeIdeological">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="tokenizeSocial">
        <xsl:param name="text" select="$currentSocialSubject"/>
        <xsl:param name="separator" select="';'"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <term>
                    <xsl:value-of select="normalize-space($text)"/>
                </term>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="item">
                    <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                </xsl:variable>
                <term>
                    <xsl:value-of select="normalize-space($item)"/>
                </term>
                <xsl:call-template name="tokenizeSocial">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="tokenizeTheological">
        <xsl:param name="text" select="$currentTheologicalDiscussed"/>
        <xsl:param name="separator" select="';'"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <term>
                    <xsl:value-of select="normalize-space($text)"/>
                </term>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="item">
                    <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                </xsl:variable>
                <term>
                    <xsl:value-of select="normalize-space($item)"/>
                </term>
                <xsl:call-template name="tokenizeTheological">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="tokenizeReligionDiscussed">
        <xsl:param name="text" select="$currentReligionDiscussed"/>
        <xsl:param name="separator" select="';'"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <term>
                    <xsl:value-of select="normalize-space($text)"/>
                </term>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="item">
                    <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                </xsl:variable>
                <term>
                    <xsl:value-of select="normalize-space($item)"/>
                </term>
                <xsl:call-template name="tokenizeReligionDiscussed">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="tokenizeReligionGenre">
        <xsl:param name="text" select="$currentReligionGenre"/>
        <xsl:param name="separator" select="';'"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <term>
                    <xsl:value-of select="normalize-space($text)"/>
                </term>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="item">
                    <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                </xsl:variable>
                <term>
                    <xsl:value-of select="normalize-space($item)"/>
                </term>
                <xsl:call-template name="tokenizeReligionGenre">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="u">
        <hi rend="bold">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="lacuna"/>
    <xsl:template match="bl">
        <!--<hi rend="bold">
            <xsl:apply-templates/>
        </hi>-->
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="br">
        <xsl:choose>
            <xsl:when test="parent::caption"/>
            <xsl:otherwise>
                <lb/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="div1/head|div2/head|div3/head|div4/head|div5/head">
        <p rend="head">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="altpage">
        <p rend="head">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="sp">
        <sp>
            <xsl:apply-templates/>
        </sp>
    </xsl:template>
    <xsl:template match="speaker">
        <speaker>
            <xsl:apply-templates/>
        </speaker>
    </xsl:template>
    <!-- editor -->
    <xsl:template name="tokenizeEditor">
        <xsl:param name="text" select="$currentEditor"/>
        <xsl:param name="separator" select="';'"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <editor>
                    <persName>
                        <forename type="first">
                            <xsl:value-of select="normalize-space(substring-before($text,','))"/>
                        </forename>
                        <surname>
                            <xsl:value-of select="normalize-space(substring-after($text,','))"/>
                        </surname>
                    </persName>
                </editor>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="item">
                    <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                </xsl:variable>
                <editor>
                    <persName>
                        <forename type="first">
                            <xsl:value-of select="normalize-space(substring-before($item,','))"/>
                        </forename>
                        <surname>
                            <xsl:value-of select="normalize-space(substring-after($item,','))"/>
                        </surname>
                    </persName>
                </editor>
                <xsl:call-template name="tokenizeEditor">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="tokenizeAuthor">
        <xsl:param name="text" select="."/>
        <xsl:param name="separator" select="'|'"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <author>
                    <persName>
                        <forename type="first">
                            <xsl:value-of select="normalize-space(substring-after($text,','))"/>
                        </forename>
                        <surname>
                            <xsl:value-of select="normalize-space(substring-before($text,','))"/>
                        </surname>
                    </persName>
                </author>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="item">
                    <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                </xsl:variable>
                <author>
                    <persName>
                        <forename type="first">
                            <xsl:value-of select="normalize-space(substring-after($item,','))"/>
                        </forename>
                        <surname>
                            <xsl:value-of select="normalize-space(substring-before($item,','))"/>
                        </surname>
                    </persName>
                </author>
                <xsl:call-template name="tokenizeAuthor">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="asp_release_date"/>
    <xsl:template match="archive_box"/>
    <xsl:template match="page_range"/>
    <xsl:template match="document_type"/>
    <xsl:template match="author_statement"/>
    <xsl:template match="language_of_edition"/>
    <xsl:template match="material_type"/>
    <xsl:template match="original_publication_type"/>
    <xsl:template match="original_language"/>
    <xsl:template match="year_written"/>
    <xsl:template match="hub_collection"/>
    <xsl:template match="archive_collection"/>
    <xsl:template match="aspgroup"/>
    <xsl:template match="aspcommunity"/>
    <xsl:template match="unitaccess"/>
    <xsl:template match="asptertiarycommunity"/>
    <xsl:template match="archive_box_title"/>
    <xsl:template match="archive_document_number"/>
    <xsl:template match="place_discussed"/>
    <xsl:template match="source_title"/>
    <xsl:template match="publication_type"/>
    <xsl:template match="religion_discussed"/>
    <xsl:template match="ideological_subject_discussed"/>
    <xsl:template match="ill"/>
</xsl:stylesheet>
