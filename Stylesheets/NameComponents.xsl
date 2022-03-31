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
                            <xsl:apply-templates select="* except(x|label)"/>
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
    
    <xsl:template match="foreName | fname |rsc:fname |first_name | FirstName | ce:given-name | per_aut/fn | given-names | given_name | corresponding-author-firstname | fname | fnm | wiley:givenNames">
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



    <xsl:template name="parseAffiliation">
        <xsl:param name="theAffil"/>
        <xsl:param name="inAddress" select="false()"/>
        <xsl:for-each select="$theAffil">
            <xsl:message>Un bout: <xsl:value-of select="normalize-space(.)"/></xsl:message>
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
                            <xsl:call-template name="parseAffiliation">
                                <xsl:with-param name="theAffil" select="$apresVirgule"/>
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <address>
                            <xsl:call-template name="parseAffiliation">
                                <xsl:with-param name="theAffil" select="translate($theAffil,'.','')"/>
                                <xsl:with-param name="inAddress" select="true()"/>
                            </xsl:call-template>
                        </address>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="testCountry">
                    <xsl:call-template name="normalizeISOCountry">
                        <xsl:with-param name="country" select="$avantVirgule"/>
                    </xsl:call-template>
                </xsl:variable>
                <!-- signalement des états américains dans <region> -->
                <xsl:variable name="etatsAmericains">
                    <xsl:choose>
                        <xsl:when test="$avantVirgule='Alabama'">Alabama</xsl:when>
                        <xsl:when test="$avantVirgule='Alaska'">Alaska</xsl:when>
                        <xsl:when test="$avantVirgule='Arizona'">Arizona</xsl:when>
                        <xsl:when test="$avantVirgule='Arkansas'">Arkansas</xsl:when>
                        <xsl:when test="$avantVirgule='California'">California</xsl:when>
                        <xsl:when test="$avantVirgule='North Carolina'">North Carolina</xsl:when>
                        <xsl:when test="$avantVirgule='South Carolina'">South Carolina</xsl:when>
                        <xsl:when test="$avantVirgule='Colorado'">Colorado</xsl:when>
                        <xsl:when test="$avantVirgule='Connecticut'">Connecticut</xsl:when>
                        <xsl:when test="$avantVirgule='North Dakota'">North Dakota</xsl:when>
                        <xsl:when test="$avantVirgule='South Dakota'">South Dakota</xsl:when>
                        <xsl:when test="$avantVirgule='Delaware'">Delaware</xsl:when>
                        <xsl:when test="$avantVirgule='Florida'">Florida</xsl:when>
                        <xsl:when test="$avantVirgule='Georgia'">Georgia</xsl:when>
                        <xsl:when test="$avantVirgule='Hawaii'">Hawaii</xsl:when>
                        <xsl:when test="$avantVirgule='Idaho'">Idaho</xsl:when>
                        <xsl:when test="$avantVirgule='Illinois'">Illinois</xsl:when>
                        <xsl:when test="$avantVirgule='Indiana'">Indiana</xsl:when>
                        <xsl:when test="$avantVirgule='Iowa'">Iowa</xsl:when>
                        <xsl:when test="$avantVirgule='Kansas'">Kansas</xsl:when>
                        <xsl:when test="$avantVirgule='Kentucky'">Kentucky</xsl:when>
                        <xsl:when test="$avantVirgule='Commonwealth of Kentucky'">Commonwealth of Kentucky</xsl:when>
                        <xsl:when test="$avantVirgule='Louisiana'">Louisiana</xsl:when>
                        <xsl:when test="$avantVirgule='Maine'">Maine</xsl:when>
                        <xsl:when test="$avantVirgule='Maryland'">Maryland</xsl:when>
                        <xsl:when test="$avantVirgule='Massachusetts'">Massachusetts</xsl:when>
                        <xsl:when test="$avantVirgule='Commonwealth of Massachusetts'">Commonwealth of Massachusetts</xsl:when>
                        <xsl:when test="$avantVirgule='Michigan'">Michigan</xsl:when>
                        <xsl:when test="$avantVirgule='Minnesota'">Minnesota</xsl:when>
                        <xsl:when test="$avantVirgule='Mississippi'">Mississippi</xsl:when>
                        <xsl:when test="$avantVirgule='Missouri'">Missouri</xsl:when>
                        <xsl:when test="$avantVirgule='Montana'">Montana</xsl:when>
                        <xsl:when test="$avantVirgule='Nebraska'">Nebraska</xsl:when>
                        <xsl:when test="$avantVirgule='Nevada'">Nevada</xsl:when>
                        <xsl:when test="$avantVirgule='New Hampshire'">New Hampshire</xsl:when>
                        <xsl:when test="$avantVirgule='New Jersey'">New Jersey</xsl:when>
                        <xsl:when test="$avantVirgule='Nouveau-Mexique'">New Mexico</xsl:when>
                        <xsl:when test="$avantVirgule='New York'">New York</xsl:when>
                        <xsl:when test="$avantVirgule='Ohio'">Ohio</xsl:when>
                        <xsl:when test="$avantVirgule='Oklahoma'">Oklahoma</xsl:when>
                        <xsl:when test="$avantVirgule='Oregon'">Oregon</xsl:when>
                        <xsl:when test="$avantVirgule='Pennsylvania'">Pennsylvania</xsl:when>
                        <xsl:when test="$avantVirgule='Rhode Island'">Rhode Island</xsl:when>
                        <xsl:when test="$avantVirgule='Tennessee'">Tennessee</xsl:when>
                        <xsl:when test="$avantVirgule='Texas'">Texas</xsl:when>
                        <xsl:when test="$avantVirgule='Utah'">Utah</xsl:when>
                        <xsl:when test="$avantVirgule='Vermont'">Vermont</xsl:when>
                        <xsl:when test="$avantVirgule='Virginia'">Virginia</xsl:when>
                        <xsl:when test="$avantVirgule='Commonwealth of Virginia'">Commonwealth of Virginia</xsl:when>
                        <xsl:when test="$avantVirgule='West Virginia'">West Virginia</xsl:when>
                        <!-- enlever intentionnellement, peut être confondu avec Washington DC <xsl:when test="$avantVirgule='Washington'">Washington</xsl:when>-->
                        <xsl:when test="$avantVirgule='Wisconsin'">Wisconsin</xsl:when>
                        <xsl:when test="$avantVirgule='Wyoming'">Wyoming</xsl:when>
                    </xsl:choose>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$etatsAmericains != ''">
                        <region>
                            <xsl:value-of select="$etatsAmericains"/>
                        </region>
                        <!-- rattrapage du code pays quand il n'est pas présent -->
                        <xsl:if test="not(contains($theAffil,'USA'))">
                            <country key="US" xml:lang="en">UNITED STATES</country>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <addrLine>
                            <xsl:value-of select="$avantVirgule"/>
                        </addrLine>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="$testCountry != ''">
                        <country>
                            <xsl:choose>
                                <xsl:when test="//ce:doi='10.1016/S0735-1097(98)00474-4'">
                                    <xsl:attribute name="key">
                                        <xsl:text>UK</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>UNITED KINGDOM</xsl:text>
                                </xsl:when>
                                <xsl:when test="//ce:doi='10.1016/S1047-2797(00)00184-8'">
                                    <xsl:attribute name="key">
                                        <xsl:text>US</xsl:text>
                                    </xsl:attribute>
                                    <xsl:text>UNITED STATES</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="key">
                                        <xsl:value-of select="$testCountry"/>
                                    </xsl:attribute>
                                    <xsl:call-template name="normalizeISOCountryName">
                                        <xsl:with-param name="country" select="$avantVirgule"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </country>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="$apresVirgule !=''">
                    <xsl:call-template name="parseAffiliation">
                        <xsl:with-param name="theAffil" select="$apresVirgule"/>
                        <xsl:with-param name="inAddress" select="true()"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
