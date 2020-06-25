<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" version="2.0" exclude-result-prefixes="#all">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> May 27, 2010</xd:p>
            <xd:p><xd:b>Author:</xd:b> romary</xd:p>
            <xd:p>Parsing of organisation names to detect the type of orgName</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="identifyOrgLevel">
        <xsl:param name="theOrg"/>
        <xsl:choose>
            <xsl:when test="contains($theOrg,'Research') or
                contains($theOrg,'LIX') or
                contains($theOrg,'Unit') or
                contains($theOrg,'Products') or
                contains($theOrg,'Sylvadour') or
                contains($theOrg,'Biotechnologie') or
                contains($theOrg,'Labo') or
                contains($theOrg,'LABO') or
                contains($theOrg,'GIPSA-Lab') or
                contains($theOrg,'LERFOB') or
                contains($theOrg,'bioMérieux') or
                contains($theOrg,'LEGOS/OMP') or
                contains($theOrg,'UMR') or
                contains($theOrg,'UPR') or
                contains($theOrg,'CTP') or
                contains($theOrg,'labo') or
                contains($theOrg,' Inc') or
                contains($theOrg,'Estación') or
                contains($theOrg,'Servic') or
                contains($theOrg,'Biol') or
                contains($theOrg,'Pracownia') or
                contains($theOrg,'Survey of') or
                contains($theOrg,'EcoFoG') or
                contains($theOrg,'LGMT') or
                contains($theOrg,'INRA-LORIA') or
                contains($theOrg,'LORIA') or
                contains($theOrg,'UMC ') or
                contains($theOrg,'IFR ') or
                contains($theOrg,'C.R.S.O.C.I.') or
                contains($theOrg,'Dauphinoise de Tri ') or
                contains($theOrg,'Systems') or
                contains($theOrg,'DAMTP') or
                contains($theOrg,'Sterrewacht') or
                contains($theOrg,'Observatoire') or
                contains($theOrg,'SISSA/ISAS') or
                contains($theOrg,'wissenschaft') or
                contains($theOrg,'CEN Saclay') or
                contains($theOrg,'Ricerche')">
                <xsl:text>laboratory</xsl:text>
            </xsl:when>
            <xsl:when test="contains($theOrg,'IB')  or
                contains($theOrg,'Study') or
                contains($theOrg,'CCS') or
                contains($theOrg,'CNRS') or
                contains($theOrg,'College of') or
                contains($theOrg,'College') or
                contains($theOrg,'Universidad') or
                contains($theOrg,'Hospi') or
                contains($theOrg,'Krankenhaus') or
                contains($theOrg,'szpital') or
                contains($theOrg,'больница') or
                contains($theOrg,'Osservatorio') or
                contains($theOrg,'Museum') or
                contains($theOrg,'Center') or
                contains($theOrg,'Inst.') or
                contains($theOrg,'Institute') or
                contains($theOrg,'Institut') or
                contains($theOrg,'institut') or
                contains($theOrg,'Instytut') or
                contains($theOrg,'Instituut') or
                contains($theOrg,'Istituto') or
                contains($theOrg,'Campus') or
                contains($theOrg,'Hemosystem') or
                contains($theOrg,'校区') or
                contains($theOrg,'Campus') or
                contains($theOrg,'University') or
                contains($theOrg,'Universität') or
                contains($theOrg,'Università') or
                contains($theOrg,'Uniwersytet') or
                contains($theOrg,'Uniwersytet') or
                contains($theOrg,'Université ') or
                contains($theOrg,'Universidade') or
                contains($theOrg,'University of') or
                contains($theOrg,'universit') or
                contains($theOrg,'Universit') or
                contains($theOrg,'univerzita') or
                contains($theOrg,'大学') or
                contains($theOrg,'Univ.') or
                contains($theOrg,'Academy') or
                contains($theOrg,'Pasteur') or
                contains($theOrg,'Eurocat') or
                contains($theOrg,'Fundação') or
                contains($theOrg,'Network') or
                contains($theOrg,'BASF AG') or
                contains($theOrg,'Chemie') or
                contains($theOrg,'chemie') or
                contains($theOrg,'C.N.R.S.') or
                contains($theOrg,'MIT') or
                contains($theOrg,'GmhH') or
                contains($theOrg,'GbR') or
                contains($theOrg,'Gabinetto') or
                contains($theOrg,'Observatory') or
                contains($theOrg,'Engineering') or
                contains($theOrg,' Haus') or
                contains($theOrg,' akademi') or
                contains($theOrg,' Akademi') or
                contains($theOrg,' Sportu') or
                contains($theOrg,' Polonistyki') or
                contains($theOrg,'Katedra') or
                contains($theOrg,'logii') or
                contains($theOrg,'zofii') or
                contains($theOrg,'grafii') or
                contains($theOrg,' AWF') or
                contains($theOrg,' GmbH') or
                contains($theOrg,' VŠCHT') or
                contains($theOrg,'Edificio') or
                contains($theOrg,'Ústav') or
                contains($theOrg,'CSIC') or
                contains($theOrg,'Fondation') or
                contains($theOrg,'Hôpital') or
                contains($theOrg,'Ospedali') or
                contains($theOrg,'CHU') or
                contains($theOrg,'ParisTech') or
                contains($theOrg,'Inra') or
                contains($theOrg,'INRA') or
                contains($theOrg,'Conservatoire') or
                contains($theOrg,'IUT') or
                contains($theOrg,'Inserm') or
                contains($theOrg,'INSERM') or
                contains($theOrg,'CIRAD') or
                contains($theOrg,'Direction') or
                contains($theOrg,'Agenc') or
                contains($theOrg,'Cnam ') or
                contains($theOrg,'Lara-Spiral SA') or
                contains($theOrg,'Clinic of') or
                contains($theOrg,'Chemistry') or
                contains($theOrg,'Engineering') or
                contains($theOrg,'Health') or
                contains($theOrg,'OMNI') or
                contains($theOrg,'Sectors') or
                contains($theOrg,'Government of') or
                contains($theOrg,'Council') or
                contains($theOrg,'Max-Planck') or
                contains($theOrg,'National') or
                starts-with($theOrg,'CN') or
                starts-with($theOrg,'MA') or
                starts-with($theOrg,'UJ') or
                starts-with($theOrg,'Inserm') or
                starts-with($theOrg,'INSERM') or
                starts-with($theOrg,'CSIC') or
                starts-with($theOrg,'Supreme Court') or
                starts-with($theOrg,'Ministr')">
                <xsl:text>institution</xsl:text>
            </xsl:when>
            <xsl:when test=" 
                ends-with($theOrg,'ogy') or
                contains($theOrg,'School') or
                contains($theOrg,'DSHS Köln') or
                contains($theOrg,'校') or
                contains($theOrg,'Ecole') or
                contains($theOrg,'Scuola') or
                contains($theOrg,'Szkoła') or
                contains($theOrg,'Wydział') or
                contains($theOrg,'Schule') or
                contains($theOrg,'Facul') or
                contains($theOrg,'Fakult') or
                contains($theOrg,'Abteilung') or
                contains($theOrg,'Directorate') or
                contains($theOrg,'Ciencias') or
                contains($theOrg,'Clinic') or
                starts-with($theOrg,'EA 4604') or
                contains($theOrg,'Registry') or
                contains($theOrg,'Register') or
                contains($theOrg,'Office') or
                contains($theOrg,'Registro') or
                contains($theOrg,'Sciences') or
                contains($theOrg,'Unidad') or
                contains($theOrg,'DPh-G/PSRM') or
                contains($theOrg,'EES')">
                <xsl:text>department</xsl:text>
            </xsl:when>
            <xsl:when test="contains($theOrg,'Branch') or
                contains($theOrg,'Centre') or
                contains($theOrg,'centrum') or
                contains($theOrg,'zentrum') or
                contains($theOrg,'Zentrum') or
                contains($theOrg,'Centro') or
                contains($theOrg,'Section') or
                contains($theOrg,'Seksjon') or
                contains($theOrg,'Division') or
                contains($theOrg,'Dpto') or
                contains($theOrg,'depart') or
                contains($theOrg,'Depart') or
                contains($theOrg,'Dept') or
                contains($theOrg,'Dipart') or
                contains($theOrg,'Oficina') or
                contains($theOrg,'Départ')">
                <xsl:text>division</xsl:text>
            </xsl:when>
            <xsl:when test="contains($theOrg,'Doctoral') or
                contains($theOrg,'Lecturer') or
                contains($theOrg,'Maître de') or
                contains($theOrg,'Associate') or
                contains($theOrg,'Professor') or
                contains($theOrg,'Dr.') or
                contains($theOrg,'Prof.') or
                contains($theOrg,'Der Autor') or
                contains($theOrg,'Assessor') or
                contains($theOrg,'PhD ') or
                contains($theOrg,'konzultant') or
                contains($theOrg,'Rechtsanwalt')">
                <xsl:text>function</xsl:text>
            </xsl:when>
            <xsl:when test="contains($theOrg,'Group') 
                or contains($theOrg,'Consejo')
                or contains($theOrg,'Program')
                ">
                <xsl:text>group</xsl:text>
            </xsl:when>
            <xsl:when test="contains($theOrg,'Organization') or
                contains($theOrg,'Organisation') or
                contains($theOrg,'Proxecto') or
                contains($theOrg,'CoDebris') or
                contains($theOrg,'Merck') or
                contains($theOrg,'Landesstelle') or
                contains($theOrg,'Cellectis SA') or
                contains($theOrg,'Merus BV') or
                contains($theOrg,'Taiyo Kaihatu-Kensetu Co') or
                contains($theOrg,'B.I.S.R.A') or
                contains($theOrg,'Ingenieurbüro')
                ">
                <xsl:text>organization</xsl:text>
            </xsl:when>
            <xsl:when test="contains($theOrg,' Ltd.') or
                starts-with($theOrg,'nke')
                ">
                <xsl:text>society</xsl:text>
            </xsl:when>
<xsl:otherwise>
                <xsl:message>Org inconnue: <xsl:value-of select="$theOrg"/></xsl:message>
                <xsl:text></xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
