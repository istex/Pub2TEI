<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:m="http://www.w3.org/1998/Math/MathML"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xpath-default-namespace="http://www.wiley.com/namespaces/wiley"
	exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" method="xml"/>
    
    <!-- codeLangue -->
    <xsl:variable name="codeLangue">
        <xsl:choose>
            <xsl:when test="component/header/publicationMeta[@level='unit']/doi='10.1111/j.1365-2478.1963.tb02022.x' 
                or component/header/publicationMeta[@level='unit']/doi='10.1111/j.1755-5825.1984.tb00925.x'
                or component/header/publicationMeta[@level='unit']/doi='10.1111/j.1365-2478.1959.tb01450.x'
                or component/header/publicationMeta[@level='unit']/doi='10.1111/j.1755-618X.1993.tb00170.x'
                or component/header/publicationMeta[@level='unit']/doi='10.1111/j.1365-2478.1963.tb02023.x'
                or component/header/publicationMeta[@level='unit']/doi='10.1111/j.1755-5825.1979.tb01509.x'
                or component/header/publicationMeta[@level='unit']/doi='10.1111/j.1365-2478.1970.tb02102.x'
                or component/header/publicationMeta[@level='unit']/doi='10.1111/j.1755-5825.1987.tb01074.x'
                or component/header/publicationMeta[@level='unit']/doi='10.1111/j.1600-0390.2012.00679.x'
                or component/header/publicationMeta[@level='unit']/doi='10.1111/j.1754-7121.2012.00236.x'
                or component/header/publicationMeta[@level='unit']/doi='10.1111/j.1600-0390.2012.00676.x'
                or component/header/publicationMeta[@level='unit']/doi='10.1111/j.1752-1718.2011.01401.x'
                or component/header/publicationMeta[@level='unit']/doi='10.1111/j.1600-0390.2012.00677.x'
                or component/header/publicationMeta[@level='unit']/doi='10.1111/j.1600-0390.2012.00678.x'">
                <xsl:text>fr</xsl:text>
            </xsl:when>
            <xsl:when test="component/header/publicationMeta/issn[@type='print']='0378-5599'">
                <xsl:text>fr</xsl:text>
            </xsl:when>
            <xsl:when test="component/header/publicationMeta[@level='unit']/doi='10.1002/(SICI)1099-0682(199809)1998:9&lt;1205::AID-EJIC1205&gt;3.0.CO;2-F' or header/publicationMeta[@level='unit']/doi='10.1002/(SICI)1521-3897(199910)341:7&lt;657::AID-PRAC657&gt;3.0.CO;2-P'or header/publicationMeta[@level='unit']/doi='10.1002/(SICI)1521-3897(199908)341:6&lt;568::AID-PRAC568&gt;3.0.CO;2-H'">
                <xsl:text>en</xsl:text>
            </xsl:when>
            <!-- correction ouzbeck 10.1002/asna.2103030307 -->
            <xsl:when test="component/header/publicationMeta[@level='unit']/doi='10.1111/j.1550-7408.1980.tb04229.x' or header/publicationMeta[@level='unit']/doi='10.1111/j.1365-3180.1990.tb01689.x'or header/publicationMeta[@level='unit']/doi='10.1002/asna.2103030307'or header/publicationMeta[@level='unit']/doi='10.1002/asna.2103030305'">
                <xsl:text>de</xsl:text>
            </xsl:when>
            <!-- correction arabe 10.1002/1522-239X(200210)113:5/6&lt;342::AID-FEDR342&gt;3.0.CO;2-S -->
            <xsl:when test="component/header/publicationMeta[@level='unit']/doi='10.1002/1522-239X(200210)113:5/6&lt;342::AID-FEDR342&gt;3.0.CO;2-S'">
                <xsl:text>es</xsl:text>
            </xsl:when>
            <xsl:when test="component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2008.00477.x' ">
                <xsl:text>de</xsl:text>
            </xsl:when>
            <xsl:when test="component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2008.00484.x'">
                <xsl:text>es</xsl:text>
            </xsl:when>
            <xsl:when test="component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2007.00453.x'">
                <xsl:text>it</xsl:text>
            </xsl:when>
            <xsl:when test="component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2008.00459.x'">
                <xsl:text>fr</xsl:text>
            </xsl:when>
            <xsl:when test="*/@xml:lang ='be'">
                <xsl:text>nl</xsl:text>
            </xsl:when>
            <xsl:when test="*/@xml:lang='ka'">
                <xsl:choose>
                    <xsl:when test="component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2008.00489.x'">
                        <xsl:text>it</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>de</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:choose>
                    <xsl:when test="component/header/contentMeta/titleGroup/title[@type='main'][1]/@xml:lang">
                        <xsl:value-of select="component/header/contentMeta/titleGroup/title[@type='main'][1]/@xml:lang"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="component/@xml:lang"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <!-- TEI document structure, creation of main header components, front (summary), body, and back -->
    <xsl:template match="component">
        <TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="$codeLangue"/>
            </xsl:attribute>
            <teiHeader>
                <fileDesc>
                    <!-- SG - titre brut -->
                    <titleStmt>
                        <!-- redressement des titres vides -->
                        <xsl:choose>
                            <xsl:when test="//header/publicationMeta[@level='unit']/doi='10.1046/j.1523-1739.1997.0110051265.x'">
                                <title level="a" type="main">
                                    <xsl:text>Erratum: Diploid expected heterozygosity and haploid allelic diversity equations misprinted</xsl:text>
                                </title></xsl:when>
                            <xsl:when test="//header/publicationMeta[@level='unit']/doi='10.1002/(SICI)1521-401X(199809)26:5&lt;253::AID-AHEH253&gt;3.0.CO;2-S'">
                                <title level="a" type="main">
                                    <xsl:text>Vertical and Annual Distribution of Ferric and Ferrous Iron in Acid Mining Lakes</xsl:text> 
                                </title></xsl:when>
                            <xsl:when test="//header/publicationMeta[@level='unit']/doi='10.1002/(SICI)1521-4133(199811)100:11&lt;513::AID-LIPI513&gt;3.0.CO;2-I'">
                                <title level="a" type="main">
                                    <xsl:text>Die Bleichung von Speisefetten und Ölen V Aus dem Arbeitskreis "Technologien der industriellen"</xsl:text> 
                                </title>
                            </xsl:when>
                            <xsl:when test="//publicationMeta[@level='unit']/doi='10.1111/insr.12044'">
                                <title level="a" type="main">
                                    <xsl:text>Table of contents</xsl:text>
                                </title>
                            </xsl:when>
                            <xsl:when test="//header/publicationMeta[@level='unit']/doi='10.1002/sres.2200'">
                                <title level="a" type="main">
                                    <xsl:text>Editorial</xsl:text>
                                </title>
                            </xsl:when>
                            <xsl:otherwise>
                                    <xsl:apply-templates select="//titleGroup"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </titleStmt>
                    <!-- SG - ajout <enrichedObject> -->
                    <xsl:if test="header/contentMeta/enrichedObjectGroup | //fundingInfo">
                        <editionStmt>
                            <edition>
                                <xsl:variable name="ana">
                                    <xsl:value-of select="header/contentMeta/enrichedObjectGroup/@type"/>
                                </xsl:variable>
                                <xsl:for-each select="header/contentMeta/enrichedObjectGroup/enrichedObject">
                                    <ref>
                                        <xsl:attribute name="type">
                                            <xsl:value-of select="$ana"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="xml:id">
                                            <xsl:value-of select="@xml:id"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="corresp">
                                            <xsl:value-of select="@associatedDataRef"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="target">
                                            <xsl:value-of select="mediaResourceGroup/mediaResource/@href"/>
                                        </xsl:attribute>
                                    </ref>
                                </xsl:for-each>
                            </edition>
                            <xsl:apply-templates select="//fundingInfo"/>
                        </editionStmt>
                    </xsl:if>
                    <publicationStmt>
                        <authority>ISTEX</authority>
						<xsl:if test="header/publicationMeta/publisherInfo/publisherName">
                       	 	<xsl:apply-templates select="header/publicationMeta/publisherInfo/publisherName"/>
						</xsl:if>
						<xsl:if test="not(header/publicationMeta/publisherInfo/publisherName)">
						    <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-QW5Q88H5-V">Wiley Publishing Ltd</publisher>
						</xsl:if>
                        <!-- SG ajout publisherLoc -->
                        <xsl:if test="header/publicationMeta/publisherInfo/publisherLoc">
                            <xsl:apply-templates select="header/publicationMeta/publisherInfo/publisherLoc"/>
                        </xsl:if>
						<xsl:if test="header/publicationMeta/copyright">
							<availability>
							    <!-- SG: ajout licence -->
								<licence>
								    <xsl:apply-templates select="header/publicationMeta[@level='unit']/copyright/text()"/>
								</licence>
							</availability>
						</xsl:if>
						<!-- date -->
						<xsl:if test="header/publicationMeta[@level='part']/coverDate">
						    <xsl:choose>
						        <xsl:when test="header/publicationMeta[@level='product']/issn[@type='print']='0365-5563' and header/publicationMeta[@level='part']/numberingGroup/numbering[@type='journalVolume']='80B'">
						            <date type="published">
						                <xsl:attribute name="when">
						                <xsl:text>1972</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta[@level='unit']/doi='10.1111/j.1744-1714.1968.tb00414.x'">
						            <date type="published">
						                <xsl:attribute name="when">
						                <xsl:text>1968</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta/issn[@type='print']='0002-9246' and header/publicationMeta/numberingGroup/numbering[@type='journalVolume']='58'">
						            <date type="published">
						                <xsl:attribute name="when">
						                <xsl:text>1999</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta/issn[@type='print']='0077-8923' and header/publicationMeta/numberingGroup/numbering[@type='journalVolume']='105'">
						            <date type="published">
						                <xsl:attribute name="when">
						                    <xsl:text>1963</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta/issn[@type='print']='0077-8923' and header/publicationMeta/numberingGroup/numbering[@type='journalVolume']='196'">
						            <date type="published">
						                <xsl:attribute name="when">
						                    <xsl:text>1972</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta/issn[@type='print']='0141-1314' and header/publicationMeta/numberingGroup/numbering[@type='journalIssue']='62'">
						            <date type="published">
						                <xsl:attribute name="when">
						                    <xsl:text>2009</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta/issn[@type='print']='1355-4905' and header/publicationMeta/numberingGroup/numbering[@type='journalVolume']='15'">
						            <date type="published">
						                <xsl:attribute name="when">
						                    <xsl:text>1998</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta/issn[@type='print']='0956-5507' and header/publicationMeta/numberingGroup/numbering[@type='journalVolume']='7'">
						            <date type="published">
						                <xsl:attribute name="when">
						                    <xsl:text>1996</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta/issn[@type='print']='0265-0665' and header/publicationMeta/numberingGroup/numbering[@type='journalVolume']='21'">
						            <date type="published">
						                <xsl:attribute name="when">
						                    <xsl:text>2001</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta/issn[@type='print']='0026-1068' and header/publicationMeta/numberingGroup/numbering[@type='journalVolume']='24'">
						            <date type="published">
						                <xsl:attribute name="when">
						                    <xsl:text>1993</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta/issn[@type='print']='0309-8249' and header/publicationMeta/numberingGroup/numbering[@type='journalVolume']='35'">
						            <date type="published">
						                <xsl:attribute name="when">
						                    <xsl:text>2001</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta/issn[@type='print']='0384-9694' and header/publicationMeta/numberingGroup/numbering[@type='journalVolume']='29'">
						            <date type="published">
						                <xsl:attribute name="when">
						                    <xsl:text>2001</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta/issn[@type='print']='0363-6550' and header/publicationMeta/numberingGroup/numbering[@type='journalVolume']='10'">
						            <date type="published">
						                <xsl:attribute name="when">
						                    <xsl:text>1986</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta/issn[@type='print']='0363-6550' and header/publicationMeta/numberingGroup/numbering[@type='journalVolume']='12'">
						            <date type="published">
						                <xsl:attribute name="when">
						                    <xsl:text>1987</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:when test="header/publicationMeta/issn[@type='print']='0023-852X' and header/publicationMeta/numberingGroup/numbering[@type='journalVolume']='40'">
						            <date type="published">
						                <xsl:attribute name="when">
						                    <xsl:text>1930</xsl:text>
						                </xsl:attribute>
						            </date>
						        </xsl:when>
						        <xsl:otherwise>
						            <date type="published">
						                <xsl:attribute name="when">
						                    <xsl:value-of select="header/publicationMeta[@level='part']/coverDate/@startDate"/>
						                </xsl:attribute>
						            </date>
						        </xsl:otherwise>
						    </xsl:choose>
						</xsl:if>
                    </publicationStmt>
                    <!-- SG - ajout du codeGenre article et revue -->
                    <notesStmt>
                        <!-- niveau article / chapter -->
                        <note type="content-type">
                            <xsl:choose>
                                <xsl:when test="header/publicationMeta/issn[@type='print']='0931-7597'">
                                    <xsl:attribute name="subtype">abstract</xsl:attribute>
                                    <xsl:attribute name="source">abstract</xsl:attribute>
                                    <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-HPN7T1Q2-R</xsl:attribute>
                                    <xsl:text>abstract</xsl:text>
                                </xsl:when>
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
                                    <xsl:attribute name="subtype">N/A</xsl:attribute>
                                    <xsl:attribute name="source">ISTEX</xsl:attribute>
                                    <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:attribute>
                                    <xsl:text>other</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </note>
                        <!-- niveau revue / book -->
                        <xsl:choose>
                            <xsl:when test="//publicationMeta/isbn[string-length() &gt; 0] and //publicationMeta/issn">
                                <note type="publication-type" subtype="book-series">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//publicationMeta/isbn[string-length() &gt; 0] and not(//publicationMeta/issn)">
                                <note type="publication-type" subtype="book">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                    <xsl:text>book</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:otherwise>
                                <note type="publication-type" subtype="journal">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0GLKJH51-B</xsl:attribute>
                                    <xsl:text>journal</xsl:text>
                                </note>
                            </xsl:otherwise>
                        </xsl:choose>
                    </notesStmt>
                    <sourceDesc>
                        <xsl:apply-templates select="header" mode="sourceDesc"/>
                    </sourceDesc>
                </fileDesc>
                
                <!-- versionning -->
                <xsl:call-template name="insertVersion"/>
               
                <xsl:if test="header/contentMeta/abstractGroup | header/contentMeta/keywordGroup | header/publicationMeta[@level='unit']/subjectInfo | header/publicationMeta[@level='unit']/titleGroup/title[@type='articleCategory']">
                    <profileDesc>
						<!-- PL: abstract is moved from <front> to here -->
                        <xsl:if test="header/contentMeta/abstractGroup/abstract">
                            <!-- SG - reprise de tous les abstracts -->
                            <xsl:for-each select="header/contentMeta/abstractGroup/abstract">
                            <abstract>
                                <xsl:choose>
                                    <xsl:when test="@xml:lang[string-length() &gt; 0] | @lang[string-length() &gt; 0]">
                                        <xsl:attribute name="xml:lang">
                                            <xsl:variable name="codeLangue">
                                                <xsl:value-of select="translate(@xml:lang | @lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                            </xsl:variable>
                                            <!-- correction arabe 10.1002/1522-239X(200210)113:5/6&lt;342::AID-FEDR342&gt;3.0.CO;2-S au lieu de espagnol -->
                                            <xsl:choose>
                                                <xsl:when test="$codeLangue='ar' and //component/header/publicationMeta[@level='unit']/doi='10.1002/1522-239X(200210)113:5/6&lt;342::AID-FEDR342&gt;3.0.CO;2-S'">es</xsl:when>
                                                <xsl:when test="$codeLangue='ka' and //component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2008.00477.x'">de</xsl:when>
                                                <xsl:when test="$codeLangue='ka' and //component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2008.00484.x'">es</xsl:when>
                                                <xsl:when test="$codeLangue='ka' and //component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2008.00459.x'">fr</xsl:when>
                                                <xsl:when test="$codeLangue='ka' and //component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2007.00453.x'">it</xsl:when>
                                                <xsl:when test="$codeLangue='ka' and //component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2008.00489.x'">it</xsl:when>
                                                <xsl:when test="$codeLangue='ka'">de</xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="$codeLangue"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:attribute>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:if test="@type">
                                    <xsl:attribute name="style">
                                        <xsl:value-of select="@type"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="@xml:id">
                                    <xsl:copy-of select="@xml:id"/>
                                </xsl:if>
                                <xsl:apply-templates/>
							</abstract>
                            </xsl:for-each>
		                </xsl:if>
                        <xsl:if test="header/contentMeta/keywordGroup/keyword[string-length()&gt;0]| header/publicationMeta[@level='unit']/subjectInfo[string-length()&gt;0] or 
                            header/publicationMeta[@level='unit']/titleGroup/title[@type][string-length()&gt;0]">
							<textClass>
							    <xsl:if test="header/contentMeta/keywordGroup/keyword[string-length()&gt;0]">
							        <xsl:apply-templates select="header/contentMeta/keywordGroup"/>
							        
							        
							        
							    </xsl:if>
							    <xsl:if test="header/publicationMeta[@level='unit']/titleGroup/title[string-length()&gt;0]">
							        <xsl:for-each select="header/publicationMeta[@level='unit']/titleGroup/title">
							            <keywords>
							                <xsl:if test="@type">
							                    <xsl:attribute name="rend">
							                        <xsl:value-of select="@type"/>
							                    </xsl:attribute>
							                </xsl:if>
							                <term>
							                <xsl:value-of select="normalize-space(.)"/>
							                </term>
							            </keywords>
							        </xsl:for-each>
							    </xsl:if>
							</textClass>
						</xsl:if>
                        <xsl:if test="header/publicationMeta/subjectInfo/subject !=''">
                            <textClass>
                                <keywords ana="subject">
                                    <xsl:apply-templates select="header/publicationMeta/subjectInfo/*"/>
                                </keywords>
                            </textClass>
                        </xsl:if>
                        <xsl:if test="$codeLangue">
                        <langUsage>
                            <language>
                                <xsl:attribute name="ident">
                                    <xsl:choose>
                                        <xsl:when test="//component/header/publicationMeta[@level='unit']/doi='10.1002/ejic.200400619'">en</xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$codeLangue"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
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
                <!-- No test if made for body since it is considered a mandatory element -->
                <!-- SG test sur body si vide information minimale à reporter pour validation TEI -->
                <xsl:choose>
                    <xsl:when test="body/p">
                        <body>
                            <xsl:apply-templates select="body" mode="bodyOnly"/>
                        </body>
                    </xsl:when>
                    <!-- SG ajout du niveau section -->
                    <xsl:when test="body/section">
                        <body>
                            <xsl:apply-templates select="body" mode="bodyOnly"/>
                        </body>
                    </xsl:when>
                    <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                        <body>
                            <div>
                                <p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
                            </div>
                        </body>
                    </xsl:when>
                    <xsl:otherwise>
                        <body><div><p/></div></body>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="body/bibliography|header/noteGroup/note|body/noteGroup/note|header/contentMeta/titleGroup/title/citation">
                    <back>
                        <!-- note de bas de page -->
                        <xsl:if test="header/noteGroup/note">
                            <div type="fn-group">
                            <xsl:apply-templates select="header/noteGroup/note"/>
                            </div>
                        </xsl:if>
                        <xsl:if test="body/noteGroup/note">
                            <div type="fn-group">
                            <xsl:apply-templates select="body/noteGroup/note"/>
                            </div>
                        </xsl:if>
                        <xsl:apply-templates select="body/bibliography"/>
                        <xsl:apply-templates select="header/contentMeta/supportingInformation"/>
                        <xsl:apply-templates select="header/contentMeta/titleGroup/title/citation"/>
                    </back>
                </xsl:if>
            </text>
        </TEI>
    </xsl:template>
    <xsl:template match="header/contentMeta/abstractGroup/abstract/title">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    <xsl:template match="header/contentMeta/abstractGroup/abstract/p">
        <p>
            <xsl:if test="@xml:id">
                <xsl:copy-of select="@xml:id"/>
            </xsl:if>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="header/contentMeta/abstractGroup/abstract/p/infoAsset">
            <term>
                <xsl:if test="@type">
                    <xsl:attribute name="type">
                        <xsl:value-of select="translate(@type,' ','_')"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:if test="@xml:id">
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates/>
            </term>
    </xsl:template>
    
    <xsl:template match="abstractGroup/abstract/p/i">
        <xsl:if test=". !=''"><hi rend="italic"><xsl:apply-templates/></hi></xsl:if>
    </xsl:template>
    
    <xsl:template match="abstractGroup/abstract/p/bold">
        <xsl:if test=". !=''"><hi rend="bold"><xsl:apply-templates/></hi></xsl:if>
    </xsl:template>
  

	<!-- SG - abstract content - mis de coté pour le moment / attente validation TEI board -->
	<!--<xsl:template match="/component/header/contentMeta/abstractGroup/abstract/p"> 
        <xsl:choose>
            <xsl:when test="b">
				<div>
					<head><xsl:value-of select="b/text()"/></head>
					<p><xsl:value-of select="text()"/></p>
				</div>
			</xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="p"/>
            </xsl:otherwise>
        </xsl:choose>
	</xsl:template>-->
	
    <!-- Building the sourceDesc bibliographical representation -->
    <xsl:template match="header" mode="sourceDesc">
        <biblStruct>
            <!-- Genre     -->
            <xsl:if test="publicationMeta[@level='unit']/@type[string-length()&gt; 0]">
                <xsl:attribute name="type">
                    <xsl:value-of select="$codeGenreIstex"/>
                </xsl:attribute>
            </xsl:if>
            <analytic>
                <!-- Title information related to the paper goes here -->
                <!-- redressement des titres vides -->
                    <xsl:choose>
                        <xsl:when test="//header/publicationMeta[@level='unit']/doi='10.1046/j.1523-1739.1997.0110051265.x'">
                            <title level="a" type="main">
                                <xsl:text>Erratum: Diploid expected heterozygosity and haploid allelic diversity equations misprinted</xsl:text>
                            </title></xsl:when>
                        <xsl:when test="//header/publicationMeta[@level='unit']/doi='10.1002/(SICI)1521-401X(199809)26:5&lt;253::AID-AHEH253&gt;3.0.CO;2-S'">
                            <title level="a" type="main">
                                <xsl:text>Vertical and Annual Distribution of Ferric and Ferrous Iron in Acid Mining Lakes</xsl:text> 
                            </title></xsl:when>
                        <xsl:when test="//header/publicationMeta[@level='unit']/doi='10.1002/(SICI)1521-4133(199811)100:11&lt;513::AID-LIPI513&gt;3.0.CO;2-I'">
                            <title level="a" type="main">
                                <xsl:text>Die Bleichung von Speisefetten und Ölen V Aus dem Arbeitskreis "Technologien der industriellen"</xsl:text> 
                            </title>
                        </xsl:when>
                        <xsl:when test="//publicationMeta[@level='unit']/doi='10.1111/insr.12044'">
                            <title level="a" type="main">
                                <xsl:text>Table of contents</xsl:text>
                            </title>
                        </xsl:when>
                        <xsl:when test="//header/publicationMeta[@level='unit']/doi='10.1002/sres.2200'">
                            <title level="a" type="main">
                                <xsl:text>Editorial</xsl:text>
                            </title>
                        </xsl:when>
                        <xsl:otherwise>
                                <xsl:apply-templates select="//titleGroup"/>
                        </xsl:otherwise>
                    </xsl:choose>
                <!-- All authors are included here -->
				<xsl:if test="contentMeta/creators">
					<xsl:apply-templates select="contentMeta/creators"/>
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
                <xsl:apply-templates select="publicationMeta[@level='unit']/doi"/>
                <xsl:apply-templates select="publicationMeta[@level='unit']/idGroup/id"/>
                <xsl:apply-templates select="publicationMeta[@level='unit']/linkGroup/link"/>
            </analytic>
            <monogr>
                <xsl:choose>
                    <xsl:when test="publicationMeta[@level='part']/creators/creator">
                        <xsl:apply-templates select="publicationMeta[@level='part']/creators"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="publicationMeta/issn[@type='print']='0009-9163' and contains(publicationMeta/coverDate/@startDate,'2003') and  publicationMeta/numberingGroup/numbering[@type='journalVolume']='43' ">
                        <title level="j" type="main">
                            <xsl:text>Congenital Anomalies</xsl:text>
                        </title>
                    </xsl:when>
                    <xsl:when test="publicationMeta[@level='product']/titleGroup/title[@type ='main']">
                        <title level="j" type="main">
                            <xsl:value-of select="publicationMeta[@level='product']/titleGroup/title[@type ='main']"/>
                        </title>
                    </xsl:when>
                    <xsl:otherwise>
                        <title level="j" type="main">
                            <xsl:value-of select="publicationMeta[@level='product']/titleGroup/title"/>
                        </title>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- SG ajout titre alternatif -->
                <xsl:if test="publicationMeta[@level='part']/titleGroup/title/@type ='specialIssueTitle'">
                    <title level="j" type="sub">
                        <xsl:value-of select="normalize-space(publicationMeta[@level='part']/titleGroup/title[@type ='specialIssueTitle'][1])"/>
                    </title>
                </xsl:if>
                <xsl:if test="publicationMeta[@level='part']/titleGroup/title/@type ='supplementTitle'">
                    <title level="j" type="sub">
                        <xsl:value-of select="normalize-space(publicationMeta[@level='part']/titleGroup/title[@type ='supplementTitle'][1])"/>
                    </title>
                </xsl:if>
                <!-- SG ajout titre specialIssue -->
                <xsl:choose>
                    <xsl:when test="publicationMeta/issn[@type='print']='0009-9163' and contains(publicationMeta/coverDate/@startDate,'2003') and  publicationMeta/numberingGroup/numbering[@type='journalVolume']='43' "/>
                    <xsl:otherwise>
                        <xsl:if test="publicationMeta[@level='product']/titleGroup/title/@sort !=''">
                            <title level="j" type="alt">
                                <xsl:apply-templates select="publicationMeta[@level='product']/titleGroup/title/@sort"/>
                            </title>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:apply-templates select="publicationMeta[@level='product']/issn"/>
                <xsl:apply-templates select="publicationMeta[@level='product']/doi"/>
                <xsl:apply-templates select="publicationMeta[@level='part']/doi"/>
                <xsl:apply-templates select="publicationMeta[@level='product']/idGroup/id"/>
                <imprint>
	                <xsl:apply-templates select="publicationMeta[@level='part']/numberingGroup/numbering[@type='journalVolume']"/>
	                <xsl:apply-templates select="publicationMeta[@level='part']/numberingGroup/numbering[@type='journalIssue']"/>
                    <xsl:apply-templates select="publicationMeta[@level='part']/numberingGroup/numbering[@type='supplement']"/>
	                <xsl:apply-templates select="publicationMeta[@level='unit']/numberingGroup/numbering[@type='pageFirst']"/>
	                <xsl:apply-templates select="publicationMeta[@level='unit']/numberingGroup/numbering[@type='pageLast']"/>
                    <!-- SG - ajout nombre de pages -->
                    <xsl:apply-templates select="publicationMeta[@level='unit']/countGroup/count[@type='pageTotal']"/>
					
					<xsl:if test="publicationMeta/publisherInfo/publisherName">
                   	 	<xsl:apply-templates select="publicationMeta/publisherInfo/publisherName"/>
					</xsl:if>
                    <!-- SG ajout publisherLoc -->
                    <xsl:if test="publicationMeta/publisherInfo/publisherLoc">
                        <xsl:apply-templates select="publicationMeta/publisherInfo/publisherLoc"/>
                    </xsl:if>
					
					<xsl:if test="publicationMeta[@level='part']/coverDate">
					    <xsl:choose>
					        <xsl:when test="publicationMeta[@level='unit']/doi='10.1111/j.1744-1714.1968.tb00414.x'">
					            <date type="published">
					                <xsl:attribute name="when">
					                <xsl:text>1968</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta[@level='product']/issn[@type='print']='0365-5563' and publicationMeta[@level='part']/numberingGroup/numbering[@type='journalVolume']='80B'">
					            <date type="published">
					                <xsl:attribute name="when">
					                <xsl:text>1972</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta/issn[@type='print']='0002-9246' and publicationMeta/numberingGroup/numbering[@type='journalVolume']='58'">
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:text>1999</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta/issn[@type='print']='0077-8923' and publicationMeta/numberingGroup/numbering[@type='journalVolume']='105'">
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:text>1963</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta/issn[@type='print']='0077-8923' and publicationMeta/numberingGroup/numbering[@type='journalVolume']='196'">
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:text>1972</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta/issn[@type='print']='0141-1314' and publicationMeta/numberingGroup/numbering[@type='journalIssue']='62'">
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:text>2009</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta/issn[@type='print']='1355-4905' and publicationMeta/numberingGroup/numbering[@type='journalVolume']='15'">
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:text>1998</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta/issn[@type='print']='0956-5507' and publicationMeta/numberingGroup/numbering[@type='journalVolume']='7'">
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:text>1996</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta/issn[@type='print']='0265-0665' and publicationMeta/numberingGroup/numbering[@type='journalVolume']='21'">
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:text>2001</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta/issn[@type='print']='0309-8249' and publicationMeta/numberingGroup/numbering[@type='journalVolume']='35'">
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:text>2001</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta/issn[@type='print']='0384-9694' and publicationMeta/numberingGroup/numbering[@type='journalVolume']='29'">
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:text>2001</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta/issn[@type='print']='0026-1068' and publicationMeta/numberingGroup/numbering[@type='journalVolume']='24'">
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:text>1993</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta/issn[@type='print']='0363-6550' and publicationMeta/numberingGroup/numbering[@type='journalVolume']='10'">
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:text>1986</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta/issn[@type='print']='0363-6550' and publicationMeta/numberingGroup/numbering[@type='journalVolume']='12'">
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:text>1987</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:when test="publicationMeta/issn[@type='print']='0023-852X' and publicationMeta/numberingGroup/numbering[@type='journalVolume']='40'">
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:text>1930</xsl:text>
					                </xsl:attribute>
					            </date>
					        </xsl:when>
					        <xsl:otherwise>
					            <date type="published">
					                <xsl:attribute name="when">
					                    <xsl:value-of select="publicationMeta[@level='part']/coverDate/@startDate"/>
					                </xsl:attribute>
					            </date>
					        </xsl:otherwise>
					    </xsl:choose>
					</xsl:if>
                </imprint>
            </monogr>
            <xsl:apply-templates select="article-meta/article-id"/>
        </biblStruct>
    </xsl:template>

	<!-- title group -->
    <xsl:template match="//header/contentMeta/titleGroup">
        <xsl:apply-templates select="title"/>
	</xsl:template>
 
 	<!-- Body content -->
    <xsl:template match="body" mode="bodyOnly">
        <xsl:apply-templates select="section"/>
		<!--<xsl:apply-templates select="//noteGroup"/>-->
    </xsl:template>
 
    <!-- Generic rules for IDs -->
    <xsl:template match="article-id">
        <idno>
            <xsl:attribute name="type">
                <xsl:value-of select="@pub-id-type"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </idno>
    </xsl:template>

	<xsl:template match="creators">
		 <xsl:apply-templates select="creator"/>
	</xsl:template>

    <!-- author related information -->
    <xsl:template match="creator">
        <xsl:choose>
            <xsl:when test="@creatorRole='author'">
        <author>
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
            <xsl:if test="@corresponding='yes'">
                <xsl:attribute name="role">
                    <xsl:text>corresp</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
            <xsl:if test="@affiliationRef">
                <xsl:call-template name="createWileyAffiliations">
                    <xsl:with-param name="restAff" select="translate(@affiliationRef,'#','')"/>
                </xsl:call-template>
            </xsl:if>
            <xsl:if test="@currentRef">
                <xsl:call-template name="createWileyAffiliations2">
                    <xsl:with-param name="restAff2" select="translate(@currentRef,'#','')"/>
                </xsl:call-template>
            </xsl:if>
          <!--  <xsl:if test="@correspondenceRef">
                <xsl:call-template name="createWileyAffiliations3">
                    <xsl:with-param name="restAff3" select="translate(@correspondenceRef,'#','')"/>
                </xsl:call-template>
            </xsl:if>
           <xsl:if test="@noteRef">
                <xsl:call-template name="createWileyAffiliations4">
                    <xsl:with-param name="restAff4" select="translate(@noteRef,'#','')"/>
                </xsl:call-template>
            </xsl:if>-->
            
            <!-- affiliation nomade sans lien auteurs/affiliations
            je teste si présence de 1 affiliation mais pas plus sinon trop d'incohérence-->
            <xsl:if test="//contentMeta/affiliationGroup/affiliation and not(@affiliationRef|@currentRef|@correspondenceRef|@noteRef)">
                <xsl:variable name="countAff">
                    <xsl:value-of select="count(//contentMeta/affiliationGroup/affiliation)"/>
                </xsl:variable>
                <xsl:if test="$countAff ='1'">
                    <affiliation>
                        <xsl:apply-templates select="//contentMeta/affiliationGroup/affiliation"/>
                    </affiliation>
                </xsl:if>
            </xsl:if>
        </author>
            </xsl:when>
            <xsl:when test="@creatorRole='editor' or @creatorRole='sponsoringEditor'">
                <editor>
                    <xsl:attribute name="xml:id">
                        <xsl:variable name="i" select="position()-1"/>
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
                    <xsl:apply-templates/>
                    <xsl:if test="@affiliationRef !=''">
                        <xsl:call-template name="createWileyAffiliations">
                            <xsl:with-param name="restAff" select="translate(@affiliationRef,'#','')"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="@currentRef[string-length()&gt; 0]">
                        <xsl:call-template name="createWileyAffiliations2">
                            <xsl:with-param name="restAff2" select="translate(@currentRef,'#','')"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="@correspondenceRef[string-length()&gt; 0]">
                        <xsl:call-template name="createWileyAffiliations3">
                            <xsl:with-param name="restAff3" select="translate(@correspondenceRef,'#','')"/>
                        </xsl:call-template>
                    </xsl:if>
                   <!-- <xsl:if test="@noteRef">
                        <xsl:call-template name="createWileyAffiliations4">
                            <xsl:with-param name="restAff4" select="translate(@noteRef,'#','')"/>
                        </xsl:call-template>
                    </xsl:if>-->
                </editor>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="contrib">
        <respStmt>
            <resp>
                <xsl:value-of select="@contrib-type"/>
            </resp>
            <xsl:apply-templates/>
        </respStmt>
    </xsl:template>

    <xsl:template match="contrib/address">
        <address>
            <xsl:apply-templates/>
        </address>
    </xsl:template>

    <xsl:template match="dateStruct">
        <date>
            <xsl:value-of select="."/>
        </date>
    </xsl:template>
	
    <xsl:template match="aff" mode="sourceDesc">
        <affiliation>
			<xsl:value-of select="."/>
        </affiliation>
    </xsl:template>

    <!-- Copyright related information to appear in <publicationStmt> -->
    <xsl:template match="copyright-statement">
        <availability>
            <p>
                <xsl:apply-templates/>
            </p>
        </availability>
    </xsl:template>

    <xsl:template match="license/p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="pub-date">
        <date>
            <xsl:choose>
                <xsl:when test="@pub-type='epub'">
                    <xsl:attribute name="type">e-published</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="type">published</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>

            <xsl:attribute name="when">
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldDay" select="day"/>
                    <xsl:with-param name="oldMonth" select="month"/>
                    <xsl:with-param name="oldYear" select="year"/>
                </xsl:call-template>
            </xsl:attribute>
        </date>
    </xsl:template>

	<!-- Structure a note block-->
    <xsl:template match="noteGroup">
        <xsl:apply-templates select="note"/>
    </xsl:template>
	
    <xsl:template match="header/noteGroup/note">
        <note place="inline">
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
		    <xsl:if test="label">
		        <label>
		            <xsl:value-of select="label"/>
		        </label>
		    </xsl:if>
        	<xsl:apply-templates/>
		</note>
    </xsl:template>
    <xsl:template match="body/noteGroup/note">
        <note place="inline">
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:if test="label">
                <label>
                    <xsl:value-of select="label"/>
                </label>
            </xsl:if>
            <xsl:apply-templates/>
        </note>
    </xsl:template>
                
    <xsl:template match="subjectInfo">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="subject">
        <term>
            <xsl:attribute name="ref">
                <xsl:value-of select="@href"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </term>
    </xsl:template>
  
    <xsl:template name="createWileyAffiliations">
        <xsl:param name="restAff"/>
        <xsl:message>Affiliations: <xsl:value-of select="$restAff"/></xsl:message>
        <xsl:choose>
            <xsl:when test="contains($restAff,' ')">
                <affiliation>
                    <xsl:apply-templates select="//affiliation[@xml:id=substring-before($restAff,' ')]"/>
                </affiliation>
                <xsl:call-template name="createWileyAffiliations">
                    <xsl:with-param name="restAff" select="translate(substring-after($restAff,' '),'#','')"/> 
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="//affiliation[@xml:id=$restAff]">
                        <affiliation>
                            <xsl:apply-templates select="//affiliation[@xml:id=$restAff]"/>
                        </affiliation>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="//affiliation[string-length()&gt; 0] and not(//groupName)">
                            <affiliation>
                                <xsl:value-of select="//affiliation"/>
                            </affiliation>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="createWileyAffiliations2">
        <xsl:param name="restAff2"/>
        <xsl:message>Affiliations: <xsl:value-of select="$restAff2"/></xsl:message>
        <xsl:choose>
            <xsl:when test="contains($restAff2,' ')">
                <affiliation>
                    <xsl:apply-templates select="//affiliation[@xml:id=substring-before($restAff2,' ')]"/>
                </affiliation>
                <xsl:call-template name="createWileyAffiliations">
                    <xsl:with-param name="restAff" select="translate(substring-after($restAff2,' '),'#','')"/> 
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <affiliation>
                    <xsl:apply-templates select="//affiliation[@xml:id=$restAff2]"/>
                </affiliation>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="createWileyAffiliations3">
        <xsl:param name="restAff3"/>
        <xsl:message>Affiliations: <xsl:value-of select="$restAff3"/></xsl:message>
        <xsl:choose>
            <xsl:when test="contains($restAff3,' ')">
                <affiliation>
                    <xsl:apply-templates select="//affiliation[@xml:id=substring-before($restAff3,' ')]"/>
                </affiliation>
                <xsl:call-template name="createWileyAffiliations">
                    <xsl:with-param name="restAff" select="translate(substring-after($restAff3,' '),'#','')"/> 
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <affiliation>
                    <xsl:apply-templates select="//affiliation[@xml:id=$restAff3]"/>
                </affiliation>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
  <!--  <xsl:template name="createWileyAffiliations4">
        <xsl:param name="restAff4"/>
        <xsl:message>Affiliations: <xsl:value-of select="$restAff4"/></xsl:message>
        <xsl:choose>
            <xsl:when test="contains($restAff4,' ')">
                <affiliation>
                    <xsl:value-of select="//affiliation[@xml:id=$restAff4]/p"/>
                </affiliation>
            </xsl:when>
        </xsl:choose>
    </xsl:template>-->
    <xsl:template match="affiliationGroup">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="affiliation">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="unparsedAffiliation" name="wileyParseAffiliation">
        <xsl:call-template name="WileyParseAffiliation">
            <xsl:with-param name="theAffil">
                <xsl:value-of select="."/>
            </xsl:with-param>
            <xsl:with-param name="theCountry">
                <xsl:value-of select="ancestor::affiliation/@countryCode"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="WileyParseAffiliation">
        <xsl:param name="theAffil"/>
        <xsl:param name="theCountry"/>
        <xsl:param name="inAddress" select="false()"/>
        <xsl:for-each select="$theAffil">
            <xsl:message>Un bout: <xsl:value-of select="."/></xsl:message>
        </xsl:for-each>
        <xsl:variable name="avantVirgule">
            <xsl:choose>
                <xsl:when test="contains($theAffil,',')">
                    <xsl:value-of select="normalize-space(substring-before($theAffil,','))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space($theAffil)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apresVirgule">
            <xsl:choose>
                <xsl:when test="contains($theAffil,',')">
                    <xsl:value-of select="normalize-space(substring-after($theAffil,','))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="testOrganisation">
            <xsl:call-template name="identifyOrgLevel">
                <xsl:with-param name="theOrg">
                    <xsl:value-of select="$avantVirgule"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="not($inAddress)">
                <xsl:choose>
                    <xsl:when test="$testOrganisation!=''">
                        <orgName>
                            <xsl:attribute name="type">
                                <xsl:value-of select="$testOrganisation"/>
                            </xsl:attribute>
                            <xsl:value-of select="$avantVirgule"/>
                        </orgName>
                        <xsl:if test="$apresVirgule !=''">
                            <xsl:call-template name="WileyParseAffiliation">
                                <xsl:with-param name="theAffil" select="$apresVirgule"/>
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="$testOrganisation=''">
                        <address>
                            <addrLine>
                                <xsl:value-of select="$avantVirgule"/>
                            </addrLine>
                            <xsl:if test="$apresVirgule !=''">
                                <addrLine>
                                    <xsl:value-of select="$apresVirgule"/>
                                </addrLine>
                            </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="//doi='10.1111/j.1600-0471.2000.aae110207.x'">
                                        <country>
                                            <xsl:attribute name="key">
                                                <xsl:text>CA</xsl:text>
                                            </xsl:attribute>
                                            <xsl:text>CANADA</xsl:text>
                                        </country>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:if test="ancestor::affiliation/@countryCode[string-length()&gt; 0]">
                                            <country>
                                                <xsl:attribute name="key">
                                                    <xsl:value-of select="ancestor::affiliation/@countryCode"/>
                                                </xsl:attribute>
                                                <xsl:call-template name="normalizeISOCountryName">
                                                    <xsl:with-param name="country" select="ancestor::affiliation/@countryCode"/>
                                                </xsl:call-template>
                                            </country>
                                            </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                        </address>
                    </xsl:when>
                    <xsl:otherwise>
                        <address>
                            <xsl:choose>
                                <xsl:when test="$avantVirgule">
                                    <xsl:call-template name="WileyParseAffiliation">
                                        <xsl:with-param name="theAffil" select="$theAffil"/>
                                        <xsl:with-param name="inAddress" select="true()"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="WileyParseAffiliation">
                                        <xsl:with-param name="theAffil" select="$theAffil"/>
                                        <xsl:with-param name="inAddress" select="true()"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                            <country>
                                <xsl:choose>
                                    <xsl:when test="//doi='10.1111/j.1600-0471.2000.aae110207.x'">
                                        <xsl:attribute name="key">
                                            <xsl:text>CA</xsl:text>
                                        </xsl:attribute>
                                        <xsl:text>CANADA</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="key">
                                            <xsl:value-of select="ancestor::affiliation/@countryCode"/>
                                        </xsl:attribute>
                                        <xsl:call-template name="normalizeISOCountryName">
                                            <xsl:with-param name="country" select="ancestor::affiliation/@countryCode"/>
                                        </xsl:call-template>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </country>
                        </address>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="testCountry">
                    <xsl:call-template name="normalizeISOCountry">
                        <xsl:with-param name="country" select="$avantVirgule"/>
                    </xsl:call-template>
                </xsl:variable>
                <addrLine1>
                    <xsl:value-of select="$avantVirgule"/>
                </addrLine1>
                <xsl:if test="$apresVirgule !=''">
                    <xsl:call-template name="WileyParseAffiliation">
                        <xsl:with-param name="theAffil" select="$apresVirgule"/>
                        <xsl:with-param name="inAddress" select="true()"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="orgName">
        <orgName type="institution">
            <xsl:apply-templates/>
        </orgName>
    </xsl:template>
    <xsl:template match="orgDiv">
        <orgName type="division">
            <xsl:apply-templates/>
        </orgName>
    </xsl:template>
    
    <xsl:template match="address">
        <address>
            <xsl:apply-templates/>
        </address>
    </xsl:template>
    
    <xsl:template match="street">
        <street>
            <xsl:apply-templates/>
        </street>
    </xsl:template>
    
    <xsl:template match="postCode">
        <postCode>
            <xsl:apply-templates/>
        </postCode>
    </xsl:template>
    
    <xsl:template match="city">
        <settlement>
            <xsl:apply-templates/>
        </settlement>
    </xsl:template>
    
    <xsl:template match="country">
        <xsl:variable name="testCountry">
            <xsl:call-template name="normalizeISOCountry">
                <xsl:with-param name="country" select="ancestor::affiliation/@countryCode"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="ancestor::affiliation/@countryCode">
                <country>
                    <xsl:attribute name="key">
                        <xsl:value-of select="$testCountry"/>
                    </xsl:attribute>
                    <xsl:call-template name="normalizeISOCountryName">
                        <xsl:with-param name="country" select="ancestor::affiliation/@countryCode"/>
                    </xsl:call-template>
                </country>
            </xsl:when>
            <xsl:otherwise>
                <country>
                    <xsl:value-of select="."/>
                </country>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="state">
        <state>
            <xsl:apply-templates select="text()"/>
        </state>
    </xsl:template>
    
    <xsl:template match="countryPart">
        <region>
            <xsl:apply-templates select="text()"/>
        </region>
    </xsl:template>
    
    <xsl:template match="fundingInfo">
        <funder>
            <xsl:apply-templates select="fundingAgency"/>
            <xsl:apply-templates select="fundingNumber"/>
        </funder>
    </xsl:template>
    <xsl:template match="fundingAgency">
        <name>
            <xsl:apply-templates/>
        </name>
    </xsl:template>
    <xsl:template match="fundingNumber">
        <idno>
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    
    <xsl:template match="keywordGroup">
        <keywords>
            <xsl:if test="@xml:lang[string-length()&gt;0]">
                <xsl:copy-of select="@xml:lang"/>
            </xsl:if>
            <xsl:apply-templates select="keyword"/>
        </keywords>
    </xsl:template>
    <xsl:template match="keyword">
        <term>
            <xsl:copy-of select="@xml:id"/>
            <xsl:apply-templates/>
        </term>
    </xsl:template>
    <xsl:template match="title">
            <xsl:choose>
                <xsl:when test="contains(.[@type='main'],'Abstracts') or .[@type='main']/citation[@type='book']">
                    <xsl:choose>
                        <xsl:when test="contains(.[@type='main'],'Abstracts')">
                            <xsl:choose>
                                <xsl:when test="//publicationMeta[@level='part']/titleGroup/title[@type='supplementTitle']">
                                    <title level="a" type="main">
                                        <xsl:value-of select="title[@type='main']"/>
                                        <xsl:text> : </xsl:text>
                                        <xsl:value-of select="//publicationMeta[@level='part']/titleGroup/title[@type='supplementTitle']"/>
                                    </title>  
                                </xsl:when>
                                <xsl:otherwise>
                                    <title level="a" type="main">
                                        <xsl:value-of select=".[@type='main']"/>
                                    </title>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when test=".[@type='main']/citation[@type='book']">
                            <xsl:for-each select=".[@type='main']/citation[@type='book']">
                                <title level="a" type="main">
                                    <xsl:if test="//publicationMeta[@level='unit']/titleGroup/title[@type='articleCategory']">
                                        <xsl:value-of select="//publicationMeta[@level='unit']/titleGroup/title[@type='articleCategory']"/>
                                        <xsl:text> - </xsl:text>
                                    </xsl:if>
                                    <xsl:choose>
                                        <xsl:when test=".[@type='tocForm']">
                                            <xsl:value-of select="normalize-space(//header/contentMeta/titleGroup/title[@type='tocForm'])"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:for-each select="bookTitle">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:for-each>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </title>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="@type='subtitle'">
                            <xsl:apply-templates select="." mode="subtitle"/>
                        </xsl:when>
                        <xsl:when test="@type='short'">
                            <xsl:apply-templates select="." mode="short"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <title level= "a" type="main">
                                <xsl:if test="@xml:lang">
                                    <xsl:choose>
                                        <xsl:when test="//component/header/publicationMeta[@level='unit']/doi='10.1002/ejic.200400619'">
                                            <xsl:attribute name="xml:lang">en</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="//component/header/publicationMeta/issn[@type='print']='0378-5599'">
                                            <xsl:attribute name="xml:lang">fr</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="//component/header/publicationMeta[@level='unit']/doi='10.1002/asna.19322451602'">
                                            <xsl:attribute name="xml:lang">en</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="//component/header/publicationMeta[@level='unit']/doi='10.1002/(SICI)1099-0682(199809)1998:9&lt;1205::AID-EJIC1205&gt;3.0.CO;2-F' or header/publicationMeta[@level='unit']/doi='10.1002/(SICI)1521-3897(199910)341:7&lt;657::AID-PRAC657&gt;3.0.CO;2-P'or header/publicationMeta[@level='unit']/doi='10.1002/(SICI)1521-3897(199908)341:6&lt;568::AID-PRAC568&gt;3.0.CO;2-H'">
                                            <xsl:attribute name="xml:lang">en</xsl:attribute>
                                        </xsl:when>
                                        <!-- correction ouzbeck 10.1002/asna.2103030307 -->
                                        <xsl:when test="//component/header/publicationMeta[@level='unit']/doi='10.1111/j.1550-7408.1980.tb04229.x' or header/publicationMeta[@level='unit']/doi='10.1111/j.1365-3180.1990.tb01689.x'or header/publicationMeta[@level='unit']/doi='10.1002/asna.2103030307'or header/publicationMeta[@level='unit']/doi='10.1002/asna.2103030305'">
                                            <xsl:attribute name="xml:lang">de</xsl:attribute>
                                        </xsl:when>
                                        <!-- correction arabe 10.1002/1522-239X(200210)113:5/6&lt;342::AID-FEDR342&gt;3.0.CO;2-S -->
                                        <xsl:when test="//component/header/publicationMeta[@level='unit']/doi='10.1002/1522-239X(200210)113:5/6&lt;342::AID-FEDR342&gt;3.0.CO;2-S'">
                                            <xsl:attribute name="xml:lang">es</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="@xml:lang and //component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2008.00477.x' ">
                                            <xsl:attribute name="xml:lang">de</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="@xml:lang and //component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2008.00484.x'">
                                            <xsl:attribute name="xml:lang">es</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="@xml:lang and //component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2007.00453.x'">
                                            <xsl:attribute name="xml:lang">it</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="@xml:lang and //component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2008.00459.x'">
                                            <xsl:attribute name="xml:lang">fr</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="@xml:lang ='be'">
                                            <xsl:attribute name="xml:lang">nl</xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="@xml:lang='ka'">
                                            <xsl:choose>
                                                <xsl:when test="//component/header/publicationMeta[@level='unit']/doi='10.1111/j.1439-0469.2008.00489.x'">
                                                    <xsl:attribute name="xml:lang">it</xsl:attribute>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:attribute name="xml:lang">de</xsl:attribute>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:if test="@xml:lang">
                                                <xsl:attribute name="xml:lang">
                                                    <xsl:value-of select="translate(@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                </xsl:attribute>
                                            </xsl:if>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="//component/header/publicationMeta[@level='unit']/doi='10.1002/cbdv.200490137'">Prediction of Aqueous Solubility Based on Large Datasets Using Several QSPR Models Utilizing Topological Structure Representation</xsl:when>
                                    <xsl:when test="//component/header/publicationMeta[@level='unit']/doi='10.1046/j.1365-2605.1997.00042.x'">Letter to the Editor</xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </title>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
    </xsl:template>
    
    <xsl:template match="title" mode="subtitle">
        <title level= "a" type="sub">
            <!-- SG - ajout de la langue du titre -->
            <xsl:if test="@xml:lang">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="@xml:lang"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="."/>
        </title>
    </xsl:template>
    
    <xsl:template match="title" mode="short">
        <title level= "a" type="short">
            <!-- SG - ajout de la langue du titre -->
            <xsl:if test="@xml:lang">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="@xml:lang"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="."/>
        </title>
    </xsl:template>
    
</xsl:stylesheet>
