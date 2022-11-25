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
    <!-- Feuille de style ISTEX Editeur CAIRN
        =======================================================================================
        Auteur:  Stéphanie GREGORIO - INIST/CNRS
        =======================================================================================
        Version 0.1 du 21/11/2022
    -->
    <!-- reformatage des données Eruditarticle_Cairn_v2.1.dtd vers MODS XSD MODS.v.3.6 -->
    <!-- date -->
    <xsl:variable name="dateErudit">
        <xsl:choose>
            <xsl:when test="/article/admin/numero/pub/annee[string-length()&gt; 0]">
                <xsl:value-of select="/article/admin/numero/pub/annee"/>
            </xsl:when>
            <xsl:when test="/article/admin/numero/pubnum/date[string-length()&gt; 0]">
                <xsl:value-of select="/article/admin/numero/pubnum/date"/>
            </xsl:when>
        </xsl:choose>
    </xsl:variable>
    <!-- language -->
    <xsl:variable name="codeLangErudit1">
        <xsl:value-of select="/article/@lang[string-length()&gt; 0]"/>
    </xsl:variable>
    <xsl:variable name="codeLangErudit">
        <xsl:choose>
            <xsl:when test="normalize-space($codeLangErudit1)='fr'">fre</xsl:when>
        </xsl:choose>
    </xsl:variable>
    <!-- contentType -->
    <xsl:variable name="codeGenreErudit">
        <xsl:value-of select="/article/admin/infoarticle/section_sommaire"/>
    </xsl:variable>
    <xsl:variable name="codeGenreErudit2">
        <xsl:choose>
            <xsl:when test="starts-with($codeGenreErudit,'Revue')">book-reviews</xsl:when>
            <xsl:when test="$codeGenreErudit='REVUE DES LIVRES'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreErudit='Rep&#232;res bibliographiques'">other</xsl:when>
            <xsl:when test="$codeGenreErudit='Ouverture'">editorial</xsl:when>
            <xsl:when test="starts-with($codeGenreErudit,'Nouvelles')">other</xsl:when>
            <xsl:when test="starts-with($codeGenreErudit,'Note')"></xsl:when>
            <xsl:when test="$codeGenreErudit='Monnaie et prospection'"></xsl:when>
            <xsl:when test="starts-with($codeGenreErudit,'Note')">book-reviews</xsl:when>
            <xsl:otherwise>article</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:template match="article[admin]">
        <TEI  xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="$codeLangErudit"/>
            </xsl:attribute>
            
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <xsl:apply-templates select="liminaire/grtitre"/>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <!-- publisher -->
                        <publisher>
                            <xsl:choose>
                                <xsl:when test="admin/editeur/nomorg[string-length() &gt; 0 ]">
                                    <xsl:value-of select="admin/editeur/nomorg"/>
                                </xsl:when>
                                <xsl:otherwise><xsl:text>Cairn</xsl:text></xsl:otherwise>
                            </xsl:choose>                            
                        </publisher>
                        <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-6HF9HWJP-6">Cairn</publisher>
                        <availability>
                            <xsl:attribute name="status">restricted</xsl:attribute>
                            <licence>Cairn</licence>
                            <p><xsl:value-of select="admin/droitsauteur"/></p>
                            <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-CD0RJTWG-S">cairn-journal</p>
                        </availability>
                        <date type="published" when="{$dateErudit}"/>
                    </publicationStmt>
                    <notesStmt>
                        <note type="content-type" source="{translate($codeGenreErudit,' &#160;','')}" subtype="{$codeGenreErudit2}" scheme="{$codeGenreArk}">other</note>
                        <!-- genre niveau host-->
                        <xsl:choose>
                            <xsl:when test="admin/revue/idissn[string-length()&gt; 0] and admin/numero/idisbn[string-length()&gt; 0]">
                                <note type="publication-type">
                                    <xsl:attribute name="subtype">book-series</xsl:attribute>
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="admin/numero/idisbn[string-length()&gt; 0]">
                                <note type="publication-type">
                                    <xsl:attribute name="subtype">book</xsl:attribute>
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                    <xsl:text>book</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:otherwise>
                                <note type="publication-type">
                                    <xsl:attribute name="subtype">journal</xsl:attribute>
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0GLKJH51-B</xsl:attribute>
                                    <xsl:text>journal</xsl:text>
                                </note>
                            </xsl:otherwise>
                        </xsl:choose>
                    </notesStmt>
                    <sourceDesc>
                        <biblStruct type="article">
                            <analytic>
                                <xsl:apply-templates select="liminaire/grtitre"/>
                                <xsl:apply-templates select="liminaire/grauteur"/>
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
                                <xsl:if test="admin/infoarticle/tri[string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">articleID</xsl:attribute>
                                        <xsl:value-of select="admin/infoarticle/tri"/>
                                    </idno>
                                </xsl:if>
                                <!-- ident DOI du book-->
                                <xsl:if test="admin/infoarticle/idpublic[@norme='doi'][string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">DOI</xsl:attribute>
                                        <xsl:value-of select="admin/infoarticle/idpublic[@norme='doi']"/>
                                    </idno>
                                </xsl:if>
                            </analytic>
                            <monogr>
                                <xsl:apply-templates select="admin/revue"/>
                                <xsl:if test="PublicationID[string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">documentID</xsl:attribute>
                                        <xsl:value-of select="PublicationID"/>
                                    </idno>
                                </xsl:if>
                                <!-- ident interne du book-->
                                <xsl:if test="admin/revue/idissn[string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">ISSN</xsl:attribute>
                                        <xsl:value-of select="admin/revue/idissn"/>
                                    </idno>
                                </xsl:if>
                                <xsl:if test="admin/revue/idissnnum[string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">eISSN</xsl:attribute>
                                        <xsl:value-of select="admin/revue/idissnnum"/>
                                    </idno>
                                </xsl:if>
                                <xsl:if test="admin/numero/idisbn[string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">ISBN</xsl:attribute>
                                        <xsl:value-of select="admin/numero/idisbn"/>
                                    </idno>
                                </xsl:if>
                                <!-- auteurs -->
                                <xsl:apply-templates select="admin/editeur/nomorg"/>
                                <xsl:apply-templates select="Contributor" mode="host"/>
                                <imprint>
                                    <publisher>
                                        <xsl:choose>
                                            <xsl:when test="admin/editeur/nomorg[string-length() &gt; 0 ]">
                                                <xsl:value-of select="admin/editeur/nomorg"/>
                                            </xsl:when>
                                            <xsl:otherwise><xsl:text>Cairn</xsl:text></xsl:otherwise>
                                        </xsl:choose>
                                    </publisher>
                                    <!-- date de publication -->
                                    <date type="published" when="{$dateErudit}"/>
                                    <xsl:apply-templates select="admin/numero"/>
                                    <xsl:apply-templates select="admin/infoarticle/pagination"/>
                                </imprint>
                            </monogr>
                        </biblStruct>
                    </sourceDesc>
                </fileDesc>
                <xsl:call-template name="insertVersion"/>
                <profileDesc>
                    <langUsage>
                        <language>
                            <xsl:attribute name="ident">
                                <xsl:value-of select="$codeLangErudit1"/>
                            </xsl:attribute>
                        </language>
                    </langUsage>
                    <!-- *************************************** Résumé *******************************************************-->
                    <xsl:apply-templates select="liminaire/resume"/>
                    <!-- *************************************** Mots clés *******************************************************-->
                    <xsl:apply-templates select="liminaire/grmotcle"/>
                    
                </profileDesc>
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
                </revisionDesc>
            </teiHeader>
            <xsl:choose>
                <xsl:when test="corps[string-length()&gt; 0]">
                    <text>
                        <body>
                            <xsl:apply-templates select="corps/*"/>
                        </body>
                        <xsl:if test="partiesann/biblio">
                            <back>
                                <xsl:apply-templates select="partiesann/*"/>
                                <xsl:apply-templates select="grnote/*"/> 
                            </back>
                        </xsl:if>
                    </text>
                </xsl:when>
                <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                    <text>
                        <body>
                            <div>
                                <p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
                            </div>
                        </body>
                        <xsl:if test="partiesann/biblio">
                            <back>
                                <xsl:apply-templates select="partiesann/biblio"/> 
                            </back>
                        </xsl:if>
                    </text>
                </xsl:when>
                <xsl:otherwise>
                    <text>
                        <body>
                            <div><p></p></div>
                        </body>
                        <xsl:if test="partiesann/biblio">
                            <back>
                                <xsl:apply-templates select="partiesann/biblio"/> 
                            </back>
                        </xsl:if>
                    </text>
                </xsl:otherwise>
            </xsl:choose>
        </TEI>
    </xsl:template>
    
    <!-- début des templates-->
    <!-- ********************** Titre niveau book niveau 1  ********************************-->
    <xsl:template match="grtitre">
        <title level="a" type="main">
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="$codeLangErudit1"/>
            </xsl:attribute>
            <xsl:variable name="normalize">
                <xsl:apply-templates select="titre"/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </title>
        <xsl:if test="sstitre">
            <title level="a" type="sub">
                <xsl:variable name="normalize">
                    <xsl:apply-templates select="sstitre"/>
                </xsl:variable>
                <xsl:value-of select="normalize-space($normalize)"/>
            </title>
        </xsl:if>
    </xsl:template>
    <!-- ********************** Titre niveau book  ********************************-->
    <xsl:template match="revue">
        <title level="m" type="main">
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="$codeLangErudit1"/>
            </xsl:attribute>
            <xsl:variable name="normalize">
                <xsl:apply-templates select="titrerev"/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </title>
        <xsl:if test="soustitrerev">
            <title level="m" type="sub">
                <xsl:variable name="normalize">
                    <xsl:apply-templates select="soustitrerev"/>
                </xsl:variable>
                <xsl:value-of select="normalize-space($normalize)"/>
            </title>
        </xsl:if>
        <xsl:apply-templates select="titrerevabr"/>
    </xsl:template>
    <xsl:template match="titrerevabr">
        <title level="m" type="short">
                <xsl:variable name="normalize">
                    <xsl:apply-templates/>
                </xsl:variable>
                <xsl:value-of select="normalize-space($normalize)"/>
        </title>
    </xsl:template>
   
    <!-- ********************** Auteurs********************************-->
    <xsl:template match="editeur/nomorg">
        <editor>
            <orgName>
                <xsl:apply-templates/>
            </orgName>
        </editor>
    </xsl:template>
    <xsl:template match="grauteur">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="auteur" mode="primary">
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
    </xsl:template>
    <xsl:template match="nompers">
        <xsl:apply-templates select="prenom"/>
        <xsl:apply-templates select="nomfamille"/>
        <xsl:apply-templates select="contribution"/>
        <xsl:apply-templates select="affiliation"/>
    </xsl:template>
    <xsl:template match="prenom">
        <forename type="first">
            <xsl:apply-templates/>
        </forename>
    </xsl:template>
    <xsl:template match="nomfamille">
        <surname>
            <xsl:apply-templates/>
        </surname>
    </xsl:template>
    <xsl:template match="contribution">
        <orgName>
            <xsl:apply-templates/>
        </orgName>
    </xsl:template>
    <xsl:template match="affiliation">
        <xsl:variable name="nomFamille">
            <xsl:value-of select="//nomfamille"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="contains(.,$nomFamille/text())">
                <state type="biography">
                    <desc><xsl:apply-templates/></desc>
                </state>
            </xsl:when>
            <xsl:otherwise>
                <affiliation>
                    <xsl:apply-templates/>
                </affiliation>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- pagination -->
    <xsl:template match="pagination">
        <biblScope unit="pages">
            <xsl:attribute name="from">
                <xsl:value-of select="ppage"/>
            </xsl:attribute>
            <xsl:value-of select="ppage"/> 
        </biblScope>
        <biblScope unit="pages">
            <xsl:attribute name="to">
                <xsl:value-of select="dpage"/>
            </xsl:attribute>
            <xsl:value-of select="dpage"/> 
        </biblScope>
    </xsl:template>
    <!-- tomaison -->
    <xsl:template match="numero">
        <xsl:apply-templates select="theme"/>
        <xsl:apply-templates select="volume" mode="erudit"/>
        <xsl:apply-templates select="nonumero"/>
    </xsl:template>
    <xsl:template match="theme">
        <biblScope unit="title">
            <title>
                <xsl:apply-templates/>
            </title>
        </biblScope>
    </xsl:template>
    <xsl:template match="volume" mode="erudit">
        <biblScope unit="vol">
            <xsl:choose>
                <xsl:when test="contains(.,' ')">
                    <xsl:value-of select="substring-after(.,' ')"/>
                </xsl:when>
                <xsl:when test="contains(.,'&#160;')">
                    <xsl:value-of select="substring-after(.,'&#160;')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </biblScope>
    </xsl:template>
    <xsl:template match="nonumero">
        <biblScope unit="issue">
            <xsl:choose>
                <xsl:when test="contains(.,' ')">
                    <xsl:value-of select="substring-after(.,' ')"/>
                </xsl:when>
                <xsl:when test="contains(.,'&#160;')">
                    <xsl:value-of select="substring-after(.,'&#160;')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </biblScope>
    </xsl:template>
    <!-- abstract -->
    <xsl:template match="resume">
        <abstract>
            <xsl:attribute name="xml:lang">
                <xsl:choose>
                    <xsl:when test="@lang">
                        <xsl:value-of select="@lang"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$codeLangErudit1"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates/>  
        </abstract>
    </xsl:template>
    <xsl:template match="grmotcle">
        <textClass ana="subject">
            <keywords>
                <xsl:apply-templates select="motcle"/>
            </keywords>
        </textClass>
    </xsl:template>
    <xsl:template match="motcle">
        <term>
            <xsl:apply-templates/>
        </term>    
    </xsl:template>
    <xsl:template match="grnote">
        <div type="fn-group">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="biblio">
        <div type="references">
            <listBibl>
                <xsl:apply-templates select="refbiblio"/>
            </listBibl>
        </div>
    </xsl:template>
    <xsl:template match="refbiblio">
        <bibl type="reference">
            <xsl:apply-templates/>
        </bibl>
    </xsl:template>
    <xsl:template match="alinea">
        <xsl:choose>
            <xsl:when test="parent::resume">
                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="marquage[@typemarq='italique']">
        <hi rend="italic">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="marquage[@typemarq='petitecap']">
        <hi rend="smallCaps">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="marquage[@typemarq='gras']">
        <hi rend="bold">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>

</xsl:stylesheet>

