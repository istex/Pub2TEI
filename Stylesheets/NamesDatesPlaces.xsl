<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns="http://www.tei-c.org/ns/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:rsc="http://www.rsc.org/schema/rscart38" exclude-result-prefixes="#all">

    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:variable name="countryCodes" select="document('CountryCodes.xml')"/>

    <!-- +++++++++++++++ Dates ++++++++++++++++ -->


    <!-- Transforming a fragmented date into an ISO one
         ***********************************************
    -->
    <xsl:template name="makeISODateFromComponents">
        <xsl:param name="oldDay"/>
        <xsl:param name="oldMonth"/>
        <xsl:param name="oldYear"/>

        <xsl:choose>
            <xsl:when test="string-length(normalize-space($oldMonth)) = 0">
                <xsl:value-of select="normalize-space($oldYear)"/>
            </xsl:when>

            <!-- RL : ajout cas intermédiaire
                 Pour renvoyer YY-MM plutôt que YY-MM-01
                 lorsque seul $oldDay est indéfini
            -->
            <xsl:when test="string-length(normalize-space($oldDay)) = 0">
                <xsl:variable name="month">
                    <xsl:call-template name="monthInNum">
                        <xsl:with-param name="theMonth" select="$oldMonth"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="concat(normalize-space($oldYear), '-', $month)"/>
            </xsl:when>

            <xsl:otherwise>
                <xsl:variable name="month">
                    <xsl:call-template name="monthInNum">
                        <xsl:with-param name="theMonth" select="$oldMonth"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="day">
                    <xsl:choose>
                        <xsl:when test="string-length(normalize-space($oldDay)) = 0">
                            <xsl:text>01</xsl:text>
                        </xsl:when>
                        <xsl:when test="string-length(normalize-space($oldDay)) = 1">
                            <xsl:value-of select="concat('0', normalize-space($oldDay))"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="normalize-space($oldDay)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:value-of select="concat(normalize-space($oldYear), '-', $month, '-', $day)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="monthInNum">
        <xsl:param name="theMonth"/>
        <xsl:choose>
            <xsl:when test="string-length(normalize-space($theMonth)) = 0">
                <xsl:text>01</xsl:text>
            </xsl:when>
            <xsl:when test="string-length(normalize-space($theMonth)) = 1">
                <xsl:value-of select="concat('0', normalize-space($theMonth))"/>
            </xsl:when>
            <xsl:when test="string-length(normalize-space($theMonth)) > 2">
                <xsl:choose>
                    <xsl:when test="contains(normalize-space($theMonth), 'Jan')">
                        <xsl:text>01</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space($theMonth), 'Feb')">
                        <xsl:text>02</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space($theMonth), 'Mar')">
                        <xsl:text>03</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space($theMonth), 'Apr')">
                        <xsl:text>04</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space($theMonth), 'May')">
                        <xsl:text>05</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space($theMonth), 'Jun')">
                        <xsl:text>06</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space($theMonth), 'Jul')">
                        <xsl:text>07</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space($theMonth), 'Aug')">
                        <xsl:text>08</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space($theMonth), 'Sep')">
                        <xsl:text>09</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space($theMonth), 'Oct')">
                        <xsl:text>10</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space($theMonth), 'Nov')">
                        <xsl:text>11</xsl:text>
                    </xsl:when>
                    <xsl:when test="contains(normalize-space($theMonth), 'Dec')">
                        <xsl:text>12</xsl:text>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="normalize-space($theMonth)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- default rules for days, months and years in case the makeISODateFromComponents template is not used -->
    <!-- Sage: dd, mm, yy -->

    <xsl:template match="Day | day | dd">
        <date type="day">
            <xsl:apply-templates/>
        </date>
    </xsl:template>

    <xsl:template match="Month | month | mm">
        <date type="month">
            <xsl:apply-templates/>
        </date>
    </xsl:template>

    <xsl:template match="Year | year| rsc:year | yy">
        <date type="year">
            <xsl:value-of select="translate(.,'abcdefghijklmnopqrstuvwyyz ','')"/>
        </date>
    </xsl:template>

    <xsl:template match="access-date">
        <note type="access-date">
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    <!-- +++++++++++++++ Places ++++++++++++++++ -->

    <!-- Springer: City, State, Postcode, Country -->
    <!-- ScholarOne: city, state, country, province? -->
    <!-- Sage: country -->
    <!-- NLM 2.3 article: country -->
    <!-- PL: Nanture: cny -->
    <!-- BMJ: corresponding-author-city, corresponding-author-country, corresponding-author-state, corresponding-author-zipcode -->

    <xsl:template match="Country | country| rsc:country | corresponding-author-country | cny">
        <xsl:if test=".!=''">
            <xsl:variable name="countryWithNoSpace" select="normalize-space(translate(.,'abcdefghijklmnopqrstuvwxyz(). ','ABCDEFGHIJKLMNOPQRSTUVWXYZ'))"/>
            <country>
                <xsl:choose>
                    
                    <xsl:when test="@country_code">
                        <!-- A specific test for ScholarOne -->
                        <xsl:attribute name="key">
                            <xsl:call-template name="normalizeISOCountry">
                                <xsl:with-param name="country" select="@country_code"/>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:call-template name="normalizeISOCountryName">
                            <xsl:with-param name="country" select="@country_code"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- rattrapage des ecritures alambiquées -->
                    <xsl:when test="contains(.,'China')">
                        <xsl:variable name="change">
                            <xsl:text>CHINA</xsl:text>
                        </xsl:variable>
                        <xsl:attribute name="key">
                            <xsl:call-template name="normalizeISOCountry">
                                <xsl:with-param name="country" select="$change"/>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:call-template name="normalizeISOCountryName">
                            <xsl:with-param name="country" select="$change"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains(.,'England')">
                        <xsl:variable name="change">
                            <xsl:text>UNITED KINGDOM</xsl:text>
                        </xsl:variable>
                        <xsl:attribute name="key">
                            <xsl:call-template name="normalizeISOCountry">
                                <xsl:with-param name="country" select="$change"/>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:call-template name="normalizeISOCountryName">
                            <xsl:with-param name="country" select="$change"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains(.,'Singapore')">
                        <xsl:variable name="change">
                            <xsl:text>SINGAPORE</xsl:text>
                        </xsl:variable>
                        <xsl:attribute name="key">
                            <xsl:call-template name="normalizeISOCountry">
                                <xsl:with-param name="country" select="$change"/>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:call-template name="normalizeISOCountryName">
                            <xsl:with-param name="country" select="$change"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains(.,'Taiwan')">
                        <xsl:variable name="change">
                            <xsl:text>TAIWAN, PROVINCE OF CHINA</xsl:text>
                        </xsl:variable>
                        <xsl:attribute name="key">
                            <xsl:call-template name="normalizeISOCountry">
                                <xsl:with-param name="country" select="$change"/>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:call-template name="normalizeISOCountryName">
                            <xsl:with-param name="country" select="$change"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="contains(.,'Korea')">
                        <xsl:variable name="change">
                            <xsl:text>KOREA, REPUBLIC OF</xsl:text>
                        </xsl:variable>
                        <xsl:attribute name="key">
                            <xsl:call-template name="normalizeISOCountry">
                                <xsl:with-param name="country" select="$change"/>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:call-template name="normalizeISOCountryName">
                            <xsl:with-param name="country" select="$change"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="key">
                            <xsl:call-template name="normalizeISOCountry">
                                <xsl:with-param name="country" select="$countryWithNoSpace"/>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:call-template name="normalizeISOCountryName">
                            <xsl:with-param name="country" select="$countryWithNoSpace"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </country>
        </xsl:if>
    </xsl:template>

    <xsl:template name="normalizeISOCountry">
        <xsl:param name="country"/>
        <xsl:variable name="resultCode">
            <xsl:value-of select="$countryCodes/descendant::tei:row[tei:cell/text() = $country]/tei:cell[@role = 'a2code']"/>
        </xsl:variable>
        <xsl:if test="not(normalize-space($resultCode))">
            <xsl:message>Country: <xsl:value-of select="$country"/> - Code not found</xsl:message>
        </xsl:if>
        <xsl:value-of select="$resultCode"/>
    </xsl:template>

    <xsl:template name="normalizeISOCountryName">
        <xsl:param name="country"/>
        <xsl:attribute name="xml:lang">en</xsl:attribute>
        <xsl:variable name="resultCode">
            <xsl:value-of select="$countryCodes/descendant::tei:row[tei:cell/text() = $country]/tei:cell[@role = 'name' and @xml:lang = 'en']"/>
        </xsl:variable>
       <xsl:if test="not(normalize-space($resultCode))">
            <xsl:message>Country: <xsl:value-of select="$country"/> - Code not found</xsl:message>
        </xsl:if>
        <xsl:value-of select="$resultCode"/>
    </xsl:template>
    <!-- ajout code en français pour openEdition -->
    <xsl:template name="normalizeISOCountryNameFR">
        <xsl:param name="country"/>
        <xsl:attribute name="xml:lang">fr</xsl:attribute>
        <xsl:variable name="resultCode">
            <xsl:value-of select="$countryCodes/descendant::tei:row[tei:cell/text() = $country]/tei:cell[@role = 'name' and @xml:lang = 'fr']"/>
        </xsl:variable>
        <xsl:if test="not(normalize-space($resultCode))">
            <xsl:message>Country: <xsl:value-of select="$country"/> - Code not found</xsl:message>
        </xsl:if>
        <xsl:value-of select="$resultCode"/>
    </xsl:template>

    <!-- PL: add st for Nature -->
    <xsl:template match="State | state| rsc:state | corresponding-author-state | province | st | named-content[@content-type = 'state']">
        <xsl:if test=". !=''">
            <region>
                <xsl:apply-templates/>
            </region>
        </xsl:if>
    </xsl:template>
    <!-- PL: add cty for Nature -->
    <xsl:template match="City | city| rsc:city | corresponding-author-city | named-content[@content-type = 'city'] | cty">
        <xsl:if test=". !=''">
            <settlement>
                <xsl:apply-templates/>
            </settlement>
        </xsl:if>
    </xsl:template>

    <!-- PL: add zip for Nature -->
    <xsl:template match="Postcode | post_code | corresponding-author-zipcode | named-content[@content-type = 'postcode'] | postcode| rsc:postcode | zip">
        <xsl:if test=". !=''">
            <postCode>
                <xsl:apply-templates/>
            </postCode>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Postbox">
        <xsl:if test=". !=''">
            <postBox>
                <xsl:apply-templates/>
            </postBox>
        </xsl:if>
    </xsl:template>

    <!-- Address lines of all sorts -->
    <!-- BMJ: corresponding-author-address-1, corresponding-author-address-1 -->
    <!-- Springer 2: OrgAddress  -->

    <xsl:template match="addr-line | addr1 | addr2 | addr3 | corresponding-author-address-1 | corresponding-author-address-2 | addrelt| rsc:addrelt">
        <xsl:if test=". !=''">
            <xsl:choose>
                <xsl:when test="*">
                 <!-- <xsl:if test="text()[. != ', ']">
                        <addrLine>
                            <xsl:for-each select="text()[. != ', ']">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </addrLine>
                    </xsl:if>-->
                    <xsl:apply-templates select="*"/>
                </xsl:when>
                <xsl:when test="parent::publisher-loc">
                    <!-- <xsl:if test="text()[. != ', ']">
                        <addrLine>
                            <xsl:for-each select="text()[. != ', ']">
                                <xsl:value-of select="."/>
                            </xsl:for-each>
                        </addrLine>
                    </xsl:if>-->
                    <xsl:apply-templates/>
                </xsl:when>
             <xsl:otherwise>
               <!--  <xsl:if test="not(ancestor::corresp)">
                    <addrLine>
                        <xsl:apply-templates/>
                    </addrLine>
                 </xsl:if>-->
                 <xsl:variable name="addrline">
                     <xsl:apply-templates/>
                 </xsl:variable>
                 <xsl:choose>
                     <xsl:when test="ancestor::aff/xref">
                         <address>
                             <addrLine>
                                 <xsl:value-of select="normalize-space($addrline)"/>
                             </addrLine>
                         </address>
                     </xsl:when>
                     <xsl:otherwise>
                         <addrLine>
                             <xsl:value-of select="normalize-space($addrline)"/>
                         </addrLine>
                     </xsl:otherwise>
                 </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <!-- PL: add street or Nature -->
    <xsl:template match="Street | street | named-content[@content-type = 'street']">
        <xsl:if test=". !=''">
            <street>
                <xsl:apply-templates/>
            </street>
        </xsl:if>
    </xsl:template>

    <!-- Springer -->
    <xsl:template match="OrgAddress">
        <xsl:if test="normalize-space()">
            <address>
                <xsl:apply-templates/>
            </address>
        </xsl:if>
    </xsl:template>

    <!-- Rule for email, phone, fax -->
    <!-- BMJ: corresponding-author-email -->
    <!-- NLM 2.2: email -->
    <!-- Springer: Email -->

    <xsl:template match="corresponding-author-email | Email | eml |email | rsc:email">
        <xsl:choose>
            <xsl:when test="parent::aff"/>
            <xsl:when test="parent::corresp"/>
            <xsl:otherwise>
                <email>
                    <xsl:apply-templates/>
                </email>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="phone |rsc:phone | Phone">
        <xsl:if test=". !=''">
            <note type="phone">
                <xsl:apply-templates/>
            </note>
        </xsl:if>
    </xsl:template>

    <xsl:template match="fax |rsc:fax | Fax">
        <xsl:if test=". !=''">
            <note type="fax">
                <xsl:apply-templates/>
            </note>
        </xsl:if>
    </xsl:template>

    <xsl:template match="uri | url |rsc:uri | rsc:url | URL">
        
        <xsl:if test=". !=''">
        <xsl:choose>
            <xsl:when test="ancestor::citext|ancestor::rsc:citext">
                <ref type="url">
                    <xsl:attribute name="target">
                        <xsl:choose>
                            <xsl:when test="@url">
                                <xsl:value-of select="@url"/>  
                            </xsl:when>
                            <xsl:when test="contains(.,'?ReadForm&amp;c%PS')">
                                <xsl:value-of select="substring-before(.,'?ReadForm&amp;c%PS')"/>  
                            </xsl:when>
                            <xsl:when test="contains(.,'?option=')">
                                <xsl:value-of select="substring-before(.,'?option=')"/>  
                            </xsl:when>
                            <xsl:when test="contains(.,'HTTP: ')">
                                <xsl:value-of select="substring-after(.,'HTTP: ')"/>  
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates/>  
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:if test=".">
                        <xsl:attribute name="cRef">
                            <xsl:apply-templates/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates/>
                </ref>
            </xsl:when>
            <xsl:otherwise>
                <ptr type="url">
                    <xsl:attribute name="target">
                        <xsl:choose>
                            <xsl:when test="@url">
                                <xsl:value-of select="@url"/>  
                            </xsl:when>
                            <xsl:when test="contains(.,'?ReadForm&amp;c%PS')">
                                <xsl:value-of select="substring-before(.,'?ReadForm&amp;c%PS')"/>  
                            </xsl:when>
                            <xsl:when test="contains(.,'?option=')">
                                <xsl:value-of select="substring-before(.,'?option=')"/>  
                            </xsl:when>
                            <xsl:when test="contains(.,'HTTP: ')">
                                <xsl:value-of select="substring-after(.,'HTTP: ')"/>  
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates/>  
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:if test=".">
                        <xsl:attribute name="cRef">
                            <xsl:apply-templates/>
                        </xsl:attribute>
                    </xsl:if>
                </ptr>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="uri" mode="citation">
        <xsl:if test=". !=''">
            <idno type="url">
                <xsl:apply-templates/>  
            </idno>
        </xsl:if>
    </xsl:template>
    <xsl:template match="url" mode="citation">
        <xsl:if test=". !=''">
            <idno type="url">
                <xsl:apply-templates/>  
            </idno>
        </xsl:if>
    </xsl:template>

    <!-- Not satisfactory: should find a better way -->
    <xsl:template match="PublisherURL">
        <note type="URL">
            <xsl:apply-templates/>
        </note>
    </xsl:template>

    <xsl:template match="room">
        <xsl:if test=". !=''">
            <note type="room">
                <xsl:apply-templates/>
            </note>
        </xsl:if>
    </xsl:template>


    <!-- Organisations -->
    <!-- BMJ: institution, corresponding-author-institution -->
    <!-- ScholarOne: inst, dept -->
    <!-- Springer 2/3: OrgDivision, OrgName -->

    <xsl:template match="institution | corresponding-author-institution | inst | OrgName | Institution">
        <xsl:if test=". !=''">
            <orgName type="institution">
                <xsl:apply-templates/>
            </orgName>
        </xsl:if>
    </xsl:template>

    <xsl:template match="dept | OrgDivision | Department">
        <xsl:if test=". !=''">
            <orgName type="department">
                <xsl:apply-templates/>
            </orgName>
        </xsl:if>
    </xsl:template>
    <xsl:template match="OrgID">
        <xsl:if test=". !=''">
            <idno type="{@Type}" subtype="{@Level}">
                <xsl:apply-templates/>
            </idno>
        </xsl:if>
    </xsl:template>


</xsl:stylesheet>
