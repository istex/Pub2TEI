<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xmlns:mml="http://www.w3.org/1998/Math/MathML" 
    xmlns:tei="http://www.tei-c.org/ns/1.0"  
    exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- Feuille de style ISTEX Editeur Proquest format Result.dtd
        =======================================================================================
        Auteur:  Stéphanie GREGORIO - INIST/CNRS
        =======================================================================================
        Version 0.1 du 30/11/2022
         
    -->
    <!-- reformatage des données Eruditarticle_Cairn_v2.1.dtd vers MODS XSD MODS.v.3.6 -->
    <!-- date -->
    <!-- date -->
    <xsl:variable name="dateArchiv">
        <xsl:value-of select="/result/date"/>
    </xsl:variable>
    <xsl:template match="result">
        <TEI  xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="xml:lang">en</xsl:attribute>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <xsl:apply-templates select="title" mode="result"/>
                        <xsl:apply-templates select="author" mode="result"/>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <!-- publisher -->
                        <publisher>Proquest</publisher>
                        <publisher ref="https://scientific-publisher.data.istex.fr/">Proquest</publisher>
                        <availability>
                            <xsl:attribute name="status">restricted</xsl:attribute>
                            <licence>Proquest</licence>
                            <p>ProQuest U.K. Parliamentary Papers</p>
                            <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-T4VPVNZH-L">uk-parliament-19th</p>
                        </availability>
                        <date type="published" when="{$dateArchiv}">
                            <xsl:value-of select="$dateArchiv"/>
                        </date>
                    </publicationStmt>
                    <notesStmt>
                        <note type="content-type" source="{publication-type}" subtype="other" scheme="https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0">other</note>
                        <note type="publication-type" subtype="database" scheme="http://publication-type.data.istex.fr/ark:/67375/JMC-NTSGR1R0-Z">database</note>
                        <xsl:apply-templates select="note" mode="result"/>
                    </notesStmt>
                    <sourceDesc>
                        <biblStruct type="inbook">
                            <analytic>
                                <xsl:apply-templates select="title" mode="result"/>
                                <xsl:apply-templates select="author" mode="result"/>
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
                                <!-- ident interne -->
                                <xsl:if test="url[string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">bookID</xsl:attribute>
                                        <xsl:value-of select="substring-after(url,'parliamentary-paper/')"/>
                                    </idno>
                                </xsl:if>
                                <xsl:if test="static[@type='pdf-source'][string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">pdfID</xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="contains(static[@type='pdf-source'],'/18')">
                                                <xsl:value-of select="concat('18',substring-before(substring-after(static[@type='pdf-source'],'/18'),'.pdf'))"/> 
                                            </xsl:when>
                                            <xsl:when test="contains(static[@type='pdf-source'],'/19')">
                                                <xsl:value-of select="concat('19',substring-before(substring-after(static[@type='pdf-source'],'/19'),'.pdf'))"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </idno>
                                    <idno>
                                        <xsl:attribute name="type">URI</xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="contains(static[@type='pdf-source'],'/18')">
                                                <xsl:value-of select="concat('18',substring-before(substring-after(static[@type='pdf-source'],'/18'),'.pdf'))"/> 
                                            </xsl:when>
                                            <xsl:when test="contains(static[@type='pdf-source'],'/19')">
                                                <xsl:value-of select="concat('19',substring-before(substring-after(static[@type='pdf-source'],'/19'),'.pdf'))"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </idno>
                                </xsl:if>
                                <xsl:if test="static[@type='pdf-source'][string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">URL</xsl:attribute>
                                        <xsl:value-of select="url"/> 
                                    </idno>
                                </xsl:if>
                            </analytic>
                            <monogr>
                                <xsl:apply-templates select="title" mode="resultBook"/>
                                <!-- ident interne -->
                                <xsl:if test="url[string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">bookID</xsl:attribute>
                                        <xsl:value-of select="substring-after(url,'parliamentary-paper/')"/>
                                    </idno>
                                </xsl:if>
                                <xsl:if test="static[@type='pdf-source'][string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">pdfID</xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="contains(static[@type='pdf-source'],'/18')">
                                                <xsl:value-of select="concat('18',substring-before(substring-after(static[@type='pdf-source'],'/18'),'.pdf'))"/> 
                                            </xsl:when>
                                            <xsl:when test="contains(static[@type='pdf-source'],'/19')">
                                                <xsl:value-of select="concat('19',substring-before(substring-after(static[@type='pdf-source'],'/19'),'.pdf'))"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </idno>
                                    <idno>
                                        <xsl:attribute name="type">URI</xsl:attribute>
                                        <xsl:choose>
                                            <xsl:when test="contains(static[@type='pdf-source'],'/18')">
                                                <xsl:value-of select="concat('18',substring-before(substring-after(static[@type='pdf-source'],'/18'),'.pdf'))"/> 
                                            </xsl:when>
                                            <xsl:when test="contains(static[@type='pdf-source'],'/19')">
                                                <xsl:value-of select="concat('19',substring-before(substring-after(static[@type='pdf-source'],'/19'),'.pdf'))"/>
                                            </xsl:when>
                                        </xsl:choose>
                                    </idno>
                                </xsl:if>
                                <xsl:if test="static[@type='pdf-source'][string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">URL</xsl:attribute>
                                        <xsl:value-of select="url"/> 
                                    </idno>
                                </xsl:if>
                                <!-- auteurs -->
                                
                                <xsl:apply-templates select="author" mode="result"/>
                                <imprint>
                                    <publisher>Proquest</publisher>
                                    <!-- date de publication -->
                                    <date type="published" when="{$dateArchiv}"/>
                                    <xsl:apply-templates select="admin/numero"/>
                                    <xsl:apply-templates select="admin/infoarticle/pagination"/>
                                    <xsl:if test="length[string-length()&gt; 0]!=0">
                                        <biblScope>
                                            <xsl:attribute name="unit">length</xsl:attribute>
                                            <xsl:value-of select="length"/>
                                        </biblScope>
                                    </xsl:if>
                                </imprint>
                            </monogr>
                        </biblStruct>
                    </sourceDesc>
                </fileDesc>
                <xsl:call-template name="insertVersion"/>
                <profileDesc>
                    <langUsage>
                        <language>
                            <xsl:attribute name="ident">en</xsl:attribute>
                        </language>
                    </langUsage>
                    <!-- *************************************** Résumé *******************************************************-->
                    <xsl:apply-templates select="liminaire/resume"/>
                    <!-- *************************************** Mots clés *******************************************************-->
                    <xsl:if test="subject[string-length()&gt; 0]">
                        <textClass ana="subject">
                            <keywords>
                                <xsl:apply-templates select="subject" mode="result"/>
                            </keywords>
                        </textClass>
                    </xsl:if>
                </profileDesc>
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
                </revisionDesc>
            </teiHeader>
            <xsl:choose>
                <xsl:when test="fulltext[string-length()&gt; 0]">
                    <text>
                        <body>
                            <div>
                                <p>
                            <xsl:value-of select="fulltext"/>
                                </p>
                            </div>
                        </body>
                    </text>
                </xsl:when>
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
    <xsl:template match="title" mode="result">
        <title level="a" type="main">
            <xsl:attribute name="xml:lang">en</xsl:attribute>
            <xsl:variable name="normalize">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </title>
    </xsl:template>
    <xsl:template match="title" mode="resultBook">
        <title level="m" type="main">
            <xsl:attribute name="xml:lang">en</xsl:attribute>
            <xsl:variable name="normalize">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </title>
    </xsl:template>
    <!-- ********************** auteurs  ********************************-->
    <xsl:template match="author" mode="result">
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
            <xsl:apply-templates/>
        </author>
    </xsl:template>
    <xsl:template match="subject" mode="result">
        <term>
            <xsl:apply-templates/>
        </term>    
    </xsl:template>
    <xsl:template match="notes" mode="result">>
        <note>
            <xsl:variable name="normalize">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </note> 
    </xsl:template>
</xsl:stylesheet>


