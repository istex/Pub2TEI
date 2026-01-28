<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:rsc="http://www.rsc.org/schema/rscart38" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" method="xml"/>

    <!-- Revision information -->
    <xsl:template match="ArticleHistory">
            <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="RegistrationDate">
        <xsl:variable name="theDate">
            <xsl:call-template name="makeISODateFromComponents">
                <xsl:with-param name="oldDay" select="Day"/>
                <xsl:with-param name="oldMonth" select="Month"/>
                <xsl:with-param name="oldYear" select="Year"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$theDate != '0-00-00'">
            <change>
                <xsl:attribute name="when">
                    <xsl:value-of select="$theDate"/>
                </xsl:attribute>
                <xsl:text>Registration</xsl:text>
            </change>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Received">
        <xsl:variable name="theDate">
            <xsl:call-template name="makeISODateFromComponents">
                <xsl:with-param name="oldDay" select="Day"/>
                <xsl:with-param name="oldMonth" select="Month"/>
                <xsl:with-param name="oldYear" select="Year"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$theDate != '0-00-00'">
            <change>
                <xsl:attribute name="when">
                    <xsl:value-of select="$theDate"/>
                </xsl:attribute>
                <xsl:text>Received</xsl:text>
            </change>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Accepted">
        <xsl:variable name="theDate">
            <xsl:call-template name="makeISODateFromComponents">
                <xsl:with-param name="oldDay" select="Day"/>
                <xsl:with-param name="oldMonth" select="Month"/>
                <xsl:with-param name="oldYear" select="Year"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$theDate != '0-00-00'">
            <change>
                <xsl:attribute name="when">
                    <xsl:value-of select="$theDate"/>
                </xsl:attribute>
                <xsl:text>Accepted</xsl:text>
            </change>
        </xsl:if>
    </xsl:template>


    <xsl:template match="Revised">
        <xsl:variable name="theDate">
            <xsl:call-template name="makeISODateFromComponents">
                <xsl:with-param name="oldDay" select="Day"/>
                <xsl:with-param name="oldMonth" select="Month"/>
                <xsl:with-param name="oldYear" select="Year"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$theDate != '0-00-00'">
            <change>
                <xsl:attribute name="when">
                    <xsl:value-of select="$theDate"/>
                </xsl:attribute>
                <xsl:text>Revised</xsl:text>
            </change>
        </xsl:if>
    </xsl:template>


    <xsl:template match="OnlineDate">
        <xsl:variable name="theDate">
            <xsl:call-template name="makeISODateFromComponents">
                <xsl:with-param name="oldDay" select="Day"/>
                <xsl:with-param name="oldMonth" select="Month"/>
                <xsl:with-param name="oldYear" select="Year"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$theDate != '0-00-00'">
            <change>
                <xsl:attribute name="when">
                    <xsl:value-of select="$theDate"/>
                </xsl:attribute>
                <xsl:text>ePublished</xsl:text>
            </change>
        </xsl:if>
    </xsl:template>


    <xsl:template match="OnlineDate" mode="inImprint">
        <xsl:variable name="theDate">
            <xsl:call-template name="makeISODateFromComponents">
                <xsl:with-param name="oldDay" select="Day"/>
                <xsl:with-param name="oldMonth" select="Month"/>
                <xsl:with-param name="oldYear" select="Year"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:if test="$theDate != '0-00-00'">
            <date>
                <xsl:attribute name="when">
                    <xsl:value-of select="$theDate"/>
                </xsl:attribute>
                <xsl:attribute name="type">
                    <xsl:text>ePublished</xsl:text>
                </xsl:attribute>
            </date>
        </xsl:if>
    </xsl:template>

    <xsl:template match="JournalID">
        <xsl:if test=". !=''">
            <idno type="journal-id">
                <xsl:apply-templates/>
            </idno>
        </xsl:if>
    </xsl:template>

    <xsl:template match="ArticleInfo/ArticleID">
        <xsl:if test=". !=''">
            <idno type="article-id">
                <xsl:apply-templates/>
            </idno>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Acknowledgments">
        <div type="acknowledgments">
            <xsl:apply-templates/>
        </div>
    </xsl:template>


    <xsl:template match="Appendix">
        <div type="appendix">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="ArticleSubTitle">
        <title level="a" type="sub">
            <xsl:if test="@Language !='--'">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="translate(@Language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <!-- +++++++++++++++++++++++++++++++++++++++++++++ -->
    <!-- author related information -->
    <xsl:template match="Author | InstitutionalAuthor" mode="springer">
        <xsl:variable name="countArticle">
            <xsl:value-of select="count(//Article)"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="ancestor::SeriesHeader | ancestor::SubSeriesHeader">
                <editor>
                    <xsl:if test="@corresp='yes' or @CorrespondingAffiliationID">
                        <xsl:attribute name="role">
                            <xsl:text>corresp</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                    <xsl:if test="@AffiliationIDS">
                            <xsl:call-template name="createSpringerAffiliations">
                                <xsl:with-param name="restAff" select="@AffiliationIDS"/>
                            </xsl:call-template>
                        </xsl:if>
                    <xsl:if test="@PresentAffiliationID !=@AffiliationIDS">
                        <xsl:call-template name="createSpringerAffiliations2">
                            <xsl:with-param name="restAff2" select="@PresentAffiliationID"/>
                        </xsl:call-template>
                    </xsl:if>
                </editor>
            </xsl:when>
            <xsl:otherwise>
                <author>
                    <xsl:choose>
                        <xsl:when test="$countArticle&gt;=2"/>
                        <xsl:when test="ancestor::BookHeader and //Chapter">
                            <xsl:variable name="i" select="position()-1"/>
                            <xsl:variable name="authorBookNumber">
                                <xsl:choose>
                                    <xsl:when test="$i &lt; 10">
                                        <xsl:value-of select="concat('book-author-000', $i)"/>
                                    </xsl:when>
                                    <xsl:when test="$i &lt; 100">
                                        <xsl:value-of select="concat('book-author-00', $i)"/>
                                    </xsl:when>
                                    <xsl:when test="$i &lt; 1000">
                                        <xsl:value-of select="concat('book-author-0', $i)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="concat('book-author-', $i)"/>
                                    </xsl:otherwise>
                                </xsl:choose> 
                            </xsl:variable>
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="$authorBookNumber"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
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
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <xsl:if test="@corresp='yes' or @CorrespondingAffiliationID">
                        <xsl:attribute name="role">
                            <xsl:text>corresp</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                    <xsl:call-template name="createSpringerAffiliations">
                        <xsl:with-param name="restAff" select="@AffiliationIDS"/>
                    </xsl:call-template>
                    <xsl:if test="@PresentAffiliationID !=@AffiliationIDS">
                        <xsl:call-template name="createSpringerAffiliations2">
                            <xsl:with-param name="restAff2" select="@PresentAffiliationID"/>
                        </xsl:call-template>
                    </xsl:if>
                </author>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Same for Editors -->
    
    <xsl:template match="EditorGroup/Editor | CollaboratorGroup/Collaborator[@Type='Series editor']">
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
            <xsl:apply-templates/>
            <xsl:if test="@AffiliationIDS or @PresentAffiliationID">
                <xsl:call-template name="createSpringerAffiliations">
                    <xsl:with-param name="restAff" select="@AffiliationIDS"/>
                </xsl:call-template>
            </xsl:if>
        </editor>
    </xsl:template>

    <xsl:template name="createSpringerAffiliations">
        <xsl:param name="restAff"/>
        <xsl:message>Affiliations: <xsl:value-of select="$restAff"/></xsl:message>
        <xsl:choose>
            <xsl:when test=" contains($restAff,' ')">
                <xsl:apply-templates select="../Affiliation[@ID=substring-before($restAff,' ')]"/>
                <xsl:call-template name="createSpringerAffiliations">
                    <xsl:with-param name="restAff" select="substring-after($restAff,' ')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="../Affiliation[@ID=$restAff]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="createSpringerAffiliations2">
        <xsl:param name="restAff2"/>
        <xsl:message>Affiliations: <xsl:value-of select="$restAff2"/></xsl:message>
        <xsl:choose>
            <xsl:when test=" contains($restAff2,' ')">
                <xsl:apply-templates select="../Affiliation[@ID=substring-before($restAff2,' ')]"/>
                <xsl:call-template name="createSpringerAffiliations">
                    <xsl:with-param name="restAff" select="substring-after($restAff2,' ')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="../Affiliation[@ID=$restAff2]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="AuthorName | EditorName | CollaboratorName">
        <persName>
            <xsl:apply-templates/>
        </persName>
    </xsl:template>
    <xsl:template match="Prefix">
        <roleName type="honorific">
            <xsl:apply-templates/>
        </roleName>
    </xsl:template>
    <xsl:template match="Degrees">
        <xsl:if test=". !=''">
            <roleName type="degree">
                <xsl:apply-templates/>
            </roleName>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Contact">
        <xsl:apply-templates select="Email"/>
    </xsl:template>

    <xsl:template match="Biography">
        <state type="Biography">
            <xsl:apply-templates/>
        </state>
    </xsl:template>

    <xsl:template match="Biography/FormalPara">
        <bibl>
        <xsl:apply-templates/>
        </bibl>
    </xsl:template>


    <xsl:template match="Biography/FormalPara/Heading">
        <title>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    
    <xsl:template match="GivenName [position()=1]">
        <xsl:if test=". !=''">
            <forename type="first">
                <xsl:variable name="normalize">
                    <xsl:apply-templates/>
                </xsl:variable>
                <xsl:value-of select="normalize-space($normalize)"/>
            </forename>
        </xsl:if>
    </xsl:template>
    <xsl:template match="GivenName [position()&gt;=2]">
        <xsl:if test=". !=''">
            <forename type="middle">
                <xsl:variable name="normalize">
                    <xsl:apply-templates/>
                </xsl:variable>
                <xsl:value-of select="normalize-space($normalize)"/>
            </forename>
        </xsl:if>
    </xsl:template>
    

    <xsl:template match="Biography/FormalPara/Para">
        <xsl:choose>
            <xsl:when test="Figure">
                <xsl:apply-templates/> 
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:apply-templates/> 
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Inline affiliation (embedded in <contrib>) -->
    <xsl:template match="/Publisher//Affiliation">
        <affiliation>
            <xsl:if test="../InstitutionalAuthor">
                <xsl:apply-templates select="../InstitutionalAuthor" mode="simple"/>
            </xsl:if>
            <xsl:apply-templates/>
        </affiliation>
    </xsl:template>

    <xsl:template match="OrgName">
        <orgName type="institution">
            <xsl:variable name="orgName">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="contains($orgName,' E-Mail:')">
                    <xsl:value-of select="substring-before($orgName,' E-Mail:')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space($orgName)"/>
                </xsl:otherwise>
            </xsl:choose>
        </orgName>
    </xsl:template>
    <xsl:template match="OrgDivision">
        <orgName type="department">
            <xsl:variable name="orgDivision">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($orgDivision)"/>
        </orgName>
    </xsl:template>
    
    <xsl:template match="CitationRef">
        <ref>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

