<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" 
    xmlns:m="http://www.w3.org/1998/Math/MathML"
    xmlns:els1="http://www.elsevier.com/xml/ja/dtd"    
    xmlns:els2="http://www.elsevier.com/xml/cja/dtd"
    xmlns:onix="http://ns.editeur.org/onix/3.0/reference"
    xmlns:s1="http://www.elsevier.com/xml/si/dtd"
    xmlns:wiley="http://www.wiley.com/namespaces/wiley/wiley"
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all">
    <!-- ajout déclaration schema ODD-ISTEX -->
    
    <xsl:output encoding="UTF-8" method="xml" indent="yes"/>
    <xsl:param name="xslversion">3.6.3</xsl:param>
    <xsl:param name="releasedate">2026-01-09</xsl:param>
    <xsl:param name="datecreation"/>
    <xsl:param name="idistex"/>
    <xsl:param name="arkistex"/>
    <xsl:param name="corpusname"/>
    <xsl:param name="rawfulltextpath"/>
    
    <xsl:include href="Imports.xsl"/>
    <xsl:include href="Templates.xsl"/>
    
    <xsl:include href="BMJ.xsl"/>
    <xsl:include href="EDPSArticle.xsl"/>
    <xsl:include href="EDPSedp-article.xsl"/>
    <xsl:include href="ScholarOne.xsl"/>
    <xsl:include href="NLM2TEI-article.xsl"/>
    <xsl:include href="Elsevier.xsl"/>
    <xsl:include href="Nature.xsl"/>
    <xsl:include href="ArticleSetNLMV2.0.xsl"/>
    <xsl:include href="Sage.xsl"/>
    
    <!-- RL: ajout de mon cas IOP.xsl-->
    <xsl:include href="IOP.xsl"/>
    <!--
	<xsl:include href="IOPPatch.xsl"/>
    -->
    <xsl:include href="SpringerCommon.xsl"/>
    <xsl:include href="SpringerStage2.xsl"/>
    <xsl:include href="SpringerStage3.xsl"/>
    <xsl:include href="SpringerBookChapter.xsl"/>
    <xsl:include href="RoyalChemicalSociety.xsl"/>
    <xsl:include href="Wiley.xsl"/>
    <xsl:include href="BookChapter.xsl"/>
    <xsl:include href="BookAll.xsl"/>
    <xsl:include href="Euclid.xsl"/>
    <!-- SG: ajout du format TEI vers TEI (DROZ / openEdition revues-->
    <xsl:include href="Tei.xsl"/>
    <!-- SG: ajout du format METS - openEditon Books-->
    <xsl:include href="Mets.xsl"/>
    <!-- SG: ajout du format ASP - proquest theologiens-->
    <xsl:include href="Asp.xsl"/>
    <!-- SG: ajout du format Marc21XML-->
    <xsl:include href="MARC21.xsl"/>
    <!-- SG: ajout du format Onix-->
    <xsl:include href="Onix.xsl"/>
    <!-- SG: ajout du format Erudit (cairn)-->
    <xsl:include href="Erudit.xsl"/>
    <!-- SG: ajout du format Result (proquest archives parlementaires)-->
    <xsl:include href="Result.xsl"/>
    <!-- SG: ajout du format Jsonxml (oa)-->
    <xsl:include href="Jsonxml.xsl"/>
    <xsl:template match="/" name="xsl:initial-template">
        <xsl:choose> 
            <xsl:when test="metadata">
                <xsl:message>Converting a BMJ article</xsl:message>
            </xsl:when>
            <xsl:when test="article_set">
                <!-- <article_set dtd_version="4.1.2"> -->
                <xsl:message>Converting a ScholarOne compatible article (e.g. OUP, Taylor,
                    Wiley)</xsl:message>
            </xsl:when>
            <xsl:when test="article[front]">
                <xsl:message>Converting an NLM 2.2 article</xsl:message>
            </xsl:when>
            <xsl:when test="article[item-info] |els1:article[els1:item-info] | els2:article[els2:item-info] | converted-article[item-info] |els1:converted-article[els1:item-info] | els2:converted-article[els2:item-info] |  simple-article[item-info] |  els1:simple-article[els1:item-info] | els2:simple-article[els2:item-info] |book-review[item-info]| els1:book-review[els1:item-info] |els2:book-review[els2:item-info] |bibliography[item-info]| els1:bibliography[els1:item-info] |els2:bibliography[els2:item-info] |catalog[item-info]| els1:catalog[els1:item-info] |els2:catalog[els2:item-info] |book[item-info]| els1:book[els1:item-info] |els2:book[els2:item-info] |examination[item-info]| els1:examination[els1:item-info] |els2:examination[els2:item-info] |exam[item-info]| els1:exam[els1:item-info] |els2:exam[els2:item-info] |fb-non-chapter[item-info]| els1:fb-non-chapter[els1:item-info] |els2:fb-non-chapter[els2:item-info] |introduction[item-info]| els1:introduction[els1:item-info] |els2:introduction[els2:item-info] |simple-chapter[item-info]| els1:simple-chapter[els1:item-info] |els2:simple-chapter[els2:item-info] |chapter[item-info]| els1:chapter[els1:item-info] |els2:chapter[els2:item-info]">
                <xsl:message>Converting an Elsevier article</xsl:message>
            </xsl:when>
            <xsl:when test="nihms-submit">
                <xsl:message>Converting a Nature article</xsl:message>
            </xsl:when>
            <xsl:when test="ArticleSet">
                <xsl:message>Converting an NLM 2.0 article</xsl:message>
            </xsl:when>
            <xsl:when test="SAGEmeta">
                <xsl:message>Converting a Sage article</xsl:message>
            </xsl:when>
            <xsl:when test="EDPSArticle">
                <xsl:message>Converting an EDPS article</xsl:message>
            </xsl:when>
            <xsl:when test="edp-article">
                <xsl:message>Converting an EDPS backfile article</xsl:message>
            </xsl:when>
            <xsl:when test="Article/ArticleInfo">
                <xsl:message>Converting a Springer stage 2 article</xsl:message>
            </xsl:when>
            <xsl:when test="Publisher/PublisherInfo and not(Publisher/Series/Book/descendant::Chapter)">
                <xsl:message>Converting a Springer stage 3 article</xsl:message>
            </xsl:when>
            <xsl:when test="count(Publisher/Series/Book/descendant::Chapter)=1">
                <xsl:message>Converting a Springer book chapter</xsl:message>
            </xsl:when>
            <xsl:when test="article/art-admin">
                <xsl:message>Converting a Royal Chemical Society article</xsl:message>
            </xsl:when>
            <xsl:when test="article/pubfm">
                <xsl:message>Converting a NPG article</xsl:message>
            </xsl:when>
            <xsl:when test="article/suppfm">
                <xsl:message>Converting a NPG article</xsl:message>
            </xsl:when>
            <xsl:when test="wiley:component">
                <xsl:message>Converting a Wiley article</xsl:message>
            </xsl:when>
            <xsl:when test="book/book-meta">
                <xsl:message>Converting a bits.book.dtd chapter</xsl:message>
            </xsl:when>
            <xsl:when test="book/bookInfo">
                <xsl:message>Converting a proquest book.dtd ebook</xsl:message>
            </xsl:when>
            <xsl:when test="euclid_issue">
                <xsl:message>Converting a Duke article</xsl:message>
            </xsl:when>
            <xsl:when test="asp">
                <xsl:message>Converting a proquest TCRT book</xsl:message>
            </xsl:when>
            <!-- SG casalini -->
            <xsl:when test="onix:ONIXMessage">
                <xsl:message>Converting a onix chapter</xsl:message>
            </xsl:when>
            <xsl:when test="article[admin]">
                <xsl:message>Converting a eruditCairn.dtd articles</xsl:message>
            </xsl:when>
            <xsl:when test="book-part-wrapper">
                <xsl:message>Converting a Springer-bits-book-2 ebooks</xsl:message>
            </xsl:when>
            <xsl:when test="result">
                <xsl:message>Converting a Proquest items</xsl:message>
            </xsl:when>
            <!-- RL: vérif encore très stricte pour le nouveau cas -->
            <xsl:when test="(
                contains(/article/article-metadata/article-data/copyright, 'IOP')
                or contains(/article/article-metadata/jnl-data/jnl-imprint, 'IOP')
                or contains(/article/article-metadata/jnl-data/jnl-imprint, 'Institute of Physics')
                )
                and /article/article-metadata/article-data/article-type[@sort='regular']">
                <xsl:message>Converting an IOP regular article</xsl:message>
            </xsl:when>
		<!-- SG json -->
            <xsl:when test="doc">
                <xsl:message>Converting a JsonXml items</xsl:message>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message>Converting a non-identified article: - name: <xsl:value-of
                    select="name(*)"/> - local-name: <xsl:value-of select="local-name(*)"/> -
                    namespace-uri: <xsl:value-of select="namespace-uri(*)"/>
                </xsl:message>
            </xsl:otherwise>
        </xsl:choose>
        
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>
