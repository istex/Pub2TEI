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
    <xsl:variable name="doiErudit">
        <xsl:value-of select="/article/admin/infoarticle/idpublic[@norme='doi']"/>
    </xsl:variable>
    <!-- date -->
    <xsl:variable name="dateErudit">
        <xsl:choose>
            <xsl:when test="/article/admin/numero/pub/annee[string-length()&gt; 0]">
                <xsl:value-of select="/article/admin/numero/pub/annee"/>
            </xsl:when>
            <xsl:when test="$doiErudit='10.3917/hsr.044.0027' or '10.3917/hsr.044.0081' or '10.3917/hsr.044.0111' or '10.3917/hsr.044.0057' or '10.3917/hsr.044.0007' or '10.3917/hsr.044.0141'">2015</xsl:when>
            <xsl:when test="$doiErudit='10.3917/hsr.046.0069' or '10.3917/tele.049.0165' or '10.3917/tele.049.0125' or '10.3917/tele.049.0099' or '10.3917/hsr.046.0007' or '10.3917/hsr.045.0043' or '10.3917/tele.049.0153' or '10.3917/hsr.046.0031' or '10.3917/tele.049.0065' or '10.3917/tele.049.0017' or '10.3917/hsr.046.0125' or '10.3917/hsr.046.0097' or '10.3917/tele.049.0111' or '10.3917/tele.049.0079' or '10.3917/hsr.045.0171' or '10.3917/hsr.045.0069' or '10.3917/tele.049.0139' or '10.3917/tele.049.0051' or '10.3917/hsr.045.0115' or '10.3917/tele.049.0009' or '10.3917/tele.049.0031' or '10.3917/hsr.046.0155' or '10.3917/hsr.045.0209' or '10.3917/tele.049.0179'">2016</xsl:when>
            <xsl:when test="$doiErudit='10.3917/hsr.047.0041' or '10.3917/hsr.047.0099' or '10.3917/tele.052.0129' or '10.3917/hsr.047.0075' or '10.3917/hsr.047.0007' or '10.3917/hsr.045.0007' or '10.3917/hsr.047.0137' or '10.3917/hsr.047.0181'">2017</xsl:when>
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
        <xsl:choose>
            <xsl:when test="/article/admin/infoarticle/section_sommaire[string-length()&gt; 0]">
                <xsl:value-of select="/article/admin/infoarticle/section_sommaire"/>
            </xsl:when>
            <xsl:otherwise>article</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="codeGenreErudit2">
        <xsl:choose>
            <xsl:when test="starts-with($codeGenreErudit,'Revue')">book-reviews</xsl:when>
            <xsl:when test="$codeGenreErudit='REVUE DES LIVRES'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreErudit='Lectures'">book-reviews</xsl:when>
            <xsl:when test="starts-with($codeGenreErudit,'Note')">book-reviews</xsl:when>
            <xsl:when test="$codeGenreErudit=' Note critique'">book-reviews</xsl:when>
            <xsl:when test="starts-with($codeGenreErudit,'Comptes')">book-reviews</xsl:when>
            <xsl:when test="starts-with($codeGenreErudit,'Rep&#232;res bibliographiques')">other</xsl:when>
            <xsl:when test="$codeGenreErudit='Ouverture'">editorial</xsl:when>
            <xsl:when test="$codeGenreErudit='&#192; chaud'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreErudit='À chaud'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreErudit='&#201;ditorial'">editorial</xsl:when>
            <xsl:when test="$codeGenreErudit='&#201;pilogue'">other</xsl:when>
            <xsl:when test="$codeGenreErudit='Appel &#224; communication'">other</xsl:when>
            <xsl:when test="$codeGenreErudit='Actualit&#233;'">other</xsl:when>
            <xsl:when test="$codeGenreErudit='Addenda'">other</xsl:when>
            <xsl:when test="$codeGenreErudit='Agr&#233;gation 2009/2010'">other</xsl:when>
            <xsl:when test="$codeGenreErudit='Avant-propos'">editorial</xsl:when>
            <xsl:when test="starts-with($codeGenreErudit,'Bilan')">brief-communication</xsl:when>
            <xsl:when test="starts-with($codeGenreErudit,'BILAN')">brief-communication</xsl:when>
            <xsl:when test="$codeGenreErudit='Cahier de lectures'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreErudit='Conf&#233;rence pr&#233;sidentielle'">other</xsl:when>
            <xsl:when test="$codeGenreErudit='D&#201;BATS/OPINIONS'">brief-communication</xsl:when>
            <xsl:when test="starts-with($codeGenreErudit,'D&#233;bat')">brief-communication</xsl:when>
            <xsl:when test="$codeGenreErudit='D&#233;fauts de coordination'">brief-communication</xsl:when>
            <xsl:when test="starts-with($codeGenreErudit,'Débats')">brief-communication</xsl:when>
            <xsl:when test="$codeGenreErudit='Echanges/Contreverses'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreErudit='En t&#234;te'">brief-communication</xsl:when>
            <xsl:when test="starts-with($codeGenreErudit,'Entretien')">other</xsl:when>
            <xsl:when test="$codeGenreErudit='Faits et chiffres'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreErudit='Hommage'">other</xsl:when>
            <xsl:when test="starts-with($codeGenreErudit,'Hors')">other</xsl:when>
            <xsl:when test="$codeGenreErudit='Insert'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreErudit='Introduction'">editorial</xsl:when>
            <xsl:when test="$codeGenreErudit='Magazine'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreErudit='Majeure'">brief-communication</xsl:when>
            <xsl:otherwise>article</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:template match="article[admin]">
        <TEI  xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="$codeLangErudit1"/>
            </xsl:attribute>
            
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <xsl:apply-templates select="liminaire/grtitre"/>
                    </titleStmt>
                    <xsl:if test="liminaire/noteedito[string-length() &gt; 0 ]|liminaire/grtitre/trefbiblio[string-length() &gt; 0 ]">
                        <editionStmt>
                            <xsl:apply-templates select="liminaire/noteedito|liminaire/grtitre/trefbiblio"/>
                        </editionStmt>
                    </xsl:if>
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
                            <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-CD0RJTWG-S">cairn-journals</p>
                        </availability>
                        <date type="published" when="{$dateErudit}"><xsl:value-of select="$dateErudit"/></date>
                        <date type="copyright" when="{$dateErudit}"><xsl:value-of select="$dateErudit"/></date>
                    </publicationStmt>
                    <notesStmt>
                        <note type="content-type" source="{translate($codeGenreErudit,' &#xA;&#160;','')}" subtype="{$codeGenreErudit2}" scheme="{$codeGenreArk}">
                            <xsl:value-of select="$codeGenreErudit2"/>
                        </note>
                        <!-- genre niveau host-->
                        <xsl:choose>
                            <xsl:when test="admin/revue/idissn[string-length()&gt; 0] and admin/numero/idisbn[string-length()&gt; 0]!='sans'">
                                <note type="publication-type">
                                    <xsl:attribute name="subtype">book-series</xsl:attribute>
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="admin/numero/idisbn[string-length()&gt; 0]!='sans'">
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
                                <!-- ident DOI DE L'ARTICLE-->
                                <idno>
                                    <xsl:attribute name="type">DOI</xsl:attribute>
                                    <xsl:choose>
                                        <xsl:when test="admin/infoarticle/idpublic[@norme='doi'][string-length()&gt; 0]">
                                            <xsl:value-of select="admin/infoarticle/idpublic[@norme='doi']"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>10.3917/</xsl:text>
                                            <xsl:value-of select="translate(admin/infoarticle/tri,'ABCDEFGHIJKLMNOPQRSTUVWXYZ_','abcdefghijklmnopqrstuvwxyz.')"/>
                                        </xsl:otherwise>
                                    </xsl:choose>        
                                </idno>
                            </analytic>
                            <monogr>
                                <xsl:apply-templates select="admin/revue"/>
                                <xsl:apply-templates select="admin/numero/theme"/>
                                <xsl:apply-templates select="admin/numero/themeparal"/>
                                <xsl:if test="PublicationID[string-length()&gt; 0]">
                                    <idno>
                                        <xsl:attribute name="type">documentID</xsl:attribute>
                                        <xsl:value-of select="PublicationID"/>
                                    </idno>
                                </xsl:if>
                                <!-- ident interne du journal-->
                                    <xsl:choose>
                                        <xsl:when test="starts-with(@idproprio,'ACO')">
                                            <idno type="ISSN">1660-7880</idno>
                                            <idno type="eISSN">1662-8667</idno>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@idproprio,'ANNOR')">
                                            <idno type="ISSN">0003-4134</idno>
                                            <idno type="eISSN">2261-4427</idno>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@idproprio,'ECRU')">
                                            <idno type="ISSN">0013-0559</idno>
                                            <idno type="eISSN">2105-2581</idno>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@idproprio,'EDC')">
                                            <idno type="ISSN">1270-6841</idno>
                                            <idno type="eISSN">2101-0366</idno>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@idproprio,'FLUX1')">
                                            <idno type="ISSN">1154-2721</idno>
                                            <idno type="eISSN">1958-9557</idno>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@idproprio,'HSR')">
                                            <idno type="ISSN">1254-728x</idno>
                                            <idno type="eISSN">1950-666X</idno>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@idproprio,'LSDLE')">
                                            <idno type="ISSN">0755-9593</idno>
                                            <idno type="eISSN">2259-3764</idno>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@idproprio,'MULT')">
                                            <idno type="ISSN">0292-0107</idno>
                                            <idno type="eISSN">1777-5841</idno>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@idproprio,'POLAF')">
                                            <idno type="ISSN">0244-7827</idno>
                                            <idno type="eISSN">2264-5047</idno>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@idproprio,'REDP')">
                                            <idno type="ISSN">0373-2630</idno>
                                            <idno type="eISSN">2105-2883</idno>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@idproprio,'RHU')">
                                            <idno type="ISSN">1628-0482</idno>
                                            <idno type="eISSN">2101-003X</idno>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@idproprio,'RIEJ')">
                                            <idno type="ISSN">0770-2310</idno>
                                            <idno type="eISSN">2406-4742</idno>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@idproprio,'TELE')">
                                            <idno type="ISSN">1263-588X</idno>
                                            <idno type="eISSN">2118-2191</idno>
                                        </xsl:when>
                                    </xsl:choose>
                                
                                <xsl:if test="admin/numero/idisbn[string-length()&gt; 0]!='sans'">
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
                                    <xsl:if test="admin/infoarticle/nbpage[string-length() &gt; 0 ]!=0">
                                        <biblScope>
                                            <xsl:attribute name="unit">nbPages</xsl:attribute>
                                            <xsl:value-of select="admin/infoarticle/nbpage"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:if test="admin/infoarticle/nbpara[string-length() &gt; 0 ]!=0">
                                        <biblScope>
                                            <xsl:attribute name="unit">nbParagraphs</xsl:attribute>
                                            <xsl:value-of select="admin/infoarticle/nbpara"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:if test="admin/infoarticle/nbmot[string-length() &gt; 0 ]!=0">
                                        <biblScope>
                                            <xsl:attribute name="unit">nbWords</xsl:attribute>
                                            <xsl:value-of select="admin/infoarticle/nbmot"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:if test="admin/infoarticle/nbfig[string-length() &gt; 0 ]!=0">
                                        <biblScope>
                                            <xsl:attribute name="unit">nbFigures</xsl:attribute>
                                            <xsl:value-of select="admin/infoarticle/nbfig"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:if test="admin/infoarticle/nbtabl[string-length() &gt; 0 ]!=0">
                                        <biblScope>
                                            <xsl:attribute name="unit">nbTables</xsl:attribute>
                                            <xsl:value-of select="admin/infoarticle/nbtabl"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:if test="admin/infoarticle/nbimage[string-length() &gt; 0 ]!=0">
                                        <biblScope>
                                            <xsl:attribute name="unit">nbImages</xsl:attribute>
                                            <xsl:value-of select="admin/infoarticle/nbimage"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:if test="admin/infoarticle/nbaudio[string-length() &gt; 0 ]!=0">
                                        <biblScope>
                                            <xsl:attribute name="unit">nbAudio</xsl:attribute>
                                            <xsl:value-of select="admin/infoarticle/nbaudio"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:if test="admin/infoarticle/nbvideo[string-length() &gt; 0 ]!=0">
                                        <biblScope>
                                            <xsl:attribute name="unit">nbVideo</xsl:attribute>
                                            <xsl:value-of select="admin/infoarticle/nbvideo"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:if test="admin/infoarticle/nbrefbiblio[string-length() &gt; 0 ]!=0">
                                        <biblScope>
                                            <xsl:attribute name="unit">nbRefbib</xsl:attribute>
                                            <xsl:value-of select="admin/infoarticle/nbrefbiblio"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:if test="admin/infoarticle/nbnote[string-length() &gt; 0 ]!=0">
                                        <biblScope>
                                            <xsl:attribute name="unit">nbNotes</xsl:attribute>
                                            <xsl:value-of select="admin/infoarticle/nbnote"/>
                                        </biblScope>
                                    </xsl:if>
                                </imprint>
                            </monogr>
                            <xsl:if test="admin/numero/theme[string-length() &gt; 0 ]">
                                <series>
                                    <xsl:apply-templates select="admin/revue"/>
                                    <xsl:if test="admin/numero/theme[string-length() &gt; 0 ]">
                                        <xsl:if test="admin/revue/idissn[string-length()&gt; 0]">
                                            <idno>
                                                <xsl:attribute name="type">ISSN</xsl:attribute>
                                                <xsl:value-of select="admin/revue/idissn"/>
                                            </idno>
                                        </xsl:if>
                                        <xsl:if test="admin/revue/idissnnum[string-length()&gt; 0]!='en cours'">
                                            <idno>
                                                <xsl:attribute name="type">eISSN</xsl:attribute>
                                                <xsl:value-of select="admin/revue/idissnnum"/>
                                            </idno>
                                        </xsl:if>
                                    </xsl:if>
                                </series>
                            </xsl:if>
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
                        <xsl:if test="partiesann[string-length()&gt; 0]">
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
                        <xsl:if test="partiesann[string-length()&gt; 0]">
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
                        <xsl:if test="partiesann[string-length()&gt; 0]">
                            <back>
                                <xsl:apply-templates select="partiesann"/> 
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
        <xsl:apply-templates select="titre" mode="erudit"/>
        <xsl:apply-templates select="sstitre"/>
        <xsl:apply-templates select="titreparal"/>
    </xsl:template>
    
    <xsl:template match="titre" mode="erudit">
        <title level="a" type="main">
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="$codeLangErudit1"/>
            </xsl:attribute>
            <xsl:variable name="normalize">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </title>
    </xsl:template>
    <xsl:template match="sstitre">
        <title level="a" type="sub">
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="$codeLangErudit1"/>
            </xsl:attribute>
            <xsl:variable name="normalize">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </title>
    </xsl:template>
    <xsl:template match="titreparal">
        <title level="a" type="alt">
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="@lang"/>
            </xsl:attribute>
            <xsl:variable name="normalize">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </title>
    </xsl:template>
    <!-- ********************** Titre niveau book  ********************************-->
    <xsl:template match="revue">
        <xsl:apply-templates select="titrerev"/>
        <xsl:apply-templates select="soustitrerev"/>
        <xsl:apply-templates select="titrerevabr"/>
    </xsl:template>
    <xsl:template match="titrerev">
        <title type="main">
            <xsl:attribute name="level">
                <xsl:choose>
                    <xsl:when test="../admin/numero/theme">s</xsl:when>
                    <xsl:otherwise>j</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:variable name="normalize">
                <xsl:apply-templates/>  
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </title>
    </xsl:template>
    <xsl:template match="soustitrerev">
        <title type="sub">
            <xsl:attribute name="level">
                <xsl:choose>
                    <xsl:when test="../admin/numero/theme">s</xsl:when>
                    <xsl:otherwise>j</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:variable name="normalize">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </title>
    </xsl:template>
    <xsl:template match="titrerevabr">
        <title type="short">
            <xsl:attribute name="level">
                <xsl:choose>
                    <xsl:when test="../admin/numero/theme">s</xsl:when>
                    <xsl:otherwise>j</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
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
    <xsl:template match="auteur">
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
            <xsl:attribute name="xml:id">
                <xsl:value-of select="$authorNumber"/>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="nompers">
                    <persName>
                        <xsl:apply-templates select="nompers"/>
                        <xsl:apply-templates select="affiliation" mode="erudit"/>
                        <xsl:apply-templates select="courriel"/>
                    </persName>
                </xsl:when>
                <xsl:when test="nomorg">
                    <orgName>
                        <xsl:apply-templates select="nomorg"/>
                        <xsl:apply-templates select="affiliation" mode="erudit"/>
                    </orgName>
                </xsl:when>
            </xsl:choose>
        </author>
    </xsl:template>
    <xsl:template match="nompers">
        <xsl:apply-templates select="prenom"/>
        <xsl:apply-templates select="nomfamille"/>
    </xsl:template>
    <xsl:template match="prenom">
        <forename type="first">
            <xsl:apply-templates/>
        </forename>
    </xsl:template>
    <xsl:template match="nomfamille">
        <xsl:choose>
            <xsl:when test="renvoi">
                <surname>
                    <xsl:value-of select="./text() except(renvoi)"/>
                </surname>
                <state type="biography">
                    <desc>
                        <xsl:if test="//note[@id=current()/renvoi/@idref]">
                            <xsl:value-of select="//note[@id=current()/renvoi/@idref]/alinea"/>
                        </xsl:if>
                    </desc>
                </state>
            </xsl:when>
            <xsl:otherwise>
                <surname>
                    <xsl:apply-templates/> 
                </surname>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="contribution"/>
    <xsl:template match="nomorg">
        <name>
            <xsl:value-of select="./text() except(renvoi)"/>
        </name>
    </xsl:template>
    <xsl:template match="courriel">
        <email>
            <xsl:apply-templates/>
        </email>
    </xsl:template>
    <xsl:template match="affiliation" mode="erudit">
        <state type="biography">
            <desc>
                <xsl:value-of select="normalize-space(.)"/>
            </desc>
        </state>
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
        <xsl:apply-templates select="volume" mode="erudit"/>
        <xsl:apply-templates select="nonumero"/>
    </xsl:template>
    <xsl:template match="theme">
        <title type="main" level="m">
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <xsl:template match="themeparal">
        <title type="alt" level="m" xml:lang="{@lang}">
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <xsl:template match="volume" mode="erudit">
        <biblScope unit="vol">
            <xsl:choose>
                <xsl:when test="contains(.,'Hors')">
                    <xsl:value-of select="."/>
                </xsl:when>
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
            <xsl:variable name="nettoie">
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
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="../anonumero[string-length()&gt; 0]">
                    <xsl:value-of select="concat(.,'-',../anonumero)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$nettoie"/>
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
                <xsl:apply-templates/>
            </listBibl>
        </div>
    </xsl:template>
    <xsl:template match="refbiblio">
        <bibl>
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="alinea/marquage[@typemarq='italique']">
                <xsl:attribute name="type">journal</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </bibl>
    </xsl:template>
    <xsl:template match="alinea">
        <xsl:choose>
            <xsl:when test="parent::legende">
            <figure>
                <figDesc>
                    <xsl:apply-templates/>
                </figDesc>
            </figure>
            </xsl:when>
            <xsl:when test="parent::texte|parent::refbiblio|parent::noteedito">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="marquage[@typemarq='italique']">
        <xsl:choose>
            <xsl:when test="ancestor::refbiblio">
                <title>
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:otherwise>
                <hi rend="italic">
                    <xsl:apply-templates/>
                </hi>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="marquage[@typemarq='url']">
        <hi rend="url">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="marquage[@typemarq='petitecap']">
        <xsl:choose>
            <xsl:when test="ancestor::refbiblio">
                <name>
                    <xsl:apply-templates/>
                </name>
            </xsl:when>
            <xsl:otherwise>
                <hi rend="smallCaps">
                    <xsl:apply-templates/>
                </hi>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="marquage[@typemarq='gras']">
        <hi rend="bold">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="marquage[@typemarq='souligne']">
        <hi rend="underline">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="marquage[@typemarq='indice']">
        <hi rend="subscript">
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="prodnum"/>
    <xsl:template match="diffnum"/>
    <xsl:template match="np"/>
    <xsl:template match="no">
        <xsl:choose>
            <xsl:when test="parent::note">
                <label>
                    <xsl:apply-templates/>
                </label>
            </xsl:when>
            <xsl:when test="parent::grfigure">
                <label>
                    <xsl:apply-templates/>
                </label>
            </xsl:when>
            <xsl:otherwise>
                <head><xsl:apply-templates/></head>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template> 
    <xsl:template match="exposant">
        <hi rend="superscript">
            <xsl:variable name="normalize">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </hi> 
    </xsl:template>
    <xsl:template match="indice">
        <hi rend="subscript">
            <xsl:variable name="normalize">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:value-of select="normalize-space($normalize)"/>
        </hi> 
    </xsl:template>
    
    <xsl:template match="texte[@typetexte]">
        <figure>
            <figDesc>
                <xsl:apply-templates/>
            </figDesc>
        </figure>
    </xsl:template>
    <xsl:template match="bloccitation">
        <quote>
            <xsl:apply-templates/>
        </quote>
    </xsl:template>
    <xsl:template match="verbatim">
        <p style="{@typeverb}"> 
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="bloc">
        <lg>
            <xsl:if test="@alignh">
                <xsl:attribute name="rend">
                    <xsl:value-of select="@alignh"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </lg>
    </xsl:template>
    <xsl:template match="ligne">
        <l>
            <xsl:apply-templates/>
        </l>
    </xsl:template>
    <xsl:template match="epigraphe">
        <epigraph>
            <xsl:apply-templates/>
        </epigraph>
    </xsl:template>
    <xsl:template match="annexe">
        <div type="appendix">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="dedicace">
        <div type="dedication">
            <p>
                <xsl:apply-templates/>
            </p>
        </div>
    </xsl:template>
    <xsl:template match="merci">
        <div type="acknowledgement">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="encadre">
        <div style="insert">
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:attribute name="n">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="grfigure">
        <div style="figure" xml:id="{@id}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="grtableau">
        <div style="table" xml:id="{@id}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="spanspec"/>
    <xsl:template match="surtitre"/>
    <xsl:template match="divbiblio">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="noteedito|trefbiblio">
        <edition>
            <xsl:apply-templates/>
        </edition>
    </xsl:template>
    <xsl:template match="exemple">
        <div type="exemple">
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
</xsl:stylesheet>

