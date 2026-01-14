<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:mml="http://www.w3.org/1998/Math/MathML" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- codeLangue -->
    
    <!-- TEI document structure, creation of main header components, front (summary), body, and back -->
    <xsl:template match="euclid_issue">
        <TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="issue/record/@lang">
                    <xsl:attribute name="xml:lang">
                        <xsl:value-of select="translate(issue/record/@lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="xml:lang">
                        <xsl:value-of select="translate(issue/record/title/@lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                    </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <teiHeader>
                <fileDesc>
                    <!-- SG - titre brut -->
                    <titleStmt>
                        <xsl:choose>
                            <xsl:when test="issue/record/title[string-length()&gt; 0]">
                                <xsl:for-each select="issue/record/title">
                                    <title level="a" type="main">
                                        <xsl:if test="@xml:lang">
                                            <xsl:attribute name="xml:lang">
                                                <xsl:value-of select="translate(@lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:apply-templates/>
                                    </title>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="//euclid_issue and //div">
                                    <title level="a" type="main" xml:lang="en">
                                        <xsl:text>Table of Contents</xsl:text>
                                    </title>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </titleStmt>
                    <xsl:if test="issue/record/record_filename[string-length() &gt; 0]">
                        <editionStmt>
                            <edition>
                                <xsl:for-each select="issue/record/record_filename">
                                    <ref type="{@filetype}">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </ref>
                                </xsl:for-each>
                            </edition>
                        </editionStmt>
                    </xsl:if>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-BRG9S9X3-V">Duke University Press</publisher>
                        <pubPlace>Durham, NC 27701, USA</pubPlace>
                        <availability>
                            <licence><p>©Duke University Press, Project Euclid, Durham, NC 27701,USA</p></licence>
                        </availability>
						<!-- date -->
                        <xsl:if test="issue/issue_data/issue_publ_date/@iso8601[string-length()&gt; 0]">
							<date type="published">
							    <xsl:attribute name="when">
							        <xsl:value-of select="issue/issue_data/issue_publ_date/@iso8601"/>
							    </xsl:attribute>
							    <xsl:value-of select="issue/issue_data/issue_publ_date/@iso8601"/>
							</date>
						</xsl:if>
                    </publicationStmt>
                    <notesStmt>
                        <!-- niveau article / chapter -->
                        <note type="content-type">
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
                        </note>
                        <!-- niveau revue -->
                        <note type="publication-type" subtype="journal">
                            <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0GLKJH51-B</xsl:attribute>
                            <xsl:text>journal</xsl:text>
                        </note>
                    </notesStmt>
                    <xsl:if test="//euclid_issue/issue/record">
                        <sourceDesc>
                            <xsl:apply-templates select="//euclid_issue/issue/record" mode="sourceDesc"/>
                        </sourceDesc>
                    </xsl:if>
                    <!-- toc -->
                    <xsl:if test="//euclid_issue/issue/div/record">
                        <sourceDesc>
                            <xsl:apply-templates select="issue" mode="sourceDescDiv"/>
                        </sourceDesc>
                    </xsl:if>
                </fileDesc>
                <!-- versionning -->
                <xsl:call-template name="insertVersion"/>
                <xsl:if test="issue/record/abstract[string-length() &gt; 0] |issue/record/abstract[string-length() &gt; 0]">
                    <profileDesc>
						<!-- PL: abstract is moved from <front> to here -->
                        <xsl:if test="issue/record/abstract[string-length() &gt; 0]">
                            <!-- SG - reprise de tous les abstracts -->
                            <xsl:for-each select="issue/record/abstract[string-length() &gt; 0]">
                            <abstract>
                                <xsl:if test="@xml:lang">
                                    <xsl:attribute name="xml:lang">
                                        <xsl:value-of select="translate(@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:apply-templates/>
							</abstract>
                            </xsl:for-each>
		                </xsl:if>
                        <xsl:if test="issue/record/subjects[string-length() &gt; 0]">
                            <textClass ana="subject">
                                <xsl:apply-templates select="issue/record/subjects"/>
                            </textClass>
                        </xsl:if>
                        <xsl:if test="issue/record/title/@lang">
                        <langUsage>
                            <language>
                                <xsl:attribute name="ident">
                                    <xsl:value-of select="translate(issue/record/title/@lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                </xsl:attribute>
                            </language>
                        </langUsage>
                        </xsl:if>
                    </profileDesc>
                </xsl:if>
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
                </revisionDesc>
            </teiHeader>
            <text>
                <!-- pas de body dans les notices -->
                <body>
                    <xsl:choose>
                        <!-- body seulement pour les table of contents -->
                        <xsl:when test="//euclid_issue/issue/div/record">
                            <xsl:apply-templates select="//euclid_issue/issue/div/record" mode="bodyDiv"/>
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
	
    <!-- Building the sourceDesc bibliographical representation -->
    <xsl:template match="record" mode="sourceDesc">
        <biblStruct>
            <!-- Genre     -->
            <xsl:if test="@type[string-length()&gt; 0]">
                <xsl:attribute name="type">
                    <xsl:value-of select="normalize-space(@type)"/>
                </xsl:attribute>
            </xsl:if>
            <analytic>
                <!-- Title information related to the paper goes here -->
                <xsl:apply-templates select="title"/>
				
                <!-- All authors are included here -->
					<xsl:apply-templates select="author"/>
                
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
                <!-- SG correction 12102021 doi et pii en majuscule -->
                <xsl:if test="/euclid_issue/issue/record/identifiers/identifier[string-length() &gt; 0]">
                    <xsl:apply-templates select="/euclid_issue/issue/record/identifiers/identifier"/>
                </xsl:if>
                <xsl:if test="/euclid_issue/header/issue_identifier[string-length() &gt; 0]">
                    <idno type="issue-identifier">
                        <xsl:value-of select="normalize-space(/euclid_issue/header/issue_identifier)"/>
                    </idno>
                </xsl:if>
            </analytic>
            <monogr>
                <title level="j" type="main">Duke Mathematical Journal</title>
                <!-- ********************************** Identifier *******************************-->
                <idno type="pISSN">0012-7094</idno>
                <idno type="eISSN">1547-7398</idno>
                <xsl:if test="/euclid_issue/header/euclid_journal_id[string-length() &gt; 0]">
                    <idno type="publisher-id">
                        <xsl:value-of select="normalize-space(/euclid_issue/header/euclid_journal_id)"/>
                    </idno>
                </xsl:if>
                <xsl:if test="/euclid_issue/header/issue_identifier[string-length() &gt; 0]">
                    <idno type="issue-identifier">
                        <xsl:value-of select="normalize-space(/euclid_issue/header/issue_identifier)"/>
                    </idno>
                </xsl:if>
                <xsl:if test="/euclid_issue/issue/issue_data/identifiers/identifier[string-length() &gt; 0]">
                    <xsl:apply-templates select="/euclid_issue/issue/issue_data/identifiers/identifier"></xsl:apply-templates>
                </xsl:if>
                <xsl:if test="/euclid_issue/header/euclid_journal_id[string-length() &gt; 0]">
                    <idno type="publisher-id">
                        <xsl:value-of select="normalize-space(/euclid_issue/header/euclid_journal_id)"/>
                    </idno>
                </xsl:if>
                <!-- ********************************** Editor *******************************-->
                <xsl:if test="/euclid_issue/issue/issue_data/editorial_board/editor">
                    <xsl:apply-templates select="/euclid_issue/issue/issue_data/editorial_board/editor"/>
                </xsl:if>
                <imprint>
                    <xsl:apply-templates select="/euclid_issue/issue/issue_data/journal_vol_number"/>
                    <xsl:apply-templates select="/euclid_issue/issue/issue_data/issue_number"/>
                    <xsl:apply-templates select="/euclid_issue/issue/issue_data/start_page"/>
                    <xsl:apply-templates select="/euclid_issue/issue/issue_data/end_page"/>
                    <xsl:apply-templates select="/euclid_issue/issue/record/start_page"/>
                    <xsl:apply-templates select="/euclid_issue/issue/record/end_page"/>
                    <xsl:if test="//issue/issue_data/issue_publ_date/@iso8601">
						<date type="published">
						    <xsl:attribute name="when">
						        <xsl:value-of select="normalize-space(//issue/issue_data/issue_publ_date/@iso8601)"/>
						    </xsl:attribute>
						</date>
					</xsl:if>
                </imprint>
            </monogr>
        </biblStruct>
    </xsl:template>
    
    <xsl:template match="issue" mode="sourceDescDiv">
        <biblStruct type="toc">
            <analytic>
                <!-- Title information related to the paper goes here -->
                <title level="a" type="main" xml:lang="en">Table of Contents</title>
                
                <!-- All authors are included here -->
                <xsl:apply-templates select="author"/>
                
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
                <xsl:if test="identifiers/identifier[string-length() &gt; 0]">
                    <xsl:for-each select="identifiers/identifier">
                        <idno type="{@type}">
                            <xsl:value-of select="normalize-space(.)"/>
                        </idno>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="/euclid_issue/header/issue_identifier[string-length() &gt; 0]">
                    <idno type="issue-identifier">
                        <xsl:value-of select="normalize-space(/euclid_issue/header/issue_identifier)"/>
                    </idno>
                </xsl:if>
            </analytic>
            <monogr>
                <title level="j" type="main">Duke Mathematical Journal</title>
                <!-- ********************************** Identifier *******************************-->
                <idno type="pISSN">0012-7094</idno>
                <idno type="eISSN">1547-7398</idno>
                <xsl:if test="/euclid_issue/header/euclid_journal_id[string-length() &gt; 0]">
                    <idno type="publisher-id">
                        <xsl:value-of select="normalize-space(/euclid_issue/header/euclid_journal_id)"/>
                    </idno>
                </xsl:if>
                <xsl:if test="/euclid_issue/header/issue_identifier[string-length() &gt; 0]">
                    <idno type="issue-identifier">
                        <xsl:value-of select="normalize-space(/euclid_issue/header/issue_identifier)"/>
                    </idno>
                </xsl:if>
                <xsl:if test="issue_data/identifiers/identifier[string-length() &gt; 0]">
                    <xsl:for-each select="issue_data/identifiers/identifier">
                        <idno type="{@type}">
                            <xsl:value-of select="normalize-space(.)"/>
                        </idno>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="/euclid_issue/header/euclid_journal_id[string-length() &gt; 0]">
                    <idno type="publisher-id">
                        <xsl:value-of select="normalize-space(/euclid_issue/header/euclid_journal_id)"/>
                    </idno>
                </xsl:if>
                <!-- ********************************** Editor *******************************-->
                <xsl:if test="issue_data/editorial_board/editor">
                    <xsl:apply-templates select="issue_data/editorial_board/editor"/>
                </xsl:if>
                <imprint>
                    <xsl:apply-templates select="issue_data/journal_vol_number"/>
                    <xsl:apply-templates select="issue_data/issue_number"/>
                    <xsl:apply-templates select="issue_data/start_page"/>
                    <xsl:apply-templates select="issue_data/end_page"/>
                    <xsl:if test="//issue/issue_data/issue_publ_date/@iso8601">
                        <date type="published">
                            <xsl:attribute name="when">
                                <xsl:value-of select="normalize-space(//issue/issue_data/issue_publ_date/@iso8601)"/>
                            </xsl:attribute>
                        </date>
                    </xsl:if>
                </imprint>
            </monogr>
        </biblStruct>
    </xsl:template>
    <!-- back toc -->
    <xsl:template match="record" mode="bodyDiv">
        <div type="toc">
            <!-- Genre     -->
            <xsl:if test="@type[string-length()&gt; 0]">
                <xsl:attribute name="type">
                    <xsl:value-of select="normalize-space(@type)"/>
                </xsl:attribute>
            </xsl:if>
            <biblFull>
                <fileDesc>
                <!-- Title information related to the paper goes here -->
                <titleStmt>
                    <xsl:apply-templates select="title"/>
                </titleStmt>
                    <xsl:if test="record_filename[string-length() &gt; 0]">
                        <editionStmt>
                            <edition>
                                <xsl:for-each select="record_filename">
                                    <ref type="{@filetype}">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </ref>
                                </xsl:for-each>
                            </edition>
                        </editionStmt>
                    </xsl:if>
                <publicationStmt>
                    <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-BRG9S9X3-V">Duke University Press</publisher>
                </publicationStmt>
                <sourceDesc>
                    <biblStruct type="toc">
                        <analytic>
                            <xsl:apply-templates select="title"/>
                            <xsl:if test="identifiers/identifier[string-length() &gt; 0]">
                                <xsl:for-each select="identifiers/identifier">
                                    <idno type="{@type}">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </idno>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:if test="/euclid_issue/header/issue_identifier[string-length() &gt; 0]">
                                <idno type="issue-identifier">
                                    <xsl:value-of select="normalize-space(/euclid_issue/header/issue_identifier)"/>
                                </idno>
                            </xsl:if>
                            <!-- All authors are included here -->
                            <xsl:apply-templates select="author"/>
                        </analytic>
                        <monogr>
                            <title level="j" type="main">Duke Mathematical Journal</title>
                            <!-- ********************************** Identifier *******************************-->
                            <idno type="pISSN">0012-7094</idno>
                            <idno type="eISSN">1547-7398</idno>
                            <xsl:if test="/euclid_issue/header/euclid_journal_id[string-length() &gt; 0]">
                                <idno type="publisher-id">
                                    <xsl:value-of select="normalize-space(/euclid_issue/header/euclid_journal_id)"/>
                                </idno>
                            </xsl:if>
                            <xsl:if test="/euclid_issue/header/issue_identifier[string-length() &gt; 0]">
                                <idno type="issue-identifier">
                                    <xsl:value-of select="normalize-space(/euclid_issue/header/issue_identifier)"/>
                                </idno>
                            </xsl:if>
                            <xsl:if test="/euclid_issue/issue/issue_data/identifiers/identifier[string-length() &gt; 0]">
                                <xsl:for-each select="/euclid_issue/issue/issue_data/identifiers/identifier">
                                    <idno type="{@type}">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </idno>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:if test="/euclid_issue/header/euclid_journal_id[string-length() &gt; 0]">
                                <idno type="publisher-id">
                                    <xsl:value-of select="normalize-space(/euclid_issue/header/euclid_journal_id)"/>
                                </idno>
                            </xsl:if>
                            <imprint>
                                <xsl:apply-templates select="start_page[string-length() &gt; 0]"/>
                                <xsl:apply-templates select="end_page[string-length() &gt; 0]"/>
                                <xsl:if test="//issue/issue_data/issue_publ_date/@iso8601">
                                    <date type="published">
                                        <xsl:attribute name="when">
                                            <xsl:value-of select="normalize-space(//issue/issue_data/issue_publ_date/@iso8601)"/>
                                        </xsl:attribute>
                                    </date>
                                </xsl:if>
                            </imprint>
                        </monogr>
                        <xsl:if test="related_item">
                            <relatedItem>
                                <bibl>
                                    <xsl:if test="related_item/label">
                                        <title level="a" type="sub">
                                            <xsl:value-of select="related_item/label"/>
                                        </title>
                                    </xsl:if>
                                    <xsl:apply-templates select="related_item/citation"/>
                                    <xsl:apply-templates select="related_item/citation/identifiers"/>
                                    <xsl:apply-templates select="related_item/citation/identifiers/identifier"/>
                                </bibl>
                            </relatedItem>
                        </xsl:if>
                    </biblStruct>
                </sourceDesc>
                </fileDesc>
                <!-- versionning -->
                <xsl:call-template name="insertVersion"/>
                <profileDesc>
                    <xsl:if test="abstract | subjects">
                        <xsl:apply-templates select="abstract"/>
                        <textClass>
                            <xsl:apply-templates select="subjects"/>
                        </textClass>
                    </xsl:if>
                </profileDesc>
            </biblFull>
        </div>
    </xsl:template>
    <!-- author related information -->
    <xsl:template match="author">
        <author>
            <xsl:if test="not(//euclid_issue/issue/div)">
                <xsl:attribute name="xml:id">
                    <xsl:variable name="i" select="position()-1"/>
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
                </xsl:attribute>
            </xsl:if>
            <!-- affiliation mis en exception pour ne pas interferer avec feuille scholarOne -->
            <xsl:choose>
                <xsl:when test="marcName">
                    <persName>
                        <xsl:apply-templates select="marcName"/>
                        <xsl:apply-templates select="marcDate"/>
                    </persName>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="* except(affiliation)"/>  
                </xsl:otherwise>
            </xsl:choose>
            <!-- reprise de l'affiliation -->
            <xsl:if test="affiliation">
                <xsl:apply-templates select="affiliation" mode="Duke"/>
            </xsl:if>
        </author>
    </xsl:template>
    
    <!-- editor related information -->
    <xsl:template match="editorial_board">
		 <xsl:apply-templates select="creator"/>
	</xsl:template>
    <xsl:template match="affiliation" mode="Duke">
            <affiliation>
                <xsl:if test="organization">
                    <orgName type="institution">
                        <xsl:choose>
                            <xsl:when test="contains(organization,'urrent: ')">
                                <xsl:value-of select="substring-after(organization,'urrent: ')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="organization"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </orgName>
                </xsl:if>
                <xsl:if test="department">
                    <orgName type="department">
                        <xsl:value-of select="department"/>
                    </orgName>
                </xsl:if>
                <xsl:if test="address">
                    <address>
                        <xsl:apply-templates select="address/addressline"/>
                    </address>
                </xsl:if>
            </affiliation>
    </xsl:template>
    <!-- tomaison-->
    <xsl:template match="address">
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="addressline">
        <xsl:if test=". !=''">
                <xsl:choose>
                    <xsl:when test="*">
                        <!-- <xsl:if test="text()[. != ', ']">
                        <addrLine>
                            <xsl:for-each select="text()[. != ', ']">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </addrLine>
                    </xsl:if>-->
                        <xsl:apply-templates select="*"/>
                    </xsl:when>
                    <xsl:when test="parent::publisher-loc">
                        <!-- <xsl:if test="text()[. != ', ']">
                        <addrLine>
                            <xsl:for-each select="text()[. != ', ']">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </addrLine>
                    </xsl:if>-->
                        <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!--  <xsl:if test="not(ancestor::corresp)">
                    <addrLine>
                        <xsl:apply-templates/>
                    </addrLine>
                 </xsl:if>-->
                        <xsl:variable name="addrline">
                            <xsl:apply-templates/>
                        </xsl:variable>
                        <xsl:variable name="avantVirgule">
                            <xsl:choose>
                                <xsl:when test="contains($addrline,',')">
                                    <xsl:value-of select="normalize-space(substring-before($addrline,','))"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="normalize-space($addrline)"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="apresVirgule">
                            <xsl:choose>
                                <xsl:when test="contains($addrline,',')">
                                    <xsl:value-of select="normalize-space(substring-after($addrline,','))"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="''"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="testOrganisation">
                            <xsl:call-template name="identifyOrgLevel">
                                <xsl:with-param name="theOrg">
                                    <xsl:value-of select="$addrline"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="ancestor::aff/xref/addr-line">
                                <address>
                                    <addrLine>
                                        <xsl:value-of select="normalize-space($addrline)"/>
                                    </addrLine>
                                </address>
                            </xsl:when>
                            <xsl:when test="contains(.,', ') and not(ancestor::aff/country)">
                                <xsl:call-template name="NLMparseAffiliation">
                                    <xsl:with-param name="theAffil" select="."/>
                                    <xsl:with-param name="inAddress" select="true()"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="$testOrganisation!=''">
                                <orgName>
                                    <xsl:attribute name="type">
                                        <xsl:value-of select="$testOrganisation"/>
                                    </xsl:attribute>
                                    <xsl:choose>
                                        <xsl:when test="$avantVirgule">
                                            <xsl:apply-templates select="$avantVirgule"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="normalize-space($addrline)"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </orgName>
                                <xsl:if test="$apresVirgule !=''">
                                    <xsl:call-template name="NLMparseAffiliation">
                                        <xsl:with-param name="theAffil" select="$apresVirgule"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                <addrLine>
                                    <xsl:value-of select="normalize-space($addrline)"/>
                                </addrLine>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
    </xsl:template>
    <xsl:template match="/euclid_issue/issue/issue_data/journal_vol_number">
        <biblScope unit="vol">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>
    <xsl:template match="/euclid_issue/issue/issue_data/issue_number">
        <biblScope unit="issue">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>
    <!-- pagination niveau issue-->
    <xsl:template match="/euclid_issue/issue/issue_data/start_page">
        <biblScope unit="issue-page" from="{normalize-space(.)}">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>
    <xsl:template match="/euclid_issue/issue/issue_data/end_page">
        <biblScope unit="issue-page" to="{normalize-space(.)}">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>
    <!-- pagination niveau article-->
    <xsl:template match="start_page">
        <biblScope unit="page" from="{normalize-space(.)}">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>
    <xsl:template match="end_page">
        <biblScope unit="page" to="{normalize-space(.)}">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>
    <!--relatedItem-->
    <xsl:template match="related_item/citation">
            <xsl:apply-templates/>
    </xsl:template>
    <!--relatedItem idno-->
    <xsl:template match="related_item/citation/identifiers/identifier">
        <idno type="{@type}">
        <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="marcName">
        <xsl:variable name="prenomFST">
            <xsl:value-of select="substring-after(.,', ')"/>
        </xsl:variable>
        <xsl:variable name="prenom2FST">
            <xsl:value-of select="substring-after($prenomFST,',')"/>
        </xsl:variable>
        <xsl:variable name="prenom3FST">
            <xsl:value-of select="substring-before($prenomFST,',')"/>
        </xsl:variable>
        <xsl:variable name="nom">
            <xsl:value-of select="substring-before(.,',')"/>
        </xsl:variable>
            <!--<xsl:choose>
                <xsl:when test="contains(.,',')">
                    <forename type="first"><xsl:value-of select="normalize-space(substring-after(.,','))"/></forename>
                    <surname><xsl:value-of select="substring-before(.,',')"/></surname>
                </xsl:when>
                <xsl:otherwise>
                    <surname><xsl:apply-templates/></surname>
                </xsl:otherwise>
            </xsl:choose>-->
       
        <xsl:choose>
            <xsl:when test="contains($prenomFST,',')">
                <forename type="first">
                <xsl:value-of select="$prenom3FST"/>
                </forename>
            </xsl:when>
            <xsl:otherwise>
                <forename type="first">
                <xsl:value-of select="$prenomFST"/>
                </forename>
            </xsl:otherwise>
        </xsl:choose>
        <surname>
        <xsl:value-of select="$nom"/>
        </surname>
        <xsl:if test="contains($prenomFST,',')">
            <state type="biography">
                <desc>
                <xsl:value-of select="$prenom2FST"/>
                </desc>
            </state>
        </xsl:if>
    </xsl:template>
    <xsl:template match="marcDate">
        <date><xsl:apply-templates/></date>
    </xsl:template>
    <xsl:template match="identifier">
        <xsl:choose>
            <xsl:when test="@type='doi'">
                <idno type="DOI">
                    <xsl:value-of select="normalize-space(.)"/>
                </idno>
            </xsl:when>
            <xsl:when test="@type='pii'">
                <idno type="PII">
                    <xsl:value-of select="normalize-space(.)"/>
                </idno>
            </xsl:when>
            <xsl:otherwise>
                <idno type="{@type}">
                    <xsl:apply-templates/>
                </idno>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
