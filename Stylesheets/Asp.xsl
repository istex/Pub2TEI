<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:rsc="http://www.rsc.org/schema/rscart38" xmlns:ali="http://www.niso.org/schemas/ali/1.0/" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="#all">
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jun. 2021</xd:p>
            <xd:p><xd:b>Author:</xd:b> Stéphanie Gregorio</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- TEI document structure, creation of main header components, front (summary), body, and back -->
    <xsl:variable name="language">
        <xsl:choose>
            <xsl:when test="//language_of_edition='English'">en</xsl:when>
            <xsl:when test="//language_of_edition='German'">de</xsl:when>
            <xsl:when test="//language_of_edition='French'">fr</xsl:when>
        </xsl:choose>
    </xsl:variable>
    <xsl:template match="asp">
        <TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:if test="language_of_edition | text/language_of_edition">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="$language"/>
                </xsl:attribute>
            </xsl:if>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title type="main" level="a">
                            <xsl:choose>
                                <xsl:when test="text/div1[1]/p[@align][1][string-length() &gt; 0]">
                                    <xsl:value-of select="normalize-space(text/div1[1]/p[@align][1])"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="real_title | text/real_title"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </title>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <date type="published">
                            <xsl:attribute name="when">
                                <xsl:choose>
                                    <xsl:when test="div1/publication_year[string-length() &gt; 0]| text/div1/publication_year[string-length() &gt; 0]">
                                        <xsl:value-of select="substring-before(div1/publication_year| text/div1/publication_year,'-')"/>
                                    </xsl:when>
                                    <xsl:otherwise>1900</xsl:otherwise>
                                </xsl:choose>
                            </xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="div1/publication_year[string-length() &gt; 0]| text/div1/publication_year[string-length() &gt; 0]">
                                    <xsl:value-of select="substring-before(div1/publication_year| text/div1/publication_year,'-')"/>
                                </xsl:when>
                                <xsl:otherwise>1900</xsl:otherwise>
                            </xsl:choose>
                        </date>
                        <publisher ref="https://scientific-publisher.data.istex.fr">
                            <xsl:choose>
                                <xsl:when test="publisher[string-length() &gt; 0]| text/publisher[string-length() &gt; 0]">
                                    <xsl:value-of select="publisher| text/publisher"/>
                                </xsl:when>
                                <xsl:otherwise>Alexander Street Press</xsl:otherwise>
                            </xsl:choose>
                        </publisher>
                        <xsl:if test="publisher_place[string-length() &gt; 0]| text/publisher_place[string-length() &gt; 0]">
                            <pubPlace>
                                <xsl:value-of select="publisher_place| text/publisher_place"/>
                            </pubPlace>
                        </xsl:if>
                            <availability status="restricted">
                                <licence>
                                    <p>
                                        <xsl:choose>
                                            <xsl:when test="copyright_message[string-length() &gt; 0]| text/copyright_message[string-length() &gt; 0]">
                                                <xsl:value-of select="normalize-space(copyright_message| text/copyright_message)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>Copyright © </xsl:text><xsl:value-of select="substring-before(div1/publication_year| text/div1/publication_year,'-')"/><xsl:text> Journal of the Evangelical Theological Society</xsl:text>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        </p>
                                    <p scheme="https://loaded-corpus.data.istex.fr/ark:/67375/XBH-"/>
                                </licence>
                            </availability>
                    </publicationStmt>
                    <notesStmt>
                        <xsl:choose>
                            <xsl:when test="not(publication_type| text/publication_type)">
                                <note type="content-type" subtype="book" source="book" scheme="http://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T">book</note> 
                                <note type="publication-type" subtype="book" scheme="http://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F">book</note>
                            </xsl:when>
                            <xsl:when test="(publication_type| text/publication_type)='Manuscript'">
                                <note type="content-type" subtype="other" source="{publication_type| text/publication_type}" scheme="http://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0">other</note> 
                                <note type="publication-type" subtype="database" scheme="http://publication-type.data.istex.fr/ark:/67375/JMC-NTSGR1R0-Z">database</note>
                            </xsl:when>
                            <xsl:otherwise>
                                <note type="content-type" subtype="article" source="{publication_type| text/publication_type}" scheme="http://content-type.data.istex.fr/ark:/67375/XTP-6N5SZHKN-D">article</note> 
                                <note type="publication-type" subtype="journal" scheme="https://publication-type.data.istex.fr/ark:/67375/JMC-0GLKJH51-B">journal</note>
                            </xsl:otherwise>
                        </xsl:choose>

                        
                    </notesStmt>
                    <sourceDesc>
                        <biblStruct>
                            <analytic>
                                <!-- Title information related to the paper goes here -->
                                <title type="main" level="a">
                                    <xsl:choose>
                                        <xsl:when test="text/div1[1]/p[@align][1][string-length() &gt; 0]">
                                            <xsl:value-of select="normalize-space(text/div1[1]/p[@align][1])"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="real_title | text/real_title"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </title>
                                <!-- All authors are included here -->
                                <author>
                                    <persName>
                                        <xsl:choose>
                                            <xsl:when test="contains(author| text/author,'.')">
                                                <forename type="first">
                                                    <xsl:value-of select="substring-before(author| text/author,'. ')"/><xsl:text>.</xsl:text>
                                                </forename>
                                                <xsl:choose>
                                                    <xsl:when test="contains(author| text/author,'(')">
                                                        <surname>
                                                            <xsl:value-of select="substring-before(substring-after(author| text/author,'. '),' (')"/>
                                                        </surname>
                                                        <date>
                                                            <xsl:value-of select="substring-before(substring-after(author| text/author,'('),')')"/>
                                                        </date>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <surname>
                                                            <xsl:value-of select="substring-after(author| text/author,'. ')"/>
                                                        </surname>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:when test="@author[string-length() &gt; 0]">
                                                <forename type="first">
                                                    <xsl:value-of select="substring-after(@author,', ')"/>
                                                </forename>
                                                <surname>
                                                    <xsl:value-of select="substring-before(@author,', ')"/>
                                                </surname>
                                            </xsl:when>
                                            <xsl:when test="not(contains(author| text/author,'.')) and contains(author| text/author,' ')">
                                                <forename type="first">
                                                    <xsl:value-of select="substring-before(author| text/author,' ')"/>
                                                </forename>
                                                <xsl:choose>
                                                    <xsl:when test="contains(author| text/author,'(')">
                                                        <surname>
                                                            <xsl:value-of select="substring-after(substring-before(author| text/author,' ('),' ')"/>
                                                        </surname>
                                                        <date>
                                                            <xsl:value-of select="substring-before(substring-after(author| text/author,'('),')')"/>
                                                        </date>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <surname>
                                                            <xsl:value-of select="substring-after(author| text/author,' ')"/>
                                                        </surname>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <surname>
                                                    <xsl:value-of select="author| text/author"/>
                                                </surname>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:if test="/asp/div1/note/p[string-length() &gt; 0]| text/asp/div1/note/p[string-length() &gt; 0]">
                                            <roleName>
                                                <xsl:value-of select="normalize-space(/asp/div1/note/p| text//asp/div1/note/p)"/>
                                            </roleName>
                                        </xsl:if>
                                    </persName>
                                </author>
                                <xsl:apply-templates select="div1/dorpid| text/div1/dorpid"/>
                                <xsl:apply-templates select="div1/entity_id| text/div1/entity_id"/>
                            </analytic>
                            <monogr>
                                <title type="main">
                                    <xsl:choose>
                                        <xsl:when test="source_title[string-length() &gt; 0]| text/source_title[string-length() &gt; 0]">
                                            <xsl:attribute name="level">j</xsl:attribute>
                                            <xsl:value-of select="substring-before(source_title| text/source_title,',')"/>
                                        </xsl:when>
                                        <xsl:when test="text/div1[1]/p[@align][1][string-length() &gt; 0]">
                                            <xsl:attribute name="level">m</xsl:attribute>
                                            <xsl:value-of select="normalize-space(text/div1[1]/p[@align][1])"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="level">m</xsl:attribute>
                                            <xsl:value-of select="real_title| text/real_title"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </title>
                                <xsl:apply-templates select="dorpid| text/dorpid"/>
                                <xsl:apply-templates select="entity_id| text/entity_id"/>
                                <xsl:apply-templates select="page_count| text/page_count"/>
                                <xsl:if test="@isbn[string-length() &gt; 0]">
                                    <idno type="isbn">
                                        <xsl:value-of select="@isbn"/>
                                    </idno>
                                </xsl:if>
                                <xsl:if test="@lccn[string-length() &gt; 0]">
                                    <idno type="lccn">
                                        <xsl:value-of select="@lccn"/>
                                    </idno>
                                </xsl:if>
                                <imprint>
                                    <publisher>
                                        <xsl:choose>
                                            <xsl:when test="publisher[string-length() &gt; 0]| text/publisher[string-length() &gt; 0]">
                                                <xsl:value-of select="publisher| text/publisher"/>
                                            </xsl:when>
                                            <xsl:otherwise>Alexander Street Press</xsl:otherwise>
                                        </xsl:choose>
                                    </publisher>
                                    <xsl:if test="publisher_place[string-length() &gt; 0]| text/publisher_place[string-length() &gt; 0]">
                                        <pubPlace>
                                            <xsl:value-of select="publisher_place| text/publisher_place"/>
                                        </pubPlace>
                                    </xsl:if>
                                        <date>
                                            <xsl:attribute name="when">
                                                <xsl:choose>
                                                    <xsl:when test="div1/publication_year[string-length() &gt; 0]| text/div1/publication_year[string-length() &gt; 0]">
                                                        <xsl:value-of select="substring-before(div1/publication_year| text/div1/publication_year,'-')"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>1900</xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:attribute>
                                            <xsl:choose>
                                                <xsl:when test="div1/publication_year[string-length() &gt; 0]| text/div1/publication_year[string-length() &gt; 0]">
                                                    <xsl:value-of select="substring-before(div1/publication_year| text/div1/publication_year,'-')"/>
                                                </xsl:when>
                                                <xsl:otherwise>1900</xsl:otherwise>
                                            </xsl:choose>
                                        </date>
                                    
                                    <xsl:if test="contains(source_title| text/source_title,'Vol.')">
                                        <biblScope unit="vol">
                                            <xsl:value-of select="normalize-space(substring-before(substring-after(source_title| text/source_title,'Vol.'),','))"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:if test="contains(source_title| text/source_title,'No.')">
                                        <biblScope unit="issue">
                                            <xsl:value-of select="normalize-space(substring-before(substring-after(source_title| text/source_title,'No.'),','))"/>
                                        </biblScope>
                                    </xsl:if>
                                    <xsl:if test="contains(source_title| text/source_title,'pp.')">
                                        <xsl:variable name="decoupPage">
                                            <xsl:value-of select="normalize-space(substring-after(source_title| text/source_title,'pp.'))"/> 
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="contains($decoupPage,'-')">
                                                <biblScope unit="page" from="{normalize-space(substring-before($decoupPage,'-'))}">
                                                    <xsl:value-of select="normalize-space(substring-before($decoupPage,'-'))"/> 
                                                </biblScope>
                                                <biblScope unit="page" to="{normalize-space(substring-after($decoupPage,'-'))}">
                                                    <xsl:value-of select="normalize-space(substring-after($decoupPage,'-'))"/> 
                                                </biblScope>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <biblScope unit="page">
                                                    <xsl:value-of select="$decoupPage"/> 
                                                </biblScope>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                </imprint>
                            </monogr>
                            <xsl:if test="hub_collection[string-length() &gt; 0] |text/hub_collection[string-length() &gt; 0]">
                                <series>
                                    <title type="main" level="s">
                                        <xsl:value-of select="hub_collection|text/hub_collection"/>
                                    </title>
                                </series>
                            </xsl:if>
                        </biblStruct>
                    </sourceDesc>
                </fileDesc>
                <!-- versionning -->
                <xsl:call-template name="insertVersion"/>
                
                <!-- profileDesc -->
                    <profileDesc>
                        <creation>
                            <date>
                                <xsl:choose>
                                    <xsl:when test="div1/publication_year[string-length() &gt; 0]| text/div1/publication_year[string-length() &gt; 0]">
                                        <xsl:value-of select="substring-before(div1/publication_year| text/div1/publication_year,'-')"/>
                                    </xsl:when>
                                    <xsl:otherwise>1900</xsl:otherwise>
                                </xsl:choose>
                            </date>
                        </creation>
                        <xsl:if test="language_of_edition| text/language_of_edition">
                            <langUsage>
                                <language>
                                    <xsl:attribute name="ident">
                                <xsl:value-of select="$language"/>
                            </xsl:attribute>
                                </language>
                            </langUsage>
                        </xsl:if>
                        <xsl:if test="keyword[string-length() &gt; 0]| text/keyword[string-length() &gt; 0]">
                            <textClass>
                                <keywords scheme="keyword">
                                    <xsl:apply-templates select="keyword| text/keyword"/>
                                </keywords>
                            </textClass>
                        </xsl:if>
                        <xsl:if test="aspgroup| text/aspgroup">
                            <xsl:apply-templates select="aspgroup| text/aspgroup"/>
                        </xsl:if>
                        <xsl:if test="religion_social_subject_discussed[string-length() &gt; 0]| text/religion_social_subject_discussed[string-length() &gt; 0]">
                            <textClass>
                                <xsl:call-template name="decoup"/>
                            </textClass>
                        </xsl:if>
                    </profileDesc>
                
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
                </revisionDesc>
            </teiHeader>
            <text>
                <body>
                    <xsl:choose>
                        <xsl:when test="div1/p| text/div1/p">
                            <xsl:apply-templates select="div1| text/div1"/>
                        </xsl:when>
                        <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                            <div>
                                <p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
                            </div>
                        </xsl:when>
                        <xsl:otherwise>
                            <div><p></p></div>
                        </xsl:otherwise>
                    </xsl:choose>
                </body>
            </text>
        </TEI>
    </xsl:template>
    <xsl:template match="div1">
        <div>
            <xsl:apply-templates select="pb |p |table"/>
        </div>
    </xsl:template>
    <xsl:template match="entity_id">
        <idno type="entity_id">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="dorpid">
        <idno type="dorpid">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="page_count">
        <idno type="page_count">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="aspgroup">
        <textClass>
            <keywords scheme="journal-subject">
                <term>
                    <xsl:apply-templates/>
                </term>
            </keywords>
        </textClass>
    </xsl:template>
    <xsl:template  name="decoup">
        <keywords scheme="journal-subject">
            <xsl:call-template name="tokenizekw"/>
        </keywords>
    </xsl:template>
    <xsl:template match="//div1/religion_social_subject_discussed" name="tokenizekw">
        <xsl:param name="text" select="//div1/religion_social_subject_discussed"/>
        <xsl:param name="separator" select="';'"/>
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
                    <xsl:call-template name="tokenizekw">
                        <xsl:with-param name="text" select="substring-after($text, $separator)"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
