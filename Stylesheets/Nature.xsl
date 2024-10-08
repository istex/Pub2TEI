<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:m="http://www.w3.org/1998/Math/MathML" exclude-result-prefixes="#all">
    
    <xsl:output encoding="UTF-8" method="xml"/>
    
    <xsl:template match="nihms-submit">
        <TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <xsl:apply-templates select="title"/>
                    </titleStmt>
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <xsl:if test="manuscript">
                            <availability status="embargo">
                                <p>
                                    <xsl:value-of select="manuscript/@embargo"/>
                                </p>
                            </availability>
                        </xsl:if>
                    </publicationStmt>
                    <sourceDesc>
                        <biblStruct>
                            <analytic>
                                <!-- All authors are included here -->
                                <xsl:apply-templates select="contacts/*"/>
                                <!-- Title information related to the paper goes here -->
                                <xsl:apply-templates select="title"/>
                            </analytic>
                            <monogr>
                                <xsl:apply-templates select="journal-meta/journal-title"/>
                                <xsl:apply-templates select="journal-meta/journal-id"/>
                                <xsl:apply-templates select="journal-meta/issn"/>
                            </monogr>
                        </biblStruct>
                    </sourceDesc>
                </fileDesc>
                <!-- versionning -->
                <xsl:call-template name="insertVersion"/>
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
                </revisionDesc>
            </teiHeader>
        </TEI>
    </xsl:template>
    
    <!-- +++++++++++++++++++++++++++++++++++++++++++++ -->
    <!-- author related information -->

    <xsl:template match="person[@author='yes']">
        <!-- pi="yes" corrpi="yes" ?????? -->
        <author>
            <xsl:if test="@corresp='yes'">
                <xsl:attribute name="role">
                    <xsl:text>corresp</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <persName>
                <xsl:if test="@fname">
                    <forename>
                        <xsl:value-of select="@fname"/>
                    </forename>
                </xsl:if>
                <xsl:if test="@lname">
                    <surname>
                        <xsl:value-of select="@lname"/>
                    </surname>
                </xsl:if>
            </persName>
            <xsl:if test="@email">
                <email>
                    <xsl:value-of select="@email"/>
                </email>
            </xsl:if>
        </author>
    </xsl:template>

    <xsl:template match="dateStruct">
        <date>
            <xsl:value-of select="."/>
        </date>
    </xsl:template>

    <!-- Fin de la bibliographie -->

</xsl:stylesheet>
