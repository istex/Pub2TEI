<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns:m="http://www.w3.org/1998/Math/MathML" exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:variable name="codeGenreSpringerJournal">
        <xsl:value-of select="//ArticleInfo/@ArticleType | //BookInfo/@BookProductType"/>
    </xsl:variable>
    <xsl:variable name="codeGenreSJ">
        <xsl:choose>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='Graduate/advanced undergraduate textbook'">chapter</xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='OriginalPaper'">
                <xsl:choose>
                    <xsl:when test="//Abstract and //Keyword">research-article</xsl:when>
                    <xsl:when test="//Abstract">article</xsl:when>
                    <xsl:otherwise>article</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='Article'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='Report'">case-report</xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='Letter'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='Legacy'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='News'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='ContinuingEducation'">article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='ReviewPaper'">review-article</xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='BriefCommunication'">brief-communication</xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='EditorialNotes'">editorial</xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='BookReview'">book-reviews</xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='Abstract'">abstract</xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='CaseReport'">case-report</xsl:when>
            <xsl:when test="normalize-space($codeGenreSpringerJournal)='Announcement' and //Abstract[string-length()&gt; 0]">article</xsl:when>
            <xsl:otherwise>other</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="codeGenreArkSJ">
        <xsl:choose>
            <xsl:when test="normalize-space($codeGenreSJ)='research-article'">https://content-type.data.istex.fr/ark:/67375/XTP-1JC4F85T-7</xsl:when>
            <xsl:when test="normalize-space($codeGenreSJ)='article'">https://content-type.data.istex.fr/ark:/67375/XTP-6N5SZHKN-D</xsl:when>
            <xsl:when test="normalize-space($codeGenreSJ)='other'">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:when>
            <xsl:when test="normalize-space($codeGenreSJ)='book-reviews'">https://content-type.data.istex.fr/ark:/67375/XTP-PBH5VBM9-4</xsl:when>
            <xsl:when test="normalize-space($codeGenreSJ)='abstract'">https://content-type.data.istex.fr/ark:/67375/XTP-HPN7T1Q2-R</xsl:when>
            <xsl:when test="normalize-space($codeGenreSJ)='review-article'">https://content-type.data.istex.fr/ark:/67375/XTP-L5L7X3NF-P</xsl:when>
            <xsl:when test="normalize-space($codeGenreSJ)='brief-communication'">https://content-type.data.istex.fr/ark:/67375/XTP-S9SX2MFS-0</xsl:when>
            <xsl:when test="normalize-space($codeGenreSJ)='editorial'">https://content-type.data.istex.fr/ark:/67375/XTP-STW636XV-K</xsl:when>
            <xsl:when test="normalize-space($codeGenreSJ)='case-report'">https://content-type.data.istex.fr/ark:/67375/XTP-29919SZJ-6</xsl:when>
            <xsl:when test="normalize-space($codeGenreSJ)='conference'">https://content-type.data.istex.fr/ark:/67375/XTP-BFHXPBJJ-3</xsl:when>
            <xsl:when test="normalize-space($codeGenreSJ)='chapter'">https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6</xsl:when>
            <xsl:when test="normalize-space($codeGenreSJ)='book'">https://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T</xsl:when>
        </xsl:choose>
    </xsl:variable>
    <!-- TEI document structure, creation of main header components, front (summary), body, and back -->
    <xsl:template match="/Publisher[not(Series/Book/descendant::Chapter)]">
        <xsl:variable name="countArticle">
            <xsl:value-of select="count(//Article)"/>
        </xsl:variable>
        <TEI  xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <xsl:apply-templates select="Journal//ArticleInfo | Book/BookInfo/BookTitle"/>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <!-- publisher -->
                        <xsl:apply-templates select="//PublisherName"/>
                        <xsl:apply-templates select="//PublisherLocation"/>
                        <xsl:choose>
                            <xsl:when test="Journal/JournalOnlineFirst">
                                <xsl:apply-templates
                                    select="Journal/JournalOnlineFirst/Article[1]/ArticleInfo/ArticleCopyright"
                                />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates
                                    select="Journal/Volume[1]/Issue/Article[1]/ArticleInfo/ArticleCopyright"
                                />
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:apply-templates
                            select="Book/descendant::Chapter[1]/ChapterInfo/ChapterCopyright"/>
                        
                        <!-- date -->
                        <xsl:choose>
                            <xsl:when test="//Volume[1]/CoverDate/Year !=''">
                                <date type="published" when="{//Volume[1]/CoverDate/Year}">
                                    <xsl:value-of select="//Volume[1]/CoverDate/Year"/>
                                </date>
                            </xsl:when>
                            <xsl:when test="number(//Volume[1]/Issue/IssueInfo/IssueCopyright/CopyrightYear)">
                                <date type="published" when="{//Volume[1]/Issue/IssueInfo/IssueCopyright/CopyrightYear}">
                                    <xsl:value-of select="//Volume[1]/Issue/IssueInfo/IssueCopyright/CopyrightYear"/>
                                </date>
                            </xsl:when>
                            <xsl:when test="number(//Book/BookInfo/BookCopyright/CopyrightYear)">
                                <date type="published" when="{//Book/BookInfo/BookCopyright/CopyrightYear}">
                                    <xsl:value-of select="//Book/BookInfo/BookCopyright/CopyrightYear"/>
                                </date>
                            </xsl:when>
                        </xsl:choose>
                    </publicationStmt>
                    <notesStmt>
                        <!-- niveau book -->
                        <note type="content-type">
                            <xsl:attribute name="subtype">
                                <xsl:value-of select="$codeGenreSJ"/>
                            </xsl:attribute>
                            <xsl:attribute name="source">
                                <xsl:value-of select="$codeGenreSpringerJournal"/>
                            </xsl:attribute>
                            <xsl:attribute name="scheme">
                                <xsl:value-of select="$codeGenreArkSJ"/>
                            </xsl:attribute>
                            <xsl:value-of select="$codeGenreSJ"/>
                        </note>
                        <!-- niveau revue / book -->
                        <xsl:choose>
                            <xsl:when test="//Journal">
                                <note type="publication-type" subtype="journal">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                    <xsl:text>journal</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//Series">
                                <note type="publication-type" subtype="book-series">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                    <xsl:text>book-series</xsl:text>
                                </note>
                            </xsl:when>
                            <xsl:when test="//Book and not(//Series)">
                                <note type="publication-type" subtype="book">
                                    <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                    <xsl:text>book</xsl:text>
                                </note>
                            </xsl:when>
                        </xsl:choose>
                    </notesStmt>
                    <sourceDesc>
                        <xsl:choose>
                            <xsl:when test="$countArticle&gt;=2">
                                <xsl:apply-templates select="//Article[ArticleInfo]"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="Journal" mode="sourceDesc"/>
                                <xsl:apply-templates select="Book" mode="sourceDesc"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </sourceDesc>
                </fileDesc>
       
                <!-- versionning -->
                <xsl:call-template name="insertVersion"/>
                <xsl:choose>
                    <xsl:when test="Journal/JournalOnlineFirst">
                        <xsl:if test="Journal/JournalOnlineFirst/Article/ArticleHeader/KeywordGroup">
                            <profileDesc>
                                <xsl:apply-templates
                                    select="Journal/JournalOnlineFirst/Article/ArticleHeader/KeywordGroup"
                                />
                                <xsl:apply-templates
                                    select="Journal/Volume/Issue/Article/ArticleHeader/AbbreviationGroup"
                                />
                                <textClass ana="subject">
                                <xsl:apply-templates
                                    select="Journal/JournalInfo/JournalSubjectGroup"
                                />
                                </textClass>
                            </profileDesc>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="Journal/Volume/Issue/Article/ArticleHeader/KeywordGroup |Journal/JournalInfo/JournalSubjectGroup">
                            <profileDesc>
								<!-- PL: abstract is moved here from <front> -->
			                    <xsl:choose>
			                        <xsl:when test="Journal/JournalOnlineFirst">
			                            <xsl:apply-templates
			                                select="Journal/JournalOnlineFirst/Article/ArticleHeader/Abstract"/>
			                        </xsl:when>
			                        <xsl:otherwise>
			                            <xsl:apply-templates
			                                select="Journal/Volume/Issue/Article/ArticleHeader/Abstract"/>
			                        </xsl:otherwise>
			                    </xsl:choose>
                                <textClass ana="subject">
                                    <xsl:apply-templates
                                        select="Journal/JournalInfo/JournalSubjectGroup"
                                    />
                                </textClass>
                                    <xsl:apply-templates
                                        select="Journal/Volume/Issue/Article/ArticleHeader/AbbreviationGroup"
                                    />
                                
                                <xsl:apply-templates
                                    select="Journal/Volume/Issue/Article/ArticleHeader/KeywordGroup"
                                />
                                <!-- Language -->
                                <xsl:choose>
                                    <xsl:when test="//ArticleTitle[1]/@Language != '--'">
                                        <langUsage>
                                            <language>
                                                <xsl:attribute name="ident">
                                                    <xsl:choose>
                                                        <xsl:when test="//ArticleDOI='10.1007/BF02584710'">pt</xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="translate(//Volume[1]/Issue/Article[1]/ArticleInfo/ArticleTitle[1]/@Language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:attribute>
                                            </language>
                                        </langUsage>
                                    </xsl:when>
                                    <xsl:when test="//ArticleInfo/@Language !='--'">
                                        <langUsage>
                                            <language>
                                                <xsl:attribute name="ident">
                                                    <xsl:choose>
                                                        <xsl:when test="//ArticleDOI='10.1007/BF02584710'">pt</xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="translate(//ArticleInfo/@Language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:attribute>
                                            </language>
                                        </langUsage>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <langUsage>
                                            <language>
                                                <xsl:attribute name="ident">
                                                    <xsl:choose>
                                                        <xsl:when test="contains(//ArticleTitle[1],'И')">ru</xsl:when>
                                                        <xsl:when test="//City='Прага'">ru</xsl:when>
                                                        <xsl:when test="//City='Praha'">cs</xsl:when>
                                                        <xsl:when test="//Country='Russia'">ru</xsl:when>
                                                        <xsl:when test="//ArticleDOI='10.1007/BF02584710'">pt</xsl:when>
                                                        <xsl:when test="//ArticleDOI='10.1007/BF02192581'
                                                            or //ArticleDOI='10.1007/BF02334726'
                                                            or //ArticleDOI='10.1007/BF01461250'
                                                            or //ArticleDOI='10.1007/BF02192579'
                                                            or //ArticleDOI='10.1007/BF02192580'
                                                            or //ArticleDOI='10.1007/BF02314882'
                                                            or //ArticleDOI='10.1007/BF02203888'
                                                            or //ArticleDOI='10.1007/BF02314879'
                                                            ">nl</xsl:when>
                                                        <xsl:when test="//ArticleDOI='10.1007/BF02935462'">cs</xsl:when>
                                                        <xsl:when test="//CopyrightHolderName='Warszawa'">pl</xsl:when>
                                                        <xsl:when test="//CopyrightHolderName='Akadémiai Kiadó'">ru</xsl:when>
                                                        <xsl:when test="//CopyrightHolderName='Czechoslovak Academy of Sciences'">cs</xsl:when>
                                                        <xsl:when test="//CopyrightHolderName='Academia, Publishing House of the Czechoslovak Academy of Sciences'">cs</xsl:when>
                                                        <xsl:when test="//CopyrightHolderName='Institute of Microbiology, Academy of Sciences of the Czech Republic'">cs</xsl:when>
                                                        <xsl:when test="//CopyrightHolderName='The Society of the Nippon Dental University'">en</xsl:when>
                                                        <xsl:when test="//CopyrightHolderName='The Ichthyological Society of Japan'">en</xsl:when>
                                                        <xsl:when test="//CopyrightHolderName='Państwowe Wydawnictwo Naukowe'">pl</xsl:when>
                                                        <xsl:when test="//CopyrightHolderName='De Erven F. Bohn'">nl</xsl:when>
                                                        <xsl:when test="//CopyrightHolderName='Kluwer Academic Publishers'">nl</xsl:when>
                                                        <xsl:when test="//CopyrightHolderName='J. H. Gebhard &amp; Comp.'">nl</xsl:when>
                                                        <xsl:when test="//CopyrightHolderName='De Nederlandsche Boek- En Steendrukkerij'">nl</xsl:when>
                                                        <xsl:when test="//CopyrightHolderName='Gedrukt BIJ H. Veeman &amp; Zonen'">nl</xsl:when>
                                                        <xsl:when test="//ArticleDOI='10.1007/BF02585119'">ru</xsl:when>
                                                        <xsl:when test="//ArticleDOI='10.1007/BF03039150' 
                                                            or //ArticleDOI='10.1007/BF03039153'
                                                            or //ArticleDOI='10.1007/BF03039027'
                                                            or //ArticleDOI='10.1007/BF03039152'
                                                            ">en</xsl:when>
                                                        <xsl:when test="//Abstract/Heading ='Аннотация'">ru</xsl:when>
                                                        <xsl:when test="//Abstract/Heading ='Анномачuя'">ru</xsl:when>
                                                        <xsl:when test="//Abstract/Heading ='Аннотациа'">ru</xsl:when>
                                                        <xsl:when test="//Abstract/Heading ='Краткое содержание'">ru</xsl:when>
                                                        <xsl:when test="//Abstract/Heading ='--Реэюме'">ru</xsl:when>
                                                        <xsl:when test="//Abstract/Heading ='Súhrn'">sk</xsl:when>
                                                        <xsl:when test="//Abstract/Heading ='Souhrn'">cs</xsl:when>
                                                        <xsl:when test="//Abstract/Heading ='Abstract'">en</xsl:when>
                                                        <xsl:when test="//Abstract/Heading ='Conclusie'">nl</xsl:when>
                                                        <xsl:when test="//Abstract/Heading ='Conclusies'">nl</xsl:when>
                                                        <xsl:when test="//Abstract/Heading ='Samenvatting'">nl</xsl:when>
                                                        <xsl:when test="//ArticleInfo[1]/@Language= '--'">und</xsl:when>
                                                        <xsl:otherwise>und</xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:attribute>
                                            </language>
                                        </langUsage>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </profileDesc>
                        </xsl:if>
                        <xsl:if test="Book/descendant::Chapter/ChapterHeader/Abstract 
                            | Book/descendant::Chapter/ChapterHeader/AbbreviationGroup
                            | Book/descendant::Chapter/ChapterHeader/KeywordGroup
                            |Book/descendant::SubjectCollection
                            | Book/descendant::BookSubjectGroup">
                            <profileDesc>
                                <xsl:apply-templates select="Book/descendant::Chapter/ChapterHeader/Abstract"/>
                                <xsl:apply-templates select="Book/descendant::Chapter/ChapterHeader/AbbreviationGroup"/>
                                <xsl:apply-templates select="Book/descendant::Chapter/ChapterHeader/KeywordGroup"/>
                                <textClass ana="subject">
                                    <xsl:apply-templates select="Book/descendant::SubjectCollection"/></textClass>
                                <textClass ana="subject">
                                    <xsl:apply-templates select="Book/descendant::BookSubjectGroup"/>
                                </textClass>
                                <xsl:if test="//Chapter/@Language">
                                    <langUsage>
                                        <language>
                                            <xsl:attribute name="ident">
                                                <xsl:value-of select="translate(//Chapter/@Language,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                            </xsl:attribute>
                                        </language>
                                    </langUsage>
                                </xsl:if>
                            </profileDesc>
                        </xsl:if>
                       
                    </xsl:otherwise>
                </xsl:choose>
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
                    <xsl:if test="Journal/Volume/Issue/Article[1]/ArticleInfo/ArticleHistory">
                        <xsl:apply-templates
                            select="Journal/Volume/Issue/Article[1]/ArticleInfo/ArticleHistory"/>
                    </xsl:if>
                </revisionDesc>
            </teiHeader>
			<text>
			    <body>
			        <div>
			            <xsl:if test="string-length($rawfulltextpath) &gt; 0">
			                <p>
			                    <xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/>
			                </p>
			            </xsl:if>
			        </div>
			    </body>
			</text>
        </TEI>
    </xsl:template>

    <!-- Building the sourceDesc bibliographical representation -->
    <xsl:template match="Journal" mode="sourceDesc">
        <xsl:apply-templates select="Volume"/>
    </xsl:template>
    <xsl:template match="Volume">
        <biblStruct>
            <analytic>
                <xsl:choose>
                    <xsl:when test="//Journal/JournalOnlineFirst">
                        <!-- Title information related to the paper goes here -->
                        <xsl:apply-templates
                            select="//Journal/JournalOnlineFirst/Article/ArticleInfo/ArticleTitle"/>
                        <!-- All authors are included here -->
                        <xsl:apply-templates
                            select="//Journal/JournalOnlineFirst/Article/ArticleHeader/AuthorGroup/Author" mode="springer"/>
                        <xsl:apply-templates
                            select="//Journal/JournalOnlineFirst/Article/ArticleHeader/AuthorGroup/InstitutionalAuthor" mode="springer"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- Title information related to the paper goes here -->
                        <xsl:apply-templates select="Issue/Article/ArticleInfo"/>
                        <!-- All authors are included here -->
                        <xsl:apply-templates
                            select="Issue/Article/ArticleHeader/AuthorGroup/Author" mode="springer"/>
                        <xsl:apply-templates
                            select="Issue/Article/ArticleHeader/AuthorGroup/InstitutionalAuthor" mode="springer"/>
                    </xsl:otherwise>
                </xsl:choose>
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
                <xsl:choose>
                    <xsl:when test="//Journal/JournalOnlineFirst">
                        <xsl:apply-templates select="//Journal/JournalOnlineFirst/Article/@ID"/>
                        <xsl:apply-templates select="//Journal/JournalOnlineFirst/Article/ArticleInfo/ArticleDOI"/>
                        <xsl:apply-templates select="//Journal/JournalOnlineFirst/Article/ArticleInfo/ArticleID"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="Issue/Article/@ID"/>
                        <xsl:apply-templates select="Issue/Article/ArticleInfo/ArticleDOI"/>
                        <xsl:apply-templates select="Issue/Article/ArticleInfo/ArticleID"/>
                    </xsl:otherwise>
                </xsl:choose>
                
            </analytic>
            <monogr>
                <xsl:apply-templates select="//Journal/JournalInfo/JournalTitle"/>
                <xsl:apply-templates select="//Journal/JournalInfo/JournalAbbreviatedTitle"/>
                <xsl:apply-templates select="//Journal/JournalInfo/JournalID"/>
                <xsl:apply-templates select="//Journal/JournalInfo/JournalPrintISSN"/>
                <xsl:apply-templates select="//Journal/JournalInfo/JournalElectronicISSN"/>
                <xsl:apply-templates select="Issue/IssueInfo/IssueTitle"/>
                <imprint>
                    <xsl:apply-templates select="//Publisher/PublisherInfo/*"/>
                    <!-- date -->
                    <xsl:choose>
                        <xsl:when test="CoverDate/Year !=''">
                            <date type="published" when="{CoverDate/Year}">
                                <xsl:value-of select="CoverDate/Year"/>
                            </date>
                        </xsl:when>
                        <xsl:when test="number(Issue/IssueInfo/IssueCopyright/CopyrightYear)">
                            <date type="published" when="{Issue/IssueInfo/IssueCopyright/CopyrightYear}">
                                <xsl:value-of select="Issue/IssueInfo/IssueCopyright/CopyrightYear"/>
                            </date>
                        </xsl:when>
                        <xsl:when test="number(//Book/BookInfo/BookCopyright/CopyrightYear)">
                            <date type="published" when="{//Book/BookInfo/BookCopyright/CopyrightYear}">
                                <xsl:value-of select="//Book/BookInfo/BookCopyright/CopyrightYear"/>
                            </date>
                        </xsl:when>
                    </xsl:choose>
                    
                    <xsl:if test="VolumeInfo/VolumeIDStart !=''">
                        <xsl:if test="VolumeInfo/VolumeIDStart !='0'">
                            <biblScope unit="vol" from="{VolumeInfo/VolumeIDStart}" to="{VolumeInfo/VolumeIDEnd}">
                            <xsl:choose>
                                <xsl:when test="VolumeInfo/VolumeIDStart != VolumeInfo/VolumeIDEnd">
                                    <xsl:apply-templates select="VolumeInfo/VolumeIDStart"/>
                                    <xsl:text>-</xsl:text>
                                    <xsl:apply-templates select="VolumeInfo/VolumeIDEnd"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="VolumeInfo/VolumeIDStart"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </biblScope>
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="Issue/IssueInfo/IssueIDStart !=''">
                        <xsl:if test="Issue/IssueInfo/IssueIDStart !='0'">
                            <biblScope unit="issue" from="{Issue/IssueInfo/IssueIDStart}" to="{Issue/IssueInfo/IssueIDEnd}">
                                <xsl:choose>
                                    <xsl:when test="Issue/IssueInfo/IssueIDStart != Volume/Issue/IssueInfo/IssueIDEnd">
                                        <xsl:apply-templates select="Issue/IssueInfo/IssueIDStart"/>
                                        <xsl:text>-</xsl:text>
                                        <xsl:apply-templates select="Issue/IssueInfo/IssueIDEnd"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="Issue/IssueInfo/IssueIDStart"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </biblScope>
                        </xsl:if>
                    </xsl:if>
                    <xsl:apply-templates select="Issue/Article/ArticleInfo/ArticleFirstPage"/>
                    <xsl:apply-templates select="Issue/Article/ArticleInfo/ArticleLastPage"/>
                </imprint>
            </monogr>
        </biblStruct>
    </xsl:template>

    <!-- Building the sourceDesc bibliographical representation -->
    
    <xsl:template match="Book" mode="sourceDesc">
        <biblStruct>
            <analytic>
                <!-- Title information related to the chapter goes here -->
                <xsl:apply-templates select="descendant::Chapter/ChapterInfo/ChapterTitle"/>
                <!-- All authors are included here -->
                <xsl:apply-templates select="descendant::Chapter/ChapterHeader/AuthorGroup/Author" mode="springer"/>
                <xsl:apply-templates
                    select="descendant::Chapter/ChapterHeader//AuthorGroup/InstitutionalAuthor" mode="springer"/>
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
                <xsl:apply-templates select="Chapter/ChapterInfo/ChapterID"/>
                <xsl:apply-templates select="descendant::Chapter/ChapterInfo/ChapterDOI"/>
            </analytic>
            <monogr>
                <xsl:apply-templates select="BookInfo/BookTitle"/>
                <xsl:apply-templates select="BookInfo/BookSubTitle"/>
                <xsl:apply-templates select="Part/PartInfo/PartTitle"/>
                <xsl:apply-templates select="BookInfo/BookDOI"/>
                <xsl:apply-templates select="BookInfo/BookID"/>
                <xsl:apply-templates select="BookInfo/BookTitleID"/>
                <xsl:apply-templates select="BookInfo/BookPrintISBN"/>
                <xsl:apply-templates select="BookInfo/BookElectronicISBN"/>
                <xsl:apply-templates select="//Chapter"/>
                <xsl:apply-templates select="//Part"/>
                <xsl:apply-templates select="BookHeader/AuthorGroup/Author" mode="springer"/>
                <xsl:apply-templates select="BookHeader/EditorGroup/Editor"/>
                <xsl:apply-templates select="BookInfo/ConferenceInfo"/>
                <imprint>
                    <xsl:apply-templates select="BookInfo/BookVolumeNumber"/>
                    <xsl:apply-templates select="descendant::Chapter/ChapterInfo/ChapterFirstPage"/>
                    <xsl:apply-templates select="descendant::Chapter/ChapterInfo/ChapterLastPage"/>
                    <xsl:apply-templates select="Volume/VolumeInfo"/>
                    <xsl:apply-templates select="BookInfo/BookChapterCount"/>
                    <xsl:apply-templates select="Part/PartInfo/PartChapterCount"/>
                    <xsl:apply-templates select="Volume/Issue/IssueInfo/IssueIDStart"/>
                    <xsl:apply-templates select="Volume/Issue/IssueInfo/IssueIDEnd"/>
                </imprint>
            </monogr>
        </biblStruct>
    </xsl:template>
</xsl:stylesheet>
