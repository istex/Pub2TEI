<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns="http://www.tei-c.org/ns/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:sb="http://www.elsevier.com/xml/common/struct-bib/dtd" xmlns:wiley="http://www.wiley.com/namespaces/wiley"
    xmlns:rsc="http://www.rsc.org/schema/rscart38" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- Generic rules for the decomposing names (cf. e.g. BMJ) -->
    <xsl:template match="name | persname| rsc:persname | auname">
        <xsl:choose>
            <xsl:when test="ancestor::fm | ancestor::ref/element-citation |ancestor::ref/nlm-citation |ancestor::ref/citation |ancestor::ref/mixed-citation and not(ancestor::person-group)">
                <author>
                    <persName>
                        <xsl:apply-templates/>
                    </persName>
                </author>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="ancestor::book-part-meta">
                        <xsl:apply-templates/>
                    </xsl:when>
                    <xsl:otherwise>
                        <persName>
                            <xsl:apply-templates select="* except(x)"/>
                        </persName>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="affSSID">
        <affiliation>
            <xsl:if test="institution">
                <xsl:apply-templates select="institution"/>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="addr-line | country">
                    <address>
                        <xsl:apply-templates select="addr-line"/>
                        <xsl:apply-templates select="addr-line/named-content[@content-type='street']"/>
                        <xsl:apply-templates select="addr-line/named-content[@content-type='state']"/>
                        <xsl:apply-templates select="addr-line/named-content[@content-type='postcode']"/>
                        <xsl:apply-templates select="addr-line/named-content[@content-type='city']"/>
                        <xsl:apply-templates select="country"/>
                    </address>
                </xsl:when>
                <xsl:when test="named-content">
                    <address>
                        <xsl:apply-templates select="named-content[@content-type='street']"/>
                        <xsl:apply-templates select="named-content[@content-type='state']"/>
                        <xsl:apply-templates select="named-content[@content-type='postcode']"/>
                        <xsl:apply-templates select="named-content[@content-type='city']"/>
                        <xsl:apply-templates select="country"/>
                    </address>
                </xsl:when>
            </xsl:choose>
        </affiliation>
    </xsl:template>
    <xsl:template match="name-alternatives">
                    <xsl:apply-templates/>
        <xsl:if test="ancestor::contrib-group/aff">
            <affiliation>
                <xsl:value-of select="ancestor::contrib-group/aff"/>
            </affiliation>
        </xsl:if>
    </xsl:template>
    <xsl:template match="collab">
        <name>
            <xsl:apply-templates/>
        </name>
    </xsl:template>
    
    <xsl:template match="sb:collaboration">
        <author role="collab">
            <name>
            <xsl:apply-templates/>
            </name>
        </author>
    </xsl:template>

    <!-- Elements for name components in Scholar One (first_name, middle_name, last_name, salutation, suffix, degree, role, person_title) -->
    <!-- Elements for name components in ArticleSetNLM 2.0 (FirstName, MiddleName, LastName...) -->
    <!-- NLM 2.3 article: surname, given-names, suffix, role -->
    <!-- Elements for name components in Elsevier (ce:given-name, ce:surname, ...) -->
    <!-- Elements for name components in Springer stage 2/3 (FamilyName, GivenName, Initials, Suffix, Particle...) -->
    <!-- Sage: ln, per_aut/fn, mn, suffix, role (fn ambigue avec footnote) -->
    <!-- BMJ: corresponding-author-firstname, corresponding-author-lastname, corresponding-author-middlename -->
    <xsl:template match="wiley:honorifics">
        <xsl:if test=". !=''">
            <addName>
                <xsl:apply-templates/>
            </addName>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="fname |rsc:fname |first_name | FirstName | ce:given-name | per_aut/fn | given-names | given_name | corresponding-author-firstname | fname | fnm | wiley:givenNames">
        <xsl:if test=". !=''">
            <forename type="first">
                <xsl:variable name="normalize">
                    <xsl:apply-templates/>
                </xsl:variable>
                <xsl:value-of select="normalize-space($normalize)"/>
            </forename>
        </xsl:if>
    </xsl:template>
    <xsl:template match="middle_name | MiddleName | mn | corresponding-author-middlename">
        <xsl:if test=". !=''">
            <forename type="middle">
                <xsl:apply-templates/>
            </forename>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Initials | inits">
        <xsl:if test=". !=''">
            <forename full="init">
                <xsl:variable name="forename">
                    <xsl:apply-templates/>
                </xsl:variable>
                <xsl:value-of select="normalize-space($forename)"/>
            </forename>
        </xsl:if>
    </xsl:template>
    <xsl:template
        match="last_name | LastName | ce:surname| rsc:surname | FamilyName | ln | surname | corresponding-author-lastname | surname | snm | wiley:familyName">
        <xsl:if test=". !=''">
            <surname>
                <xsl:variable name="surname">
                    <xsl:apply-templates/>
                </xsl:variable>
                <xsl:value-of select="normalize-space($surname)"/>
            </surname>
        </xsl:if>
    </xsl:template>

    <xsl:template match="InstitutionalAuthorName" mode="simple">
        <xsl:if test=". !=''">
            <orgName type="institution">
                <xsl:apply-templates/>
            </orgName>
        </xsl:if>
    </xsl:template>

    <xsl:template match="InstitutionalAuthorName">
        <xsl:if test=". !=''">
            <orgName type="institution">
                <xsl:apply-templates/>
            </orgName>
            <persName>
                <surname>
                    <xsl:apply-templates/>
                </surname>
            </persName>
        </xsl:if>
    </xsl:template>

    <xsl:template match="salutation">
        <xsl:if test=". !=''">
            <roleName type="salutation">
                <xsl:apply-templates/>
            </roleName>
        </xsl:if>
    </xsl:template>
    <xsl:template match="degree | corresponding-author-title | person_title | degrees | ce:degrees | wiley:degrees">
        <xsl:if test=". !=''">
            <roleName type="degree">
                <xsl:apply-templates/>
            </roleName>
        </xsl:if>
    </xsl:template>
    <xsl:template match="wiley:biographyInfo">
        <state type="biography">
            <desc>
                <xsl:apply-templates/>
            </desc>
        </state>
    </xsl:template>
    <xsl:template match="wiley:email">
        <email>
            <xsl:apply-templates/>
        </email>
    </xsl:template>
    <xsl:template match="Particle">
        <xsl:if test=". !=''">
            <nameLink>
                <xsl:apply-templates/>
            </nameLink>
        </xsl:if>
    </xsl:template>
    <xsl:template match="suffix | Suffix | suff | wiley:nameSuffix|name_suffix">
        <xsl:if test=". !=''">
            <genName>
                <xsl:apply-templates/>
            </genName>
        </xsl:if>
    </xsl:template>

    <xsl:template match="prefix | ce:roles">
        <xsl:if test=". !=''">
            <roleName>
                <xsl:apply-templates/>
            </roleName>
        </xsl:if>
    </xsl:template>

    <xsl:template match="wiley:personName">
        <persName>
            <xsl:apply-templates select="wiley:honorifics"/>
            <xsl:apply-templates select="wiley:nameSuffix"/>
            <xsl:apply-templates select="wiley:givenNames"/>
            <xsl:apply-templates select="wiley:familyName"/>
            <xsl:apply-templates select="wiley:degrees"/>
           <!-- <xsl:apply-templates select="ancestor::wiley:creator/wiley:biographyInfo"/>-->
            <xsl:apply-templates select="wiley:biographyInfo/wiley:email"/>
        </persName>
    </xsl:template>

    <!-- SG - ajout email -->
    <xsl:template match="wiley:contactDetails">
        <email>
            <xsl:value-of select="wiley:email"/>
        </email>
    </xsl:template>

    <!-- Champs dans la description des noms qui ne sont pas retenus -->
    <xsl:template match="NoGivenName"/>
    <xsl:template match="ce:indexed-name"/>

</xsl:stylesheet>
