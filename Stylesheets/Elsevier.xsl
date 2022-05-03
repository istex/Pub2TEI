<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:m="http://www.w3.org/1998/Math/MathML" 
    xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:els1="http://www.elsevier.com/xml/ja/dtd"    
    xmlns:els2="http://www.elsevier.com/xml/cja/dtd"
    xmlns:s1="http://www.elsevier.com/xml/si/dtd"
    xmlns:sb="http://www.elsevier.com/xml/common/struct-bib/dtd"
    xmlns:sa="http://www.elsevier.com/xml/common/struct-aff/dtd"
    exclude-result-prefixes="xsi m els1 els2 s1 sb ce xlink">
    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:include href="ElsevierFormula.xsl"/>
    <xsl:param name="partOfSetXmlPath" />
    <xsl:variable name="docIssueEls" select="document($partOfSetXmlPath)"/>
    <xsl:variable name="currentPii" select="//ce:pii"/>
    
    <xsl:variable name="titleCodes" select="document('TitleCodes.xml')"/>
    <xsl:variable name="value_to_jid" select="//jid|//els1:jid | //els2:jid"/>
    <xsl:variable name="resultCodeTitle">
        <xsl:value-of select="$titleCodes/descendant::tei:row[tei:cell/text() = $value_to_jid]/tei:cell[@role = 'name']"/>
    </xsl:variable>

    <xsl:variable name="substringOfDate">
        <xsl:choose>
            <xsl:when test="string-length($date)=8">
                <xsl:value-of select="substring($date,-3,string-length($date))"/>
            </xsl:when>
            <xsl:when test="string-length($date)=6">
                <xsl:value-of select="substring($date,-1,string-length($date))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$date"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="titre">
        <xsl:choose>
            <xsl:when test="//ce:doi='10.1016/S0140-7007(01)00037-8'">
                <xsl:text>A Word from the Director / Le mot du Directeur</xsl:text>
            </xsl:when>
            <xsl:when test="//ce:doi='10.1016/S0923-5965(97)00056-8'">
                <xsl:text>Foreword</xsl:text>
            </xsl:when>
            <xsl:when test="//ce:doi='10.1016/S0377-8398(00)00009-8'">
                <xsl:text>Introduction : Nannoplankton ecology and palaeoecology</xsl:text>
            </xsl:when>
            <xsl:when test="//ce:doi='10.1006/jfca.1996.0012'">
                <xsl:text>Book review : The Pacific Islands Food Composition Tables by C. A. Dignan, B. A. Burlingame, J. M. Arthur, R. J. Quigley, and G. C. Milligan</xsl:text>
            </xsl:when>
            <xsl:when test="//ce:doi='10.1016/S0165-1684(98)00205-9'">
                <xsl:text>Editorial</xsl:text>
            </xsl:when>
            <xsl:when test="//ce:doi='10.1006/jfca.1996.0013'">
                <xsl:text>Book review : Fats and Fatty Acids in New Zealand Foods, by R. J. Quigley, B. A. Burlingame, G. C. Milligan, and J. J. Gibson</xsl:text>
            </xsl:when>
            <xsl:when test="//ce:doi='10.1006/jfca.1996.0014'">
                <xsl:text>Book review : Quality and Accessibility of Food Related Data, by Heather Greenfield</xsl:text>
            </xsl:when>
            <xsl:when test="//ce:doi='10.1016/S0142-9418(00)00029-5'">
                <xsl:text>Editorial</xsl:text>
            </xsl:when>
            <xsl:when test="//ce:doi='10.1016/S0168-9002(99)01283-8'">
                <xsl:text>Index</xsl:text>
            </xsl:when>
            <xsl:when test="//ce:doi='10.1053/smrv.1999.0085'">
                <xsl:text>Table of contents</xsl:text>
            </xsl:when>
            <xsl:when test="//ce:doi='10.1016/S1049-3867(01)00088-3'">
                <xsl:text>Erratum to 'An Intersection of Women’s and Perinatal Health: The Role of Chronic Disease'</xsl:text>
            </xsl:when>
            <xsl:when test="//ce:doi='10.1016/S0009-2509(99)00312-7'">
                <xsl:text>Erratum to 'Conversion-temperature trajectories for well mixed adsorptive reactorsa'</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="textfn">
                    <xsl:value-of select="//ce:dochead/ce:textfn"/>
                </xsl:variable>
                <xsl:value-of select="$textfn"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
