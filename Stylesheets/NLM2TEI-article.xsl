<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:rsc="http://www.rsc.org/schema/rscart38" xmlns:ali="http://www.niso.org/schemas/ali/1.0/" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="#all">

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Dec. 2008</xd:p>
            <xd:p><xd:b>Author:</xd:b> Laurent Romary</xd:p>
            <xd:p>for the PEER project</xd:p>
            <xd:p>Available under creative commons CC-BY licence.</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- code genre -->
    <xsl:variable name="codeGenre2">
        <xsl:choose>
            <xsl:when test="//article/@article-type[string-length() &gt; 0]">
                <xsl:value-of select="//article/@article-type"/>
            </xsl:when>
            <xsl:when test="//isbn='978-3-318-05934-2' and //article-title='History of the Basel Institute for Immunology'">book</xsl:when>
            <xsl:when test="//isbn='978-3-318-05934-2' and not(//article-title='History of the Basel Institute for Immunology')">other</xsl:when>
            <xsl:when test="contains(/article/front/article-meta/article-categories/subj-group[1]/subject[@content-type='original'],'Case reports')">
                <xsl:value-of select="/article/front/article-meta/article-categories/subj-group[1]/subject[@content-type='original']"/>
            </xsl:when>
            <xsl:when test="contains(/article/front/article-meta/article-categories/subj-group[1]/subject,'Chapter')">
                <xsl:value-of select="/article/front/article-meta/article-categories/subj-group[1]/subject"/>
            </xsl:when>
            <xsl:when test="//pubfm/categ/@id[string-length() &gt; 0]">
                <xsl:value-of select="$codeGenreNature"/>
            </xsl:when>
            <xsl:when test="//article/front/article-meta/title-group/subtitle [string-length() &gt; 0]">
                <!-- traitement spécial RSC-ebooks -->
                <xsl:choose>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle | /article/front/article-meta/title-group/title,'Preface')">editorial</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle | /article/front/article-meta/title-group/title,'Forward')">editorial</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle | /article/front/article-meta/title-group/title,'Introduction')">editorial</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle | /article/front/article-meta/title-group/title,'Introduction and general aspects')">editorial</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle | /article/front/article-meta/title-group/title,'Back Cover')">other</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle | /article/front/article-meta/title-group/title,'Front cover')">other</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle | /article/front/article-meta/title-group/title,'Subject Index')">other</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle | /article/front/article-meta/title-group/title,'Author Index')">other</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle | /article/front/article-meta/title-group/title,'Contents')">other</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle | /article/front/article-meta/title-group/title,'Front matter')">other</xsl:when>
                    <xsl:when test="contains(/article/front/article-meta/title-group/subtitle | /article/front/article-meta/title-group/title,'Abbreviations')">other</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!-- si non présence d'article-type dans la notice d'origine -->
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="//article/front/article-meta/article-categories/subj-group/subject='ORIGINAL RESEARCH PAPERS'">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="//article/front/article-meta/abstract[string-length() &gt; 0] or contains(//article-meta/fpage,'s') or contains(//article-meta/fpage,'S')">article</xsl:when>
                    <xsl:when test="//article/front/article-meta/abstract[string-length()&gt; 0]">article</xsl:when>
                    <xsl:otherwise>
                        <xsl:text>other</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="codeGenre">
        <xsl:choose>
            <xsl:when test="//isbn='978-3-318-05934-2' and //article-title='History of the Basel Institute for Immunology'">book</xsl:when>
            <xsl:when test="//isbn='978-3-318-05934-2' and not(//article-title='History of the Basel Institute for Immunology')">other</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='astronomical-observation'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='magnetical-observation'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='meteorological-observation'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='abstract'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>abstract</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='addendum'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='announcement'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='article-commentary'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='article'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='Article'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='book-review'">book-reviews</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='books-received'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='brief-report'">brief-communication</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='calendar'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='case-report'">case-report</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='Case reports'">case-report</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='collection'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='correction'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='errata'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='dissertation'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='discussion'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='editorial'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='experiment'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='in-brief'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">brief-communication</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='introduction'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='letter'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='lecture'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='meeting-report'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='news'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='paper-read'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='obituary'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='oration'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='other'">
                <xsl:choose>
                    <xsl:when test="//article/front/article-meta/article-categories/subj-group/subject='ORIGINAL RESEARCH PAPERS'">research-article</xsl:when>
                    <xsl:when test="//article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="//article/front/article-meta/abstract[string-length() &gt; 0] or contains(//article/front/article-meta/fpage,'s') or contains(//article/front/article-meta/fpage,'S')">article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='partial-retraction'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='pdf-issue'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='poster'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='product-review'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='rapid-communication'">brief-communication</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='reply'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='reprint'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='research-article'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='retraction'">other</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='review-article'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenre2)='translation'">
                <xsl:choose>
                    <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains(/article/front/article-meta/article-categories/subj-group[@subj-group-type='heading'][1]/subject,'Chapter')">chapter</xsl:when>
           <xsl:otherwise>
               <xsl:choose>
                   <xsl:when test="article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                   <xsl:when test="article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                   <xsl:otherwise>other</xsl:otherwise>
               </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <!-- lien vers data.istex.fr -->
    <xsl:variable name="codeGenreArk2">
        <xsl:choose>
            <xsl:when test="normalize-space($codeGenre)='research-article'">https://content-type.data.istex.fr/ark:/67375/XTP-1JC4F85T-7</xsl:when>
            <xsl:when test="normalize-space($codeGenre)='article'">https://content-type.data.istex.fr/ark:/67375/XTP-6N5SZHKN-D</xsl:when>
            <xsl:when test="normalize-space($codeGenre)='other'">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:when>
            <xsl:when test="normalize-space($codeGenre)='book-reviews'">https://content-type.data.istex.fr/ark:/67375/XTP-PBH5VBM9-4</xsl:when>
            <xsl:when test="normalize-space($codeGenre)='abstract'">https://content-type.data.istex.fr/ark:/67375/XTP-HPN7T1Q2-R</xsl:when>
            <xsl:when test="normalize-space($codeGenre)='review-article'">https://content-type.data.istex.fr/ark:/67375/XTP-L5L7X3NF-P</xsl:when>
            <xsl:when test="normalize-space($codeGenre)='brief-communication'">https://content-type.data.istex.fr/ark:/67375/XTP-S9SX2MFS-0</xsl:when>
            <xsl:when test="normalize-space($codeGenre)='editorial'">https://content-type.data.istex.fr/ark:/67375/XTP-STW636XV-K</xsl:when>
            <xsl:when test="normalize-space($codeGenre)='case-report'">https://content-type.data.istex.fr/ark:/67375/XTP-29919SZJ-6</xsl:when>
            <xsl:when test="normalize-space($codeGenre)='conference'">https://content-type.data.istex.fr/ark:/67375/XTP-BFHXPBJJ-3</xsl:when>
            <xsl:when test="normalize-space($codeGenre)='chapter'">https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6</xsl:when>
            <xsl:when test="normalize-space($codeGenre)='book'">https://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T</xsl:when>
        </xsl:choose>
    </xsl:variable>
    <!-- genre -->
   <xsl:variable name="codeGenreNature1">
        <xsl:value-of select="//pubfm/categ/@id"/>
    </xsl:variable>
    <xsl:variable name="codeGenreNature">
        <xsl:choose>
            <xsl:when test="normalize-space($codeGenreNature1)='20q'">Twenty Questions</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='50and100yrsago'">50 and 100 Years Ago</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='50yrsago'">50 Years Ago</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='absd'">Abstract and Discussion</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ac'">Author Contribution</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='acmgcn'">ACMG College News</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='acmgpolicy'">ACMG Policy Statement</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='acmgprac'">ACMG Practice Guidelines</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='acmgpres'">ACMG Presidential Address</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='acmgrec'">ACMG Recommendations</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='acmgstd'">ACMG Standards and Guidelines</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='acrossedsdesk'">Across the Editor's Desk</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='add'">Addendum</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='adfeat'">Technology Feature</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='adv'">Advances</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='advert'">Advertorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='advice'">Advice</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='aeronauticalnotes'">Aeronautical Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='af'">Article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='amateurtelescopemaker'">The Amateur Telescope Maker</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ampedsoc'">The American Pediatric Society</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='an'">Analysis</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='annmtg'">Annual meeting</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='announcement'">Announcement</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='apn'">Application Note</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ar'">Article Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='archeology'">Archeology</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ars'">Art and Science</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='astronomy'">Astronomy</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='au'">Authors</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='aub'">Autumn Books</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='aviation'">Aviation</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ba'">Books and Arts</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='backoffrontispiece'">Back of Frontispiece</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bb'">Between Bedside and Bench</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bc'">Brief Communications</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bca'">Brief Communication Arising</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bio'">Bioentrepreneur</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='biov'">Biovision</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bks'">Book Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bkstory'">Backstory</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='blog'">Blog</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='blogosphere'">Blogosphere</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='blogroll'">Blogroll</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bn'">Business</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bnf'">Business Feature</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bo'">Book Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bonekyw'">BoneKEy Watch</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='boo'">Book</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='books'">Books</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bp'">Brief Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='br'">Briefing</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='brfnw'">News Brief</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='brn'">Business and Regulatory News</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='browsingwitheditor'">Browsing With the Editor</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bru'">Briefing Update</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bsn'">Business News</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='businessandpersonal'">Business and Personal</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='byndbndrs'">Beyond Boundaries</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cameraangles'">Camera Angles</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cameraanglesroundtable'">Camera Angles Round Table</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='car'">Careers and Recruitment</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='case'">Case Study</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='casefv'">Case Study FV</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='caser'">Case Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cc'">Community Corner</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cg'">Corrigendum</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='chemistryinindustry'">Chemistry in Industry</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='civilengnrngnotes'">Civil Engineering Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clin'">Clinical</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clinadv'">Clinical Advance</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clincase'">Clinical Cases</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clincon'">Clinical Context</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clincr'">Clinical Case Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clinfor'">Clinical Informatics</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clinimg'">Clinical Image</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clinres'">Clinical research</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clintechnq'">Clinical Techniques</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clncon'">Clinical context</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clnimg'">Clinical image</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cm'">Commentary</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cme'">Continuing Medical Education</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cmeed'">CME Editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cmtrep'">Committee Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cn'">Communication</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cna'">Communications Arising</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='co'">Commentary</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='col'">Column</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='collabrv'">Collaborative Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='collnews'">College News</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='com'">Comment</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='commrclpropnews'">Commercial Property News</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='compbio'">Computational Biology</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='conc'">Concepts</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='conf'">Conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cons'">Consensus Statement</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='contest'">Contest</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='couch'">From the Analyst's Couch</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cprot'">Classic Protocol</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cr'">Correspondence</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='crsswrd'">Crossword</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cs'">Correction</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cse'">Case Series</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cstory'">Cover Story</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='currntbulltnbrfs'">Current Bulletin Briefs</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cy'">Commentary</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='dabs'">Discussion of Abstracts</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='db'">Debate</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='dbases'">Databases</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='dd'">Data Descriptor</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='dept'">Department</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='diary'">Diary</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='dplat'">Drug Platforms</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='dsdv'">Discovery &amp; Development</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='dtech'">Distillery: Techniques</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='dther'">Distillery: Therapeutics</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='dw'">Disease Watch</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ecr'">EMBO Conference Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ED'">Editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ed'">Editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='edfocus'">Editor's Focus</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='edfv'">Editorial FV</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='edin'">Editor's introduction</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ednote'">Editor's Note</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='eds'">Editor's Letter</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='edu'">Education</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='eduforum'">Educational Forum</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='edurep'">Educational Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='egame'">Endgame</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='egapp'">EGAPP Recommendation Statement</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='el'">Elements</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='electricalnotes'">Electrical Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='electronics'">Electronics</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='emr'">EMBO Members Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='eng'">In English, Nature</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='engineering'">Engineering</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='epig'">Epigenetics</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='er'">Erratum</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='erp'">Editorial Reprise</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='essay'">Essay</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='essaycon'">Essay Concept</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ethicsw'">Ethics Watch</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='evrv'">Evidence Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ewr'">EMBO Workshop Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='explorationnotes'">Exploration Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='exprv'">Expert Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fa'">Featured Articles</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='faq'">Frequently asked Questions</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fd'">Foreword</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fe'">Feature</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fep'">Featured Editor's Picks</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='filmr'">Film Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='firearmsfishing'">Your Firearms and Fishing Tackle</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fn'">Finance</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fnisn'">ISN Forefronts in Nephrology</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fno'">Field Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='focus'">Focus</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='focusrev'">Focus Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='forestindustry'">Forest Industry</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='forum'">Forum</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fpln'">Fresh from the Pipeline</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fqc'">Focus Quality Control</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fr'">Film Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fromed'">From The Editors</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='frontispiece'">Frontispiece</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ftw'">Feeding the World</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fundamentalscience'">Fundamental Science</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fut'">Futures</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='gen'">General</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='genecardupd'">Clinical Utility Gene Card Update</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='genetestrv'">GeneTest Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='getact'">Get Active</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='gic'">General Information for Contributors</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='gnintl'">International Genetics</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='gnlg'">Genetics Legacies</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='governmentalactivities'">Governmental Activities</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='graphicscience'">Graphic Science</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='grow'">GROW Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='gu'">Guidelines</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='gus'">Guidelines Summary</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='gw'">Genome Watch</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hc'">Historical Commentary</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='health'">Health</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='healthscience'">Health Science</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hh'">Human Health</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hi'">Hypertension Illustrated</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='highlts'">Research Highlights</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='highwaytransportation'">Highway Transportation</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hliss'">Highlights of This Issue</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hn'">Historical News and Views</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hor'">Horizons</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='householdinventions'">Household Inventions</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hp'">Historical Perspective</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hrn'">Historical Research Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hs'">History</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hsaw'">Harland Sanders Award</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='htman'">How to manage...</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hv'">Historical Vignette</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hyp'">Hypothesis</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hys'">Have you seen?</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hyst'">Have you seen?</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ib'">In Brief</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='in'">Introduction</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='inclass'">In The Classroom</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='index'">Index</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='indexofinventions'">Index of Inventions</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='indp'">Industry Perspective</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='industrialdigest'">Industrial Digest</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='industriesatoms'">Industries From Atoms</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='industrltrnds'">Industrial Trends</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='industry'">Industry</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='info'">Information</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='iniss'">In This Issue</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='inothrflds'">In Other Fields</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='inpress'">In the press</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='INSIGHT'">Insight</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='insight'">Insight</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='insit'">In Situ</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='intheedsmail'">In the Editor's Mail</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='intvw'">Interview</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='invcm'">Invited Commentary</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='invcme'">Invited Review/CME Article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='inved'">Invited Editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='inventions'">Inventions</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='inventionshousehold'">Inventions for the Household</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='inventionsnew'">Inventions New and Interesting</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='is'">Insight</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='itp'">Inside The Paper</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ix'">Index</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='iye'">In Your Element</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='japau'">Japanese Author</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='japlnf'">Local News Feature</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='japmuse'">muse@nature.com</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='japnf'">Japan News Feature</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='japnw'">Nature News</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='japsi'">Scientist Interview</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='japsn'">Science News</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='jcb'">Journal Club</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='jr'">Journal Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='labmeth'">Laboratory Methods</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='le'">Letter</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='learningtousewings'">Learning to Use Our Wings</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='led'">Letter to the Editor</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='legalhighlights'">Legal High-Lights</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='legalnotes'">Legal Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='lfln'">Lifeline</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='lgu'">Legal Update</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='li'">Inside Lab Invest</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='lm'">Landmark</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='lstwrd'">Last Word</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='lt'">Letters to Nature</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ma'">Mergers and Acquisitions</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mabs'">Meeting Abstracts</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mark'">Markers</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='marw'">Market Watch</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mcal'">Meeting Calendar</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mechengnrngnotes'">Mechanical Engineering Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='medgncal'">Medical Genetics Calendar</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='medgndp'">Medical Genetics Diplomates</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='medicalscience'">Medical Science</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='medrv'">Medal Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='meetteam'">Meet the team</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mem'">In Memorium</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='memrv'">Member Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='metalsinindustry'">Metals in Industry</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='methods'">Methods</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='methodstowatch'">Method to Watch</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mgt'">Management</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mib'">Methods in Brief</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='militaryscience'">Military Science</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mindinpictures'">Mind in Pictures</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='minirv'">Mini Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='misc'">miscellany</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='miscellaneousnotes'">Miscellaneous Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='miscellany'">Miscellany</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mktana'">Market Analysis</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='modofthemonth'">Model of the Month</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='motordrvncmmrclvhcl'">The Motor-Driven Commercial Vehicle</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mp'">Marketplace</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mr'">Meeting Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mt'">Meetings</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mtp'">Making the Paper</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='multr'">Multimedia Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='na'">News and Analysis</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nationaldefense'">National Defense</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='naturalhistory'">Natural History</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='natureindex'">Nature Index</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='naturejobs'">Naturejobs</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='natview'">Natureview</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='navigation'">Navigation</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nb'">News in Brief</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nbr'">News in Brief</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nbri'">News in Brief</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ne'">News</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nemr'">New EMBO Members Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='neuro'">Neurotechniques</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='newboatandequip'">New Boat and Boat Equipment</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='newgenetest'">New at GeneTests</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='newprodcts'">New Products</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='newprodctsandprocesses'">New Products and Processes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nf'">News Feature</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ngal'">Nature Gallery</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nj'">New Journals</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nm'">New on the Market</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nmr'">New Member Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nobellr'">Nobel Lecture</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='notesandqueries'">Notes and Queries</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='noveldevicesforshop'">Novel Devices for the Shop and the Home</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='np'">News Profile</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='npedrv'">Nanopediatrics Review Article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ntbm'">Not To Be Missed</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nv'">News and Views</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nvb'">News and Views in Brief</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nvf'">News and Views Feature</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nvfv'">News and Views FV</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nvqa'">News and Views Q&amp;A</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nw'">News</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='oa'">Original Article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ob'">Obituary</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ofgeneralintrst'">Of General Interest</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ofintrsttomtrsts'">Of Interest to Motorists</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='onbr'">Online News in Brief</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='onyrft'">On Your Feet</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='op'">Opinion</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='opcom'">Opinion and Comment</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='osa'">Original Research Article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ourbookcorner'">Our Book Corner</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ourpointofvieweds'">Our Point of View - Editorials</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ourreaderspointofview'">Our Readers' Point of View</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='out'">Outlook</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='outlab'">Out of the lab</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ov'">Overview</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pa'">Poster Abstract</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='patentandtmnotes'">Patent and Trade-mark Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='patentnotes'">Patent Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='patentsrcntlyissd'">Patents Recently Issued</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pe'">Perspectives</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pedr'">Pediatric Research</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pefv'">Perspective FV</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='personaltsinindstry'">Personalities in Industry</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='personaltsinscnce'">Personalities in Science</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='petroleum'">Petroleum</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='phot'">Photonics at NPG</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='photography'">Photography</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pi'">Picture Story</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pl'">Plus</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='plastics'">Plastics</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pn'">Product News</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pod'">Podcast</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='polw'">Policy Watch</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ppi'">Public-Private Interface</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ppro'">Product Profile</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ppt'">Practice Point</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pr'">Progress</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='prac'">Practice</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='previewsofindstrlhrzn'">Previews of the Industrial Horizon</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='prf'">Product Focus</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='prhl'">Product Highlights</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='prim'">Primer</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pro'">Profile</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='proceeding'">Conference Proceeding</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='prog'">Progress Article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='prorv'">Protocol Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='prot'">Protocol</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='protupdate'">Protocol Update</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='prv'">Product Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='psychicresearch'">Psychic Research</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='puzzle'">Puzzle page</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pw'">Patent Watch</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='qa'">Q&amp;A</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='quotes'">Quotes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ra'">Research Article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='radionotes'">Radio Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='railroadtransportation'">Railroad Transportation</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rcom'">Research Commentary</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rd'">Regional Development</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rdpub'">Rapid Publication</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='re'">Research</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='recentlyptntdinvntns'">Recently Patented Inventions</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='refutation'">Refutation</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rep'">Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='reply'">Reply</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ret'">Retraction</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='reviewers'">Reviewers</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rhighlts'">Research Highlight</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rl'">Research Library</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rlet'">Research Letters</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rn'">Research News</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rnote'">Research Note</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rr'">Research Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rs'">Resource</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ru'">Round-up</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='RV'">Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rv'">Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rvfv'">Review FV</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rw'">Regulation Watch</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='safety'">Safety</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sb'">Spring Books</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sc'">Scientific Correspondence</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sciamdigest'">Scientific American Digest</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sciamindstrldigest'">Scientific American Industrial Digest</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='scienceagenda'">Science Agenda</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='scienceandmoney'">Science and Money</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='scienceinindstry'">Science in Industry</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sciencenotes'">Science Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='scienceofhealth'">The Science of Health</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='scientificresearch'">Scientific Research</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='scinw'">Science - in the News</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='servicechemist'">Service of the Chemist</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sevendays'">Seven Days</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sf'">Special Feature</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='si'">Social Issues</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sim'">Science and Image</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='snaps'">Snapshot</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sp'">Strategic Planning</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='spar'">Special Article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='spfwd'">Sponsor's Foreword</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='spot'">Spotlight</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sprep'">Special Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='SR'">Scientific Reports</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sr'">Scientific Reports</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='SS'">Science and Society</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ss'">Science and Society</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='straysfromether'">Strays From the Ether</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='strev'">Structured Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='strle'">Star Letter</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='stw'">Structure Watch</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='su'">Summaries</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='summerbooks'">Summer Books</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='swr'">Software Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='talk'">Talking point</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tech'">Technology</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='technofiles'">TechnoFiles</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='telescoptics'">Telescoptics</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tenv'">The Environment</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tf'">Technology Feature</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='th'">Technical Highlight</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='thebackyarastronomer'">The Back Yard Astronomer</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='theheavens'">The Heavens</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='thes'">Thesis</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='theservicechemist'">The Service of the Chemist</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='thismo'">This Month</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='thread'">Thread</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='thtr'">Theatre Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tib'">Tools in Brief</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='timeln'">Timeline</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tlbx'">Toolbox</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tmat'">Training Matters</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tmech'">Targets and Mechanisms</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tn'">Trade News</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tools'">Tools</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tr'">Technical Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='trialw'">Trial Watch</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tt'">Techniques and Technology</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='turnp'">Turning Points</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tut'">Tutorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tvr'">Television Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='upfrnt'">Up front</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='vp'">Viewpoint</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='vpt'">View Point</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='vr'">Video Review</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='war'">War</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='wdiag'">What's Your Diagnosis</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='whatsnewphtgrphceqpmnt'">What's New in Photographic Equipment</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='wildlifenotes'">Wild Life Notes</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='worldwideradio'">World-Wide Radio</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='wsrep'">Workshop Report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='yearinreview'">Year in Review</xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="codeGenreNature2">
        <xsl:choose>
            <xsl:when test="normalize-space($codeGenreNature1)='adfeat'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='af'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='absd'">abstract</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='adfeat'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='amateurtelescopemaker'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ampedsoc'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='an'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ar'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='archeology'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='astronomy'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='aviation'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bc'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bca'">brief-communication</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bks'">book-reviews</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='bo'">book-reviews</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='brfnw'">brief-communication</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='case'">case-report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='casefv'">case-report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='caser'">case-report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='categtxt'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='chemistryinindustry'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clin'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clinadv'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clincase'">case-report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clincr'">case-report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clinfor'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clinres'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='clintechnq'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cmeed'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cn'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cna'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='co'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='collabrv'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='comment'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='com'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='compbio'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='conf'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cm'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cr'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cs'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cse'">case-report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='cy'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='dsdv'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ecr'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ED'">Editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ed'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='edfv'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='edin'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='edurep'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='electronics'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='engineering'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='erq'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='erp'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='essay'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ewr'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='exprv'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fa'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fd'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fe'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='forestindustry'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='fundamentalscience'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='gen'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='genetestrv'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='gnintl'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='grow'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hc'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='health'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='healthscience'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hh'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hn'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hp'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='hrn'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='in'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='indp'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='industriesatoms'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='industry'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='invcm'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='invcme'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='inved'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='japnf'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='japnw'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='japsn'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='jr'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='le'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='lt'">
                <xsl:choose>
                    <xsl:when test="//fm/websumm">research-article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mabs'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='medicalscience'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='memrv'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='metalsinindustry'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='methods'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='militaryscience'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='minirv'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mr'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='mt'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='multr'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nationaldefense'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='naturalhistory'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='na'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nb'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nbr'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nbri'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='natview'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='neuro'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='newboatandequip'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nf'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='npedrv'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nw'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nv'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nvqa'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nvf'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='nvfv'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='op'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='osa'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ov'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pa'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pe'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='pedr'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='petroleum'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='plastics'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='prhl'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='proceeding'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='prog'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='prv'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='psychicresearch'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ra'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='railroadtransportation'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rep'">case-report</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='reply'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='research'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rlet'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rn'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rnote'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rr'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rd'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rdpub'">brief-communication</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rcom'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rhighlts'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rs'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rv'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='RV'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='rvfv'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sc'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sf'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='SR'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sr'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='SS'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='ss'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='scienceinindstry'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='scientificresearch'">research-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='spar'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='sprep'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='strev'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='swr'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tf'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='th'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tr'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='tt'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='wsrep'">conference</xsl:when>
            <xsl:when test="normalize-space($codeGenreNature1)='wdiag'">case-report</xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="//article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="//article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <!-- SG ajout corrections des titres vides -->
    <xsl:variable name="repriseTitreVide">
        <xsl:choose>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='pii']='S0883769400055172'"><title level="a" type="main">Semiconductor Materials and Process Technology Handbook</title></xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='pii']='S0883769400055160'"><title level="a" type="main">Rapidly Solidified Metals - A Technological Overview</title></xsl:when>
            <!-- OUP -->
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/yiel/yvs021'">8. Western Europe B. Germany</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/litthe/10.2.148'">ON THE MARGINS OF THE ACCEPTABLE: CHARLOTTE BRONTE'S VILLETTE</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/litthe/10.2.171'">NO 'ELSEWHERE': FISH, SOLOVEITCHIK, AND THE UNAVOIDABILITY OF INTERPRETATION</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/litthe/10.2.160'">THE BODY'S SACRED: ROMANCE AND SACRIFICE IN RELIGIOUS AND JUNGIAN NARRATIVES</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/gerona/59.6.M616'">Authors’ Response to Commentaries</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/infdis/106.2.116'">Coagulase Production by Staphylococcus Aureus I. GROWTH AND COAGULASE PRODUCTION IN COMPLEX AND CHEMICALLY DEFINED MEDIUMS-COMPARISON OF CHEMICALLY DEFINED MEDIUMS</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/brain/awq317'">Metaphysics Resurgent</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/gerona/59.6.M603'">Commentary</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/jnci/90.19.1489'">CALENDAR OF EVENTS</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/gerona/59.6.M609'">Measuring Functional Decline in Population Aging in a Changing World and an Evolving Biology</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/infdis/104.2.203'">THE ROLE OF MACROPHAGES IN NATURAL IMMUNITY TO SALMONELLAE</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/jnci/89.8.589-a'">Notes</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/gerona/59.6.M606'">Population Aging Across Time and Cultures: Can We Move From Theory to Evidence?</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/gerona/59.6.M611'">Commentary</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/gerona/59.6.M601'">Population Aging: A Clinician's View</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/gerona/59.6.M602'">Incorporating Disability Into Population-Level Models of Health Change at Older Ages</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/gerona/59.6.M608'">Commentary</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/rpd/ncm134'">Fourteenth International Symposium on Microdosimetry</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/gerona/59.6.M599'">Commentary</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/gerona/59.6.M600'">Population Aging: The Benefit of Global Versus Local Theory</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/gerona/59.6.M605'">Commentary</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/nq/s11-XII.298.201-e'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/notesj/12.298.201-d'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/notesj/s6-I.13.265-f'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/brain/awg161'">Reply</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/jnci/djm161'">In this issue</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/llc/10.4.304'">Treasurer's Report Financial Year 1 January 1994 to 31 December 1994</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/notesj/s6-I.24.474-d'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/library/s4-IX.3.325'">CAXTON'S SON-IN-LAW</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/ejo/cjm030'">Editorial</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/mnras/201.2.401'">The gravitational evolution of structure in a scale-free universe</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/occmed/kqi148'">Research Methods in Occupational Epidemiology, 2nd edition.</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1093/cje/ben002'">Erratum : The economics of New Labour: policy and performance</xsl:when>
            <xsl:when test="//front/article-meta/article-id='6 Series II.28.38g'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id='7 Series VI.145.263b'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id='6 Series XII.298.204a'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id='5 Series XI.270.174b'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id='6 Series II.40.277c'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id='7 Series VI.145.263a'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id='s12-VIII.158.334h'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id='5 Series XI.270.174b'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id='6 Series II.40.277c'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id='7 Series VI.145.263a'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id='s12-VIII.158.334h'">Notes and queries</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='pii']='S0714980800010242'">The Work of the Hamburg Research Center in Entrepreneurial History</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.2178/bsl/1305810914'">Gao Su . Invariant descriptive set theory. Pure and applied mathematics. Chapman &amp; Hall/CRC, Boca Raton, 2009, xiv + 392 pp.</xsl:when>
            <!-- cambridge -->
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1017/S2046164X00055897'">Reviews of New Works : On the Mortality of Master Mariners. By F. G. P. NEISON, Esq.</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1017/S0714980800007790'">Reviews of: "Cole Thomas R., Van Tassel David D. and Kastenbaum Robert (eds.). Handbook of the Humanities and Aging" and "Kenyon Gary M., Birren James E. and Schroots Johannes J.F. (eds.). Metaphors of Aging in Science and the Humanities"</xsl:when>
            <!-- elsevier -->
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1016/0266-7681(90)90076-G'">Picture - JOHN TURNER HUESTON B.A. (Fine Arts), M.D., M.S., F.R.C.S., F.R.A.C.S.</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1016/0266-7681(89)90002-8'">Picture - J. WILLIAM LITTLER, M.D., F.A.C.S. </xsl:when>
            <!-- BMJ -->
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.9.suppl_1.i76'">1999 MANAGED CARE ACHIEVEMENTS IN TOBACCO CONTROL AWARDS PROGRAM</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/pgmj.75.890.775'">Book Reviews</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.7.4.445'">Calendar of Events</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.8.2.236'">Calendar of Events</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.9.1.116a'">Calendar of Events</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/jnnp.67.5.701'">CORRECTION : Basal forebrain amnesia: does the nucleus accumbens contribute to human memory?</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/jnnp.67.1.133'">CORRECTION : Comparison of mouse bioassay and immunoprecipation assay for botulinum toxin antibodies.</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/jnnp.67.4.559'">CORRECTION : Focal (segmental) dyshidrosis in syringomyelia.</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/gut.45.4.630d'">CORRECTIONS</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/jnnp.66.1.1'">Editorial</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/jnnp.64.1.1'">Editorial announcement</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.84.5.450'">From the library</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.76.1.83'">Instructions to Authors</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/pgmj.75.881.192'">International Postgraduate Diary</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/pgmj.75.882.256'">International Postgraduate Diary</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/pgmj.75.883.320'">International Postgraduate Diary</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/pgmj.75.886.512'">International Postgraduate Diary</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/pgmj.75.887.576'">International Postgraduate Diary</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/pgmj.75.888.640'">International Postgraduate Diary</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/pmj.76.891.64'">International Postgraduate Diary</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/pmj.76.892.128'">International Postgraduate Diary</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.76.3.292'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.76.5.484'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.77.1.96'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.77.3.278'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.77.5.470'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.78.1.99'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.79.1.96'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.79.3.294'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.79.5.468'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.80.1.104'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.80.3.304'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.80.5.496'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.81.1.100'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.81.5.462'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.82.1.91'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.82.3.274'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.82.5.434'">Lucina</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/adc.81.3.286'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.81.11.934'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.81.12.1030'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.81.5.342'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.81.6.430'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.81.7.526'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.81.8.624'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.81.9.718'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.82.1.8'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.82.10.1106'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.82.11.1230'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.82.12.1356'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.82.2.109'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.82.3.212'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.82.4.341'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.82.5.472'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.82.6.599'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.82.7.724'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.82.8.861'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.82.9.987'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.83.1.5'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.83.10.1105'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.83.11.1214'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.83.12.1319'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.83.2.136'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.83.3.260'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.83.4.389'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.83.5.513'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.83.6.642'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.83.7.766'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.83.8.892'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.83.9.1001'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.84.1.3'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.84.2.129'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.84.3.238'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/bjo.84.4.346'">Newsdesk</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.7.1.78'">Play It Again</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.7.2.184'">Play It Again</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.7.3.304'">Play It Again</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.8.2.204'">Play It Again</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.8.3.340'">Play It Again</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.8.4.426'">Play It Again</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.7.1.80'">The Lighter Side</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.7.2.183'">The Lighter Side</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.7.3.299'">The Lighter Side</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.7.4.424'">The Lighter Side</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.8.2.202'">The Lighter Side</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.8.3.339'">The Lighter Side</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/tc.8.4.425'">The Lighter Side</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1136/ard.58.9.523'">Unusual and memorable</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='other']='jnnp;68/2/256b'">CORRECTION : Effects of stimulant medication on the lateralisation of line bisection judgements of children with attention deficit hyperactivity disorder.</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='other']='postgradmedj;76/891/64a'">International Postgraduate Diary</xsl:when>
            <!-- EDP -->
            <xsl:when test="normalize-space(//front/article-meta/article-id[@pub-id-type='pii'])='S0883769400055172'">Semiconductor Materials and Process Technology Handbook</xsl:when>
            <xsl:when test="normalize-space(//front/article-meta/article-id[@pub-id-type='pii'])='S0883769400055160'">Rapidly Solidified Metals— A Technological Overview</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1051/jp3:1992124'">Erratum</xsl:when>
            <xsl:when test="//front/article-meta/article-id[@pub-id-type='doi']='10.1051/jphyscol:1982832'">Note - J. Steinberger</xsl:when>
       <!-- RSL -->
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rsnr.2005.0103'">Editorial - Terry Quinn</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rstb.1949.0002'">The filamentous bacteria Sphaerotilus, Leptothrix, Cladothrix, and their relation to iron and manganese</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rsta.1987.0082'">The Oligocene and Miocene Outliers of West Cornwall and their bearing on the geomorphological evolution of Oldland Britain</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rspa.1971.0188'">Address of the President Professor A. L. Hodgkin at the Anniversary Meeting, 30 November 1971</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rspa.1971.0038'">The finite compression of elastic solid cylinders in the presence of gravity</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rstl.1883.0004'">IV. Experiments on the Value of the British Association Unit of Resistance</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rspa.1978.0029'">Address of the President Lord Todd, O.M. at the Anniversary Meeting, 30 November 1977</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rspa.1971.0039'">On the degree of sharpness in solutions of Einstein’s field equations</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rstb.1970.0025'">Concluding remarks</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rspa.1914.0053'">On Protection from Lightning and the Range of Protection afforded by Lightning Rods</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rstl.1717.0016'">Figure</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rsta.1969.0038'">CORRIGENDUM - Phil.Trans. A 264, p. 107, line 3 of title.</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rstl.1702.0072'">Advertisement</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rspa.1939.0156'">Structure and thermal properties</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rstl.1683.0001'">ERRATA Page. 33. l. 1. read recruiting p. 35 l.</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rspl.1896.0001'">Erratum P. 313, line 23.</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rspl.1894.0123'">Errata Proceedings, Vol. LVII. On page 369</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rspa.1949.0082'">Cover</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rspa.1955.0162'">Cover</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rspa.1948.0046'">Cover</xsl:when>
            <xsl:when test="//article-meta/article-id[@pub-id-type='doi']='10.1098/rstl.1670.0073'">Figures</xsl:when>
        </xsl:choose>
    </xsl:variable>
   
    <!-- TEI document structure, creation of main header components, front (summary), body, and back -->
    <xsl:template match="article[front] | article[pubfm] | article[suppfm] | headerx | art">
        <TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="@xml:lang">
                    <xsl:choose>
                        <xsl:when test="normalize-space(//article/@xml:lang)='IW'"><xsl:attribute name="xml:lang">HE</xsl:attribute></xsl:when>
                        <xsl:when test="normalize-space(//article/@xml:lang)='fn'"><xsl:attribute name="xml:lang">EN</xsl:attribute></xsl:when>
                        <!-- sage-->
                        <xsl:when test="//article-id[@pub-id-type='doi']='10.1177/053901846800700309'"><xsl:attribute name="xml:lang">fr</xsl:attribute></xsl:when>
                        <xsl:otherwise>
                            <xsl:copy-of select="@xml:lang"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <xsl:choose>
                            <xsl:when test="$repriseTitreVide!=''"><title level="a" type="main"><xsl:value-of select="$repriseTitreVide"/></title></xsl:when>
                            <xsl:when test="//article/front/article-meta/title-group/article-title[string-length() &gt; 0] |//fm/atl[string-length() &gt; 0]">
                                <xsl:apply-templates select="//article/front/article-meta/title-group/article-title | //fm/atl "/>
                            </xsl:when>
                            <!-- SG: reprise du titre principal dans left si seulement indication 'Book Reviews/Comptes rendus' dans right -->
                            <xsl:when test="contains(//front/article-meta/title-group/alt-title[@alt-title-type='right-running'],'Book Reviews/Comptes rendus') or contains(//front/article-meta/title-group/alt-title[@alt-title-type='right-running'],'Book Reviews / Comptes rendus')">
                                <!--cambridge : reprise du titre dans product/source  -->
                                <xsl:choose>
                                    <xsl:when test="//front/article-meta/product/source[string-length() &gt; 0]">
                                        <title level="a" type="main">
                                        <xsl:text>Review of "</xsl:text>
                                        <xsl:value-of select="//front/article-meta/product/source"/>
                                        <xsl:text>"</xsl:text>
                                        </title>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <title level="a" type="main">
                                        <xsl:value-of select="//front/article-meta/title-group/alt-title[@alt-title-type='left-running']"/>
                                        </title>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:if test="//front/article-meta/title-group/alt-title[@alt-title-type='right-running'][string-length() &gt; 0]">
                                    <title level="a" type="main">
                                    <xsl:value-of select="//front/article-meta/title-group/alt-title[@alt-title-type='right-running']"/>
                                    </title>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="//fm/atl ='' and //pubfm/categtxt[string-length() &gt; 0]">
                                        <title level="a" type="main">
                                        <xsl:value-of select="//pubfm/categtxt"/>
                                        </title>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="$codeGenreNature[string-length() &gt; 0]">
                                                <title level="a" type="main">
                                                <xsl:value-of select="$codeGenreNature"/>
                                                </title>
                                            </xsl:when>
                                            <xsl:when test="/article/front/article-meta/article-categories/subj-group[@subj-group-type='heading']/subject[string-length() &gt; 0]">
                                                <title level="a" type="main">
                                                    <xsl:value-of select="/article/front/article-meta/article-categories/subj-group[@subj-group-type='heading'][1]/subject"/>
                                                </title>
                                            </xsl:when>
                                            <xsl:otherwise><title/></xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="/article/front/article-meta/article-id[@pub-id-type='publisher-id'][string-length()&gt; 0] and //publisher-name='Oxford University Press'">
                                    <xsl:value-of select="/article/front/article-meta/article-id[@pub-id-type='publisher-id']"/>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="//art/fm/atl/sbt">
                            <title level="a" type="sub">
                                <xsl:value-of select="//art/fm/atl/sbt"/>
                            </title>
                        </xsl:if>  
                        <!-- SG - informations book-reviews-->
                        <xsl:if test="fm/rvwinfo">
                            <xsl:apply-templates select="fm/rvwinfo"/>
                        </xsl:if>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <xsl:if test="front/journal-meta/publisher">
                            <xsl:apply-templates select="front/journal-meta/publisher/*"/>
                        </xsl:if>
                        <xsl:if test="suppfm/sponsor">
                            <distributor resp="{suppfm/sponsor/@type}">
                                <xsl:value-of select="suppfm/sponsor"/>
                            </distributor>
                        </xsl:if>
                        <xsl:if test="suppfm/parent/cpg/cpn |pubfm/cpg/cpn">
                            <xsl:choose>
                                <xsl:when test="suppfm/parent/cpg/cpn |pubfm/cpg/cpn='Nature Publishing Group'">
                                    <publisher ref="https://scientific-publisher.data.istex.fr">
                                        <xsl:value-of select="suppfm/parent/cpg/cpn|pubfm/cpg/cpn"/>
                                    </publisher>
                                </xsl:when>
                                <xsl:otherwise>
                                    <publisher ref="https://scientific-publisher.data.istex.fr">
                                        <xsl:value-of select="suppfm/parent/cpg/cpn|pubfm/cpg/cpn"/>
                                    </publisher>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <xsl:if test="front/article-meta/article-categories/subj-group[@subj-group-type='access-type']/compound-subject/compound-subject-part[@content-type='code']='access-type-free'">
                            <availability status="free">
                                <licence>Open Access</licence>
                            </availability>
                        </xsl:if>
                        <xsl:if test="not(front/article-meta/permissions) and front/article-meta/copyright-statement">
                            <availability>
                                <xsl:apply-templates select="front/article-meta/copyright-statement"/>
                            </availability>
                            <xsl:apply-templates select="front/article-meta/copyright-year"/>
                        </xsl:if>
                        <xsl:if test="front/article-meta/custom-meta-wrap/custom-meta[string(meta-name) = 'unlocked' and string(meta-value) = 'Yes']">
                            <availability status="free">
                                <p>Open Access</p>
                            </availability>
                        </xsl:if>
                        <xsl:if test="front/article-meta/open-access[string(.) = 'YES']">
                            <availability status="free">
                                <p>Open Access</p>
                            </availability>
                        </xsl:if>
                        <xsl:if test="normalize-space(front/article-meta/permissions/copyright-statement) or normalize-space(//permissions/license) or normalize-space(front/article-meta/permissions/copyright-holder) or pubfm/cpg/cpn">
                            <availability>
                                <xsl:if test="//permissions/license[@license-type='open-access']">
                                    <xsl:attribute name="status">free</xsl:attribute>
                                    <xsl:if test="//permissions/license/@xlink:href!=''">
                                        <xsl:attribute name="source">
                                            <xsl:value-of select="//permissions/license/@xlink:href"/>
                                        </xsl:attribute>
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="//permissions/ali:free_to_read">
                                    <xsl:attribute name="status">free</xsl:attribute>
                                    <licence>Open Access</licence>
                                </xsl:if>
                                <xsl:apply-templates select="front/article-meta/permissions/copyright-statement"/>
                                <xsl:apply-templates select="front/article-meta/permissions/copyright-holder | pubfm/cpg/cpn"/>
                                <xsl:if test="//permissions/license/license-p">
                                    <p>
                                        <xsl:apply-templates select="front/article-meta/permissions/license/license-p"/>
                                    </p>
                                </xsl:if>
                                <xsl:if test="//permissions/license/p">
                                    <p>
                                        <xsl:apply-templates select="front/article-meta/permissions/license/p"/>
                                    </p>
                                </xsl:if>
                            </availability>
                        </xsl:if>
                        <xsl:if test="suppfm/parent/cpg/cpy">
                            <date when="{suppfm/parent/cpg/cpy}"/>
                        </xsl:if>
                        <xsl:if test="//art/coverdate/@yr">
                            <publisher>The Royal Society of London</publisher>
                            <pubPlace>London, UK</pubPlace>
                            <date type="published" when="{//art/coverdate/@yr}"/>
                        </xsl:if>
                        <xsl:if test="pubfm/cpg/cpy">
                            <date when="{pubfm/cpg/cpy}">
                                <xsl:value-of select="pubfm/cpg/cpy"/>
                            </date>
                        </xsl:if>
                        <xsl:apply-templates select="front/article-meta/pub-date"/>
                        <xsl:apply-templates select="front/article-meta/permissions/copyright-year"/>
                    </publicationStmt>
                    <!-- SG - ajout du codeGenre article et revue -->
                    <notesStmt>
                        <!-- niveau article / chapter -->
                        <note type="content-type">
                            <xsl:attribute name="source">
                                <xsl:value-of select="$codeGenre2"/>
                            </xsl:attribute>
                            <xsl:attribute name="scheme">
                                <xsl:value-of select="$codeGenreArk2"/>
                            </xsl:attribute>
                            <xsl:value-of select="$codeGenre"/>
                        </note>
                        <!-- niveau revue / book -->
                        <xsl:choose>
                            <xsl:when test="//publicationMeta/isbn[string-length() &gt; 0] and //publicationMeta/issn">
                                <note type="publication-type">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//article/front/journal-meta/journal-id[@journal-id-type='series'] |//rsc:article/rscfront/rscjournal-meta/rscjournal-id[@journal-id-type='series'][string-length() &gt; 0] and //article/front/journal-meta/journal-id[@journal-id-type='isbn'] |//rsc:article/rscfront/rscjournal-meta/rscjournal-id[@journal-id-type='isbn'][string-length() &gt; 0]">
                                <note type="publication-type">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//article-meta/isbn[string-length() &gt; 0] and //journal-meta/issn[string-length() &gt; 0]">
                                <note type="publication-type">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//journal-meta/isbn[string-length() &gt; 0] and //journal-meta/issn [string-length() &gt; 0]">
                                <note type="publication-type">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//journal-meta/isbn[string-length() &gt; 0] and not(//journal-meta/issn)">
                                <note type="publication-type">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                    <xsl:text>book</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//journal-meta/issn[@pub-type='isbn'][string-length() &gt; 0] and contains(//journal-meta/issn/@pub-type,'pub')[string-length() &gt; 0]">
                                <note type="publication-type">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//publicationMeta/isbn[string-length() &gt; 0] and not(//publicationMeta/issn)">
                                <note type="publication-type">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                    <xsl:text>book</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:otherwise>
                                <note type="publication-type">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0GLKJH51-B</xsl:attribute>
                                    <xsl:text>journal</xsl:text>
                                </note>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="front/article-meta/volume-id">
                                <xsl:apply-templates select="front/article-meta/volume-id"/>
                        </xsl:if>
                    </notesStmt>
                   
                    <sourceDesc>
                        <xsl:apply-templates select="front | pubfm | suppfm" mode="sourceDesc"/>
                    </sourceDesc>
                </fileDesc>
                <!-- versionning -->
                <xsl:call-template name="insertVersion"/>
                <!-- ProfileDesc -->
                <xsl:if test="front/article-meta/abstract or front/article-meta/kwd-group or bdy/fp or fm/abs or fm/fp or //pubfm/subject or //suppfm/subject or @xml:lang or front/article-meta/article-categories">
                    <profileDesc>
                        <!-- karger -->
                        <!-- PL: abstract is moved from <front> to here -->
                        <xsl:apply-templates select="front/article-meta/abstract | bdy/fp | fm/abs"/>
                        <xsl:apply-templates select="front/article-meta/trans-abstract| fm/fp | fm/execsumm | fm/websumm"/>
                        <!-- SG NLM subject -->
                        <xsl:if test="front/article-meta/article-categories/subj-group/subject[string-length()&gt; 0]">
                            <textClass ana="subject">
                                <xsl:apply-templates select="front/article-meta/article-categories/subj-group"/>
                            </textClass>
                        </xsl:if>
                        <xsl:if test="pubfm/subject">
                            <textClass ana="subject">
                                <xsl:apply-templates select="pubfm/subject"/>
                            </textClass>
                        </xsl:if>
                        <xsl:if test="suppfm/subject">
                            <textClass ana="subject">
                                <xsl:apply-templates select="suppfm/subject"/>
                            </textClass>
                        </xsl:if>
                        <xsl:apply-templates select="front/article-meta/kwd-group"/>
                        <!-- language -->
                        <xsl:variable name="langNLM">
                            <xsl:choose>
                                            <xsl:when test="normalize-space(//article/@xml:lang)='IW'">he</xsl:when>
                                            <xsl:when test="normalize-space(//article/@xml:lang)='fn'">en</xsl:when>
                                            <xsl:when test="//front/article-meta/article-id[@pub-id-type='other']='jnnp;68/2/256b'">en</xsl:when>
                                            <xsl:when test="//front/article-meta/article-id[@pub-id-type='other']='postgradmedj;76/891/64a'">en</xsl:when>
                                            <!--OUP-->
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/kni221'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp063'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn043'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/kni214'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/58.4.471'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/57.2.181'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp201'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knl110'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knl077'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/56.1.45'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn131'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/58.4.485'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp015'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp142'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp200'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq004'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm283'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp065'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm258'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knl171'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn128'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/57.1.11'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp128'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/57.4.463'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq003'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/58.1.61'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm257'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/kni218'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/57.3.335'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/57.1.39'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm289'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn024'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knl076'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/VII.3.223'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn065'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp125'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn018'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/VII.2.147'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm243'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/kni411'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq037'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knl108'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/56.1.15'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XLVI.4.395'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/X.3.231'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/kni288'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/VII.2.140'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IX.3.227'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.3.201'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp273'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XLIX.2.155'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/58.4.552'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp074'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp272'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq055'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq050'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp257'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq026'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XI.1.28'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XX.3.253'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XVI.1.1'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/L.1.35'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.3.219'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXVIII.2.146'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXIII.4.362'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XLIV.1.34'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LIII.4.405'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXXI.3.294'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXVII.1.30'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.4.335'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXIII.4.378'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LV.2.167'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/L.4.413'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XIX.2.111'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXV.3.281'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXVI.4.405'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LII.4.385'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LII.4.425'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/VII.4.293'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XIII.1.39'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XI.4.293'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/V.2.126'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.4.301'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XIII.2.125'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LV.4.499'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/ijl/ecp021'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/58.4.471'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/57.2.181'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp201'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knl110'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knl077'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn131'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/58.4.485'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp015'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp142'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp200'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq004'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm283'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp065'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm258'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knl171'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn128'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/57.1.11'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knl111'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp128'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/57.4.463'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq003'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/58.1.61'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm257'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/kni218'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/57.3.335'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/57.1.39'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm289'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm279'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn024'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LII.2.162'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/VII.3.223'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp125'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/57.3.349'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/kni411'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq037'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knl108'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/56.1.15'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XLVI.4.395'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/kni288'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/VII.2.140'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IX.3.227'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XVI.4.324'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.3.201'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp273'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XLIX.2.155'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq055'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq050'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp272'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq026'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XI.1.28'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp006'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XX.3.253'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XVI.1.1'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/L.1.35'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXIII.4.378'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LV.2.167'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/L.4.413'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXV.3.281'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXX.1.43'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXVI.4.405'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq021'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XX.2.151'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LII.4.385'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LII.4.425'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/VII.4.293'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XIII.2.125'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.3.219'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXVIII.2.146'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXIII.4.362'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XLIV.1.34'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LIII.4.405'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXXI.3.294'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXVII.1.30'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XIII.1.39'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XI.4.293'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/V.2.126'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.4.301'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LV.4.499'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XIII.2.135'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp242'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XIII.2.113'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp117'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp087'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq091'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp170'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp054'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp255'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq081'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/V.3.253'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XLVII.3.295'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp224'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXI.3.220'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/V.1.40'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq009'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXVII.4.429'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp139'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXXI.2.129'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXX.4.393'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XVI.2.142'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp024'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp134'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp133'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/L.3.275'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp207'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XIX.1.1'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/1.1.27'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/VIII.3.250'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXXIX.3.305'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LIV.3.277'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.4.345'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LIV.2.177'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/V.4.335'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn215'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IX.4.304'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XLVI.2.160'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/58.4.580'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/1.1.37'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq124'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXVII.1.1'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.3.208'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.3.216'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.4.315'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXVIII.4.385'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXIX.3.257'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/X.1.32'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/LIV.2.154'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq145'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp106'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXXIV.2.168'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp201'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp200'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp207'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp224'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='doi:10.1093/fs/knp242'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='doi:10.1093/fs/knp255'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq004'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq003'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp273'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq021'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp257'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq026'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq009'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp272'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq037'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq055'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq081'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq091'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq050'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq145'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq128'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq124'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq152'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knq114'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn128'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn131'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn191'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn144'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn175'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp015'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp024'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn215'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp038'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp006'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp063'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp065'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp106'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp054'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp087'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp074'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp092'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp128'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp142'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp125'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp133'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp170'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp139'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp134'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knp117'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm243'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm291'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm258'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm257'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm310'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm343'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm309'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm304'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn024'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn035'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn018'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn009'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn043'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knn079'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knl189'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knl227'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm018'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm027'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/knm043'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/1.1.27'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/1.1.37'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/1.2.95'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/1.3.218'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/1.3.252'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/1.4.343'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/1.4.350'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.3.280'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.4.301'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.4.315'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.4.324'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.4.341'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.4.356'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.4.362'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.4.370'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.1.1'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.3.223'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.3.247'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/II.3.256'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.1.67'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.1.78'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.2.101'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.2.163'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.2.166'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.3.201'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.3.212'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.3.219'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.4.345'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.4.354'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.4.355'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.4.378'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/III.4.380'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.1.38'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.1.72'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.1.80'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.1.85'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.1.89'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.2.156'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.2.159'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.2.166'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.2.171'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.3.208'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.3.216'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.4.306'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.4.355'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/IV.4.357'">fr</xsl:when>
                                            <!-- sage-->
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1177/053901846800700309'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1093/fs/XXXIV.2.168'">fr</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1177/001458580904300109'">IT</xsl:when>
                                            <xsl:when test="//article-id[@pub-id-type='doi']='10.1177/001458587901300403'">fr</xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                    <xsl:when test="@xml:lang[string-length()&gt; 0]">
                                                        <xsl:value-of select="translate(@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                    </xsl:when>
                                                    <xsl:when test="@language[string-length()&gt; 0]">
                                                        <xsl:value-of select="translate(@language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>en</xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                        </xsl:variable>
                            <langUsage>
                                <language>
                                    <xsl:attribute name="ident">
                                        <xsl:value-of select="$langNLM"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$langNLM"/>
                                </language>
                            </langUsage>
                    </profileDesc>
                </xsl:if>
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
                    <xsl:if test="//chghst/chg[@chgtype='corr']">
                        <xsl:apply-templates select="//chghst/chg" mode="correction"/>
                    </xsl:if>
                </revisionDesc>
            </teiHeader>
            <text>
                <!-- PL: abstract is moved to <abstract> under <profileDesc> -->
                <!--xsl:if test="front/article-meta/abstract">
                    <front>
                        <xsl:apply-templates select="front/article-meta/abstract"/>
                    </front>
                </xsl:if-->
                <!-- No test if made for body since it is considered a mandatory element -->
                <xsl:choose>
                    <xsl:when test="body/* | bdy/p | bdy/sec | bdy/corres/*|article/floats-group">
                        <body>
                            <xsl:apply-templates select="body/*"/>
                            <xsl:apply-templates select="bdy/*except(bdy/fp)"/>
                            <xsl:apply-templates select="bm/objects/*"/>
                            <xsl:apply-templates select="//article/floats-group"/>
                        </body>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <!-- pour sage le contenu du body non structurée est contenu dans ce champ
                            <xsl:when test="not(body) and //custom-meta[meta-name='search-text']/meta-value [string-length() &gt; 0]">
                                <body>
                                    <div>
                                        <p>
                                            <xsl:value-of select="//custom-meta[meta-name='search-text']/meta-value"/>
                                        </p>
                                    </div>
                                </body>
                            </xsl:when> -->
                            <xsl:when test="not(//sub-article)">
                                <body>
                                    <div>
                                        <xsl:choose>
                                            <!-- SG body ne contenant pas de sous-balise (ex: Nature_headerDTD_E55900BEA1B96187B075C3707A439F215C3EF07C.xml)-->
                                            <xsl:when test="//headerx/bdy">
                                                <p>
                                                    <xsl:value-of select="bdy"/>
                                                </p>
                                            </xsl:when>
                                            <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                                                <p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <p/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </div>
                                </body>
                            </xsl:when>
                            <xsl:otherwise>
                                <body>
                                <div>
                                    <xsl:choose>
                                        <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                                            <p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <p/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </div>
                                </body>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="back [string-length() &gt; 0] | bm [string-length() &gt; 0]|front/article-meta/product[string-length() &gt; 0]">
                    <back>
                        <!-- SG - source des book-reviews, données qualifiés de production chez Cambridge -->
                        <xsl:apply-templates select="front/article-meta/product"/>
                        <xsl:apply-templates select="back/* |bm/ack | bm/bibl"/>
                    </back>
                </xsl:if>
            </text>
            <xsl:if test="sub-article | response">
                <text>
                    <group>
                        <xsl:apply-templates select="sub-article | response"/>
                    </group>
                </text>
            </xsl:if>
        </TEI>
    </xsl:template>
    
    <!-- TEI document structure, creation of main header components, front (summary), body, and back -->
    <xsl:template match="sub-article | response">
        <text type="sub-article">
            <xsl:if test="@xml:lang">
                <xsl:copy-of select="@xml:lang"/>
            </xsl:if>
            <front>
            <listBibl>
                <biblFull>
                    <fileDesc>
                        <titleStmt>
                            <xsl:apply-templates select="front/article-meta/title-group/article-title | fm/atl"/>
                            <xsl:apply-templates select="front/article-meta/fn-group/fn"/>
                        </titleStmt>
                        <!-- PL: pour les suppinfo, sous fileDesc/editionStmt/edition/ref, solution de HAL --> 
                        <xsl:if test="pubfm/suppinfo">
                            <editionStmt>
                                <edition>
                                    <xsl:attribute name="xml:id">
                                        <xsl:value-of select="pubfm/suppinfo/@id"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="pubfm/suppinfo/suppobj"/>
                                </edition>	
                            </editionStmt>
                        </xsl:if>
                        <xsl:if test="suppfm/suppinfo">
                            <editionStmt>
                                <edition>
                                    <xsl:attribute name="xml:id">
                                        <xsl:value-of select="suppfm/suppinfo/@id"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="suppfm/suppinfo/suppobj"/>
                                </edition>	
                            </editionStmt>
                        </xsl:if>
                        <publicationStmt>
                            <authority>ISTEX</authority>
                            <xsl:if test="front/journal-meta/publisher">
                                <xsl:apply-templates select="front/journal-meta/publisher/*"/>
                            </xsl:if>
                            <xsl:if test="not(front/journal-meta/publisher) and //cpn='Nature Publishing Group'">
                                <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-12K39592-G">Nature Publishing Group</publisher>
                            </xsl:if>
                            <xsl:apply-templates select="front/article-meta/permissions/*"/>
                            <xsl:if test="not(front/article-meta/permissions)">
                                <xsl:apply-templates select="front/article-meta/copyright-statement | pubfm/cpg/cpn | suppfm/cpg/cpn"/>
                                <xsl:apply-templates select="front/article-meta/copyright-year | pubfm/cpg/cpy | suppfm/cpg/cpy"/>
                            </xsl:if>
                            <xsl:if test="front/article-meta/custom-meta-wrap/custom-meta[string(meta-name) = 'unlocked' and string(meta-value) = 'Yes']">
                                <availability status="free">
                                    <p>Open Access</p>
                                </availability>
                            </xsl:if>
                            <xsl:if test="front/article-meta/open-access[string(.) = 'YES']">
                                <availability status="free">
                                    <p>Open Access</p>
                                </availability>
                            </xsl:if>
                        </publicationStmt>
                        <!-- PL: pour les suppinfo, sous fileDesc/editionStmt/edition/ref, solution de HAL -->
                        <xsl:if test="pubfm/suppinfo">
                            <editionStmt>
                                <edition>
                                    <xsl:attribute name="xml:id">
                                        <xsl:value-of select="pubfm/suppinfo/@id"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="pubfm/suppinfo/suppobj"/>
                                </edition>
                            </editionStmt>
                        </xsl:if>
                        <xsl:if test="suppfm/suppinfo">
                            <editionStmt>
                                <edition>
                                    <xsl:attribute name="xml:id">
                                        <xsl:value-of select="suppfm/suppinfo/@id"/>
                                    </xsl:attribute>
                                    <xsl:apply-templates select="suppfm/suppinfo/suppobj"/>
                                </edition>
                            </editionStmt>
                        </xsl:if>
                        <sourceDesc>
                            <xsl:apply-templates select="front | pubfm | suppfm" mode="sourceDesc"/>
                        </sourceDesc>
                    </fileDesc>
                    <xsl:choose>
                        <xsl:when test="front/article-meta/abstract or front/article-meta/kwd-group or bdy/fp or fm/abs or fm/fp or //pubfm/subject or //suppfm/subject">
                        <profileDesc>
                            <!-- PL: abstract is moved from <front> to here -->
                            <xsl:if test="front/article-meta/abstract | bdy/fp | fm/abs | fm/fp | fm/execsumm | fm/websumm">
                                <xsl:apply-templates select="front/article-meta/abstract | bdy/fp | fm/abs | fm/fp | fm/execsumm | fm/websumm"/>
                            </xsl:if>
                            <!-- SG NLM subject -->
                            <xsl:if test="pubfm/subject">
                                <textClass ana="subject">
                                    <xsl:apply-templates select="pubfm/subject"/>
                                </textClass>
                            </xsl:if>
                            <xsl:if test="suppfm/subject">
                                <textClass ana="subject">
                                    <xsl:apply-templates select="suppfm/subject"/>
                                </textClass>
                            </xsl:if>
                            <xsl:apply-templates select="front/article-meta/kwd-group"/>
                        </profileDesc>
                        </xsl:when>
                        <xsl:otherwise>
                            <profileDesc/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="front/article-meta/history">
                        <xsl:apply-templates select="front/article-meta/history"/>
                    </xsl:if>
                </biblFull>
            </listBibl>
            </front>
            <body>
                        <xsl:choose>
                            <xsl:when test="body/* | bdy/p | bdy/sec | bdy/corres/*">
                                <xsl:apply-templates select="body/* | bdy/p | bdy/sec | bdy/corres/*"/>
                                <xsl:apply-templates select="bm/objects/*"/>
                                <!-- SG body ne contenant pas de sous-balise (ex: Nature_headerDTD_E55900BEA1B96187B075C3707A439F215C3EF07C.xml)-->
                                <xsl:if test="//headerx/bdy">
                                    <div>
                                        <p>
                                            <xsl:value-of select="//headerx/bdy"/>
                                        </p>
                                    </div>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test="sub-article | response">
                                <xsl:apply-templates select="sub-article | response"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <div>
                                    <p/>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>
                    </body>
                    <xsl:if test="back | bm">
                        <back>
                            <xsl:apply-templates select="back/* | bm/ack | bm/bibl"/>
                        </back>
                    </xsl:if>
        </text>
    </xsl:template>

    <!-- We do not care about components from <article-meta> which are 
    not explicitely addressed by means of an XPath in another template-->
    <xsl:template match="article-meta"/>

    <!-- Building the sourceDesc bibliographical representation -->
    <xsl:template match="front | pubfm | suppfm | fm" mode="sourceDesc">
        <biblStruct>
            <xsl:variable name="articleType" select="/article/@article-type"/>
            <xsl:if test="$articleType != ''">
                <xsl:choose>
                    <xsl:when test="$articleType = 'research-article'">
                        <xsl:attribute name="type">article</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$articleType = 'review-article'">
                        <xsl:attribute name="type">article</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$articleType = 'correction'">
                        <xsl:attribute name="type">erratum</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$articleType = 'other'">
                        <xsl:attribute name="type">other</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$articleType = 'book-review'">
                        <xsl:attribute name="type">bookReview</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$articleType = 'books-received'">
                        <xsl:attribute name="type">books-received</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$articleType = 'editorial'">
                        <xsl:attribute name="type">editorial</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$articleType = 'brief-report'">
                        <xsl:attribute name="type">brief-report</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="$articleType = 'letter'">
                        <xsl:attribute name="type">letter</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:message terminate="no">article-type inconnu: <xsl:value-of select="$articleType"/></xsl:message>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>

            <analytic>
                <!-- Cambridge - OUP ... ajout corrections des titres vides -->
                <xsl:choose>
                    <xsl:when test="$repriseTitreVide !=''">
                        <title level="a" type="main">
                            <xsl:value-of select="$repriseTitreVide"/>
                        </title>
                    </xsl:when>
                    <xsl:when test="//fm/atl">
                        <xsl:apply-templates select="//fm/atl"/>
                        <xsl:if test="//fm/rvwinfo">
                            <xsl:apply-templates select="//fm/rvwinfo"/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="//article-title">
                        <xsl:apply-templates select="article-meta/title-group/*"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- Title information related to the paper goes here -->
                        <xsl:apply-templates select="article-meta/title-group/*"/>
                        <xsl:apply-templates select="article-meta/title-group/fn-group/*"/>
                        <xsl:apply-templates select="//fm/atl"/>
                        <!-- SG - informations book-reviews-->
                        <xsl:if test="//fm/rvwinfo">
                            <xsl:apply-templates select="//fm/rvwinfo"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <!-- All authors are included here -->
                <xsl:choose>
                    <xsl:when test="article-meta/contrib-group/contrib[@contrib-type='author']">
                        <xsl:apply-templates select="article-meta/contrib-group/contrib[@contrib-type='author']"/>
                    </xsl:when>
                    <xsl:when test="//article-meta/contrib-group/contrib[@contrib-type='editor']"/>
                    <xsl:otherwise>
                                <xsl:apply-templates select="article-meta/contrib-group/*[name() != 'aff']"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="/article/fm/aug | /headerx/fm/aug | /art/fm/aug">
                    <xsl:apply-templates select="/article/fm/aug/* except(//aff)| /headerx/fm/aug/* except(//aff) | /art/fm/aug/*"/>
                </xsl:if>
                <!--<xsl:apply-templates select="//article/fm/aug/group"/>-->
                <xsl:if test="//bdy/corres/aug">
                    <xsl:apply-templates select="//bdy/corres/aug/*"/>
                </xsl:if>
                <!-- cas particulier 26F643143005AA7642AD684F8B69A743D0117A8B.xml 
                        biographies hors contrib-->
                <xsl:for-each select="//article-meta/aff">
                    <xsl:if test="contains(@id,'cor')">
                        <author>
                            <xsl:attribute name="corresp">
                                <xsl:variable name="nettoie">
                                    <xsl:value-of select="translate(@id,'cor','')"/>
                                </xsl:variable>
                                <xsl:variable name="nettoie2">
                                    <xsl:value-of select="translate($nettoie,'123456789','012345678')"/>
                                </xsl:variable>
                                <xsl:text>#author-000</xsl:text>
                                <xsl:value-of select="$nettoie2"/>
                            </xsl:attribute>
                            <state type="biography">
                                <desc>
                                    <xsl:apply-templates/>
                                </desc>
                            </state>
                        </author>
                    </xsl:if>
                </xsl:for-each>
                
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
                <xsl:apply-templates select="journal-id[@journal-id-type='isbn']"/>
                <xsl:apply-templates select="doi"/>
                <!-- BMJ rattrapage DOI -->
                <xsl:if test="article-meta/article-id[@pub-id-type='url'][string-length() &gt; 0] and not(//article-meta/article-id[@pub-id-type='doi'][string-length() &gt; 0])">
                    <idno>
                        <xsl:attribute name="type">DOI</xsl:attribute>
                        <xsl:value-of select="normalize-space(substring-after(article-meta/article-id[@pub-id-type='url'],'abs/'))"/>
                    </idno>
                </xsl:if>
                <xsl:apply-templates select="article-meta/article-id"/>
                <xsl:apply-templates select="article/@id"/>
                <!-- lien vers les articles corrigés -->
                <xsl:if test="article-meta/related-article/name">
                    <ref type="corrected-article">
                        <xsl:for-each select="article-meta/related-article/name">
                            <name>
                                <xsl:if test="given-names">
                                    <forename>
                                        <xsl:value-of select="given-names"/>
                                    </forename>
                                </xsl:if>
                                <xsl:if test="surname">
                                    <surname>
                                        <xsl:value-of select="surname"/>
                                    </surname>
                                </xsl:if>
                            </name>
                        </xsl:for-each>
                        <xsl:if test="article-meta/related-article/object-id">
                            <idno type="doi">
                                <xsl:value-of select="article-meta/related-article/object-id"/>
                            </idno>
                        </xsl:if>
                        <xsl:value-of select="article-meta/related-article/text()"/>
                    </ref>
                </xsl:if>
            </analytic>
            <monogr>
                <!-- titre manquant Karger-ebooks-->
                <xsl:if test="//isbn='978-3-318-05934-2'">
                    <title level="m" type="main">History of the Basel Institute for Immunology</title>
                </xsl:if>
                <xsl:if test="//isbn='978-3-318-05822-2'">
                    <title level="m" type="main">Well-Being Therapy : Treatment Manual and Clinical Applications</title>
                </xsl:if>
                <xsl:if test="//isbn='978-3-318-06379-0'">
                    <title level="m" type="main">Peritoneal Dialysis Manual : A Guide for Understanding the Treatment</title>
                </xsl:if>
                <xsl:if test="//isbn='978-3-318-06085-0'">
                    <title level="m" type="main">Graves' Orbitopathy</title>
                </xsl:if>
                <xsl:if test="//isbn='978-3-318-06302-8'">
                    <title level="m" type="main">Gastrix</title>
                </xsl:if>
                <xsl:if test="//isbn='978-3-318-02697-9'">
                    <title level="m" type="main">The Craniocervical Syndrome and MRI</title>
                </xsl:if>
                <xsl:if test="//isbn='978-3-318-03004-4'">
                    <title level="m" type="main">Congenital Heart Disease</title>
                </xsl:if>
                <!-- Bloc RSL version dtd highWire -->
                <xsl:if test="//art/@jid|//rsc:art/@jid='roybiogmem'">
                    <title level="j" type="main">Biographical Memoirs of Fellows of the Royal Society</title>
                    <title level="j" type="alt">roybiogmem</title>
                    <idno type="pISSN">0080-4606</idno>
                    <idno type="eISSN">1748-8494</idno>
                </xsl:if>

                <xsl:apply-templates select="journal-meta/journal-title  |journal-meta/journal-title-group/journal-title|journal-meta/journal-title-group/journal-subtitle | jtl | suppmast/jtl | suppmast/suppttl | article-meta/issue-title"/>
                <xsl:apply-templates select="journal-meta/abbrev-journal-title | journal-meta/journal-title-group/abbrev-journal-title"/>
                <xsl:apply-templates select="journal-meta/journal-id"/>
                <xsl:apply-templates select="journal-meta/issue-title"/>
                <xsl:choose>
                    <!-- Karger series-->
                    <xsl:when test="journal-meta/isbn">
                        <xsl:apply-templates select="journal-meta/isbn"/>
                    </xsl:when>
                    <xsl:when test="journal-meta/isbn and journal-meta/issn"/>
                    <!-- OUP -->
                    <!-- JJCO -->
                    <xsl:when test="//issn[@pub-type='epub']='1465-3621'">
                        <idno>
                            <xsl:attribute name="type">pISSN</xsl:attribute>
                            <xsl:text>0368-2811</xsl:text>
                        </idno>
                    </xsl:when>
                    <!-- Journal of Chromatographic Science-->
                    <xsl:when test="//issn[@pub-type='epub']='1945-239X'">
                        <idno>
                            <xsl:attribute name="type">pISSN</xsl:attribute>
                            <xsl:text>0021-9665</xsl:text>
                        </idno>
                    </xsl:when>
                    <!--  Community Development Journa-->
                    <xsl:when test="//issn[@pub-type='epub']='b468-2656'">
                        <idno>
                            <xsl:attribute name="type">pISSN</xsl:attribute>
                            <xsl:text>0010-3802</xsl:text>
                        </idno>
                    </xsl:when>
                    <!-- Philosophia Mathematica -->
                    <xsl:when test="//journal-id[@journal-id-type='publisher-id']='philmat'">
                        <idno>
                            <xsl:attribute name="type">pISSN</xsl:attribute>
                            <xsl:text>0031-8019</xsl:text>
                        </idno>
                    </xsl:when>
                    <xsl:when test="//journal-id[@journal-id-type='publisher-id']='philmat'">
                        <ino>
                            <xsl:attribute name="type">eISSN</xsl:attribute>
                            <xsl:text>1744-6406</xsl:text>
                        </ino>
                    </xsl:when>
                    <!--  Community Development Journa-->
                    <xsl:when test="//issn[@pub-type='epub']='b468-2656'">
                        <idno>
                            <xsl:attribute name="type">eISSN</xsl:attribute>
                            <xsl:text>1468-2656</xsl:text>
                        </idno>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="journal-meta/issn and //journal-id/@journal-id-type='isbn'"/>
                            <xsl:otherwise>
                                <xsl:apply-templates select="journal-meta/issn | issn |parent/issn"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:apply-templates select="journal-meta/issn[@pub-type='isbn'] | //isbn"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="//volume-id[@pub-id-type='isbn']">
                    <idno>
                        <xsl:attribute name="type">ISBN</xsl:attribute>
                        <xsl:value-of select="//volume-id[@pub-id-type='isbn']"/>
                    </idno>
                </xsl:if>
                <!-- Karger reconstruction des DOI au niveau monographie sauf pour 3 ressources-->
                <xsl:if test="//publisher/publisher-name='S. Karger AG'">
                    <xsl:choose>
                        <xsl:when test="//journal-meta/isbn[@content-type='e-isbn']='978-3-318-05445-3'"></xsl:when>
                        <xsl:when test="//journal-meta/isbn[@content-type='e-isbn']='978-3-318-05867-3'"></xsl:when>
                        <xsl:when test="//journal-meta/isbn[@content-type='e-isbn']='978-3-318-06362-2'"></xsl:when>
                        <xsl:otherwise>
                            <idno type="DOI">
                                <xsl:text>10.1159/isbn.</xsl:text>
                                <xsl:value-of select="//journal-meta/isbn[@content-type='e-isbn']"/>
                            </idno>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <!-- author manquant Karger-ebooks suite-->
                <xsl:if test="//isbn='978-3-318-05934-2'">
                    <author>
                        <persName>
                            <surname>Lefkovits</surname>
                            <forename type="first">I</forename>
                        </persName>
                    </author>
                </xsl:if>
                <xsl:if test="//isbn='978-3-318-05822-2'">
                    <author>
                        <persName>
                            <surname>Fava</surname>
                            <forename type="first">GA</forename>
                        </persName>
                    </author>
                </xsl:if>
                <xsl:if test="//isbn='978-3-318-06379-0'">
                    <author>
                        <persName>
                            <surname>Krediet</surname>
                            <forename type="first">RT</forename>
                        </persName>
                    </author>
                    <author>
                        <persName>
                            <surname>Struijk</surname>
                            <forename type="first">DG</forename>
                        </persName>
                    </author>
                    <author>
                        <persName>
                            <surname>van Esch</surname>
                            <forename type="first">S</forename>
                        </persName>
                    </author>
                </xsl:if>
                <xsl:if test="//isbn='978-3-318-06302-8'">
                    <author>
                        <persName>
                            <surname>Rogler</surname>
                            <forename type="first">G</forename>
                        </persName>
                    </author>
                    <author>
                        <persName>
                            <surname>Bauerfeind</surname>
                            <forename type="first">P</forename>
                        </persName>
                    </author>
                    <author>
                        <persName>
                            <surname>Fried</surname>
                            <forename type="first">M</forename>
                        </persName>
                    </author>
                    <author>
                        <persName>
                            <surname>Gubler</surname>
                            <forename type="first">C</forename>
                        </persName>
                    </author>
                    <author>
                        <persName>
                            <surname>Müllhaupt</surname>
                            <forename type="first">B</forename>
                        </persName>
                    </author>
                </xsl:if>
                <xsl:apply-templates select="article-meta/contrib-group/contrib[@contrib-type='editor']"/>
                <xsl:apply-templates select="//conference"/>
                <imprint>
                    <!-- Bloc RSL version dtd highWire -->
                    <xsl:if test="//art/@jid |//rsc:art/@jid='roybiogmem'">
                        <xsl:if test="//art/@vol|//rsc:art/@vol !=0">
                            <biblScope unit="vol">
                                <xsl:value-of select="//art/@vol | //rsc:art/@vol"/>
                            </biblScope>
                        </xsl:if>
                        <xsl:if test="//art/@issue|//rsc:art/@issue !=0">
                            <biblScope unit="issue">
                                <xsl:value-of select="//art/@issue |//rsc:art/@issue"/>
                            </biblScope>
                        </xsl:if>
                        <xsl:if test="//art/@fpage|//rsc:art/@fpage !=0">
                            <biblScope unit="page" from="{//art/@fpage|//rsc:art/@fpage}">
                                <xsl:value-of select="normalize-space(//art/@fpage|//rsc:art/@fpage)"/>
                            </biblScope>
                        </xsl:if>
                        <xsl:if test="//art/@lpage|//rsc:art/@lpage !=0">
                            <biblScope unit="page" to="{//art/@lpage|//rsc:art/@lpage}">
                                <xsl:value-of select="normalize-space(//art/@lpage|//rsc:art/@lpage)"/>
                            </biblScope>
                        </xsl:if>
                        <publisher>The Royal Society of London</publisher>
                        <pubPlace>London, UK</pubPlace>
                        <xsl:choose>
                            <xsl:when test="//art/coverdate/@yr |//rsc:art/rsc:coverdate/@yr">
                                <date type="published" when="{//art/coverdate/@yr|//rsc:art/rsc:coverdate/@yr}"/>
                            </xsl:when>
                            <xsl:when test="//art/copyright/@yr|//rsc:art/rsc:copyright/@yr">
                                <date type="published" when="{//art/copyright/@yr|//rsc:art/rsc:copyright/@yr}"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:if>
                    <!-- suppfm/parent/cpg/cpn |pubfm/cpg/cpn -->
                    <!-- pubfm/cpg/cpy -->
                    <!-- suppfm/cpg/cpy -->
                    <xsl:if test="//suppfm/parent/cpg/cpn |//pubfm/cpg/cpn">
                        <publisher>
                            <xsl:value-of select="//suppfm/parent/cpg/cpn|//pubfm/cpg/cpn"/>
                        </publisher>
                    </xsl:if>
                    <xsl:apply-templates select="journal-meta/publisher/*"/>
                    <xsl:if test="normalize-space(//pubfm/idt)">
                        <xsl:apply-templates select="//pubfm/idt"/>
                    </xsl:if>
                    <xsl:if test="normalize-space(//suppfm/idt)">
                        <xsl:apply-templates select="//suppfm/idt"/>
                    </xsl:if>
                    
                    <xsl:for-each select="article-meta/pub-date">
                        <xsl:message>Current: <xsl:value-of select="@pub-type"/></xsl:message>
                        <xsl:if test="year != '' and year != '0000'">
                            <xsl:message>Pubdate year: <xsl:value-of select="year"/></xsl:message>
                            <xsl:apply-templates select="."/>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:choose>
                        <!-- RSL rattrapage dates de publication erronées-->
                        <xsl:when test="//article-id[@pub-id-type='doi']='10.1098/rspa.1991.0136'"><date type="published">1991</date></xsl:when>
                        <xsl:when test="//article-id[@pub-id-type='doi']='10.1098/rsta.1920.0006'"><date type="published">1920</date></xsl:when>
                    </xsl:choose>
                    <!-- the special date notation <idt>201211</idt> -->
                    <xsl:apply-templates select="idtidt | suppmast/idt"/>
                    <xsl:apply-templates
                        select="
                            article-meta/volume | vol | suppmast/vol | suppmast/iss | article-meta/issue | iss
                            | article-meta/fpage | pp/spn | pp/epn | article-meta/lpage
                            "/>
				    <xsl:if test="normalize-space(//article/front/article-meta/counts/page-count/@count)">
				        <biblScope unit="page-count">
				            <xsl:value-of select="//article/front/article-meta/counts/page-count/@count"/>
				        </biblScope>
				    </xsl:if>
                    <!--SG - ajout nombre de pages -->
                    <xsl:if test="normalize-space(//suppfm/pp/cnt)">
                        <biblScope unit="page-count">
                            <xsl:value-of select="//suppfm/pp/cnt"/>
                        </biblScope>
                    </xsl:if>
                    
				    <xsl:if test="normalize-space(//article/front/article-meta/counts/ref-count/@count)">
				        <biblScope unit="ref-count">
				            <xsl:value-of select="//article/front/article-meta/counts/ref-count/@count"/>
				        </biblScope>
				    </xsl:if>
                    <xsl:if test="normalize-space(//article/front/article-meta/counts/fig-count/@count)">
                        <biblScope unit="fig-count">
                            <xsl:value-of select="//article/front/article-meta/counts/fig-count/@count"/>
                        </biblScope>
                    </xsl:if>
                    <xsl:if test="normalize-space(//article/front/article-meta/counts/table-count/@count)">
                        <biblScope unit="table-count">
                            <xsl:value-of select="//article/front/article-meta/counts/table-count/@count"/>
                        </biblScope>
                    </xsl:if>
                    <!--SG - ajout nombre de mots -->
                        <xsl:if test="normalize-space(//word-count/@count)">
                            <biblScope unit="word-count">
                                <xsl:value-of select="//word-count/@count"/>
                            </biblScope>
                        </xsl:if>
                    
                    <xsl:apply-templates select="copyright-year | cpg/cpy"/>
				</imprint>
            </monogr>
            <!-- rsc-journal niveau series-->
            <xsl:if test="//journal-meta/journal-id[@journal-id-type='book_series']">
                <series>
                    <title level="s" type="main">
                        <xsl:value-of select="//journal-meta/journal-id[@journal-id-type='book_series']"/>
                    </title>
                    <xsl:if test="//journal-meta/journal-id[@journal-id-type='series']">
                        <xsl:if test="//journal-meta/journal-id[@journal-id-type='print']">
                            <idno type="pISSN">
                                <xsl:value-of select="//journal-meta/journal-id[@journal-id-type='print']"/>
                            </idno>
                        </xsl:if>
                        <xsl:if test="//journal-meta/journal-id[@journal-id-type='online']">
                            <idno type="eISSN">
                                <xsl:value-of select="//journal-meta/journal-id[@journal-id-type='online']"/>
                            </idno>
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="//issn and //isbn and //journal-id[@journal-id-type='doi']">
                        <idno type="DOI">
                            <xsl:value-of select="//journal-id[@journal-id-type='doi']"/>
                        </idno>
                    </xsl:if>
                    <xsl:if test="journal-meta/isbn and journal-meta/issn">
                        <xsl:apply-templates select="journal-meta/issn"/>
                    </xsl:if>
                </series>
            </xsl:if>
        </biblStruct>
    </xsl:template>
