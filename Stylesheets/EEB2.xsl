<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:m="http://www.w3.org/1998/Math/MathML" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"  
    exclude-result-prefixes="#all">
    
    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- Feuille de style concernant les données:
    - EEB2
    - TCRT
    -->
    <xsl:variable name="codeLangEEB2">
        <xsl:choose>
            <xsl:when test="Record/LanguageCode[2]">
                <xsl:value-of select="translate(Record/LanguageCode[2],'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="translate(Record/LanguageCode,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>   
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="codeLangEEB2Translate">
        <xsl:choose>
            <xsl:when test="normalize-space($codeLangEEB2)='dan'">da</xsl:when>
            <xsl:when test="normalize-space($codeLangEEB2)='grc'">el</xsl:when>
            <xsl:when test="normalize-space($codeLangEEB2)='gre'">el</xsl:when>
            <xsl:when test="normalize-space($codeLangEEB2)='lat'">la</xsl:when>
            <xsl:when test="normalize-space($codeLangEEB2)='ita'">it</xsl:when>
            <xsl:when test="normalize-space($codeLangEEB2)='ger'">de</xsl:when>
            <xsl:when test="normalize-space($codeLangEEB2)='fre'">fr</xsl:when>
            <xsl:when test="normalize-space($codeLangEEB2)='heb'">he</xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="dateEEB2">
        <xsl:choose>
            <xsl:when test="Record/AlphaPubDate='Jan 1, 1'">
                <xsl:text>1500</xsl:text>
            </xsl:when>
            <xsl:when test="contains(Record/AlphaPubDate,'?')">
                <xsl:text>1500</xsl:text>
            </xsl:when>
            <xsl:when test="contains(Record/AlphaPubDate,'[s.d.]')">
                <xsl:value-of select="Record/NumericPubDate"/>
            </xsl:when>
            <xsl:when test="Record/AlphaPubDate[string-length()&gt; 0]">
                <xsl:value-of select="Record/AlphaPubDate"/>
            </xsl:when>
            <xsl:when test="Record/NumericPubDate[string-length()&gt; 0]">
                <xsl:value-of select="Record/NumericPubDate"/>
            </xsl:when>
        </xsl:choose>
    </xsl:variable>
    <xsl:template match="Record">
        <TEI  xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="$codeLangEEB2Translate"/>
            </xsl:attribute>
            
            <teiHeader>
                <fileDesc>
                    <!-- SG - titre brut -->
                    <titleStmt>
                        <xsl:apply-templates select="RecordTitle" mode="primaire"/>
                    </titleStmt>
                    <editionStmt>
                        <edition>
                            <xsl:value-of select="Publication/Title"/>
                        </edition>
                    </editionStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <!-- publisher -->
                        <publisher>
                            <xsl:text>Proquest</xsl:text>
                        </publisher>
                        <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-RJ5JRQVP-5">Proquest</publisher>
                        <availability>
                            <xsl:attribute name="status">restricted</xsl:attribute>
                            <licence>Proquest</licence>
                            <p> <xsl:text>Proquest &#169;, all rights reserved.</xsl:text></p>
                            <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-XW617H8X-P">eeb2</p>
                        </availability>
                        <date type="published" when="{$dateEEB2}"/>
                    </publicationStmt>
                    <notesStmt>
                        <note type="content-type" source="other" subtype="other" scheme="https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0">other</note>
                        <!-- genre niveau host-->
                        <note type="publication-type" source="database" subtype="database" scheme="https://publication-type.data.istex.fr/ark:/67375/JMC-NTSGR1R0-Z">database</note>
                        <xsl:if test="Pagination[string-length() &gt; 0 ]">
                            <note type="pagination">
                                <xsl:value-of select="Pagination"/>
                            </note>
                        </xsl:if>
                    </notesStmt>
                    <sourceDesc>
                        <biblStruct type="article">
                            <analytic>
                                <xsl:apply-templates select="RecordTitle" mode="primaire"/>
                                <xsl:apply-templates select="Contributor" mode="primary"/>
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
                                <!-- ident DOI du book-->
                                <xsl:if test="PublicationID[string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">documentID</xsl:attribute>
                                        <xsl:value-of select="PublicationID"/>
                                    </idno>
                                </xsl:if>
                                <!-- ident interne du book-->
                                <xsl:if test="RecordID[string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">BookID</xsl:attribute>
                                        <xsl:value-of select="RecordID"/>
                                    </idno>
                                </xsl:if>
                            </analytic>
                            <monogr>
                                <xsl:apply-templates select="RecordTitle" mode="host"/>
                                <!-- identifiant niveau book -->
                                <!-- ident DOI du book-->
                                <xsl:if test="PublicationID[string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">documentID</xsl:attribute>
                                        <xsl:value-of select="PublicationID"/>
                                    </idno>
                                </xsl:if>
                                <!-- ident interne du book-->
                                <xsl:if test="RecordID[string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">recordID</xsl:attribute>
                                        <xsl:value-of select="RecordID"/>
                                    </idno>
                                </xsl:if>
                                <xsl:if test="URLDocView[string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">URL</xsl:attribute>
                                        <xsl:value-of select="URLDocView"/>
                                    </idno>
                                </xsl:if>
                                <!-- auteurs -->
                                <xsl:apply-templates select="Contributor" mode="host"/>
                                <imprint>
                                    <publisher>
                                        <xsl:text>Proquest</xsl:text>
                                    </publisher>
                                    <!-- date de publication -->
                                    <date type="published" when="{$dateEEB2}"/>
                                </imprint>
                            </monogr>
                        </biblStruct>
                    </sourceDesc>
                </fileDesc>
                <xsl:call-template name="insertVersion"/>
                <profileDesc>
                    <!-- *************************************** Subject *******************************************************-->
                    <xsl:apply-templates select="Terms"/>
                    
                    <langUsage>
                        <language>
                            <xsl:attribute name="ident">
                                <xsl:value-of select="$codeLangEEB2Translate"/>
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
    
    <!-- début des templates-->
    <!-- ********************** Titre niveau book niveau 1  ********************************-->
    <xsl:template match="RecordTitle" mode="primaire">
        <title level="a" type="main">
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="$codeLangEEB2Translate"/>
            </xsl:attribute>
            <xsl:variable name="normalize">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </title>
    </xsl:template>
    <!-- ********************** Titre niveau book  ********************************-->
    <xsl:template match="RecordTitle" mode="host">
        <title level="m" type="main">
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="$codeLangEEB2Translate"/>
            </xsl:attribute>
            <xsl:variable name="normalize">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </title>
    </xsl:template>
   
    <!-- ********************** Auteurs niveau book  ********************************-->
    <xsl:template match="Contributor" mode="primary">
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
        <xsl:choose>
            <xsl:when test="contains(LastName,'Anonymous')"/>
            <xsl:when test="contains(OriginalForm,'Anon..')"/>
            <xsl:when test="contains(.,'Tubini, Antonio &amp; Ghirlandi, Andrea')
                or contains(OriginalForm,'Tubini, Antonio * Ghirlandi, Andrea')">
                <author>
                    <persName>
                        <forename type="first">
                            <xsl:text>Antonio</xsl:text>
                        </forename>
                        <surname>
                            <xsl:text>Tubini</xsl:text>
                        </surname>
                    </persName>
                </author>
                <author>
                    <persName>
                        <forename type="first">
                            <xsl:text>Andrea</xsl:text>
                        </forename>
                        <surname>
                            <xsl:text>Ghirlandi</xsl:text>
                        </surname>
                    </persName>
                </author>
            </xsl:when>
            <xsl:when test="contains(OriginalForm,'Canacci, Antonio &amp; Viotti, Erasmo')">
                <author>
                    <persName>
                        <forename type="first">
                            <xsl:text>Antonio</xsl:text>
                        </forename>
                        <surname>
                            <xsl:text>Canacci</xsl:text>
                        </surname>
                    </persName>
                </author>
                <author>
                    <persName>
                        <forename type="first">
                            <xsl:text>Erasmo</xsl:text>
                        </forename>
                        <surname>
                            <xsl:text>Viotti</xsl:text>
                        </surname>
                    </persName>
                </author>
            </xsl:when>
            <xsl:when test="contains(OriginalForm,'Torresano, Girolamo &amp; fratelli')">
                <author>
                    <persName>
                        <forename type="first">
                            <xsl:text>Girolamo</xsl:text>
                        </forename>
                        <surname>
                            <xsl:text>Torresano</xsl:text>
                        </surname>
                    </persName>
                </author>
                <author>
                    <orgName>fratelli Torresano</orgName>
                </author>
            </xsl:when>
            <xsl:when test="contains(OriginalForm,'Bonardo, Bartolomeo &amp; Grossi, Marcantonio')">
                <author>
                    <persName>
                        <forename type="first">
                            <xsl:text>Bartolomeo</xsl:text>
                        </forename>
                        <surname>
                            <xsl:text>Bonardo</xsl:text>
                        </surname>
                    </persName>
                </author>
                <author>
                    <persName>
                        <forename type="first">
                            <xsl:text>Marcantonio</xsl:text>
                        </forename>
                        <surname>
                            <xsl:text>Grossi</xsl:text>
                        </surname>
                    </persName>
                </author>
            </xsl:when>
            <xsl:when test="LastName[string-length()&gt; 0]">
                <author>
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="$authorNumber"/>
                    </xsl:attribute>
                    <persName>
                        <xsl:apply-templates select="FirstName"/>
                        <xsl:apply-templates select="MiddleName"/>
                        <xsl:apply-templates select="LastName"/>
                        <xsl:apply-templates select="PersonTitle"/>
                        <xsl:apply-templates select="OriginalForm" mode="lastName"/>
                        <xsl:apply-templates select="ContribRole"/>
                    </persName>
                </author>
            </xsl:when>
            <xsl:when test="OrganizationName">
                <author>
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="$authorNumber"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="OrganizationName"/> 
                </author> 
            </xsl:when>
            <xsl:when test="OriginalForm and not(LastName)">
                <author>
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="$authorNumber"/>
                    </xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="contains(OriginalForm,',')">
                            <persName>
                                <xsl:apply-templates select="OriginalForm" mode="lastNameNull"/>
                            </persName>
                        </xsl:when>
                        <xsl:otherwise>
                                <xsl:apply-templates select="OriginalForm" mode="lastNameNull"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </author>
            </xsl:when>
            <xsl:when test="OriginalForm">
                <author>
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="$authorNumber"/>
                    </xsl:attribute>
                    <persName>
                        <xsl:apply-templates select="OriginalForm"/>
                    </persName>
                </author>
            </xsl:when>
            <xsl:otherwise>
                <author>
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="$authorNumber"/>
                    </xsl:attribute>
                    <persName>
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="$authorNumber"/>
                        </xsl:attribute> 
                        <xsl:choose>
                            <xsl:when test="LastName[string-length()&gt; 0]">
                                <xsl:apply-templates select="FirstName"/>
                                <xsl:apply-templates select="MiddleName"/>
                                <xsl:apply-templates select="LastName"/>
                                <xsl:apply-templates select="PersonTitle"/>
                                <xsl:apply-templates select="ContribRole"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="PersonName"/>
                                <xsl:apply-templates select="PersonTitle"/>
                                <xsl:apply-templates select="ContribRole"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </persName>
                </author>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Contributor" mode="host">
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
        <xsl:choose>
            <xsl:when test="contains(LastName,'Anonymous')"/>
            <xsl:when test="contains(OriginalForm,'Anon..')"/>
            <xsl:when test="LastName[string-length()&gt; 0]">
                <author>
                    <persName>
                        <xsl:apply-templates select="FirstName"/>
                        <xsl:apply-templates select="MiddleName"/>
                        <xsl:apply-templates select="LastName"/> 
                        <xsl:apply-templates select="PersonTitle"/>
                        <xsl:apply-templates select="OriginalForm" mode="lastName"/>
                        <xsl:apply-templates select="ContribRole"/>
                    </persName>
                </author>
            </xsl:when>
            <xsl:when test="OrganizationName">
                <author>
                    <xsl:apply-templates select="OrganizationName"/> 
                </author> 
            </xsl:when>
            <xsl:when test="OriginalForm and not(LastName)">
                <author>
                    <persName>
                        <xsl:apply-templates select="OriginalForm" mode="lastNameNull"/>
                    </persName>
                </author>
            </xsl:when>
            <xsl:when test="OriginalForm">
                <author>
                    <persName>
                        <xsl:apply-templates select="OriginalForm"/>
                    </persName>
                </author>
            </xsl:when>
            <xsl:otherwise>
                <author>
                    <persName>
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="$authorNumber"/>
                        </xsl:attribute> 
                        <xsl:choose>
                            <xsl:when test="LastName[string-length()&gt; 0]">
                                <xsl:apply-templates select="FirstName"/>
                                <xsl:apply-templates select="MiddleName"/>
                                <xsl:apply-templates select="LastName"/>
                                <xsl:apply-templates select="PersonTitle"/>
                                <xsl:apply-templates select="ContribRole"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="PersonName"/>
                                <xsl:apply-templates select="PersonTitle"/>
                                <xsl:apply-templates select="ContribRole"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </persName>
                </author>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
     
    <xsl:template match="OrganizationName">
        <xsl:choose>
            <xsl:when test="starts-with(.,'Accademia della Crusca')
                or starts-with(.,'Biblioteca')
                or starts-with(.,'Catholic Church')
                or starts-with(.,'Compagnia')
                or starts-with(.,'Loggia')
                or starts-with(.,'Museo')
                or starts-with(.,'Presso')
                or contains(.,'Purgatorium')
                or contains(.,'Stamperia')
                or contains(.,'Firenze Servi')">
                <orgName>
                    <xsl:apply-templates/>
                </orgName>                
            </xsl:when>
            <xsl:otherwise>
                <persName>
                    <surname>
                        <xsl:apply-templates/>
                    </surname>
                </persName>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="PersonName">
        <surname>
            <xsl:apply-templates/>
        </surname>
    </xsl:template>
    <xsl:template match="PersonTitle">
        <state type="biography">
            <desc><xsl:apply-templates/></desc>
        </state>
    </xsl:template>
    <xsl:template match="OriginalForm" mode="lastName">
        <xsl:if test="contains(.,'1')">
            <date>
                <xsl:text>1</xsl:text>
                <xsl:value-of select="normalize-space(translate(substring-after(.,'1'),' ?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',''))"/>
            </date>
        </xsl:if>
        <note>
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    <xsl:template match="OriginalForm" mode="lastNameNull">
        <xsl:choose>
            <xsl:when test="contains(.,'Albertus, Magnus, Saint, 1193-1280')">
                <surname>Saint Albertus Magnus</surname>
                <date>
                    <xsl:text>1193-1280</xsl:text>
                </date>
            </xsl:when>
            <xsl:when test="contains(.,'Paul II, Pope, 1417-1471')">
                <surname>Pope Paul II</surname>
                <date>
                    <xsl:text>1417-1471</xsl:text>
                </date>
            </xsl:when>
            <xsl:when test="contains(.,'Pius II, Pope, 1405-1464')">
                <surname>Pope Pius II</surname>
                <date>
                    <xsl:text>1405-1464</xsl:text>
                </date>
            </xsl:when>
            <xsl:when test="contains(.,'Thomas, Aquinas, Saint, 1225?-1274')">
                <addName>
                    <xsl:text>Saint</xsl:text>
                </addName>
                <forename type="first">
                    <xsl:text>Thomas</xsl:text>
                </forename>
                <surname>
                    <xsl:text>Aquinas</xsl:text>
                </surname>
                <date>
                    <xsl:text>1225-1274</xsl:text>
                </date>
            </xsl:when>
            <xsl:when test="contains(.,'Augustine, Saint, Bishop of Hippo')">
                <addName>
                    <xsl:text>Saint</xsl:text>
                </addName>
                <forename type="first">
                    <xsl:text>Augustine</xsl:text>
                </forename>
                <surname>
                    <xsl:text>Bishop of Hippo</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'John Chrysostom, Saint, -407')">
                <surname>
                    <xsl:text>Saint John Chrysostom</xsl:text>
                </surname>
                <date>
                    <xsl:text>-407 B.C.</xsl:text>
                </date>
            </xsl:when> 
            <xsl:when test="contains(.,'Eusebius, of Cremona, Saint, -approximately 423')">
                <surname>
                    <xsl:text>Saint Eusebius of Cremona</xsl:text>
                </surname>
                <date>
                    <xsl:text>423</xsl:text>
                </date>
            </xsl:when> 
            <xsl:when test="contains(.,'Isidore, of Seville, Saint, -636')">
                <surname>
                    <xsl:text>Saint Isidore of Seville</xsl:text>
                </surname>
                <date>
                    <xsl:text>-636</xsl:text>
                </date>
            </xsl:when> 
            <xsl:when test="contains(.,'Alexander, the Great, 356 B.C.-323 B.C.')">
                <surname>
                    <xsl:text>Alexander the Great</xsl:text>
                </surname>
                <date>
                    <xsl:text>356 B.C.-323 B.C.</xsl:text>
                </date>
            </xsl:when>
            <xsl:when test="contains(.,'Antoninus, Saint, Archbishop of Florence, 1389-1459')">
                <surname>
                    <xsl:text>Saint Antoninus Archbishop of Florence</xsl:text>
                </surname>
                <date>
                    <xsl:text>1389-1459</xsl:text>
                </date>
            </xsl:when>
            <xsl:when test="contains(.,'Colonne, Guido delle, active 13th century')">
                <forename type="first">
                    <xsl:text>Guido delle</xsl:text>
                </forename>
                <surname>
                    <xsl:text>Colonne</xsl:text>
                </surname>
                <date>
                    <xsl:text>1215-1290</xsl:text>
                </date>
            </xsl:when>
            <xsl:when test="contains(.,'Leonardus, de Utino, active 15th century')">
                <forename type="first">
                    <xsl:text>Leonardus</xsl:text>
                </forename>
                <surname>
                    <xsl:text>de Utino</xsl:text>
                </surname>
                <date>
                    <xsl:text>1400-1470</xsl:text>
                </date>
            </xsl:when>
            <xsl:when test="contains(.,'Herbert of Cherbury, Edward Herbert, baron, 1583-1648')">
                <addName>
                    <xsl:text>baron</xsl:text>
                </addName>
                <forename type="first">
                    <xsl:text>Edward Herbert</xsl:text>
                </forename>
                <surname>
                    <xsl:text>Herbert of Cherbury</xsl:text>
                </surname>
                <date>
                    <xsl:text>1583-1648</xsl:text>
                </date>
            </xsl:when>
            <xsl:when test="contains(.,'Cherubino, da Siena, frate, -1484')">
                <surname>
                    <xsl:text>frate Cherubino da Siena</xsl:text>
                </surname>
                <date>
                    <xsl:text>-1484</xsl:text>
                </date>
            </xsl:when>
            <xsl:when test="contains(.,'Immanuel ben Solomon, approximately 1265-1330')">
                <forename type="first">
                    <xsl:text>Immanuel</xsl:text>
                </forename>
                <surname>
                    <xsl:text>ben Solomon</xsl:text>
                </surname>
                <date>
                    <xsl:text>1265-1330</xsl:text>
                </date>
            </xsl:when>
            <xsl:when test="contains(.,'Phocylides, active 544 B.C.-541 B.C.')">
                <surname>
                    <xsl:text>Phocylides</xsl:text>
                </surname>
                <date>544 B.C.-541 B.C.</date>
            </xsl:when>
            <xsl:when test="contains(.,'Hervaeus Natalis, -1323')">
                <forename type="first">
                    <xsl:text>Hervaeus</xsl:text>
                </forename>
                <surname>
                    <xsl:text>Natalis</xsl:text>
                </surname>
                <date>1323</date>
            </xsl:when>
            <xsl:when test="contains(.,'Petrus Mantuanus, -1400')">
                <forename type="first">
                    <xsl:text>Petrus</xsl:text>
                </forename>
                <surname>
                    <xsl:text>Mantuanus</xsl:text>
                </surname>
                <date>1400</date>
            </xsl:when>
            <xsl:when test="contains(.,'-1428 Hermann de Petra')">
                <forename type="first">
                    <xsl:text>Hermann</xsl:text>
                </forename>
                <surname>
                    <xsl:text>Mantuanus</xsl:text>
                </surname>
                <date>1428</date>
            </xsl:when>
            <xsl:when test="contains(.,'Giovanni Bernardo, -1503 or 1504')">
                <forename type="first">
                    <xsl:text>Giovanni</xsl:text>
                </forename>
                <surname>
                    <xsl:text>Bernardo</xsl:text>
                </surname>
                <date>1503</date>
            </xsl:when>
            <xsl:when test="contains(.,'Council of Trent, 1545-1563 (Trento, Italy)')">
                <surname>
                    <xsl:text>Council of Trent</xsl:text>
                </surname>
                <date>1545-1563</date>
            </xsl:when>
            <xsl:when test="contains(.,'Lucian, of Samosata')">
                <surname>
                    <xsl:text>Lucian of Samosata</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Callistratus, active 3rd century-4th century')">
                <surname>
                    <xsl:text>Callistratus</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Eusebius, of Caesarea, Bishop of Caesarea, approximately 260-approximately 340')">
                <surname>
                    <xsl:text>Eusebius of Caesarea</xsl:text>
                </surname>
                <date>260-340</date>
            </xsl:when>
            <xsl:when test="contains(.,'Boethius, -524')">
                <surname>
                    <xsl:text>Boethius</xsl:text>
                </surname>
                <date>-524</date>
            </xsl:when>
            <xsl:when test="contains(.,'Abū Maʿshar, -886')">
                <surname>
                    <xsl:text>Abū Maʿshar</xsl:text>
                </surname>
                <date>-886</date>
            </xsl:when>
            <xsl:when test="contains(.,'Usuard, -876 or 877')">
                <surname>
                    <xsl:text>Usuard</xsl:text>
                </surname>
                <date>-876</date>
            </xsl:when>
            <xsl:when test="contains(.,'Burchiello, 1404-1449')">
                <surname>
                    <xsl:text>Burchiello</xsl:text>
                </surname>
                <date>1404-1449</date>
            </xsl:when>
            <xsl:when test="contains(.,'ʻAbd al-ʻAzīz Ibn ʻUthmān, -967')">
                <surname>
                    <xsl:text>ʻAbd al-ʻAzīz Ibn ʻUthmān</xsl:text>
                </surname>
                <date>-967</date>
            </xsl:when>
            <xsl:when test="contains(.,'Diogenes, -approximately 323 B.C')">
                <surname>
                    <xsl:text>Diogenes</xsl:text>
                </surname>
                <date>323 B.C</date>
            </xsl:when>
            <xsl:when test="contains(.,'Council of Constance, 1414-1418 (Konstanz, Germany)')">
                <surname>
                    <xsl:text>Council of Constance</xsl:text>
                </surname>
                <date>1414-1418</date>
            </xsl:when>
            <xsl:when test="contains(.,'Platina, 1421-1481')">
                <surname>
                    <xsl:text>Platina</xsl:text>
                </surname>
                <date>1421-1481</date>
            </xsl:when>
            <xsl:when test="contains(.,'Sabellico, 1436?-1506')">
                <surname>
                    <xsl:text>Sabellico</xsl:text>
                </surname>
                <date>1436-1506</date>
            </xsl:when>
            <xsl:when test="contains(.,'Senarega Matteo, 1534-1606')">
                <forename type="first">
                    <xsl:text>Matteo</xsl:text>
                </forename>
                <surname>
                    <xsl:text>Senarega</xsl:text>
                </surname>
                <date>1534-1606</date>
            </xsl:when>
            <xsl:when test="contains(.,'Johannes Carthusiensis, active 1480')">
                <forename type="first">
                    <xsl:text>Johannes</xsl:text>
                </forename>
                <surname>
                    <xsl:text>Carthusiensis</xsl:text>
                </surname>
                <date>1480</date>
            </xsl:when>
            <xsl:when test="contains(.,'Bartolommeo da li Sonetti, active 1485')">
                <forename type="first">
                    <xsl:text>Bartolommeo</xsl:text>
                </forename>
                <surname>
                    <xsl:text>da li Sonetti</xsl:text>
                </surname>
                <date>1485</date>
            </xsl:when>
            <xsl:when test="contains(.,'Prudentius, 348-')">
                <surname>
                    <xsl:text>Prudentius</xsl:text>
                </surname>
                <date>348</date>
            </xsl:when>
            <xsl:when test="contains(.,'Lucan, 39-65')">
                <surname>
                    <xsl:text>Lucan</xsl:text>
                </surname>
                <date>39-65</date>
            </xsl:when>
            <xsl:when test="contains(.,'Ovid, 43 B.C.-17 A.D. or 18 A.D.')">
                <surname>
                    <xsl:text>Ovid</xsl:text>
                </surname>
                <date>43-18 A.D.</date>
            </xsl:when>
            <xsl:when test="contains(.,'Sallust, 86 B.C.-34 B.C.')">
                <surname>
                    <xsl:text>Sallust</xsl:text>
                </surname>
                <date>86-34 B.C</date>
            </xsl:when>
            <xsl:when test="contains(.,'Athenagoras, active 2nd century')">
                <surname>
                    <xsl:text>Athenagoras</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Oppian, active 2nd century')">
                <surname>
                    <xsl:text>Oppian</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Ptolemy, active 2nd century')">
                <surname>
                    <xsl:text>Ptolemy</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Pomponius Porphyrio, active 3rd century')">
                <surname>
                    <xsl:text>Pomponius Porphyrio</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Diomedes (Grammarian), active 4th century')">
                <surname>
                    <xsl:text>Diomedes</xsl:text>
                </surname>

            </xsl:when>
            <xsl:when test="contains(.,'Proba, active 4th century')">
                <surname>
                    <xsl:text>Proba</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Servius, active 4th century')">
                <surname>
                    <xsl:text>Servius</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Maximianus, active 6th century')">
                <surname>
                    <xsl:text>Maximianus</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Priscian, active approximately 500-530')">
                <surname>
                    <xsl:text>Priscian</xsl:text>
                </surname>
                <date>500-530</date>
            </xsl:when>
            <xsl:when test="contains(.,'Ambrosius Catharinus, Archbishop of Conza, 1484-1553')">
                <forename type="first">
                    <xsl:text>Ambrosius</xsl:text>
                </forename>
                <surname>
                    <xsl:text>Catharinus</xsl:text>
                </surname>
                <date>1484-1553</date>
            </xsl:when>
            <xsl:when test="contains(.,'Velleius Paterculus, approximately 19 B.C.-approximately 30 A.D.')">
                <forename type="first">
                    <xsl:text>Velleius</xsl:text>
                </forename>
                <surname>
                    <xsl:attribute name="type">family</xsl:attribute>
                    <xsl:text>Paterculus</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Suetonius, approximately 69-122')">
                <surname>
                    <xsl:text>Suetonius</xsl:text>
                </surname>
                <date>69-122</date>
            </xsl:when>
            <xsl:when test="contains(.,'Lactantius, approximately 240-320')">
                <surname>
                    <xsl:text>Lactantius</xsl:text>
                </surname>
                <date>240-320</date>
            </xsl:when>
            <xsl:when test="contains(.,'Catholic Church. Archdiocese of Milan (Italy)')">
                <surname>
                    <xsl:text>Catholic Church. Archdiocese of Milan</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Confessionale [in italiano]')">
                <surname>
                    <xsl:text>Confessionale</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Danimarca (regno di)')">
                <surname>
                    <xsl:text>Danimarca</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Catholic Church. Patriarchate of Venice (Italy)')">
                <surname>
                    <xsl:text>Catholic Church. Patriarchate of Venice</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Catholic Church. Congregatio indicis')">
                <surname>
                    <xsl:text>Catholic Church. Congregatio indicis</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Francis, of Assisi, Saint, 1182-1226')">
                <surname>
                    <xsl:text>Saint Francis of Assisi</xsl:text>
                </surname>
                <date>1182-1226</date>
            </xsl:when>
            <xsl:when test="contains(.,'Alfonso X, King of Castile and Leon, 1221-1284')">
                <surname>
                    <xsl:text>Alfonso X</xsl:text>
                </surname>
                <date>1221-1284</date>
            </xsl:when>
            <xsl:when test="contains(.,'Appianus, of Alexandria')">
                <surname>
                    <xsl:text>Appianus of Alexandria</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Dioscorides Pedanius, of Anazarbos')">
                <surname>
                    <xsl:text>Dioscorides Pedanius of Anazarbos</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Alexander, of Aphrodisias')">
                <surname>
                    <xsl:text>Alexander of Aphrodisias</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Catherine, of Bologna, Saint, 1413-1463')">
                <surname>
                    <xsl:text>Saint Catherine of Bologna</xsl:text>
                </surname>
                <date>1413-1463</date>
            </xsl:when>
            <xsl:when test="contains(.,'Bernard, of Clairvaux, Saint, 1090 or 1091-1153')">
                <surname>
                    <xsl:text>Saint Bernard of Clairvaux</xsl:text>
                </surname>
                <date>1091-1153</date>
            </xsl:when>
            <xsl:when test="contains(.,'Nicomachus, of Gerasa')">
                <surname>
                    <xsl:text>Nicomachus of Gerasa</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Gorgias of Leontini')">
                <surname>
                    <xsl:text></xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Gregory, of Nyssa, Saint, approximately 335-394')">
                <surname>
                    <xsl:text>Saint Gregory of Nyssa</xsl:text>
                </surname>
                <date>335-394</date>
            </xsl:when>
            <xsl:when test="contains(.,'Gregory, of Nazianzus, Saint')">
                <surname>
                    <xsl:text>Saint Gregory of Nazianzus</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Bartholomew, of San Concordio, 1262-1347')">
                <surname>
                    <xsl:text>Bartholomew of San Concordio</xsl:text>
                </surname>
                <date>1262-1347</date>
            </xsl:when>
            <xsl:when test="contains(.,'Catherine, of Siena, Saint, 1347-1380')">
                <surname>
                    <xsl:text>Saint Catherine of Siena</xsl:text>
                </surname>
                <date>1347-1380</date>
            </xsl:when>
            <xsl:when test="contains(.,'Maurice, of Sully, Bishop of Paris, approximately 1120-1196')">
                <surname>
                    <xsl:text>Maurice of Sully</xsl:text>
                </surname>
                <date>1120-1196</date>
            </xsl:when>
            <xsl:when test="contains(.,'Cebes, of Thebes')">
                <surname>
                    <xsl:text>Cebes of Thebes</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Antoninus, Saint, Archbishop of Florence, 1389-1459')">
                <surname>
                    <xsl:text>Saint Antoninus</xsl:text>
                </surname>
                <date>1389-1459</date>
            </xsl:when>
            <xsl:when test="starts-with(.,'Rincontro a Sant')">
                <surname>
                    <xsl:text>Sant'Apollinare</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Phalaris, Tyrant of Agrigentum, active 6th century B.C.')">
                <surname>
                    <xsl:text>Phalaris</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Pliny, the Younger')">
                <surname>
                    <xsl:text>Pliny the Younger</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Cosmas, the Melodian, Saint, approximately 706-761')">
                <surname>
                    <xsl:text>Saint Cosmas</xsl:text>
                </surname>
                <date>706-761</date>
            </xsl:when>
            <xsl:when test="contains(.,'Pliny, the Elder')">
                <surname>
                    <xsl:text>Pliny the Elder</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Alcidamas, 4th century B.C.')">
                <surname>
                    <xsl:text>Alcidamas</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Libanius, 314-393')">
                <surname>
                    <xsl:text>Libanius</xsl:text>
                </surname>
                <date>314-393</date>
            </xsl:when>
            <xsl:when test="contains(.,'Erasmus, Desiderius, -1536')">
                <forename type="first">
                    <xsl:text>Desiderius</xsl:text>
                </forename>
                <surname>
                    <xsl:text>Erasmus</xsl:text>
                </surname>
                <date>-1536</date>
            </xsl:when>
            <xsl:when test="contains(.,'Paul, the Deacon, approximately 720-799?')">
                <surname>
                    <xsl:text>Paul the Deacon</xsl:text>
                </surname>
                <date>720-799</date>
            </xsl:when>
            <xsl:when test="contains(.,'Eutropius, active 4th century')">
                <surname>
                    <xsl:text>Eutropius</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Sedulius, active 5th century')">
                <surname>
                    <xsl:text>Sedulius</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Juvencus, Gaius Vettius Aquilinus')">
                <surname>
                    <xsl:text>Juvencus</xsl:text>
                </surname>
            </xsl:when>
            <xsl:when test="contains(.,'Benessius, Damianus -1540')">
                <forename type="first">
                    <xsl:text>Benessius</xsl:text>
                </forename>
                <surname>
                    <xsl:text>Damianus</xsl:text>
                </surname>
                <date>-1540</date>
                <description xmlns="http://www.loc.gov/mods/v3">
                    <xsl:apply-templates/>
                </description>
            </xsl:when>
            <xsl:when test="contains(.,'Prosper, of Aquitaine, Saint, approximately 390-463')">
                <surname>
                    <xsl:text>Saint Prosper of Aquitaine</xsl:text>
                </surname>
                <date>390-463</date>
                <description xmlns="http://www.loc.gov/mods/v3">
                    <xsl:apply-templates/>
                </description>
            </xsl:when>
            <xsl:when test="contains(.,',')">
                <xsl:variable name="ParseOriginalForm">
                    <xsl:value-of select="normalize-space(substring-after(.,','))"/>
                </xsl:variable>
                <xsl:variable name="ParseOriginalForm2">
                    <xsl:value-of select="normalize-space(substring-before(.,','))"/>
                </xsl:variable>
                <xsl:variable name="ParseOriginalForm3">
                    <xsl:value-of select="substring-before(substring-after($ParseOriginalForm,', '),',')"/>
                </xsl:variable>
                <forename type="first">
                    <xsl:choose>
                        <xsl:when test="contains($ParseOriginalForm,',')">
                            <xsl:value-of select="substring-before($ParseOriginalForm,', ')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$ParseOriginalForm"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </forename>
                <surname>
                    <xsl:choose>
                        <xsl:when test="contains(.,',')">
                            <xsl:value-of select="$ParseOriginalForm2"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$ParseOriginalForm"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </surname>
                <!--<OriginalForm>Nencini, Giovanni, 1803-1878, (former owner)</OriginalForm>
                    <OriginalForm>Passerini, Luigi, 1816-1877</OriginalForm>
                    <OriginalForm>Meinardi, Giuseppe</OriginalForm>
                    <OriginalForm>Accademia della Crusca</OriginalForm>-->
                <xsl:choose>
                    <xsl:when test="$ParseOriginalForm3 !=''">
                        <date>
                            <xsl:value-of select="translate(substring-before(substring-after($ParseOriginalForm,', '),','),'?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz','')"/>
                        </date>
                    </xsl:when>
                    <xsl:when test="contains($ParseOriginalForm,',')">
                        <date>
                            <xsl:choose>
                                <xsl:when test="starts-with(substring-after($ParseOriginalForm,', '),'-')">
                                    <xsl:value-of select="normalize-space(translate(substring-after($ParseOriginalForm,', '),' -?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',''))"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="normalize-space(translate(substring-after($ParseOriginalForm,', '),' ?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',''))"/>  
                                </xsl:otherwise>
                            </xsl:choose>
                        </date>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="starts-with(.,'Accademia della Crusca')
                        or starts-with(.,'Biblioteca')
                        or starts-with(.,'Catholic Church')
                        or starts-with(.,'Compagnia')
                        or starts-with(.,'Loggia')
                        or starts-with(.,'Museo')
                        or starts-with(.,'Presso')
                        or contains(.,'Purgatorium')
                        or contains(.,'Stamperia')
                        or contains(.,'Firenze Servi')">
                        <orgName>
                            <xsl:apply-templates/>
                        </orgName>                
                    </xsl:when>
                    <xsl:otherwise>
                        <persName>
                            <surname>
                                <xsl:apply-templates/>
                            </surname>
                        </persName>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
        <note>
            <xsl:apply-templates/>
        </note>
        <xsl:apply-templates select="ContribRole"/>
    </xsl:template>
    <xsl:template match="ContribRole">
        <roleName>
            <xsl:apply-templates/>
        </roleName>
    </xsl:template>
    
    
    <!-- book-subject -->
    <xsl:template match="Terms">
        <xsl:apply-templates select="FlexTerm"/>
    </xsl:template>
    <xsl:template match="FlexTerm">
        <textClass ana="subject" xml:lang="en">
            <keywords scheme="{FlexTermName}">
                <xsl:call-template name="tokenizeEEB2"/>
            </keywords>
        </textClass>
    </xsl:template>
    <xsl:template match="FlexTermValue" name="tokenizeEEB2">
        <xsl:param name="text" select="FlexTermValue"/>
        <xsl:param name="separator" select="','"/>
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
                <xsl:call-template name="tokenizeEEB2">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>

