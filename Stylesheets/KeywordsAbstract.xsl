<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns="http://www.tei-c.org/ns/1.0" xmlns:els1="http://www.elsevier.com/xml/ja/dtd"    
    xmlns:els2="http://www.elsevier.com/xml/cja/dtd"
    xmlns:rsc="http://www.rsc.org/schema/rscart38"
    xmlns:s1="http://www.elsevier.com/xml/si/dtd"
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>
    
    <!-- KEYWORDS -->

    <!-- BMJ: classinfo, keyword -->
    <!-- NLM 2.2 article: kwd-group, kwd -->
    <!-- Springer: KeywordGroup, Keyword -->
    <!-- Sage: keywords, keyword -->
    <!-- Elsevier: ce:keyword -->

    <!-- IOP: classifications/ puis comme Sage keywords/keyword
              pour l'instant directement traité dans IOP.xsl    -->
    <xsl:template match="kwd-group">
        <xsl:choose>
            <xsl:when test="kwd!=''">
                <textClass ana="keyword">
                    <keywords>
                        <!-- scheme -->
                        <xsl:if test="@kwd-group-type != ''">
                            <xsl:attribute name="scheme">
                                <xsl:value-of select="@kwd-group-type"/>
                            </xsl:attribute>
                        </xsl:if>
                        <!-- langue parfois non présente -->
                        <xsl:variable name="theLanguage">
                            <xsl:choose>
                                <xsl:when test="@Language">
                                    <xsl:value-of select="@Language"/>
                                </xsl:when>
                                <xsl:when test="@lang">
                                    <xsl:value-of select="@lang"/>
                                </xsl:when>
                                <xsl:when test="@xml:lang">
                                    <xsl:if test="@xml:lang">
                                        <xsl:if test="normalize-space(@xml:lang)">
                                            <xsl:value-of select="normalize-space(@xml:lang)"/>
                                        </xsl:if>
                                    </xsl:if>	
                                </xsl:when>
                                <xsl:when test="ancestor::article/@xml:lang != ''">
                                    <xsl:choose>
                                        <xsl:when test="ancestor::article/front/article-meta/article-id[@pub-id-type='doi']='10.1017/S181638311800067X'">en</xsl:when>
                                        <xsl:when test="ancestor::article/front/article-meta/article-id[@pub-id-type='doi']='10.1017/S1816383118000462'">en</xsl:when>
                                        <xsl:when test="ancestor::article/front/article-meta/article-id[@pub-id-type='doi']='10.1017/S2078633610000706'">fr</xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="ancestor::article/@xml:lang"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:when>
                            </xsl:choose>
                        </xsl:variable> 
                        <xsl:if test="$theLanguage">
                            <xsl:if test="$theLanguage != ''">
                                <xsl:attribute name="xml:lang">
                                    <xsl:call-template name="Varia2ISO639">
                                        <xsl:with-param name="code" select="$theLanguage"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </xsl:if>
                        </xsl:if>
                        <xsl:apply-templates select="kwd"/>
                    </keywords>
                </textClass>
            </xsl:when>  
        </xsl:choose>
    </xsl:template>
    <xsl:template match="classinfo | KeywordGroup | keywords">
        <textClass ana="keyword">
            <keywords>
                <!-- scheme -->
                <xsl:if test="@kwd-group-type != ''">
                    <xsl:attribute name="scheme">
                        <xsl:value-of select="@kwd-group-type"/>
                    </xsl:attribute>
                </xsl:if>
                <!-- langue parfois non présente -->
                <xsl:variable name="theLanguage">
                    <xsl:choose>
                        <xsl:when test="@Language">
                            <xsl:value-of select="@Language"/>
                        </xsl:when>
                        <xsl:when test="@lang">
                            <xsl:value-of select="@lang"/>
                        </xsl:when>
                        <xsl:when test="@xml:lang">
                            <xsl:if test="@xml:lang">
                                <xsl:if test="normalize-space(@xml:lang)">
                                    <xsl:value-of select="normalize-space(@xml:lang)"/>
                                </xsl:if>
                            </xsl:if>	
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable> 
                <xsl:if test="$theLanguage">
                    <xsl:if test="$theLanguage != ''">
                        <xsl:attribute name="xml:lang">
                            <xsl:call-template name="Varia2ISO639">
                                <xsl:with-param name="code" select="$theLanguage"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:if>
                <xsl:apply-templates select="*[not(self::ce:section-title|self::Heading)]"/>
            </keywords>
        </textClass>
    </xsl:template>
    <!--elsevier-->
    <xsl:template match="ce:doctopics">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="ce:doctopic">
        <textClass>
            <keywords ana="subject">
                <xsl:apply-templates/>
            </keywords>
        </textClass>
    </xsl:template>
         <xsl:template match="ce:keywords">
             <textClass>
                 <xsl:if test="contains(ce:section-title,'Abbreviations')">
                     <xsl:attribute name="ana">abbreviation</xsl:attribute>
                 </xsl:if>
            <keywords>
                <xsl:if test="normalize-space(@class)">
                    <xsl:attribute name="scheme">
                        <xsl:value-of select="@class"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="normalize-space(ce:section-title)">
                    <xsl:attribute name="ana">
                        <xsl:value-of select="ce:section-title"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="ce:section-title/@id">
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="ce:section-title/@id"/>
                    </xsl:attribute>
                </xsl:if>
                <!-- langue parfois non présente -->
                <xsl:variable name="theLanguage">
                    <xsl:choose>
                        <xsl:when test="@Language">
                            <xsl:value-of select="@Language"/>
                        </xsl:when>
                        <xsl:when test="@lang">
                            <xsl:value-of select="@lang"/>
                        </xsl:when>
                        <xsl:when test="@xml:lang">
                            <xsl:if test="@xml:lang">
                                <xsl:if test="normalize-space(@xml:lang)">
                                    <xsl:value-of select="normalize-space(@xml:lang)"/>
                                </xsl:if>
                            </xsl:if>	
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable> 
                <xsl:if test="$theLanguage">
                    <xsl:if test="$theLanguage != ''">
                        <xsl:attribute name="xml:lang">
                            <xsl:call-template name="Varia2ISO639">
                                <xsl:with-param name="code" select="$theLanguage"/>
                            </xsl:call-template>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="ce:keyword/ce:text">
                        <list>
                            <xsl:apply-templates select="ce:section-title"/>
                            <xsl:apply-templates select="*[not(self::ce:section-title|self::Heading)]"/>
                        </list>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="*[not(self::ce:section-title|self::Heading)]"/>
                    </xsl:otherwise>
                </xsl:choose>
            </keywords>
        </textClass>
    </xsl:template>
    
    <xsl:template match="AbbreviationGroup">
        <textClass ana="abbreviation">
            <keywords scheme="abbreviations">
               <list>
                  <xsl:apply-templates/>
               </list>
            </keywords>
        </textClass>
    </xsl:template>
    <xsl:template match="DefinitionList">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="DefinitionListEntry">
        <item>
            <xsl:apply-templates/>
        </item>
    </xsl:template>
    <xsl:template match="Term">
        <term>
            <xsl:apply-templates/>
        </term>
    </xsl:template>
    <xsl:template match="Description">
        <desc>
            <xsl:apply-templates></xsl:apply-templates>
        </desc>
    </xsl:template>

    <!-- SG - ajout subject NLM/Nature -->
    <xsl:template match="pubfm/subject | suppfm/subject">
        <classCode>
            <xsl:attribute name="scheme">
                <xsl:apply-templates select="@type"/>
            </xsl:attribute>
            <xsl:value-of select="@code"/>
        </classCode>
    </xsl:template>
    
    <xsl:template match="JournalSubjectGroup">
        <keywords scheme="journal-subject">
            <list>
                <xsl:apply-templates select="JournalSubject"/>
            </list>
            </keywords>
    </xsl:template>
    <xsl:template match="JournalSubject">
        <item>
            <xsl:if test="@Code">
                <label>
                    <xsl:apply-templates select="@Code"/>
                </label>
            </xsl:if>
            <term>
                <xsl:attribute name="type">
                    <xsl:apply-templates select="@Type"/>
                </xsl:attribute>
                <xsl:if test="@Priority">
                <xsl:attribute name="subtype">
                    <xsl:text>priority-</xsl:text>
                    <xsl:apply-templates select="@Priority"/>
                </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates/>
            </term>
        </item>
    </xsl:template>

    <!--OUP-->
    <xsl:template match="keyword|rsc:keyword | kwd">
        <xsl:if test=".!=''">
        <xsl:choose>
            <xsl:when test="contains(.,' – ')">
                <xsl:call-template name="ParseKeyword">
                    <xsl:with-param name="theKeyword">
                        <xsl:variable name="substringKeywords">
                            <xsl:apply-templates/>
                        </xsl:variable>
                        <xsl:value-of select="substring-after($substringKeywords,'Keywords: ')"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains(.,'; ')">
                <xsl:call-template name="ParseKeyword">
                    <xsl:with-param name="theKeyword">
                        <xsl:variable name="substringKeywords">
                            <xsl:apply-templates/>
                        </xsl:variable>
                        <xsl:value-of select="substring-after($substringKeywords,'Keywords: ')"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains(.,', ')">
                <xsl:call-template name="ParseKeyword">
                    <xsl:with-param name="theKeyword">
                        <xsl:variable name="substringKeywords">
                            <xsl:apply-templates/>
                        </xsl:variable>
                        <xsl:value-of select="substring-after($substringKeywords,'Keywords: ')"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <!-- Editeur IOP - codes PACS et JSTAT -->
            <xsl:when test="contains(../@kwd-group-type,'pacs')
                or contains(../@kwd-group-type,'jstat')">
                <term>
                    <xsl:attribute name="ana">
                        <xsl:apply-templates/>
                    </xsl:attribute>
                    <xsl:variable name="codePacsNLM">
                        <xsl:value-of select="normalize-space(translate(.,'.',''))"/>
                    </xsl:variable>
                    <!-- J'ai supprimé les points dans les codes car il y a des codes erronés dans les données sources
                    , ces codes sont parfois tronqués - voir ark:/67375/0T8-MZ63G8B9-2-->
                    <xsl:value-of select="normalize-space($titleCodesPACS/descendant::tei:row[translate(tei:cell[@role = 'code']/text(),'.','') = $codePacsNLM]/tei:cell[@role = 'name'])"/>
                </term>
            </xsl:when>
            <xsl:otherwise>
                <term>
                    <xsl:apply-templates/>
                </term>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <!-- springer -->
    <xsl:template match="Keyword">
        <xsl:choose>
            <xsl:when test="contains(.,' – ')">
                <xsl:call-template name="ParseKeyword">
                    <xsl:with-param name="theKeyword">
                        <xsl:variable name="substringKeywords">
                            <xsl:apply-templates/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="contains($substringKeywords,'Keywords:')">
                                <xsl:value-of select="substring-after($substringKeywords,'Keywords: ')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains(.,' –¶')">
                <xsl:call-template name="ParseKeyword">
                    <xsl:with-param name="theKeyword">
                        <xsl:variable name="substringKeywords">
                            <xsl:apply-templates/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="contains($substringKeywords,'Schlüsselwörter')">
                                <xsl:value-of select="substring-after($substringKeywords,'Schlüsselwörter ')"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains(.,'; ')">
                <xsl:call-template name="ParseKeyword">
                    <xsl:with-param name="theKeyword">
                        <xsl:variable name="substringKeywords">
                            <xsl:apply-templates/>
                        </xsl:variable>
                        <xsl:value-of select="substring-after($substringKeywords,'Keywords: ')"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains(.,', ')">
                <xsl:call-template name="ParseKeyword">
                    <xsl:with-param name="theKeyword">
                        <xsl:variable name="substringKeywords">
                            <xsl:apply-templates/>
                        </xsl:variable>
                        <xsl:value-of select="substring-after($substringKeywords,'Keywords: ')"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains(.,'\')">
                <!-- specific Springer pb encodage dans les données source \ désigne ß -->
                <term>
                    <xsl:value-of select="normalize-space(translate(.,'\','ß'))"/>
                </term>
            </xsl:when>
            <xsl:otherwise>
                <term>
                    <xsl:apply-templates/>
                </term>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="ParseKeyword">
        <xsl:param name="theKeyword" select="normalize-space(translate(.,'¶',' '))"/>
        <xsl:param name="inAddress" select="false()"/>
        <xsl:variable name="avantTiret">
            <xsl:choose>
                <xsl:when test="contains($theKeyword,' – ')">
                    <xsl:value-of select="substring-before($theKeyword,' – ')"/>
                </xsl:when>
                <xsl:when test="contains($theKeyword,'; ')">
                    <xsl:value-of select="substring-before($theKeyword,'; ')"/>
                </xsl:when>
                <xsl:when test="contains($theKeyword,', ')">
                    <xsl:value-of select="substring-before($theKeyword,', ')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$theKeyword"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apresTiret">
            <xsl:choose>
                <xsl:when test="contains($theKeyword,' – ')">
                    <xsl:value-of select="normalize-space(substring-after($theKeyword,' – '))"/>
                </xsl:when>
                <xsl:when test="contains($theKeyword,'; ')">
                    <xsl:value-of select="normalize-space(substring-after($theKeyword,'; '))"/>
                </xsl:when>
                <xsl:when test="contains($theKeyword,', ')">
                    <xsl:value-of select="normalize-space(substring-after($theKeyword,', '))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="not($inAddress)">
                <xsl:call-template name="ParseKeyword">
                    <xsl:with-param name="theKeyword" select="normalize-space(translate(.,'¶',' '))"/>
                    <xsl:with-param name="inAddress" select="true()"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <term>
                    <xsl:choose>
                        <xsl:when test="contains($avantTiret,'Keywords: ')">
                            <xsl:value-of select="substring-after($avantTiret,'Keywords: ')"/>
                        </xsl:when>
                        <xsl:when test="contains($avantTiret,'Schlüsselwörter')">
                            <xsl:value-of select="substring-after($avantTiret,'Schlüsselwörter ')"/>
                        </xsl:when>
                        <xsl:when test="contains($avantTiret,'Schlüsselwörter')">
                            <xsl:value-of select="substring-after($avantTiret,'Schlüsselwörter')"/>
                        </xsl:when>
                        <xsl:when test="contains($avantTiret,'Key words')">
                            <xsl:value-of select="substring-after($avantTiret,'Key words ')"/>
                        </xsl:when>
                        <xsl:when test="contains($avantTiret,'Abbreviations: ')">
                            <xsl:value-of select="substring-after($avantTiret,'Abbreviations: ')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$avantTiret"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </term>
                <xsl:if test="$apresTiret !=''">
                    <xsl:call-template name="ParseKeyword">
                        <xsl:with-param name="theKeyword" select="$apresTiret"/>
                        <xsl:with-param name="inAddress" select="true()"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--elsevier-->
    <xsl:template match="ce:keyword">
        <xsl:choose>
            <xsl:when test="parent::ce:keywords">
            <item>
                <xsl:apply-templates/>
            </item>
            </xsl:when>
        <xsl:otherwise>
                <xsl:apply-templates/>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="SubjectCollection">
        <keywords scheme="book-subject-collection">
            <list>
                <label><xsl:value-of select="@Code"/></label>
                <item>
                    <term>
                        <xsl:apply-templates/>
                    </term>
                </item>
            </list>
        </keywords>
    </xsl:template>
    <xsl:template match="BookSubjectGroup">
        <keywords scheme="book-subject">
            <list>
                <xsl:apply-templates select="BookSubject"/>
            </list>
        </keywords>
    </xsl:template>
    <xsl:template match="BookSubject">
        <label><xsl:value-of select="@Code"/></label>
        <item>
            <term>
                <xsl:attribute name="type">
                    <xsl:apply-templates select="@Type"/>
                </xsl:attribute>
                <xsl:if test="@Priority">
                    <xsl:attribute name="subtype">
                        <xsl:text>priority-</xsl:text>
                        <xsl:apply-templates select="@Priority"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates/>
            </term>
        </item>
    </xsl:template>
<!-- -->
    
    <!-- For NLM - EDPS -->

    <xsl:template match="compound-kwd">
        <item>
        <xsl:apply-templates/>
        </item>
    </xsl:template>

    <xsl:template match="compound-kwd-part[@content-type = 'code']">
        <label>
            <xsl:apply-templates/>
        </label>
    </xsl:template>

    <xsl:template match="compound-kwd-part[@content-type = 'keyword']">
        <term>
            <xsl:apply-templates/>
        </term>
    </xsl:template>

    <xsl:template match="kwd-group/title">
        <!-- PL: <head> not allowed under <keywords> -->
        <!--head>
            <xsl:apply-templates/>
        </head-->
    </xsl:template>

    <!-- ABSTRACTS -->

    <!-- BMJ: abstract -->
    <!-- ScholarOne: abstract -->
    <!-- NLM 2.0: Abstract -->
    <!-- NLM 2.3: abstract -->
    <!--  Elsevier:  -->
    <!-- PL: removed, Elsevier abstracts are processed in Elsevier.xsl -->
    <!-- Springer: Abstract, Heading, Para -->
	<!-- PL: this could be moved to KeywordsAbstract.xsl when generalised to all publishers -->
    <xsl:template match="abstract |rsc:abstract |trans-abstract | Abstract | els1:head/ce:abstract | els2:head/ce:abstract | head/ce:abstract | fp | abs | execsumm | websumm">
        <xsl:variable name="normalizeAbstractHead">
            <xsl:value-of select="normalize-space(translate(head[1]|title[1]|Heading[1],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz'))"/>
        </xsl:variable>
        <xsl:variable name="normalizeAbstract">
            <xsl:value-of select="translate(p[1]|Para[1],'ABCDEFGHIJKLMNOPQRSTUVWXYZ&#160;','abcdefghijklmnopqrstuvwxyz ')"/>
        </xsl:variable>
        <!-- 09/2022 non reprise des abstracts type graphical car ce ne sont pas des résumés -->
        <xsl:choose>
            <xsl:when test="contains(title[1],'TABLE DES MATIÈRES')"/>
            <!-- abstracts contenant "No abstract is available for this article" écartés et d'autres variantes-->
            <xsl:when test="starts-with($normalizeAbstract,'no abstract')"/>
            <xsl:when test="starts-with($normalizeAbstractHead,'no abstract')"/>
        <xsl:when test="not(contains(@class,'graphical'))">
            <xsl:if test=".!=''">
        <abstract>
			    <!-- Karger ebooks tous les abstracts sont en anglais-->
            <xsl:if test="@abstract-type !=''">
                <xsl:attribute name="ana">
                    <xsl:value-of select="@abstract-type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="//publisher-name='S. Karger AG'">
                <xsl:attribute name="xml:lang">en</xsl:attribute>
            </xsl:if>
			    <xsl:variable name="theLanguage">
	                <xsl:choose>
	                    <xsl:when test="@Language !='--'">
	                        <xsl:choose>
	                            <xsl:when test="Heading ='Аннотация'">ru</xsl:when>
	                            <xsl:when test="Heading ='Аннотациа'">ru</xsl:when>
	                            <xsl:when test="Heading ='Краткое содержание'">ru</xsl:when>
	                            <xsl:when test="Heading ='--Реэюме'">ru</xsl:when>
	                            <xsl:when test="Heading ='Súhrn'">sk</xsl:when>
	                            <xsl:when test="Heading ='Souhrn'">cs</xsl:when>
	                            <xsl:when test="Heading ='Conclusie'">nl</xsl:when>
	                            <xsl:when test="Heading ='Conclusies'">nl</xsl:when>
	                            <xsl:when test="Heading ='Samenvatting'">nl</xsl:when>
	                            <xsl:when test="Heading ='Резюме'">ru</xsl:when>
	                            <xsl:otherwise>
	                                <xsl:value-of select="translate(@Language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
	                            </xsl:otherwise>
	                        </xsl:choose>
	                    </xsl:when>
	                    <xsl:when test="@Language ='--'">
	                        <xsl:choose>
	                            <xsl:when test="Heading ='Аннотация'">ru</xsl:when>
	                            <xsl:when test="Heading ='Аннотациа'">ru</xsl:when>
	                            <xsl:when test="Heading ='Краткое содержание'">ru</xsl:when>
	                            <xsl:when test="Heading ='--Реэюме'">ru</xsl:when>
	                            <xsl:when test="Heading ='Súhrn'">sk</xsl:when>
	                            <xsl:when test="Heading ='Souhrn'">cs</xsl:when>
	                            <xsl:when test="Heading ='Conclusie'">nl</xsl:when>
	                            <xsl:when test="Heading ='Conclusies'">nl</xsl:when>
	                            <xsl:when test="Heading ='Samenvatting'">nl</xsl:when>
	                            <xsl:when test="Heading ='Резюме'">ru</xsl:when>
	                        </xsl:choose>
	                    </xsl:when>
	                    <xsl:when test="@lang">
	                        <xsl:value-of select="@lang"/>
	                    </xsl:when>
	                    <xsl:when test="@xml:lang">
							<xsl:if test="@xml:lang">
							    <xsl:if test="normalize-space(@xml:lang)">
							        <xsl:value-of select="normalize-space(@xml:lang)"/>
								</xsl:if>
							</xsl:if>	
	                    </xsl:when>
	                    <xsl:otherwise>
	                        <xsl:text>en</xsl:text>
	                    </xsl:otherwise>
	                </xsl:choose>
	            </xsl:variable> 
	            <xsl:if test="$theLanguage">
					<xsl:if test="$theLanguage != ''">
	                    <xsl:attribute name="xml:lang">
	                        <xsl:call-template name="Varia2ISO639">
	                            <xsl:with-param name="code" select="$theLanguage"/>
	                        </xsl:call-template>
	                    </xsl:attribute>
					</xsl:if>
	            </xsl:if>
				<!-- PL: only paragraphs are taken because <div> are not allowed under <abstract> currently -->
				<!--<xsl:apply-templates select="*/ce:simple-para"/>-->
	            <xsl:choose>
	                <!-- springer-journals correction erreur éditeur -->
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0004-6'"><p>In nuclear and radiochemistry the concepts of specific activity, radioactive concentration, carrier, carrier-free, and no-carrier-added play important roles. It turns out that these concepts involve various ñ and sometimes conflicting ñ interpretations and definitions. The most recent IUPAC recommendations on these concepts will be given and discussed as to their correctness, relevance, clarity, and consistency. On basis of this discussion, tentative suggestions will be given for revised definitions of the concepts listed.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0015-3'"><p>Three independent speciation techniques, the free liquid/moving boundary electrophoresis, ultrafiltration, and equilibrium dialysis, combined with the radiotracer method (using 152Eu) have been compared at the study of Eu interaction with humic acid (HA). The degree of complexation of Eu in 10 mg/l Aldrich HA solutions was determined within a broad range of metal loading (Eu total concentration 10–8–10–4 mol.l–1), at pH 4 and 6, ionic strength of 0.01 and 0.1 (NaClO4). From the anodic electrophoretic mobilities determined, additional information on the charge of the EuHA complexes was obtained. Uncertainty of the determination given by sorption losses of Eu on the walls and membranes of the experimental devices, and the effect of kinetic lability of the Eu-HA complexes are estimated. Based on the ultrafiltration experiments, the existence of an unknown, labile, high-molecular non-humic Eu species is discussed. </p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0037-x'"><p>The results of radioecological investigations in the Syrdarya river basin in the Republic of Kazakhstan are presented. The work was carried out under the International Navruz Project. Nuclear activation analysis, X-ray fluorescence, and -spectrometry were used to measure the element and radionuclide (137Cs, 40K and 238U, 235U, and 232 Th families) compositions of soil, water, bottom sediments and vegetation. Samples were collected at 15 control points in Kazakhstan along the Syrdarya river and its inflows during four expeditions (autumn 2000 and 2001, spring 2001 and 2002).</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0042-0'"><p>The International Data Centre of the Comprehensive Nuclear-Test-Ban Treaty Organisation receives atmospheric radioactivity data from the monitoring stations of the International Monitoring System. The Centre is a processing hub through which raw data and analysis results flow to Treaty Member States. Data are processed automatically upon receipt, and then interactively reviewed and screened for detection of CTBT-relevant radionuclides. Atmospheric back-tracking for source location is included in the IDC functions. This paper describes the role of the IDC in this verification effort, the types of radionuclide monitoring data received, the automatic and interactive processing, and the products distributed to Member States.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0026-0'"><p>Missouri University, a recipient of a U.S. Department of Energy Radiochemistry Education Award Program (REAP) grant in 1999, has significantly expanded its education and research mission in radiochemistry. While MU had a viable radiochemistry program through existing faculty expertise and the utilization of the Missouri University Research Reactor, the REAP award allowed MU to leverage its resources in significantly expanding capabilities in radiochemistry. Specifically, the grant enabled the: (1) hiring of a new faculty member in actinide radiochemistry (Dr. Paul Duval); (2) support of six graduate students in radiochemistry; (3) purchase of new radiochemistry laboratory equipment; (4) more extensive collaboration with DOE scientists through interactions with faculty and graduate students, and (5) revised radiochemical curriculum (joint courses across disciplines and new courses in actinide chemistry). The most significant impact of this award has been in encouraging interdisciplinary education and research. The proposal was initiated by a joint effort between Nuclear Engineering and Chemistry, but also included faculty in biochemistry, radiology, and molecular biology. Specific outcomes of the REAP grant thus far are: (1) increased educational and research capabilities in actinide chemistry (faculty hire and equipment acquisition); (2) increased integration of biochemistry and radiochemistry (e.g., radiochemical analysis of uranium speciation in biological systems); (3) stronger interdisciplinary integration of molecular biology and radiochemical sciences (alpha-emitters for treating cancer); (4) new and more extensive interactions with national laboratory facilities (e.g., student internships at LANL and LLBL, faculty and lab scientist exchange visits, analytical measurements and collaboration with the Advanced Photon Source), and (7) new research funding opportunities based on REAP partnership.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0038-9'"><p>As part of an international collaboration (the Navruz Project) between Kazakhstan, Kyrgyzstan, Tajikistan, Uzbekistan, and the United States of America on transboundary river monitoring, the Radiometric Laboratory of the Institute of Physics in Kyrgyzstan measured the isotopic composition of uranium (as measured by , the ratio of activities of 234U/238U) for the water of the Naryn River basin. This ratio varies from 1.5 to 1.9 due to natural causes. The results point to the lack of the technogenic uranium along the Naryn River through territory of the Kyrgyz Republic and to the contamination of the Mailuu-Suu River by technogenic uranium from tailing dumps in the area. The share of technogenic uranium transported to Uzbekistan does not exceed 30%, and the total uranium content is considerably lower than the maximum admissible concentration (MAC) and is almost an order of magnitude lower than that of potable waters of the Chui Valley of Kyrgyz Republic.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0046-9'"><p>Some environmental xenon sampling like the Automated Radioxenon Sampler-Analyzer (ARSA) and the Swedish Automated Noble Gas Unit (SAUNA), use - coincidence detectors that are energy dispersive on both the and axes. Applying conventional region-of-interest (ROI) analysis algorithms to such 3-D spectra is problematic due to spectral interferences in the low-resolution spectra. Deconvolving the 3-D sample spectra into the most probable combination of signals using non-negative least-squares results shows promise to robustly resolve the spectral interferences. This paper describes the multiple isotope component analysis (MICA) algorithm developed for analysis of 3-D - spectra from xenon sampling and measurement units.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0010-8'"><p>Radioanalytical techniques have been applied in a study on (subclinical) hepatitis in Dobermann dogs. Cu levels in transcutaneous obtained full liver biopsies were quantified using INAA and 66Cu. A copper excretion study was performed in a group of completely normal Dobermann dogs and in six Dobermanns with elevated copper levels and suffering from subclinical hepatitis. 64Cu2+ was used to assess whether a normal bile flow and thus excretion was possible. All subjects underwent separately from this 64Cu2+ excretion study a 99mTc-Bis-IDA scintigraphy. The Cu levels in liver of these hepatitis patients vary from 600 to 1600 mg.kg–1 whereas 100–300 mg.kg–1 is probably normal for healthy Dobermann dogs. These Cu levels match fully with histopathology results and clinical observations. Measurements during a 2 years’ evaluation period showed a clear relation between the existence of subclinical hepatitis and increased Cu levels without a sign for cholestasis or an abnormal bile flow.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0016-2'"><p>A radiotracer method, initially developed to analyze migration from retail plastic food packaging into food simulants, has been developed to assess the measurement of inorganic contaminants migrating from recycled paper and board into real food. This new radiotracer method has been applied to the study of 10 food samples and their corresponding recycled paper and board packaging. Samples of paper and board were irradiated in a thermal neutron flux of 1.26.1016 n.m–2.s–1 for 15 hours to activate elements of interest. After a decay period of 10 days the paper and board was placed in contact with the corresponding foodstuff. The food was analyzed for any radioactivity migrating from the packaging by gamma-ray spectrometry. Samples were analyzed regularly during the 90 days contact time. Detection limits for the determination of migration was as low as a few µg/kg in the food. Results from the migration study have shown that, of the 60 elements measured, only Zn and Fe were detected in food, at concentrations of 0.012–0.25, and 0.045–0.11 mg/kg, respectively. This was despite the recycled paper and board samples being highly elevated in many other elements such as Cr (0.9–15.1 mg/kg) and Ba (3.3–75.4 mg/kg). The level of migration of Zn and Fe into food from packaging was insignificant compared to the UK recommended daily allowances of 15 mg, and, therefore, represented no hazard to human health.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0035-z'"><p>The International Monitoring System is part of the global verification system of the Comprehensive Nuclear-Test-Ban Treaty and comprises an atmospheric radioactivity monitoring network of 80 particulate stations, 40 of which are to be equipped with noble-gas-detection capability. The network is supported by 16 radionuclide laboratories. The equipment has to be tailored to different environments and its reliability is proving to be an operational challenge.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0011-7'"><p>An extractive scintillating (ES) resin was evaluated for its performance as an on-line monitor of uranium in water. The TRU-ES resin is comprised of an inert macroporous polystyrene core impregnated with the organic fluors [diphenyloxazole (PPO) and 1,4-bis-(4-methyl-5-phenyl-2oxazolyl)benzene (DM-POPOP)) and the selective extract (octyl(phenyl)-N, N-diisobutyl-carbamoylmethylphosphine oxide (CMPO) in tri-butyl phosphate (TBP)]. The TRU-ES resin, packed into translucent FEP Teflon tubing, was placed into a flow-cell scintillation detection system. Acidified aqueous solutions, 233U spiked synthetic ground water and EPA natural uranium QA samples, were pumped through the flow-cell while gross count rate and pulse-height spectra were collected. The increase in count rate is attributed to the uranium being extracted from the aqueous medium and retained by the TRU-ES resin with simultaneous detection of the resultant scintillation photons. The TRU-ES loading efficiency was nearly quantitative out of 2M HNO3 with a flow rate of 0.5 ml.min–1. The detection efficiency was measured to be 51% for 233U. The detection limit was determined to be ~2 Bq.l–1 for 233U based on a resin free column volume of 0.2 ml, and 50 ml of 2M HNO3 acidified groundwater.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0007-3'"><p>An instrumentation and a method have been developed to investigate the growth of plant roots by injection of 75Se radioactive isotope in the stem base. Since the isotope is transferred into the active root, it is possible to investigate where the growth occurs in the soil profile. The distribution of radioactivity in the root system is measured by means of an automatic detection equipment controlled by a portable PC. The design of the detection probe is discussed and its field use is surveyed. The whole instrumentation is compact and can easily be used to study the effects of irrigation and fertilization on crops growing under field conditions. The results obtained in the field tests show how the levels of nutrients and moisture influence the root development.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0022-4'"><p>Uses of radioisotopes and radiation in medicine, industry, agriculture are amongst the most beneficial applications of atomic energy for peaceful purposes. The International Atomic Energy Agency aims – in accordance with its statute – to accelerate and enlarge the contribution of atomic energy to peace, health and prosperity throughout the world. The various Technical Divisions of the Agency carry out this mandate and enhance, particularly through ‘manpower development activities’ the nuclear applications of radiation and isotopes. Staff members of the ‘Industrial Applications and Chemistry Section’ in the Department of Nuclear Sciences and Applications of the IAEA have supported more than 600 trainees per year for education in nuclear and radiochemistry through fellowships, training courses and workshops. Provision of printed material in various disciplines is supporting our educational efforts.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0031-3'"><p>In this paper, the use of a combined X-ray and neutron source for security inspections based on Inertial Electrostatic Confinement (IEC) fusion is discussed. Current inspection systems typically use X-ray techniques, but thermal neutron analysis (TNA) and fast neutron analysis (FNA), allow expanded detection of certain types of explosives. The integrated unit proposed here uses three separate IEC sources producing 14 and 2.45 MeV neutrons plus soft X-rays. This combination allows multiple detection methods with the composite signal analysis being done by a fuzzy logic system, significantly reducing false signals.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0017-1'"><p>In nuclear and radiochemistry the concepts of specific activity, radioactive concentration, isotopic and non-isotopic carrier, carrier-free and nocarrier-added are of paramount relevance. In fact, traces of carrier are easily introduced in the radioactive preparations by their presence in the target material, by equipment and chemicals used in target processing, and may also be produced by side nuclear reactions induced in the target by nuclear activation, sometimes followed by a decay chain. Very sensitive analytical and radioanalytical techniques allow the determination of the real value of specific activity of no-carrier-added radionuclides and labeled compounds. Thus, in this paper we show with several examples that in most practical cases the term carrier-free (CF) is used improperly and has to be substituted by the more suitable term no-carrier-added (NCA). Carrier-free radionuclides and labeled compounds do exist in a few selected cases only.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0041-1'"><p>This article presents the results of the investigation on radionuclide contamination, physical and chemical forms of plutonium in soil samples of various zones at the territory of the Semipalatinsk Nuclear Test Site (SNTS), and the analysis of these results in connection with characteristics of the performed tests. There was revealed the character of various sites differing by concentration level, 239+240Pu to 241Am concentration ratios, presence forms, area distribution, and magnetic fractions of transuranic radionuclides.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0045-x'"><p>We have developed an analysis pipeline for air filter gamma-ray spectra, utilizing the software packages UNISAMPO for peak analysis and SHAMAN for nuclide identification. In an automated usage mode, spectra that are received via e-mail are processed into a directory tree, analyzed with UNISAMPO and SHAMAN, and finally categorized on the basis of the analysis results. Alarms are generated if anything out of the ordinary is observed. Typical applications for an air filter analysis pipeline are national radioactivity surveillance networks and the global radionuclide monitoring network being implemented for verification of the Comprehensive Nuclear-Test-Ban Treaty (CTBT). Our analysis pipeline system has been used by the Finnish national CTBT-authority, the Finnish National Data Center (FiNDC), since July 1999. Evaluation with a randomly selected set of 1518 air filter spectra showed that our pipeline system produces significantly better analysis results than that utilized by the CTBT Organization (CTBTO): our system found 4.2 more peaks per spectrum than the CTBTO system (9 % increase) and identified 5.6 more peaks per spectrum (14 % increase) on the average.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0009-1'"><p>Isotope dilution analysis (IDA) based on solvent extraction has been developed for the determination of zinc in the blood of diabetic patients and healthy adults as controls. The method using 65Zn as a tracer is based on the formation of a red colored complex with dithizone in chloroform which is measured by counting of the 1115 keV -rays by gamma-ray spectrometry. Various extraction parameters such as pH, nature of solvent and amount of reagent were optimized. Zinc concentration in diabetic patients ( n = 10) was found in a much wider range (1.5–157 µg/ml) compared to those in healthy adults (3.1–95.9 µg/ml for n = 5). t-Test of data shows 80–90% confidence limits. A comparison of mean values, 28.5±48.5 µg/ml for diabetics and 33.1±34.5 µg/ml for controls shows 13.9% lower zinc concentration in diabetics. No correlation was found with eating (vegetarian/nonvegetarian)/drinking or smoking habits, but in general, females showed somewhat lower concentration compared to those in males though population size in each case was very small.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0044-y'"><p>A novel method to measure beta-gamma coincidences using a phoswich detector with state-of-the-art pulse shape discrimination techniques has been investigated. A thin CaF2(Eu) and thick NaI(Tl) crystal phoswich detector has been built and tested using gamma and beta test sources as well as xenon gas. The two types of radiation are distinctly seen in the signal processing electronics based on pulse shape analysis. Preliminary results indicate that it will be difficult to achieve sufficient discrimination of the pulse types in application to beta-gamma coincident counting.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0006-4'"><p>A novel radiochemical separation for 48V radiotracer in no-carrier-added (NCA) form, via proton irradiation on Ti targets of natural isotopic composition has been developed. Metallic Ti targets irradiated with 21 MeV proton beam energy was submitted to a selective radiochemical separation consisting of an alkaline fusion-precipitation step, followed by column Chelex-100 chromatographic purification. Very high specific activity 48V, at levels of hundreds MBq.µg–1 was prepared. Chemical analysis of radiotracer was carried out by ET-AAS and INAA. The decontamination factor from Ti target was 5 .105, with an overall radiochemical yield for 48V larger than 90%. The NCA 48V has used for labeling a range of chemical forms of V(III, IV, V) and applied in the study of metabolic behavior of different chemical forms in in-vivo and in-vitro experiments on rats and cell cultures.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0027-z'"><p>The United States, the Department of Energy (DOE) and its National Laboratories, including the Pacific Northwest National Laboratory (PNNL), are facing a serious attrition of nuclear scientists and engineers and their capabilities through the effects of aging staff. Within the DOE laboratories, 75% of nuclear personnel will be eligible to retire by 2010. It is expected that there will be a significant loss of senior nuclear science and technology staff at PNNL within five years. PNNL&apos;s nuclear legacy is firmly rooted in the DOE Hanford site, the World War II Manhattan Project, and subsequent programs. Historically, PNNL was a laboratory where 70% of its activities were nuclear/radiological, and now just under 50% of its current business science and technology are nuclear and radiologically oriented. Programs in the areas of nuclear legacies, global security, nonproliferation, homeland security and national defense, radiobiology and nuclear energy still involve more than 1,000 of the 3,800 current laboratory staff, and these include more than 420 staff who are certified as nuclear/radiological scientists and engineers. This paper presents the current challenges faced by PNNL that require an emerging strategy to solve the nuclear staffing issues through the maintenance and replenishment of the human nuclear capital needed to support PNNL nuclear science and technology programs.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0025-1'"><p>In this paper, a description is made of the survey that was undertaken, for the first time, about the situation of radiochemistry activities in the Region of Latin America, comprising twenty countries from South America, Central America and the Caribbean. It became clear from this study that very strong differences exist between the countries and that most of the nuclear facilities in operation, such as nuclear reactors, hot cells, radiochemical laboratories and cyclotrons are concentrated in seven countries, accompanied by research and educational activities. A detailed study of the situation and trends in the Latin American countries is presented, as regards teaching and other activities related to Radiochemistry, as well as a series of suggestions for preservation of knowledge in the field.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0036-y'"><p>Sandia National Laboratories collects bioassay samples to monitor individuals for possible exposure to uranium and thorium as part of ongoing medical surveillance of employees. The current analytical methods involve separation chemistry and alpha-spectrometry for isotopic measurements or kinetic phosphorescence analysis for total uranium. There are several areas where this monitoring can be improved (e.g., analysis times and accurate isotopic ratio measurements). In addition, in case of accidents or exposure to people who are not routinely monitored, the optimum window for collecting bioassay samples may be missed. An example of this scenario is the recent concern over the exposure of civilians to depleted uranium from military ammunition in Kosovo and Kuwait. For these cases, hair may be an alternative bioassay. Analytical procedures utilizing an inductively coupled plasma mass spectrometer (ICP-MS) have been developed that have simplified sample processing and improved the isotopic ratio measurements. The focus of this study is to survey the background levels for 235U, 236U, 238U, and 232 Th isotopes in hair, urine, and drinking water which could be used to determine action levels for follow-up monitoring. In addition, variations of 238U to 235U mass ratio for the background samples are measured. The analytical procedures, achieved detection limits, observed background distributions, and the results of uranium isotope ratio tests are presented.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0039-8'"><p>In March of 2000, scientists from four nuclear physics research institutes in the Central Asia Republics of Kazakhstan, Kyrgyzstan, Tajikistan, and Uzbekistan, and the U.S. Sandia National Laboratories embarked on a three-year cooperative transboundary river monitoring experiment. The experiment, named Navruz (meaning “new beginning”), uses standardized methods to monitor basic water quality parameters, radionuclides, and metals in the Syr Darya and Amu Darya rivers. Overall, the project addresses three main goals: (1) to help increase capabilities in Central Asian nations for sustainable water resources management; (2) to provide a scientific basis for supporting nuclear transparency and non-proliferation in the region; and (3) to help reduce the threat of conflict in Central Asia over water resources. Contamination of these rivers is a result of growing population, urbanization, agricultural uses, and radioactive and metals contamination from a legacy of uranium mining, industry, and other activities of the former Soviet Union. The project focuses on waterborne radionuclides and metals because of the importance of these contaminants to public health and political stability in Central Asia. Moreover, the method of enabling scientists from bordering countries to study a transboundary problem, can lead to a greater scientific understanding, consensus on necessary mitigation steps, and ultimately the political resolution of the issue. The project scope, approach, and preliminary results are presented.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0012-6'"><p>Self Assembled Monolayers on Mesoporous Supports (SAMMS) are nanostructured silica sorbents that offer fast uptake kinetics, high material loading, and excellent selectivity. We have found that these materials rapidly preconcentrate radionuclides from solution and enable direct assay. We will discuss the utilization of SAMMS for measurement of alpha-, beta- and gamma-emitters. The issues involved in direct counting of SAMMS with various methods are explored. We will discuss the advantages, challenges, and limitations involved in using SAMMS for radiochemical analysis.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0023-3'"><p>Given the mismatch between supply of and demand for nuclear scientists, education in nuclear and radiochemistry has become a serious concern. The Nuclear and Radiochemistry in Chemistry Education (NRIChEd) Curriculum Project was undertaken to reintroduce the topics normally covered in a one-semester radiochemistry course into the traditional courses of a four-year chemistry major: general chemistry, organic chemistry, quantitative and instrumental analysis, and physical chemistry. NRIChEd uses a three-pronged approach that incorporates radiochemistry topics when related topics in the basic courses are covered, presents special topics of general interest as a vehicle for teaching nuclear and radiochemistry alongside traditional chemistry, and incorporates the use of non-licensed amounts of radioactive substances in demonstrations and student laboratory experiments. This approach seeks not only to reestablish nuclear science in the chemistry curriculum, but to use it as a tool for elucidating fundamental and applied aspects of chemistry as well. Moreover, because of its relevance in many academic areas, nuclear science enriches the chemistry curriculum by encouraging interdisciplinary thinking and problem solving.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0014-4'"><p>Liquid-liquid extraction is used for one-atom-at-a-time separations of transactinide elements from heavy-ion reaction product mixtures. It is suitable for this purpose because it is fast, provided that a chemical system with negligible kinetics is used, and it can be used for continuous separations. It is, however, not quite easy to determine the uncertainties of the measured distribution coefficients or complex formation constants. In this paper methods for such estimates will be discussed.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0018-0'"><p>Radiochemistry laboratories are challenged to find efficient methods to handle a wide variety of sample types and sizes. To achieve accurate results, required decontamination factors and low detection limits, methods adequate for smaller, simpler matrices may need to be enhanced. This paper will review recent presentations made during Eichrom Users’ Workshops. These include methods and data involving the analysis of actinides in large soil samples, 90Sr in bone, uranium in air filters containing significant 210Po and 99Tc in samples high in 234 Th.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0032-2'"><p>The Federal Radiological Monitoring and Assessment Center (FRMAC) is authorized by the Federal Radiological Emergency Response Plan to coordinate all off-site radiological response assistance to state and local governments, in the event of a major radiological emergency in the United States. The FRMAC is established by the U.S. Department of Energy, National Nuclear Security Administration, to coordinate all Federal assets involved in conducting a comprehensive program of radiological environmental monitoring, sampling, radioanalysis, quality assurance, and dose assessment. During an emergency response, the initial analytical data is provided by portable field instrumentation. As incident responders scale up their response based on the seriousness of the incident, local analytical assets and mobile laboratories add additional capability and capacity. During the intermediate phase of the response, data quality objectives and measurement quality objectives are more rigorous. These higher objectives will require the use of larger laboratories, with greater capacity and enhanced capabilities. These labs may be geographically distant from the incident, which will increase sample management challenges. This paper addresses emergency radioanalytical capability and capacity and its utilization during FRMAC operations.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0040-2'"><p>This paper presents the results of radioecological investigation of Central Asian rivers. This work was done as part of the Navruz Project, a cooperative, transboundary river monitoring project involving rivers and institutions in Kazakhstan, Kyrgyzstan, Tajikistan, and Uzbekistan, and facilitated by Sandia National Laboratories in the United States. The study of waterborne radionuclides and metals concentrations in Central Asia is of particular interest because of the history of nuclear materials mining, fabrication, transport, and storage there, when it was part of the Soviet Union. This development left a legacy of radionuclides and metals contamination in some Central Asian regions, which poses a clear health hazard to populations who rely heavily upon surface water for agricultural irrigation and direct domestic consumption.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0013-5'"><p>An analytical system is suggested to separate a number of elements of the Periodic Table in a hydrogen or oxygen stream at temperatures up to 1400 °C. High temperature chemical filters are used to separate volatile products. The approach has demonstrated its efficiency in a number of examples of carrier-free isotope production from targets irradiated at an accelerator: 109Cd from In; 22Na from Al; 72Se from GaAs; 188Pt, 183Re, 185Os and 201Tl from Pb or Bi; separation of Po from Pb and Bi, etc. Another application of high temperature chemical sublimation of elements and oxides was realized in activation analysis of noble metals in various ores and samples. </p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0033-1'"><p>A performance comparison of a CdTe and a CdZnTe detector when exposed to uranium samples of various isotopic enrichments has been performed. These high-resolution detectors can assist in the rapid determination of uranium isotopic content of illicit material. Spectra were recorded from these “room temperature” semiconductor detectors with a portable multi-channel analyzer, both in the laboratory and in a field environment. Both detectors were operated below ambient temperature using the vendor supplied thermoelectric coolers. Both detectors had nominally the same active volume (18 mm3 for the CdZnTe and 25 mm3 for the CdTe detector) and resolution (i.e., &lt;1.0 keV resolution FWHM at 59.5 keV). Spectra of samples of known isotopic content were recorded at fixed geometries. An evaluation of potential signature -rays for the detection of enriched uranium was completed. Operational advantages and disadvantages of each detector are discussed.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0008-2'"><p>The first results are presented from some experiments aimed to determine the porosity and different capacity to absorb humidity from soil of several pre-hispanic building materials covered with mural painting which are under restoration at present. The main destructive agents are not coming from external weather conditions, but from humidity originated in the soil with a great variety of dissolved salts. In the laboratory small prism shaped samples of the same raw materials utilized in ancient times have been tested and put in contact with a 1% Na2SO4 solution labeled with 22Na during fixed time periods. In this way, counts obtained divided by weight of each sample gives a figure approximately proportional to its porosity or capacity to absorb humidity from soil, making possible to compare the difference of this condition for several materials, and to test the efficiency of the proposed methods to control this problem. One suitable way to achieve it, seems to be the use of one solution of BaAc, plus thiourea and methyl-methacrylate, in order to form a solid polymer. This method works reasonably well at laboratory level, and even when it has not been tested in the real scale, seems to be cheap and easy enough to slow down the increasing deterioration due to humidity and salts deposits coming from soil. However, even when this polymer is completely insoluble in water, the start of the reaction to form it requires the final addition of hydrogen peroxide, and temperature increase till the boiling point of the reagents, which may be too aggressive for ancient dyes and raw materials. Thus, the use of the so called French gelatin is proposed, and results at laboratory level are considered to chose the material better suitable at real scale with a minimum risk for the material.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0021-5'"><p>Since the 1970’s, concern about the training of radiochemists in the US has been increasing along with the age of nuclear work force, while the number of academic institutions offering undergraduate courses and the number of radiochemistry faculty has been steadily decreasing. To address this problem, a summer program has been offered through the American Chemical Society to undergraduates since 1984. Students compete nationally for this opportunity, and those selected receive a $3,000 stipend. In addition, all other expenses are paid. In this manuscript, the curriculum is described, along with the need for additional training programs and their impact.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0005-5'"><p>The fission of highly enriched uranium (HEU) by thermal neutrons creates dozens of isotopic products. The Isotope and Nuclear Chemistry Group participates in programs that involve analysis of “fresh” fission products by beta counting following radiochemical separations. This is a laborious and time-consuming process that can take several days to generate results. Gamma-spectroscopy can provide a more immediate path to isotopic activities, however, short-lived, high-yield isotopes can swamp a gamma-spectrum, making difficult the identification and quantification of isotopes on the wings and valley of the fission yield curve. The gamma-spectrum of a sample of newly produced fission products is dominated by the many emissions of a very few high-yield isotopes. Specifically, 132Te (T1/2 = 3.2 d), its daughter, 132I (T1/2 = 2.28 h), 140Ba (T1/2 = 12.75 d), and its daughter 140La (T1/2 = 1.68 d) emit at least 18 gamma-rays above 100 keV that are greater than 5% abundance. Additionally, the 1596 keV emission from 140La imposes a Compton background that hinders the detection of isotopes that are neither subject to matrix dependent fractionation nor gaseous or volatile precursors. Some of these isotopes of interest are 111Ag, 115Cd, and the rare earths, 153Sm, 154Eu, 156Eu, and 160Tb. C-INC has performed an HEU irradiation and also “cold” carrier analyses by ICP-AES to determine methods for rapid and reliable separations that may be used to detect and quantify low-yield fission products by gamma-spectroscopy. Results and progress are presented.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0030-4'"><p>A Summer School in Nuclear Chemistry sponsored by the U. S. Department of Energy and the American Chemical Society has been held at San José State University for the past 20 years. The intent of the program is to introduce outstanding college students to the field of nuclear and radiochemistry with the goal that some of these students will consider careers on nuclear science. The program features radiochemistry experiments along with radiation safety training, guest lectures by well known nuclear scientists and field trips to nuclear chemistry facilities in the San Francisco area.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0020-6'"><p>The MARC-VI conference served as an excellent setting for a session organized to present and discuss the problems in nuclear science manpower and education. A panel discussion and contributed papers reflected the world-wide situation. This paper presents the major points of the panel discussion. As a result, a resolution on the current situation of nuclear chemistry and radiochemistry was drafted and endorsed by the conference attendees.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0028-y'"><p>The U.S. Department of Energy supports 24 fellowships for students to attend six-week programs at either San Jose State University in California, or Brookhaven National Laboratory (BNL) in New York. The American Chemical Society through the Division of Nuclear Science and Technology operates both schools. The twelve students at the BNL program are enrolled in the State University of New York at Stony Brook (SUNYSB) and receive 3 college credits for the lecture course (CHE-361) and 3 additional credits for the laboratory course (CHE-362). In addition to lectures and laboratories, students tour various nuclear facilities offsite, at BNL, and at SUNYSB. Opportunities are given the students to interact with faculty and scientists within the profession through the Guest Lecture Program. Further details are discussed along with results of student surveys for the years 1999 through 2002.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0019-z'"><p>The sorption of Pu(VI) by synthetic hydroxyapatite was determined in NaClO 4 media. Pu(VI) sorption was determined to be rapid with equilibrium attained in 2 hours. Equilibrium experiments indicated sorption to be pH dependent with distribution constants, log Kd values, ranging from 4.11 at pH 6 to 5.92 at pH 8.5. Data collected at pH 8.0 with varying total Pu(VI) were fit to the Langmuir isotherm and yielded Langmuir constants of Ca = 0.0147 mole/mole and K = 1.71.108 l/mole. Although varying ionic strength did not have an effect on Pu(VI) sorption, a decrease in sorption was evident at high calcium and phosphate concentrations.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0024-2'"><p>We present the outline of a comprehensive website based offering of a basic graduate level or senior undergraduate level course in nuclear and radiochemistry. This password protected course follows classical pedagogical treatment of the subject. However, it has been augmented by the implementation of Flash animations to better teach basic nuclear and radiochemistry concepts. As well, the website is linked to many Internet related resources. All lectures and problems are presented in Microsoft Power Point format with Flash animations incorporated. A series of six experiments in radiochemistry, also offered in the course is available in a downloadable Microsoft Word format.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0043-z'"><p>Finland has the operational capability to take airborne gamma-ray measurements in emergency situations. The original purpose of airborne radiation mapping in Finland was to identify hazardous areas containing radioactive fall-out after a nuclear accident or use of nuclear weapons. Regular exercises are held annually to keep the operational functionality at a high level. The achieved capability has been well demonstrated in international INEX-2-FIN 1997 and Barents Rescue 2001 exercises. The knowledge and competence achieved can easily be applied in international radiation monitoring campaigns designed to expose undeclared nuclear materials or other clandestine nuclear activities. The essential improvements in the detection system are linked to the ability to locate point-like radiation sources rather than large areas of fall-out. This paper describes the aerial gamma-ray measurement method and its usability for the detection of nuclear material production chains and trails of fission or activation products. The ability of airborne detection systems in revealing the use of undeclared nuclear materials has been tested. Various scenarios for exposing clandestine nuclear material production, enrichment and nuclear waste trails have been considered. Based on detection capability calculations and testing in practice, it was found that the detection of one un-shielded significant quantity of natural uranium (10 tons of yellow cake in storage barrels) is possible through the daughter products, using one single 6"×4" NaI detector on the airplane. The developed fixed wing gamma measurement technique is now able to detect significant amounts of nuclear material conveniently and cost-effectively. Large areas can be screened to identify suspicious sub-areas for more detailed ground-based inspection.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0029-x'"><p>The Living Textbook of Nuclear Chemistry (http://livingtextbook.orst.edu) is a website, which is a collection of supplemental materials for the teaching of nuclear and radiochemistry. It contains audio-video presentations of the history of nuclear chemistry, tutorial lectures by recognized experts on advanced topics in nuclear and radiochemistry, links to data compilations, articles, and monographs, an audio course on radiochemistry, on-line editions of textbooks, training videos, etc. All content has been refereed.</p></xsl:when>
	                <xsl:when test="//ArticleDOI='10.1007/s10967-005-0034-0'"><p>A novel device for collecting, concentrating and separating airborne particles in situ is under development through a collaborative effort between Savannah River Technology Center (SRTC) and Oak Ridge National Laboratory (ORNL). This work entails coupling an Aerosol-to-Liquid Particle Extraction System (ALPES) to an electrochemically modulated separation (EMS) cell. The ALPES collects and concentrates airborne particles into a liquid,1 and the EMS cell separates species based on their affinity for a charged target surface.2 Preliminary data indicates substantial sensitivity enhancement may be realized by interfacing these devices. The system will allow for rapid field analysis of radionuclides while providing reductions in labor, cost, and turnaround time compared to standard radiometric techniques.</p></xsl:when>
	                <xsl:when test="ce:abstract-sec | sec">
	                    <xsl:apply-templates/>
	                </xsl:when>
	                <xsl:when test="p | rsc:p |Para | ce:abstract-sec | AbstractSection">
	                    <xsl:apply-templates/>
	                </xsl:when>
	                <xsl:otherwise>
	                    <p><xsl:apply-templates/></p>
	                </xsl:otherwise>
	            </xsl:choose>
			</abstract>
            </xsl:if>
			</xsl:when>
			</xsl:choose>
    </xsl:template>
    <!-- Specific to SPringer: AbstractSection -->
    <xsl:template match="AbstractSection">
        <!-- PL: only paragraphs are taken because <div> are not allowed under <abstract> currently -->
        <!--div-->
        <xsl:apply-templates/>
        <!--/div-->
    </xsl:template>

</xsl:stylesheet>
