<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="tei">
    <xsl:output encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>
    <xsl:param name="idistex"/>
    <xsl:param name="arkistex"/>
    <xsl:param name="datecreation"/>
    <xsl:param name="xslversion"/>
    <xsl:param name="grobidFulltextEnrichmentPath"/>
    <!-- Feuille de style ISTEX - JsonXML converted to MODS 3.6" 
        =======================================================================================
        Auteur:  Stéphanie GREGORIO - INIST/CNRS
        =======================================================================================
        Version 0.1 du 29/04/2025
    -->
    
    <!-- ********** VARIABLES **********-->
    <xsl:variable name ="grobid" select="document($grobidFulltextEnrichmentPath)"/>
    <!-- code genre niveau article 100% journal-article-->
    <xsl:variable name="genre">
        <xsl:value-of select="//doc/genre"/>
    </xsl:variable>
    <xsl:variable name="codeGenre">
        <xsl:choose>
            <xsl:when test="$genre='journal-article'">article</xsl:when>
            <xsl:when test="$genre='journal-issue'">article</xsl:when>
            <xsl:when test="$genre='journal'">article</xsl:when>
            <xsl:otherwise>other</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="codeGenreArk">
        <xsl:choose>
            <xsl:when test="$codeGenre='research-article'">https://content-type.data.istex.fr/ark:/67375/XTP-1JC4F85T-7</xsl:when>
            <xsl:when test="$codeGenre='article'">https://content-type.data.istex.fr/ark:/67375/XTP-6N5SZHKN-D</xsl:when>
            <xsl:when test="$codeGenre='book-reviews'">https://content-type.data.istex.fr/ark:/67375/XTP-PBH5VBM9-4</xsl:when>
            <xsl:when test="$codeGenre='review-article'">https://content-type.data.istex.fr/ark:/67375/XTP-L5L7X3NF-P</xsl:when>
            <xsl:when test="$codeGenre='abstract'">https://content-type.data.istex.fr/ark:/67375/XTP-HPN7T1Q2-R</xsl:when>
            <xsl:when test="$codeGenre='editorial'">https://content-type.data.istex.fr/ark:/67375/XTP-STW636XV-K</xsl:when>
            <xsl:when test="$codeGenre='brief-communication'">https://content-type.data.istex.fr/ark:/67375/XTP-S9SX2MFS-0</xsl:when>
            <xsl:when test="$codeGenre='case-report'">https://content-type.data.istex.fr/ark:/67375/XTP-29919SZJ-6</xsl:when>
            <xsl:when test="$codeGenre='conference'">https://content-type.data.istex.fr/ark:/67375/XTP-BFHXPBJJ-3</xsl:when>
            <xsl:when test="$codeGenre='other'">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="codeLangSubstring">
        <!-- la langue est contenue dans <oa_locations><url> dans un fragment du lien hypertexte
        "?lang=en"
    parfois dans oa_location position 1, 2, ou...
    je parcours donc toute l'xml afin de la cibler-->
        <xsl:choose>
            <xsl:when test="contains(.,'lang=')">
                <xsl:value-of select="substring-after(.,'lang=')"/>
            </xsl:when>
            <xsl:when test="contains(.,'lng=')">
                <xsl:value-of select="substring-after(.,'lng=')"/>
            </xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="codeLangString">
        <!-- Renvoie la sous-chaîne de la position de départ à la longueur spécifiée.
        L'index du premier caractère est 1. 
        Si la longueur est omise, la sous-chaîne est renvoyée de la position de départ à la fin.
 -->
        <xsl:value-of select="substring($codeLangSubstring,1,2)"/>
    </xsl:variable>
    <xsl:variable name="codeLang1">
        <xsl:choose>
            <xsl:when test="/doc/glutton/language">
                <xsl:value-of select="/doc/glutton/language"/>
            </xsl:when>
            <xsl:when test="$codeLangString !=''">
                <xsl:value-of select="$codeLangString"/>
            </xsl:when>
            <!--<xsl:when test="$grobid//tei:TEI/tei:teiHeader/@xml:lang !=''">
                <xsl:value-of select="$grobid//tei:TEI/tei:teiHeader/@xml:lang"/>
            </xsl:when>-->
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="codeLang">
        <xsl:choose>
            <xsl:when test="normalize-space($codeLang1)='aa'">aar</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ab'">abk</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='af'">afr</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ak'">aka</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sq'">alb</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='am'">amh</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ar'">ara</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='an'">arg</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='hy'">hye</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='hy'">arm</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='as'">asm</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='av'">ava</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ae'">ave</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ay'">aym</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='az'">aze</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ba'">bak</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='bm'">bam</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='eu'">eus</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='eu'">baq</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='be'">bel</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='bn'">ben</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='bh'">bih</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='bi'">bis</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='bo'">bod</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='bs'">bos</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='br'">bre</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='bg'">bul</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='my'">bur</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='my'">mya</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ca'">cat</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ch'">cha</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ce'">che</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='zh'">chi</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='cu'">chu</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='cv'">chv</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='kw'">cor</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='co'">cos</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='cr'">cre</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='cy'">cym</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='cs'">cze</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='da'">dan</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='dv'">div</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='nl'">dut</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='nl'">nld</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='dz'">dzo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='en'">eng</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='eo'">epo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='et'">est</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ee'">ewe</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='fo'">fao</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='fj'">fij</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='fi'">fin</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='fr'">fre</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='fy'">fry</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ff'">ful</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ka'">kat</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='de'">ger</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='gd'">gla</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ga'">gle</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='gl'">glg</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='gv'">glv</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='el'">gre</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='gn'">grn</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='gu'">guj</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ht'">hat</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ha'">hau</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='he'">heb</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='hz'">her</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='hi'">hin</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ho'">hmo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='hr'">hrv</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='hu'">hun</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ig'">ibo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='is'">isl</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='io'">ido</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ii'">iii</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='iu'">iku</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ie'">ile</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ia'">ina</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='id'">ind</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ik'">ipk</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='it'">ita</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='jv'">jav</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ja'">jpn</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='kl'">kal</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='kn'">kan</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ks'">kas</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='kr'">kau</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='kk'">kaz</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='km'">khm</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ki'">kik</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='rw'">kin</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ky'">kir</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='kv'">kom</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='kg'">kon</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ko'">kor</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='kj'">kua</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ku'">kur</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='lo'">lao</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='la'">lat</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='lv'">lav</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='li'">lim</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ln'">lin</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='lt'">lit</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='lb'">ltz</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='lu'">lub</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='lg'">lug</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='mk'">mac</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='mk'">mkd</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='mh'">mah</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ml'">mal</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='mi'">mri</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='mi'">mao</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='mr'">mar</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ms'">may</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ms'">msa</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='mg'">mlg</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='mt'">mlt</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='mn'">mon</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='na'">nau</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='nv'">nav</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='nr'">nbl</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='nd'">nde</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ng'">ndo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ne'">nep</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='nn'">nno</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='nb'">nob</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='no'">nor</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ny'">nya</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='oc'">oci</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='oj'">oji</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='or'">ori</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='om'">orm</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='os'">oss</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='pa'">pan</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='fa'">fas</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='fa'">per</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='pi'">pli</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='pl'">pol</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='pt'">por</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ps'">pus</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='qu'">que</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='rm'">roh</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ro'">rum</xsl:when>                      
            <xsl:when test="normalize-space($codeLang1)='rn'">run</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ru'">rus</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sg'">sag</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sa'">san</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sr'">scc</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='si'">sin</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sk'">slo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sk'">slk</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sl'">slv</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='se'">sme</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sm'">smo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sn'">sna</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sd'">snd</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='so'">som</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='st'">sot</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='es'">spa</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sq'">sqi</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sc'">srd</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sr'">srp</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ss'">ssw</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='su'">sun</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sw'">swa</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='sv'">swe</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ty'">tah</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ta'">tam</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='tt'">tat</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='te'">tel</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='tg'">tgk</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='tl'">tgl</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='th'">tha</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='bo'">tib</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ti'">tir</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='to'">ton</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='tn'">tsn</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ts'">tso</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='tk'">tuk</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='tr'">tur</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='tw'">twi</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ug'">uig</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='uk'">ukr</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ur'">urd</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='uz'">uzb</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ve'">ven</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='vi'">vie</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='vo'">vol</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='cy'">wel</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='wa'">wln</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='wo'">wol</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='xh'">xho</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='yi'">yid</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='yo'">yor</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='za'">zha</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='zh'">zho</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='zu'">zul</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='AA'">aar</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='AB'">abk</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='AF'">afr</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='AK'">aka</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SQ'">alb</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='AM'">amh</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='AR'">ara</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='AN'">arg</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='HY'">hye</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='HY'">arm</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='AS'">asm</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='AV'">ava</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='AE'">ave</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='AY'">aym</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='AZ'">aze</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='BA'">bak</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='BM'">bam</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='EU'">eus</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='EU'">baq</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='BE'">bel</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='BN'">ben</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='BH'">bih</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='BI'">bis</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='BO'">bod</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='BS'">bos</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='BR'">bre</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='BG'">bul</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='MY'">bur</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='MY'">mya</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='CA'">cat</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='CH'">cha</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='CE'">che</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ZH'">chi</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='CU'">chu</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='CV'">chv</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KW'">cor</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='CO'">cos</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='CR'">cre</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='CY'">cym</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='CS'">cze</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='DA'">dan</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='DV'">div</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='NL'">dut</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='NL'">nld</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='DZ'">dzo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='EN'">eng</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='EO'">epo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ET'">est</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='EE'">ewe</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='FO'">fao</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='FJ'">fij</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='FI'">fin</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='FR'">fre</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='FY'">fry</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='FF'">ful</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KA'">kat</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='DE'">ger</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='GD'">gla</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='GA'">gle</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='GL'">glg</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='GV'">glv</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='EL'">gre</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='GN'">grn</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='GU'">guj</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='HT'">hat</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='HA'">hau</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='HE'">heb</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='HZ'">her</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='HI'">hin</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='HO'">hmo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='HR'">hrv</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='HU'">hun</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='IG'">ibo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='IS'">isl</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='IO'">ido</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='II'">iii</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='IU'">iku</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='IE'">ile</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='IA'">ina</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ID'">ind</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='IK'">ipk</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='IT'">ita</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='JV'">jav</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='JA'">jpn</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KL'">kal</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KN'">kan</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KS'">kas</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KR'">kau</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KK'">kaz</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KM'">khm</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KI'">kik</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='RW'">kin</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KY'">kir</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KV'">kom</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KG'">kon</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KO'">kor</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KJ'">kua</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='KU'">kur</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='LO'">lao</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='LA'">lat</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='LV'">lav</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='LI'">lim</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='LN'">lin</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='LT'">lit</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='LB'">ltz</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='LU'">lub</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='LG'">lug</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='MK'">mac</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='MK'">mkd</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='MH'">mah</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ML'">mal</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='MI'">mri</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='MI'">mao</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='MR'">mar</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='MS'">may</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='MS'">msa</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='MG'">mlg</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='MT'">mlt</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='MN'">mon</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='NA'">nau</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='NV'">nav</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='NR'">nbl</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ND'">nde</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='NG'">ndo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='NE'">nep</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='NN'">nno</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='NB'">nob</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='NO'">nor</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='NY'">nya</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='OC'">oci</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='OJ'">oji</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='OR'">ori</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='OM'">orm</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='OS'">oss</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='PA'">pan</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='FA'">fas</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='FA'">per</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='PI'">pli</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='PL'">pol</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='PT'">por</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='PS'">pus</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='QU'">que</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='RM'">roh</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='RO'">rum</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='RN'">run</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='RU'">rus</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SG'">sag</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SA'">san</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SR'">scc</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SI'">sin</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SK'">slo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SK'">slk</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SL'">slv</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SE'">sme</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SM'">smo</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SN'">sna</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SD'">snd</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SO'">som</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ST'">sot</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ES'">spa</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SQ'">sqi</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SC'">srd</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SR'">srp</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SS'">ssw</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SU'">sun</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SW'">swa</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='SV'">swe</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TY'">tah</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TA'">tam</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TT'">tat</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TE'">tel</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TG'">tgk</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TL'">tgl</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TH'">tha</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='BO'">tib</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TI'">tir</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TO'">ton</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TN'">tsn</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TS'">tso</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TK'">tuk</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TR'">tur</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='TW'">twi</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='UG'">uig</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='UK'">ukr</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='UR'">urd</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='UZ'">uzb</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='VE'">ven</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='VI'">vie</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='VO'">vol</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='CY'">wel</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='WA'">wln</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='WO'">wol</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='XH'">xho</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='YI'">yid</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='YO'">yor</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ZA'">zha</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ZH'">zho</xsl:when>
            <xsl:when test="normalize-space($codeLang1)='ZU'">zul</xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    <!-- ******************* TRAITEMENT PRINCIPAL ******************************-->
    <xsl:template match="text()">
        <xsl:value-of select="normalize-space(translate(., '&#9;&#13;&#10;&#133;&#8232;&#8233;&#8234;&#8235;&#8236;&#8237;', ''))"/>
    </xsl:template>
     
    <xsl:template match="/">
        <mods xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="version">
                <xsl:text>3.6</xsl:text>
            </xsl:attribute>
            <!-- titre de l'article si vide ou [NO TITLE AVAILABLE] prendre le contenu dans les fichiers grobid.tei-->
           <xsl:choose>
               <xsl:when test="//doc/title ='[NO TITLE AVAILABLE]'">
                   <xsl:apply-templates select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" mode="article"/>
               </xsl:when>
               <xsl:when test="//doc/title !=''">
                   <xsl:apply-templates select="//doc/title" mode="article"/>
               </xsl:when>
               <xsl:otherwise>
                   <xsl:apply-templates select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" mode="article"/>
               </xsl:otherwise>
           </xsl:choose>
            <!-- auteurs -->
            <xsl:choose>
                <xsl:when test="//doc/z_authors !=''">
                    <xsl:apply-templates select="//doc/z_authors"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:analytic/tei:author"/>
                </xsl:otherwise>
            </xsl:choose>
            <!-- typeofResource -->
            <typeOfResource>text</typeOfResource>
            <!-- genre -->
            <genre xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="type">
                    <xsl:value-of select="$codeGenre"/>
                </xsl:attribute>
                <xsl:attribute name="displayLabel">
                    <xsl:value-of select="$genre"/>
                </xsl:attribute>
                <xsl:attribute name="authority">ISTEX</xsl:attribute>
                <xsl:attribute name="authorityURI">https://content-type.data.istex.fr</xsl:attribute>
                <xsl:attribute name="valueURI">
                    <xsl:value-of select="$codeGenreArk"/>
                </xsl:attribute>
                <xsl:value-of select="$codeGenre"/>
            </genre>
            <!-- originInfo -->
            <originInfo xmlns="http://www.loc.gov/mods/v3">
                <xsl:apply-templates select="//doc/publisher"/>
                <xsl:choose>
                    <xsl:when test="//doc/year !=''">
                        <xsl:apply-templates select="//doc/year"/>
                    </xsl:when>
                    <xsl:when test="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published'] !=''">
                        <dateIssued xmlns="http://www.loc.gov/mods/v3" encoding="w3cdtf">
                            <xsl:value-of select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published']"/>
                        </dateIssued>
                        <copyrightDate xmlns="http://www.loc.gov/mods/v3" encoding="w3cdtf">
                            <xsl:value-of select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published']"/>
                        </copyrightDate>
                    </xsl:when>
                </xsl:choose>
            </originInfo>
            <!-- physicalDescription -->
            <physicalDescription xmlns="http://www.loc.gov/mods/v3">
                <extent unit="ref">
                    <xsl:value-of select="//glutton/reference-count"/>
                </extent>
            </physicalDescription>
            <!-- langue et abstract -->
           <!-- ******************* Language ******************************-->
            <language xmlns="http://www.loc.gov/mods/v3">
                <languageTerm xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">code</xsl:attribute>
                    <xsl:attribute name="authority">iso639-2b</xsl:attribute>
                    <xsl:value-of select="$codeLang"/>
                </languageTerm>
                <languageTerm xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">code</xsl:attribute>
                    <xsl:attribute name="authority">rfc3066</xsl:attribute>
                    <xsl:value-of select="$codeLang1"/>
                </languageTerm>
            </language>
            <!--  reprise des abstracts depuis les données GROBID-->
            <xsl:if test ="$grobid//tei:TEI/tei:teiHeader/tei:profileDesc/tei:abstract !=''">
                <xsl:apply-templates select="$grobid//tei:TEI/tei:teiHeader/tei:profileDesc/tei:abstract"/>
            </xsl:if>
            <!-- reprise des mots clés depuis les données GROBID-->
            <xsl:if test ="$grobid//tei:TEI/tei:teiHeader/tei:profileDesc/tei:textClass/tei:keywords/tei:term !=''">
                <xsl:apply-templates select="$grobid//tei:TEI/tei:teiHeader/tei:profileDesc/tei:textClass/tei:keywords"/>
            </xsl:if>
            <!-- reprise des classifications depuis Json quand présence-->
            <xsl:if test ="/doc/glutton/subject !=''">
                <xsl:apply-templates select="/doc/glutton/subject"/>
            </xsl:if>
            <relatedItem xmlns="http://www.loc.gov/mods/v3">
                <xsl:attribute name="type">host</xsl:attribute>
                <!-- titre principal -->
                <xsl:apply-templates select="/doc/journal_name"/>
                <!-- titre abrégé -->
                <xsl:choose>
                    <xsl:when test="/doc/glutton/short-container-title !=''">
                        <xsl:apply-templates select="/doc/glutton/short-container-title"/>
                    </xsl:when>
                    <xsl:when test="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title[@type='abbrev'] !=''">
                        <xsl:apply-templates select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:title[@type='abbrev']"/>
                    </xsl:when>
                </xsl:choose>
                <!-- genre niveau host-->
                <genre type="journal" authority="ISTEX" authorityURI="https://publication-type.data.istex.fr"
                    valueURI="https://publication-type.data.istex.fr/ark:/67375/JMC-0GLKJH51-B">journal</genre>
                <originInfo xmlns="http://www.loc.gov/mods/v3">
                    <xsl:apply-templates select="//doc/publisher"/>
                    <xsl:choose>
                        <xsl:when test="//doc/year !=''">
                            <xsl:apply-templates select="//doc/year"/>
                        </xsl:when>
                        <xsl:when test="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published'] !=''">
                            <dateIssued xmlns="http://www.loc.gov/mods/v3" encoding="w3cdtf">
                                <xsl:value-of select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published']"/>
                            </dateIssued>
                            <copyrightDate xmlns="http://www.loc.gov/mods/v3" encoding="w3cdtf">
                                <xsl:value-of select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published']"/>
                            </copyrightDate>
                        </xsl:when>
                    </xsl:choose>
                </originInfo>
                <!-- identifiant niveau journal -->
                <xsl:choose>
                    <xsl:when test="/doc/glutton/issn-type !=''">
                        <xsl:apply-templates select="/doc/glutton/issn-type"/>
                    </xsl:when>
                    <xsl:when test="/doc/journal_issns !=''">
                        <xsl:apply-templates select="/doc/journal_issns"/>
                    </xsl:when>
                </xsl:choose>
                <!-- part -->
                <part xmlns="http://www.loc.gov/mods/v3">
                    <date xmlns="http://www.loc.gov/mods/v3">
                        <xsl:choose>
                            <xsl:when test="//doc/year !=''">
                                <xsl:value-of select="//doc/year"/>
                            </xsl:when>
                            <xsl:when test="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published'] !=''">
                                <xsl:value-of select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date[@type='published']"/>
                            </xsl:when>
                        </xsl:choose>
                    </date>
                    <!-- volume -->
                    <xsl:choose>
                        <xsl:when test="/doc/glutton/volume !=''">
                            <xsl:apply-templates select="/doc/glutton/volume"/>
                        </xsl:when>
                        <xsl:when test="/doc/glutton/issued/date-parts[2]">
                            <detail xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="type">volume</xsl:attribute>
                                <caption>vol.</caption>
                                <number>
                                    <xsl:value-of select="/doc/glutton/issued/date-parts[2]"/>
                                </number>
                            </detail>
                        </xsl:when>
                        <xsl:when test="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='volume'] !=''">
                            <xsl:apply-templates select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='volume']"/>
                        </xsl:when>
                    </xsl:choose>
                    <!-- numéro -->
                    <xsl:choose>
                        <xsl:when test="/doc/glutton/issue !=''">
                            <xsl:apply-templates select="/doc/glutton/issue"/>
                        </xsl:when>
                        <xsl:when test="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='issue'] !=''">
                            <xsl:apply-templates select="$grobid//tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:biblStruct/tei:monogr/tei:imprint/tei:biblScope[@unit='issue']"/>
                        </xsl:when>
                    </xsl:choose>
                    <!-- pagination -->
                    <xsl:choose>
                        <xsl:when test="/doc/glutton/page !=''">
                            <extent xmlns="http://www.loc.gov/mods/v3">
                                <xsl:attribute name="unit">pages</xsl:attribute> 
                                <xsl:apply-templates select="/doc/glutton/page"/>
                            </extent>
                        </xsl:when>
                    </xsl:choose>
                </part> 
            </relatedItem>
            <!-- ******************* identifiant systéme (n'apparaît pas dans le résultat ******************************-->
            <xsl:if test="string-length($idistex) &gt; 0 ">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">istex</xsl:attribute>
                    <xsl:value-of select="normalize-space($idistex)"/>
                </identifier>
            </xsl:if>
            <!-- mars 2017 - ajout identifiant ark utilisé par API web -->
            <xsl:if test="string-length($arkistex) &gt; 0 ">
                <identifier xmlns="http://www.loc.gov/mods/v3">
                    <xsl:attribute name="type">ark</xsl:attribute>
                    <xsl:value-of select="$arkistex"/>
                </identifier>
            </xsl:if>
            <!-- ******************* références reprises depuis les données GROBID ******************************-->
            <xsl:if test ="$grobid//tei:TEI/tei:text/tei:back/tei:div[@type='references']/tei:listBibl/tei:biblStruct !=''">
                <xsl:apply-templates select="$grobid//tei:TEI/tei:text/tei:back/tei:div[@type='references']/tei:listBibl/tei:biblStruct"/>
            </xsl:if>
            <!-- identifiants niveau article -->
            <xsl:apply-templates select="/doc/id"/>
            <xsl:apply-templates select="/doc/doi"/>
            <xsl:apply-templates select="/doc/glutton/pmid"/>
            <xsl:apply-templates select="/doc/glutton/pmcid"/>
            <xsl:apply-templates select="/doc/doi_url"/>
            <xsl:apply-templates select="/doc/glutton/URL"/>
            <xsl:apply-templates select="/doc/glutton/link/URL"/>
            <!-- access condition -->
            <xsl:if test="//license[1] !=''">
                <accessCondition xmlns="http://www.loc.gov/mods/v3" type="use and reproduction">
                    <xsl:attribute name="contentType">
                        <xsl:text>open-access</xsl:text>
                    </xsl:attribute>
                    <xsl:value-of select="//license[1]"/>
                </accessCondition>
            </xsl:if>
            <!-- copyright -->   
            <recordInfo xmlns="http://www.loc.gov/mods/v3">
                <recordContentSource xmlns="http://www.loc.gov/mods/v3" authority="ISTEX">oa</recordContentSource>
                <recordOrigin xmlns="http://www.loc.gov/mods/v3">oa</recordOrigin>
                <recordCreationDate encoding="w3cdtf" xmlns="http://www.loc.gov/mods/v3">
                    <xsl:value-of select="$datecreation"/>
                </recordCreationDate>
            </recordInfo>
        </mods>
    </xsl:template>
    
    <!-- ***********************Début des templates d'appel *************************-->
    <!-- titre-->
    <xsl:template match="title|tei:title" mode="article">
        <titleInfo xmlns="http://www.loc.gov/mods/v3">
            <xsl:if test="$codeLang1">
                <xsl:attribute name="lang">
                    <xsl:value-of select="normalize-space($codeLang1)"/>
                </xsl:attribute>
            </xsl:if>
            <title xmlns="http://www.loc.gov/mods/v3">
                <xsl:value-of select="normalize-space(.)"/>
            </title>
        </titleInfo>
        <titleInfo xmlns="http://www.loc.gov/mods/v3" type="alternative">
            <xsl:attribute name="contentType">
                <xsl:text>CDATA</xsl:text>
            </xsl:attribute>
            <xsl:if test="$codeLang1">
                <xsl:attribute name="lang">
                    <xsl:value-of select="normalize-space($codeLang1)"/>
                </xsl:attribute>
            </xsl:if>
            <title xmlns="http://www.loc.gov/mods/v3">
                <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                <xsl:value-of select="normalize-space(.)"/>
                <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
            </title>
        </titleInfo>
    </xsl:template>
    <!-- table des auteurs -->
    <xsl:template match="z_authors">
        <name type="personal" xmlns="http://www.loc.gov/mods/v3">
            <xsl:apply-templates select="given"/>
            <xsl:apply-templates select="family"/>
            <xsl:apply-templates select="affiliation"/>
            <xsl:apply-templates select="ORCID"/>
            <role xmlns="http://www.loc.gov/mods/v3">
                <roleTerm type="text" xmlns="http://www.loc.gov/mods/v3">author</roleTerm>
            </role>
        </name>
    </xsl:template>
    <!-- given -->
    <xsl:template match="given">
        <namePart type="given" xmlns="http://www.loc.gov/mods/v3">
            <xsl:apply-templates/>
        </namePart>
    </xsl:template>
    <!-- family -->
    <xsl:template match="family">
        <namePart type="family" xmlns="http://www.loc.gov/mods/v3">
            <xsl:apply-templates/>
        </namePart>
    </xsl:template>
    <!-- affiliation -->
    <xsl:template match="affiliation">
        <affiliation xmlns="http://www.loc.gov/mods/v3">
            <xsl:value-of select="name"/>
        </affiliation>
    </xsl:template>
    <!-- ORCID -->
    <xsl:template match="ORCID">
        <nameIdentifier type="ORCID" xmlns="http://www.loc.gov/mods/v3">
            <xsl:apply-templates/>
        </nameIdentifier>
    </xsl:template>
    <!-- publisher -->
    <xsl:template match="publisher">
        <publisher xmlns="http://www.loc.gov/mods/v3">
            <xsl:apply-templates/>
        </publisher>
    </xsl:template>
    <!-- dateIssued -->
    <xsl:template match="year">
        <dateIssued xmlns="http://www.loc.gov/mods/v3" encoding="w3cdtf">
            <xsl:apply-templates/>
        </dateIssued>
        <copyrightDate xmlns="http://www.loc.gov/mods/v3" encoding="w3cdtf">
            <xsl:apply-templates/>
        </copyrightDate>
    </xsl:template>
    <!-- abstract repris depuis Grobid-->
    <xsl:template match="tei:abstract">
        <abstract xmlns="http://www.loc.gov/mods/v3">
            <xsl:if test="@xml:lang">
                <xsl:attribute name="lang">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="normalize-space(.)"/>
        </abstract>
    </xsl:template>
    <!-- Mots clés repris depuis Grobid-->
    <xsl:template match="tei:keywords">
        <subject xmlns="http://www.loc.gov/mods/v3">
            <xsl:if test="@xml:lang">
                <xsl:attribute name="lang">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="tei:term"/>
        </subject>
    </xsl:template>
    <xsl:template match="tei:term">
        <topic xmlns="http://www.loc.gov/mods/v3">
            <xsl:value-of select="normalize-space(.)"/>
        </topic>
    </xsl:template>
    <xsl:template match="subject">
        <classification displayLabel="subject" xmlns="http://www.loc.gov/mods/v3">
            <xsl:apply-templates/>
        </classification>
    </xsl:template>
    <!-- titre du journal -->
    <xsl:template match="journal_name">
        <titleInfo xmlns="http://www.loc.gov/mods/v3">
            <title xmlns="http://www.loc.gov/mods/v3">
                <xsl:apply-templates/>
            </title>
        </titleInfo>
    </xsl:template>
    <xsl:template match="short-container-title">
        <titleInfo xmlns="http://www.loc.gov/mods/v3">
            <xsl:choose>
                <xsl:when test="@abbrev-type='full'"/>
                <xsl:otherwise>
                    <xsl:attribute name="type">abbreviated</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@abbrev-type='pubmed'">
                <xsl:attribute name="displayLabel">
                    <xsl:value-of select="@abbrev-type"/>
                </xsl:attribute>
            </xsl:if>
            <title xmlns="http://www.loc.gov/mods/v3">
                <xsl:apply-templates/>
            </title>
        </titleInfo>
    </xsl:template>
    <xsl:template match="journal_issns">
        <identifier xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">ISSN</xsl:attribute>
            <xsl:apply-templates/>
        </identifier>
    </xsl:template>
    <xsl:template match="issn-type">
        <identifier xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">
            <xsl:choose>
                <xsl:when test="type='electronic'">eISSN</xsl:when>
                <xsl:otherwise>ISSN</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates select="value"/>
        </identifier>
    </xsl:template>
    <xsl:template match="value">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="id">
        <identifier xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">ArticleID</xsl:attribute>
            <xsl:apply-templates/>
        </identifier>
    </xsl:template>
    
    <xsl:template match="doi"> 
        <identifier xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">DOI</xsl:attribute>
            <xsl:apply-templates/> 
        </identifier>
    </xsl:template>
    <xsl:template match="pmid">
        <identifier xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">PMID</xsl:attribute>
            <xsl:apply-templates/>
        </identifier>
    </xsl:template>
    <xsl:template match="pmcid">
        <identifier xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">PMCID</xsl:attribute>
            <xsl:apply-templates/>
        </identifier>
    </xsl:template>
    <xsl:template match="doi_url"> 
        <identifier xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">URLdoi</xsl:attribute>
            <xsl:apply-templates/> 
        </identifier>
    </xsl:template>
    <xsl:template match="URL"> 
        <identifier xmlns="http://www.loc.gov/mods/v3">
            <xsl:choose>
                <xsl:when test="parent::glutton">
                    <xsl:attribute name="type">URLdoi</xsl:attribute> 
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="type">URLpdf</xsl:attribute> 
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates/> 
        </identifier>
    </xsl:template>
    <xsl:template match="volume"> 
        <detail xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">volume</xsl:attribute>
            <caption>vol.</caption>
            <number><xsl:apply-templates/></number>
        </detail>
    </xsl:template>
    <xsl:template match="issue"> 
        <detail xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">issue</xsl:attribute>
            <caption>no.</caption>
            <number><xsl:apply-templates/></number>
        </detail>
    </xsl:template>
    <xsl:template match="page"> 
        <xsl:choose>
            <xsl:when test="contains(.,'-')">
                <start xmlns="http://www.loc.gov/mods/v3">
                    <xsl:value-of select="substring-before(.,'-')"/>
                </start>
                <end xmlns="http://www.loc.gov/mods/v3">
                    <xsl:value-of select="substring-after(.,'-')"/>
                </end>
            </xsl:when>
            <xsl:when test=".!=''">
                <start xmlns="http://www.loc.gov/mods/v3">
                    <xsl:value-of select="."/>
                </start>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <!-- reprise des références bibliographiques depuis GROBID -->
    <xsl:template match="tei:biblStruct"> 
        <relatedItem xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">references</xsl:attribute>
            <xsl:if test="@xml:id">
                <xsl:attribute name="displayLabel">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </relatedItem>
    </xsl:template>
    <xsl:template match="tei:analytic"> 
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:title"> 
        <titleInfo xmlns="http://www.loc.gov/mods/v3">
            <title xmlns="http://www.loc.gov/mods/v3">
                <xsl:apply-templates/>
            </title>
        </titleInfo>
    </xsl:template>
    <xsl:template match="tei:title[@type='abbrev']"> 
        <titleInfo xmlns="http://www.loc.gov/mods/v3" type="abbreviated">
            <title xmlns="http://www.loc.gov/mods/v3">
                <xsl:apply-templates/>
            </title>
        </titleInfo>
    </xsl:template>
    <xsl:template match="tei:author"> 
        <name xmlns="http://www.loc.gov/mods/v3" type="personal">
            <xsl:apply-templates/>
            <role xmlns="http://www.loc.gov/mods/v3">
                <roleTerm type="text" xmlns="http://www.loc.gov/mods/v3">author</roleTerm>
            </role>
        </name>
    </xsl:template>
    <xsl:template match="tei:editor"> 
        <name xmlns="http://www.loc.gov/mods/v3" type="personal">
            <xsl:apply-templates/>
            <role xmlns="http://www.loc.gov/mods/v3">
                <roleTerm type="text" xmlns="http://www.loc.gov/mods/v3">editor</roleTerm>
            </role>
        </name>
    </xsl:template>
    <xsl:template match="tei:persName"> 
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="tei:forename"> 
        <namePart xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">
                <xsl:choose>
                    <xsl:when test="@type='first'">given</xsl:when>
                    <xsl:when test="@type='middle'">termsOfAddress</xsl:when>
                </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates/>
        </namePart>
    </xsl:template>
    <xsl:template match="tei:surname"> 
        <namePart xmlns="http://www.loc.gov/mods/v3" type="family">
            <xsl:apply-templates/>
        </namePart>
    </xsl:template>
    <xsl:template match="tei:idno[@type='ORCID']"> 
        <nameIdentifier xmlns="http://www.loc.gov/mods/v3" type="ORCID">
            <xsl:apply-templates/>
        </nameIdentifier>
    </xsl:template>
    <xsl:template match="tei:monogr">
        <relatedItem xmlns="http://www.loc.gov/mods/v3">
            <xsl:attribute name="type">host</xsl:attribute>
            <xsl:apply-templates/>
        </relatedItem>
    </xsl:template>
    <xsl:template match="tei:imprint">
        <part xmlns="http://www.loc.gov/mods/v3">
            <xsl:apply-templates select="tei:date"/>
            <xsl:apply-templates select="tei:biblScope"/>
        </part>
    </xsl:template>
    <xsl:template match="tei:publisher">
        <publisher xmlns="http://www.loc.gov/mods/v3">
            <xsl:apply-templates/>
        </publisher>
    </xsl:template>
    <xsl:template match="tei:date">
        <date xmlns="http://www.loc.gov/mods/v3">
            <xsl:choose>
                <xsl:when test="@when !=''">
                    <xsl:value-of select="@when"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </date>
    </xsl:template>
    <xsl:template match="tei:meeting">
        <name type="conference" xmlns="http://www.loc.gov/mods/v3">
            <namePart xmlns="http://www.loc.gov/mods/v3">
                <xsl:apply-templates/>
            </namePart>
        </name>
    </xsl:template>
    <xsl:template match="tei:biblScope[@unit='volume']">
        <detail type="volume" xmlns="http://www.loc.gov/mods/v3">
            <number><xsl:apply-templates/></number>
            <caption>vol.</caption>
        </detail>
    </xsl:template>
    <xsl:template match="tei:biblScope[@unit='issue']">
        <detail type="issue" xmlns="http://www.loc.gov/mods/v3">
            <number><xsl:apply-templates/></number>
            <caption>no.</caption>
        </detail>
    </xsl:template>
    <xsl:template match="tei:biblScope[@unit='page']">
        <extent unit="pages" xmlns="http://www.loc.gov/mods/v3">
            <xsl:choose>
                <xsl:when test="@from !=''">
                    <start xmlns="http://www.loc.gov/mods/v3">
                        <xsl:value-of select="@from"/>
                    </start>
                    <end xmlns="http://www.loc.gov/mods/v3">
                        <xsl:value-of select="@to"/>
                    </end>
                </xsl:when>
                <xsl:otherwise>
                    <start xmlns="http://www.loc.gov/mods/v3">
                        <xsl:value-of select="."/>
                    </start>
                </xsl:otherwise>
            </xsl:choose>
        </extent>
    </xsl:template>
    <xsl:template match="tei:affiliation">
        <affiliation xmlns="http://www.loc.gov/mods/v3">
            <xsl:apply-templates/>
        </affiliation>
    </xsl:template>
    <xsl:template match="tei:idno[@type='DOI']"> 
        <identifier xmlns="http://www.loc.gov/mods/v3" type="DOI">
            <xsl:apply-templates/>
        </identifier>
    </xsl:template>
    <xsl:template match="tei:ptr"> 
        <identifier xmlns="http://www.loc.gov/mods/v3" type="DOI">
            <xsl:value-of select="@target"/>
        </identifier>
    </xsl:template>
    <xsl:template match="tei:note"/>
    <xsl:template match="tei:pubPlace"/>
    <xsl:template match="tei:respStmt">
        <note xmlns="http://www.loc.gov/mods/v3">
            <xsl:apply-templates/>
        </note>
    </xsl:template>
</xsl:stylesheet>