<!-- rattrapage dates erronées Elsevier ISTEX-->
    
    <xsl:variable name="codeISSN">
        <xsl:value-of select="$docIssueEls//issue-info/ce:issn | $docIssueEls//s1:issue-info/ce:issn"/>
    </xsl:variable>
    <xsl:variable name="codeVol">
        <xsl:value-of select="$docIssueEls//vol-first | $docIssueEls//s1:vol-first"/>
    </xsl:variable>
    <xsl:variable name="codeNum">
        <xsl:value-of select="$docIssueEls//iss-first | $docIssueEls//s1:iss-first"/>
    </xsl:variable>
    <xsl:variable name="date">
        <xsl:value-of select="$docIssueEls//issue-data/cover-date/date-range/start-date | $docIssueEls//s1:issue-data/s1:cover-date/s1:date-range/s1:start-date"/>
    </xsl:variable>
    
    <xsl:variable name="rattrapageVolElsevier">
        <xsl:choose>
            <xsl:when test="$codeISSN='0022-1902' and $codeVol='28' and $date='1976'">sup.28</xsl:when>
            <xsl:when test="$codeISSN='0024-6301' and $codeVol='2' and $date='1978'">11</xsl:when>
            <xsl:when test="$codeISSN='0021-9673' and $codeVol='793' and $date='1997'">778</xsl:when>
            <xsl:when test="$codeISSN='0304-8853' and $codeVol='164' and $date='1997'">165</xsl:when>
            <xsl:when test="$codeISSN='0304-8853' and $codeVol='163' and $date='1997'">165</xsl:when>
            <xsl:when test="$codeISSN='0278-4254' and $codeVol='17' and $date='1997'">21</xsl:when>
            <xsl:when test="$codeISSN='0278-4254' and $codeVol='17' and $date='1997'">21</xsl:when>
            <xsl:when test="$codeISSN='0399-077X' and $codeVol='12' and $date='1997'">27</xsl:when>
            <xsl:when test="$codeISSN='0166-1280' and $codeVol='22' and $date='1985'">121</xsl:when>
            <xsl:when test="$codeISSN='0166-1280' and $codeVol='24' and $date='1985'">123</xsl:when>
            <xsl:when test="$codeISSN='0092-1157' and $codeVol='12' and $date='1985'">13</xsl:when>
            <xsl:when test="$codeISSN='0169-7552' and $codeVol='25' and $date='1994'">sup.3</xsl:when>
            <xsl:when test="$codeISSN='0169-7552' and $codeVol='26' and $date='1995'">sup.4</xsl:when>
            <xsl:when test="$codeISSN='0016-6480' and $codeVol='2' and $date='1969'">sup.2</xsl:when>
            <xsl:when test="$codeISSN='0016-6480' and $codeVol='1' and $date='1962'">sup.1</xsl:when>
            <xsl:when test="$codeISSN='0014-4827' and $codeVol='8' and $date='1961'">sup.8</xsl:when>
            <xsl:when test="$codeISSN='0014-4827' and $codeVol='7' and $date='1959'">sup.7</xsl:when>
            <xsl:when test="$codeISSN='0016-6480' and $codeVol='3' and $date='1972'">sup.3</xsl:when>
            <xsl:when test="$codeISSN='0765-1597' and $codeVol='1' and $date='1996'">1-sup.1</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$docIssueEls//vol-first | $docIssueEls//s1:vol-first"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <!-- rattrapage numéros erronés -->
    <xsl:variable name="rattrapageNumElsevier">
        <xsl:choose>
            <xsl:when test="$codeISSN='0399-077X' and $codeVol='12' and $date='1997'">12</xsl:when>
            <xsl:when test="$codeISSN='0142-1123' and $codeVol='19' and $date='1998' and $codeNum='93'">sup.1</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$docIssueEls//iss-first | $docIssueEls//s1:iss-first"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:template match="article[item-info] |els1:article[els1:item-info] | els2:article[els2:item-info] | converted-article[item-info] |els1:converted-article[els1:item-info] | els2:converted-article[els2:item-info] |  simple-article[item-info] |  els1:simple-article[els1:item-info] | els2:simple-article[els2:item-info] |book-review[item-info]| els1:book-review[els1:item-info] |els2:book-review[els2:item-info] |bibliography[item-info]| els1:bibliography[els1:item-info] |els2:bibliography[els2:item-info] |catalog[item-info]| els1:catalog[els1:item-info] |els2:catalog[els2:item-info] |book[item-info]| els1:book[els1:item-info] |els2:book[els2:item-info] |examination[item-info]| els1:examination[els1:item-info] |els2:examination[els2:item-info] |exam[item-info]| els1:exam[els1:item-info] |els2:exam[els2:item-info] |fb-non-chapter[item-info]| els1:fb-non-chapter[els1:item-info] |els2:fb-non-chapter[els2:item-info] |introduction[item-info]| els1:introduction[els1:item-info] |els2:introduction[els2:item-info] |simple-chapter[item-info]| els1:simple-chapter[els1:item-info] |els2:simple-chapter[els2:item-info] |chapter[item-info]| els1:chapter[els1:item-info] |els2:chapter[els2:item-info]">
        <TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:if test="@xml:lang">
                <xsl:copy-of select="@xml:lang"/>
            </xsl:if>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <xsl:apply-templates select="ce:dochead/ce:textfn"/>
                        <xsl:choose>
                            <xsl:when test="simple-head/ce:title | els1:simple-head/ce:title|els2:simple-head/ce:title">
                                <title level="a" type="main">
                                    <xsl:value-of select="simple-head/ce:title| els1:simple-head/ce:title|els2:simple-head/ce:title"/>
                                </title>
                                <xsl:if test="simple-head/ce:dochead/ce:textfn[string-length() &gt; 0]| els1:simple-head/ce:dochead/ce:textfn[string-length() &gt; 0] | els2:simple-head/ce:dochead/ce:textfn[string-length() &gt; 0]">
                                    <title level="a" type="sub">
                                        <xsl:value-of select="simple-head/ce:dochead/ce:textfn | els1:simple-head/ce:dochead/ce:textfn | els2:simple-head/ce:dochead/ce:textfn"/>
                                    </title>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test="els1:book-review-head/ce:title | els2:book-review-head/ce:title |book-review-head/ce:title !=''">
                                <title level="a" type="main">
                                    <xsl:value-of select="els1:book-review-head/ce:title | els2:book-review-head/ce:title |book-review-head/ce:title"/>
                                </title>
                                <xsl:if test="book-review-head/ce:dochead/ce:textfn[string-length() &gt; 0]| els1:book-review-head/ce:dochead/ce:textfn[string-length() &gt; 0] | els2:book-review-head/ce:dochead/ce:textfn[string-length() &gt; 0]">
                                    <title level="a" type="sub">
                                        <xsl:value-of select="book-review-head/ce:dochead/ce:textfn | els1:book-review-head/ce:dochead/ce:textfn | els2:book-review-head/ce:dochead/ce:textfn"/>
                                    </title>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test="els1:head/ce:title | els2:head/ce:title |head/ce:title ='' or not(els1:head/ce:title | els2:head/ce:title |head/ce:title)">
                                <title level="a" type="main">
                                    <xsl:value-of select="$titre"/>
                                </title>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="els1:head/ce:title |els2:head/ce:title | head/ce:title"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="els1:head/ce:subtitle | els2:head/ce:subtitle |head/ce:subtitle">
                            <title level="a" type="sub">
                                <xsl:value-of select="els1:head/ce:subtitle | els2:head/ce:subtitle |head/ce:subtitle"/>
                            </title>
                        </xsl:if>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <date type="published">
                            <xsl:attribute name="when">
                                <xsl:value-of select="$substringOfDate"/>
                            </xsl:attribute>
                        </date>
                        <xsl:apply-templates
                            select="els1:item-info/ce:copyright |els2:item-info/ce:copyright | item-info/ce:copyright"/>
                    </publicationStmt>
                    <!-- SG - ajout du codeGenre article et revue -->
                    <notesStmt>
                        <!-- niveau article / chapter -->
                        <note type="content-type">
                            <xsl:choose>
                                <xsl:when test="//@docsubtype[string-length() &gt; 0]">
                                    <xsl:attribute name="subtype">
                                        <xsl:value-of select="$codeGenreIstex"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="source">
                                        <xsl:value-of select="$codeGenreElsevier"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="scheme">
                                        <xsl:value-of select="$codeGenreArk"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$codeGenreIstex"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:if test="not(//@docsubtype)">
                                        <xsl:attribute name="subtype">N/A</xsl:attribute>
                                        <xsl:attribute name="source">ISTEX</xsl:attribute>
                                        <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:attribute>
                                        <xsl:text>other</xsl:text>
                                    </xsl:if>
                                </xsl:otherwise>
                            </xsl:choose>
                        </note>
                        <!-- niveau revue / book -->
                        <!-- genre de publication -->
                        <xsl:choose>
                            <xsl:when test="$docIssueEls//issue-info/ce:isbn[string-length() &gt; 0] and $docIssueEls//issue-info/ce:issn[string-length() &gt; 0]">
                                <note type="publication-type">
                                    <xsl:attribute name="subtype">book-series</xsl:attribute>
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="$docIssueEls//issue-info/ce:isbn[string-length() &gt; 0] and not($docIssueEls//issue-info/ce:issn[string-length() &gt; 0])">
                                <note type="publication-type">
                                    <xsl:attribute name="subtype">book</xsl:attribute>
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                    <xsl:text>book</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="$docIssueEls//s1:issue-info/ce:isbn[string-length() &gt; 0] and $docIssueEls//s1:issue-info/ce:issn[string-length() &gt; 0]">
                                <note type="publication-type">
                                    <xsl:attribute name="subtype">book-series</xsl:attribute>
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="$docIssueEls//s1:issue-info/ce:isbn[string-length() &gt; 0] and not($docIssueEls//s1:issue-info/ce:issn[string-length() &gt; 0])">
                                <note type="publication-type">
                                    <xsl:attribute name="subtype">book</xsl:attribute>
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                    <xsl:text>book</xsl:text>
                                </note>
                            </xsl:when>
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
                        <biblStruct type="inbook">
                            <analytic>
                                <!-- Title information related to the paper goes here -->
                                <!-- rattrapage titres vides -->
                                <xsl:if test="simple-head/ce:title | els1:simple-head/ce:title|els2:simple-head/ce:title">
                                    <title level="a" type="main">
                                        <xsl:value-of select="simple-head/ce:title | els1:simple-head/ce:title|els2:simple-head/ce:title"/>
                                    </title>
                                    <xsl:if test="simple-head/ce:dochead/ce:textfn[string-length() &gt; 0]| els1:simple-head/ce:dochead/ce:textfn[string-length() &gt; 0] | els2:simple-head/ce:dochead/ce:textfn[string-length() &gt; 0]">
                                        <title level="a" type="sub">
                                            <xsl:value-of select="simple-head/ce:dochead/ce:textfn | els1:simple-head/ce:dochead/ce:textfn | els2:simple-head/ce:dochead/ce:textfn"/>
                                        </title>
                                    </xsl:if>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="els1:book-review-head/ce:title | els2:book-review-head/ce:title |book-review-head/ce:title !=''">
                                        <title level="a" type="main">
                                            <xsl:value-of select="els1:book-review-head/ce:title | els2:book-review-head/ce:title |book-review-head/ce:title"/>
                                        </title>
                                        <xsl:if test="book-review-head/ce:dochead/ce:textfn[string-length() &gt; 0]| els1:book-review-head/ce:dochead/ce:textfn[string-length() &gt; 0] | els2:book-review-head/ce:dochead/ce:textfn[string-length() &gt; 0]">
                                            <title level="a" type="sub">
                                                <xsl:value-of select="book-review-head/ce:dochead/ce:textfn | els1:book-review-head/ce:dochead/ce:textfn | els2:book-review-head/ce:dochead/ce:textfn"/>
                                            </title>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="simple-head/ce:title | els1:head/ce:title 
                                        |els2:head/ce:title 
                                        | head/ce:title ='' 
                                        or not(simple-head/ce:title | els1:head/ce:title |els2:head/ce:title | head/ce:title)">
                                        <title level="a" type="main">
                                            <xsl:value-of select="$titre"/>
                                        </title>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="els1:head/ce:title | els2:head/ce:title |head/ce:title"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="els1:head/ce:subtitle | els2:head/ce:subtitle |head/ce:subtitle">
                                    <title level="a" type="sub">
                                        <xsl:value-of select="els1:head/ce:subtitle | els2:head/ce:subtitle |head/ce:subtitle"/>
                                    </title>
                                </xsl:if>
                                <xsl:if test="els1:head/ce:presented |els2:head/ce:presented | head/ce:presented">
                                    <title level="a" type="sub">
                                        <xsl:value-of select="els1:head/ce:presented |els2:head/ce:presented | head/ce:presented"/>
                                    </title>
                                </xsl:if>
                                <!-- All authors are included here -->
                                <xsl:apply-templates select="simple-head/ce:author-group/ce:author | els1:simple-head/ce:author-group/ce:author| els2:simple-head/ce:author-group/ce:author | els1:head/ce:author-group/ce:author | els2:head/ce:author-group/ce:author | head/ce:author-group/ce:author | book-review-head/ce:author-group/ce:author | els1:book-review-head/ce:author-group/ce:author| els2:book-review-head/ce:author-group/ce:author"/>
                                 <xsl:apply-templates
                                    select="els1:head/ce:author-group/ce:collaboration |els2:head/ce:author-group/ce:collaboration | head/ce:author-group/ce:collaboration"/>
                                <!-- identifier -->
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
                                <xsl:apply-templates select="els1:item-info/ce:doi |els2:item-info/ce:doi | item-info/ce:doi"/>
                                <xsl:apply-templates select="els1:item-info/ce:pii |els2:item-info/ce:pii | item-info/ce:pii"/>
                                <xsl:apply-templates select="els1:item-info/els1:aid |els2:item-info/els2:aid | item-info/els1:aid| item-info/els2:aid"/>
                                <xsl:apply-templates select="els1:item-info/ce:document-thread |els2:item-info/ce:document-thread | item-info/ce:document-thread"/>
                            </analytic>
                            <monogr>
                                <!-- verbalisation titre série / journal -->
                                <xsl:if test="//els1:item-info/els1:jid |//els2:item-info/els2:jid | //item-info/jid">
                                    <title type="main">
                                        <xsl:attribute name="level">
                                            <xsl:choose>
                                                <xsl:when test="$docIssueEls//s1:issue-info/s1:jid">s</xsl:when>
                                                <xsl:otherwise>j</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:attribute>
                                        <xsl:value-of select="$resultCodeTitle"/>
                                    </title>
                                    <title type="abbrev">
                                        <xsl:attribute name="level">
                                            <xsl:choose>
                                                <xsl:when test="$docIssueEls//s1:issue-info/s1:jid">s</xsl:when>
                                                <xsl:otherwise>j</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:attribute>
                                        <xsl:value-of select="$value_to_jid"/>
                                    </title>
                                </xsl:if>
                                <!-- titre supplémentaire -->
                                <xsl:if test="$docIssueEls//issue-data/title-editors-group/ce:title[string-length() &gt; 0] | $docIssueEls//s1:issue-data/s1:title-editors-group/ce:title[string-length() &gt; 0]">
                                    <title type="sub">
                                        <xsl:value-of select="$docIssueEls//issue-data/title-editors-group/ce:title | $docIssueEls//s1:issue-data/s1:title-editors-group/ce:title"/>
                                        <xsl:if test="$docIssueEls//issue-data/title-editors-group/conference-info/venue[string-length() &gt; 0] | $docIssueEls//s1:issue-data/s1:title-editors-group/s1:conference-info/s1:venue[string-length() &gt; 0]">
                                            <xsl:text>, </xsl:text>
                                            <xsl:value-of select="$docIssueEls//issue-data/title-editors-group/conference-info/venue | $docIssueEls//s1:issue-data/s1:title-editors-group/s1:conference-info/s1:venue"/>
                                        </xsl:if>
                                    </title>
                                </xsl:if>
                                <!-- identifiants-->
                                <xsl:if test="//els1:item-info/els1:aid |//els2:item-info/els2:aid | //item-info/aid">
                                    <idno type="aid">
                                        <xsl:value-of select="//els1:item-info/els1:aid |//els2:item-info/els2:aid | //item-info/aid"/>
                                    </idno>
                                </xsl:if>
                                <xsl:if test="$docIssueEls//issue-info/ce:issn[string-length() &gt; 0] | $docIssueEls//s1:issue-info/ce:issn[string-length() &gt; 0] and not($docIssueEls//issue-info/ce:isbn|$docIssueEls//s1:issue-info/ce:isbn)">
                                    <xsl:for-each select="$docIssueEls//issue-info/ce:issn | $docIssueEls//s1:issue-info/ce:issn">
                                        <idno type="pISSN">
                                            <xsl:value-of select="."/>
                                        </idno>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="$docIssueEls//issue-info/ce:isbn[string-length() &gt; 0] | $docIssueEls//s1:issue-info/ce:isbn[string-length() &gt; 0]">
                                    <xsl:for-each select="$docIssueEls//issue-info/ce:isbn | $docIssueEls//s1:issue-info/ce:isbn">
                                        <idno type="ISBN">
                                            <xsl:value-of select="."/>
                                        </idno>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="$docIssueEls//issue-info/ce:doi[string-length() &gt; 0] | $docIssueEls//s1:issue-info/ce:doi[string-length() &gt; 0]">
                                    <idno type="DOI">
                                        <xsl:value-of select="$docIssueEls//issue-info/ce:doi | $docIssueEls//s1:issue-info/ce:doi"/>
                                    </idno>
                                </xsl:if>
                                <xsl:if test="$docIssueEls//issue-info/ce:pii[string-length() &gt; 0] |$docIssueEls//s1:issue-info/ce:pii[string-length() &gt; 0]">
                                    <idno type="PII">
                                        <xsl:value-of select="$docIssueEls//issue-info/ce:pii | $docIssueEls//s1:issue-info/ce:pii"/>
                                    </idno>
                                </xsl:if>
                                <!-- PL: note for me, does the issn appears in the biblio section? -->
                                <xsl:apply-templates select="//ce:issn"/>
                                <!-- Just in case -->
                                <!-- editors -->
                                <xsl:if test="$docIssueEls//issue-data/title-editors-group/ce:editors/ce:author-group[string-length() &gt; 0] | $docIssueEls//s1:issue-data/s1:title-editors-group/ce:editors/ce:author-group[string-length() &gt; 0]">
                                    <xsl:for-each select="$docIssueEls//issue-data/title-editors-group/ce:editors/ce:author-group | $docIssueEls//s1:issue-data/s1:title-editors-group/ce:editors/ce:author-group">
                                        <xsl:if test="ce:author[string-length() &gt; 0]">
                                            <xsl:for-each select="ce:author">
                                                <editor>
                                                    <persName>
                                                        <xsl:if test="ce:given-name[string-length() &gt; 0]">
                                                            <forename type="first">
                                                                <xsl:value-of select="ce:given-name"/>
                                                            </forename>
                                                        </xsl:if>
                                                        <xsl:if test="ce:surname[string-length() &gt; 0]">
                                                            <surname>
                                                                <xsl:value-of select="ce:surname"/>
                                                            </surname>
                                                        </xsl:if>
                                                    </persName>
                                                </editor>
                                            </xsl:for-each>
                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:if>
                                
                                <!--meeting-->
                                <xsl:if test="$docIssueEls//issue-data/title-editors-group/conference-info/venue[string-length() &gt; 0] | $docIssueEls//s1:issue-data/s1:title-editors-group/s1:conference-info/s1:venue[string-length() &gt; 0]">
                                    <meeting>
                                        <xsl:if test="$docIssueEls//issue-data/title-editors-group/ce:title[string-length() &gt; 0] |$docIssueEls//s1:issue-data/s1:title-editors-group/ce:title[string-length() &gt; 0]">
                                            <xsl:for-each select="$docIssueEls//issue-data/title-editors-group/ce:title|$docIssueEls//s1:issue-data/s1:title-editors-group/ce:title">
                                                <addName>
                                                    <xsl:value-of select="."/>
                                                </addName>
                                            </xsl:for-each>
                                        </xsl:if>
                                        <xsl:if test="$docIssueEls//issue-data/title-editors-group/conference-info/venue[string-length() &gt; 0] | $docIssueEls//s1:issue-data/s1:title-editors-group/s1:conference-info/s1:venue[string-length() &gt; 0]">
                                            <placeName>
                                                <xsl:value-of select="$docIssueEls//issue-data/title-editors-group/conference-info/venue | $docIssueEls//s1:issue-data/s1:title-editors-group/s1:conference-info/s1:venue"/>
                                            </placeName>
                                        </xsl:if>
                                        <xsl:if test="$docIssueEls//issue-data/title-editors-group/conference-info/date-range/start-date[string-length() &gt; 0] | $docIssueEls//s1:issue-data/s1:title-editors-group/s1:conference-info/s1:date-range/s1:start-date[string-length() &gt; 0]">
                                            <date from="{$docIssueEls//issue-data/title-editors-group/conference-info/date-range/start-date | $docIssueEls//s1:issue-data/s1:title-editors-group/s1:conference-info/s1:date-range/s1:start-date}">
                                                <xsl:value-of select="$docIssueEls//issue-data/title-editors-group/conference-info/date-range/start-date | $docIssueEls//s1:issue-data/s1:title-editors-group/s1:conference-info/s1:date-range/s1:start-date"/>
                                            </date>
                                        </xsl:if>
                                        <xsl:if test="$docIssueEls//issue-data/title-editors-group/conference-info/date-range/end-date[string-length() &gt; 0] | $docIssueEls//s1:issue-data/s1:title-editors-group/s1:conference-info/s1:date-range/s1:end-date[string-length() &gt; 0]">
                                            <date to="{$docIssueEls//issue-data/title-editors-group/conference-info/date-range/end-date | $docIssueEls//s1:issue-data/s1:title-editors-group/s1:conference-info/s1:date-range/s1:end-date}">
                                                <xsl:value-of select="$docIssueEls//issue-data/title-editors-group/conference-info/date-range/end-date | $docIssueEls//s1:issue-data/s1:title-editors-group/s1:conference-info/s1:date-range/s1:end-date"/>
                                            </date>
                                        </xsl:if>
                                    </meeting>
                                </xsl:if>
                                
                                <imprint>
                                    <publisher scheme="https://scientific-publisher.data.istex.fr/ark:/67375/H02-C6NSG6CL-G">ELSEVIER</publisher>
                                  <xsl:choose>
                                        <xsl:when test="$date">
                                            <date type="published">
                                                <xsl:attribute name="when">
                                                    <xsl:value-of select="$substringOfDate"/>
                                                </xsl:attribute>
                                            </date>
                                        </xsl:when>
                                        <xsl:when test="$docIssueEls//issue-data/cover-date/date-range/start-date[string-length() &gt; 0] |$docIssueEls//s1:issue-data/s1:cover-date/s1:date-range/s1:start-date[string-length() &gt; 0]">
                                            <date type="published">
                                                <xsl:attribute name="when">
                                                    <xsl:value-of select="$docIssueEls//issue-data/cover-date/date-range/start-date|$docIssueEls//s1:issue-data/s1:cover-date/s1:date-range/s1:start-date"/>
                                                </xsl:attribute>
                                            </date>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:if test="//item-info/ce:copyright/@year | //els1:item-info/ce:copyright/@year| //els2:item-info/ce:copyright/@year">
                                            <date type="published">
                                                <xsl:attribute name="when">
                                                    <xsl:value-of select="//item-info/ce:copyright/@year | //els1:item-info/ce:copyright/@year| //els2:item-info/ce:copyright/@year"/>
                                                </xsl:attribute>
                                            </date>
                                            </xsl:if>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                        <!-- volume -->
                                    <xsl:if test="$docIssueEls//vol-first[string-length()&gt; 0] | $docIssueEls//s1:vol-first[string-length()&gt; 0]">
                                    <xsl:choose>
                                        <xsl:when test="$codeISSN='0960-2593'"/>
                                        <xsl:otherwise>
                                            <biblScope unit="volume">
                                                <xsl:value-of select="$rattrapageVolElsevier"/>
                                                <xsl:if test="$docIssueEls//vol-last |$docIssueEls//s1:vol-last">
                                                    <xsl:text>-</xsl:text>
                                                    <xsl:value-of select="$docIssueEls//vol-last | $docIssueEls//s1:vol-last"/>
                                                </xsl:if>
                                            </biblScope>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    </xsl:if>
                                    
                                    <!-- numéro -->
                                    <xsl:if test="$docIssueEls//iss-first[string-length()&gt; 0] |$docIssueEls//s1:iss-first[string-length()&gt; 0]">
                                        <biblScope unit="issue">
                                            <xsl:value-of select="$rattrapageNumElsevier"/>
                                            <xsl:if test="$docIssueEls//iss-last | $docIssueEls//s1:iss-last">
                                                <xsl:text>-</xsl:text>
                                                <xsl:value-of select="$docIssueEls//iss-last | $docIssueEls//s1:iss-last"/>
                                            </xsl:if>
                                        </biblScope>
                                    </xsl:if>
                                    <!-- supplément -->
                                    <xsl:if test="$docIssueEls//suppl[string-length()&gt; 0] |$docIssueEls//s1:suppl[string-length()&gt; 0]">
                                        <biblScope unit="suppl">
                                            <xsl:value-of select="$docIssueEls//suppl | $docIssueEls//s1:suppl"/>
                                        </biblScope>
                                    </xsl:if>
                                    <!-- pagination totale fascicule -->
                                    <xsl:if test="$docIssueEls//issue-data/ce:pages/ce:first-page[string-length()&gt; 0] |$docIssueEls//s1:issue-data/ce:pages/ce:first-page[string-length()&gt; 0]">
                                        <xsl:for-each select="$docIssueEls//issue-data/ce:pages | $docIssueEls//s1:issue-data/ce:pages">
                                            <biblScope unit="total-issue-pages" from="{ce:first-page}">
                                                <xsl:if test="ce:last-page[string-length()&gt; 0]">
                                                    <xsl:attribute name="to">
                                                        <xsl:value-of select="ce:last-page"/> 
                                                    </xsl:attribute>
                                                </xsl:if>
                                            </biblScope>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <!-- pagination article -->
                                    <xsl:choose>
                                        <xsl:when test="$docIssueEls//ce:include-item[ce:doi=current()//ce:doi]">
                                            <biblScope unit="page" from="{$docIssueEls//ce:include-item[ce:doi=current()//ce:doi]/ce:pages/ce:first-page}">
                                                <xsl:value-of select="$docIssueEls//ce:include-item[ce:doi=current()//ce:doi]/ce:pages/ce:first-page"/>
                                            </biblScope>
                                            <biblScope unit="page" to="{$docIssueEls//ce:include-item[ce:doi=current()//ce:doi]/ce:pages/ce:last-page}">
                                                <xsl:value-of select="$docIssueEls//ce:include-item[ce:doi=current()//ce:doi]/ce:pages/ce:last-page"/>
                                            </biblScope>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:if test="$docIssueEls//ce:include-item[ce:pii=current()//ce:pii]">
                                                <biblScope unit="page" from="{$docIssueEls//ce:include-item[ce:pii=current()//ce:pii]/ce:pages/ce:first-page}">
                                                    <xsl:value-of select="$docIssueEls//ce:include-item[ce:pii=current()//ce:pii]/ce:pages/ce:first-page"/>
                                                </biblScope>
                                                <biblScope unit="page" to="{$docIssueEls//ce:include-item[ce:pii=current()//ce:pii]/ce:pages/ce:last-page}">
                                                    <xsl:value-of select="$docIssueEls//ce:include-item[ce:pii=current()//ce:pii]/ce:pages/ce:last-page"/>
                                                </biblScope>
                                            </xsl:if>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </imprint>
                            </monogr>
                            <!-- book-reviews -->
                            <xsl:if test="//book-review-head/sb:reference | els1:book-review-head/sb:reference| els2:book-review-head/sb:reference">
                                <relatedItem type="review-of">
                                    <biblStruct>
                                        <monogr>
                                            <author>
                                                <xsl:value-of select="//book-review-head/sb:reference/sb:contribution/sb:authors/sb:author/ce:surname | //els1:book-review-head/sb:reference/sb:contribution/sb:authors/sb:author/ce:surname| //els2:book-review-head/sb:reference/sb:contribution/sb:authors/sb:author/ce:surname"/>, <xsl:value-of select="//book-review-head/sb:reference/sb:contribution/sb:authors/sb:author/ce:given-name | //els1:book-review-head/sb:reference/sb:contribution/sb:authors/sb:author/ce:given-name| //els2:book-review-head/sb:reference/sb:contribution/sb:authors/sb:author/ce:given-name"/>
                                            </author>
                                            <title type="main" level="m">
                                                <xsl:value-of select="//book-review-head/sb:reference/sb:host/sb:book/sb:title/sb:maintitle | //els1:book-review-head/sb:reference/sb:host/sb:book/sb:title/sb:maintitle| //els2:book-review-head/sb:reference/sb:host/sb:book/sb:title/sb:maintitle"/>
                                            </title>
                                            <idno type="ISBN">
                                                <xsl:value-of select="//book-review-head/sb:reference/sb:host/sb:book/sb:isbn | //els1:book-review-head/sb:reference/sb:host/sb:book/sb:isbn| //els2:book-review-head/sb:reference/sb:host/sb:book/sb:isbn"/>
                                            </idno>
                                            <imprint>
                                                <pubPlace>
                                                    <xsl:value-of select="//book-review-head/sb:reference/sb:host/sb:book/sb:publisher/sb:location | //els1:book-review-head/sb:reference/sb:host/sb:book/sb:publisher/sb:location| //els2:book-review-head/sb:reference/sb:host/sb:book/sb:publisher/sb:location"/>
                                                </pubPlace>
                                                <publisher>
                                                    <xsl:value-of select="//book-review-head/sb:reference/sb:host/sb:book/sb:publisher/sb:name | //els1:book-review-head/sb:reference/sb:host/sb:book/sb:publisher/sb:name| //els2:book-review-head/sb:reference/sb:host/sb:book/sb:publisher/sb:name"/>
                                                </publisher>
                                                <date when="{//book-review-head/sb:reference/sb:host/sb:book/sb:date | //els1:book-review-head/sb:reference/sb:host/sb:book/sb:date| //els2:book-review-head/sb:reference/sb:host/sb:book/sb:date}">
                                                    <xsl:value-of select="//book-review-head/sb:reference/sb:host/sb:book/sb:date | //els1:book-review-head/sb:reference/sb:host/sb:book/sb:date| //els2:book-review-head/sb:reference/sb:host/sb:book/sb:date"/>
                                                </date>
                                            </imprint>
                                        </monogr>
                                    </biblStruct>
                                </relatedItem>
                            </xsl:if>
                        </biblStruct>
                    </sourceDesc>
                </fileDesc>
                <!-- versionning -->
                <xsl:call-template name="insertVersion"/>
                <xsl:if test="//ce:doctopics|head/ce:keywords |els2:head/ce:keywords | head/ce:keywords | els1:head/ce:abstract |els2:head/ce:abstract | head/ce:abstract">
                    <profileDesc>
                        <creation>
                            <date>
                                <xsl:value-of select="$substringOfDate"/>
                            </date>
                        </creation>
                        <!-- language -->
                        <xsl:variable name="codeLangue">
                            <xsl:choose>
                                <xsl:when test="//ce:doi='10.1016/0020-7055(75)90037-6'">ru</xsl:when>
                                <xsl:when test="//ce:doi='10.1016/S0065-1281(77)80028-7'">it</xsl:when>
                                <xsl:when test="//ce:doi='10.1016/S0065-1281(77)80116-5'or//ce:doi='10.1016/S0005-2795(70)80016-2'or//ce:doi='10.1016/S0899-5362(00)00024-5'or//ce:doi='10.1016/0001-6160(77)90075-X'or//ce:doi='10.1016/0029-5493(67)90024-6'or//ce:doi='10.1016/S0003-9365(11)80123-5'or//ce:doi='10.1016/0017-9310(65)90077-3'or//ce:doi='10.1016/S0044-328X(75)80002-X'or//ce:doi='10.1016/S0174-3031(83)80093-6'or//ce:doi='10.1016/S0044-328X(78)80193-7'or//ce:doi='10.1016/0140-7007(82)90068-8'or//ce:doi='10.1016/0024-3841(77)90027-4'or//ce:doi='10.1016/0028-3932(63)90018-6'or//ce:doi='10.1016/S0044-328X(82)80177-3'or//ce:doi='10.1016/S0031-8914(41)90688-2'or//ce:doi='10.1016/0043-1648(68)90552-8'or//ce:doi='10.1016/0013-4686(61)90001-9'or//ce:doi='10.1016/S0031-8914(40)90087-8'or//ce:doi='10.1016/S0031-8914(42)90109-5'or//ce:doi='10.1016/0031-8914(48)90040-8'or//ce:doi='10.1016/S0031-8914(38)80198-1'or//ce:doi='10.1016/S0399-077X(73)80142-8'or//ce:doi='10.1016/0022-2860(74)85065-9'">fr</xsl:when>
                                <xsl:when test="//ce:doi='10.1016/0371-1951(48)80189-X'or//ce:doi='10.1016/0011-2275(64)90067-0'or//ce:doi='10.1016/0011-2275(64)90086-4'or//ce:doi='10.1016/0011-2275(64)90022-0'or//ce:doi='10.1016/0011-2275(64)90108-0'or//ce:doi='10.1016/0011-2275(64)90048-7'or//ce:doi='10.1016/S0011-2275(64)80012-6'or//ce:doi='10.1016/S0031-8663(38)80015-6'">it</xsl:when>
                                <xsl:when test="//ce:doi='10.1016/0029-554X(69)90427-3'">de</xsl:when>
                                <xsl:when test="//ce:doi='10.1016/S1695-4033(01)77667-9'or//ce:doi='10.1016/S1695-4033(01)77671-0'or//ce:doi='10.1016/S1695-4033(01)77666-7'or//ce:doi='10.1016/S1695-4033(01)77668-0'or//ce:doi='10.1016/S1695-4033(01)77669-2'or//ce:doi='10.1016/S1695-4033(01)77670-9'or//ce:doi='10.1016/0022-510X(68)90004-X'or//ce:doi='10.1016/0277-9536(89)90004-X'">es</xsl:when>
                                <xsl:when test="//ce:doi='10.1016/S0005-8165(77)80120-0'or//ce:doi='10.1016/S0940-9602(98)80120-9'or//ce:doi='10.1016/S0044-4057(74)80061-4'or//ce:doi='10.1016/S0940-9602(11)80342-0'or//ce:doi='10.1016/0079-6816(94)90061-2'or//ce:doi='10.1016/S0232-4393(11)80191-5'or//ce:doi='10.1016/S0172-5599(80)80068-X'or//ce:doi='10.1016/0029-5493(74)90179-4'or//ce:doi='10.1016/0255-2701(89)85004-4'or//ce:doi='10.1016/S0344-0338(79)80035-7'or//ce:doi='10.1016/S0044-4057(77)80091-9'or//ce:doi='10.1016/0255-2701(88)87017-X'or//ce:doi='10.1016/0378-2166(89)90007-6'or//ce:doi='10.1016/S0016-2361(01)00039-4'or//ce:doi='10.1016/S0040-6090(00)00826-9'or//ce:doi='10.1016/0013-4686(78)87005-4'or//ce:doi='10.1016/0013-4694(72)90174-5'or//ce:doi='10.1016/0001-8686(90)80027-W'or//ce:doi='10.1016/S0929-693X(99)80201-2'or//ce:doi='10.1016/0013-4694(72)90174-5'or//ce:doi='10.1016/S1507-1367(01)70390-2'or//ce:doi='10.1016/S1507-1367(01)70395-1'or//ce:doi='10.1016/S1507-1367(01)70379-3'or//ce:doi='10.1016/S1507-1367(01)70393-8'or//ce:doi='10.1016/S1507-1367(01)70381-1'or//ce:doi='10.1016/S1507-1367(01)70483-X'or//ce:doi='10.1016/S1507-1367(01)70385-9'or//ce:doi='10.1016/S1507-1367(01)70374-4'or//ce:doi='10.1016/S1507-1367(01)70389-6'or//ce:doi='10.1016/S1507-1367(01)70376-8'or//ce:doi='10.1016/S1507-1367(01)70380-X'or//ce:doi='10.1016/S1507-1367(01)70387-2'or//ce:doi='10.1016/S1507-1367(01)70384-7'or//ce:doi='10.1016/S1507-1367(01)70471-3'or//ce:doi='10.1016/S1507-1367(01)70399-9'or//ce:doi='10.1016/S1507-1367(01)70391-4'or//ce:doi='10.1016/S1507-1367(01)70397-5'or//ce:doi='10.1016/S1507-1367(01)70382-3'or//ce:doi='10.1016/S1507-1367(01)70398-7'or//ce:doi='10.1016/S1507-1367(01)70394-X'or//ce:doi='10.1016/S1507-1367(01)70378-1'or//ce:doi='10.1016/S1507-1367(01)70377-X'or//ce:doi='10.1016/S1507-1367(01)70392-6'or//ce:doi='10.1016/S1507-1367(01)70396-3'or//ce:doi='10.1016/S1507-1367(01)70383-5'or//ce:doi='10.1016/S1507-1367(01)70372-0'or//ce:doi='10.1016/S1507-1367(01)70386-0'or//ce:doi='10.1016/S1507-1367(01)70375-6'">en</xsl:when>
                                <xsl:when test="//ce:doi='10.1016/S0174-3031(82)80096-6'">fr</xsl:when>
                                <xsl:otherwise>
                                    <xsl:choose>
                                        <xsl:when test="@xml:lang">
                                            <xsl:value-of select="@xml:lang"/>
                                        </xsl:when>
                                        <xsl:otherwise>en</xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:if test="$codeLangue">
                            <langUsage>
                                <language>
                                    <xsl:attribute name="ident">
                                        <xsl:value-of select="$codeLangue"/>
                                    </xsl:attribute>
                                </language>
                            </langUsage>
                        </xsl:if>
						<!-- PL: abstract is moved from <front> to here -->
                        <xsl:apply-templates select="els1:head/ce:abstract |els2:head/ce:abstract | head/ce:abstract"/>
                        <xsl:apply-templates select="els1:item-info/ce:doctopics"/>
                        <xsl:apply-templates select="els2:item-info/ce:doctopics"/>
                        <xsl:apply-templates select="item-info/ce:doctopics"/>
                        <xsl:apply-templates select="els1:head/ce:keywords |els2:head/ce:keywords | head/ce:keywords"/>
                    </profileDesc>
                </xsl:if>
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
                </revisionDesc>
            </teiHeader>
            <text>
				<!-- PL: abstract is moved from <front> to <abstract> under <profileDesc> -->
                <!--front>
                    <xsl:apply-templates select="els1:head/ce:abstract |els2:head/ce:abstract | head/ce:abstract"/>
                </front-->
                <xsl:choose>
                    <xsl:when test="els1:body|els2:body|body">
                        <body>
                            <xsl:apply-templates select="els1:body/*"/>
                            <xsl:apply-templates select="els2:body/*"/>
                            <xsl:apply-templates select="body/*"/>
                            <xsl:apply-templates select="//ce:floats"/>
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
                        <body>
                        <div><p></p></div>
                        </body>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="els1:back/* | simple-tail/* | els1:simple-tail/*|els2:simple-tail/*| els1:tail/* |els2:back/* | els2:tail/* | tail/*">
                    <back>
                        <!-- Bravo: Elsevier a renommé son back en tail... visionnaire -->
                        <xsl:apply-templates select="simple-tail/* | els1:simple-tail/*|els2:simple-tail/*|els1:back/* | els1:tail/* |els2:back/* | els2:tail/* | tail/*"/>
                    </back>
                </xsl:if>
            </text>
        </TEI>
    </xsl:template>

    <!-- Traitement des méta-données (génération de l'entête TEI) -->

    <xsl:template match="ce:copyright">
        <!-- moved up publisher information -->
        <publisher>
            <xsl:choose>
                <xsl:when test="text()">
                    <xsl:variable name="text">
                        <xsl:apply-templates/>
                    </xsl:variable>
                    <xsl:value-of select="normalize-space($text)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="ref">https://scientific-publisher.data.istex.fr/ark:/67375/H02-C6NSG6CL-G</xsl:attribute>
                    <xsl:text>Elsevier</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </publisher>
        <!-- PL: put the date under the paragraph, as it is TEI P5 valid -->
        <!-- LR: moved the date two nodes higher so that the encompassing publicationStmt is closer to what is expected-->
        
        <date type="copyright">
            <xsl:attribute name="when">
                <xsl:choose>
                    <xsl:when test="string-length(@year)=8">
                        <xsl:value-of select="substring($date,-3,string-length($date))"/>
                    </xsl:when>
                    <xsl:when test="string-length(@year)=6">
                        <xsl:value-of select="substring($date,-1,string-length($date))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@year"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
        </date>
        <availability status="restricted">
            <licence>
                <p>
            	    <xsl:if test="@year">
            	        <xsl:text>&#169;</xsl:text>
            	        <xsl:value-of select="@year"/>
            	        <xsl:text>, </xsl:text>
            	    </xsl:if>
            	    <xsl:choose>
            	        <xsl:when test="text()">
            	            <xsl:variable name="text">
            	                <xsl:apply-templates/>
            	            </xsl:variable>
            	            <xsl:value-of select="normalize-space($text)"/>
            	        </xsl:when>
            	        <xsl:otherwise>Elsevier.</xsl:otherwise>
            	    </xsl:choose>
            	</p>
                <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-HKKZVM7B-M"/>
			</licence>
        </availability>
    </xsl:template>

    <xsl:template match="ce:text">
        <xsl:choose>
            <xsl:when test="parent::ce:collaboration">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:when>
            <xsl:otherwise>
                <term>
                    <xsl:if test="@id">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </term>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
	
	<!-- PL: this could be moved to KeywordsAbstract.xsl when generalised to all publishers -->
    <!--xsl:template match="els1:head/ce:abstract |els2:head/ce:abstract | head/ce:abstract">
		<abstract>
			<xsl:if test="@xml:lang">
				<xsl:attribute name="xml:lang">
					<xsl:value-of select="@xml:lang"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="*/ce:simple-para"/>
		</abstract>
    </xsl:template-->

    <xsl:template match="els1:display |els2:display | ce:display | display">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="ce:correspondence/ce:text">
        <p><xsl:apply-templates/></p>
    </xsl:template>

    <!-- Revision information -->
    <xsl:template match="els1:head/ce:date-received |els2:head/ce:date-received | head/ce:date-received">
        <change>
            <xsl:attribute name="when">
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldDay" select="@day"/>
                    <xsl:with-param name="oldMonth" select="@month"/>
                    <xsl:with-param name="oldYear" select="@year"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:text>Received</xsl:text>
        </change>
    </xsl:template>

    <xsl:template match="els1:head/ce:date-revised |els2:head/ce:date-revised | head/ce:date-revised">
        <change>
            <xsl:attribute name="when">
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldDay" select="@day"/>
                    <xsl:with-param name="oldMonth" select="@month"/>
                    <xsl:with-param name="oldYear" select="@year"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:text>Revised</xsl:text>
        </change>
    </xsl:template>

    <xsl:template match="els1:head/ce:date-accepted |els2:head/ce:date-accepted | head/ce:date-accepted">
        <change>
            <xsl:attribute name="when">
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldDay" select="@day"/>
                    <xsl:with-param name="oldMonth" select="@month"/>
                    <xsl:with-param name="oldYear" select="@year"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:text>Accepted</xsl:text>
        </change>
    </xsl:template>

    <xsl:template match="els1:head/ce:date-received |els2:head/ce:date-received | head/ce:date-received" mode="inImprint">
        <change>
            <xsl:attribute name="type">received</xsl:attribute>
            <xsl:attribute name="when">
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldDay" select="@day"/>
                    <xsl:with-param name="oldMonth" select="@month"/>
                    <xsl:with-param name="oldYear" select="@year"/>
                </xsl:call-template>
            </xsl:attribute>
        </change>
    </xsl:template>

    <xsl:template match="els1:head/ce:date-accepted |els2:head/ce:date-accepted | head/ce:date-accepted" mode="inImprint">
        <date>
            <xsl:attribute name="type">accepted</xsl:attribute>
            <xsl:attribute name="when">
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldDay" select="@day"/>
                    <xsl:with-param name="oldMonth" select="@month"/>
                    <xsl:with-param name="oldYear" select="@year"/>
                </xsl:call-template>
            </xsl:attribute>
        </date>
    </xsl:template>

    <xsl:template match="els1:head/ce:miscellaneous |els2:head/ce:miscellaneous | head/ce:miscellaneous" mode="inImprint">
        <xsl:variable name="quot">"</xsl:variable>
        <date>
            <xsl:attribute name="type">published</xsl:attribute>
            <xsl:attribute name="when">
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldDay"
                        select="substring-before(substring-after(substring-after(.,'day='),$quot),$quot)"/>
                    <xsl:with-param name="oldMonth"
                        select="substring-before(substring-after(substring-after(.,'month='),$quot),$quot)"/>
                    <xsl:with-param name="oldYear"
                        select="substring-before(substring-after(substring-after(.,'year='),$quot),$quot)"
                    />
                </xsl:call-template>
            </xsl:attribute>
        </date>
    </xsl:template>

    <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++ -->
    <!-- Full text elements -->

    <!-- divisions -->

    <xsl:template match="ce:sections">
        <div type="ElsevierSections">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="ce:section">
        <div>
            <xsl:if test="ce:label">
                <!-- la tei n'accepte pas les espaces dans l'attribut type -->
                <xsl:attribute name="type" select="translate(ce:label,' ','_')"/>
            </xsl:if>
            <xsl:if test="@id">
                <xsl:attribute name="xml:id" select="@id"/>
            </xsl:if>
            <xsl:apply-templates select="*[ name()!='ce:label']"/>
        </div>
    </xsl:template>

    <xsl:template match="ce:acknowledgment">
        <div type="acknowledgment">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="ce:appendices">
            <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="ce:abstract-sec">
        <xsl:choose>
            <xsl:when test="ce:section-title">
                <div type="section">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ce:section-title">
        <xsl:choose>
            <xsl:when test="parent::ce:bibliography-sec"/>
            <xsl:otherwise>
                <head>
                    <xsl:apply-templates/>
                </head>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="ce:e-address">
        <email>
            <xsl:apply-templates/>
        </email>
    </xsl:template>

    <xsl:template match="els1:author-comment |els2:author-comment">
        <note type="author-comment">
            <xsl:apply-templates/>
        </note>
    </xsl:template>

    <!-- Figures -->
    <xsl:template match="ce:figure">
            <figure>
                <xsl:if test="@id">
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates/>
            </figure>
        
    </xsl:template>
    <xsl:template match="ce:caption">
        <figDesc>
            <xsl:apply-templates/>
        </figDesc>
    </xsl:template>

    <!-- Fin de la bibliographie -->

    <xsl:template match="ce:bib-reference">
        <xsl:choose>
            <xsl:when test="../sb:reference">
                <biblStruct>
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </biblStruct>
            </xsl:when>
            <xsl:otherwise>
                <bibl>
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </bibl>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    <xsl:template match="ce:note">
       <note>
            <xsl:apply-templates/>
       </note>
    </xsl:template>
    <xsl:template match="els1:conf-name |els2:conf-name">
        <meeting>
            <xsl:apply-templates/>
        </meeting>
    </xsl:template>
    
    <xsl:template match="ce:collaboration">
        <author role="collab">
            <xsl:variable name="structId" select="ce:cross-ref/@refid"/>
            <xsl:for-each select="$structId">
                <xsl:if test="//ce:correspondence[@id=.]">
                    <xsl:attribute name="role">
                        <xsl:text>corresp</xsl:text>
                    </xsl:attribute>
                </xsl:if>
                <xsl:message>Identifier: <xsl:value-of select="."/></xsl:message>
            </xsl:for-each>
            <xsl:choose>
                <xsl:when test="ce:text">
                    <name>
                        <xsl:value-of select="ce:text/text()"/>
                    </name>
                </xsl:when>
                <xsl:otherwise>
                    <name>
                        <xsl:apply-templates select="*[name(.)!='ce:cross-ref' and name(.)!='ce:e-address']"
                        />
                    </name>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
                <xsl:when test="../ce:footnote[not(@id)]">
                    <xsl:message>Affiliation sans identifiant</xsl:message>
                    <xsl:for-each select="../ce:footnote">
                        <email>
                            <xsl:value-of select="ce:note-para"/>
                        </email>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message>On parcourt les affiliations</xsl:message>
                    <xsl:for-each select="$structId">
                        <xsl:variable name="localId">
                            <xsl:value-of select="."/>
                        </xsl:variable>
                        <xsl:if test="//ce:footnote[@id=$localId]">
                            <xsl:message>Trouvé: <xsl:value-of select="$localId"/></xsl:message>
                            <note>
                                <xsl:value-of select="//ce:footnote[@id=$localId]/ce:note-para"/>
                            </note>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="ce:e-address"/>
            
            <xsl:choose>
                <xsl:when test="../ce:affiliation[not(@id)]">
                    <xsl:message>Affiliation sans identifiant</xsl:message>
                    <xsl:for-each select="../ce:affiliation">
                        <affiliation>
                            <xsl:call-template name="parseAffiliation">
                                <xsl:with-param name="theAffil">
                                    <xsl:apply-templates select="ce:textfn"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </affiliation>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message>On parcourt les affiliations</xsl:message>
                    <xsl:for-each select="$structId">
                        <xsl:variable name="localId">
                            <xsl:value-of select="."/>
                        </xsl:variable>
                        <xsl:if test="//ce:affiliation[@id=$localId]">
                            <xsl:message>Trouvé: <xsl:value-of select="$localId"/></xsl:message>
                            <affiliation>
                                <xsl:call-template name="parseAffiliation">
                                    <xsl:with-param name="theAffil">
                                        <xsl:value-of select="//ce:affiliation[@id=$localId]/ce:textfn"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </affiliation>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:choose>
                <xsl:when test="../ce:correspondence[not(@id)]">
                    <xsl:message>Affiliation sans identifiant</xsl:message>
                    <xsl:for-each select="../ce:correspondence">
                        <affiliation>
                            <xsl:call-template name="parseAffiliation">
                                <xsl:with-param name="theAffil">
                                    <xsl:value-of select="ce:text"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </affiliation>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message>On parcourt les affiliations</xsl:message>
                    <xsl:for-each select="$structId">
                        <xsl:variable name="localId">
                            <xsl:value-of select="."/>
                        </xsl:variable>
                        <xsl:if test="//ce:correspondence[@id=$localId]">
                            <xsl:message>Trouvé: <xsl:value-of select="$localId"/></xsl:message>
                            <affiliation>
                                <xsl:call-template name="parseAffiliation">
                                    <xsl:with-param name="theAffil">
                                        <xsl:value-of select="//ce:correspondence[@id=$localId]/ce:text"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </affiliation>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
            
            <xsl:for-each select="$structId">
                <xsl:variable name="localId2">
                    <xsl:value-of select="."/>
                </xsl:variable>
                
                <xsl:if test="//ce:correspondence[@id=$localId2]">
                    <xsl:variable name="codePays"
                        select="/els1:article/els1:item-info/ce:doctopics/ce:doctopic[@role='coverage']/ce:text | /els2:article/els2:item-info/ce:doctopics/ce:doctopic[@role='coverage']/ce:text"/>
                    <xsl:message>Pays Elsevier: <xsl:value-of select="$codePays"/></xsl:message>
                    <!-- PL: test to avoid empy country block -->
                    
                    <xsl:if test="$codePays">
                        <affiliation>
                            <address>
                                <country>
                                    <xsl:attribute name="key">
                                        <xsl:value-of select="$codePays"/>
                                    </xsl:attribute>
                                    <xsl:call-template name="normalizeISOCountryName">
                                        <xsl:with-param name="country" select="$codePays"/>
                                    </xsl:call-template>
                                </country>
                            </address>
                        </affiliation>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
            
            
            <!-- PL: no reference markers in the author section -->
            <!--xsl:apply-templates select="ce:cross-ref"/-->
            
        </author>
    </xsl:template>
    
    <xsl:template match="ce:author">
        <author>
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
            <xsl:if test="not(ancestor::sub-article)">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="$authorNumber"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:variable name="structId" select="ce:cross-ref/@refid"/>
            <xsl:for-each select="$structId">
                <xsl:if test="//ce:correspondence[@id=.]">
                    <xsl:attribute name="role">
                        <xsl:text>corresp</xsl:text>
                    </xsl:attribute>
                </xsl:if>
                <xsl:message>Identifier: <xsl:value-of select="."/></xsl:message>
            </xsl:for-each>

            <persName>
                <xsl:apply-templates select="*[name(.)!='ce:cross-ref' and name(.)!='ce:e-address']"
                />
            </persName>

            <xsl:apply-templates select="ce:e-address"/>

            <xsl:choose>
                <xsl:when test="../ce:affiliation[not(@id)]">
                    <xsl:message>Affiliation sans identifiant</xsl:message>
                    <xsl:for-each select="../ce:affiliation">
                        <affiliation>
                            <xsl:call-template name="parseAffiliation">
                                <xsl:with-param name="theAffil">
                                    <xsl:value-of select="ce:textfn"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </affiliation>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="not(ce:cross-ref) and following::ce:affiliation[@id]">
                    <xsl:message>Affiliation avec identifiant, auteur sans relation</xsl:message>
                    <xsl:for-each select="following::ce:affiliation">
                        <affiliation>
                            <xsl:call-template name="parseAffiliation">
                                <xsl:with-param name="theAffil">
                                    <xsl:value-of select="ce:textfn"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </affiliation>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:message>On parcourt les affiliations</xsl:message>
                    <xsl:for-each select="$structId">
                        <xsl:variable name="localId">
                            <xsl:value-of select="."/>
                        </xsl:variable>
                        <xsl:if test="//ce:affiliation[@id=$localId]">
                            <xsl:message>Trouvé: <xsl:value-of select="$localId"/></xsl:message>
                            <affiliation>
                                <xsl:call-template name="parseAffiliation">
                                    <xsl:with-param name="theAffil">
                                        <xsl:apply-templates select="//ce:affiliation[@id=$localId]/ce:textfn"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </affiliation>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>

            <xsl:for-each select="$structId">
                <xsl:variable name="localId2">
                    <xsl:value-of select="."/>
                </xsl:variable>
                
                <xsl:if test="//ce:correspondence[@id=$localId2] ">
                    <xsl:variable name="codePays"
                        select="/els1:article/els1:item-info/ce:doctopics/ce:doctopic[@role='coverage']/ce:text | /els2:article/els2:item-info/ce:doctopics/ce:doctopic[@role='coverage']/ce:text"/>
                    <xsl:message>Pays Elsevier: <xsl:value-of select="$codePays"/></xsl:message>
                    <!-- PL: test to avoid empy country block -->

                    <xsl:if test="$codePays">
                        <affiliation>
                            <address>
	                           <country>
	                            <xsl:attribute name="key">
	                                <xsl:value-of select="$codePays"/>
	                            </xsl:attribute>
	                            <xsl:call-template name="normalizeISOCountryName">
	                                <xsl:with-param name="country" select="$codePays"/>
	                            </xsl:call-template>
	                        </country>
	                       </address>
                        </affiliation>
                    </xsl:if>
                </xsl:if>
                
                <xsl:if test="//ce:footnote[@id=$localId2]">
                    <xsl:message>Trouvé: <xsl:value-of select="$localId2"/></xsl:message>
                    <affiliation ana="footnote">
                        <xsl:call-template name="parseAffiliation">
                            <xsl:with-param name="theAffil">
                                <xsl:value-of select="//ce:footnote[@id=$localId2]/ce:note-para"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </affiliation>
                </xsl:if>
            </xsl:for-each>


            <!-- PL: no reference markers in the author section -->
            <!--xsl:apply-templates select="ce:cross-ref"/-->

        </author>
    </xsl:template>

    <xsl:template match="ce:affiliation">
        <affiliation>
            <address>
            <xsl:call-template name="parseAffiliation">
                <xsl:with-param name="theAffil">
                    <xsl:value-of select="ce:textfn"/>
                </xsl:with-param>
            </xsl:call-template>
            </address>
        </affiliation>
    </xsl:template>

    <xsl:template match="ce:correspondence">
        <note type="correspondence">
            <xsl:apply-templates/>
        </note>
    </xsl:template>

    <xsl:template match="ce:footnote">
        <note place="foot">
            <xsl:apply-templates/>
        </note>
    </xsl:template>

    <xsl:template match="ce:label">
        <xsl:if test="parent::ce:figure">
            <head>
                <xsl:apply-templates/>
            </head>
        </xsl:if>
    </xsl:template>
    <xsl:template match="ce:link">
        <xsl:if test="parent::ce:figure">
            <link source="{@locator}">
                <xsl:if test="@id">
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates/>
            </link>
        </xsl:if>
    </xsl:template>

    <!-- text effects: hsp et hsp balisage non repris -->
    <xsl:template match="ce:hsp">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="ce:vsp">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- vieille version qui intégre la référence dans le texte !!!???? -->
    <!--
    <xsl:template match="ce:cross-ref">
        <xsl:variable name="identifier" select="@refid"/>
        <xsl:apply-templates select="//*[@id=$identifier]"/>
    </xsl:template>-->

    <!-- Nouvelles qui se contente de créer un <ref> -->

    <xsl:template match="ce:cross-ref">
        <ref>
            <xsl:attribute name="target">
                <xsl:choose>
                    <!-- Si par hasard ELsevier bascule sur une vraie syntaxe URI, on n'ajoute pas le # devant l'identifiant -->
                    <xsl:when test=" starts-with(@refid,'#')">
                        <xsl:value-of select="@refid"/>
                    </xsl:when>
                    <!-- Dans le cas contraire, actual et le plus probale dans le futur on préfixe l'id avec # -->
                    <xsl:otherwise>
                        <xsl:value-of select=" concat('#',@refid)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <!-- La même chose avec plusieurs référence (Ah, les URIs multiples) -->

    <xsl:template match="ce:cross-refs">
        <ref>
            <xsl:attribute name="target">
                <xsl:for-each select="tokenize(@refid,' ')">
                    <xsl:choose>
                        <!-- Si par hasard ELsevier bascule sur une vraie syntaxe URI, on n'ajoute pas le # devant l'identifiant -->
                        <xsl:when test=" starts-with(current(),'#')">
                            <xsl:value-of select="current()"/>
                        </xsl:when>
                        <!-- Dans le cas contraire, actual et le plus probale dans le futur on préfixe l'id avec # -->
                        <xsl:otherwise>
                            <xsl:value-of select=" concat('#',current())"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="not(position()=last())">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <!-- External references -->
    <xsl:template match="ce:inter-ref">
        <ref>
            <xsl:attribute name="target">
                <xsl:value-of select="@xlink:href"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <xsl:template match="els1:name|els2:name" mode="editors">
        <editor>
            <xsl:apply-templates select="."/>
        </editor>
    </xsl:template>

    <xsl:template match="els1:pub-id | els2:pub-id">
        <idno type="{@pub-id-type}">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>

    <xsl:template match="ce:glyph">
        <g>
            <xsl:if test="@name">
                <xsl:attribute name="ref">#<xsl:value-of select="@name"/></xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </g>
    </xsl:template>
    
    <!-- erratums -->
    <xsl:template match="ce:document-thread">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="ce:refers-to-document">
        <ref type="corrected-article">
        <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="ce:textfn">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>
