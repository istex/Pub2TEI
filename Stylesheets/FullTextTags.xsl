<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns:els1="http://www.elsevier.com/xml/ja/dtd"    
    xmlns:els2="http://www.elsevier.com/xml/cja/dtd"
    xmlns:s1="http://www.elsevier.com/xml/si/dtd"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:mml="http://www.w3.org/1998/Math/MathML/" xmlns:xlink="http://www.w3.org/1999/xlink" 
	xmlns:wiley="http://www.wiley.com/namespaces/wiley"
	xmlns:rsc="http://www.rsc.org/schema/rscart38"
    exclude-result-prefixes="#all">

    <!-- Reprise des formules LATEX coincées dans des ?CDATA "cdata-section-elements="tex-math"
    Exemple IOP 10.1088/1751-8113/45/7/073001-->
    <xsl:output encoding="UTF-8" method="xml" cdata-section-elements="tex-math"/>
    <!-- Macrostructure -->
    
    <xsl:template match="body">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="back">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="book-back">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- Springer: Para, SimplePara -->

    <xsl:template match="p| rsc:p| ce:simple-para | ce:para">
        <xsl:choose>
	    <xsl:when test="parent::sec">
                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:when>
            <!--RSC plusieurs titres dans le titre contenu par des p-->
            <xsl:when test="ancestor::title">
                <title>
                <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:when test="child::boxref">
                    <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="parent::ce:floats">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="ancestor::ce:caption">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="child::statement">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <!-- cas particulier affiliation acs -->
                    <xsl:when test="parent::fn and ../label='†' and /article/front/journal-meta/publisher/publisher-name='American Chemical Society'">
                            <xsl:call-template name="NLMParseAffiliation">
                                <xsl:with-param name="theAffil">
                                    <xsl:variable name="nettoie">
                                        <xsl:apply-templates/>
                                    </xsl:variable>
                                    <xsl:choose>
                                        <xsl:when test="contains($nettoie,'SISSA/ISAS')">
                                            <xsl:value-of select="translate($nettoie,';','')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="translate($nettoie,';/','')"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:with-param>
                            </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="parent::fn and ../label='‡' and /article/front/journal-meta/publisher/publisher-name='American Chemical Society'">
                        <xsl:call-template name="NLMParseAffiliation">
                            <xsl:with-param name="theAffil">
                                <xsl:variable name="nettoie">
                                    <xsl:apply-templates/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="contains($nettoie,'SISSA/ISAS')">
                                        <xsl:value-of select="translate($nettoie,';','')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="translate($nettoie,';/','')"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="parent::fn and ../label='⊥' and /article/front/journal-meta/publisher/publisher-name='American Chemical Society'">
                        <xsl:call-template name="NLMParseAffiliation">
                            <xsl:with-param name="theAffil">
                                <xsl:variable name="nettoie">
                                    <xsl:apply-templates/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="contains($nettoie,'SISSA/ISAS')">
                                        <xsl:value-of select="translate($nettoie,';','')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="translate($nettoie,';/','')"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="parent::fn and ../label='§' and /article/front/journal-meta/publisher/publisher-name='American Chemical Society'">
                        <xsl:call-template name="NLMParseAffiliation">
                            <xsl:with-param name="theAffil">
                                <xsl:variable name="nettoie">
                                    <xsl:apply-templates/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="contains($nettoie,'SISSA/ISAS')">
                                        <xsl:value-of select="translate($nettoie,';','')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="translate($nettoie,';/','')"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="parent::fn |parent::list-item ">
                        <xsl:choose>
                            <xsl:when test="xref">
                                <p>
                                    <xsl:apply-templates/>
                                </p>
                            </xsl:when>
                           <xsl:otherwise>
                               <p>
                                   <xsl:apply-templates/>
                               </p>
                           </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="ancestor::boxed-text/sec and not(parent::list-item)">
                        <div>
                            <p>
                                <xsl:apply-templates/>
                            </p>
                        </div>
                    </xsl:when>
                    <xsl:when test="parent::notes">
                        <xsl:choose>
                            <xsl:when test="ancestor::back/notes">
                                <div type="fn-group">
                                    <note>
                                        <p>
                                            <xsl:apply-templates/>
                                        </p>
                                    </note>
                                </div>
                            </xsl:when>
                            <xsl:otherwise>
                                <p>
                                    <xsl:apply-templates/>
                                </p>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="ancestor::biography/section |ancestor::rsc:biography/rsc:section">
                        <desc>
                            <xsl:value-of select="normalize-space(.)"/>
                        </desc>
                    </xsl:when>
                    <xsl:when test="parent::title |parent::rsc:title">
                            <xsl:value-of select="normalize-space(.)"/>
                    </xsl:when>
                    <xsl:when test="preceding-sibling::ce:section">
                        <div>
                            <p>
                                <xsl:if test="@id">
                                    <xsl:attribute name="xml:id">
                                        <xsl:value-of select="@id"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="@xml:lang">
                                    <xsl:attribute name="xml:lang">
                                        <xsl:value-of select="@xml:lang"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:apply-templates/>
                            </p>
                        </div>  
                    </xsl:when>
                    <xsl:otherwise>
                        <!--ecco-->
                        <p>
                            <xsl:if test="@id">
                                <xsl:attribute name="xml:id">
                                    <xsl:value-of select="@id"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="@align='c'">
                                <xsl:attribute name="rend">align(center)</xsl:attribute>
                            </xsl:if>
                            <xsl:if test="@xml:lang">
                                <xsl:attribute name="xml:lang">
                                    <xsl:value-of select="@xml:lang"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="@content-type">
                                <xsl:attribute name="style">
                                    <xsl:value-of select="@content-type"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:apply-templates/>
                        </p>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="ce:note-para">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="Para | SimplePara| para">
        <xsl:choose>
            <xsl:when test="ancestor::DefinitionListEntry/Description">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="ancestor::article[admin]">
                <div style="para" xml:id="{@id}">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:if test="@id">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </xsl:if>
                   <xsl:choose>
                       <xsl:when test="contains(.,'¶')">
                           <xsl:value-of select="translate(.,'¶','')"/>
                       </xsl:when>
                       <xsl:otherwise>
                           <xsl:apply-templates/>
                       </xsl:otherwise>
                   </xsl:choose>
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="quotation |rsc:quotation">
        <quote>
            <xsl:apply-templates/>
        </quote>
    </xsl:template>
    
    <!-- wiley tabularFixed -->
    <xsl:template match="wiley:tabularFixed">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="wiley:p">
        <xsl:choose>
            <xsl:when test="wiley:mathStatement">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:if test="@xml:id">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@xml:id"></xsl:value-of>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- ajout élément sourceà <figure> -->
    <xsl:template match="wiley:source">
            <source>
                <xsl:apply-templates/>
            </source>
    </xsl:template>
    <xsl:template match="wiley:mathStatement/wiley:p">
        <xsl:text> </xsl:text>
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="wiley:biographyInfo/wiley:p">
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="wiley:infoAsset">
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
            <!--xsl:apply-templates select="*[not(self::mathStatement)]"/-->
        </term>
    </xsl:template>     
    
    <!-- SG Nature <crosshd> Titre paragraphe -->
    <xsl:template match="crosshd">
        <p><hi rend="bold"><xsl:apply-templates/></hi></p>
    </xsl:template>
    <!-- SG Nature reprise balise bi -->
    <xsl:template match="bi">
        <hi rend="bold italic"><xsl:apply-templates/></hi>
    </xsl:template>
    <!-- SG Nature reprise balise bxr texte contenu dans des box dans colonne externe-->
    <xsl:template match="bxr">
        <ref type="box">
            <xsl:attribute name="target">
                <xsl:value-of select="concat('#',@rid)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="bx">
        <!-- SG - encapsulage dans div -->
        <div>
        <floatingText type="box">
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <body>
                <xsl:apply-templates/>
            </body>
        </floatingText>
        </div>
    </xsl:template>
    <xsl:template match="bxtitle">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    <xsl:template match="li| rsc:li">
        <item>
            <xsl:apply-templates/>
        </item>
    </xsl:template>
    <xsl:template match="item | rsc:item">
        <item>
            <xsl:apply-templates/>
        </item>
    </xsl:template>
    
    <!-- SG - ajout des listes pour wiley -->
    <xsl:template match="wiley:list">
        <list>
            <xsl:if test="@xml:id">
                <xsl:copy-of select="@xml:id"/>  
            </xsl:if>
            <xsl:if test="@style">
                <xsl:copy-of select="@style"/>  
            </xsl:if>
            <xsl:apply-templates/>
        </list>
    </xsl:template>
   <xsl:template match="wiley:listItem/wiley:label">
            <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="wiley:listItem">
        <item>
            <xsl:if test="wiley:label[string-length()&gt;0]">
                <xsl:attribute name="n">
                    <xsl:apply-templates select="wiley:label"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="wiley:p">
                    <xsl:apply-templates select="wiley:p"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="wiley:accessionId[string-length()&gt;0]">
                <idno>
                    <xsl:value-of select="wiley:accessionId"/>
                </idno>
            </xsl:if>
        </item>
    </xsl:template>
    
    <!-- SG - ajout wiley floatingText -->
    <xsl:template match="wiley:blockFixed">
        <figure type="box">
                <xsl:apply-templates select="wiley:mediaResourceGroup | wiley:p"/>
            <xsl:apply-templates select="wiley:lineatedText"/>
        </figure>
    </xsl:template>
    <!-- SG Nature reprise fnr -->
    <xsl:template match="fnr">
        <ref type="footnote">
            <xsl:attribute name="target">
                <xsl:value-of select="concat('#',@rid)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <!-- SG Nature reprise illustration -->
    <xsl:template match="illus">
        <figure>
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            <xsl:if test="caption/p">
                <figDesc>
                    <xsl:value-of select="caption/p"/> 
                </figDesc>
            </xsl:if>
            <xsl:if test="credit">
                <p>
                    <xsl:value-of select="credit"/> 
                </p>
            </xsl:if>
        </figure>
    </xsl:template>
    <!-- SG Nature reprise deflistr -->
    <xsl:template match="deflistr">
        <ref>
            <xsl:attribute name="type">definition</xsl:attribute>
            <xsl:attribute name="target">
                <xsl:text>#</xsl:text>
               <xsl:apply-templates select="@rid"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <!-- SG supplementary information -->
    <xsl:template match="sir">
        <ref>
            <xsl:attribute name="type">figure</xsl:attribute>
            <xsl:attribute name="target">
                <xsl:text>#</xsl:text>
                <xsl:apply-templates select="@rid"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="scientific">
        <ref>
            <xsl:attribute name="corresp">
                <xsl:apply-templates select="@id"/>
            </xsl:attribute>
            <xsl:attribute name="type">
                <xsl:apply-templates select="@type"/>
            </xsl:attribute>
            <xsl:attribute name="subtype">
                <xsl:apply-templates select="@dbtype"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="weblink">
        <ref>
            <xsl:attribute name="target">
                <xsl:apply-templates select="@url"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="deflist | rsc:deflist">
        <xsl:choose>
            <xsl:when test="term">
                <list type="termlist">
                    <xsl:apply-templates select="@*"/>
                    <item>
                        <xsl:apply-templates/>
                    </item>
                </list>
            </xsl:when>
            <xsl:otherwise>
                <list type="termlist">
                    <xsl:apply-templates select="@*"/>
                    <xsl:apply-templates/>
                </list>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    <xsl:template match="deflist/head | rsc:deflist/rsc:head">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    <xsl:template match="deflist/@type| rsc:deflist/@type">
        <xsl:attribute name="type">gloss</xsl:attribute>
    </xsl:template>
    <xsl:template match="deflist/term |rsc:deflist/rsc:term">
        <term>
            <xsl:apply-templates/>
        </term>
    </xsl:template>
    <xsl:template match="deflist/defn | rsc:deflist/rsc:defn">
        <gloss>
            <xsl:choose>
                <xsl:when test="p">
                    <xsl:value-of select="p"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </gloss>
    </xsl:template>
    <!-- SG - Nature: nettoyage du <bdy> polluant -->
    <xsl:template match="bdy"/>
    <!-- SG - Nature: nettoyage des auteurs coincés dans le bdy (ex:nature_body_corres.xml) -->
    <xsl:template match="bdy/corres/aug"/>
    <xsl:template match="deflist/@colwd |rsc:deflist/@colwd"/>
    <xsl:template match="deflist/@sepch | rsc:deflist/@sepch"/>
    <!-- SG - Nature: nettoyage du <linkgrp> polluant -->
    <xsl:template match="linkgrp"/>
    <!-- Lists -->
    
    <xsl:template match="ce:list">
        <list>
            <xsl:apply-templates/>
        </list>
    </xsl:template>
    
    <xsl:template match="ce:list-item">
        <item>
            <xsl:if test="ce:label">
                <label>
                    <xsl:value-of select="ce:label"/>
                </label>
            </xsl:if>
            <xsl:apply-templates/>
        </item>
    </xsl:template>

    <!-- Formules mathématiques -->
    <xsl:template match="f|Formula | formula | inline-formula | disp-formula | ce:formula">
        <xsl:choose>
            <xsl:when test="parent::mixed-citation">
                <emph>
                    <xsl:apply-templates/>
                </emph>
            </xsl:when>
            <xsl:when test="parent::sec">
                <p>
                <formula>
                    <xsl:if test="@id">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="label">
                        <xsl:attribute name="n">
                            <xsl:value-of select="label"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="@Notation | @notation">
                            <xsl:attribute name="notation">
                                <xsl:value-of select="@Notation | @notation"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="@Notation | @notation">
                            <xsl:attribute name="notation">
                                <xsl:value-of select="@Notation | @notation"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="@content-type">
                            <xsl:attribute name="notation">
                                <xsl:value-of select="@content-type"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="tex-math">
                            <xsl:attribute name="notation">
                                <xsl:text>tex</xsl:text>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:if test="tex-math/@id">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="tex-math/@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="name(.)='inline-formula'">
                        <xsl:attribute name="rend">
                            <xsl:text>inline</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="name(.)='disp-formula'">
                        <xsl:attribute name="rend">
                            <xsl:text>display</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </formula>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <formula>
                    <xsl:if test="@id">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="label">
                        <xsl:attribute name="n">
                            <xsl:value-of select="label"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="@Notation | @notation">
                            <xsl:attribute name="notation">
                                <xsl:value-of select="@Notation | @notation"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="@Notation | @notation">
                            <xsl:attribute name="notation">
                                <xsl:value-of select="@Notation | @notation"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="@content-type">
                            <xsl:attribute name="notation">
                                <xsl:value-of select="@content-type"/>
                            </xsl:attribute>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:if test="tex-math/@id">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="tex-math/@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="name(.)='inline-formula'">
                        <xsl:attribute name="rend">
                            <xsl:text>inline</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="name(.)='disp-formula'">
                        <xsl:attribute name="rend">
                            <xsl:text>display</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </formula>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="disp-formula/label"/>
    <xsl:template match="disp-formula/alternatives">
        <xsl:apply-templates/>
    </xsl:template>


    <!-- Specific rule for Springer's Inline equation -->

    <xsl:template match="InlineEquation | Equation">
        <xsl:choose>
            <xsl:when test="ancestor::Description">
                <objectType>
                    <xsl:if test="EquationNumber">
                        <xsl:attribute name="n">
                            <xsl:value-of select="EquationNumber"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </objectType>
            </xsl:when>
            <xsl:otherwise>
                <formula>
                    <xsl:if test="@ID">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@ID"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="EquationSource/@Format">
                        <xsl:attribute name="notation">
                            <xsl:value-of select="EquationSource/@Format"/>
                        </xsl:attribute>
                        <xsl:attribute name="style">equation</xsl:attribute>
                    </xsl:if>
                    <xsl:if test="EquationNumber">
                        <xsl:attribute name="n">
                            <xsl:value-of select="EquationNumber"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </formula>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Specific rile for Elsevier inline pathematical objects -->

    <!-- 2017-04-03: Vérifier le traitement des éléments de XMLLatex -->
    <xsl:template match="els1:math |els2:math | math">
        <xsl:choose>
            <xsl:when test="els1:rm/els1:a |els2:rm/els1:a |rm/a">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <formula notation="mathml" xmlns:mml="http://www.w3.org/1998/Math/MathML">
                    <xsl:if test="../ce:label[string-length() &gt; 0]">
                        <xsl:attribute name="n">
                            <xsl:value-of select="../ce:label"/>
                        </xsl:attribute>
                    </xsl:if>
                    <mml:math>
                        <xsl:apply-templates/>
                    </mml:math>
                </formula> 
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="r">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="c">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="els1:fr |els2:fr | fr | ar">
        <mml:mfrac xmlns:mml="http://www.w3.org/1998/Math/MathML">
                <xsl:apply-templates/>
        </mml:mfrac>
    </xsl:template>
    <xsl:template match="els1:nu |els2:nu | nu">
        <xsl:choose>
            <xsl:when test="els1:fen |els2:fen | fen">
                <mml:msup xmlns:mml="http://www.w3.org/1998/Math/MathML">
                    <xsl:apply-templates/>
                </mml:msup>
            </xsl:when>
            <xsl:otherwise>
                <mml:mi xmlns:mml="http://www.w3.org/1998/Math/MathML">
                    <xsl:apply-templates/>
                </mml:mi>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="els1:rm |els2:rm |rm">
        <mml:mrow xmlns:mml="http://www.w3.org/1998/Math/MathML">
            <xsl:apply-templates/>
        </mml:mrow>
    </xsl:template>
    <xsl:template match="els1:unl |els2:unl |unl">
        <mml:munder xmlns:mml="http://www.w3.org/1998/Math/MathML">
            <xsl:apply-templates/>
        </mml:munder>
    </xsl:template>
    <xsl:template match="els1:a | els2:a| a">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="els1:ac | els2:ac| ac">
        <xsl:choose>
            <xsl:when test=".!=' '">
                <!-- exemple noice elsevier polluée 10.1016/S0750-7658(00)90220-X -->
                <xsl:choose>
                    <xsl:when test=".=' '"/>
                    <xsl:when test=".='E'">E</xsl:when>
                    <xsl:when test=".='A'">A</xsl:when>
                    <xsl:when test=".='e'">e</xsl:when>
                    <xsl:when test=".='a'">à</xsl:when>
                    <xsl:when test=".='c'">ç</xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="els1:ovl |els2:ovl |ovl">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="els1:de |els2:de | de">
        <xsl:choose>
            <xsl:when test="els1:fen |els2:fen | fen">
                <mml:msub xmlns:mml="http://www.w3.org/1998/Math/MathML">
                    <xsl:apply-templates/>
                </mml:msub>
            </xsl:when>
            <xsl:otherwise>
                <mml:mi xmlns:mml="http://www.w3.org/1998/Math/MathML">
                    <xsl:apply-templates/>
                </mml:mi>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- SG - WILEY ajout élément latex -->
    <xsl:template match="wiley:span[@type='tex']">
        <hi>
            <formula notation="tex">
                <!-- http://www.tei-c.org/release/doc/tei-p5-doc/fr/html/examples-formula.html -->
                <xsl:apply-templates/>
            </formula>
        </hi>
    </xsl:template>
    
    <!-- SG - WILEY traitement mathml - voir notice ZYGO.ZYGO1222.xml -->
   <!-- <xsl:template match="wiley:displayedItem[@type='mathematics']">
        <formula notation="mathml">
        <xsl:apply-templates/>
        </formula>
    </xsl:template>
    <xsl:template match="wiley:displayedItem[@type='mathematics']/wiley:label"/>-->
    
    <!-- References in text -->
    <!-- citref for RCS (Royal CHemical Society) -->

    <xsl:template match="citref |rsc:citref">
        <ref type="bibr">
            <xsl:attribute name="target">
                <xsl:variable name="concat">
                    <xsl:value-of select="concat('#',@idrefs)"/>
                </xsl:variable>
                <xsl:variable name="diese">
                    <xsl:value-of select="translate($concat,' ','#')"/>
                </xsl:variable>
                <xsl:variable name="espace" select="normalize-space(replace($diese,'#',' #'))"/>
                <xsl:value-of select="$espace"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    
    <xsl:template match="greeting">
        <salute>
            <xsl:apply-templates/>
        </salute>
    </xsl:template>
    
    <xsl:template match="bibr | bibrinl">
        <ref type="bibr" rend="superscript">
            <xsl:variable name="diese">
                <xsl:value-of select="replace(@rid,' ',' #')"/>
            </xsl:variable>
            <xsl:attribute name="target">
                <xsl:value-of select="concat('#',$diese)"/>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test=". !=''">
                    <hi rend="superscript">
                        <xsl:apply-templates/>
                    </hi>
                </xsl:when>
                <xsl:when test="@rid !=''">
                    <hi rend="superscript">
                        <xsl:variable name="clean">
                            <xsl:value-of select="translate(@rid,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ','')"/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="contains($clean,' ')">
                                <xsl:value-of select="translate($clean,' ',',')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$clean"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </hi>
                </xsl:when>
            </xsl:choose>
        </ref>
    </xsl:template>
    <xsl:template match="bibr/@rid" mode="rid">
        <xsl:call-template name="splitName"/>
    </xsl:template>
    <xsl:template match="accession">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template name="splitName">
        <!-- start with nothing in $first and all the words in $rest -->
        <xsl:param name="first" select="''" />
        <xsl:param name="rest" select="." />
        
        <xsl:choose>
            <!-- if rest contains more than one word -->
            <xsl:when test="substring-after($rest, ' ')">
                <xsl:call-template name="splitName">
                    <!-- move the first word of $rest to the end of $first and recurse.
               For the very first word this will add a stray leading space
               to $first, which we will clean up later. -->
                    <xsl:with-param name="first" select="concat($first, ' ',substring-before($rest, ' '))" />
                    <xsl:with-param name="rest" select="substring-after($rest, ' ')" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <!-- $rest is now just the last word of the original name, and $first
             contains all the others plus a leading space that we have to
             remove -->
                <xsl:text>#</xsl:text>
                    <xsl:value-of select="substring($first, 2)" />
                <xsl:text> #</xsl:text>
                    <xsl:value-of select="$rest" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="cite">
        <ref type="bibr">
            <xsl:choose>
                <xsl:when test="@range !=''">
                    <xsl:attribute name="target">
                        <xsl:apply-templates select="@range"/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="target">
                        <xsl:text>#</xsl:text>
                        <xsl:value-of select="@id|@linkend"/>
                    </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="secref">
        <ref type="section">
            <xsl:attribute name="target">
                <xsl:value-of select="@linkend"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <!-- SG ajout ref <xnav> -->
    <xsl:template match="xnav">
        <ref type="bibr">
            <xsl:attribute name="target">
                <xsl:variable name="concat">
                    <xsl:value-of select="concat('#',@extrefid)"/>
                </xsl:variable>
                <xsl:variable name="diese">
                    <xsl:value-of select="translate($concat,' ','#')"/>
                </xsl:variable>
                <xsl:variable name="espace" select="normalize-space(replace($diese,'#',' #'))"/>
                <xsl:value-of select="$espace"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
	
    <xsl:template match="figr">
        <ref type="figure">
            <xsl:attribute name="target">
                <xsl:variable name="concat">
                    <xsl:value-of select="concat('#',@rid)"/>
                </xsl:variable>
                <xsl:variable name="diese">
                    <xsl:value-of select="translate($concat,' ','#')"/>
                </xsl:variable>
                <xsl:variable name="espace" select="normalize-space(replace($diese,'#',' #'))"/>
                <xsl:value-of select="$espace"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <!-- SG - ajout illustration à figure -->
    <xsl:template match="illusr">
        <ref type="figure">
            <xsl:attribute name="target">
                <xsl:variable name="concat">
                    <xsl:value-of select="concat('#',@rid)"/>
                </xsl:variable>
                <xsl:variable name="diese">
                    <xsl:value-of select="translate($concat,' ','#')"/>
                </xsl:variable>
                <xsl:variable name="espace" select="normalize-space(replace($diese,'#',' #'))"/>
                <xsl:value-of select="$espace"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <xsl:template match="tablr">
        <ref type="table">
            <xsl:attribute name="target">
                <xsl:variable name="concat">
                    <xsl:value-of select="concat('#',@rid)"/>
                </xsl:variable>
                <xsl:variable name="diese">
                    <xsl:value-of select="translate($concat,' ','#')"/>
                </xsl:variable>
                <xsl:variable name="espace" select="normalize-space(replace($diese,'#',' #'))"/>
                <xsl:value-of select="$espace"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
	
    <xsl:template match="schemref | rsc:schemref">
        <ref type="schema">
            <xsl:attribute name="target">
                <xsl:variable name="concat">
                    <xsl:value-of select="concat('#',@idrefs)"/>
                </xsl:variable>
                <xsl:variable name="diese">
                    <xsl:value-of select="translate($concat,' ','#')"/>
                </xsl:variable>
                <xsl:variable name="espace" select="normalize-space(replace($diese,'#',' #'))"/>
                <xsl:value-of select="$espace"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="scheme | rsc:scheme">
        <figure type="schema">
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@height">
                <xsl:attribute name="rendition">
                    <xsl:value-of select="@height"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@width">
                <xsl:attribute name="rend">
                    <xsl:value-of select="@width"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="@xsrc">
                    <figDesc>
                        <xsl:value-of select="@xsrc"/>
                    </figDesc>
                </xsl:when>
                <xsl:when test="title">
                    <figDesc>
                        <xsl:value-of select="title"/>
                    </figDesc>
                </xsl:when>
            </xsl:choose>
        </figure>
    </xsl:template>

    <xsl:template match="figref |rsc:figref">
        <ref type="figure">
            <xsl:attribute name="target">
                <xsl:variable name="concat">
                    <xsl:choose>
                        <xsl:when test="@idrefs[string-length() &gt; 0]">
                            <xsl:value-of select="concat('#',@idrefs)"/></xsl:when>
                        <xsl:when test="@linkend[string-length() &gt; 0]">
                            <xsl:value-of select="concat('#',@linkend)"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="diese">
                    <xsl:value-of select="translate($concat,' ','#')"/>
                </xsl:variable>
                <xsl:variable name="espace" select="normalize-space(replace($diese,'#',' #'))"/>
                <xsl:value-of select="$espace"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>


    <xsl:template match="tableref | rsc:tableref">
        <ref type="table">
            <xsl:attribute name="target">
                <xsl:variable name="concat">
                    <xsl:value-of select="concat('#',@idrefs)"/>
                </xsl:variable>
                <xsl:variable name="diese">
                    <xsl:value-of select="translate($concat,' ','#')"/>
                </xsl:variable>
                <xsl:variable name="espace" select="normalize-space(replace($diese,'#',' #'))"/>
                <xsl:value-of select="$espace"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    
    <xsl:template match="ancref | rsc:ancref">
        <ref type="anchor">
            <xsl:attribute name="target">
                <xsl:variable name="concat">
                    <xsl:value-of select="concat('#',@rid)"/>
                </xsl:variable>
                <xsl:variable name="diese">
                    <xsl:value-of select="translate($concat,' ','#')"/>
                </xsl:variable>
                <xsl:variable name="espace" select="normalize-space(replace($diese,'#',' #'))"/>
                <xsl:value-of select="$espace"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    
    <xsl:template match="anchor">
        <anchor xml:id="{@id}"/>
    </xsl:template>
    
    
    <!-- Elsevier pointers -->
    
    <xsl:template match="ce:float-anchor">
        <ptr>
            <xsl:attribute name="target">
                <xsl:variable name="concat">
                    <xsl:value-of select="concat('#',@refid)"/>
                </xsl:variable>
                <xsl:variable name="diese">
                    <xsl:value-of select="translate($concat,' ','#')"/>
                </xsl:variable>
                <xsl:variable name="espace" select="normalize-space(replace($diese,'#',' #'))"/>
                <xsl:value-of select="$espace"/>
            </xsl:attribute>
        </ptr>
    </xsl:template>

    <!-- +++++ Tags de formatage +++++++ -->
    <!-- NLM 2.3 article: italic, bold, underline, sub, sup, fn, emph!!-->
    <!-- Sage: it -->
    <!-- Elsevier: ce:italic -->
    <!-- Springer: Emphasis[@Type='Italic'], Emphasis[@Type='Bold'], Subscript, Superscript -->

    <xsl:template
        match="i  | ce:italic | Emphasis[@Type='Italic'] | italic | emph[@display='italic'] | wiley:i">
        <xsl:if test=". !=''">
            <xsl:choose>
                <!-- nettoyage des labels dans les affiliations -->
                <xsl:when test="parent::aff">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:when>
                <xsl:when test="ancestor::reftxt and contains(.,'et al')">
                    <author>et al.</author>
                </xsl:when>
                <xsl:when test="ancestor::reftxt and contains(.,'Meeting')">
                    <title><xsl:apply-templates/></title>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:if test="not(ancestor::reftxt or parent::list-item)">
                        <hi rend="italic">
                            <xsl:apply-templates/>
                        </hi>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template match="bold | ce:bold | Emphasis[@Type='Bold'] | emph[@display='bold'] | wiley:b | b|bo|rsc:bo">
    <xsl:choose>
        <xsl:when test="parent::aff">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:when>
        <xsl:when test="ancestor::list-item and parent::label">
                <title type="label">
                    <hi rend="italic"><xsl:apply-templates/></hi>
                </title>
        </xsl:when>
        <xsl:when test="ancestor::label">
            <head type="label">
                <hi rend="italic"><xsl:apply-templates/></hi>
            </head>
        </xsl:when>
        <xsl:when test="child::volume">
            <biblScope unit="vol">
                <hi rend="italic">
            <xsl:apply-templates/>
                </hi>
            </biblScope>
        </xsl:when>
        <xsl:otherwise>
            <xsl:if test=". !=''">
                <hi rend="bold">
                    <xsl:apply-templates/>
                </hi></xsl:if>
        </xsl:otherwise>
    </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Emphasis[@Type='SmallCaps'] | ce:small-caps | sc | scp| rsc:sc | rsc:scp | wiley:sc">
        <xsl:choose>
            <xsl:when test="ancestor::label |ancestor::rsc:label"/>
            <xsl:otherwise>
                <xsl:if test=". !=''">
                    <hi rend="smallCaps">
                        <xsl:apply-templates/>
                    </hi>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="Emphasis | emph">
        <xsl:if test=". !=''">
            <hi>
                <xsl:choose>
                    <xsl:when test="@Type">
                        <xsl:attribute name="rend">
                            <xsl:value-of select="@Type"/>
                        </xsl:attribute>
                        <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:when test="@FontCategory">
                        <xsl:attribute name="rend">
                            <xsl:value-of select="@FontCategory"/>
                        </xsl:attribute>
                        <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:when test="@display">
                        <xsl:attribute name="rend">
                            <xsl:value-of select="@FontCategory"/>
                        </xsl:attribute>
                        <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </hi>
        </xsl:if>
    </xsl:template>

    <xsl:template match="inf|rsc:inf|Subscript | sub  | rsc:sub | ce:inf | wiley:sub">
        <xsl:choose>
            <xsl:when test="ancestor::math">
                <mml:msub xmlns:mml="http://www.w3.org/1998/Math/MathML">
                    <xsl:apply-templates/>
                </mml:msub>
            </xsl:when>
            <xsl:otherwise>
                <hi rend="subscript">
                    <xsl:apply-templates/>
                </hi>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="Superscript |rsc:Superscript | ce:sup | super| rsc:super | wiley:sup">
        <hi rend="superscript"><xsl:apply-templates/></hi>
    </xsl:template>
    <xsl:template match="sup| rsc:sup">
        <xsl:if test=".!=''">
            <xsl:choose>
                <!-- nettoyage des labels dans les affiliations -->
                <xsl:when test="parent::aff |parent::rsc:aff"/>
                <xsl:otherwise>
                    <hi rend="superscript">
                        <xsl:apply-templates/>
                    </hi> 
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template match="ul |underline | ce:underline">
        <xsl:if test=".">
            <hi rend="underline"><xsl:apply-templates/></hi>
        </xsl:if>
    </xsl:template>
    <xsl:template match="scr">
        <xsl:if test=".">
            <hi rend="script"><xsl:apply-templates/></hi>
        </xsl:if>
    </xsl:template>

    <xsl:template match="break">
        <xsl:choose>
            <xsl:when test="ancestor::aff"/>
            <xsl:otherwise><lb/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="wiley:fc">
        <xsl:if test=".">
            <hi rend="fc"><xsl:apply-templates/></hi>
        </xsl:if>
    </xsl:template>
    <xsl:template match="wiley:fr">
        <xsl:if test=".">
            <hi rend="fr"><xsl:apply-templates/></hi>
        </xsl:if>
    </xsl:template>
    <xsl:template match="wiley:fi">
        <xsl:if test=".">
            <hi rend="fi"><xsl:apply-templates/></hi>
        </xsl:if>
    </xsl:template>
    <xsl:template match="wiley:span">
        <xsl:if test=".">
            <emph><span><xsl:apply-templates/></span></emph>
        </xsl:if>
    </xsl:template>
    

    <!-- Footnotes
    Springer: Footnote/@ID-->
    
    <xsl:template match="fn | Footnote" mode="author">
        <note place="foot">
            <xsl:if test="@id|@ID">
                <xsl:attribute name="n">
                    <xsl:value-of select="@id|@ID"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    
    <!-- ACS les footnotes contiennent parfois les véritables affiliations 
    exemple: ISTEX ark _67375_TPS-GS6LWBRQ-7.xml-->
    <xsl:template match="fn | Footnote" mode="acs">
        <affiliation>
            <xsl:apply-templates select="p"/>
        </affiliation>
    </xsl:template>

    <!-- Citation en ligne:
    Springer: BlockQuote-->
    <xsl:template match="BlockQuote">
        <cit>
            <xsl:apply-templates/>
        </cit>
    </xsl:template>

    <xsl:template match="BlockQuote/Para">
        <quote>
            <xsl:apply-templates/>
        </quote>
    </xsl:template>
    
	<!-- Entity markers (NPG) -->
	<xsl:template match="named-entity">
	    <rs>
	        <xsl:attribute name="corresp">
	            <xsl:value-of select="@id"/>
	        </xsl:attribute>
	        <xsl:apply-templates/>
	    </rs>
	</xsl:template>
	
    <xsl:template match="sec">
        <div>
            <xsl:attribute name="n">
                <xsl:value-of select="@level"/>
            </xsl:attribute>
            <xsl:apply-templates select="sectitle | p"/>
		</div>
    </xsl:template>
    <xsl:template match="sectitle |heading">
        <head>
			<xsl:apply-templates/>
		</head>	
    </xsl:template>
	
    <xsl:template match="wiley:body/wiley:section">
        <div>
            <xsl:if test="@xml:lang">
            <xsl:attribute name="xml:lang">
                <xsl:value-of select="@xml:lang"/>
            </xsl:attribute>
            </xsl:if>
            <!-- SG - ajout numéro de section -->
            <xsl:if test="@xml:id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="contains(@xml:id,'sec')">
                <xsl:attribute name="type">section</xsl:attribute>
            </xsl:if>
            <xsl:if test="@type">
                <xsl:attribute name="subtype">
                    <xsl:value-of select="@type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="wiley:title">
		            <xsl:apply-templates select="wiley:title"/>
			</xsl:if>
			<xsl:apply-templates select="* except (wiley:title)"/>
        </div>
    </xsl:template>
    <xsl:template match="wiley:section/wiley:section">
        <div>
            <xsl:if test="@xml:lang">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="@xml:lang"/>
                </xsl:attribute>
            </xsl:if>
            <!-- SG - ajout numéro de section -->
            <xsl:if test="@xml:id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="contains(@xml:id,'sec')">
                <xsl:attribute name="type">section</xsl:attribute>
            </xsl:if>
            <xsl:if test="wiley:title">
                    <xsl:apply-templates select="wiley:title"/>
            </xsl:if>
            <xsl:apply-templates select="* except (wiley:title)"/>
        </div>
    </xsl:template>
    <xsl:template match="wiley:abstract/wiley:section">
        <div>
            <xsl:if test="@xml:lang">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="@xml:lang"/>
                </xsl:attribute>
            </xsl:if>
            <!-- SG - 10.1002/bjs.7563 -->
            <xsl:if test="@xml:id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
	
   <xsl:template match="wiley:section/wiley:title">
       <head>
		<xsl:apply-templates/>
       </head>
	</xsl:template>
	<!-- SG ajout citation "other" -->
    <xsl:template match="wiley:citation [@type='other']">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="wiley:p/wiley:url">
        <ref type="url">
          	<xsl:value-of select="@href"/>
		</ref>	
    </xsl:template>
	
	<!-- no idea what it this <sc> tag in Wiley - apparently a styling element -->
   <!-- <xsl:template match="wiley:sc">
        <xsl:apply-templates/>
    </xsl:template>-->
    
    <!-- SG reprise wiley:inlineGraphic dans body -->
    <xsl:template match="wiley:inlineGraphic | inline-graphic">
        <graphic>
            <xsl:if test="normalize-space(@location)">
                <xsl:attribute name="url">
                    <xsl:value-of select="@location"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="normalize-space(@filename)">
                <xsl:attribute name="url">
                    <xsl:value-of select="@filename"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="normalize-space(@xlink:href)">
                <xsl:attribute name="url">
                    <xsl:value-of select="@xlink:href"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="normalize-space(@alt)">
                <xsl:attribute name="rend">
                    <xsl:value-of select="@alt"/>
                </xsl:attribute>
            </xsl:if>
        </graphic>
    </xsl:template>
    <xsl:template match="tex-math">
        <formula notation="tex">
            <xsl:if test="normalize-space(@id)">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="node()"/>
        </formula>
    </xsl:template>
    <xsl:template match="online-methods"><xsl:apply-templates/></xsl:template>
    <xsl:template match="wiley:header/wiley:contentMeta/wiley:supportingInformation"> 
        <div type="appendice">
            <xsl:apply-templates select="wiley:supportingInfoItem"/>
        </div>
    </xsl:template>
    <!-- reprise supportingInformation -->
    <xsl:template match="wiley:supportingInfoItem">
            <p>
                <xsl:apply-templates/>
            </p>
    </xsl:template>
    <!-- SG - traitement des book-reviews -->
    <xsl:template match="wiley:header/wiley:contentMeta/wiley:titleGroup/wiley:title/wiley:citation">
        <div type="review-of">
            <bibl>
                <xsl:apply-templates/>
            </bibl>
        </div>
    </xsl:template>
    <!-- taylor et francis -->
    <xsl:template match="index-entry | toc-entry">
        <xsl:choose>
            <xsl:when test="parent::index-div | parent::toc">
                <item>
                    <xsl:apply-templates/> 
                </item>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="index-term">
        <term>
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </term>
    </xsl:template>
    <xsl:template match="verse-group">
        <lg>
            <xsl:apply-templates/>
        </lg>
    </xsl:template>
    <xsl:template match="verse-line">
        <l>
        <xsl:apply-templates/>
        </l>
    </xsl:template>
    <xsl:template match="definition-list">
        <list type="index" xml:id="{@id}">
            <xsl:apply-templates/>
        </list>
    </xsl:template>
    <xsl:template match="def-list-item">
        <item xml:id="{@id}">
            <xsl:apply-templates/>
        </item>
    </xsl:template>
    <xsl:template match="list-text">
        <desc>
            <xsl:value-of select="p"/>
        </desc>
    </xsl:template>
    <xsl:template match="display-eqn">
        <formula notation="tex" >
            <xsl:variable name="TeX">
                <xsl:apply-templates/>
            </xsl:variable>
            <xsl:if test="@id[string-length() &gt; 0]">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="normalize-space($TeX)"/>
            <xsl:if test="eqn-graphic/@filename!=''">
                <graphic mimeType="{eqn-graphic/@format}" url="{eqn-graphic/@filename}"/>
            </xsl:if>
        </formula>
    </xsl:template>
    <xsl:template match="processing-instruction('TeX')">
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="eqnref">
        <ref type="formula">
            <xsl:if test="@linkend[string-length() &gt; 0]">
                <xsl:attribute name="target">
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="@linkend"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="."/>
        </ref>
    </xsl:template>
    <xsl:template match="tabref">
        <ref type="table">
            <xsl:if test="@linkend[string-length() &gt; 0]">
                <xsl:attribute name="target">
                    <xsl:value-of select="@linkend"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="."/>
        </ref>
    </xsl:template>
    <!-- ecco ajout d'un espace entre les balises pour reconstruction du texte-->
    <xsl:template match="wd">
        <xsl:apply-templates/>
        <xsl:text> </xsl:text>
    </xsl:template>
   
    <!-- erudit -->
    <xsl:template match="section1">
        <div>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="section2">
        <div>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="section3">
        <div>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="section4">
        <div>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="section5">
        <div>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="renvoi">
        <xsl:choose>
            <xsl:when test="parent::nomfamille"/>
            <xsl:otherwise>
                <ref xml:id="{@id}" n="{@id}" type="{@typeref}">
                    <xsl:apply-templates/>
                </ref>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="liensimple">
        <ref xml:id="{@id}" n="{@id}">
            <xsl:if test="@typeref[string-length()&gt; 0]">
                <xsl:attribute name="type">
                    <xsl:value-of select="@typeref"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@xlink:href[string-length()&gt; 0]">
                <xsl:attribute name="target">
                    <xsl:value-of select="@xlink:href"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="listenonord">
        <list rend="{@signe}">
            <xsl:apply-templates/>
        </list>
    </xsl:template>
    <xsl:template match="listeord">
        <list rend="{@numeration}">
            <xsl:apply-templates/>
        </list>
    </xsl:template>
    <xsl:template match="elemliste">
        <item>
            <xsl:apply-templates/>
        </item>
    </xsl:template>
    <xsl:template match="equation">
        <figure xml:id="{@id}">
            <xsl:apply-templates/>
        </figure>
    </xsl:template>
    <xsl:template match="statement/label">
        <label>
            <xsl:apply-templates/>
        </label>
    </xsl:template>
    <xsl:template match="ce:inline-figure">
        <figure>
            <xsl:if test="normalize-space(ce:link/@locator)">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="ce:link/@locator"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </figure>
    </xsl:template>
    
    <!-- découpage des références multiples wiley -->
    <!-- nettoyage des ref -->
    <xsl:template match="wiley:link">
        <ref>
            <xsl:attribute name="type">
                <xsl:choose>
                    <xsl:when test="contains(@href,'tab') or contains(@href,'tb')">table</xsl:when>
                    <xsl:when test="contains(@href,'fig') or contains(@href,'fg')">figure</xsl:when>
                    <xsl:when test="contains(@href,'bb') or contains(@href,'bib')">bibr</xsl:when>
                    <xsl:when test="contains(@href,'sec')">section</xsl:when>
                    <xsl:when test="contains(@href,'note')">fn</xsl:when>
                    <xsl:when test="contains(@href,'disp') or contains(@href,'mthst')">formula</xsl:when>
                    <xsl:otherwise>bibr</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:attribute name="target">
                <xsl:value-of select="@href"/>
            </xsl:attribute>
            <hi rend="superscript">
                <xsl:choose>
                    <xsl:when test=". !=''">
                        <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="@href"/>
                    </xsl:otherwise>
                </xsl:choose>
            </hi>
        </ref>
    </xsl:template>
    <xsl:template match="@href">
        <xsl:choose>
        <xsl:when test="contains(.,' ')">
            <xsl:call-template name="ParseRef">
                <xsl:with-param name="theRef">
                    <xsl:apply-templates/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="resultat">
                    <xsl:value-of select="translate(substring-after(.,'-'),'-','')"/>
                </xsl:variable>
                <!--<xsl:value-of select="$resultat"/>-->
                <xsl:choose>
                    <xsl:when test="starts-with($resultat,'bib000')">
                        <xsl:text>b</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'bib000')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'bib00')">
                        <xsl:text>b</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'bib00')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'bib0')">
                        <xsl:text>b</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'bib0')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'fig000')">
                        <xsl:text>fig</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'fig000')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'fig00')">
                        <xsl:text>fig</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'fig00')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'fig0')">
                        <xsl:text>fig</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'fig0')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'note000')">
                        <xsl:text>fn</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'note000')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'note00')">
                        <xsl:text>fn</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'note00')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'note0')">
                        <xsl:text>fn</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'note0')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'tbl000')">
                        <xsl:text>tbl</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'tbl000')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'tbl00')">
                        <xsl:text>tbl</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'tbl00')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'tbl0')">
                        <xsl:text>tbl</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'tbl0')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'sec000')">
                        <xsl:text>sec</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'sec000')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'sec00')">
                        <xsl:text>sec</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'sec00')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'sec0')">
                        <xsl:text>sec</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'sec0')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'mthst000')">
                        <xsl:text>mthst</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'mthst000')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'mthst00')">
                        <xsl:text>mthst</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'mthst00')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'mthst0')">
                        <xsl:text>mthst</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'mthst0')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'disp000')">
                        <xsl:text>disp</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'mthst000')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'disp00')">
                        <xsl:text>disp</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'disp00')"/>
                    </xsl:when>
                    <xsl:when test="starts-with($resultat,'disp0')">
                        <xsl:text>disp</xsl:text>
                        <xsl:value-of select="substring-after($resultat,'mthst0')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$resultat"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="ParseRef">
        <!--<xsl:param name="theRef" select="substring-after(.,'bib-')"/>-->
        <xsl:param name="theRef" select="."/>
        <xsl:param name="inAddress" select="false()"/>
        <xsl:variable name="avantEspace">
            <xsl:choose>
                <xsl:when test="contains($theRef,' ')">
                    <xsl:value-of select="normalize-space(substring-before($theRef,' '))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space($theRef)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apresEspace">
            <xsl:choose>
                <xsl:when test="contains($theRef,' ')">
                    <xsl:value-of select="normalize-space(substring-after($theRef,' '))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="not($inAddress)">
                <xsl:call-template name="ParseRef">
                    <!--<xsl:with-param name="theRef" select="substring-after(.,'bib-')"/>-->
                    <xsl:with-param name="theRef" select="."/>
                    <xsl:with-param name="inAddress" select="true()"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="contains($avantEspace,' ')">
                        <xsl:value-of select="substring-after($avantEspace,' ')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text> </xsl:text>
                        <xsl:choose>
                            <xsl:when test="contains($avantEspace,'-')">
                                <xsl:variable name="resultat">
                                    <xsl:value-of select="translate(substring-after($avantEspace,'-'),'-','')"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test="starts-with($resultat,'bib000')">
                                        <xsl:text>b</xsl:text>
                                        <xsl:value-of select="substring-after($resultat,'bib000')"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with($resultat,'bib00')">
                                        <xsl:text>b</xsl:text>
                                        <xsl:value-of select="substring-after($resultat,'bib00')"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with($resultat,'bib0')">
                                        <xsl:text>b</xsl:text>
                                        <xsl:value-of select="substring-after($resultat,'bib0')"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="substring-after($avantEspace,'-')"/>
                            </xsl:otherwise>
                        </xsl:choose>
