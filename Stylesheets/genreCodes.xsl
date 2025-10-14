<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:m="http://www.w3.org/1998/Math/MathML"  xmlns:rsc="http://www.rsc.org/schema/rscart38" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:els1="http://www.elsevier.com/xml/ja/dtd"    
    xmlns:els2="http://www.elsevier.com/xml/cja/dtd"
    xmlns:s1="http://www.elsevier.com/xml/si/dtd"
    xmlns:sb="http://www.elsevier.com/xml/common/struct-bib/dtd"
    xmlns:sa="http://www.elsevier.com/xml/common/struct-aff/dtd"
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns:dcterms="http://purl.org/dc/terms/" 
    xmlns:mets="http://www.loc.gov/METS/"
    xmlns:wiley="http://www.wiley.com/namespaces/wiley/wiley"
    xmlns:onix="http://ns.editeur.org/onix/3.0/reference" exclude-result-prefixes="#all">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> March 14, 2022</xd:p>
            <xd:p><xd:b>Author:</xd:b> Stéphanie GREGORIO</xd:p>
            <xd:p>Parsing 'code genre' classification ISTEX</xd:p>
        </xd:desc>
    </xd:doc>
    
    <!-- genre dans titre -->
    <xsl:variable name="deduceGenreFromTitle">
        <xsl:value-of select="//article/front/article-meta/title-group/article-title |//book-part[not(body/book-part)]/book-part-meta/title-group/title"/>
    </xsl:variable>
    <xsl:variable name="titleToDeduceGenreOnix">
        <xsl:value-of select="/onix:ONIXMessage/onix:Product/onix:ContentDetail/onix:ContentItem/onix:TitleDetail/onix:TitleElement/onix:TitleText"/>
    </xsl:variable>
    <!-- code genre Elsevier-->
    <xsl:variable name="codeGenre1Elsevier">
        <xsl:value-of select="normalize-space(//@docsubtype)[string-length() &gt; 0]"/>
    </xsl:variable>
    <!-- REGROUPEMENT -->
    <xsl:variable name="codeGenreAll">
        <xsl:choose>
            <xsl:when test="//ArticleDOI='10.1007/s10528-006-9009-2'">article</xsl:when>
            <xsl:when test="//pubfm/categ/@id[string-length() &gt; 0]">
                <xsl:value-of select="normalize-space(//pubfm/categ/@id)"/>
            </xsl:when>
            <xsl:when test="//isbn='978-3-318-05934-2' and //article-title='History of the Basel Institute for Immunology'">book</xsl:when>
            <xsl:when test="//isbn='978-3-318-05934-2' and not(//article-title='History of the Basel Institute for Immunology')">other</xsl:when>
            <!-- RSC ebooks -->
            <xsl:when test="contains(/article/front/journal-meta/publisher/publisher-name,'The Royal Society of Chemistry')">
                <xsl:choose>
                    <xsl:when test="contains($deduceGenreFromTitle,'Chapter') or contains($deduceGenreFromTitle,'CHAPTER')">chapter</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Appendix')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'CD-ROM information')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Conclusion')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Contents')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Conversion factor')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Epilogue')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Front matter')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Front cover')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Front Cover')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Glossary')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Introduction')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Learning outcomes')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'List of')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Subject index')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Summarised contents')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Summary of')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Tutorial chemistry texts')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Editorial')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'List of tables')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Abbreviations')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Acknowledgements')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Front matter')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Abberviations')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'The future')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'About the Authors')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'About the Editors')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Back Matter')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Answers to exercises')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Author index')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Back matter')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Back cover')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Back Cover')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Bibliography')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Biographical Notes')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Boxes')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Concluding remarks')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'CONTENTS')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Contributors')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Editorial announcement')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Cover')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Errata')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Erratum')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Foreword')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Forword')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Further reading')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Symbols and abbreviations')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Table of Contents')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'The molecular world course team')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'The target: β-Aminoalcohols')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Volume preface')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Recommended reading')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Questions: Answers and comments')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'Editors')">other</xsl:when>
                    <xsl:when test="contains($deduceGenreFromTitle,'books and reviews')">book-reviews</xsl:when>
                    <xsl:otherwise>chapter</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!-- traitement spécial Casalini-torrossa-eeo -->
            <xsl:when test="//onix:ONIXMessage">
                <xsl:choose>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Introduc')">editorial</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Presentació')">editorial</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Preámbul')">editorial</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Prólogo')">editorial</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Pròleg')">editorial</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Prefac')">editorial</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'A modo de ')">editorial</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Reproducción facsimilar')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Bibliograf')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Índice')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Indice')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Autor')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Abrevia')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Agradecimientos')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Advertencia')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Agraïments')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Anexo')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Annex')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Biograf')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Cronologia')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Cuadros')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Glosario')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Glossari')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Illustracions')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Índex')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Index')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Lista')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Palabras liminares')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Resum')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Salud')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Saluta')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Sigl')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Dicionario')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Figuras')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Ilustraciones')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Los autores')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Apèndix fotogràfic')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Mapas')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Fuentes documentales')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Algunas siglas y abreviaturas')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Fuentes')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Sobre los autores')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Láminas')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Topònims i antropònims')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'In memóriam')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Cálculos')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Concordancias')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Nota sobre transcripciones y abreviaturas')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Documentos y fotografías')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Nota')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Expósita')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Objectius')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Apéndices')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Palabras')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Álbum fotográfico')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Cronología')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Relación de ilustraciones')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Criterios de edición de textos')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Arxius')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Nuestra edición')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Breve presentación')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Imágenes')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'La presente edición')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'A modo de epílogo')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Ficha')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Briefing in english')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Programa')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Fonts i bibliografia')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Tipología y decoración')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Presagios')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Referencias')">other</xsl:when>
                    <xsl:when test="starts-with($titleToDeduceGenreOnix,'Abstract')">abstract</xsl:when>
                    <xsl:otherwise>chapter</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains(/article/front/article-meta/article-categories/subj-group[1]/subject[1][@content-type='original'],'Case reports')">
                <xsl:value-of select="/article/front/article-meta/article-categories/subj-group[1]/subject[1][@content-type='original']"/>
            </xsl:when>
            <xsl:when test="contains(/article/front/article-meta/article-categories/subj-group[1]/subject[1],'Chapter')">
                <xsl:value-of select="/article/front/article-meta/article-categories/subj-group[1]/subject[1]"/>
            </xsl:when>
            <xsl:when test="//article/front/article-meta/title-group/subtitle[1] [string-length() &gt; 0] and starts-with(//article-id[@pub-id-type='doi'],'10.1039/')">
                <!-- traitement spécial RSC-ebooks -->
                <xsl:choose>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle[1] | /article/front/article-meta/title-group/title,'Preface')">editorial</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle[1] | /article/front/article-meta/title-group/title,'Forward')">editorial</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle[1]| /article/front/article-meta/title-group/title,'Introduction')">editorial</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle[1] | /article/front/article-meta/title-group/title,'Introduction and general aspects')">editorial</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle[1] | /article/front/article-meta/title-group/title,'Back Cover')">other</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle[1] | /article/front/article-meta/title-group/title,'Front cover')">other</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle[1] | /article/front/article-meta/title-group/title,'Subject Index')">other</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle[1] | /article/front/article-meta/title-group/title,'Author Index')">other</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle[1] | /article/front/article-meta/title-group/title,'Contents')">other</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle[1] | /article/front/article-meta/title-group/title,'Front matter')">other</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle[1] | /article/front/article-meta/title-group/title,'Abbreviations')">other</xsl:when>
                    <xsl:when test="contains(//article/front/article-meta/title-group/article-title[1],'Chapter') or contains(//article/front/article-meta/title-group/article-title,'CHAPTER')">chapter</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="//body/book-part/book-part-meta/title-group/title [string-length() &gt; 0]">
                <!-- traitement spécial Degruyter-ebooks -->
                <xsl:choose>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'Preface')">editorial</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'Préface')">editorial</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'PREFACE')">editorial</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'PREFACE')">editorial</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'PRÉFACE')">editorial</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'PRÉFACE LA DOMUS À MONTAILLOU ET EN HAUTE-ARIÈGE')">editorial</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'Introduction Générale')">editorial</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'Introduction')">editorial</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'Avant-Propos')">editorial</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'AVANT-PROPOS')">editorial</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'INTRODUCTION')">editorial</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'INTRODUCTION ET PROGRAMME')">editorial</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'Backmatter')">other</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'A. Tableaux statistiques')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Abréviations')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'ABRÉVIATIONS')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'ANNEXE')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'ARCHIVES')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Avertissement')">other</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'Β. Cartes')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Bibliographie')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'BIBLIOGRAPHIE')">other</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'Choix et utilisation des sources')">other</xsl:when>
                    <xsl:when test="contains(//body/book-part/book-part-meta/title-group/title,'C. Graphiques')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Carte')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Exercices et compléments')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'GLOSSAIRE')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Glossaire')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'GRAPHIQUE')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'IMPRIMÉS')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Index')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'INDEX')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Liste')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Liste')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Noms des auteurs')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'NOTE')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'NOTE')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Plan de')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'PIÈCES JUSTIFICATIVES')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'PRINCIPAUX OUVRAGES UTILISES')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'PROGRAMME')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Quelques thèmes')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'REMERCIEMENTS')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'RÈGLES DE TRADUCTION')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Remerciements')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Repères bibliographiques')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'SIGLES UTILISÉS')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Sommaire')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'SOMMAIRE DU TOME PREMIER')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'SOURCES')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Source')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'TABLE')">other</xsl:when>
                    <xsl:when test="starts-with(//body/book-part/book-part-meta/title-group/title,'Table')">other</xsl:when>
                    <xsl:otherwise>chapter</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <!--codeGenreIOP-->
                <!--codeGenreSage-->
                <!--codeGenreBrepolsBook-->
                <!--codeGenreRSC-->
                <!--codeGenreSpringerJournal-->
                <!--codeGenreSpringerBook-->
                <!--codeGenreNLM-->
                <!--codeGenreEuclid-->
                <!--codeGenreMets-->
                <!--codeGenreIOPHeader-->
                <!--codeGenreCUPebooks-->
                <!--codeGenreEmerald-->
                <xsl:value-of select="normalize-space(
                    //article/article-metadata/article-data/article-type/@type
                    |//SAGEmeta/@type
                    |//book-part[not(body/book-part)]/@book-part-type
                    |//body/book-part/@book-part-type
                    |//article/@article-type|//article/@type  |//articletype/@pubmedForm |//rsc:articletype/@pubmedForm
                    |//ArticleInfo/@ArticleType
                    |//Series/Book/Chapter/ChapterInfo/@ChapterType | //Series/Book/Part/Chapter/ChapterInfo/@ChapterType | //Publisher/Book/Chapter/ChapterInfo/@ChapterType | //Publisher/Book/Part/Chapter/ChapterInfo/@ChapterType
                    |//article/@article-type
                    |//@docsubtype
                    |//record/@type
                    |//mets:xmlData[dcterms:type!='book']/dcterms:type
                    |//header/ident/attributes/@art_type)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <!-- ISTEX -->
    <xsl:variable name="codeGenreIstex">
        <xsl:choose>
            <xsl:when test="(//els1:item-info/ce:doi |//els2:item-info/ce:doi | //item-info/ce:doi)='10.1016/0168-1656(96)01385-5'">research-article</xsl:when>
            <xsl:when test="(//els1:item-info/ce:doi |//els2:item-info/ce:doi | //item-info/ce:doi)='10.1002/adma.201570063'">other</xsl:when>
        <xsl:when test="$codeGenreAll='Announcement'">
                <xsl:choose>
                    <xsl:when test="$codeGenreAll='Announcement' and //Abstract[string-length()&gt; 0]">article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='OriginalPaper'">
                <xsl:choose>
                    <xsl:when test="//Abstract and //Keyword">research-article</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='mis'">
                <xsl:choose>
                    <xsl:when test="//els1:head/ce:abstract | //els2:head/ce:abstract | //head/ce:abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='chapter'">
                <xsl:choose>
                    <xsl:when test="contains(//header/publicationMeta[@level='unit']/titleGroup/title[@type='tocHeading1'],'Brief communications')">brief-communication</xsl:when>
                    <xsl:when test="contains(//header/publicationMeta[@level='unit']/titleGroup/title[@type='tocHeading1'],'Review Paper')">review-article</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/article-categories/subj-group[@subj-group-type='heading'][1]/subject,'Chapter')">chapter</xsl:when>
                    <xsl:otherwise>chapter</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='Chapter'">
                <xsl:choose>
                    <xsl:when test="contains(//header/publicationMeta[@level='unit']/titleGroup/title[@type='tocHeading1'],'Brief communications')">brief-communication</xsl:when>
                    <xsl:when test="contains(//header/publicationMeta[@level='unit']/titleGroup/title[@type='tocHeading1'],'Review Paper')">review-article</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/article-categories/subj-group[@subj-group-type='heading'][1]/subject,'Chapter')">chapter</xsl:when>
                    <xsl:otherwise>chapter</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='other'">
                <xsl:choose>
                    <xsl:when test="//article/front/article-meta/article-categories/subj-group/subject='ORIGINAL RESEARCH PAPERS'">research-article</xsl:when>
                    <xsl:when test="//article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/trans-abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0] and contains(//article-meta/fpage,'s') or contains(//article-meta/fpage,'S')">article</xsl:when>
                    <xsl:when test="//abstract |rsc:abstract[string-length() &gt; 0] and contains(//article-meta/fpage |//rsc:article-meta/rsc:fpage,'s') or contains(//article-meta/fpage | //rsc:article-meta/rsc:fpage,'S')">article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0] and //journal-meta/issn[@pub-type='ppub']='0767-0974'">brief-communication</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='translation'">
                <xsl:choose>
                    <xsl:when test="//abstract |rsc:abstract[string-length() &gt; 0] and contains(//article-meta/fpage |//rsc:article-meta/rsc:fpage,'s') or contains(//article-meta/fpage | //rsc:article-meta/rsc:fpage,'S')">article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='books-received'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!-- pour ACS -->
            <xsl:when test="$codeGenreAll='discussion'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/trans-abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">brief-communication</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='in-brief'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">brief-communication</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='introduction'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='letter'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>review-article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='magazine'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">brief-communication</xsl:when>
                    <xsl:when test="article/front/article-meta/trans-abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='news'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='News'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='abs'">abstract</xsl:when>
            <xsl:when test="$codeGenreAll='Abstract'">abstract</xsl:when>
            <xsl:when test="$codeGenreAll='abstract'">abstract</xsl:when>
            <xsl:when test="$codeGenreAll='add'">article</xsl:when>
            <xsl:when test="$codeGenreAll='addendum'">other</xsl:when>
            <xsl:when test="$codeGenreAll='AFO'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='AMS'">article</xsl:when>
            <xsl:when test="$codeGenreAll='ANL'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='announcement'">other</xsl:when>
            <xsl:when test="$codeGenreAll='APP'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='ART'">article</xsl:when>
            <xsl:when test="$codeGenreAll='article-commentary'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='Article'">article</xsl:when>
            <xsl:when test="$codeGenreAll='article'">article</xsl:when>
            <xsl:when test="$codeGenreAll='astronomical-observation'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='ASU'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='backmatter'">other</xsl:when>
            <xsl:when test="$codeGenreAll='BKR'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreAll='book-review'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreAll='bookReview'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreAll='bookReview'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreAll='brief-report'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreAll='BriefCommunication'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreAll='brv'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreAll='calendar'">other</xsl:when>
            <xsl:when test="$codeGenreAll='CAR'">article</xsl:when>
            <xsl:when test="$codeGenreAll='case-report'">case-report</xsl:when>
            <xsl:when test="$codeGenreAll='Case reports'">case-report</xsl:when>
            <xsl:when test="$codeGenreAll='CaseReport'">case-report</xsl:when>
            <xsl:when test="$codeGenreAll='caseStudy'">case-report</xsl:when>
            <xsl:when test="$codeGenreAll='CMT'">article</xsl:when>
            <xsl:when test="$codeGenreAll='cnf'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='collection'">other</xsl:when>
            <xsl:when test="$codeGenreAll='COM'">article</xsl:when>
            <xsl:when test="$codeGenreAll='commentary'">article</xsl:when>
            <xsl:when test="$codeGenreAll='Conference'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='ContinuingEducation'">article</xsl:when>
            <xsl:when test="$codeGenreAll='correction'">article</xsl:when>
            <xsl:when test="$codeGenreAll='correction'">article</xsl:when>
            <xsl:when test="$codeGenreAll='CRP'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='CRV'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='CVR'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='DIS' or $codeGenreAll='dis'">
                <xsl:choose>
                    <xsl:when test="//ce:abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='dissertation'">other</xsl:when>
            <xsl:when test="$codeGenreAll='EDG'">article</xsl:when>
            <xsl:when test="$codeGenreAll='EDI'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='edi'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='edit'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='Editorial'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='editorial'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='EditorialNotes'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='EDU'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='EMA'">article</xsl:when>
            <xsl:when test="$codeGenreAll='errata'">article</xsl:when>
            <xsl:when test="$codeGenreAll='erratum'">article</xsl:when>
            <xsl:when test="$codeGenreAll='error'">other</xsl:when>
            <xsl:when test="$codeGenreAll='ESS'">article</xsl:when>
            <xsl:when test="$codeGenreAll='experiment'">article</xsl:when>
            <xsl:when test="$codeGenreAll='FAB'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='FEA'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='fla'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='FOC'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='FOR'">article</xsl:when>
            <xsl:when test="$codeGenreAll='FRO'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='frontmatter'">other</xsl:when>
            <xsl:when test="$codeGenreAll='HIG'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='historicalPerspective'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='HOT'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='ILN'">article</xsl:when>
            <xsl:when test="$codeGenreAll='index'">other</xsl:when>
            <xsl:when test="$codeGenreAll='INV'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='IRE'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='Journal Article'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='KEY'">article</xsl:when>
            <xsl:when test="$codeGenreAll='laws'">case-report</xsl:when>
            <xsl:when test="$codeGenreAll='Legacy'">article</xsl:when>
            <xsl:when test="$codeGenreAll='lecture'">article</xsl:when>
            <xsl:when test="$codeGenreAll='LET'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='lett'">article</xsl:when>
            <xsl:when test="$codeGenreAll='Letter'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='lists'">article</xsl:when>
            <xsl:when test="$codeGenreAll='magnetical-observation'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='meteorological-observation'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='meeting-report'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='meetingReport'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='MES'">article</xsl:when>
            <xsl:when test="$codeGenreAll='MET'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='miscellaneous'">other</xsl:when>
            <xsl:when test="$codeGenreAll='MRV'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='note'">article</xsl:when>
            <xsl:when test="$codeGenreAll='notes'">other</xsl:when>
            <xsl:when test="$codeGenreAll='NTP'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='NWS'">article</xsl:when>
            <xsl:when test="$codeGenreAll='nws'">article</xsl:when>
            <xsl:when test="$codeGenreAll='obituary'">other</xsl:when>
            <xsl:when test="$codeGenreAll='OPN'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='oration'">other</xsl:when>
            <xsl:when test="$codeGenreAll='OTH'">other</xsl:when>
            <xsl:when test="$codeGenreAll='paper'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='paper-read'">article</xsl:when>
            <xsl:when test="$codeGenreAll='partial-retraction'">other</xsl:when>
            <xsl:when test="$codeGenreAll='PER'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='poster'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='pdf-issue'">article</xsl:when>
            <xsl:when test="$codeGenreAll='preface'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='PRO'">other</xsl:when>
            <xsl:when test="$codeGenreAll='problems'">other</xsl:when>
            <xsl:when test="$codeGenreAll='prod'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreAll='product-review'">article</xsl:when>
            <xsl:when test="$codeGenreAll='publications'">article</xsl:when>
            <xsl:when test="$codeGenreAll='rapid-communication'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreAll='rapidCommunication'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreAll='rapidPublication'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreAll='reply'">article</xsl:when>
            <xsl:when test="$codeGenreAll='Report'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='reprint'">article</xsl:when>
            <xsl:when test="$codeGenreAll='RES'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='research-article'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='retracted'">other</xsl:when>
            <xsl:when test="$codeGenreAll='retraction'">other</xsl:when>
            <xsl:when test="$codeGenreAll='rev'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='review-article'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='review'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='reviewArticle'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='ReviewPaper'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='Reviews'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='SAB'">abstract</xsl:when>
            <xsl:when test="$codeGenreAll='sco'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreAll='serialArticle'">article</xsl:when>
            <xsl:when test="$codeGenreAll='short-reports'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreAll='shortArticle'">article</xsl:when>
            <xsl:when test="$codeGenreAll='shortCommunication'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreAll='ssu'">article</xsl:when>
            <xsl:when test="$codeGenreAll='TEC'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='technicalNote'">article</xsl:when>
            <xsl:when test="$codeGenreAll='TIN'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='TRV'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='TWA'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='VPT'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='WAT'">review-article</xsl:when>
            <!--Emerald-->
            <xsl:when test="$codeGenreAll='e-conceptual-paper'">article</xsl:when>
            <xsl:when test="$codeGenreAll='e-viewpoint'">article</xsl:when>
            <xsl:when test="$codeGenreAll='e-technical-paper'">article</xsl:when>
            <xsl:when test="$codeGenreAll='e-literature-review'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='e-review'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreAll='back-matter'">editorial</xsl:when>
            <!-- NATURE -->
            <xsl:when test="$codeGenreAll='adfeat'">article</xsl:when>
            <xsl:when test="$codeGenreAll='af'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='absd'">abstract</xsl:when>
            <xsl:when test="$codeGenreAll='adfeat'">article</xsl:when>
            <xsl:when test="$codeGenreAll='amateurtelescopemaker'">article</xsl:when>
            <xsl:when test="$codeGenreAll='ampedsoc'">article</xsl:when>
            <xsl:when test="$codeGenreAll='an'">article</xsl:when>
            <xsl:when test="$codeGenreAll='ar'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='archeology'">article</xsl:when>
            <xsl:when test="$codeGenreAll='astronomy'">article</xsl:when>
            <xsl:when test="$codeGenreAll='aviation'">article</xsl:when>
            <xsl:when test="$codeGenreAll='bc'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='bca'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreAll='bks'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreAll='bo'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreAll='brfnw'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreAll='case'">case-report</xsl:when>
            <xsl:when test="$codeGenreAll='casefv'">case-report</xsl:when>
            <xsl:when test="$codeGenreAll='caser'">case-report</xsl:when>
            <xsl:when test="$codeGenreAll='categtxt'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='chemistryinindustry'">article</xsl:when>
            <xsl:when test="$codeGenreAll='clin'">article</xsl:when>
            <xsl:when test="$codeGenreAll='clinadv'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='clincase'">case-report</xsl:when>
            <xsl:when test="$codeGenreAll='clincr'">case-report</xsl:when>
            <xsl:when test="$codeGenreAll='clinfor'">article</xsl:when>
            <xsl:when test="$codeGenreAll='clinres'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='clintechnq'">article</xsl:when>
            <xsl:when test="$codeGenreAll='cmeed'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='cn'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='cna'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='co'">article</xsl:when>
            <xsl:when test="$codeGenreAll='collabrv'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='comment'">article</xsl:when>
            <xsl:when test="$codeGenreAll='com'">article</xsl:when>
            <xsl:when test="$codeGenreAll='compbio'">article</xsl:when>
            <xsl:when test="$codeGenreAll='conf'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='cm'">article</xsl:when>
            <xsl:when test="$codeGenreAll='cr'">article</xsl:when>
            <xsl:when test="$codeGenreAll='cs'">article</xsl:when>
            <xsl:when test="$codeGenreAll='cse'">case-report</xsl:when>
            <xsl:when test="$codeGenreAll='cy'">article</xsl:when>
            <xsl:when test="$codeGenreAll='dsdv'">article</xsl:when>
            <xsl:when test="$codeGenreAll='ecr'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='ED'">Editorial</xsl:when>
            <xsl:when test="$codeGenreAll='ed'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='edfv'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='edin'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='edurep'">article</xsl:when>
            <xsl:when test="$codeGenreAll='electronics'">article</xsl:when>
            <xsl:when test="$codeGenreAll='engineering'">article</xsl:when>
            <xsl:when test="$codeGenreAll='erq'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='erp'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='essay'">article</xsl:when>
            <xsl:when test="$codeGenreAll='ewr'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='exprv'">article</xsl:when>
            <xsl:when test="$codeGenreAll='fa'">article</xsl:when>
            <xsl:when test="$codeGenreAll='fd'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='fe'">article</xsl:when>
            <xsl:when test="$codeGenreAll='forestindustry'">article</xsl:when>
            <xsl:when test="$codeGenreAll='fundamentalscience'">article</xsl:when>
            <xsl:when test="$codeGenreAll='gen'">article</xsl:when>
            <xsl:when test="$codeGenreAll='genetestrv'">article</xsl:when>
            <xsl:when test="$codeGenreAll='gnintl'">article</xsl:when>
            <xsl:when test="$codeGenreAll='grow'">article</xsl:when>
            <xsl:when test="$codeGenreAll='hc'">article</xsl:when>
            <xsl:when test="$codeGenreAll='health'">article</xsl:when>
            <xsl:when test="$codeGenreAll='healthscience'">article</xsl:when>
            <xsl:when test="$codeGenreAll='hh'">article</xsl:when>
            <xsl:when test="$codeGenreAll='hn'">article</xsl:when>
            <xsl:when test="$codeGenreAll='hp'">article</xsl:when>
            <xsl:when test="$codeGenreAll='hrn'">article</xsl:when>
            <xsl:when test="$codeGenreAll='in'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='indp'">article</xsl:when>
            <xsl:when test="$codeGenreAll='industriesatoms'">article</xsl:when>
            <xsl:when test="$codeGenreAll='industry'">article</xsl:when>
            <xsl:when test="$codeGenreAll='invcm'">article</xsl:when>
            <xsl:when test="$codeGenreAll='invcme'">article</xsl:when>
            <xsl:when test="$codeGenreAll='inved'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='japnf'">article</xsl:when>
            <xsl:when test="$codeGenreAll='japnw'">article</xsl:when>
            <xsl:when test="$codeGenreAll='japsn'">article</xsl:when>
            <xsl:when test="$codeGenreAll='jr'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='le'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='lt'">
                <xsl:choose>
                    <xsl:when test="//fm/websumm">research-article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreAll='mabs'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='medicalscience'">article</xsl:when>
            <xsl:when test="$codeGenreAll='memrv'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='metalsinindustry'">article</xsl:when>
            <xsl:when test="$codeGenreAll='methods'">article</xsl:when>
            <xsl:when test="$codeGenreAll='militaryscience'">article</xsl:when>
            <xsl:when test="$codeGenreAll='minirv'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='mr'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='mt'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='multr'">article</xsl:when>
            <xsl:when test="$codeGenreAll='nationaldefense'">article</xsl:when>
            <xsl:when test="$codeGenreAll='naturalhistory'">article</xsl:when>
            <xsl:when test="$codeGenreAll='na'">article</xsl:when>
            <xsl:when test="$codeGenreAll='nb'">article</xsl:when>
            <xsl:when test="$codeGenreAll='nbr'">article</xsl:when>
            <xsl:when test="$codeGenreAll='nbri'">article</xsl:when>
            <xsl:when test="$codeGenreAll='natview'">article</xsl:when>
            <xsl:when test="$codeGenreAll='neuro'">article</xsl:when>
            <xsl:when test="$codeGenreAll='newboatandequip'">article</xsl:when>
            <xsl:when test="$codeGenreAll='nf'">article</xsl:when>
            <xsl:when test="$codeGenreAll='npedrv'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='nw'">article</xsl:when>
            <xsl:when test="$codeGenreAll='nv'">article</xsl:when>
            <xsl:when test="$codeGenreAll='nvqa'">article</xsl:when>
            <xsl:when test="$codeGenreAll='nvf'">article</xsl:when>
            <xsl:when test="$codeGenreAll='nvfv'">article</xsl:when>
            <xsl:when test="$codeGenreAll='op'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='osa'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='ov'">editorial</xsl:when>
            <xsl:when test="$codeGenreAll='pa'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='pe'">article</xsl:when>
            <xsl:when test="$codeGenreAll='pedr'">article</xsl:when>
            <xsl:when test="$codeGenreAll='petroleum'">article</xsl:when>
            <xsl:when test="$codeGenreAll='plastics'">article</xsl:when>
            <xsl:when test="$codeGenreAll='prhl'">article</xsl:when>
            <xsl:when test="$codeGenreAll='proceeding'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='prog'">article</xsl:when>
            <xsl:when test="$codeGenreAll='prv'">article</xsl:when>
            <xsl:when test="$codeGenreAll='psychicresearch'">article</xsl:when>
            <xsl:when test="$codeGenreAll='ra'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='railroadtransportation'">article</xsl:when>
            <xsl:when test="$codeGenreAll='rep'">case-report</xsl:when>
            <xsl:when test="$codeGenreAll='reply'">article</xsl:when>
            <xsl:when test="$codeGenreAll='research'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='rlet'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='rn'">article</xsl:when>
            <xsl:when test="$codeGenreAll='rnote'">article</xsl:when>
            <xsl:when test="$codeGenreAll='rr'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='rd'">article</xsl:when>
            <xsl:when test="$codeGenreAll='rdpub'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreAll='rcom'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='rhighlts'">article</xsl:when>
            <xsl:when test="$codeGenreAll='rs'">article</xsl:when>
            <xsl:when test="$codeGenreAll='rv'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='RV'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='rvfv'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='sc'">article</xsl:when>
            <xsl:when test="$codeGenreAll='sf'">article</xsl:when>
            <xsl:when test="$codeGenreAll='SR'">article</xsl:when>
            <xsl:when test="$codeGenreAll='sr'">article</xsl:when>
            <xsl:when test="$codeGenreAll='SS'">article</xsl:when>
            <xsl:when test="$codeGenreAll='ss'">article</xsl:when>
            <xsl:when test="$codeGenreAll='scienceinindstry'">article</xsl:when>
            <xsl:when test="$codeGenreAll='scientificresearch'">research-article</xsl:when>
            <xsl:when test="$codeGenreAll='spar'">article</xsl:when>
            <xsl:when test="$codeGenreAll='sprep'">article</xsl:when>
            <xsl:when test="$codeGenreAll='strev'">review-article</xsl:when>
            <xsl:when test="$codeGenreAll='swr'">article</xsl:when>
            <xsl:when test="$codeGenreAll='tf'">article</xsl:when>
            <xsl:when test="$codeGenreAll='th'">article</xsl:when>
            <xsl:when test="$codeGenreAll='tr'">article</xsl:when>
            <xsl:when test="$codeGenreAll='tt'">article</xsl:when>
            <xsl:when test="$codeGenreAll='wsrep'">conference</xsl:when>
            <xsl:when test="$codeGenreAll='wdiag'">case-report</xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="//article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="//article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <!-- NATURE VERBALISATION CODES SOURCE -->
    <xsl:variable name="codeGenreNature">
        <xsl:choose>
            <xsl:when test="$codeGenreAll='20q'">Twenty Questions</xsl:when>
            <xsl:when test="$codeGenreAll='50and100yrsago'">50 and 100 Years Ago</xsl:when>
            <xsl:when test="$codeGenreAll='50yrsago'">50 Years Ago</xsl:when>
            <xsl:when test="$codeGenreAll='absd'">Abstract and Discussion</xsl:when>
            <xsl:when test="$codeGenreAll='ac'">Author Contribution</xsl:when>
            <xsl:when test="$codeGenreAll='acmgcn'">ACMG College News</xsl:when>
            <xsl:when test="$codeGenreAll='acmgpolicy'">ACMG Policy Statement</xsl:when>
            <xsl:when test="$codeGenreAll='acmgprac'">ACMG Practice Guidelines</xsl:when>
            <xsl:when test="$codeGenreAll='acmgpres'">ACMG Presidential Address</xsl:when>
            <xsl:when test="$codeGenreAll='acmgrec'">ACMG Recommendations</xsl:when>
            <xsl:when test="$codeGenreAll='acmgstd'">ACMG Standards and Guidelines</xsl:when>
            <xsl:when test="$codeGenreAll='acrossedsdesk'">Across the Editor's Desk</xsl:when>
            <xsl:when test="$codeGenreAll='add'">Addendum</xsl:when>
            <xsl:when test="$codeGenreAll='adfeat'">Technology Feature</xsl:when>
            <xsl:when test="$codeGenreAll='adv'">Advances</xsl:when>
            <xsl:when test="$codeGenreAll='advert'">Advertorial</xsl:when>
            <xsl:when test="$codeGenreAll='advice'">Advice</xsl:when>
            <xsl:when test="$codeGenreAll='aeronauticalnotes'">Aeronautical Notes</xsl:when>
            <xsl:when test="$codeGenreAll='af'">Article</xsl:when>
            <xsl:when test="$codeGenreAll='amateurtelescopemaker'">The Amateur Telescope Maker</xsl:when>
            <xsl:when test="$codeGenreAll='ampedsoc'">The American Pediatric Society</xsl:when>
            <xsl:when test="$codeGenreAll='an'">Analysis</xsl:when>
            <xsl:when test="$codeGenreAll='annmtg'">Annual meeting</xsl:when>
            <xsl:when test="$codeGenreAll='announcement'">Announcement</xsl:when>
            <xsl:when test="$codeGenreAll='apn'">Application Note</xsl:when>
            <xsl:when test="$codeGenreAll='ar'">Article Report</xsl:when>
            <xsl:when test="$codeGenreAll='archeology'">Archeology</xsl:when>
            <xsl:when test="$codeGenreAll='ars'">Art and Science</xsl:when>
            <xsl:when test="$codeGenreAll='astronomy'">Astronomy</xsl:when>
            <xsl:when test="$codeGenreAll='au'">Authors</xsl:when>
            <xsl:when test="$codeGenreAll='aub'">Autumn Books</xsl:when>
            <xsl:when test="$codeGenreAll='aviation'">Aviation</xsl:when>
            <xsl:when test="$codeGenreAll='ba'">Books and Arts</xsl:when>
            <xsl:when test="$codeGenreAll='backoffrontispiece'">Back of Frontispiece</xsl:when>
            <xsl:when test="$codeGenreAll='bb'">Between Bedside and Bench</xsl:when>
            <xsl:when test="$codeGenreAll='bc'">Brief Communications</xsl:when>
            <xsl:when test="$codeGenreAll='bca'">Brief Communication Arising</xsl:when>
            <xsl:when test="$codeGenreAll='bio'">Bioentrepreneur</xsl:when>
            <xsl:when test="$codeGenreAll='biov'">Biovision</xsl:when>
            <xsl:when test="$codeGenreAll='bks'">Book Review</xsl:when>
            <xsl:when test="$codeGenreAll='bkstory'">Backstory</xsl:when>
            <xsl:when test="$codeGenreAll='blog'">Blog</xsl:when>
            <xsl:when test="$codeGenreAll='blogosphere'">Blogosphere</xsl:when>
            <xsl:when test="$codeGenreAll='blogroll'">Blogroll</xsl:when>
            <xsl:when test="$codeGenreAll='bn'">Business</xsl:when>
            <xsl:when test="$codeGenreAll='bnf'">Business Feature</xsl:when>
            <xsl:when test="$codeGenreAll='bo'">Book Review</xsl:when>
            <xsl:when test="$codeGenreAll='bonekyw'">BoneKEy Watch</xsl:when>
            <xsl:when test="$codeGenreAll='boo'">Book</xsl:when>
            <xsl:when test="$codeGenreAll='books'">Books</xsl:when>
            <xsl:when test="$codeGenreAll='bp'">Brief Report</xsl:when>
            <xsl:when test="$codeGenreAll='br'">Briefing</xsl:when>
            <xsl:when test="$codeGenreAll='brfnw'">News Brief</xsl:when>
            <xsl:when test="$codeGenreAll='brn'">Business and Regulatory News</xsl:when>
            <xsl:when test="$codeGenreAll='browsingwitheditor'">Browsing With the Editor</xsl:when>
            <xsl:when test="$codeGenreAll='bru'">Briefing Update</xsl:when>
            <xsl:when test="$codeGenreAll='bsn'">Business News</xsl:when>
            <xsl:when test="$codeGenreAll='businessandpersonal'">Business and Personal</xsl:when>
            <xsl:when test="$codeGenreAll='byndbndrs'">Beyond Boundaries</xsl:when>
            <xsl:when test="$codeGenreAll='cameraangles'">Camera Angles</xsl:when>
            <xsl:when test="$codeGenreAll='cameraanglesroundtable'">Camera Angles Round Table</xsl:when>
            <xsl:when test="$codeGenreAll='car'">Careers and Recruitment</xsl:when>
            <xsl:when test="$codeGenreAll='case'">Case Study</xsl:when>
            <xsl:when test="$codeGenreAll='casefv'">Case Study FV</xsl:when>
            <xsl:when test="$codeGenreAll='caser'">Case Report</xsl:when>
            <xsl:when test="$codeGenreAll='cc'">Community Corner</xsl:when>
            <xsl:when test="$codeGenreAll='cg'">Corrigendum</xsl:when>
            <xsl:when test="$codeGenreAll='chemistryinindustry'">Chemistry in Industry</xsl:when>
            <xsl:when test="$codeGenreAll='civilengnrngnotes'">Civil Engineering Notes</xsl:when>
            <xsl:when test="$codeGenreAll='clin'">Clinical</xsl:when>
            <xsl:when test="$codeGenreAll='clinadv'">Clinical Advance</xsl:when>
            <xsl:when test="$codeGenreAll='clincase'">Clinical Cases</xsl:when>
            <xsl:when test="$codeGenreAll='clincon'">Clinical Context</xsl:when>
            <xsl:when test="$codeGenreAll='clincr'">Clinical Case Report</xsl:when>
            <xsl:when test="$codeGenreAll='clinfor'">Clinical Informatics</xsl:when>
            <xsl:when test="$codeGenreAll='clinimg'">Clinical Image</xsl:when>
            <xsl:when test="$codeGenreAll='clinres'">Clinical research</xsl:when>
            <xsl:when test="$codeGenreAll='clintechnq'">Clinical Techniques</xsl:when>
            <xsl:when test="$codeGenreAll='clncon'">Clinical context</xsl:when>
            <xsl:when test="$codeGenreAll='clnimg'">Clinical image</xsl:when>
            <xsl:when test="$codeGenreAll='cm'">Commentary</xsl:when>
            <xsl:when test="$codeGenreAll='cme'">Continuing Medical Education</xsl:when>
            <xsl:when test="$codeGenreAll='cmeed'">CME Editorial</xsl:when>
            <xsl:when test="$codeGenreAll='cmtrep'">Committee Report</xsl:when>
            <xsl:when test="$codeGenreAll='cn'">Communication</xsl:when>
            <xsl:when test="$codeGenreAll='cna'">Communications Arising</xsl:when>
            <xsl:when test="$codeGenreAll='co'">Commentary</xsl:when>
            <xsl:when test="$codeGenreAll='col'">Column</xsl:when>
            <xsl:when test="$codeGenreAll='collabrv'">Collaborative Review</xsl:when>
            <xsl:when test="$codeGenreAll='collnews'">College News</xsl:when>
            <xsl:when test="$codeGenreAll='com'">Comment</xsl:when>
            <xsl:when test="$codeGenreAll='commrclpropnews'">Commercial Property News</xsl:when>
            <xsl:when test="$codeGenreAll='compbio'">Computational Biology</xsl:when>
            <xsl:when test="$codeGenreAll='conc'">Concepts</xsl:when>
            <xsl:when test="$codeGenreAll='conf'">Conference</xsl:when>
            <xsl:when test="$codeGenreAll='cons'">Consensus Statement</xsl:when>
            <xsl:when test="$codeGenreAll='contest'">Contest</xsl:when>
            <xsl:when test="$codeGenreAll='couch'">From the Analyst's Couch</xsl:when>
            <xsl:when test="$codeGenreAll='cprot'">Classic Protocol</xsl:when>
            <xsl:when test="$codeGenreAll='cr'">Correspondence</xsl:when>
            <xsl:when test="$codeGenreAll='crsswrd'">Crossword</xsl:when>
            <xsl:when test="$codeGenreAll='cs'">Correction</xsl:when>
            <xsl:when test="$codeGenreAll='cse'">Case Series</xsl:when>
            <xsl:when test="$codeGenreAll='cstory'">Cover Story</xsl:when>
            <xsl:when test="$codeGenreAll='currntbulltnbrfs'">Current Bulletin Briefs</xsl:when>
            <xsl:when test="$codeGenreAll='cy'">Commentary</xsl:when>
            <xsl:when test="$codeGenreAll='dabs'">Discussion of Abstracts</xsl:when>
            <xsl:when test="$codeGenreAll='db'">Debate</xsl:when>
            <xsl:when test="$codeGenreAll='dbases'">Databases</xsl:when>
            <xsl:when test="$codeGenreAll='dd'">Data Descriptor</xsl:when>
            <xsl:when test="$codeGenreAll='dept'">Department</xsl:when>
            <xsl:when test="$codeGenreAll='diary'">Diary</xsl:when>
            <xsl:when test="$codeGenreAll='dplat'">Drug Platforms</xsl:when>
            <xsl:when test="$codeGenreAll='dsdv'">Discovery &amp; Development</xsl:when>
            <xsl:when test="$codeGenreAll='dtech'">Distillery: Techniques</xsl:when>
            <xsl:when test="$codeGenreAll='dther'">Distillery: Therapeutics</xsl:when>
            <xsl:when test="$codeGenreAll='dw'">Disease Watch</xsl:when>
            <xsl:when test="$codeGenreAll='ecr'">EMBO Conference Report</xsl:when>
            <xsl:when test="$codeGenreAll='ED'">Editorial</xsl:when>
            <xsl:when test="$codeGenreAll='ed'">Editorial</xsl:when>
            <xsl:when test="$codeGenreAll='edfocus'">Editor's Focus</xsl:when>
            <xsl:when test="$codeGenreAll='edfv'">Editorial FV</xsl:when>
            <xsl:when test="$codeGenreAll='edin'">Editor's introduction</xsl:when>
            <xsl:when test="$codeGenreAll='ednote'">Editor's Note</xsl:when>
            <xsl:when test="$codeGenreAll='eds'">Editor's Letter</xsl:when>
            <xsl:when test="$codeGenreAll='edu'">Education</xsl:when>
            <xsl:when test="$codeGenreAll='eduforum'">Educational Forum</xsl:when>
            <xsl:when test="$codeGenreAll='edurep'">Educational Report</xsl:when>
            <xsl:when test="$codeGenreAll='egame'">Endgame</xsl:when>
            <xsl:when test="$codeGenreAll='egapp'">EGAPP Recommendation Statement</xsl:when>
            <xsl:when test="$codeGenreAll='el'">Elements</xsl:when>
            <xsl:when test="$codeGenreAll='electricalnotes'">Electrical Notes</xsl:when>
            <xsl:when test="$codeGenreAll='electronics'">Electronics</xsl:when>
            <xsl:when test="$codeGenreAll='emr'">EMBO Members Review</xsl:when>
            <xsl:when test="$codeGenreAll='eng'">In English, Nature</xsl:when>
            <xsl:when test="$codeGenreAll='engineering'">Engineering</xsl:when>
            <xsl:when test="$codeGenreAll='epig'">Epigenetics</xsl:when>
            <xsl:when test="$codeGenreAll='er'">Erratum</xsl:when>
            <xsl:when test="$codeGenreAll='erp'">Editorial Reprise</xsl:when>
            <xsl:when test="$codeGenreAll='essay'">Essay</xsl:when>
            <xsl:when test="$codeGenreAll='essaycon'">Essay Concept</xsl:when>
            <xsl:when test="$codeGenreAll='ethicsw'">Ethics Watch</xsl:when>
            <xsl:when test="$codeGenreAll='evrv'">Evidence Review</xsl:when>
            <xsl:when test="$codeGenreAll='ewr'">EMBO Workshop Report</xsl:when>
            <xsl:when test="$codeGenreAll='explorationnotes'">Exploration Notes</xsl:when>
            <xsl:when test="$codeGenreAll='exprv'">Expert Review</xsl:when>
            <xsl:when test="$codeGenreAll='fa'">Featured Articles</xsl:when>
            <xsl:when test="$codeGenreAll='faq'">Frequently asked Questions</xsl:when>
            <xsl:when test="$codeGenreAll='fd'">Foreword</xsl:when>
            <xsl:when test="$codeGenreAll='fe'">Feature</xsl:when>
            <xsl:when test="$codeGenreAll='fep'">Featured Editor's Picks</xsl:when>
            <xsl:when test="$codeGenreAll='filmr'">Film Review</xsl:when>
            <xsl:when test="$codeGenreAll='firearmsfishing'">Your Firearms and Fishing Tackle</xsl:when>
            <xsl:when test="$codeGenreAll='fn'">Finance</xsl:when>
            <xsl:when test="$codeGenreAll='fnisn'">ISN Forefronts in Nephrology</xsl:when>
            <xsl:when test="$codeGenreAll='fno'">Field Notes</xsl:when>
            <xsl:when test="$codeGenreAll='focus'">Focus</xsl:when>
            <xsl:when test="$codeGenreAll='focusrev'">Focus Review</xsl:when>
            <xsl:when test="$codeGenreAll='forestindustry'">Forest Industry</xsl:when>
            <xsl:when test="$codeGenreAll='forum'">Forum</xsl:when>
            <xsl:when test="$codeGenreAll='fpln'">Fresh from the Pipeline</xsl:when>
            <xsl:when test="$codeGenreAll='fqc'">Focus Quality Control</xsl:when>
            <xsl:when test="$codeGenreAll='fr'">Film Review</xsl:when>
            <xsl:when test="$codeGenreAll='fromed'">From The Editors</xsl:when>
            <xsl:when test="$codeGenreAll='frontispiece'">Frontispiece</xsl:when>
            <xsl:when test="$codeGenreAll='ftw'">Feeding the World</xsl:when>
            <xsl:when test="$codeGenreAll='fundamentalscience'">Fundamental Science</xsl:when>
            <xsl:when test="$codeGenreAll='fut'">Futures</xsl:when>
            <xsl:when test="$codeGenreAll='gen'">General</xsl:when>
            <xsl:when test="$codeGenreAll='genecardupd'">Clinical Utility Gene Card Update</xsl:when>
            <xsl:when test="$codeGenreAll='genetestrv'">GeneTest Review</xsl:when>
            <xsl:when test="$codeGenreAll='getact'">Get Active</xsl:when>
            <xsl:when test="$codeGenreAll='gic'">General Information for Contributors</xsl:when>
            <xsl:when test="$codeGenreAll='gnintl'">International Genetics</xsl:when>
            <xsl:when test="$codeGenreAll='gnlg'">Genetics Legacies</xsl:when>
            <xsl:when test="$codeGenreAll='governmentalactivities'">Governmental Activities</xsl:when>
            <xsl:when test="$codeGenreAll='graphicscience'">Graphic Science</xsl:when>
            <xsl:when test="$codeGenreAll='grow'">GROW Report</xsl:when>
            <xsl:when test="$codeGenreAll='gu'">Guidelines</xsl:when>
            <xsl:when test="$codeGenreAll='gus'">Guidelines Summary</xsl:when>
            <xsl:when test="$codeGenreAll='gw'">Genome Watch</xsl:when>
            <xsl:when test="$codeGenreAll='hc'">Historical Commentary</xsl:when>
            <xsl:when test="$codeGenreAll='health'">Health</xsl:when>
            <xsl:when test="$codeGenreAll='healthscience'">Health Science</xsl:when>
            <xsl:when test="$codeGenreAll='hh'">Human Health</xsl:when>
            <xsl:when test="$codeGenreAll='hi'">Hypertension Illustrated</xsl:when>
            <xsl:when test="$codeGenreAll='highlts'">Research Highlights</xsl:when>
            <xsl:when test="$codeGenreAll='highwaytransportation'">Highway Transportation</xsl:when>
            <xsl:when test="$codeGenreAll='hliss'">Highlights of This Issue</xsl:when>
            <xsl:when test="$codeGenreAll='hn'">Historical News and Views</xsl:when>
            <xsl:when test="$codeGenreAll='hor'">Horizons</xsl:when>
            <xsl:when test="$codeGenreAll='householdinventions'">Household Inventions</xsl:when>
            <xsl:when test="$codeGenreAll='hp'">Historical Perspective</xsl:when>
            <xsl:when test="$codeGenreAll='hrn'">Historical Research Notes</xsl:when>
            <xsl:when test="$codeGenreAll='hs'">History</xsl:when>
            <xsl:when test="$codeGenreAll='hsaw'">Harland Sanders Award</xsl:when>
            <xsl:when test="$codeGenreAll='htman'">How to manage...</xsl:when>
            <xsl:when test="$codeGenreAll='hv'">Historical Vignette</xsl:when>
            <xsl:when test="$codeGenreAll='hyp'">Hypothesis</xsl:when>
            <xsl:when test="$codeGenreAll='hys'">Have you seen?</xsl:when>
            <xsl:when test="$codeGenreAll='hyst'">Have you seen?</xsl:when>
            <xsl:when test="$codeGenreAll='ib'">In Brief</xsl:when>
            <xsl:when test="$codeGenreAll='in'">Introduction</xsl:when>
            <xsl:when test="$codeGenreAll='inclass'">In The Classroom</xsl:when>
            <xsl:when test="$codeGenreAll='index'">Index</xsl:when>
            <xsl:when test="$codeGenreAll='indexofinventions'">Index of Inventions</xsl:when>
            <xsl:when test="$codeGenreAll='indp'">Industry Perspective</xsl:when>
            <xsl:when test="$codeGenreAll='industrialdigest'">Industrial Digest</xsl:when>
            <xsl:when test="$codeGenreAll='industriesatoms'">Industries From Atoms</xsl:when>
            <xsl:when test="$codeGenreAll='industrltrnds'">Industrial Trends</xsl:when>
            <xsl:when test="$codeGenreAll='industry'">Industry</xsl:when>
            <xsl:when test="$codeGenreAll='info'">Information</xsl:when>
            <xsl:when test="$codeGenreAll='iniss'">In This Issue</xsl:when>
            <xsl:when test="$codeGenreAll='inothrflds'">In Other Fields</xsl:when>
            <xsl:when test="$codeGenreAll='inpress'">In the press</xsl:when>
            <xsl:when test="$codeGenreAll='INSIGHT'">Insight</xsl:when>
            <xsl:when test="$codeGenreAll='insight'">Insight</xsl:when>
            <xsl:when test="$codeGenreAll='insit'">In Situ</xsl:when>
            <xsl:when test="$codeGenreAll='intheedsmail'">In the Editor's Mail</xsl:when>
            <xsl:when test="$codeGenreAll='intvw'">Interview</xsl:when>
            <xsl:when test="$codeGenreAll='invcm'">Invited Commentary</xsl:when>
            <xsl:when test="$codeGenreAll='invcme'">Invited Review/CME Article</xsl:when>
            <xsl:when test="$codeGenreAll='inved'">Invited Editorial</xsl:when>
            <xsl:when test="$codeGenreAll='inventions'">Inventions</xsl:when>
            <xsl:when test="$codeGenreAll='inventionshousehold'">Inventions for the Household</xsl:when>
            <xsl:when test="$codeGenreAll='inventionsnew'">Inventions New and Interesting</xsl:when>
            <xsl:when test="$codeGenreAll='is'">Insight</xsl:when>
            <xsl:when test="$codeGenreAll='itp'">Inside The Paper</xsl:when>
            <xsl:when test="$codeGenreAll='ix'">Index</xsl:when>
            <xsl:when test="$codeGenreAll='iye'">In Your Element</xsl:when>
            <xsl:when test="$codeGenreAll='japau'">Japanese Author</xsl:when>
            <xsl:when test="$codeGenreAll='japlnf'">Local News Feature</xsl:when>
            <xsl:when test="$codeGenreAll='japmuse'">muse@nature.com</xsl:when>
            <xsl:when test="$codeGenreAll='japnf'">Japan News Feature</xsl:when>
            <xsl:when test="$codeGenreAll='japnw'">Nature News</xsl:when>
            <xsl:when test="$codeGenreAll='japsi'">Scientist Interview</xsl:when>
            <xsl:when test="$codeGenreAll='japsn'">Science News</xsl:when>
            <xsl:when test="$codeGenreAll='jcb'">Journal Club</xsl:when>
            <xsl:when test="$codeGenreAll='jr'">Journal Review</xsl:when>
            <xsl:when test="$codeGenreAll='labmeth'">Laboratory Methods</xsl:when>
            <xsl:when test="$codeGenreAll='le'">Letter</xsl:when>
            <xsl:when test="$codeGenreAll='learningtousewings'">Learning to Use Our Wings</xsl:when>
            <xsl:when test="$codeGenreAll='led'">Letter to the Editor</xsl:when>
            <xsl:when test="$codeGenreAll='legalhighlights'">Legal High-Lights</xsl:when>
            <xsl:when test="$codeGenreAll='legalnotes'">Legal Notes</xsl:when>
            <xsl:when test="$codeGenreAll='lfln'">Lifeline</xsl:when>
            <xsl:when test="$codeGenreAll='lgu'">Legal Update</xsl:when>
            <xsl:when test="$codeGenreAll='li'">Inside Lab Invest</xsl:when>
            <xsl:when test="$codeGenreAll='lm'">Landmark</xsl:when>
            <xsl:when test="$codeGenreAll='lstwrd'">Last Word</xsl:when>
            <xsl:when test="$codeGenreAll='lt'">Letters to Nature</xsl:when>
            <xsl:when test="$codeGenreAll='ma'">Mergers and Acquisitions</xsl:when>
            <xsl:when test="$codeGenreAll='mabs'">Meeting Abstracts</xsl:when>
            <xsl:when test="$codeGenreAll='mark'">Markers</xsl:when>
            <xsl:when test="$codeGenreAll='marw'">Market Watch</xsl:when>
            <xsl:when test="$codeGenreAll='mcal'">Meeting Calendar</xsl:when>
            <xsl:when test="$codeGenreAll='mechengnrngnotes'">Mechanical Engineering Notes</xsl:when>
            <xsl:when test="$codeGenreAll='medgncal'">Medical Genetics Calendar</xsl:when>
            <xsl:when test="$codeGenreAll='medgndp'">Medical Genetics Diplomates</xsl:when>
            <xsl:when test="$codeGenreAll='medicalscience'">Medical Science</xsl:when>
            <xsl:when test="$codeGenreAll='medrv'">Medal Review</xsl:when>
            <xsl:when test="$codeGenreAll='meetteam'">Meet the team</xsl:when>
            <xsl:when test="$codeGenreAll='mem'">In Memorium</xsl:when>
            <xsl:when test="$codeGenreAll='memrv'">Member Review</xsl:when>
            <xsl:when test="$codeGenreAll='metalsinindustry'">Metals in Industry</xsl:when>
            <xsl:when test="$codeGenreAll='methods'">Methods</xsl:when>
            <xsl:when test="$codeGenreAll='methodstowatch'">Method to Watch</xsl:when>
            <xsl:when test="$codeGenreAll='mgt'">Management</xsl:when>
            <xsl:when test="$codeGenreAll='mib'">Methods in Brief</xsl:when>
            <xsl:when test="$codeGenreAll='militaryscience'">Military Science</xsl:when>
            <xsl:when test="$codeGenreAll='mindinpictures'">Mind in Pictures</xsl:when>
            <xsl:when test="$codeGenreAll='minirv'">Mini Review</xsl:when>
            <xsl:when test="$codeGenreAll='misc'">miscellany</xsl:when>
            <xsl:when test="$codeGenreAll='miscellaneousnotes'">Miscellaneous Notes</xsl:when>
            <xsl:when test="$codeGenreAll='miscellany'">Miscellany</xsl:when>
            <xsl:when test="$codeGenreAll='mktana'">Market Analysis</xsl:when>
            <xsl:when test="$codeGenreAll='modofthemonth'">Model of the Month</xsl:when>
            <xsl:when test="$codeGenreAll='motordrvncmmrclvhcl'">The Motor-Driven Commercial Vehicle</xsl:when>
            <xsl:when test="$codeGenreAll='mp'">Marketplace</xsl:when>
            <xsl:when test="$codeGenreAll='mr'">Meeting Report</xsl:when>
            <xsl:when test="$codeGenreAll='mt'">Meetings</xsl:when>
            <xsl:when test="$codeGenreAll='mtp'">Making the Paper</xsl:when>
            <xsl:when test="$codeGenreAll='multr'">Multimedia Review</xsl:when>
            <xsl:when test="$codeGenreAll='na'">News and Analysis</xsl:when>
            <xsl:when test="$codeGenreAll='nationaldefense'">National Defense</xsl:when>
            <xsl:when test="$codeGenreAll='naturalhistory'">Natural History</xsl:when>
            <xsl:when test="$codeGenreAll='natureindex'">Nature Index</xsl:when>
            <xsl:when test="$codeGenreAll='naturejobs'">Naturejobs</xsl:when>
            <xsl:when test="$codeGenreAll='natview'">Natureview</xsl:when>
            <xsl:when test="$codeGenreAll='navigation'">Navigation</xsl:when>
            <xsl:when test="$codeGenreAll='nb'">News in Brief</xsl:when>
            <xsl:when test="$codeGenreAll='nbr'">News in Brief</xsl:when>
            <xsl:when test="$codeGenreAll='nbri'">News in Brief</xsl:when>
            <xsl:when test="$codeGenreAll='ne'">News</xsl:when>
            <xsl:when test="$codeGenreAll='nemr'">New EMBO Members Review</xsl:when>
            <xsl:when test="$codeGenreAll='neuro'">Neurotechniques</xsl:when>
            <xsl:when test="$codeGenreAll='newboatandequip'">New Boat and Boat Equipment</xsl:when>
            <xsl:when test="$codeGenreAll='newgenetest'">New at GeneTests</xsl:when>
            <xsl:when test="$codeGenreAll='newprodcts'">New Products</xsl:when>
            <xsl:when test="$codeGenreAll='newprodctsandprocesses'">New Products and Processes</xsl:when>
            <xsl:when test="$codeGenreAll='nf'">News Feature</xsl:when>
            <xsl:when test="$codeGenreAll='ngal'">Nature Gallery</xsl:when>
            <xsl:when test="$codeGenreAll='nj'">New Journals</xsl:when>
            <xsl:when test="$codeGenreAll='nm'">New on the Market</xsl:when>
            <xsl:when test="$codeGenreAll='nmr'">New Member Review</xsl:when>
            <xsl:when test="$codeGenreAll='nobellr'">Nobel Lecture</xsl:when>
            <xsl:when test="$codeGenreAll='notesandqueries'">Notes and Queries</xsl:when>
            <xsl:when test="$codeGenreAll='noveldevicesforshop'">Novel Devices for the Shop and the Home</xsl:when>
            <xsl:when test="$codeGenreAll='np'">News Profile</xsl:when>
            <xsl:when test="$codeGenreAll='npedrv'">Nanopediatrics Review Article</xsl:when>
            <xsl:when test="$codeGenreAll='ntbm'">Not To Be Missed</xsl:when>
            <xsl:when test="$codeGenreAll='nv'">News and Views</xsl:when>
            <xsl:when test="$codeGenreAll='nvb'">News and Views in Brief</xsl:when>
            <xsl:when test="$codeGenreAll='nvf'">News and Views Feature</xsl:when>
            <xsl:when test="$codeGenreAll='nvfv'">News and Views FV</xsl:when>
            <xsl:when test="$codeGenreAll='nvqa'">News and Views Q&amp;A</xsl:when>
            <xsl:when test="$codeGenreAll='nw'">News</xsl:when>
            <xsl:when test="$codeGenreAll='oa'">Original Article</xsl:when>
            <xsl:when test="$codeGenreAll='ob'">Obituary</xsl:when>
            <xsl:when test="$codeGenreAll='ofgeneralintrst'">Of General Interest</xsl:when>
            <xsl:when test="$codeGenreAll='ofintrsttomtrsts'">Of Interest to Motorists</xsl:when>
            <xsl:when test="$codeGenreAll='onbr'">Online News in Brief</xsl:when>
            <xsl:when test="$codeGenreAll='onyrft'">On Your Feet</xsl:when>
            <xsl:when test="$codeGenreAll='op'">Opinion</xsl:when>
            <xsl:when test="$codeGenreAll='opcom'">Opinion and Comment</xsl:when>
            <xsl:when test="$codeGenreAll='osa'">Original Research Article</xsl:when>
            <xsl:when test="$codeGenreAll='ourbookcorner'">Our Book Corner</xsl:when>
            <xsl:when test="$codeGenreAll='ourpointofvieweds'">Our Point of View - Editorials</xsl:when>
            <xsl:when test="$codeGenreAll='ourreaderspointofview'">Our Readers' Point of View</xsl:when>
            <xsl:when test="$codeGenreAll='out'">Outlook</xsl:when>
            <xsl:when test="$codeGenreAll='outlab'">Out of the lab</xsl:when>
            <xsl:when test="$codeGenreAll='ov'">Overview</xsl:when>
            <xsl:when test="$codeGenreAll='pa'">Poster Abstract</xsl:when>
            <xsl:when test="$codeGenreAll='patentandtmnotes'">Patent and Trade-mark Notes</xsl:when>
            <xsl:when test="$codeGenreAll='patentnotes'">Patent Notes</xsl:when>
            <xsl:when test="$codeGenreAll='patentsrcntlyissd'">Patents Recently Issued</xsl:when>
            <xsl:when test="$codeGenreAll='pe'">Perspectives</xsl:when>
            <xsl:when test="$codeGenreAll='pedr'">Pediatric Research</xsl:when>
            <xsl:when test="$codeGenreAll='pefv'">Perspective FV</xsl:when>
            <xsl:when test="$codeGenreAll='personaltsinindstry'">Personalities in Industry</xsl:when>
            <xsl:when test="$codeGenreAll='personaltsinscnce'">Personalities in Science</xsl:when>
            <xsl:when test="$codeGenreAll='petroleum'">Petroleum</xsl:when>
            <xsl:when test="$codeGenreAll='phot'">Photonics at NPG</xsl:when>
            <xsl:when test="$codeGenreAll='photography'">Photography</xsl:when>
            <xsl:when test="$codeGenreAll='pi'">Picture Story</xsl:when>
            <xsl:when test="$codeGenreAll='pl'">Plus</xsl:when>
            <xsl:when test="$codeGenreAll='plastics'">Plastics</xsl:when>
            <xsl:when test="$codeGenreAll='pn'">Product News</xsl:when>
            <xsl:when test="$codeGenreAll='pod'">Podcast</xsl:when>
            <xsl:when test="$codeGenreAll='polw'">Policy Watch</xsl:when>
            <xsl:when test="$codeGenreAll='ppi'">Public-Private Interface</xsl:when>
            <xsl:when test="$codeGenreAll='ppro'">Product Profile</xsl:when>
            <xsl:when test="$codeGenreAll='ppt'">Practice Point</xsl:when>
            <xsl:when test="$codeGenreAll='pr'">Progress</xsl:when>
            <xsl:when test="$codeGenreAll='prac'">Practice</xsl:when>
            <xsl:when test="$codeGenreAll='previewsofindstrlhrzn'">Previews of the Industrial Horizon</xsl:when>
            <xsl:when test="$codeGenreAll='prf'">Product Focus</xsl:when>
            <xsl:when test="$codeGenreAll='prhl'">Product Highlights</xsl:when>
            <xsl:when test="$codeGenreAll='prim'">Primer</xsl:when>
            <xsl:when test="$codeGenreAll='pro'">Profile</xsl:when>
            <xsl:when test="$codeGenreAll='proceeding'">Conference Proceeding</xsl:when>
            <xsl:when test="$codeGenreAll='prog'">Progress Article</xsl:when>
            <xsl:when test="$codeGenreAll='prorv'">Protocol Review</xsl:when>
            <xsl:when test="$codeGenreAll='prot'">Protocol</xsl:when>
            <xsl:when test="$codeGenreAll='protupdate'">Protocol Update</xsl:when>
            <xsl:when test="$codeGenreAll='prv'">Product Review</xsl:when>
            <xsl:when test="$codeGenreAll='psychicresearch'">Psychic Research</xsl:when>
            <xsl:when test="$codeGenreAll='puzzle'">Puzzle page</xsl:when>
            <xsl:when test="$codeGenreAll='pw'">Patent Watch</xsl:when>
            <xsl:when test="$codeGenreAll='qa'">Q&amp;A</xsl:when>
            <xsl:when test="$codeGenreAll='quotes'">Quotes</xsl:when>
            <xsl:when test="$codeGenreAll='ra'">Research Article</xsl:when>
            <xsl:when test="$codeGenreAll='radionotes'">Radio Notes</xsl:when>
            <xsl:when test="$codeGenreAll='railroadtransportation'">Railroad Transportation</xsl:when>
            <xsl:when test="$codeGenreAll='rcom'">Research Commentary</xsl:when>
            <xsl:when test="$codeGenreAll='rd'">Regional Development</xsl:when>
            <xsl:when test="$codeGenreAll='rdpub'">Rapid Publication</xsl:when>
            <xsl:when test="$codeGenreAll='re'">Research</xsl:when>
            <xsl:when test="$codeGenreAll='recentlyptntdinvntns'">Recently Patented Inventions</xsl:when>
            <xsl:when test="$codeGenreAll='refutation'">Refutation</xsl:when>
            <xsl:when test="$codeGenreAll='rep'">Report</xsl:when>
            <xsl:when test="$codeGenreAll='reply'">Reply</xsl:when>
            <xsl:when test="$codeGenreAll='ret'">Retraction</xsl:when>
            <xsl:when test="$codeGenreAll='reviewers'">Reviewers</xsl:when>
            <xsl:when test="$codeGenreAll='rhighlts'">Research Highlight</xsl:when>
            <xsl:when test="$codeGenreAll='rl'">Research Library</xsl:when>
            <xsl:when test="$codeGenreAll='rlet'">Research Letters</xsl:when>
            <xsl:when test="$codeGenreAll='rn'">Research News</xsl:when>
            <xsl:when test="$codeGenreAll='rnote'">Research Note</xsl:when>
            <xsl:when test="$codeGenreAll='rr'">Research Review</xsl:when>
            <xsl:when test="$codeGenreAll='rs'">Resource</xsl:when>
            <xsl:when test="$codeGenreAll='ru'">Round-up</xsl:when>
            <xsl:when test="$codeGenreAll='RV'">Review</xsl:when>
            <xsl:when test="$codeGenreAll='rv'">Review</xsl:when>
            <xsl:when test="$codeGenreAll='rvfv'">Review FV</xsl:when>
            <xsl:when test="$codeGenreAll='rw'">Regulation Watch</xsl:when>
            <xsl:when test="$codeGenreAll='safety'">Safety</xsl:when>
            <xsl:when test="$codeGenreAll='sb'">Spring Books</xsl:when>
            <xsl:when test="$codeGenreAll='sc'">Scientific Correspondence</xsl:when>
            <xsl:when test="$codeGenreAll='sciamdigest'">Scientific American Digest</xsl:when>
            <xsl:when test="$codeGenreAll='sciamindstrldigest'">Scientific American Industrial Digest</xsl:when>
            <xsl:when test="$codeGenreAll='scienceagenda'">Science Agenda</xsl:when>
            <xsl:when test="$codeGenreAll='scienceandmoney'">Science and Money</xsl:when>
            <xsl:when test="$codeGenreAll='scienceinindstry'">Science in Industry</xsl:when>
            <xsl:when test="$codeGenreAll='sciencenotes'">Science Notes</xsl:when>
            <xsl:when test="$codeGenreAll='scienceofhealth'">The Science of Health</xsl:when>
            <xsl:when test="$codeGenreAll='scientificresearch'">Scientific Research</xsl:when>
            <xsl:when test="$codeGenreAll='scinw'">Science - in the News</xsl:when>
            <xsl:when test="$codeGenreAll='servicechemist'">Service of the Chemist</xsl:when>
            <xsl:when test="$codeGenreAll='sevendays'">Seven Days</xsl:when>
            <xsl:when test="$codeGenreAll='sf'">Special Feature</xsl:when>
            <xsl:when test="$codeGenreAll='si'">Social Issues</xsl:when>
            <xsl:when test="$codeGenreAll='sim'">Science and Image</xsl:when>
            <xsl:when test="$codeGenreAll='snaps'">Snapshot</xsl:when>
            <xsl:when test="$codeGenreAll='sp'">Strategic Planning</xsl:when>
            <xsl:when test="$codeGenreAll='spar'">Special Article</xsl:when>
            <xsl:when test="$codeGenreAll='spfwd'">Sponsor's Foreword</xsl:when>
            <xsl:when test="$codeGenreAll='spot'">Spotlight</xsl:when>
            <xsl:when test="$codeGenreAll='sprep'">Special Report</xsl:when>
            <xsl:when test="$codeGenreAll='SR'">Scientific Reports</xsl:when>
            <xsl:when test="$codeGenreAll='sr'">Scientific Reports</xsl:when>
            <xsl:when test="$codeGenreAll='SS'">Science and Society</xsl:when>
            <xsl:when test="$codeGenreAll='ss'">Science and Society</xsl:when>
            <xsl:when test="$codeGenreAll='straysfromether'">Strays From the Ether</xsl:when>
            <xsl:when test="$codeGenreAll='strev'">Structured Review</xsl:when>
            <xsl:when test="$codeGenreAll='strle'">Star Letter</xsl:when>
            <xsl:when test="$codeGenreAll='stw'">Structure Watch</xsl:when>
            <xsl:when test="$codeGenreAll='su'">Summaries</xsl:when>
            <xsl:when test="$codeGenreAll='summerbooks'">Summer Books</xsl:when>
            <xsl:when test="$codeGenreAll='swr'">Software Report</xsl:when>
            <xsl:when test="$codeGenreAll='talk'">Talking point</xsl:when>
            <xsl:when test="$codeGenreAll='tech'">Technology</xsl:when>
            <xsl:when test="$codeGenreAll='technofiles'">TechnoFiles</xsl:when>
            <xsl:when test="$codeGenreAll='telescoptics'">Telescoptics</xsl:when>
            <xsl:when test="$codeGenreAll='tenv'">The Environment</xsl:when>
            <xsl:when test="$codeGenreAll='tf'">Technology Feature</xsl:when>
            <xsl:when test="$codeGenreAll='th'">Technical Highlight</xsl:when>
            <xsl:when test="$codeGenreAll='thebackyarastronomer'">The Back Yard Astronomer</xsl:when>
            <xsl:when test="$codeGenreAll='theheavens'">The Heavens</xsl:when>
            <xsl:when test="$codeGenreAll='thes'">Thesis</xsl:when>
            <xsl:when test="$codeGenreAll='theservicechemist'">The Service of the Chemist</xsl:when>
            <xsl:when test="$codeGenreAll='thismo'">This Month</xsl:when>
            <xsl:when test="$codeGenreAll='thread'">Thread</xsl:when>
            <xsl:when test="$codeGenreAll='thtr'">Theatre Review</xsl:when>
            <xsl:when test="$codeGenreAll='tib'">Tools in Brief</xsl:when>
            <xsl:when test="$codeGenreAll='timeln'">Timeline</xsl:when>
            <xsl:when test="$codeGenreAll='tlbx'">Toolbox</xsl:when>
            <xsl:when test="$codeGenreAll='tmat'">Training Matters</xsl:when>
            <xsl:when test="$codeGenreAll='tmech'">Targets and Mechanisms</xsl:when>
            <xsl:when test="$codeGenreAll='tn'">Trade News</xsl:when>
            <xsl:when test="$codeGenreAll='tools'">Tools</xsl:when>
            <xsl:when test="$codeGenreAll='tr'">Technical Report</xsl:when>
            <xsl:when test="$codeGenreAll='trialw'">Trial Watch</xsl:when>
            <xsl:when test="$codeGenreAll='tt'">Techniques and Technology</xsl:when>
            <xsl:when test="$codeGenreAll='turnp'">Turning Points</xsl:when>
            <xsl:when test="$codeGenreAll='tut'">Tutorial</xsl:when>
            <xsl:when test="$codeGenreAll='tvr'">Television Review</xsl:when>
            <xsl:when test="$codeGenreAll='upfrnt'">Up front</xsl:when>
            <xsl:when test="$codeGenreAll='vp'">Viewpoint</xsl:when>
            <xsl:when test="$codeGenreAll='vpt'">View Point</xsl:when>
            <xsl:when test="$codeGenreAll='vr'">Video Review</xsl:when>
            <xsl:when test="$codeGenreAll='war'">War</xsl:when>
            <xsl:when test="$codeGenreAll='wdiag'">What's Your Diagnosis</xsl:when>
            <xsl:when test="$codeGenreAll='whatsnewphtgrphceqpmnt'">What's New in Photographic Equipment</xsl:when>
            <xsl:when test="$codeGenreAll='wildlifenotes'">Wild Life Notes</xsl:when>
            <xsl:when test="$codeGenreAll='worldwideradio'">World-Wide Radio</xsl:when>
            <xsl:when test="$codeGenreAll='wsrep'">Workshop Report</xsl:when>
            <xsl:when test="$codeGenreAll='yearinreview'">Year in Review</xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    <!-- ELSEVIER VERBALISATION CODE SOURCE -->
    <xsl:variable name="codeGenreElsevier">
        <xsl:choose>
            <xsl:when test="$codeGenreAll='abs'">Abstract</xsl:when>
            <xsl:when test="$codeGenreAll='add'">Addendum</xsl:when>
            <xsl:when test="$codeGenreAll='adv'">Advertisement</xsl:when>
            <xsl:when test="$codeGenreAll='ann'">Announcement</xsl:when>
            <xsl:when test="$codeGenreAll='brv'">Book review</xsl:when>
            <xsl:when test="$codeGenreAll='cal'">Calendar</xsl:when>
            <xsl:when test="$codeGenreAll='cnf'">Conference</xsl:when>
            <xsl:when test="$codeGenreAll='chp'">Other</xsl:when>
            <xsl:when test="$codeGenreAll='con'">Contents list</xsl:when>
            <xsl:when test="$codeGenreAll='cor'">Correspondence</xsl:when>
            <xsl:when test="$codeGenreAll='dis'">Discussion</xsl:when>
            <xsl:when test="$codeGenreAll='dup'">Duplicate</xsl:when>
            <xsl:when test="$codeGenreAll='edb'">Editorial board</xsl:when>
            <xsl:when test="$codeGenreAll='edi'">Editorial</xsl:when>
            <xsl:when test="$codeGenreAll='err'">Erratum</xsl:when>
            <xsl:when test="$codeGenreAll='exm'">Examination</xsl:when>
            <xsl:when test="$codeGenreAll='fla'">Full-length article</xsl:when>
            <xsl:when test="$codeGenreAll='ind'">Index</xsl:when>
            <xsl:when test="$codeGenreAll='lit'">Literature alert</xsl:when>
            <xsl:when test="$codeGenreAll='mis'">Miscellaneous</xsl:when>
            <xsl:when test="$codeGenreAll='nws'">News</xsl:when>
            <xsl:when test="$codeGenreAll='ocn'">Other contents</xsl:when>
            <xsl:when test="$codeGenreAll='pnt'">Patent report</xsl:when>
            <xsl:when test="$codeGenreAll='prp'">Personal report</xsl:when>
            <xsl:when test="$codeGenreAll='prv'">Product review</xsl:when>
            <xsl:when test="$codeGenreAll='pub'">Publisher’s note</xsl:when>
            <xsl:when test="$codeGenreAll='rem'">Removal</xsl:when>
            <xsl:when test="$codeGenreAll='req'">Request for assistance</xsl:when>
            <xsl:when test="$codeGenreAll='ret'">Retraction</xsl:when>
            <xsl:when test="$codeGenreAll='rev'">Review article</xsl:when>
            <xsl:when test="$codeGenreAll='sco'">Short communication</xsl:when>
            <xsl:when test="$codeGenreAll='ssu'">Short survey</xsl:when>
            <xsl:when test="$codeGenreAll='other'">other</xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    <!-- ARK -->
    <xsl:variable name="codeGenreArk">
        <xsl:choose>
            <xsl:when test="$codeGenreIstex='research-article'">https://content-type.data.istex.fr/ark:/67375/XTP-1JC4F85T-7</xsl:when>
            <xsl:when test="$codeGenreIstex='article'">https://content-type.data.istex.fr/ark:/67375/XTP-6N5SZHKN-D</xsl:when>
            <xsl:when test="$codeGenreIstex='other'">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:when>
            <xsl:when test="$codeGenreIstex='book-reviews'">https://content-type.data.istex.fr/ark:/67375/XTP-PBH5VBM9-4</xsl:when>
            <xsl:when test="$codeGenreIstex='abstract'">https://content-type.data.istex.fr/ark:/67375/XTP-HPN7T1Q2-R</xsl:when>
            <xsl:when test="$codeGenreIstex='review-article'">https://content-type.data.istex.fr/ark:/67375/XTP-L5L7X3NF-P</xsl:when>
            <xsl:when test="$codeGenreIstex='brief-communication'">https://content-type.data.istex.fr/ark:/67375/XTP-S9SX2MFS-0</xsl:when>
            <xsl:when test="$codeGenreIstex='editorial'">https://content-type.data.istex.fr/ark:/67375/XTP-STW636XV-K</xsl:when>
            <xsl:when test="$codeGenreIstex='case-report'">https://content-type.data.istex.fr/ark:/67375/XTP-29919SZJ-6</xsl:when>
            <xsl:when test="$codeGenreIstex='conference'">https://content-type.data.istex.fr/ark:/67375/XTP-BFHXPBJJ-3</xsl:when>
            <xsl:when test="$codeGenreIstex='chapter'">https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6</xsl:when>
            <xsl:when test="$codeGenreIstex='book'">https://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T</xsl:when>
        </xsl:choose>
    </xsl:variable>
</xsl:stylesheet>
