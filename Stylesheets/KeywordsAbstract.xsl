<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns="http://www.tei-c.org/ns/1.0" xmlns:els1="http://www.elsevier.com/xml/ja/dtd"    
    xmlns:els2="http://www.elsevier.com/xml/cja/dtd"
    xmlns:rsc="http://www.rsc.org/schema/rscart38"
    xmlns:s1="http://www.elsevier.com/xml/si/dtd" exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>

    <!-- KEYWORDS -->

    <!-- BMJ: classinfo, keyword -->
    <!-- NLM 2.2 article: kwd-group, kwd -->
    <!-- Springer: KeywordGroup, Keyword -->
    <!-- Sage: keywords, keyword -->
    <!-- Elsevier: ce:keyword -->

    <!-- IOP: classifications/ puis comme Sage keywords/keyword
              pour l'instant directement traité dans IOP.xsl    -->

    <xsl:template match="kwd-group | classinfo | KeywordGroup | keywords">
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
        <xsl:param name="theKeyword" select="translate(.,'¶',' ')"/>
        <xsl:param name="inAddress" select="false()"/>
        <xsl:variable name="avantTiret">
            <xsl:choose>
                <xsl:when test="contains($theKeyword,' – ')">
                    <xsl:value-of select="normalize-space(substring-before($theKeyword,' – '))"/>
                </xsl:when>
                <xsl:when test="contains($theKeyword,'; ')">
                    <xsl:value-of select="normalize-space(substring-before($theKeyword,'; '))"/>
                </xsl:when>
                <xsl:when test="contains($theKeyword,', ')">
                    <xsl:value-of select="normalize-space(substring-before($theKeyword,', '))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space($theKeyword)"/>
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
                    <xsl:with-param name="theKeyword" select="translate(.,'¶',' ')"/>
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
        <!-- 09/2022 non reprise des abstracts type graphical car ce ne sont pas des résumés -->
        <xsl:if test="not(contains(@class,'graphical'))">
        <abstract>
			    <!-- Karger ebooks tous les abstracts sont en anglais-->
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
    </xsl:template>


    <!--xsl:template match="abstract | Abstract">
        <xsl:if test=". !=''">
            <div type="abstract">
                <xsl:variable name="theLanguage">
                    <xsl:choose>
                        <xsl:when test="@Language">
                            <xsl:value-of select="@Language"/>
                        </xsl:when>
                        <xsl:when test="@xml:lang">
                            <xsl:if test="@xml:lang">
                                <xsl:if test="@xml:lang != ''">
                                    <xsl:value-of select="@xml:lang"/>
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
                
                <xsl:apply-templates select="*/ce:simple-para"/>
                <xsl:choose>
                    <xsl:when test="ce:abstract-sec">
                        <xsl:apply-templates select="*/ce:simple-para"/>
                    </xsl:when>
                    <xsl:when test="p | Para | ce:abstract-sec | AbstractSection">
                        <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>
                            <xsl:apply-templates/>
                        </p>
                    </xsl:otherwise>
                </xsl:choose>
            </abstract>
        </xsl:if>
    </xsl:template>-->

    <!-- Specific to SPringer: AbstractSection -->
    <xsl:template match="AbstractSection">
        <!-- PL: only paragraphs are taken because <div> are not allowed under <abstract> currently -->
        <!--div-->
        <xsl:apply-templates/>
        <!--/div-->
    </xsl:template>

</xsl:stylesheet>