<!-- country mode springer -->
    <xsl:template match="Country">
        <xsl:variable name="countryWithNoSpace" select="normalize-space(translate(.,'aãÄàábcČdeéèfghiïjklmnñoôÖöpqrsŠtuüúvwxyýz().','AAAAABCCDEÉÈFGHIÏJKLMNNOÔOOPQRSSTUUUVWXYYZ'))"/>
            <xsl:if test="$countryWithNoSpace!=''">
            <country>
                <xsl:choose>
                    <xsl:when test="contains(.,'Bosnia-Herzegovina')">
                        <xsl:attribute name="key">BA</xsl:attribute>
                        <xsl:text>BOSNIA-HERZEGOVINA</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(.,'The Netherlands')">
                        <xsl:attribute name="key">NL</xsl:attribute>
                        <xsl:text>THE NETHERLANDS</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(.,', UK')">
                        <xsl:attribute name="key">GB</xsl:attribute>
                        <xsl:text>UNITED KINGDOM</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(.,'USA')">
                        <xsl:attribute name="key">US</xsl:attribute>
                        <xsl:text>UNITED STATES</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(.,'СССР')">
                        <xsl:attribute name="key">SU</xsl:attribute>
                        <xsl:text>UNION OF SOVIET SOCIALIST REPUBLICS (USSR)</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(.,'India')">
                        <xsl:attribute name="key">IN</xsl:attribute>
                        <xsl:text>INDIA</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(.,'Scotland')">
                        <xsl:attribute name="key">GB</xsl:attribute>
                        <xsl:text>UNITED KINGDOM</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(.,'Taiwan, ROC')">
                        <xsl:attribute name="key">TW</xsl:attribute>
                        <xsl:text>TAIWAN, PROVINCE OF CHINA</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(.,'Neuchâtel')
                        or contains(.,'Switzerland')">
                        <xsl:attribute name="key">CH</xsl:attribute>
                        <xsl:text>SWITZERLAND</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(.,'China')">
                        <xsl:attribute name="key">CN</xsl:attribute>
                        <xsl:text>CHINA</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(.,'México')">
                        <xsl:attribute name="key">MX</xsl:attribute>
                        <xsl:text>MEXICO</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(.,'Africa') and //ArticleDOI='10.1007/s13149-010-0062-z'">
                        <xsl:attribute name="key">GA</xsl:attribute>
                        <xsl:text>GABON</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(../City[1],'Cocody-Abidjan') and //ArticleDOI='10.1007/s10298-008-0347-6'">
                        <xsl:attribute name="key">CI</xsl:attribute>
                        <xsl:text>IVORY COAST</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="key">
                            <xsl:call-template name="normalizeISOCountry">
                                <xsl:with-param name="country" select="$countryWithNoSpace"/>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:call-template name="normalizeISOCountryName">
                            <xsl:with-param name="country" select="$countryWithNoSpace"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </country>
            </xsl:if>
        <!-- cas special notice cnrs -->
        <xsl:if test="$countryWithNoSpace='' and contains(ancestor::Affiliation/OrgName,'CNRS')">
            <country key="FR" xml:lang="en">FRANCE</country>
        </xsl:if>
    </xsl:template>


    <!-- Références bibliographiques à la fin d'un article -->

    <xsl:template match="Bibliography">
        <div type="references">
            <xsl:if test="@ID">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@ID"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="Heading">
                <xsl:apply-templates select="Heading"/>
            </xsl:if>
            <listBibl>
                <xsl:apply-templates select="Citation"/>
            </listBibl>
        </div>
    </xsl:template>

    <xsl:template match="Citation">
        <listBibl type="Citation">
            <xsl:if test="@ID">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@ID"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="CitationNumber">
                <xsl:attribute name="n">
                    <xsl:value-of select="CitationNumber"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="*[name() != 'CitationNumber']"/>
        </listBibl>
    </xsl:template>


    <!-- Generic trabsformation of unstructured entries  -->

    <xsl:template match="BibUnstructured">
        <bibl>
            <xsl:apply-templates/>
        </bibl>
    </xsl:template>

    <!-- Journal article -->

    <xsl:template match="BibArticle">
        <biblStruct type="article">
            <analytic>
                <!-- All authors are included here -->
                <xsl:apply-templates select="BibAuthorName"/>
                <!-- Title information related to the paper goes here -->
                <xsl:apply-templates select="ArticleTitle"/>
            </analytic>
            <monogr>
                <xsl:apply-templates select="JournalTitle"/>
                <imprint>
                    <xsl:apply-templates select="Year"/>
                    <xsl:apply-templates select="VolumeID"/>
                    <xsl:apply-templates select="IssueID"/>
                    <xsl:apply-templates select="FirstPage"/>
                    <xsl:apply-templates select="LastPage"/>
                </imprint>
            </monogr>
            <xsl:apply-templates select="nlm-citation/pub-id"/>
        </biblStruct>
    </xsl:template>

    <!-- Book chapter -->

    <xsl:template match="BibChapter">
        <biblStruct type="inBook">
            <analytic>
                <!-- All authors are included here -->
                <xsl:apply-templates select="BibAuthorName"/>
                <!-- Title information related to the paper goes here -->
                <xsl:apply-templates select="ChapterTitle"/>
            </analytic>
            <monogr>
                <xsl:apply-templates select="JournalTitle"/>
                <imprint>
                    <xsl:apply-templates select="Year"/>
                    <xsl:apply-templates select="VolumeID"/>
                    <xsl:apply-templates select="IssueID"/>
                    <xsl:apply-templates select="FirstPage"/>
                    <xsl:apply-templates select="LastPage"/>
                </imprint>
            </monogr>
            <xsl:apply-templates select="nlm-citation/pub-id"/>
        </biblStruct>
    </xsl:template>

    <!-- Book - generic -->

    <xsl:template match="BibBook">
        <biblStruct type="book">
            <monogr>
                <!-- All authors are included here -->
                <xsl:apply-templates select="BibAuthorName"/>
                <!-- Title information related to the paper goes here -->
                <xsl:apply-templates select="BookTitle"/>
                <imprint>
                    <xsl:apply-templates select="Year"/>
                    <xsl:apply-templates select="PublisherLocation"/>
                    <xsl:apply-templates select="PublisherName"/>
                </imprint>
            </monogr>
        </biblStruct>
    </xsl:template>

    <xsl:template match="BibAuthorName">
        <author>
            <persName>
                <xsl:apply-templates/>
            </persName>
        </author>
    </xsl:template>

    <!-- Journal information for <monogr> -->

    <xsl:template match="BookTitle">
        <title level="m" type="main">
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    
    <xsl:template match="BookSubTitle">
        <title level="m" type="sub">
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <xsl:template match="PartTitle">
        <title level="m" type="part">
            <xsl:apply-templates/>
        </title>
    </xsl:template>

    <!-- Macrostructure of main body if the text -->

    <xsl:template match="Section1">
        <div>
            <xsl:if test="@Type">
                <xsl:attribute name="type">
                    <xsl:value-of select="@Type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@ID">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@ID"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="Section2">
        <div>
            <xsl:if test="@Type">
                <xsl:attribute name="type">
                    <xsl:value-of select="@Type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@ID">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@ID"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>


    <xsl:template match="Section3">
        <div>
            <xsl:if test="@Type">
                <xsl:attribute name="type">
                    <xsl:value-of select="@Type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@ID">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@ID"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="Heading">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>

    <!-- Figures -->
    <xsl:template match="Figure">
        <figure>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@ID"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </figure>
    </xsl:template>

   <!-- <xsl:template match="ImageObject">
        <graphic>
            <xsl:attribute name="url">
                <xsl:choose>
                    <xsl:when test="@FileRef">
                        <xsl:value-of select="@FileRef"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
        </graphic>
    </xsl:template>-->

    <xsl:template match="CaptionNumber">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>

    <xsl:template match="CaptionContent">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="MediaObject">
        <media mimeType="image" url="{ImageObject}"/>
    </xsl:template>
    
    <xsl:template match="EquationSource">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="Caption">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="InternalRef">
        <ref>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <xsl:template match="ExternalRef">
        <ref>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <xsl:template match="RefSource">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="RefTarget"/>


    <!-- Copyright related information to appear in <publicationStmt> -->
    <xsl:template match="ArticleCopyright[1] | ChapterCopyright[1]">
        <availability>
            <xsl:if test="//ArticleGrants/BodyPDFGrant[string(@Grant)='OpenAccess']">
                <xsl:attribute name="status">free</xsl:attribute>
                    <p>Open Access</p>
            </xsl:if>
            <xsl:apply-templates select="CopyrightHolderName"/>
            <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-3XSW68JL-F">springer</p>
        </availability>
    </xsl:template>
    <xsl:template match="CopyrightHolderName">
        <licence>
            <xsl:apply-templates/>
        </licence>
    </xsl:template>
    <xsl:template match="CopyrightHolderName" mode="publisher">
        <publisher>
            <xsl:apply-templates/>
        </publisher>
    </xsl:template>

    <xsl:template match="CopyrightYear">
        <date type="published" when="{.}">
            <xsl:apply-templates/>
        </date>
    </xsl:template>

    <xsl:template match="allowbreak"/>

    <!-- Lists in Springer format -->
    <xsl:template match="OrderedList">
        <list type="ordered">
            <xsl:apply-templates/>
        </list>
    </xsl:template>

    <xsl:template match="UnorderedList[@Mark='Bullet']">
        <list type="bulleted">
            <xsl:apply-templates/>
        </list>
    </xsl:template>

    <xsl:template match="ListItem">
        <item>
            <xsl:if test="ItemNumber">
                <xsl:attribute name="n">
                    <xsl:value-of select="ItemNumber"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="ItemContent"/>
        </item>
    </xsl:template>

    <xsl:template match="ItemContent">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Tables in Springer format -->

    <xsl:template match="Table">
        <table>
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xsl:template match="Caption">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>

    <xsl:template match="CaptionNumber">
        <label>
            <xsl:apply-templates/>
        </label>
    </xsl:template>

    <xsl:template match="row | rsc:row">
        <row>
            <xsl:if test="@rowsep">
                <xsl:attribute name="rows">
                    <xsl:value-of select="@rowsep"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="ancestor::thead | ancestor::rsc:thead">
                <xsl:attribute name="role">label</xsl:attribute>
            </xsl:if>
            <xsl:if test="ancestor::tbody | ancestor::rsc:body">
                <xsl:attribute name="role">data</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </row>
    </xsl:template>

    <xsl:template match="entry | rsc:entry">
        <cell>
            <xsl:if test="ancestor::thead | ancestor::rsc:thead">
                <xsl:attribute name="role">label</xsl:attribute>
            </xsl:if>
            <xsl:if test="@colname">
                <xsl:attribute name="cols">
                    <xsl:choose>
                        <xsl:when test="contains(@colname,'col')">
                            <xsl:value-of select="substring-after(@colname,'col')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@colname"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@align">
                <xsl:attribute name="rend">
                    <xsl:value-of select="@align"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </cell>
    </xsl:template>

    <xsl:template match="tgroup | rsc:tgroup">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tfooter"/>
    <xsl:template match="colspec"/>

    <xsl:template match="entry/SimplePara | CaptionContent/SimplePara">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="Stack">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="InlineMediaObject">
        <media mimeType="image" url="{ImageObject/@FileRef}"/>
    </xsl:template>
    
    <xsl:template match="VolumeInfo">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="ArticleInfo">
        <xsl:apply-templates select="ArticleTitle | ArticleSubTitle"/>
    </xsl:template>