<!-- SG information book-reviews -->
    <xsl:template match="rvwinfo">
        <title level="a" type="sub">
            <xsl:apply-templates select="rvwpubt"/>
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="pubinfo" mode="rvw"/>
        </title>
    </xsl:template>
    <xsl:template match="rvwpubt">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="pubinfo" mode="rvw">
        <xsl:apply-templates select="node()" mode="rvw"/>
    </xsl:template>
    <xsl:template match="pubaug" mode="rvw">
        <xsl:apply-templates select="pubau" mode="rvw"/>
    </xsl:template>
    <xsl:template match="pubau" mode="rvw">
        <xsl:apply-templates select="node()"/>
    </xsl:template>
    <xsl:template match="ttl">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="fnm" mode="rvw">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="snm" mode="rvw">
        <xsl:apply-templates/>
    </xsl:template>
    <!-- Generic rules for IDs -->
    <xsl:template match="article-id">
        <idno>
            <xsl:attribute name="type">
                <xsl:value-of select="@pub-id-type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    
    <xsl:template match="ArticleId">
        <idno>
            <xsl:attribute name="type">
                <xsl:value-of select="ArticleId"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </idno>
    </xsl:template>

    <!-- +++++++++++++++++++++++++++++++++++++++++++++ -->
    <!-- author related information -->

    <xsl:template match="aug/au | aug/cau | group/au">
        <author>
            <xsl:variable name="i" select="position() - 1"/>
            <xsl:if test="not(//group)">
           <xsl:attribute name="xml:id">
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
                <!--<xsl:variable name="i" select="$i + 1" />-->
            </xsl:attribute>
            </xsl:if>
            <persName>
                <xsl:apply-templates select="* except (bio,corf,orf)"/>
            </persName>
            <!-- PL: biography are put under author -->
            <xsl:if test="bio">
                <xsl:apply-templates select="bio"/>
            </xsl:if>
            <!-- email -->
            <xsl:if test="../caff/coid and corf and corf/@rid">
                <xsl:apply-templates select="../caff[coid[@id = current()/corf/@rid]]" mode="sourceDesc"/>
            </xsl:if>
            <!-- affiliation -->
            <!-- traitement des affiliations -->
            <!-- Pour l'éditeur RSL version highWire.dtd -->
            <xsl:choose>
                <xsl:when test="//aff[@id=current()/following::cross-ref/@refid]">
                    <affiliation>
                        <xsl:value-of select="//aff[@id=current()/following::cross-ref/@refid]"/>
                    </affiliation>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <!-- SG - cas quand les liens auteurs/affiliations sont définis dans <super> ex: nature_headerx_315773a0.xml -->
                <xsl:when test="super">
                    <xsl:for-each select="super">
                        <!-- SG: nettoyage de la balise <super> polluant l'affiliation, ne prendre que le texte -->
                        <xsl:variable name="super">
                            <xsl:value-of select="//aff[super = current()/.]/text()"/>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="$super">
                                <affiliation>
                                    <xsl:value-of select="normalize-space($super)"/>
                                </affiliation>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:when>
                <!-- SG - cas quand les affiliations n'ont pas de liens auteurs/affiliations définis explicitement ex: nature_headerx_315736a0.xml -->
                <xsl:when test="//aff/org and not(//aff/oid)">
                    <xsl:apply-templates select="aff"/>
                </xsl:when>
                <xsl:when test="//cross-ref">
                    <xsl:apply-templates select="aff"/>
                </xsl:when>
                <xsl:when test="../aff and not(../aff/oid)">
                    <affiliation>
                        <xsl:apply-templates select="following-sibling::aff"/>
                    </affiliation>
                </xsl:when>
               <xsl:when test="../aff and not(../aff/oid)">
                    <affiliation>
                        <xsl:apply-templates select="following-sibling::aff"/>
                    </affiliation>
                </xsl:when>
              <xsl:when test="//aff/oid">
                    <xsl:apply-templates select="//aff[oid[@id = current()/orf/@rid]]"/>
              </xsl:when>
                <xsl:when test="//fm/aug/aff/oid">
                    <affiliation>
                        <xsl:variable name="affGroup">
                            <xsl:apply-templates select="//fm/aug/aff[oid[@id = current()/orf/@rid]]" mode="group"/>
                        </xsl:variable>
                        <xsl:value-of select="normalize-space($affGroup)"/>
                    </affiliation>
                </xsl:when>
               <xsl:when test="../aff">
                    <xsl:apply-templates select="aff"/>
                </xsl:when>
            </xsl:choose>
            <xsl:if test="aufnr/@rid">
                <affiliation>
                    <xsl:value-of select="//aufn[@id = current()/aufnr/@rid]"/>
                </affiliation>
            </xsl:if>
            <xsl:if test="//aug/group/groupttl">
                <orgName type="team">
                    <xsl:value-of select="//aug/group/groupttl"/>
                    <xsl:if test="ancestor::group">
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="normalize-space(../groupttl)"/>
                        <xsl:text>)</xsl:text>
                    </xsl:if>
                </orgName>
            </xsl:if>
        </author>
    </xsl:template>
    
   <xsl:template match="aff">
       <xsl:if test="email">
           <xsl:apply-templates select="email"/>
       </xsl:if>
       <xsl:variable name="countSup">
           <xsl:value-of select="count(//aff/sup)"/>
       </xsl:variable>
       <xsl:choose>
           <xsl:when test="./org">
               <affiliation>
                  <xsl:apply-templates select="org"/>
                   <address>
                       <xsl:apply-templates select="street"/>
                       <xsl:apply-templates select="st"/>
                       <xsl:apply-templates select="zip"/>
                       <xsl:apply-templates select="cty"/>
                       <xsl:apply-templates select="cny"/>
                   </address>
               </affiliation>
           </xsl:when>
           <xsl:when test="addr-line">
               <xsl:choose>
                   <xsl:when test="addr-line/institution">
                       <affiliation>
                           <xsl:apply-templates select="addr-line/institution"/>
                           <xsl:if test="addr-line/named-content or addr-line/country !=''">
                               <address>
                                   <xsl:apply-templates select="addr-line/named-content"/>
                                   <xsl:apply-templates select="addr-line/country"/>
                               </address>
                           </xsl:if>
                       </affiliation>
                   </xsl:when>
                   <xsl:when test="addr-line and institution">
                       <!-- voir comme exemple 10.1093/jnci/13.6.1473 -->
                       <affiliation>
                           <xsl:apply-templates select="institution"/>
                           <xsl:if test="addr-line or country">
                               <address>
                                   <xsl:apply-templates select="addr-line"/>
                                   <xsl:apply-templates select="country"/>
                               </address>
                           </xsl:if>
                       </affiliation>
                   </xsl:when>
                 <xsl:when test="../aff">
                       <affiliation>
                           <xsl:choose>
                               <xsl:when test="addr-line">
                                   <address>
                                       <xsl:apply-templates select="addr-line"/>
                                       <xsl:apply-templates select="country"/>
                                   </address>
                               </xsl:when>
                               <xsl:otherwise>
                                   <xsl:call-template name="NLMParseAffiliation">
                                       <xsl:with-param name="theAffil">
                                           <xsl:variable name="nettoie">
                                               <xsl:apply-templates/>
                                           </xsl:variable>
                                           <xsl:value-of select="translate($nettoie,';/','')"/>
                                       </xsl:with-param>
                                   </xsl:call-template>
                               </xsl:otherwise>
                           </xsl:choose>
                       </affiliation>
                   </xsl:when>
                   <xsl:otherwise>
                       <affiliation>
                           <xsl:call-template name="NLMParseAffiliation">
                               <xsl:with-param name="theAffil">
                                   <xsl:variable name="nettoie">
                                       <xsl:apply-templates/>
                                   </xsl:variable>
                                   <xsl:value-of select="translate($nettoie,';/','')"/>
                               </xsl:with-param>
                           </xsl:call-template>
                       </affiliation>
                   </xsl:otherwise>
               </xsl:choose>
           </xsl:when>
          <xsl:when test="institution and institution/addr-line">
               <affiliation>
                   <xsl:apply-templates select="institution" mode="NLM"/>
                   <xsl:if test="addr-line | country">
                   <address>
                       <xsl:apply-templates select="addr-line"/>
                       <xsl:apply-templates select="country"/>
                   </address>
                   </xsl:if>
               </affiliation>
           </xsl:when>
           <xsl:when test="institution and named-content">
               <affiliation>
                   <xsl:apply-templates select="institution" mode="NLM"/>
                       <address>
                           <xsl:apply-templates select="named-content"/>
                           <xsl:apply-templates select="country"/>
                       </address>
               </affiliation>
           </xsl:when>
           <xsl:when test="italic or bold">
               <affiliation>
                   <xsl:call-template name="NLMParseAffiliation">
                       <xsl:with-param name="theAffil">
                           <xsl:variable name="nettoie">
                               <xsl:apply-templates/>
                           </xsl:variable>
                           <xsl:value-of select="translate($nettoie,';/','')"/>
                       </xsl:with-param>
                   </xsl:call-template>
               </affiliation>
           </xsl:when>
           <xsl:when test="institution and country">
               <affiliation>
                   <xsl:apply-templates select="institution"/>
                   <address>
                       <xsl:apply-templates select="addr-line"/>
                       <xsl:apply-templates select="country"/>
                   </address>
               </affiliation>
           </xsl:when>
           <xsl:when test="country and not(institution)">
               <affiliation>
                   <xsl:if test="country and not(addr-line)">
                       <xsl:variable name="countCountry">
                           <xsl:value-of select="count(country)"/>
                       </xsl:variable>
                       <xsl:choose>
                           <xsl:when test="$countCountry =1 ">
                               <xsl:apply-templates/>
                           </xsl:when>
                           <xsl:when test="$countCountry &gt;1 ">
                               <xsl:call-template name="NLMParseAffiliation">
                                   <xsl:with-param name="theAffil">
                                       <xsl:variable name="nettoie">
                                           <xsl:apply-templates/>
                                       </xsl:variable>
                                       <xsl:value-of select="translate($nettoie,';/','')"/>
                                   </xsl:with-param>
                               </xsl:call-template>
                           </xsl:when>
                           <xsl:otherwise>
                               <address>
                                   <addrLine>
                                       <xsl:apply-templates/>
                                   </addrLine>
                                   <country>
                                       <xsl:value-of select="normalize-space(country)"/>
                                   </country>
                               </address>
                           </xsl:otherwise>
                       </xsl:choose>
                   </xsl:if>
               </affiliation>
           </xsl:when>
           <xsl:when test="not(contains(.,','))">
               <affiliation>
                   <xsl:variable name="normalize">
                       <xsl:apply-templates/> 
                   </xsl:variable>
                   <xsl:choose>
                       <xsl:when test="contains(.,'Foundation')
                           or contains(.,'Institut')
                           or contains(.,'Universit')">
                           <orgName type="institution">
                               <xsl:value-of select="normalize-space($normalize)"/>
                           </orgName>
                       </xsl:when>
                       <xsl:otherwise>
                           <xsl:value-of select="normalize-space($normalize)"/>
                       </xsl:otherwise>
                   </xsl:choose>
               </affiliation>
           </xsl:when>
           <xsl:otherwise>
               <xsl:choose>
                   <xsl:when test="institution">
                       <affiliation>
                           <xsl:apply-templates select="institution"/>
                           <xsl:apply-templates select="addr-line"/>
                           <xsl:apply-templates select="country"/>
                       </affiliation>
                   </xsl:when>
                   <xsl:otherwise>
                       <xsl:if test="not(contains(.,'equally')) or not(//fm/aug/cross-ref)">
                           <affiliation>
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
                               <xsl:if test="email">
                                   <email>
                                       <xsl:value-of select="email"/>
                                   </email>
                               </xsl:if>
                           </affiliation>
                       </xsl:if>
                   </xsl:otherwise>
               </xsl:choose>
           </xsl:otherwise>
       </xsl:choose>
    </xsl:template>
    <xsl:template match="aff/sub"/>
   <xsl:template match="org">
           <xsl:call-template name="NLMParseOrg">
               <xsl:with-param name="theOrg">
                   <xsl:value-of select="translate(.,'.;','')"/>
               </xsl:with-param>
           </xsl:call-template>
   </xsl:template>
    <xsl:template match="institution" mode="NLM">
        <xsl:if test=". !=''">
            <xsl:call-template name="NLMParseOrg">
                <xsl:with-param name="theOrg">
                    <xsl:value-of select="translate(.,'.;','')"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <xsl:template name="NLMParseAffiliation">
        <xsl:param name="theAffil"/>
        <xsl:param name="inAddress" select="false()"/>
        <xsl:for-each select="$theAffil">
            <xsl:message>Un bout: <xsl:apply-templates/></xsl:message>
        </xsl:for-each>
        <xsl:variable name="avantVirgule">
            <xsl:choose>
                <xsl:when test="contains($theAffil,',')">
                    <xsl:value-of select="normalize-space(substring-before($theAffil,','))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space($theAffil)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apresVirgule">
            <xsl:value-of select="normalize-space(substring-after($theAffil,','))"/>
        </xsl:variable>
        <xsl:variable name="testOrganisation">
            <xsl:call-template name="identifyOrgLevel">
                <xsl:with-param name="theOrg">
                    <xsl:value-of select="$avantVirgule"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="testCountry">
            <xsl:call-template name="normalizeISOCountry">
                <xsl:with-param name="country" select="$avantVirgule"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="not($inAddress)">
                <xsl:choose>
                    <xsl:when test="$testOrganisation!=''">
                        <orgName>
                            <xsl:attribute name="type">
                                <xsl:value-of select="$testOrganisation"/>
                            </xsl:attribute>
                            <xsl:value-of select="$avantVirgule"/>
                        </orgName>
                        <xsl:if test="$apresVirgule !=''">
                                    <xsl:choose>
                                        <xsl:when test="../institution">
                                            <xsl:call-template name="NLMparseAffiliation">
                                                <xsl:with-param name="theAffil" select="$apresVirgule"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:variable name="address">
                                                <xsl:call-template name="NLMparseAffiliation">
                                                    <xsl:with-param name="theAffil" select="$apresVirgule"/>
                                                </xsl:call-template>
                                            </xsl:variable>
                                            
                                                <xsl:choose>
                                                    <xsl:when test="$address!=''">
                                                        <xsl:call-template name="NLMparseAffiliation">
                                                            <xsl:with-param name="theAffil" select="$apresVirgule"/>
                                                        </xsl:call-template>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <address>
                                                            <addrLine>
                                                                <xsl:value-of select="$apresVirgule"/>
                                                            </addrLine>
                                                        </address>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            
                                        </xsl:otherwise>
                                    </xsl:choose>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="contains(.,'authors contributed equally')">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="$inAddress =true()">
                                        <address>
                                            <xsl:call-template name="NLMParseAffiliation">
                                                <xsl:with-param name="theAffil" select="$theAffil"/>
                                                <xsl:with-param name="inAddress" select="true()"/>
                                            </xsl:call-template>
                                        </address></xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                  <!-- <xsl:when test="$testOrganisation!=''">
                        <orgName>
                            <xsl:attribute name="type">
                                <xsl:value-of select="$testOrganisation"/>
                            </xsl:attribute>
                            <xsl:value-of select="$avantVirgule"/>
                        </orgName>
                        <xsl:if test="$apresVirgule !=''">
                            <xsl:call-template name="NLMParseAffiliation">
                                <xsl:with-param name="theAffil" select="$apresVirgule"/>
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:when>-->
                    <xsl:when test="$testCountry != ''">
                        <country>
                            <xsl:attribute name="key">
                                <xsl:value-of select="$testCountry"/>
                            </xsl:attribute>
                            <xsl:call-template name="normalizeISOCountryName">
                                <xsl:with-param name="country" select="$avantVirgule"/>
                            </xsl:call-template>
                        </country>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="../org">
                                <xsl:call-template name="NLMParseOrg">
                                    <xsl:with-param name="theOrg" select="$apresVirgule"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="$testOrganisation!='' and not($apresVirgule)">
                                <orgName>
                                    <xsl:attribute name="type">
                                        <xsl:value-of select="$testOrganisation"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$avantVirgule"/>
                                </orgName>
                                <xsl:if test="$apresVirgule !=''">
                                    <xsl:call-template name="NLMParseAffiliation">
                                        <xsl:with-param name="theAffil" select="$apresVirgule"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </xsl:when>
                           <!-- <xsl:otherwise>
                                <addrLine>
                                    <xsl:value-of select="$avantVirgule"/>
                                </addrLine>
                            </xsl:otherwise>-->
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="$apresVirgule !=''">
                    <xsl:call-template name="NLMParseAffiliation">
                        <xsl:with-param name="theAffil" select="$apresVirgule"/>
                        <xsl:with-param name="inAddress" select="true()"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="NLMParseOrg">
        <xsl:param name="theOrg"/>
        <xsl:for-each select="$theOrg">
            <xsl:message>Un bout: <xsl:value-of select="."/></xsl:message>
        </xsl:for-each>
        <xsl:variable name="avantVirgule">
            <xsl:choose>
                <xsl:when test="contains($theOrg,',')">
                    <xsl:value-of select="normalize-space(substring-before($theOrg,','))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space($theOrg)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apresVirgule">
            <xsl:choose>
                <xsl:when test="contains($theOrg,',')">
                    <xsl:value-of select="normalize-space(substring-after($theOrg,','))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="testOrganisation">
            <xsl:call-template name="identifyOrgLevel">
                <xsl:with-param name="theOrg">
                    <xsl:value-of select="$avantVirgule"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <orgName>
            <xsl:choose>
                <xsl:when test="$testOrganisation !=''">
                    <xsl:attribute name="type">
                        <xsl:value-of select="$testOrganisation"/>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:value-of select="$avantVirgule"/>
        </orgName>
        <xsl:if test="$apresVirgule !=''">
            <xsl:call-template name="NLMParseOrg">
                <xsl:with-param name="theOrg" select="$apresVirgule"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    <xsl:template match="aug/group">
        <xsl:apply-templates select="group"/>
    </xsl:template>
    <xsl:template match="group">
        <xsl:apply-templates select="au"/>
    </xsl:template>
    <!--SG: reprise biographie des auteurs -->
    <xsl:template match="bio">
        <state>
            <xsl:attribute name="type">biography</xsl:attribute>
            <xsl:apply-templates/>
        </state>
    </xsl:template>

    <xsl:template match="bio/p">
        <desc>
            <xsl:apply-templates/>
        </desc>
    </xsl:template>

    <xsl:template match="caff"/>
    <xsl:template match="au/super"/>

    <!-- author au niveau chapitre -->
    <xsl:template match="contrib" mode="section">
        <name>
            <xsl:apply-templates select="collab"/>
            <xsl:apply-templates select="name"/>
            <xsl:apply-templates select="string-name"/>
            <xsl:if test="//aff/institution and not(//aff/@id)">
                <affiliation>
                    <xsl:if test="//aff/institution">
                        <xsl:apply-templates select="//aff/institution"/>
                    </xsl:if>
                    <xsl:if test="//aff/addr-line | //aff/country">
                        <address>
                            <xsl:apply-templates select="//aff/addr-line"/>
                            <xsl:apply-templates select="//aff/country"/>
                        </address>
                    </xsl:if>
                </affiliation>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="/article/front/article-meta/aff[@id=current()/xref/@rid] |/article/front/article-meta/contrib-group/aff[@id=current()/xref/@rid] ">
                    <xsl:apply-templates select="/article/front/article-meta/aff[@id=current()/xref/@rid] |/article/front/article-meta/contrib-group/aff[@id=current()/xref/@rid] except(/article/front/article-meta/contrib-group/aff[@id=current()/xref/@rid]/label)"/>
                </xsl:when>
                <xsl:when test="ancestor::article-meta and //aff and not(//collab)">
                    <xsl:apply-templates select="//aff"/>
                </xsl:when>
            </xsl:choose>
            <!-- appelle les affiliations complementaires -->
            <xsl:choose>
                <xsl:when test="/article/front/article-meta/author-notes/fn[@id=current()/xref/@rid]">
                    <xsl:apply-templates select="/article/front/article-meta/author-notes/fn[@id=current()/xref/@rid]" mode="author"/>
                </xsl:when>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="/article/front/article-meta/author-notes/corresp[@id=current()/xref/@rid]">
                    <xsl:apply-templates select="/article/front/article-meta/author-notes"/>
                </xsl:when>
                <xsl:when test="/article/front/article-meta/author-notes/corresp and not(/article/front/article-meta/author-notes/corresp/@id)">
                    <xsl:apply-templates select="/article/front/article-meta/author-notes/corresp"/>
                </xsl:when>
            </xsl:choose>
            <xsl:if test="@contrib-type">
                <roleName>
                    <xsl:value-of select="@contrib-type"/>
                </roleName>
            </xsl:if>
        </name>
    </xsl:template>
    <!-- corresp -->
    <xsl:template match="author-notes">
        <xsl:apply-templates select="corresp"/>
    </xsl:template>
   <xsl:template match="corresp">
            <xsl:choose>
                <xsl:when test="email">
                    <xsl:apply-templates select="email"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="corresp">
                        <xsl:apply-templates/>
                    </xsl:variable>
                    <xsl:if test=". !=''">
                    <affiliation role="corresp">
                        <xsl:choose>
                            <xsl:when test="addr-line | country">
                                <xsl:choose>
                                    <xsl:when test="contains(.,'@') and //article-id[@pub-id-type='doi']='10.3166/rig.21.267-295'">
                                       <email>
                                           <xsl:value-of select="normalize-space(translate(.,'*',''))"/>
                                       </email>
                                    </xsl:when>
                                    <xsl:when test="addr-line/named-content/email">
                                        <xsl:apply-templates select="addr-line/named-content/email"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <address>
                                            <xsl:if test="addr-line">
                                                <xsl:apply-templates select="addr-line"/>
                                            </xsl:if>
                                            <xsl:if test="country">
                                                <xsl:apply-templates select="country"/>
                                            </xsl:if>
                                        </address> 
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="normalize-space($corresp)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </affiliation>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
    </xsl:template>
    <xsl:template match="contrib-id">
        <idno type="{translate(@contrib-id-type,' ','')}">
            <xsl:apply-templates/>
        </idno>
