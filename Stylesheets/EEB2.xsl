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
            <xsl:when test="normalize-space($codeLangEEB2)='grc'"/>
            <xsl:when test="normalize-space($codeLangEEB2)='lat'">la</xsl:when>
            <xsl:when test="normalize-space($codeLangEEB2)='ita'">it</xsl:when>
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
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <!-- publisher -->
                        <publisher>
                            <xsl:text>Proquest</xsl:text>
                        </publisher>
                        <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-20TNKDTW-C">Proquest</publisher>
                        <availability>
                            <xsl:attribute name="status">restricted</xsl:attribute>
                            <licence>Proquest</licence>
                            <p> <xsl:text>EEB2 &#169;, all rights reserved.</xsl:text></p>
                            <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/8Q1-XW617H8X-P">eeb2-ebooks</p>
                        </availability>
                        <date type="published" when="{$dateEEB2}"/>
                    </publicationStmt>
                    <notesStmt>
                        <note type="content-type" source="book" subtype="book" scheme="https://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T">book</note>
                        <!-- genre niveau host-->
                        <note type="publication-type" source="book" subtype="book" scheme="https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F">book</note>
                        <!-- note editorial - physical descriptions -->
                        <xsl:apply-templates select="/onix:ONIXMessage/onix:Product/onix:CollateralDetail/onix:TextContent[onix:TextType!='03']/onix:Text"/>
                        
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
                                        <xsl:attribute name="type">recordID</xsl:attribute>
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
                                    <!-- pagination -->
                                    <xsl:if test="Pagination[string-length() &gt; 0 ]">
                                        <biblScope unit="total-page-book">
                                            <xsl:value-of select="Pagination"/>
                                        </biblScope>
                                    </xsl:if>
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
                    <persName>
                        <xsl:apply-templates select="OriginalForm" mode="lastNameNull"/>
                    </persName>
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
        <author>
            <name type="corporate">
                <xsl:apply-templates/>
            </name>
        </author>
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
            <xsl:when test="contains(.,'Tubini, Antonio &amp; Ghirlandi, Andrea')">
                <orgName>
                    <xsl:text>Antonio Tubini &amp; Andrea Ghirlandi</xsl:text>
                </orgName>
                <note>
                    <xsl:apply-templates/>
                </note>
            </xsl:when>
            <xsl:when test="contains(.,'Albertus, Magnus, Saint, 1193-1280')">
                <surname>Saint Albertus Magnus</surname>
                <date>
                    <xsl:text>1193-1280</xsl:text>
                </date>
                <note>
                    <xsl:apply-templates/>
                </note>
            </xsl:when>
            <xsl:when test="contains(.,'Paul II, Pope, 1417-1471')">
                <surname>Pope Paul II</surname>
                <date>
                    <xsl:text>1417-1471</xsl:text>
                </date>
                <note>
                    <xsl:apply-templates/>
                </note>
            </xsl:when>
            <xsl:when test="contains(.,'Pius II, Pope, 1405-1464')">
                <surname>Pope Pius II</surname>
                <date>
                    <xsl:text>1405-1464</xsl:text>
                </date>
                <note>
                    <xsl:apply-templates/>
                </note>
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
                <note>
                    <xsl:apply-templates/>
                </note>
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
                <note>
                    <xsl:apply-templates/>
                </note>
            </xsl:when>
            <xsl:when test="contains(.,'John Chrysostom, Saint, -407')">
                <surname>
                    <xsl:text>Saint John Chrysostom</xsl:text>
                </surname>
                <date>
                    <xsl:text>-407 B.C.</xsl:text>
                </date>
                <note>
                    <xsl:apply-templates/>
                </note>
            </xsl:when> 
            <xsl:when test="contains(.,'Eusebius, of Cremona, Saint, -approximately 423')">
                <surname>
                    <xsl:text>Saint Eusebius of Cremona</xsl:text>
                </surname>
                <date>
                    <xsl:text>423</xsl:text>
                </date>
                <note>
                    <xsl:apply-templates/>
                </note>
            </xsl:when> 
            <xsl:when test="contains(.,'Isidore, of Seville, Saint, -636')">
                <surname>
                    <xsl:text>Saint Isidore of Seville</xsl:text>
                </surname>
                <date>
                    <xsl:text>-636</xsl:text>
                </date>
                <note>
                    <xsl:apply-templates/>
                </note>
            </xsl:when> 
            <xsl:when test="contains(.,'Alexander, the Great, 356 B.C.-323 B.C.')">
                <surname>
                    <xsl:text>Alexander the Great</xsl:text>
                </surname>
                <date>
                    <xsl:text>356 B.C.-323 B.C.</xsl:text>
                </date>
                <note>
                    <xsl:apply-templates/>
                </note>
            </xsl:when>
            <xsl:when test="contains(.,'Antoninus, Saint, Archbishop of Florence, 1389-1459')">
                <surname>
                    <xsl:text>Saint Antoninus Archbishop of Florence</xsl:text>
                </surname>
                <date>
                    <xsl:text>1389-1459</xsl:text>
                </date>
                <note>
                    <xsl:apply-templates/>
                </note>
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
                <note>
                    <xsl:apply-templates/>
                </note>
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
                <note>
                    <xsl:apply-templates/>
                </note>
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
                <note>
                    <xsl:apply-templates/>
                </note>
            </xsl:when>
            <xsl:when test="contains(.,'Cherubino, da Siena, frate, -1484')">
                <surname>
                    <xsl:text>frate Cherubino da Siena</xsl:text>
                </surname>
                <date>
                    <xsl:text>1484</xsl:text>
                </date>
                <note>
                    <xsl:apply-templates/>
                </note>
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
                <note>
                    <xsl:apply-templates/>
                </note>
            </xsl:otherwise>
        </xsl:choose>
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