<!-- title -->
    <xsl:template
        match="ArticleTitle | ArticleTitle/Title | ChapterTitle">
        <title level="a" type="main">
            <xsl:choose>
                <xsl:when test="@Language != '--'">
                    <xsl:attribute name="xml:lang">
                        <xsl:choose>
                            <xsl:when test="//ArticleDOI='10.1007/BF02584710'">pt</xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="translate(@Language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="xml:lang">
                                <xsl:choose>
                                    <xsl:when test="contains(.,'И')">ru</xsl:when>
                                    <xsl:when test="//City='Прага'">ru</xsl:when>
                                    <xsl:when test="//City='Praha'">cs</xsl:when>
                                    <xsl:when test="//Country='Russia'">ru</xsl:when>
                                    <xsl:when test="//ArticleDOI='10.1007/BF02584710'">pt</xsl:when>
                                    <xsl:when test="//ArticleDOI='10.1007/BF02192581'
                                        or //ArticleDOI='10.1007/BF02334726'
                                        or //ArticleDOI='10.1007/BF01461250'
                                        or //ArticleDOI='10.1007/BF02192579'
                                        or //ArticleDOI='10.1007/BF02192580'
                                        or //ArticleDOI='10.1007/BF02314882'
                                        or //ArticleDOI='10.1007/BF02203888'
                                        or //ArticleDOI='10.1007/BF02314879'
                                        ">nl</xsl:when>
                                    <xsl:when test="//ArticleDOI='10.1007/BF02935462'">cs</xsl:when>
                                    <xsl:when test="//CopyrightHolderName='Warszawa'">pl</xsl:when>
                                    <xsl:when test="//CopyrightHolderName='Akadémiai Kiadó'">ru</xsl:when>
                                    <xsl:when test="//CopyrightHolderName='Czechoslovak Academy of Sciences'">cs</xsl:when>
                                    <xsl:when test="//CopyrightHolderName='Academia, Publishing House of the Czechoslovak Academia of Sciences'">cs</xsl:when>
                                    <xsl:when test="//CopyrightHolderName='Institute of Microbiology, Academy of Sciences of the Czech Republic'">cs</xsl:when>
                                    <xsl:when test="//CopyrightHolderName='The Society of the Nippon Dental University'">en</xsl:when>
                                    <xsl:when test="//CopyrightHolderName='The Ichthyological Society of Japan'">en</xsl:when>
                                    <xsl:when test="//CopyrightHolderName='Państwowe Wydawnictwo Naukowe'">pl</xsl:when>
                                    <xsl:when test="//CopyrightHolderName='De Erven F. Bohn'">nl</xsl:when>
                                    <xsl:when test="//CopyrightHolderName='Kluwer Academic Publishers'">nl</xsl:when>
                                    <xsl:when test="//CopyrightHolderName='J. H. Gebhard &amp; Comp.'">nl</xsl:when>
                                    <xsl:when test="//CopyrightHolderName='De Nederlandsche Boek- En Steendrukkerij'">nl</xsl:when>
                                    <xsl:when test="//CopyrightHolderName='Gedrukt BIJ H. Veeman &amp; Zonen'">nl</xsl:when>
                                    <xsl:when test="//ArticleDOI='10.1007/BF02585119'">ru</xsl:when>
                                    <xsl:when test="//ArticleDOI='10.1007/BF03039150' 
                                        or //ArticleDOI='10.1007/BF03039153'
                                        or //ArticleDOI='10.1007/BF03039027'
                                        or //ArticleDOI='10.1007/BF03039152'
                                        ">en</xsl:when>
                                    <xsl:when test="//Abstract/Heading ='Аннотация'">ru</xsl:when>
                                    <xsl:when test="//Abstract/Heading ='Анномачuя'">ru</xsl:when>
                                    <xsl:when test="//Abstract/Heading ='Аннотациа'">ru</xsl:when>
                                    <xsl:when test="//Abstract/Heading ='Краткое содержание'">ru</xsl:when>
                                    <xsl:when test="//Abstract/Heading ='--Реэюме'">ru</xsl:when>
                                    <xsl:when test="//Abstract/Heading ='Súhrn'">sk</xsl:when>
                                    <xsl:when test="//Abstract/Heading ='Souhrn'">cs</xsl:when>
                                    <xsl:when test="//Abstract/Heading ='Abstract'">en</xsl:when>
                                    <xsl:when test="//Abstract/Heading ='Conclusie'">nl</xsl:when>
                                    <xsl:when test="//Abstract/Heading ='Conclusies'">nl</xsl:when>
                                    <xsl:when test="//Abstract/Heading ='Samenvatting'">nl</xsl:when>
                                    <xsl:when test="//ArticleInfo[1]/@Language= '--'">und</xsl:when>
                                    <xsl:otherwise>und</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
        <xsl:choose>
            <xsl:when test="@Language='De' and //ArticleDOI='10.1007/s00508-013-0350-2'">Variante des Truncus-coeliacus-Kompressionssyndroms. Reichen sagittale Bilder für die Diagnose?</xsl:when>
            <!-- reprise titres vides -->
            <xsl:when test="//ArticleDOI='10.1007/s00253-005-0291-4'">Acknowledgement to reviewers 2005</xsl:when>
            <xsl:when test="//ArticleDOI='10.1023/A:1018417623867'">Reactive chemicals and cancer</xsl:when>
            <xsl:when test="//ArticleDOI='10.1007/BF02756632'">On superfields</xsl:when>
            <xsl:when test="//ArticleDOI='10.1023/A:1018542115208'">Meeting Announcements</xsl:when>
            <xsl:when test="(//ArticleDOI='10.1007/BF01204102') or
                (//ArticleDOI='10.1007/BF01660811') or 
                (//ArticleDOI='10.1007/BF00421833') or
                (//ArticleDOI='10.1007/BF02793962') or
                (//ArticleDOI='10.1007/BF02795571') or
                (//ArticleDOI='10.1007/BF01520011') or
                (//ArticleDOI='10.1007/BF01813114') or
                (//ArticleDOI='10.1007/BF01465842') or
                (//ArticleDOI='10.1007/BF01407224') or
                (//ArticleDOI='10.1007/BF02822856') or
                (//ArticleDOI='10.1007/BF00517202') or
                (//ArticleDOI='10.1007/BF02646276') or
                (//ArticleDOI='10.1007/BF01333375') or
                (//ArticleDOI='10.1007/BF01648904') or
                (//ArticleDOI='10.1007/BF02878828') or
                (//ArticleDOI='10.1007/BF02794974') or
                (//ArticleDOI='10.1007/BF01341587') or
                (//ArticleDOI='10.1007/BF01340030') or
                (//ArticleDOI='10.1007/BF00528665') or
                (//ArticleDOI='10.1007/BF01772344') or
                (//ArticleDOI='10.1007/BF01845143') or
                (//ArticleDOI='10.1007/BF00515295') or
                (//ArticleDOI='10.1007/BF02793688') or
                (//ArticleDOI='10.1007/BF01527176') or
                (//ArticleDOI='10.1007/BF01774482') or
                (//ArticleDOI='10.1007/BF00997948') or
                (//ArticleDOI='10.1007/BF01341331') or
                (//ArticleDOI='10.1007/BF01812610') or
                (//ArticleDOI='10.1007/BF01772427') or
                (//ArticleDOI='10.1007/BF01428277') or
                (//ArticleDOI='10.1007/BF01380033') or
                (//ArticleDOI='10.1007/BF02808688') or
                (//ArticleDOI='10.1007/BF02806690') or
                (//ArticleDOI='10.1007/BF02808747')
                ">
                <xsl:value-of select="normalize-space(translate(.,'\','ß'))"/>
            </xsl:when>
            <xsl:when test=".='' or .=' '">
                <xsl:value-of select="//ArticleCategory"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
        </title>
    </xsl:template>
    
    <xsl:template match="State">
        <xsl:if test=". !=''">
            <region>
                <xsl:apply-templates/>
            </region>
            <xsl:if test="not(../Country)">
                <xsl:variable name="normalize">
                    <xsl:value-of select="translate(.,'.','')"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$normalize='AL'
                        or $normalize='AK'
                        or $normalize='AZ'
                        or $normalize='AR'
                        or $normalize='CA'
                        or $normalize='NC'
                        or $normalize='SC'
                        or $normalize='CO'
                        or $normalize='CT'
                        or $normalize='ND'
                        or $normalize='SD'
                        or $normalize='DE'
                        or $normalize='FL'
                        or $normalize='GA'
                        or $normalize='HI'
                        or $normalize='ID'
                        or $normalize='IL'
                        or $normalize='IN'
                        or $normalize='IA'
                        or $normalize='KS'
                        or $normalize='KY'
                        or $normalize='LA'
                        or $normalize='ME'
                        or $normalize='MD'
                        or $normalize='MA'
                        or $normalize='MI'
                        or $normalize='MN'
                        or $normalize='MS'
                        or $normalize='MO'
                        or $normalize='MT'
                        or $normalize='NE'
                        or $normalize='NV'
                        or $normalize='NH'
                        or $normalize='NJ'
                        or $normalize='NM'
                        or $normalize='NY'
                        or $normalize='OH'
                        or $normalize='OK'
                        or $normalize='OR'
                        or $normalize='PA'
                        or $normalize='RI'
                        or $normalize='TN'
                        or $normalize='TX'
                        or $normalize='UT'
                        or $normalize='VT'
                        or $normalize='VA'
                        or $normalize='WV'
                        or $normalize='WA'
                        or $normalize='WI'
                        or $normalize='WY'
                        or .='Alabama'
                        or .='Alaska'
                        or .='Arizona'
                        or .='Arkansas'
                        or .='California'
                        or .='Colorado'
                        or .='Connecticut'
                        or .='Delaware'
                        or .='Florida'
                        or .='Georgia'
                        or .='Hawaii'
                        or .='Idaho'
                        or .='Illinois'
                        or .='Indiana'
                        or .='Iowa'
                        or .='Kansas'
                        or .='Kentucky'
                        or .='Louisiana'
                        or .='Maine'
                        or .='Maryland'
                        or .='Massachusetts'
                        or .='Michigan'
                        or .='Minnesota'
                        or .='Mississippi'
                        or .='Missouri'
                        or .='Montana'
                        or .='Nebraska'
                        or .='Nevada'
                        or .='New Hampshire'
                        or .='New Jersey'
                        or .='New Mexico'
                        or .='New York'
                        or .='North Carolina'
                        or .='North Dakota'
                        or .='Ohio'
                        or .='Oklahoma'
                        or .='Oregon'
                        or .='Pennsylvania'
                        or .='Rhode Island'
                        or .='South Carolina'
                        or .='South Dakota'
                        or .='Tennessee'
                        or .='Texas'
                        or .='Utah'
                        or .='Vermont'
                        or .='Virginia'
                        or .='Washington'
                        or .='West Virginia'
                        or .='Wisconsin'
                        or .='Wyoming'">
                        <country key="US" xml:lang="en">UNITED STATES</country>
                    </xsl:when>
                    <xsl:when test=".='Praha'">
                        <country key="CZ" xml:lang="en">CZECH REPUBLIC</country>
                    </xsl:when>
                    <xsl:when test=".='Baarn'">
                        <country key="NL" xml:lang="en">THE NETHERLANDS</country>
                    </xsl:when>
                    <xsl:when test=".='Ontario'">
                        <country key="CA" xml:lang="en">CANADA</country>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    <xsl:template match="City">
        <xsl:if test=". !=''">
            <settlement>
                <xsl:apply-templates/>
            </settlement>
            <xsl:if test="not(../Country)">
                <xsl:choose>
                    <xsl:when test="contains(.,'Köln')
                        or contains(.,'Hannover')
                        or contains(.,'Freiburg')
                        or contains(.,'Tübingen')
                        or contains(.,'Berlin')
                        or contains(.,'Frankfurt')
                        or contains(.,'München')
                        or contains(.,'Göttingen')
                        or contains(.,'Stuttgart')
                        or contains(.,'Oranienburg')
                        or contains(.,'Leverkusen')
                        or contains(.,'Rostock') 
                        or contains(.,'Neuss')
                        or contains(.,'Vogtareuth')
                        or contains(.,'Mainz')
                        or contains(.,'Ulm')
                        or contains(.,'München')
                        or contains(.,'Düsseldorf')
                        or contains(.,'Münster')
                        or contains(.,'Szeged')
                        or contains(.,'Dresden')
                        or contains(.,'Bad Neustadt')
                        or contains(.,'Mannheim')
                        or contains(.,'Greifswald')
                        or contains(.,'Hamburg')
                        or contains(.,'Stuttgart')
                        or contains(.,'Heidelberg')
                        or contains(.,'Ravensburg')
                        or contains(.,'Gatersleben')
                        or contains(.,'Essen')
                        or contains(.,'Wuppertal')
                        or contains(.,'Katlenburg-Lindau')
                        or contains(.,'Karlsruhe')
                        or contains(.,'Marburg')
                        or contains(.,'Sauerland')
                        or contains(.,'Regensburg')">
                        <country key="DE" xml:lang="en">GERMANY</country>
                    </xsl:when>
                    <xsl:when test="contains(.,'Praha')
                        or contains(.,'Prague')">
                        <country key="CZ" xml:lang="en">CZECH REPUBLIC</country>
                    </xsl:when>
                    <xsl:when test="contains(.,'Tokyo')">
                        <country key="JP" xml:lang="en">JAPAN</country>
                    </xsl:when>
                    <xsl:when test="contains(.,'Paris')
                        or contains(.,'St-Étienne')
                        or contains(.,'Clermont-Ferrand')">
                        <country key="FR" xml:lang="en">FRANCE</country>
                    </xsl:when>
                    <xsl:when test="contains(.,'London')
                        or contains(.,'Aberystwyth')">
                        <country key="GB" xml:lang="en">UNITED KINGDOM</country>
                    </xsl:when>
                    <xsl:when test="contains(.,'Baarn')
                        or contains(.,'Nijmegen')">
                        <country key="NL" xml:lang="en">THE NETHERLANDS</country>
                    </xsl:when>
                    <xsl:when test="contains(.,'Moskau')
                        or (contains(.,'Frunze'))">
                        <country key="RU" xml:lang="en">RUSSIA</country>
                    </xsl:when>
                    <xsl:when test="contains(.,'Wien')
                        or contains(.,'Innsbruck')
                        or contains(.,'Graz')
                        or contains(.,'Stockerau')">
                        <country key="AT" xml:lang="en">AUSTRIA</country>
                    </xsl:when>
                    <xsl:when test="contains(.,'Basel')
                        or contains(.,'Zürich')
                        or contains(.,'Genève')">
                        <country key="CH" xml:lang="en">SWITZERLAND</country>
                    </xsl:when>
                    <xsl:when test="contains(.,'Sidney')">
                        <country key="AU" xml:lang="en">AUSTRALIA</country>
                    </xsl:when>
                    <xsl:when test="contains(.,'Veracruz')
                        or contains(.,'México')">
                        <country key="MX" xml:lang="en">MEXICO</country>
                    </xsl:when>
                    <xsl:when test="contains(.,'Madrid')
                        or contains(.,'Málaga')
                        or contains(.,'Valencia')
                        or contains(.,'Bilbao')">
                        <country key="ES" xml:lang="en">SPAIN</country>
                    </xsl:when>
                    <xsl:when test="contains(.,'Riverside')">
                        <country key="US" xml:lang="en">UNITED STATES</country>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