</xsl:template>
    <xsl:template match="contrib[@contrib-type = 'editor']">
        <editor>
            <xsl:variable name="i" select="position()-1"/>
            <xsl:variable name="editorNumber">
                <xsl:choose>
                    <xsl:when test="$i &lt; 10">
                        <xsl:value-of select="concat('editor-000', $i)"/>
                    </xsl:when>
                    <xsl:when test="$i &lt; 100">
                        <xsl:value-of select="concat('editor-00', $i)"/>
                    </xsl:when>
                    <xsl:when test="$i &lt; 1000">
                        <xsl:value-of select="concat('editor-0', $i)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('editor-', $i)"/>
                    </xsl:otherwise>
                </xsl:choose> 
            </xsl:variable>
            <xsl:if test="not(ancestor::sub-article)">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="$editorNumber"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </editor>
    </xsl:template>

    <!--<xsl:template match="contrib[@contrib-type = 'biographee']">
        <respStmt>
            <resp>
                <xsl:value-of select="@contrib-type"/>
                <xsl:if test="contrib-id">
                    <idno type="{translate(contrib-id/@contrib-id-type,' ','')}">
                        <xsl:value-of select="contrib-id"/>
                    </idno>
                </xsl:if>
            </resp>
        </respStmt>
    </xsl:template>-->

    <xsl:template match="contrib/address">
        <address>
            <xsl:apply-templates/>
        </address>
    </xsl:template>

    <xsl:template match="dateStruct">
        <date>
            <xsl:value-of select="."/>
        </date>
    </xsl:template>

    <xsl:template match="title-group/fn-group"/>

    <!-- Inline affiliation (embedded in <contrib>) -->
    <xsl:template match="contrib/address">
        <xsl:if test="not(/article/pubfm | /headerx/pubfm | /article/suppfm)">
            <!-- this only apply to NPG articles not containing a pubfm style component -->
            <affiliation>
                <xsl:apply-templates select="*[name(.) != 'addr-line' and name(.) != 'country' and name(.) != 'sup']"/>
                <xsl:choose>
                    <xsl:when test="addr-line | country">
                        <address>
                            <xsl:apply-templates select="addr-line | country"/>
                        </address>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="text()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </affiliation>
        </xsl:if>
    </xsl:template>
   <!--<xsl:template match="contrib/aff">

          <affiliation>
                <xsl:apply-templates/>
                <xsl:choose>
                    <xsl:when test="addr-line | country">
                        <address>
                            <xsl:apply-templates select="addr-line | country"/>
                        </address>
                    </xsl:when>
                    <xsl:otherwise>

                         <xsl:call-template name="NLMaffiliation"/>

                    </xsl:otherwise>
                </xsl:choose>
            </affiliation>
    </xsl:template>-->
   <!--<xsl:template match="author-notes/corresp">
       <xsl:if test="*[name(.) != 'addr-line' and name(.) != 'country'] except(email)">
        <affiliation role="corresp">
            <xsl:apply-templates/>
                <xsl:choose>
                    <xsl:when test="addr-line | country">
                        <address>
                            <xsl:if test="addr-line">
                                <xsl:apply-templates select="addr-line"/>
                            </xsl:if>
                            <xsl:if test="country">
                                <xsl:apply-templates select="country"/>
                            </xsl:if>
                        </address>
                    </xsl:when>
                </xsl:choose>
            </affiliation>
       </xsl:if>
    </xsl:template>-->
    <xsl:template match="caff" mode="sourceDesc">
        <xsl:choose>
            <xsl:when test="email">
                <xsl:apply-templates select="email"/>
            </xsl:when>
            <xsl:otherwise>
                <affiliation>
                    <xsl:value-of select="."/>
                </affiliation>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="aff" mode="sourceDesc">
        <affiliation>
            <xsl:choose>
                <xsl:when test="org | street | cny | zip | cty | st">
                    <xsl:choose>
                        <xsl:when test="org">
                            <xsl:for-each select="org">
                                <orgName type="institution">
                                    <xsl:value-of select="."/>
                                </orgName>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <orgName type="institution">
                                <xsl:variable name="org">
                                    <xsl:apply-templates select="text() except(street | cny | zip | cty | st)"/>
                                </xsl:variable>
                                <xsl:value-of select="normalize-space(substring-before($org,', ,'))"/>
                            </orgName>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="street | cny | zip | cty | st">
                        <address>
		                    <xsl:if test="cny | cty | zip | street">
								<xsl:apply-templates select="cty | cny | zip | street | st"/>
		                    </xsl:if>
		                </address>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </affiliation>
    </xsl:template>
   <!-- <xsl:template match="caff" mode="sourceDesc">
       <xsl:if test="email">
            <email>
                <xsl:value-of select="email"/>
            </email>
        </xsl:if>
        <affiliation>
            <xsl:value-of select="."/> 
        </affiliation>
    </xsl:template>-->
    <xsl:template match="aff/bold">
        <ref>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <xsl:template match="aff/label"/>

    <!-- redirected affiliation by means of basic index (BMJ - 3.0 example) -->
    <xsl:template match="xref[@ref-type = 'aff']">
        <xsl:if test="//aff[@id=current()/@rid]">
            <xsl:if test="//aff[@id=current()/@rid]/email">
                <email><xsl:value-of select="//aff[@id=current()/@rid]/email"/></email>
            </xsl:if>
            <xsl:for-each select="//aff[@id=current()/@rid]">
                <xsl:if test="not(contains(@id,'cor'))">
                    <xsl:if test="not(break)">
                        <affiliation>
                            <xsl:choose>
                                <xsl:when test="institution | addr-line">
                                    <xsl:if test="institution">
                                        <xsl:for-each select="institution">
                                            <orgName type="institution">
                                                <xsl:value-of select="."/>
                                            </orgName>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="addr-line 
                                        |country
                                        |named-content[@content-type='street']
                                        |named-content[@content-type='state']
                                        |named-content[@content-type='postcode']
                                        |named-content[@content-type='city']">
                                        <xsl:for-each select="addr-line">
                                            <xsl:choose>
                                                <xsl:when test="institution
                                                    |country
                                                    |named-content[@content-type='street']
                                                    |named-content[@content-type='state']
                                                    |named-content[@content-type='postbox']
                                                    |named-content[@content-type='postcode']
                                                    |named-content[@content-type='city']">
                                            <xsl:if test="institution">
                                                <xsl:for-each select="institution">
                                                    <orgName type="institution">
                                                        <xsl:value-of select="."/>
                                                    </orgName>
                                                </xsl:for-each>
                                            </xsl:if>
                                            <xsl:if test="country
                                                |named-content[@content-type='street']
                                                |named-content[@content-type='state']
                                                |named-content[@content-type='postbox']
                                                |named-content[@content-type='postcode']
                                                |named-content[@content-type='city']">
                                                <address>
                                                    <xsl:if test="named-content[@content-type='street']">
                                                        <street>
                                                            <xsl:value-of select="named-content[@content-type='street']"/>
                                                        </street>
                                                    </xsl:if>
                                                    <xsl:if test="named-content[@content-type='state']">
                                                        <state>
                                                            <p>
                                                            <xsl:value-of select="named-content[@content-type='state']"/>
                                                            </p>
                                                        </state>
                                                    </xsl:if>
                                                    <xsl:if test="named-content[@content-type='postbox']">
                                                        <postBox>
                                                            <xsl:value-of select="named-content[@content-type='postbox']"/>
                                                        </postBox>
                                                    </xsl:if>
                                                    <xsl:if test="named-content[@content-type='postcode']">
                                                        <postCode>
                                                            <xsl:value-of select="named-content[@content-type='postcode']"/>
                                                        </postCode>
                                                    </xsl:if>
                                                    <xsl:if test="named-content[@content-type='city']">
                                                        <settlement>
                                                            <xsl:value-of select="named-content[@content-type='city']"/>
                                                        </settlement>
                                                    </xsl:if>
                                                    <xsl:if test="country">
                                                        <country>
                                                            <xsl:attribute name="key">
                                                                <xsl:call-template name="normalizeISOCountry">
                                                                    <xsl:with-param name="country" select="."/>
                                                                </xsl:call-template>
                                                            </xsl:attribute>
                                                            <xsl:value-of select="country"/>
                                                        </country>
                                                    </xsl:if>
                                                </address>
                                            </xsl:if>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:if test="contains(.,'Department')">
                                                        <orgName type="department">
                                                            <xsl:value-of select="."/>
                                                        </orgName>
                                                    </xsl:if>
                                                    <xsl:if test="contains(.,'School')">
                                                        <orgName type="department">
                                                            <xsl:value-of select="."/>
                                                        </orgName>
                                                    </xsl:if>
                                                    <!-- sortir les departements des addr-line pour les classer dans orgName -->
                                                    <xsl:variable name="department">
                                                        <xsl:if test="contains(.,'Department')">
                                                                <xsl:value-of select="."/>
                                                        </xsl:if>
                                                    </xsl:variable>
                                                    <xsl:if test="not(contains(.,'Department')or contains(.,'School'))">
                                                    <address>
                                                        <addrLine>
                                                            <xsl:apply-templates/>
                                                        </addrLine>
                                                    <xsl:for-each select="../country">
                                                            <country>
                                                                <xsl:attribute name="key">
                                                                    <xsl:call-template name="normalizeISOCountry">
                                                                        <xsl:with-param name="country" select="."/>
                                                                    </xsl:call-template>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="."/>
                                                            </country>
                                                        </xsl:for-each>
                                                    </address>
                                                    </xsl:if>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                        
                                    </xsl:if>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="NLMaffiliation"/>
                                 </xsl:otherwise>
                            </xsl:choose>
                        </affiliation>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <!-- specific notes attached to authors (PNAS - 3.0 example)-->
    <xsl:template match="xref[@ref-type = 'author-notes']">
        <xsl:variable name="index" select="@rid"/>
        <xsl:variable name="strip-string">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:apply-templates select="ancestor::article-meta/descendant::author-notes/fn[@id = $index]"/>
    </xsl:template>

    <!-- additional information attached to corresponding authors (Cambridge example)-->
    <xsl:template match="xref[@ref-type = 'corresp']">
        <xsl:variable name="index" select="@rid"/>
        <xsl:variable name="refCorresp" select="ancestor::article-meta/descendant::author-notes/corresp[@id = $index]"/>
        <xsl:apply-templates select="$refCorresp/email"/>
        <!-- Cambridge may provide country in "author-notes/corresp" instead of "aff" -->
        <xsl:if test="$refCorresp/country">
            <address>
                <xsl:apply-templates select="$refCorresp/addr-line | $refCorresp/country | $refCorresp/institution"/>
               </address>
        </xsl:if>
    </xsl:template>

    <xsl:template match="author-comment[@content-type = 'short-author-list']">
        <author role="short-author-list">
            <xsl:apply-templates/>
        </author>
    </xsl:template>

    <xsl:template match="author-comment[@content-type = 'short-author-list']/p">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- Macrostructure of main body if the text -->
    <xsl:template match="sec[not(parent::boxed-text)]">
        <xsl:choose>
            <!-- cas particulier taylor et francis
            redondance des informations-->
            <xsl:when test="ref-list"/>
            <xsl:when test="fn-group"/>
            <xsl:otherwise>
                <div>
                    <xsl:if test="@sec-type[string-length()&gt; 0]">
                        <xsl:attribute name="type">
                            <xsl:value-of select="@sec-type"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="parent::boxed-text">
                        <xsl:attribute name="rend">
                            <xsl:text>boxed-text</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:if test="@id[string-length()&gt; 0]">
                        <xsl:attribute name="xml:id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </xsl:if>
                    
                    <xsl:if test="label[string-length()&gt; 0]">
                        <xsl:attribute name="n">
                            <xsl:value-of select="label"/>
                        </xsl:attribute>
                    </xsl:if>
                    
                    <!-- We treat boxed-text as independant divisions right after the current division 
            to avoid getting a division within a paragraph by accident -->
                    <xsl:choose>
                        <xsl:when test="not(descendant::sec) and descendant::boxed-text">
                            <xsl:comment>Boxed-text</xsl:comment>
                            <xsl:apply-templates select="title"/>
                            <xsl:apply-templates select="*except(title)"/>
                            <xsl:apply-templates select="descendant::boxed-text/sec" mode="boxed-text"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="title"/>
                            <xsl:apply-templates select="*except(title)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
            </xsl:otherwise>
        </xsl:choose>
       
    </xsl:template>

    <xsl:template match="sec[parent::boxed-text]">
        <floatingText>
            <xsl:if test="@sec-type">
                <xsl:attribute name="type">
                    <xsl:value-of select="@sec-type"/>
                </xsl:attribute>
            </xsl:if>
            
            <xsl:if test="parent::boxed-text">
                <xsl:attribute name="type">
                    <xsl:text>boxed-text</xsl:text>
                </xsl:attribute>
            </xsl:if>
            
            <xsl:if test="label">
                <xsl:attribute name="n">
                    <xsl:value-of select="label"/>
                </xsl:attribute>
            </xsl:if>
            <body>
                <xsl:apply-templates/>
            </body>
        </floatingText>
    </xsl:template>
    
    <xsl:template match="sec/label"/>
    <xsl:template match="sec-meta">
        <xsl:choose>
            <xsl:when test="contrib-group/contrib">
                <docAuthor>
                    <xsl:apply-templates select="contrib-group/contrib" mode="section"/>
                </docAuthor>
            </xsl:when>
            <xsl:when test="fpage">
                <bibl>
                    <xsl:apply-templates select="fpage"/>
                    <xsl:apply-templates select="lpage"/>
                </bibl>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="sig-block">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="sig">
        <name>
            <xsl:apply-templates/> 
        </name>
    </xsl:template>

    <xsl:template match="boxed-text">
        <figure type="boxed-text">
            <xsl:apply-templates/>
        </figure>
    </xsl:template>

    <xsl:template match="sec[parent::boxed-text]/title">
                <div>
                    <head>
                        <xsl:apply-templates/>
                    </head>
                </div>
    </xsl:template>
    <xsl:template match="sec[parent::boxed-text]/list">
        <div>
            <list type="{@list-type}">
                <xsl:apply-templates/>
            </list>
        </div>
    </xsl:template>
    <xsl:template match="sec[not(parent::boxed-text)]/title">
            <head>
                <xsl:apply-templates/>
            </head>
    </xsl:template>

    <xsl:template match="ack | rsc:ack">
        <div type="acknowledgements">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="ref-list">
        <div type="references">
            <listBibl>
                <xsl:apply-templates/>
            </listBibl>
        </div>
    </xsl:template>

    <xsl:template match="statement">
        <floatingText type="statement">
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <body>
            <xsl:apply-templates/>
            </body>
        </floatingText>
    </xsl:template>

    <xsl:template match="named-content">
        <xsl:choose>
            <xsl:when test="email">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <name>
                    <xsl:if test="@content-type">
                        <xsl:attribute name="type">
                            <xsl:value-of select="@content-type"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </name>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="comment">
        <note type="comment">
            <xsl:apply-templates/>
        </note>
    </xsl:template>

    <!-- The default case (when <abbrev> appears in isolation) -->
    <xsl:template match="abbrev[not(def)]">
        <abbr>
            <xsl:apply-templates/>
        </abbr>
    </xsl:template>

    <xsl:template match="abbrev[def]">
        <choice>
            <abbr>
                <xsl:apply-templates/>
            </abbr>
            <xsl:apply-templates select="def" mode="inTerm"/>
        </choice>
    </xsl:template>

    <!-- Definitions in terms are treated through a dedicated named template -->
    <xsl:template match="abbrev/def"/>

    <!-- When they appear in <term> they need to be treated as <expan>s -->
    <xsl:template match="abbrev/def" mode="inTerm">
        <expan>
            <xsl:apply-templates/>
        </expan>
    </xsl:template>

    <!-- We just get rid of all <p>s in <def>s -->
    <xsl:template match="def/p | rsc:def/rsc:p">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="styled-content">
        <hi>
            <xsl:if test="@style">
                <xsl:attribute name="rend">
                    <xsl:value-of select="@style"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </hi>
    </xsl:template>

    <!-- Quoted passages -->
    <xsl:template match="disp-quote">
        <xsl:choose>
            <xsl:when test="ancestor::abstract">
                <p>
                    <cit>
                        <xsl:if test="attrib">
                            <xsl:attribute name="rend">
                                <xsl:text>block</xsl:text>
                            </xsl:attribute>
                        </xsl:if>
                        <quote>
                            <xsl:apply-templates select="*[not(name() = 'attrib')]"/>
                        </quote>
                        <xsl:apply-templates select="attrib"/>
                    </cit>  
                </p>
            </xsl:when>
            <xsl:otherwise>
                <cit>
                    <xsl:if test="attrib">
                        <xsl:attribute name="rend">
                            <xsl:text>block</xsl:text>
                        </xsl:attribute>
                    </xsl:if>
                    <quote>
                        <xsl:apply-templates select="*[not(name() = 'attrib')]"/>
                    </quote>
                    <xsl:apply-templates select="attrib"/>
                </cit>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>

    <xsl:template match="disp-quote/attrib">
        <bibl>
        <xsl:apply-templates/>
        </bibl>
    </xsl:template>

    <!-- Glossaries -->
    <xsl:template match="glossary">
        <div type="glossary">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="gloss-group">
        <!-- Should be treated like glossaries in V3.0, does not exist any more -->
        <div type="glossary">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="def-list | rsc:def-list">
        <list type="termlist">
            <!-- To be compliant with the ISO style for terms and definitions ;-) -->
            <xsl:apply-templates/>
        </list>
    </xsl:template>

    <xsl:template match="def-item | rsc:def-item">
        <item>
            <!-- To be compliant with the ISO style for terms and definitions ;-) -->
            <xsl:apply-templates/>
        </item>
    </xsl:template>

    <xsl:template match="term | rsc:term">
        <term>
            <!-- To be compliant with the ISO style for terms and definitions ;-) -->
            <xsl:apply-templates/>
        </term>
    </xsl:template>

    <xsl:template match="def|rsc:def">
        <gloss>
            <!-- To be compliant with the ISO style for terms and definitions ;-) -->
            <xsl:apply-templates/>
        </gloss>
    </xsl:template>

    <!-- Lists -->
    <xsl:template match="list |rsc:list">
        <list>
            <xsl:if test="@type">
                <xsl:attribute name="type">
                    <xsl:value-of select="@type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@list-type">
                <xsl:attribute name="type">
                    <xsl:value-of select="@list-type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="li|item|list-item | rsc:li|rsc:item|rsc:list-item">
                <xsl:apply-templates/>
            </xsl:if>
        </list>
    </xsl:template>
    <xsl:template match="list-item |rsc:list-item">
        <item>
            <xsl:apply-templates/>
        </item>
    </xsl:template>

    <!-- Figures -->
    <!-- Figures -->
    <xsl:template match="floats-group">
        <div type="figure">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="fig">
        <figure>
            <xsl:choose>
                <xsl:when test="@id">
                    <xsl:attribute name="xml:id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates/>
        </figure>
    </xsl:template>

    <xsl:template match="fig/label">
        <xsl:choose>
            <xsl:when test="bold">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <head type="label">
                <xsl:apply-templates/>
                </head>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="caption">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="caption/title">
        <head type="caption-title">
            <xsl:apply-templates/>
        </head>
    </xsl:template>

    <xsl:template match="graphic | ugraphic |rsc:ugraphic">
        <xsl:choose>
            <!--<xsl:when test="ancestor::table-wrap |ancestor::rsc:table-wrap"/>-->
            <xsl:when test="parent::abstract | parent::rsc:abstract">
                <p>
                <graphic>
                    <xsl:attribute name="url">
                        <xsl:value-of select="@xlink:href"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </graphic>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <graphic>
                    <xsl:attribute name="url">
                        <xsl:value-of select="@xlink:href|@src"/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </graphic>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="attrib">
        <xsl:choose>
            <xsl:when test="ancestor::list">
                <item>
                    <xsl:apply-templates/>
                </item>
            </xsl:when>
            <xsl:otherwise>
                <desc>
                    <xsl:apply-templates/>
                </desc>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- Tables -->

    <xsl:template match="hr">
        <milestone unit="hr"/>
    </xsl:template>


    <xsl:template match="back/fn-group">
        <div type="fn-group">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
   <!-- <xsl:template match="back/notes/fn-group">
        <div type="fn-group">
            <xsl:apply-templates/>
        </div>
    </xsl:template>-->
    <xsl:template match="back/notes[@notes-type='citation-text']">
        <div type="citation-text">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="fn-group">
        <xsl:choose>
            <xsl:when test="ancestor::title-group/fn-group/fn">
                <title type="note">
                    <note>
                        <xsl:if test="@fn-type">
                            <xsl:attribute name="type">
                                <xsl:value-of select="@fn-type"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@id">
                            <xsl:attribute name="xml:id">
                                <xsl:value-of select="@id"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:apply-templates select="fn"/>
                    </note>
                </title>
            </xsl:when>
            <xsl:otherwise>
                    <xsl:apply-templates select="fn"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="fn">
        <note place="inline">
            <xsl:if test="@fn-type">
                <xsl:attribute name="type">
                    <xsl:value-of select="@fn-type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    <xsl:template match="back/app-group">
        <div type="appendices">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="app-group/app">
        <div>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates select="title"/>
            <xsl:apply-templates select="*except(title)"/>
        </div>
    </xsl:template>

    <xsl:template match="fn/label">
        <ref>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <!-- References in main text -->
    <xsl:template match="xref">
        <xsl:if test=".!=''">
        <xsl:choose>
            <xsl:when test="@rid and ancestor::contrib">
                <xsl:variable name="numberedIndex">
                    <xsl:value-of select="./sup"/>
                </xsl:variable>
                <xsl:variable name="numberedIndex2">
                    <xsl:value-of select="./target"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="@rid and //aff/target">
                            <xsl:for-each select="//aff/target[@id=current()/@rid]">
                                <affiliation>
                                    <xsl:value-of select="normalize-space(./following-sibling::text()[1])"/> 
                                </affiliation>
                            </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="@rid">
                        <xsl:variable name="index" select="@rid"/>
                        <xsl:apply-templates select="//aff[@id = $index]"/>
                    </xsl:when>
                    <xsl:when test="ancestor::article-meta/descendant::aff/sup[normalize-space(.) = normalize-space($numberedIndex)]/following-sibling::text()[1]">
                        <affiliation>
                            <xsl:apply-templates select="ancestor::article-meta/descendant::aff/sup[normalize-space(.) = normalize-space($numberedIndex)]/following-sibling::text()[1]"/>
                        </affiliation>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="@rid">
                        <xsl:variable name="index" select="@rid"/>
                        <xsl:apply-templates select="//corresp[@id = $index]"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="ancestor::fn/label">
                        <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:when test="ancestor::label"/>
                    <xsl:when test="ancestor::notes"/>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="ancestor::aff"/>
                            <xsl:otherwise>
                                <ref>
                                    <xsl:choose>
                                        <xsl:when test="@ref-type">
                                            <xsl:attribute name="type">
                                                <xsl:value-of select="@ref-type"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="type">
                                                <xsl:text>bib</xsl:text>
                                            </xsl:attribute>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="@rid">
                                            <xsl:attribute name="target">
                                                <xsl:variable name="concat">
                                                    <xsl:value-of select="concat('#',@rid)"/>
                                                </xsl:variable>
                                                <xsl:variable name="diese">
                                                    <xsl:value-of select="translate($concat,' ','#')"/>
                                                </xsl:variable>
                                                <xsl:variable name="espace" select="replace($diese,'#',' #')"/>
                                                <xsl:value-of select="normalize-space($espace)"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:when test="@id">
                                            <xsl:attribute name="target">
                                                <xsl:variable name="concat">
                                                    <xsl:value-of select="concat('#',@id)"/>
                                                </xsl:variable>
                                                <xsl:variable name="diese">
                                                    <xsl:value-of select="translate($concat,' ','#')"/>
                                                </xsl:variable>
                                                <xsl:variable name="espace" select="replace($diese,'#',' #')"/>
                                                <xsl:value-of select="normalize-space($espace)"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:apply-templates/>
                                </ref>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template match="ext-link">
        <ref>
            <xsl:attribute name="type">
                <xsl:value-of select="translate(@ext-link-type,' ','')"/>
            </xsl:attribute>

            <xsl:choose>
                <xsl:when test="@xlink:href !=''">
                    <xsl:value-of select="@xlink:href"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </ref>
        <!-- récuperation des doi -->
        <xsl:if test="contains(.,'doi:')">
            <ref type="doi">
                <xsl:value-of select="substring-after(.,'doi:')"/>
            </ref>
        </xsl:if>
    </xsl:template>

    <xsl:template match="supplementary-material">
        <ref>
            <xsl:attribute name="type"> supplementary-material </xsl:attribute>
            <xsl:attribute name="target">
                <xsl:value-of select="@xlink:href"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>

    <!-- Copyright related information to appear in <publicationStmt> -->
    <xsl:template match="copyright-holder">
        <xsl:choose>
            <xsl:when test="//article-meta/copyright-holder">
                <availability>
                    <p>
                        <xsl:apply-templates/>
                    </p>  
                </availability>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:apply-templates/>
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="permissions/license">
        <availability>
            <xsl:if test="@license-type">
                <xsl:attribute name="status">
                    <xsl:choose>
                        <xsl:when test="@license-type = 'open-access'">free</xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@license-type"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="license-p">
                    <p>
                        <xsl:value-of select="license-p"/>
                    </p>
                </xsl:when>
                <xsl:otherwise>
                    <p>
                        <xsl:apply-templates/>
                    </p>
                </xsl:otherwise>
            </xsl:choose>
        </availability>
    </xsl:template>

    <xsl:template match="license/p">
            <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="copyright-year | cpy">
        <date type="Copyright">
            <xsl:attribute name="when">
                <xsl:apply-templates/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </date>
    </xsl:template>

    <xsl:template match="copyright-statement">
            <!-- SG: ajout licence -->
        <xsl:choose>
            <xsl:when test=".=''"/>
            <xsl:otherwise>
                <licence>
                    <xsl:apply-templates/>
                </licence>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    <xsl:template match="cpn">
        <!-- SG: ajout publisher -->
        <licence>
            <xsl:apply-templates/>
        </licence>
    </xsl:template>

    <xsl:template match="allowbreak"/>

    <xsl:template match="title | rsc:title">
        <xsl:choose>
            <xsl:when test="ancestor::record">
                <title level="a" type="main" xml:lang="{translate(@lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')}">
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:when test="ancestor::collection-meta">
                <title level="s" type="main">
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:when test="parent::table-wrap-foot">
                <title>
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:when test="parent::app">
                <head>
                    <xsl:apply-templates/>
                </head>
            </xsl:when>
            <xsl:when test="ancestor::biography|ancestor::rsc:biography">
                <persName>
                    <xsl:apply-templates/>
                </persName>
            </xsl:when>
            <xsl:when test="ancestor::citgroup | ancestor::rsc:citgroup">
                <title level="m" type="main">
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:when test="ancestor::book-part-meta">
            <title level="a" type="main">
                <xsl:apply-templates/>
            </title>
            </xsl:when>
            <xsl:when test="ancestor::ref-list">
                <head>
                    <xsl:apply-templates/>
                </head>
            </xsl:when>
            <xsl:when test="ancestor::notes"/>
            <xsl:otherwise>
                <head>
                    <xsl:apply-templates/>
                </head>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="it | rsc:it">
        <xsl:choose>
            <xsl:when test="ancestor::citgroup | ancestor::rsc:citgroup">
                <title>
                    <xsl:apply-templates/>
                </title>
            </xsl:when>
            <xsl:otherwise>
                <hi rend="italic"><xsl:apply-templates/></hi>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="pub-date">
        <xsl:choose>
            <!-- RSL rattrapage dates de publication erronées-->
            <xsl:when test="//article-id[@pub-id-type='doi']='10.1098/rsta.1934.0003'"><date type="published">1933</date></xsl:when>
            <xsl:when test="//article-id[@pub-id-type='doi']='10.1098/rspa.1991.0136'"><date type="published">1991</date></xsl:when>
            <xsl:when test="//article-id[@pub-id-type='doi']='10.1098/rsta.1975.0007'"><date type="published">1975</date></xsl:when>
            <xsl:when test="//article-id[@pub-id-type='doi']='10.1098/rsta.1920.0006'"><date type="published">1920</date></xsl:when>
            <!-- RSL rattrapage années erronées -->
            <xsl:when test="//issn[@pub-type='ppub']='0370-2316' and //article/front/article-meta/volume='7'"><date type="published">1672</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0370-2316' and //article/front/article-meta/volume='6'"><date type="published">1671</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0370-2316' and //article/front/article-meta/volume='5'"><date type="published">1670</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0370-2316' and //article/front/article-meta/volume='4'"><date type="published">1669</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0370-2316' and //article/front/article-meta/volume='3'"><date type="published">1668</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0370-2316' and //article/front/article-meta/volume='2'"><date type="published">1666</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0370-2316' and //article/front/article-meta/volume='1'"><date type="published">1665</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='231'"><date type="published">1933</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='228'"><date type="published">1929</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='227'"><date type="published">1928</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='226'"><date type="published">1927</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='225'"><date type="published">1926</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='224'"><date type="published">1924</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='223'"><date type="published">1923</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='222'"><date type="published">1922</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='221'"><date type="published">1921</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='220'"><date type="published">1920</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='217'"><date type="published">1918</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='216'"><date type="published">1916</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='213'"><date type="published">1914</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='212'"><date type="published">1913</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='211'"><date type="published">1912</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='210'"><date type="published">1911</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='209'"><date type="published">1909</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='207'"><date type="published">1908</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='205'"><date type="published">1906</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='204'"><date type="published">1905</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='203'"><date type="published">1904</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='202'"><date type="published">1904</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='201'"><date type="published">1903</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='200'"><date type="published">1903</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='197'"><date type="published">1901</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='196'"><date type="published">1901</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='195'"><date type="published">1901</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='194'"><date type="published">1900</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='193'"><date type="published">1900</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='192'"><date type="published">1899</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='191'"><date type="published">1898</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='190'"><date type="published">1897</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='188'"><date type="published">1896</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3952' and //article/front/article-meta/volume='187'"><date type="published">1896</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0080-4630' and //article/front/article-meta/volume='277'"><date type="published">1964</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0080-4630' and //article/front/article-meta/volume='197'"><date type="published">1949</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0080-4630' and //article/front/article-meta/volume='207'"><date type="published">1951</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='1479-571X' and //article/front/article-meta/volume='4' and //article/front/article-meta/issue='12'"><date type="published">1943</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0035-9149' and //article/front/article-meta/volume='10'"><date type="published">1953</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='42'"><date type="published">1743</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='41'"><date type="published">1740</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='39'"><date type="published">1735</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='35'"><date type="published">1728</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='34'"><date type="published">1727</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='33'"><date type="published">1724</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='31'"><date type="published">1720</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='30'"><date type="published">1719</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='29'"><date type="published">1714</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='28'"><date type="published">1713</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='24'"><date type="published">1705</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='23'"><date type="published">1703</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='19'"><date type="published">1697</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0260-7085' and //article/front/article-meta/volume='16'"><date type="published">1687</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0261-0523' and //article/front/article-meta/volume='68'"><date type="published">1778</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3839' and //article/front/article-meta/volume='185'"><date type="published">1894</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3839' and //article/front/article-meta/volume='182'"><date type="published">1891</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3839' and //article/front/article-meta/volume='180'"><date type="published">1889</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3839' and //article/front/article-meta/volume='179'"><date type="published">1888</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3820' and //article/front/article-meta/volume='182'"><date type="published">1891</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0370-1662' and //article/front/article-meta/volume='57'"><date type="published">1895</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0370-1662' and //article/front/article-meta/volume='43'"><date type="published">1888</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0370-1662' and //article/front/article-meta/volume='26'"><date type="published">1878</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0370-1662' and //article/front/article-meta/volume='12'"><date type="published">1863</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3960' and //article/front/article-meta/volume='187'"><date type="published">1897</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3960' and //article/front/article-meta/volume='197'"><date type="published">1905</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3960' and //article/front/article-meta/volume='199'"><date type="published">1907</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3960' and //article/front/article-meta/volume='200'"><date type="published">1909</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3960' and //article/front/article-meta/volume='208'"><date type="published">1918</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0264-3960' and //article/front/article-meta/volume='204'"><date type="published">1914</date></xsl:when>
            <xsl:when test="//issn[@pub-type='ppub']='0962-8436' and //article/front/article-meta/volume='347'"><date type="published">1995</date></xsl:when>
            <xsl:otherwise>
        <xsl:choose>
            <xsl:when test="year[string-length()&gt; 0]">
                <xsl:if test="position() = last()">
                    <date>
                        <xsl:choose>
                            <xsl:when test="@pub-type = 'ppub'">
                                <xsl:attribute name="type">published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@pub-type = 'epub'">
                                <xsl:attribute name="type">e-published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@pub-type = 'subscription-year'">
                                <xsl:attribute name="type">subscription-year</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@publication-format='print'">
                                <xsl:attribute name="type">published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@publication-format='electronic'">
                                <xsl:attribute name="type">e-published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@pub-type = 'epub-original'">
                                <xsl:attribute name="type">original-e-published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@pub-type = 'collection'">
                                <xsl:attribute name="type">collection-published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@pub-type = 'final'">
                                <xsl:attribute name="type">final-published</xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
                                <xsl:value-of select="normalize-space(year)"/>
                    </date>
                </xsl:if>
            </xsl:when>
            <!-- reprise pour certaines données ou year n'existe pas -->
            <xsl:when test="day[string-length()&gt; 0]">
                <xsl:if test="position() = last()">
                    <date>
                        <xsl:choose>
                            <xsl:when test="@pub-type = 'epub'">
                                <xsl:attribute name="type">e-published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@publication-format='print'">
                                <xsl:attribute name="type">published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@publication-format='electronic'">
                                <xsl:attribute name="type">e-published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@pub-type = 'epub-original'">
                                <xsl:attribute name="type">original-e-published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@pub-type = 'collection'">
                                <xsl:attribute name="type">collection-published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@pub-type = 'final'">
                                <xsl:attribute name="type">final-published</xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:value-of select="normalize-space(day)"/>
                    </date>
                </xsl:if>
            </xsl:when>
            <!-- date par défaut erreur de l'éditeur pas de date de publication -->
            <xsl:otherwise>
                <xsl:if test="//book/book-meta/permissions/copyright-year[string-length()&gt; 0]">
                    <date>
                        <xsl:choose>
                            <xsl:when test="@pub-type = 'epub'">
                                <xsl:attribute name="type">e-published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@publication-format='print'">
                                <xsl:attribute name="type">published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@publication-format='electronic'">
                                <xsl:attribute name="type">e-published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@pub-type = 'epub-original'">
                                <xsl:attribute name="type">original-e-published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@pub-type = 'collection'">
                                <xsl:attribute name="type">collection-published</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="@pub-type = 'final'">
                                <xsl:attribute name="type">final-published</xsl:attribute>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:value-of select="normalize-space(//book/book-meta/permissions/copyright-year)"/>
                    </date>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="date[@date-type = 'received']">
        <change>
            <xsl:attribute name="when">
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldDay" select="day"/>
                    <xsl:with-param name="oldMonth" select="month"/>
                    <xsl:with-param name="oldYear" select="year"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:text>Received</xsl:text>
        </change>
    </xsl:template>

    <xsl:template match="date[@date-type = 'received-final']">
        <change>
            <xsl:attribute name="when">
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldDay" select="day"/>
                    <xsl:with-param name="oldMonth" select="month"/>
                    <xsl:with-param name="oldYear" select="year"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:text>Received final</xsl:text>
        </change>
    </xsl:template>
    <xsl:template match="date[@date-type = 'read-to-society']">
        <change>
            <xsl:attribute name="when">
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldDay" select="day"/>
                    <xsl:with-param name="oldMonth" select="month"/>
                    <xsl:with-param name="oldYear" select="year"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:text>Read to Society</xsl:text>
        </change>
    </xsl:template>

    <xsl:template match="date[@date-type = 'rev-recd']">
        <change>
            <xsl:attribute name="when">
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldDay" select="day"/>
                    <xsl:with-param name="oldMonth" select="month"/>
                    <xsl:with-param name="oldYear" select="year"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:text>Revised</xsl:text>
        </change>
    </xsl:template>

    <xsl:template match="date[@date-type = 'accepted']">
        <change>
            <xsl:attribute name="when">
                <xsl:call-template name="makeISODateFromComponents">
                    <xsl:with-param name="oldDay" select="day"/>
                    <xsl:with-param name="oldMonth" select="month"/>
                    <xsl:with-param name="oldYear" select="year"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:text>Accepted</xsl:text>
        </change>
    </xsl:template>

    <!-- custom date format <idt>19731128</idt> -->
    <xsl:template match="idt | suppmast/idt">
        <date>
            <xsl:attribute name="when">
                <xsl:if test="string-length(text()) > 0">
                    <xsl:value-of select="substring(text(), 0, 5)"/>
                </xsl:if>
                <xsl:if test="string-length(text()) > 4">-<xsl:value-of select="substring(text(), 5, 2)"/></xsl:if>
                <xsl:if test="string-length(text()) > 6">-<xsl:value-of select="substring(text(), 7, 2)"/></xsl:if>
            </xsl:attribute>
        </date>
    </xsl:template>

    <!-- PL: supplementary info presetn as external files -->
    <xsl:template match="suppobj">
        <ref>
            <xsl:attribute name="type">
                <xsl:text>file</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="subtype">
                <xsl:value-of select="@format"/>
            </xsl:attribute>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="@extrefid"/>
            </xsl:attribute>
            <title>
                <xsl:value-of select="title"/>
            </title>
            <xsl:if test="normalize-space(descrip/*)">
                <note>
                    <xsl:apply-templates select="descrip/*"/>
                </note>
            </xsl:if>
        </ref>
    </xsl:template>
    <xsl:template match="front/article-meta/product">
        <div type="review-of">
            <bibl>
        <xsl:apply-templates/>
            </bibl>
        </div>
    </xsl:template>
    <!-- SG - supplementary information about correction -->
    <xsl:template match="chghst">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="chg">
        <ref>
            <xsl:attribute name="type">
                <xsl:value-of select="@chgtype"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </ref>
    </xsl:template>
    <xsl:template match="chgperson">
        <name>
        <xsl:apply-templates/>
        </name>
    </xsl:template>
  <xsl:template match="chgdate">
        <date>
            <xsl:value-of select="@year"/>
        </date>
    </xsl:template>
    <xsl:template match="chgmade">
        <note>
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    <xsl:template match="chgreason">
        <note>
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    <!-- SG: categorisation niveau book -->
    <xsl:template match="front/article-meta/article-categories/subj-group">
        <keywords>
            <xsl:attribute name="scheme">
            <xsl:choose>
                <xsl:when test="@subj-group-type">
                    <xsl:value-of select="@subj-group-type"/>
                </xsl:when>
                <xsl:otherwise>subject</xsl:otherwise>
            </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates/>
        </keywords>
    </xsl:template>
   <!-- <xsl:template match="pubfm/subject">
        <keywords>
            <xsl:attribute name="scheme">
                <xsl:choose>
                    <xsl:when test="@subj-group-type">
                        <xsl:value-of select="@subj-group-type"/>
                    </xsl:when>
                    <xsl:otherwise>subject</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <term>
                <xsl:value-of select="."/>
            </term>
        </keywords>
    </xsl:template>-->
    <xsl:template match="front/article-meta/article-categories/subj-group/subject">
        <term>
            <xsl:apply-templates/>
        </term>
    </xsl:template>
    <!-- conference -->
    <xsl:template match="//conference">
        <meeting>
            <xsl:apply-templates select="conf-name"/>
            <xsl:apply-templates select="conf-sponsor"/>
            <xsl:apply-templates select="conf-date"/>
            <xsl:apply-templates select="conf-loc"/>
            <xsl:apply-templates select="conf-num"/>
        </meeting>
    </xsl:template>
    <xsl:template match="conf-name">
        <xsl:choose>
            <xsl:when test="ancestor::conference and normalize-space(.)">
                <name>
                    <xsl:apply-templates/>
                </name>
            </xsl:when>
            <xsl:when test="ancestor::nlm-citation">
                <title level="m">
                    <xsl:apply-templates/>
                </title>
                <meeting>
                    <xsl:apply-templates/>
                </meeting>
            </xsl:when>
            <xsl:when test="ancestor::ref">
                <title level="m">
                    <xsl:apply-templates/>
                </title>
                <meeting>
                    <xsl:apply-templates/>
                </meeting>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="conf-date">
        <date>
            <xsl:apply-templates/>
        </date>
    </xsl:template>
    <xsl:template match="conf-loc">
        <placeName>
            <xsl:apply-templates/>
        </placeName>
    </xsl:template>
    <xsl:template match="conf-sponsor">
        <orgName>
            <xsl:apply-templates/>
        </orgName>
    </xsl:template>
    <xsl:template match="conf-num">
        <idno type="conf-num">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="front/article-meta/permissions/license/license-p">
            <xsl:apply-templates/>
    </xsl:template>
    <!--<xsl:template match="volume-id">
        <note type="edition" subtype="volume-id">
            <xsl:apply-templates/>
        </note>
    </xsl:template>-->
    <xsl:template match="notes">
        <xsl:choose>
            <xsl:when test="parent::app">
                <div type="notes">
                <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:when test="ancestor::back">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <note>
                    <xsl:if test="@notes-type">
                        <xsl:attribute name="type">
                            <xsl:value-of select="@notes-type"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </note>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
   
   <!-- parseAffiliation -->
    <xsl:template name="NLMaffiliation">
        <xsl:call-template name="NLMparseAffiliation">
            <xsl:with-param name="theAffil">
                <xsl:value-of select="."/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="NLMparseAffiliation">
        <xsl:param name="theAffil"/>
        <xsl:param name="inAddress" select="false()"/>
        <xsl:for-each select="$theAffil">
            <xsl:message>Un bout: <xsl:value-of select="."/></xsl:message>
        </xsl:for-each>
        <xsl:variable name="avantVirgule">
            <xsl:choose>
                <xsl:when test="contains($theAffil,',')">
                    <xsl:value-of select="normalize-space(substring-before($theAffil,','))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space($theAffil)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="apresVirgule">
            <xsl:choose>
                <xsl:when test="contains($theAffil,',')">
                    <xsl:value-of select="normalize-space(substring-after($theAffil,','))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="testOrganisation">
            <xsl:call-template name="identifyOrgLevel">
                <xsl:with-param name="theOrg">
                    <xsl:value-of select="$avantVirgule"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="countSup">
            <xsl:value-of select="count(//aff/sup)"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="not($inAddress)">
                <xsl:choose>
                    <xsl:when test="$testOrganisation!=''">
                        <orgName>
                            <xsl:attribute name="type">
                                <xsl:value-of select="$testOrganisation"/>
                            </xsl:attribute>
                            <xsl:value-of select="$avantVirgule"/>
                        </orgName>
                       <xsl:if test="$apresVirgule !=''">
                            <xsl:call-template name="NLMparseAffiliation">
                                <xsl:with-param name="theAffil" select="$apresVirgule"/>
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="NLMparseAffiliation">
                            <xsl:with-param name="theAffil" select="$theAffil except(email)"/>
                            <xsl:with-param name="inAddress" select="true()"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="testCountry">
                    <xsl:call-template name="normalizeISOCountry">
                        <xsl:with-param name="country" select="translate($avantVirgule,'. ','')"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="SuppEmail">
                    <xsl:value-of select="substring-before($avantVirgule,'. ')"/>
                </xsl:variable>
                <xsl:variable name="finEmail1">
                    <xsl:value-of select="substring-after($avantVirgule,'@')"/>
                </xsl:variable>
                <xsl:variable name="finEmail2">
                    <xsl:value-of select="substring-after($finEmail1,'.')"/>
                </xsl:variable>
                <xsl:variable name="finEmail">
                    <xsl:choose>
                        <xsl:when test="contains($finEmail2,'.')">
                            <xsl:value-of select="substring-after($finEmail2,'.')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$finEmail2"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="testCountry2">
                    <xsl:call-template name="normalizeISOCountry">
                        <xsl:with-param name="country" select="$SuppEmail"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="testCountry3">
                    <xsl:call-template name="normalizeISOCountry">
                        <xsl:with-param name="country" select="$finEmail"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$testCountry != ''">
                        <xsl:choose>
                            <!-- prise en charge des regions USA se confondant avec les codes pays -->
                            <xsl:when test="$avantVirgule='AL'
                                or $avantVirgule='AZ'
                                or $avantVirgule='AR'
                                or $avantVirgule='CA'
                                or $avantVirgule='NC'
                                or $avantVirgule='SC'
                                or $avantVirgule='CO'
                                or $avantVirgule='SD'
                                or $avantVirgule='DE'
                                or $avantVirgule='GA'
                                or $avantVirgule='ID'
                                or $avantVirgule='IL'
                                or $avantVirgule='IN'
                                or $avantVirgule='KY'
                                or $avantVirgule='LA'
                                or $avantVirgule='ME'
                                or $avantVirgule='MD'
                                or $avantVirgule='MA'
                                or $avantVirgule='MN'
                                or $avantVirgule='MS'
                                or $avantVirgule='MO'
                                or $avantVirgule='MT'
                                or $avantVirgule='NE'
                                or $avantVirgule='NH'
                                or $avantVirgule='NJ'
                                or $avantVirgule='NM'
                                or $avantVirgule='PA'
                                or $avantVirgule='TN'
                                or $avantVirgule='VA'
                                or $avantVirgule='N.Y.'">
                                <address>
                                    <region>
                                        <xsl:value-of select="$avantVirgule"/>
                                    </region>
                                    <country key="US" xml:lang="en">UNITED STATES</country>
                                </address>
                            </xsl:when>
                            <!-- reprise des codes etats américains pour forcer le code pays us -->
                            <xsl:when test="starts-with($avantVirgule,'AK ')
                                or starts-with($avantVirgule,'AL ')
                                or starts-with($avantVirgule,'AR ')
                                or starts-with($avantVirgule,'AZ ')
                                or starts-with($avantVirgule,'CA ')
                                or starts-with($avantVirgule,'CO ')
                                or starts-with($avantVirgule,'CT ')
                                or starts-with($avantVirgule,'DE ')
                                or starts-with($avantVirgule,'FL ')
                                or starts-with($avantVirgule,'GA ')
                                or starts-with($avantVirgule,'HI ')
                                or starts-with($avantVirgule,'IA ')
                                or starts-with($avantVirgule,'ID ')
                                or starts-with($avantVirgule,'IL ')
                                or starts-with($avantVirgule,'IN ')
                                or starts-with($avantVirgule,'KS ')
                                or starts-with($avantVirgule,'KY ')
                                or starts-with($avantVirgule,'LA ')
                                or starts-with($avantVirgule,'MA ')
                                or starts-with($avantVirgule,'MD ')
                                or starts-with($avantVirgule,'ME ')
                                or starts-with($avantVirgule,'MI ')
                                or starts-with($avantVirgule,'MN ')
                                or starts-with($avantVirgule,'MO ')
                                or starts-with($avantVirgule,'MS ')
                                or starts-with($avantVirgule,'MT ')
                                or starts-with($avantVirgule,'NC ')
                                or starts-with($avantVirgule,'ND ')
                                or starts-with($avantVirgule,'NE ')
                                or starts-with($avantVirgule,'NH ')
                                or starts-with($avantVirgule,'NJ ')
                                or starts-with($avantVirgule,'N.J.')
                                or starts-with($avantVirgule,'NM ')
                                or starts-with($avantVirgule,'NV ')
                                or starts-with($avantVirgule,'NY ')
                                or starts-with($avantVirgule,'OH ')
                                or starts-with($avantVirgule,'OK ')
                                or starts-with($avantVirgule,'OR ')
                                or starts-with($avantVirgule,'PA ')
                                or starts-with($avantVirgule,'RI ')
                                or starts-with($avantVirgule,'SC ')
                                or starts-with($avantVirgule,'SD ')
                                or starts-with($avantVirgule,'TN ')
                                or starts-with($avantVirgule,'TX ')
                                or starts-with($avantVirgule,'UT ')
                                or starts-with($avantVirgule,'VA ')
                                or starts-with($avantVirgule,'VT ')
                                or starts-with($avantVirgule,'WA ')
                                or starts-with($avantVirgule,'WI ')
                                or starts-with($avantVirgule,'WV ')
                                or starts-with($avantVirgule,'WY ')">
                                <country key="US" xml:lang="en">UNITED STATES</country>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="$countSup">
                                        <address>
                                            <country>
                                                <xsl:attribute name="key">
                                                    <xsl:value-of select="$testCountry"/>
                                                </xsl:attribute>
                                                <xsl:call-template name="normalizeISOCountryName">
                                                    <xsl:with-param name="country" select="$avantVirgule"/>
                                                </xsl:call-template>
                                            </country>
                                        </address>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <country>
                                            <xsl:attribute name="key">
                                                <xsl:value-of select="$testCountry"/>
                                            </xsl:attribute>
                                            <xsl:call-template name="normalizeISOCountryName">
                                                <xsl:with-param name="country" select="$avantVirgule"/>
                                            </xsl:call-template>
                                        </country>
                                    </xsl:otherwise>
                                </xsl:choose>
                                
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$testCountry2 != ''">
                        <country>
                            <xsl:attribute name="key">
                                <xsl:value-of select="$testCountry2"/>
                            </xsl:attribute>
                            <xsl:call-template name="normalizeISOCountryName">
                                <xsl:with-param name="country" select="$SuppEmail"/>
                            </xsl:call-template>
                        </country>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="email"/>
                            <xsl:when test="contains($avantVirgule,'@')">
                                <addrLine>
                                    <xsl:value-of select="$SuppEmail"/>
                                </addrLine>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <!-- prise en charge des regions américaines -->
                                    <xsl:when test="$avantVirgule='AK'
                                        or $avantVirgule='CT'
                                        or $avantVirgule='ND'
                                        or $avantVirgule='FL'
                                        or $avantVirgule='ID'
                                        or $avantVirgule='IL'
                                        or $avantVirgule='IN'
                                        or $avantVirgule='KY'
                                        or $avantVirgule='MI'
                                        or $avantVirgule='NV'
                                        or $avantVirgule='NY'
                                        or $avantVirgule='OH'
                                        or $avantVirgule='OK'
                                        or $avantVirgule='OR'
                                        or $avantVirgule='RI'
                                        or $avantVirgule='TX'
                                        or $avantVirgule='UT'
                                        or $avantVirgule='VT'
                                        or $avantVirgule='WV'
                                        or $avantVirgule='WA'
                                        or $avantVirgule='WI'
                                        or $avantVirgule='WY'
                                        or $avantVirgule='N.J.'
                                        or $avantVirgule='N.Y.'">
                                        <region>
                                            <xsl:value-of select="$avantVirgule"/>
                                        </region>
                                    </xsl:when>
                                    <!-- prise en charge des villes japonaises 
                                    et ajout de leurs codes pays si manquant-->
                                    <xsl:when test="contains($avantVirgule,'Hokkaido')
                                        or contains($avantVirgule,'Sapporo')
                                        or contains($avantVirgule,'Shizuoka')
                                        or contains($avantVirgule,'Osaka')
                                        or contains($avantVirgule,'Tokyo')
                                        or contains($avantVirgule,'Kyoto')
                                        or contains($avantVirgule,'Ibaraki')
                                        or contains($avantVirgule,'Morioka')
                                        or contains($avantVirgule,'Fukushima')
                                        or contains($avantVirgule,'Ichihara')
                                        or contains($avantVirgule,'Kumamoto')
                                        ">
                                        <settlement>
                                            <xsl:value-of select="$avantVirgule"/>
                                        </settlement>
                                        <xsl:if test="not(contains(parent::aff|parent::corresp,'Japan'))">
                                            <xsl:if test="not(contains($theAffil,'Japan'))">
                                                <country key="JP" xml:lang="en">JAPAN</country>
                                            </xsl:if>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="contains($avantVirgule,'Pisa Italy')">
                                        <settlement>Pisa</settlement>
                                        <country key="IT" xml:lang="en">ITALY</country>
                                    </xsl:when>
                                    <xsl:when test="starts-with($avantVirgule,'AK ')
                                        or starts-with($avantVirgule,'AL ')
                                        or starts-with($avantVirgule,'AR ')
                                        or starts-with($avantVirgule,'AZ ')
                                        or starts-with($avantVirgule,'CA ')
                                        or starts-with($avantVirgule,'CO ')
                                        or starts-with($avantVirgule,'CT ')
                                        or starts-with($avantVirgule,'DE ')
                                        or starts-with($avantVirgule,'FL ')
                                        or starts-with($avantVirgule,'GA ')
                                        or starts-with($avantVirgule,'HI ')
                                        or starts-with($avantVirgule,'IA ')
                                        or starts-with($avantVirgule,'ID ')
                                        or starts-with($avantVirgule,'IL ')
                                        or starts-with($avantVirgule,'IN ')
                                        or starts-with($avantVirgule,'KS ')
                                        or starts-with($avantVirgule,'KY ')
                                        or starts-with($avantVirgule,'LA ')
                                        or starts-with($avantVirgule,'MA ')
                                        or starts-with($avantVirgule,'MD ')
                                        or starts-with($avantVirgule,'ME ')
                                        or starts-with($avantVirgule,'MI ')
                                        or starts-with($avantVirgule,'MN ')
                                        or starts-with($avantVirgule,'MO ')
                                        or starts-with($avantVirgule,'MS ')
                                        or starts-with($avantVirgule,'MT ')
                                        or starts-with($avantVirgule,'NC ')
                                        or starts-with($avantVirgule,'ND ')
                                        or starts-with($avantVirgule,'NE ')
                                        or starts-with($avantVirgule,'NH ')
                                        or starts-with($avantVirgule,'NJ ')
                                        or starts-with($avantVirgule,'NM ')
                                        or starts-with($avantVirgule,'NV ')
                                        or starts-with($avantVirgule,'NY ')
                                        or starts-with($avantVirgule,'N.Y.')
                                        or starts-with($avantVirgule,'OH ')
                                        or starts-with($avantVirgule,'OK ')
                                        or starts-with($avantVirgule,'OR ')
                                        or starts-with($avantVirgule,'PA ')
                                        or starts-with($avantVirgule,'RI ')
                                        or starts-with($avantVirgule,'SC ')
                                        or starts-with($avantVirgule,'SD ')
                                        or starts-with($avantVirgule,'TN ')
                                        or starts-with($avantVirgule,'TX ')
                                        or starts-with($avantVirgule,'UT ')
                                        or starts-with($avantVirgule,'VA ')
                                        or starts-with($avantVirgule,'VT ')
                                        or starts-with($avantVirgule,'WA ')
                                        or starts-with($avantVirgule,'WI ')
                                        or starts-with($avantVirgule,'WV ')
                                        or starts-with($avantVirgule,'WY ')
                                        or starts-with($avantVirgule,'Alabama')
                                        or starts-with($avantVirgule,'Alaska')
                                        or starts-with($avantVirgule,'Arizona')
                                        or starts-with($avantVirgule,'Arkansas')
                                        or starts-with($avantVirgule,'California')
                                        or starts-with($avantVirgule,'Colorado')
                                        or starts-with($avantVirgule,'Connecticut')
                                        or starts-with($avantVirgule,'Delaware')
                                        or starts-with($avantVirgule,'Florida')
                                        or starts-with($avantVirgule,'Georgia')
                                        or starts-with($avantVirgule,'Hawaii')
                                        or starts-with($avantVirgule,'Idaho')
                                        or starts-with($avantVirgule,'Illinois')
                                        or starts-with($avantVirgule,'Indiana')
                                        or starts-with($avantVirgule,'Iowa')
                                        or starts-with($avantVirgule,'Kansas')
                                        or starts-with($avantVirgule,'Kentucky')
                                        or starts-with($avantVirgule,'Louisiana')
                                        or starts-with($avantVirgule,'Maine')
                                        or starts-with($avantVirgule,'Maryland')
                                        or starts-with($avantVirgule,'Massachusetts')
                                        or starts-with($avantVirgule,'Michigan')
                                        or starts-with($avantVirgule,'Minnesota')
                                        or starts-with($avantVirgule,'Mississippi')
                                        or starts-with($avantVirgule,'Missouri')
                                        or starts-with($avantVirgule,'Montana')
                                        or starts-with($avantVirgule,'Nebraska')
                                        or starts-with($avantVirgule,'Nevada')
                                        or starts-with($avantVirgule,'New Hampshire')
                                        or starts-with($avantVirgule,'New Jersey')
                                        or starts-with($avantVirgule,'New Mexico')
                                        or starts-with($avantVirgule,'New York')
                                        or starts-with($avantVirgule,'North Carolina')
                                        or starts-with($avantVirgule,'North Dakota')
                                        or starts-with($avantVirgule,'Ohio')
                                        or starts-with($avantVirgule,'Oklahoma')
                                        or starts-with($avantVirgule,'Oregon')
                                        or starts-with($avantVirgule,'Pennsylvania')
                                        or starts-with($avantVirgule,'Rhode Island')
                                        or starts-with($avantVirgule,'South Carolina')
                                        or starts-with($avantVirgule,'South Dakota')
                                        or starts-with($avantVirgule,'Tennessee')
                                        or starts-with($avantVirgule,'Texas')
                                        or starts-with($avantVirgule,'Utah')
                                        or starts-with($avantVirgule,'Vermont')
                                        or starts-with($avantVirgule,'Virginia')
                                        or starts-with($avantVirgule,'Washington')
                                        or starts-with($avantVirgule,'West Virginia')
                                        or starts-with($avantVirgule,'Wisconsin')
                                        or starts-with($avantVirgule,'Wyoming')
                                        ">
                                        <xsl:if test="not(contains($theAffil,'USA'))">
                                            <region>
                                                <xsl:value-of select="$avantVirgule"/>
                                            </region> 
                                            <country key="US" xml:lang="en">UNITED STATES</country>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="contains($avantVirgule,'Durham') and not(contains($theAffil,'North'))
                                        or contains($avantVirgule,'Edinburgh') 
                                        or contains($avantVirgule,'Nottingham') 
                                        or contains($avantVirgule,'Canterbury') 
                                        or contains($avantVirgule,'Oxford')
                                        or contains($avantVirgule,'Manchester')
                                        or contains($avantVirgule,'Cheshire')
                                        or contains($avantVirgule,'St Andrews')
                                        or contains($avantVirgule,'Exeter')
                                        or contains($avantVirgule,'Halifax')
                                        or contains($avantVirgule,'Surrey')
                                        or contains($avantVirgule,'Fife')
                                        or contains($avantVirgule,'Leicester')
                                        or contains($avantVirgule,'Chester')
                                        or contains($avantVirgule,'Chichester')
                                        or contains($avantVirgule,'Coventry')
                                        or contains($avantVirgule,'Derby')
                                        or contains($avantVirgule,'East Anglia')
                                        or contains($avantVirgule,'East London')
                                        or contains($avantVirgule,'Essex')
                                        or contains($avantVirgule,'Gloucestershire')
                                        or contains($avantVirgule,'Greenwich')
                                        or contains($avantVirgule,'Huddersfield')
                                        or contains($avantVirgule,'Hertfordshire')
                                        or contains($avantVirgule,'Hull')
                                        or contains($avantVirgule,'Keele')
                                        or contains($avantVirgule,'Kent')
                                        or contains($avantVirgule,'Kingston')
                                        or contains($avantVirgule,'Lancaster')
                                        or contains($avantVirgule,'Leeds')
                                        or contains($avantVirgule,'Liverpool')
                                        or contains($avantVirgule,'Uxbridge')
                                        or contains($avantVirgule,'Bournemouth')
                                        or contains($avantVirgule,'Birmingham')
                                        or contains($avantVirgule,'Lancashire')
                                        or contains($avantVirgule,'Bristol')
                                        or contains($avantVirgule,'Brighton')
                                        or contains($avantVirgule,'Loughborough')
                                        or contains($avantVirgule,'Middlesex')
                                        or contains($avantVirgule,'Northampton')
                                        or contains($avantVirgule,'Plymouth')
                                        or contains($avantVirgule,'Portsmouth')
                                        or contains($avantVirgule,'Reading')
                                        or contains($avantVirgule,'Roehampton')
                                        or contains($avantVirgule,'Salford')
                                        or contains($avantVirgule,'Sheffield')
                                        or contains($avantVirgule,'Southampton')
                                        or contains($avantVirgule,'Staffordshire')
                                        or contains($avantVirgule,'Suffolk')
                                        or contains($avantVirgule,'Sunderland')
                                        or contains($avantVirgule,'Surrey')
                                        or contains($avantVirgule,'Sussex')
                                        or contains($avantVirgule,'Teesside')
                                        or contains($avantVirgule,'Warwick')
                                        or contains($avantVirgule,'Westminster')
                                        or contains($avantVirgule,'Winchester')
                                        or contains($avantVirgule,'Wolverhampton')
                                        or contains($avantVirgule,'Worcester')
                                        ">
                                        <xsl:if test="not(contains($theAffil,'UK'))">
                                            <address>
                                                <settlement>
                                                    <xsl:value-of select="$avantVirgule"/>
                                                </settlement>
                                                <xsl:if test="not(contains($theAffil,'England'))">
                                                    <country key="GB" xml:lang="en">UNITED KINGDOM</country>
                                                </xsl:if>
                                            </address>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="contains($avantVirgule,'The Netherlands') or contains($avantVirgule,'the Netherlands')">
                                        <country key="NL" xml:lang="en">THE NETHERLANDS</country>
                                    </xsl:when>
                                    <xsl:when test="contains($avantVirgule,'United Kingdom')">
                                        <country key="GB" xml:lang="en">UNITED KINGDOM</country>
                                    </xsl:when>
                                    <xsl:when test="$testOrganisation!=''">
                                        <orgName>
                                            <xsl:attribute name="type">
                                                <xsl:value-of select="$testOrganisation"/>
                                            </xsl:attribute>
                                            <xsl:apply-templates select="$avantVirgule"/>
                                        </orgName>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="$testCountry !=''">
                                                <country xml:lang="en">
                                                    <xsl:attribute name="key">
                                                        <xsl:value-of select="$testCountry"/>
                                                    </xsl:attribute>
                                                    <xsl:call-template name="normalizeISOCountryName">
                                                        <xsl:with-param name="country" select="$avantVirgule"/>
                                                    </xsl:call-template>
                                                </country>   
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                    <xsl:when test="ancestor::addr-line/institution">
                                                        <address>
                                                            <addrLine>
                                                                <xsl:apply-templates select="$avantVirgule"/>
                                                            </addrLine>
                                                        </address>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:choose>
                                                            <xsl:when test="$countSup">
                                                                <address>
                                                                    <xsl:choose>
                                                                        <xsl:when test="contains($avantVirgule,'.')">
                                                                            <region>
                                                                                <xsl:apply-templates select="$avantVirgule"/>
                                                                            </region>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <xsl:choose>
                                                                                <xsl:when test="contains($avantVirgule,' ')">
                                                                                    <addrLine>
                                                                                        <xsl:apply-templates select="$avantVirgule"/>
                                                                                    </addrLine>
                                                                                </xsl:when>
                                                                                <xsl:otherwise>
                                                                                            <settlement>
                                                                                                <xsl:apply-templates select="$avantVirgule"/>
                                                                                            </settlement>
                                                                                            <xsl:if test="$apresVirgule[string-length() &gt; 0]">
                                                                                                <addrLine>
                                                                                                    <xsl:choose>
                                                                                                        <xsl:when test="contains($apresVirgule,',')">
                                                                                                            <xsl:value-of select="substring-before($apresVirgule,',')"/>
                                                                                                        </xsl:when>
                                                                                                        <xsl:otherwise>
                                                                                                            <xsl:apply-templates select="$apresVirgule"/>
                                                                                                        </xsl:otherwise>
                                                                                                    </xsl:choose>
                                                                                                </addrLine>
                                                                                            </xsl:if>
                                                                                </xsl:otherwise>
                                                                            </xsl:choose>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                </address>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <addrLine>
                                                                    <xsl:apply-templates select="$avantVirgule"/>
                                                                </addrLine>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                        <xsl:if test="contains($avantVirgule,'@') and $testCountry3 !=''">
                            <country xml:lang="en">
                                <xsl:attribute name="key">
                                    <xsl:value-of select="$testCountry3"/>
                                </xsl:attribute>
                                <xsl:call-template name="normalizeISOCountryName">
                                    <xsl:with-param name="country" select="$finEmail"/>
                                </xsl:call-template>
                            </country>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="$apresVirgule !=''">
                    <xsl:call-template name="NLMparseAffiliation">
                        <xsl:with-param name="theAffil" select="$apresVirgule"/>
                        <xsl:with-param name="inAddress" select="true()"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="chghst">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="chg" mode="correction">
        <change xml:id="correction">
           <xsl:attribute name="when">
               <xsl:value-of select="chgdate/@year"/>
           </xsl:attribute>
            <xsl:if test="chgmade">
                <label>
                    <xsl:value-of select="normalize-space(chgmade)"/>
                </label>
            </xsl:if>
            <xsl:if test="chgreason">
                <desc>
                    <xsl:value-of select="normalize-space(chgreason)"/>
                </desc>
            </xsl:if>
        </change>
    </xsl:template>
    
    <!-- affiliations multiples -->
    <xsl:template name="createNLMAffiliations">
        <xsl:param name="restAff"/>
        <xsl:param name="restAff2"/>
        <xsl:message>Affiliations: <xsl:value-of select="$restAff"/></xsl:message>
        <xsl:choose>
            <xsl:when test="contains($restAff,' ')">
                <xsl:apply-templates select="//aff[@id=substring-before($restAff,' ')]"/>
                <xsl:call-template name="createNLMAffiliations">
                    <xsl:with-param name="restAff" select="substring-after($restAff,' ')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="contains($restAff2,' ')">
                <xsl:apply-templates select="//aff[@id=substring-before($restAff2,' ')]"/>
                <xsl:call-template name="createNLMAffiliations">
                    <xsl:with-param name="restAff" select="substring-after($restAff2,' ')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="//aff[@id=$restAff]"/>
                <xsl:apply-templates select="//aff[@id=$restAff2]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- affiliation JATS -->
    
    <!-- reformatage des données karger et en général les données contenant des <sup> dans les affiliations-->
    <!-- ce que nous avons en entrée : doi: 10.1159/000485060-->
    <!-- 
        <contrib contrib-type="author">
          <name>
            <surname>Ko</surname>
            <given-names>Jih-Yang</given-names>
          </name>
          <xref ref-type="aff" rid="A">a-d</xref>
        </contrib>
        <contrib contrib-type="author">
          <name>
            <surname>Wang</surname>
            <given-names>Feng-Sheng</given-names>
          </name>
          <xref ref-type="aff" rid="A">c,e,f</xref>
        </contrib>
        
        <aff id="A">
             <sup>a</sup>Center for Shockwave Medicine and Tissue Engineering, 
             <sup>b</sup>Department of Orthopedic Surgery, and 
             <sup>c</sup>Graduate Institute of Clinical Medical Sciences, Chang Gung University College of Medicine, Kaohsiung Chang Gung Memorial Hospital, Kaohsiung, Taiwan; 
             <sup>d</sup>Department of Orthopaedic Surgery, Xiamen Chang Gung Hospital, Xiamen, China; 
             <sup>e</sup>Department of Medical Research, and 
             <sup>f</sup>Core Laboratory for Phenomics and Diagonistics, Kaohsiung Chang Gung Memorial Hospital, Kaohsiung, Taiwan
        </aff> 
    -->
    <xsl:template name="supAffil">
        <xsl:call-template name="tokenizeJats"/>
    </xsl:template>
    <xsl:template match="xref" name="tokenizeJats" mode="karger">
        <xsl:param name="text" select="translate(xref,' ','')"/>
        <xsl:param name="separator" select="','"/>
        <xsl:choose>
            <xsl:when test="contains($text,'-')">
                <xsl:variable name="replaceText">
                    <xsl:choose>
                        <xsl:when test="contains($text,'a b')">
                            <xsl:value-of select="replace($text,'a b','a,b')"/>
                        </xsl:when>
                        <xsl:when test="contains($text,'a-c')">
                            <xsl:value-of select="replace($text,'a-c','a,b,c')"/>
                        </xsl:when>
                        <xsl:when test="contains($text,'a-cd')">
                            <xsl:value-of select="replace($text,'a-cd','a,c,d')"/>
                        </xsl:when>
                        <xsl:when test="contains($text,'a-d')">
                            <xsl:value-of select="replace($text,'a-d','a,b,c,d')"/>
                        </xsl:when>
                        <xsl:when test="contains($text,'a-df')">
                            <xsl:value-of select="replace($text,'a-df','a,d,e,f')"/>
                        </xsl:when>
                        <xsl:when test="contains($text,'a-f')">
                            <xsl:value-of select="replace($text,'a-f','a,b,c,d,e,f')"/>
                        </xsl:when>
                        <xsl:when test="contains($text,'b-e')">
                            <xsl:value-of select="replace($text,'b-e','b,c,d,e')"/>
                        </xsl:when>
                        <xsl:when test="contains($text,'b-g')">
                            <xsl:value-of select="replace($text,'b-g','a,b,c,d,e,f,g')"/>
                        </xsl:when>
                        <xsl:when test="contains($text,'c-e')">
                            <xsl:value-of select="replace($text,'c-e','c,d,e')"/>
                        </xsl:when>
                        <xsl:when test="contains($text,'c-f')">
                            <xsl:value-of select="replace($text,'c-f','c,d,e,f')"/>
                        </xsl:when>
                        <xsl:when test="contains($text,'d-f')">
                            <xsl:value-of select="replace($text,'d-f','d,e,f')"/>
                        </xsl:when>
                        <xsl:when test="contains($text,'e-g')">
                            <xsl:value-of select="replace($text,'e-g','e,f,g')"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:call-template name="tokenizeJats">
                    <xsl:with-param name="text" select="$replaceText"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="not(contains($text, $separator))">
                <xsl:choose>
                    <xsl:when test="//aff/sup[.=$text]">
                        <xsl:variable name="supNettoie">
                            <xsl:value-of select="normalize-space(//aff/sup[.=$text]/following-sibling::text()[position()=1])"/>
                        </xsl:variable>
                        <xsl:variable name="supNettoie2">
                            <xsl:choose>
                                <xsl:when test="contains($supNettoie,', and')">
                                    <xsl:value-of select="normalize-space(replace($supNettoie,', and',''))"/>
                                </xsl:when>
                                <xsl:when test="contains($supNettoie,';')">
                                    <xsl:value-of select="normalize-space(replace($supNettoie,';',''))"/>
                                </xsl:when>
                                <xsl:when test="ends-with($supNettoie,',')">
                                    <xsl:value-of select="normalize-space(replace($supNettoie,',',''))"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="normalize-space($supNettoie)"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <affiliation>
                            <xsl:call-template name="NLMparseAffiliation">
                                <xsl:with-param name="theAffil">
                                    <xsl:value-of select="$supNettoie2"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </affiliation>
                        </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="aff">
                    <xsl:value-of select="normalize-space(substring-before($text, $separator))"/>
                </xsl:variable>
                <xsl:variable name="supNettoie">
                    <xsl:value-of select="normalize-space(//aff/sup[.=$aff]/following-sibling::text()[position()=1])"/>
                </xsl:variable>
                <xsl:variable name="supNettoie2">
                    <xsl:choose>
                        <xsl:when test="contains($supNettoie,', and')">
                            <xsl:value-of select="normalize-space(replace($supNettoie,', and',''))"/>
                        </xsl:when>
                        <xsl:when test="contains($supNettoie,';')">
                            <xsl:value-of select="normalize-space(replace($supNettoie,';',''))"/>
                        </xsl:when>
                        <xsl:when test="ends-with($supNettoie,',')">
                            <xsl:value-of select="normalize-space(replace($supNettoie,',',''))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="normalize-space($supNettoie)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:call-template name="tokenizeJats">
                    <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                </xsl:call-template>
                <affiliation>
                    <xsl:call-template name="NLMparseAffiliation">
                        <xsl:with-param name="theAffil">
                            <xsl:value-of select="$supNettoie2"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </affiliation>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
