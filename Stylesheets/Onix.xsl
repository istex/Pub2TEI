<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:m="http://www.w3.org/1998/Math/MathML" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns:dcterms="http://purl.org/dc/terms/" 
    xmlns:mets="http://www.loc.gov/METS/"
    xmlns:onix="http://ns.editeur.org/onix/3.0/reference"
    exclude-result-prefixes="#all">
    
    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- Feuille de style concernant les données:
    - Casalini Torrossa EEO
    -->
    <xsl:variable name="codeLang3Onix">
        <xsl:value-of select="//onix:ONIXMessage/onix:Product/onix:ContentDetail/onix:ContentItem/onix:Language/onix:LanguageCode"/>
    </xsl:variable>
    <xsl:variable name="codeLang2Onix">
        <xsl:choose>
            <xsl:when test="$codeLang3Onix = 'cat'">ca</xsl:when>
            <xsl:when test="$codeLang3Onix = 'fre'">fr</xsl:when>
            <xsl:when test="$codeLang3Onix = 'ita'">it</xsl:when>
            <xsl:when test="$codeLang3Onix = 'spa'">es</xsl:when>
            <xsl:when test="$codeLang3Onix = 'eng'">en</xsl:when>
            <xsl:when test="$codeLang3Onix = 'por'">pt</xsl:when>
            <xsl:when test="$codeLang3Onix = 'glg'">gl</xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="doiOnix">
        <xsl:value-of select="//onix:ONIXMessage/onix:Product/onix:ContentDetail/onix:ContentItem/onix:TextItem/onix:TextItemIdentifier[onix:TextItemIDType='06']/onix:IDValue"/>
    </xsl:variable>
    
    <xsl:variable name="dateOnix">
        <xsl:value-of select="//onix:ONIXMessage/onix:Product/onix:PublishingDetail/onix:PublishingDate/onix:Date"/>
    </xsl:variable>
    <xsl:template match="onix:ONIXMessage">
        <TEI  xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="xml:lang">
               <xsl:value-of select="$codeLang2Onix"/>
            </xsl:attribute>
            
            <teiHeader>
                <fileDesc>
                    <!-- SG - titre brut -->
                    <titleStmt>
                        <xsl:apply-templates select="/onix:ONIXMessage/onix:Product/onix:ContentDetail/onix:ContentItem/onix:TitleDetail/onix:TitleElement"/>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <!-- publisher -->
                        <xsl:apply-templates select="/onix:ONIXMessage/onix:Product/onix:PublishingDetail/onix:Publisher/onix:PublisherName"/>
                        
                        <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-20TNKDTW-C">Casalini</publisher>
                        <availability>
                            
                            <xsl:attribute name="status">restricted</xsl:attribute>
                            <licence>Casalini</licence>
                            <p> <xsl:text>Casalini Torrossa EEO &#169;</xsl:text>
                                <xsl:value-of select="$dateOnix"/>
                                <xsl:text>, all rights reserved.</xsl:text></p>
                            <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-45K98RS9-F">casalini-torrossa-eeo</p>
                        </availability>
                        <date type="published" when="{$dateOnix}"/>
                    </publicationStmt>
                    <notesStmt>
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
                                        <xsl:attribute name="subtype">other</xsl:attribute>
                                        <xsl:attribute name="source">N/A</xsl:attribute>
                                        <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:attribute>
                                        <xsl:text>other</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </note>
                        <!-- genre niveau host-->
                        <xsl:choose>
                            <xsl:when test="//onix:Collection and //onix:Collection/onix:TitleDetail/onix:TitleElement[onix:TitleElementLevel='02']/onix:TitleText!='Monografies'">
                                <note type="publication-type" source="book-series" subtype="book-series" scheme="https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z">book</note>
                            </xsl:when>
                            <xsl:otherwise>
                                <note type="publication-type" source="book" subtype="book" scheme="https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F">book</note>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- note editorial - physical descriptions -->
                        <xsl:if test="/onix:ONIXMessage/onix:Product/onix:CollateralDetail/onix:TextContent/onix:Text">
                            <xsl:for-each select="/onix:ONIXMessage/onix:Product/onix:CollateralDetail/onix:TextContent/onix:Text">
                                <note type="physical-description">
                                    <xsl:value-of select="."/>
                                </note>
                            </xsl:for-each>
                        </xsl:if>
                    </notesStmt>
                    <sourceDesc>
                        <biblStruct type="article">
                            <analytic>
                                <xsl:apply-templates select="/onix:ONIXMessage/onix:Product/onix:ContentDetail/onix:ContentItem/onix:TitleDetail/onix:TitleElement"/>
                                <xsl:apply-templates select="/onix:ONIXMessage/onix:Product/onix:ContentDetail/onix:ContentItem/onix:Contributor"/>
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
                                <!-- ident DOI du chapitre-->
                                <xsl:if test="/onix:ONIXMessage/onix:Product/onix:ContentDetail/onix:ContentItem/onix:TextItem/onix:TextItemIdentifier[onix:TextItemIDType='06']/onix:IDValue">
                                    <idno>
                                        <xsl:attribute name="type">DOI</xsl:attribute>
                                        <xsl:value-of select="/onix:ONIXMessage/onix:Product/onix:ContentDetail/onix:ContentItem/onix:TextItem/onix:TextItemIdentifier[onix:TextItemIDType='06']/onix:IDValue"/>
                                    </idno>
                                </xsl:if>
                                <!-- ident interne du chapitre-->
                                <xsl:if test="/onix:ONIXMessage/onix:Product/onix:ContentDetail/onix:ContentItem/onix:TextItem/onix:TextItemIdentifier[onix:TextItemIDType='01']/onix:IDValue">
                                    <idno>
                                        <xsl:attribute name="type">ChapterID</xsl:attribute>
                                        <xsl:value-of select="/onix:ONIXMessage/onix:Product/onix:ContentDetail/onix:ContentItem/onix:TextItem/onix:TextItemIdentifier[onix:TextItemIDType='01']/onix:IDValue"/>
                                    </idno>
                                </xsl:if>
                            </analytic>
                            <monogr>
                                <title level="m" type="main">
                                    <xsl:choose>
                                        <xsl:when test="/onix:ONIXMessage/onix:Product/onix:DescriptiveDetail/onix:TitleDetail/onix:TitleElement/onix:TitlePrefix">
                                            <xsl:value-of select="/onix:ONIXMessage/onix:Product/onix:DescriptiveDetail/onix:TitleDetail/onix:TitleElement/onix:TitlePrefix"/>
                                            <!-- concaténation préfix + titre pour reconstitution -->
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="normalize-space(/onix:ONIXMessage/onix:Product/onix:DescriptiveDetail/onix:TitleDetail/onix:TitleElement/onix:TitleWithoutPrefix)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="normalize-space(/onix:ONIXMessage/onix:Product/onix:DescriptiveDetail/onix:TitleDetail/onix:TitleElement/onix:TitleText)"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </title>
                                <xsl:if test="/onix:ONIXMessage/onix:Product/onix:DescriptiveDetail/onix:TitleDetail/onix:TitleElement/onix:Subtitle">
                                    <title level="m" type="sub">
                                        <xsl:value-of select="/onix:ONIXMessage/onix:Product/onix:DescriptiveDetail/onix:TitleDetail/onix:TitleElement/onix:Subtitle"/>
                                    </title>
                                </xsl:if>

                                <!-- identifiant niveau book -->
                                <idno>
                                    <xsl:attribute name="type">ISBN</xsl:attribute>
                                    <xsl:value-of select="/onix:ONIXMessage/onix:Product/onix:ProductIdentifier[onix:ProductIDType='15']/onix:IDValue"/>
                                </idno>
                                <idno>
                                    <xsl:attribute name="type">eISBN</xsl:attribute>
                                    <xsl:value-of select="/onix:ONIXMessage/onix:Product/onix:ProductIdentifier[onix:ProductIDType='15']/onix:IDValue"/>
                                </idno>
                                <xsl:if test="/onix:ONIXMessage/onix:Product/onix:ProductIdentifier[onix:ProductIDType='06']/onix:IDValue">
                                    <idno>
                                        <xsl:attribute name="type">DOI</xsl:attribute>
                                        <xsl:value-of select="/onix:ONIXMessage/onix:Product/onix:ProductIdentifier[onix:ProductIDType='06']/onix:IDValue"/>
                                    </idno>
                                </xsl:if>
                                <idno>
                                    <xsl:attribute name="type">bookID</xsl:attribute>
                                    <xsl:value-of select="/onix:ONIXMessage/onix:Product/onix:RecordReference"/>
                                </idno>
                                <!-- auteurs -->
                                <xsl:apply-templates select="//onix:Product/onix:DescriptiveDetail/onix:Contributor"/>
                                <imprint>
                                    <!-- publisher -->
                                    <xsl:apply-templates select="/onix:ONIXMessage/onix:Product/onix:PublishingDetail/onix:Publisher/onix:PublisherName"/>
                                    <!-- adresse publisher -->
                                    <xsl:apply-templates select="/onix:ONIXMessage/onix:Product/onix:PublishingDetail/onix:CityOfPublication"/>
                                    <!-- date de publication -->
                                    <date type="published" when="{$dateOnix}"/>
                                    <!-- pagination -->
                                    <xsl:variable name="pageFirst">
                                        <xsl:value-of select="/onix:ONIXMessage/onix:Product/onix:ContentDetail/onix:ContentItem/onix:TextItem/onix:PageRun/onix:FirstPageNumber"/>
                                    </xsl:variable>
                                    <xsl:variable name="pageEnd">
                                        <xsl:value-of select="/onix:ONIXMessage/onix:Product/onix:ContentDetail/onix:ContentItem/onix:TextItem/onix:PageRun/onix:LastPageNumber"/>
                                    </xsl:variable>
                                    <xsl:if test="$pageFirst !=''">
                                    <biblScope unit="page" from="{$pageFirst}">
                                        <xsl:value-of select="$pageFirst"/>
                                    </biblScope>
                                    </xsl:if>
                                    <xsl:if test="$pageEnd !=''">
                                        <biblScope unit="page" to="{$pageEnd}">
                                            <xsl:value-of select="$pageEnd"/>
                                        </biblScope>
                                    </xsl:if>
                                    <biblScope unit="total-page-book">
                                        <xsl:value-of select="/onix:ONIXMessage/onix:Product/onix:DescriptiveDetail/onix:Extent/onix:ExtentValue"/>
                                    </biblScope>
                                </imprint>
                            </monogr>
                            <!-- niveau collection -->
                            <xsl:if test="//onix:Collection and //onix:Collection/onix:TitleDetail/onix:TitleElement[onix:TitleElementLevel='02']/onix:TitleText!='Monografies'">
                                <series>
                                    <title level="s" type="main">
                                        <xsl:value-of select="//onix:Collection/onix:TitleDetail/onix:TitleElement[onix:TitleElementLevel='02']/onix:TitleText"/>
                                    </title>
                                    <!-- volume -->
                                    <xsl:apply-templates select="/onix:ONIXMessage/onix:Product/onix:DescriptiveDetail/onix:Collection/onix:TitleDetail/onix:TitleElement/onix:PartNumber"/>
                                </series>
                            </xsl:if>
                        </biblStruct>
                    </sourceDesc>
                </fileDesc>
                <xsl:call-template name="insertVersion"/>
                <profileDesc>
                    <xsl:if test="//onix:Product/onix:DescriptiveDetail/onix:Subject">
                        <xsl:for-each select="//onix:Product/onix:DescriptiveDetail/onix:Subject">
                            <xsl:choose>
                                <!--classification--> 
                                <xsl:when test="onix:SubjectSchemeName='Subject'">
                                    <textClass>
                                        <xsl:attribute name="ana">book-subject</xsl:attribute>
                                        <keywords>
                                            <xsl:call-template name="tokenizeOnix"/>
                                        </keywords>
                                    </textClass>
                                </xsl:when>
                                <!--sujets du livre-->
                                <xsl:otherwise>
                                    <textClass>
                                        <classCode>
                                            <xsl:attribute name="scheme">
                                                <xsl:value-of select="onix:SubjectSchemeName"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="string(onix:SubjectCode)"/>
                                        </classCode>
                                    </textClass>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:if>
                    <!-- language -->
                    <langUsage>
                        <language>
                            <xsl:attribute name="ident">
                                <xsl:value-of select="$codeLang2Onix"/>
                            </xsl:attribute>
                        </language>
                    </langUsage>
                </profileDesc>
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
                </revisionDesc>
            </teiHeader>
            <xsl:choose>
                <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                    <text>
                        <body>
                            <div>
                                <p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
                            </div>
                        </body>
                    </text>
                </xsl:when>
                <xsl:otherwise>
                    <text>
                        <body>
                            <div><p></p></div>
                        </body>
                    </text>
                </xsl:otherwise>
            </xsl:choose>
        </TEI>
    </xsl:template>
    
    <xsl:template match="onix:TitleElement">
        <title level="a" type="main">
            <xsl:if test="$codeLang2Onix">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="$codeLang2Onix"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="onix:TitlePrefix">
                    <xsl:value-of select="onix:TitlePrefix"/>
                    <!-- concaténation préfix + titre pour reconstitution -->
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="normalize-space(onix:TitleWithoutPrefix)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space(onix:TitleText)"/>
                </xsl:otherwise>
            </xsl:choose>
        </title>
        <xsl:if test="onix:Subtitle">
            <title level="a" type="sub">
                <xsl:value-of select="onix:Subtitle"/>
            </title>
        </xsl:if>
    </xsl:template>
   
    <!-- table des auteurs -->
    <xsl:template match="onix:Contributor">
        <author>
            <xsl:choose>
                <xsl:when test="parent::onix:ContentItem">
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
                </xsl:when>
            </xsl:choose>
            <persName>
            <xsl:choose>
                <xsl:when test="contains(onix:PersonNameInverted,',')">
                    <forename type="first">
                        <xsl:value-of select="substring-after(onix:PersonNameInverted,', ')"/>
                    </forename>
                    <surname>
                        <xsl:value-of select="substring-before(onix:PersonNameInverted,',')"/>
                    </surname>
                </xsl:when>
                <xsl:otherwise>
                    <surname>
                        <xsl:value-of select="onix:PersonNameInverted"/>
                    </surname>
                </xsl:otherwise>
            </xsl:choose>
            </persName>
            <roleName>author</roleName>
        </author>
    </xsl:template>
    
    <!-- publisher -->
    <xsl:template match="onix:PublisherName">
        <publisher>
            <xsl:apply-templates/>
        </publisher>
    </xsl:template>
    <xsl:template match="onix:CityOfPublication">
        <pubPlace>
            <xsl:apply-templates/>
        </pubPlace>
    </xsl:template>
    
    <!-- book-subject -->
    <xsl:template match="onix:SubjectHeadingText" name="tokenizeOnix">
        <xsl:param name="text" select="onix:SubjectHeadingText"/>
        <xsl:param name="separator" select="'--'"/>
        <xsl:choose>
            <xsl:when test="not(contains($text, $separator))">
                <term>
                    <xsl:value-of select="normalize-space($text)"/>
                </term>
            </xsl:when>
            <xsl:otherwise>
                <term>
                    <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                </term>
                <xsl:call-template name="tokenizeOnix">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- partNumber niveau collection-->
    <xsl:template match="onix:PartNumber">
        <biblScope unit="vol" >
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>
</xsl:stylesheet>
