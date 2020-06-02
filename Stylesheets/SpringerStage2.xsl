<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:xml="http://www.w3.org/XML/1998/namespace" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>

    <xsl:template match="Publisher">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- TEI document structure, creation of main header components, front (summary), body, and back -->
    <xsl:template match="Article[ArticleInfo]">
        <xsl:apply-templates select="ArticleInfo" mode="sourceDesc"/>
    </xsl:template>

    <!-- Building the sourceDesc bibliographical representation -->
    <xsl:template match="ArticleInfo" mode="sourceDesc">
        <biblStruct>
            <analytic>
                <!-- Title information related to the paper goes here -->
                <xsl:for-each select="ArticleTitle">
                    <xsl:if test="not(contains(.,'? Titel ?'))">
                        <xsl:apply-templates select="."/>
                    </xsl:if>
                </xsl:for-each>
                <!-- All authors are included here -->
                <xsl:apply-templates select="../ArticleHeader/AuthorGroup/Author" mode="springer"/>
                <xsl:apply-templates select="ArticleDOI"/>
                <xsl:apply-templates select="/Article/@ID"/>
                <xsl:apply-templates select="ArticleID"/>
            </analytic>
            <monogr>
                <xsl:apply-templates select="//Journal/JournalInfo/JournalTitle"/>
                <xsl:apply-templates select="//Journal/JournalInfo/JournalAbbreviatedTitle"/>
                <xsl:apply-templates select="//Journal/JournalInfo/JournalID"/>
                <xsl:apply-templates select="//Journal/JournalInfo/JournalPrintISSN"/>
                <xsl:apply-templates select="//Journal/JournalInfo/JournalElectronicISSN"/>
                <xsl:apply-templates select="//Issue/IssueInfo/IssueTitle"/>
                <imprint>
                    <xsl:apply-templates select="//Publisher/PublisherInfo/*"/>
                    <!-- date -->
                    <xsl:choose>
                        <xsl:when test="//CoverDate/Year !=''">
                            <date type="published" when="{//CoverDate/Year}">
                                <xsl:value-of select="//CoverDate/Year"/>
                            </date>
                        </xsl:when>
                        <xsl:when test="number(//Issue/IssueInfo/IssueCopyright/CopyrightYear)">
                            <date type="published" when="{//Issue/IssueInfo/IssueCopyright/CopyrightYear}">
                                <xsl:value-of select="//Issue/IssueInfo/IssueCopyright/CopyrightYear"/>
                            </date>
                        </xsl:when>
                        <xsl:when test="number(//Book/BookInfo/BookCopyright/CopyrightYear)">
                            <date type="published" when="{//Book/BookInfo/BookCopyright/CopyrightYear}">
                                <xsl:value-of select="//Book/BookInfo/BookCopyright/CopyrightYear"/>
                            </date>
                        </xsl:when>
                    </xsl:choose>
                    
                    <xsl:if test="//VolumeInfo/VolumeIDStart !=''">
                        <xsl:if test="//VolumeInfo/VolumeIDStart !='0'">
                            <biblScope unit="vol" from="{//VolumeInfo/VolumeIDStart}" to="{//VolumeInfo/VolumeIDEnd}">
                                <xsl:choose>
                                    <xsl:when test="//VolumeInfo/VolumeIDStart != //VolumeInfo/VolumeIDEnd">
                                        <xsl:apply-templates select="//VolumeInfo/VolumeIDStart"/>
                                        <xsl:text>-</xsl:text>
                                        <xsl:apply-templates select="//VolumeInfo/VolumeIDEnd"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//VolumeInfo/VolumeIDStart"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </biblScope>
                        </xsl:if>
                    </xsl:if>
                    <xsl:if test="//Issue/IssueInfo/IssueIDStart !=''">
                        <xsl:if test="//Issue/IssueInfo/IssueIDStart !='0'">
                            <biblScope unit="issue" from="{//Issue/IssueInfo/IssueIDStart}" to="{//Issue/IssueInfo/IssueIDEnd}">
                                <xsl:choose>
                                    <xsl:when test="//Issue/IssueInfo/IssueIDStart != //Volume/Issue/IssueInfo/IssueIDEnd">
                                        <xsl:apply-templates select="//Issue/IssueInfo/IssueIDStart"/>
                                        <xsl:text>-</xsl:text>
                                        <xsl:apply-templates select="//Issue/IssueInfo/IssueIDEnd"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//Issue/IssueInfo/IssueIDStart"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </biblScope>
                        </xsl:if>
                    </xsl:if>
                    <xsl:apply-templates select="ArticleFirstPage"/>
                    <xsl:apply-templates select="ArticleLastPage"/>
                </imprint>
            </monogr>
        </biblStruct>
    </xsl:template>

</xsl:stylesheet>