<!--                        <xsl:value-of select="substring-after($avantEspace,'-')"/>-->
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="$apresEspace !=''">
                    <xsl:call-template name="ParseRef">
                        <xsl:with-param name="theRef" select="$apresEspace"/>
                        <xsl:with-param name="inAddress" select="true()"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="@range">
        <xsl:call-template name="ParseRange">
            <xsl:with-param name="theRange">
                <xsl:apply-templates/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="ParseRange">
        <xsl:param name="theRange" select="translate(.,',',' ')"/>
        <xsl:param name="inAddress" select="false()"/>
        <xsl:variable name="avantEspace">
            <xsl:choose>
                <xsl:when test="contains($theRange,' ')">
                    <xsl:value-of select="normalize-space(substring-before($theRange,' '))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space($theRange)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apresEspace">
            <xsl:choose>
                <xsl:when test="contains($theRange,' ')">
                    <xsl:value-of select="normalize-space(substring-after($theRange,' '))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="not($inAddress)">
                <xsl:call-template name="ParseRange">
                    <xsl:with-param name="theRange" select="translate(.,',',' ')"/>
                    <xsl:with-param name="inAddress" select="true()"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="contains($avantEspace,' ')">
                        <xsl:value-of select="substring-after($avantEspace,' ')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text> #</xsl:text>
                        <xsl:value-of select="$avantEspace"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="$apresEspace !=''">
                    <xsl:call-template name="ParseRange">
                        <xsl:with-param name="theRange" select="$apresEspace"/>
                        <xsl:with-param name="inAddress" select="true()"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
