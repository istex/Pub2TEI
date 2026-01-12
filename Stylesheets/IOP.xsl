<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:m="http://www.w3.org/1998/Math/MathML" 
    xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:els1="http://www.elsevier.com/xml/ja/dtd"    
    xmlns:els2="http://www.elsevier.com/xml/cja/dtd"
    xmlns:s1="http://www.elsevier.com/xml/si/dtd"
    xmlns:sb="http://www.elsevier.com/xml/common/struct-bib/dtd"
    xmlns:sa="http://www.elsevier.com/xml/common/struct-aff/dtd"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" version="2.0" xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="#all">
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>created by romain dot loth at inist.fr</xd:p>
            <xd:p>ISTEX-CNRS 2014-12</xd:p>
            <xd:p>updated by gregorio dot stephanie at inist.fr</xd:p>
            <xd:p>ISTEX-CNRS 2020-03</xd:p>
        </xd:desc>
    </xd:doc>

    <xsl:output encoding="UTF-8" method="xml"/>
    <!-- VERBALISATION CODE PACS -->
    <xsl:variable name="titleCodesPACS" select="document('PacsTitleCodes.xml')"/>
    
    <!-- 
        =========================
        TODO dans les entrées IOP
        =========================
          RL: 
           - je ne trouve nulle part la langue
           - les attributs en entrée sont encore souvent ignorés
             dont notamment id et corresp entre affiliations <=> auteurs
           - les éléments internes de structuration typographique :
             italic sub sup upright inline-eqn math-text sont sautés par des xsl:value-of
             dans les titres etc.
           - pour l'identification du doctype utiliser en plus le article-type/type-number ?
           
           £=> et une fois fini mettre un exemple de sortie dans Samples/TestOutputTEI
    -->

    <!-- 
        ****************
        SQUELETTE GLOBAL
        ****************        
        IN: /. <<
        
        OUT: 
        /TEI/teiHeader/fileDesc/titleStmt/title >>
        /TEI/teiHeader/fileDesc/respStmt
        /TEI/teiHeader/fileDesc/sourceDesc/biblStruct >>
    -->
    <xsl:variable name="codeLangIOP">
        <xsl:choose>
            <xsl:when test="//header/title-group/title/@lang ='english'">en</xsl:when>
            <xsl:when test="//header/title-group/title/@lang ='french'">fr</xsl:when>
            <xsl:when test="//header/title-group/title/@lang ='german'">de</xsl:when>
            <xsl:when test="//header/title-group/title/@lang ='italian'">it</xsl:when>
            <xsl:when test="//header/title-group/title/@lang ='spanish'">es</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="//header/title-group/title/@lang"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <!-- table de correspondance des titres car non fournit dans donnée-->
    <xsl:variable name="codeTitleIOP1">
        <xsl:value-of select="//header/ident/issn"/>
    </xsl:variable>
    <xsl:variable name="codeTitleIOP">
        <xsl:choose>
            <xsl:when test="$codeTitleIOP1='0004-6256'">The Astronomical Journal</xsl:when>
            <xsl:when test="$codeTitleIOP1='0004-637X'">The Astrophysical Journal</xsl:when>
            <xsl:when test="$codeTitleIOP1='0021-4922'">Japanese Journal of Applied Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0022-3689'">Journal of Physics A: General Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0022-3700'">Journal of Physics B: Atomic and Molecular Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0022-3719'">Journal of Physics C: Solid State Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0022-3727'">Journal of Physics D: Applied Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0022-3735'">Journal of Physics E: Scientific Instruments</xsl:when>
            <xsl:when test="$codeTitleIOP1='0025-5726'">Mathematics of the USSR-Izvestiya</xsl:when>
            <xsl:when test="$codeTitleIOP1='0025-5734'">Mathematics of the USSR-Sbornik</xsl:when>
            <xsl:when test="$codeTitleIOP1='0026-1394'">Metrologia</xsl:when>
            <xsl:when test="$codeTitleIOP1='0029-4780'">Nouvelle Revue d'Optique AppliquÃ©e</xsl:when>
            <xsl:when test="$codeTitleIOP1='0029-5515'">Nuclear Fusion</xsl:when>
            <xsl:when test="$codeTitleIOP1='0031-8949'">Physica Scripta</xsl:when>
            <xsl:when test="$codeTitleIOP1='0031-9120'">Physics Education</xsl:when>
            <xsl:when test="$codeTitleIOP1='0031-9155'">Physics in Medicine and Biology</xsl:when>
            <xsl:when test="$codeTitleIOP1='0032-1028'">Plasma Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0034-4885'">Reports on Progress in Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0034-6683'">Review of Physics in Technology</xsl:when>
            <xsl:when test="$codeTitleIOP1='0036-021X'">Russian Chemical Reviews</xsl:when>
            <xsl:when test="$codeTitleIOP1='0036-0279'">Russian Mathematical Surveys</xsl:when>
            <xsl:when test="$codeTitleIOP1='0038-5670'">Soviet Physics Uspekhi</xsl:when>
            <xsl:when test="$codeTitleIOP1='0049-1748'">Soviet Journal of Quantum Electronics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0067-0049'">The Astrophysical Journal Supplement Series</xsl:when>
            <xsl:when test="$codeTitleIOP1='0143-0807'">European Journal of Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0143-0815'">Clinical Physics and Physiological Measurement</xsl:when>
            <xsl:when test="$codeTitleIOP1='0150-536X'">Journal of Optics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0169-5983'">Fluid Dynamics Research</xsl:when>
            <xsl:when test="$codeTitleIOP1='0253-6102'">Communications in Theoretical Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0256-307X'">Chinese Physics Letters</xsl:when>
            <xsl:when test="$codeTitleIOP1='0260-2814'">Journal of the Society for Radiological Protection</xsl:when>
            <xsl:when test="$codeTitleIOP1='0264-9381'">Classical and Quantum Gravity</xsl:when>
            <xsl:when test="$codeTitleIOP1='0266-5611'">Inverse Problems</xsl:when>
            <xsl:when test="$codeTitleIOP1='0268-1242'">Semiconductor Science and Technology</xsl:when>
            <xsl:when test="$codeTitleIOP1='0295-5075'">EPL (Europhysics Letters)</xsl:when>
            <xsl:when test="$codeTitleIOP1='0301-0015'">Journal of Physics A: Mathematical, Nuclear and General</xsl:when>
            <xsl:when test="$codeTitleIOP1='0305-4470'">Journal of Physics A: Mathematical and General</xsl:when>
            <xsl:when test="$codeTitleIOP1='0305-4608'">Journal of Physics F: Metal Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0305-4616'">Journal of Physics G: Nuclear Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0305-4624'">Physics in Technology</xsl:when>
            <xsl:when test="$codeTitleIOP1='0335-7368'">Nouvelle Revue d'Optique</xsl:when>
            <xsl:when test="$codeTitleIOP1='0368-3281'">Journal of Nuclear Energy. Part C, Plasma Physics, Accelerators, Thermonuclear Research</xsl:when>
            <xsl:when test="$codeTitleIOP1='0370-1298'">Proceedings of the Physical Society. Section A</xsl:when>
            <xsl:when test="$codeTitleIOP1='0370-1301'">Proceedings of the Physical Society. Section B</xsl:when>
            <xsl:when test="$codeTitleIOP1='0370-1328'">Proceedings of the Physical Society</xsl:when>
            <xsl:when test="$codeTitleIOP1='0508-3443'">British Journal of Applied Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0741-3335'">Plasma Physics and Controlled Fusion</xsl:when>
            <xsl:when test="$codeTitleIOP1='0950-7671'">Journal of Scientific Instruments</xsl:when>
            <xsl:when test="$codeTitleIOP1='0951-7715'">Nonlinearity</xsl:when>
            <xsl:when test="$codeTitleIOP1='0952-4746'">Journal of Radiological Protection</xsl:when>
            <xsl:when test="$codeTitleIOP1='0953-2048'">Superconductor Science and Technology</xsl:when>
            <xsl:when test="$codeTitleIOP1='0953-4075'">Journal of Physics B: Atomic, Molecular and Optical Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0953-8984'">Journal of Physics: Condensed Matter</xsl:when>
            <xsl:when test="$codeTitleIOP1='0954-3899'">Journal of Physics G: Nuclear and Particle Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='0954-8998'">Quantum Optics: Journal of the European Optical Society Part B</xsl:when>
            <xsl:when test="$codeTitleIOP1='0957-0233'">Measurement Science and Technology</xsl:when>
            <xsl:when test="$codeTitleIOP1='0957-4484'">Nanotechnology</xsl:when>
            <xsl:when test="$codeTitleIOP1='0959-5309'">Proceedings of the Physical Society</xsl:when>
            <xsl:when test="$codeTitleIOP1='0960-1317'">Journal of Micromechanics and Microengineering</xsl:when>
            <xsl:when test="$codeTitleIOP1='0963-0252'">Plasma Sources Science and Technology</xsl:when>
            <xsl:when test="$codeTitleIOP1='0963-9659'">Pure and Applied Optics: Journal of the European Optical Society Part A</xsl:when>
            <xsl:when test="$codeTitleIOP1='0964-1726'">Smart Materials and Structures</xsl:when>
            <xsl:when test="$codeTitleIOP1='0965-0393'">Modelling and Simulation in Materials Science and Engineering</xsl:when>
            <xsl:when test="$codeTitleIOP1='0967-1846'">Distributed Systems Engineering</xsl:when>
            <xsl:when test="$codeTitleIOP1='0967-3334'">Physiological Measurement</xsl:when>
            <xsl:when test="$codeTitleIOP1='1003-7713'">Chinese Journal of Chemical Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1004-423X'">Acta Physica Sinica (Overseas Edition)</xsl:when>
            <xsl:when test="$codeTitleIOP1='1005-0841'">Science Foundation in China</xsl:when>
            <xsl:when test="$codeTitleIOP1='1009-0630'">Plasma Science and Technology</xsl:when>
            <xsl:when test="$codeTitleIOP1='1009-1963'">Chinese Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1009-9271'">Chinese Journal of Astronomy and Astrophysics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1029-8479'">Journal of High Energy Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1054-660X'">Laser Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1063-7818'">Quantum Electronics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1063-7869'">Physics-Uspekhi</xsl:when>
            <xsl:when test="$codeTitleIOP1='1064-5616'">Sbornik: Mathematics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1064-5632'">Izvestiya: Mathematics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1126-6708'">Journal of High Energy Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1286-4854'">EPL (Europhysics Letters)</xsl:when>
            <xsl:when test="$codeTitleIOP1='1347-4065'">Japanese Journal of Applied Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1355-5111'">Quantum and Semiclassical Optics: Journal of the European Optical Society Part B</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6382'">Classical and Quantum Gravity</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6390'">Distributed Systems Engineering</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6404'">European Journal of Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6420'">Inverse Problems</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6439'">Journal of Micromechanics and Microengineering</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6447'">Journal of Physics A: Mathematical and General</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6455'">Journal of Physics B: Atomic, Molecular and Optical Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6463'">Journal of Physics D: Applied Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6471'">Journal of Physics G: Nuclear and Particle Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-648X'">Journal of Physics: Condensed Matter</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6498'">Journal of Radiological Protection</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6501'">Measurement Science and Technology</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-651X'">Modelling and Simulation in Materials Science and Engineering</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6528'">Nanotechnology</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6544'">Nonlinearity</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6552'">Physics Education</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6560'">Physics in Medicine and Biology</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6579'">Physiological Measurement</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6587'">Plasma Physics and Controlled Fusion</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6595'">Plasma Sources Science and Technology</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6617'">Pure and Applied Optics: Journal of the European Optical Society Part A</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6625'">Quantum and Semiclassical Optics: Journal of the European Optical Society Part B</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6633'">Reports on Progress in Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6641'">Semiconductor Science and Technology</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-665X'">Smart Materials and Structures</xsl:when>
            <xsl:when test="$codeTitleIOP1='1361-6668'">Superconductor Science and Technology</xsl:when>
            <xsl:when test="$codeTitleIOP1='1367-2630'">New Journal of Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1402-4896'">Physica Scripta</xsl:when>
            <xsl:when test="$codeTitleIOP1='1464-4258'">Journal of Optics A: Pure and Applied Optics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1464-4266'">Journal of Optics B: Quantum and Semiclassical Optics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1468-4780'">Physics-Uspekhi</xsl:when>
            <xsl:when test="$codeTitleIOP1='1468-4799'">Quantum Electronics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1468-4802'">Russian Academy of Sciences. Sbornik Mathematics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1468-4810'">Russian Academy of Sciences. Izvestiya Mathematics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1468-4829'">Russian Mathematical Surveys</xsl:when>
            <xsl:when test="$codeTitleIOP1='1468-4837'">Russian Chemical Reviews</xsl:when>
            <xsl:when test="$codeTitleIOP1='1468-6996'">Science and Technology of Advanced Materials</xsl:when>
            <xsl:when test="$codeTitleIOP1='1475-4878'">Transactions of the Optical Society</xsl:when>
            <xsl:when test="$codeTitleIOP1='1475-7516'">Journal of Cosmology and Astroparticle Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1478-3967'">Physical Biology</xsl:when>
            <xsl:when test="$codeTitleIOP1='1478-3975'">Physical Biology</xsl:when>
            <xsl:when test="$codeTitleIOP1='1478-7814'">Proceedings of the Physical Society of London</xsl:when>
            <xsl:when test="$codeTitleIOP1='1538-3881'">The Astronomical Journal</xsl:when>
            <xsl:when test="$codeTitleIOP1='1538-4357'">The Astrophysical Journal Letters</xsl:when>
            <xsl:when test="$codeTitleIOP1='1538-4365'">The Astrophysical Journal Supplement Series</xsl:when>
            <xsl:when test="$codeTitleIOP1='1555-6611'">Laser Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1612-2011'">Laser Physics Letters</xsl:when>
            <xsl:when test="$codeTitleIOP1='1612-202X'">Laser Physics Letters</xsl:when>
            <xsl:when test="$codeTitleIOP1='1674-0068'">Chinese Journal of Chemical Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1674-1056'">Chinese Physics B</xsl:when>
            <xsl:when test="$codeTitleIOP1='1674-1137'">Chinese Physics C</xsl:when>
            <xsl:when test="$codeTitleIOP1='1674-4527'">Research in Astronomy and Astrophysics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1674-4926'">Journal of Semiconductors</xsl:when>
            <xsl:when test="$codeTitleIOP1='1681-7575'">Metrologia</xsl:when>
            <xsl:when test="$codeTitleIOP1='1741-2552'">Journal of Neural Engineering</xsl:when>
            <xsl:when test="$codeTitleIOP1='1741-2560'">Journal of Neural Engineering</xsl:when>
            <xsl:when test="$codeTitleIOP1='1741-3540'">Chinese Physics Letters</xsl:when>
            <xsl:when test="$codeTitleIOP1='1741-3567'">Journal of Optics A: Pure and Applied Optics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1741-3575'">Journal of Optics B: Quantum and Semiclassical Optics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1741-4199'">Chinese Physics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1741-4326'">Nuclear Fusion</xsl:when>
            <xsl:when test="$codeTitleIOP1='1742-2132'">Journal of Geophysics and Engineering</xsl:when>
            <xsl:when test="$codeTitleIOP1='1742-2140'">Journal of Geophysics and Engineering</xsl:when>
            <xsl:when test="$codeTitleIOP1='1742-5468'">Journal of Statistical Mechanics: Theory and Experiment</xsl:when>
            <xsl:when test="$codeTitleIOP1='1742-6588'">Journal of Physics: Conference Series</xsl:when>
            <xsl:when test="$codeTitleIOP1='1742-6596'">Journal of Physics: Conference Series</xsl:when>
            <xsl:when test="$codeTitleIOP1='1748-0221'">Journal of Instrumentation</xsl:when>
            <xsl:when test="$codeTitleIOP1='1748-3182'">Bioinspiration &amp; Biomimetics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1748-3190'">Bioinspiration &amp; Biomimetics</xsl:when>
            <xsl:when test="$codeTitleIOP1='1748-6041'">Biomedical Materials</xsl:when>
            <xsl:when test="$codeTitleIOP1='1748-605X'">Biomedical Materials</xsl:when>
            <xsl:when test="$codeTitleIOP1='1748-9326'">Environmental Research Letters</xsl:when>
            <xsl:when test="$codeTitleIOP1='1749-4680'">Computational Science &amp; Discovery</xsl:when>
            <xsl:when test="$codeTitleIOP1='1749-4699'">Computational Science &amp; Discovery</xsl:when>
            <xsl:when test="$codeTitleIOP1='1751-8113'">Journal of Physics A: Mathematical and Theoretical</xsl:when>
            <xsl:when test="$codeTitleIOP1='1751-8121'">Journal of Physics A: Mathematical and Theoretical</xsl:when>
            <xsl:when test="$codeTitleIOP1='1752-7155'">Journal of Breath Research</xsl:when>
            <xsl:when test="$codeTitleIOP1='1752-7163'">Journal of Breath Research</xsl:when>
            <xsl:when test="$codeTitleIOP1='1755-1307'">IOP Conference Series: Earth and Environmental Science</xsl:when>
            <xsl:when test="$codeTitleIOP1='1755-1315'">IOP Conference Series: Earth and Environmental Science</xsl:when>
            <xsl:when test="$codeTitleIOP1='1757-8981'">IOP Conference Series: Materials Science and Engineering</xsl:when>
            <xsl:when test="$codeTitleIOP1='1757-899X'">IOP Conference Series: Materials Science and Engineering</xsl:when>
            <xsl:when test="$codeTitleIOP1='1758-5082'">Biofabrication</xsl:when>
            <xsl:when test="$codeTitleIOP1='1758-5090'">Biofabrication</xsl:when>
            <xsl:when test="$codeTitleIOP1='1873-7005'">Fluid Dynamics Research</xsl:when>
            <xsl:when test="$codeTitleIOP1='1878-5514'">Science and Technology of Advanced Materials</xsl:when>
            <xsl:when test="$codeTitleIOP1='1882-0778'">Applied Physics Express</xsl:when>
            <xsl:when test="$codeTitleIOP1='1882-0786'">Applied Physics Express</xsl:when>
            <xsl:when test="$codeTitleIOP1='2040-8978'">Journal of Optics</xsl:when>
            <xsl:when test="$codeTitleIOP1='2040-8986'">Journal of Optics</xsl:when>
            <xsl:when test="$codeTitleIOP1='2041-8205'">The Astrophysical Journal Letters</xsl:when>
            <xsl:when test="$codeTitleIOP1='2041-8213'">The Astrophysical Journal Letters</xsl:when>
            <xsl:when test="$codeTitleIOP1='2043-6262'">Advances in Natural Sciences: Nanoscience and Nanotechnology</xsl:when>
            <xsl:when test="$codeTitleIOP1='2050-6120'">Methods and Applications in Fluorescence</xsl:when>
            <xsl:when test="$codeTitleIOP1='2051-672X'">Surface Topography: Metrology and Properties</xsl:when>
            <xsl:when test="$codeTitleIOP1='2053-1583'">2D Materials</xsl:when>
            <xsl:when test="$codeTitleIOP1='2053-1591'">Materials Research Express</xsl:when>
            <xsl:when test="$codeTitleIOP1='2053-1613'">Translational Materials Research</xsl:when>
        </xsl:choose>
    </xsl:variable>
    <!-- traitement des titres fre/eng concaténés dans une même balise -->
    <xsl:variable name="codeTitre">
        <xsl:value-of select="normalize-space(//header/ident/doi)"/>
    </xsl:variable>
    <xsl:variable name="codeTitreFre">
        <xsl:choose>
            <xsl:when test="$codeTitre='10.1088/0022-3727/30/2/012'">Analyse des fondements de la conduction électronique dans les états localisés, en fonction de la fréquence: II. Analyse des hypothèses fondamentales des théories existantes</xsl:when>
            <xsl:when test="$codeTitre='10.1088/0951-7715/21/6/013'">Expériences sur certaines transformations birationnelles quadratiques</xsl:when>
            <xsl:when test="$codeTitre='10.1088/0954-3899/27/10/301'">Expériences de détection directe de la matière sombre non baryonique</xsl:when>
            <xsl:when test="$codeTitre='10.1088/0022-3727/30/2/011'">Analyse des fondements de la conduction électronique dans les états localisés, en fonction de la fréquence: I. Analyse des méthodes de calcul dans les théories existantes</xsl:when>
            <xsl:when test="$codeTitre='10.1088/0026-1394/7/3/001'">Variation de la masse volumique de l'eau en fonction de sa composition isotopique</xsl:when>
            <xsl:when test="$codeTitre='10.1088/0031-9155/41/5/003'">Caractérisation de la réponse des collimateurs à trous parallèles hexagonaux des caméras à scintillation</xsl:when>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="codeTitreEng">
        <xsl:choose>
            <xsl:when test="$codeTitre='10.1088/0022-3727/30/2/012'">Analysis of the foundations of the frequency-dependent electronic conductivity in localized states: II. Analysis of the fundamental hypotheses of the existing theories</xsl:when>
            <xsl:when test="$codeTitre='10.1088/0951-7715/21/6/013'">Experiments on some birational quadratic transformations</xsl:when>
            <xsl:when test="$codeTitre='10.1088/0954-3899/27/10/301'">Direct searches for non-baryonic dark matter</xsl:when>
            <xsl:when test="$codeTitre='10.1088/0022-3727/30/2/011'">Analysis of the foundations of the frequency-dependent electronic conductivity in localized states: I. Analysis of the methods of calculation in the available theories</xsl:when>
            <xsl:when test="$codeTitre='10.1088/0026-1394/7/3/001'">Variation of the Water Density as a Function of its Isotopic Composition</xsl:when>
            <xsl:when test="$codeTitre='10.1088/0031-9155/41/5/003'">Characterization of the response of hexagonal parallel-hole collimators of scintillation cameras</xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:template match="article | header">
        <TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="xml:lang">
                <xsl:choose>
                    <xsl:when test="//article-data/doi='10.1088/1751-8113/42/8/085201'">en</xsl:when>
                    <xsl:when test="//header/title-group/title/@lang[string-length() &gt; 0]">
                        <xsl:value-of select="//header/title-group/title/@lang"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- ******************* Language / eng par défaut ******************************-->
                        <xsl:text>en</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <!-- Ici simplement reprise du titre principal (le détail est dans sourceDesc) -->
                        <xsl:apply-templates select="header/title-group/title"/>
                        <xsl:choose>
                            <xsl:when test="title/title_full!=''">
                                <xsl:apply-templates select="title/title_full"/>
                            </xsl:when>
                            <xsl:when test="title/title_toc !=''">
                                <xsl:apply-templates select="title/title_toc"/>
                            </xsl:when>
                        </xsl:choose>
                    </titleStmt>
                    
                    <publicationStmt>
                        <authority>ISTEX</authority>
                        <!-- Publisher jnl -->
                        <xsl:apply-templates select="article-metadata/jnl-data/jnl-imprint"/>
                        
                        <!-- "printed in" ~ pubPlace -->
                        <xsl:if test="article-metadata/article-data/printed [string-length() &gt; 0]">
                        <xsl:apply-templates select="article-metadata/article-data/printed"/>
                        <xsl:apply-templates select="dates/date_cover"/>
                        </xsl:if>
                       <availability>
                           <licence>
                               <xsl:choose>
                                   <xsl:when test="//article-metadata/jnl-data/jnl-imprint">
                                       <xsl:value-of select="//article-metadata/jnl-data/jnl-imprint"/>
                                   </xsl:when>
                                   <xsl:otherwise>IOP Publishing</xsl:otherwise>
                               </xsl:choose>
                           </licence>
                       </availability>
                        <xsl:apply-templates select="//volume-data/year-publication | dates/date_cover"/>
                    </publicationStmt>
                    <!-- genre ISTEX du document niveau article-->
                    <notesStmt>
                        <note type="content-type">
                            <xsl:choose>
                                <xsl:when test="$codeGenreAll">
                                    <xsl:attribute name="subtype">
                                        <xsl:value-of select="$codeGenreIstex"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="source">
                                        <xsl:value-of select="$codeGenreAll"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="scheme">
                                        <xsl:value-of select="$codeGenreArk"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="$codeGenreIstex"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="subtype">N/A</xsl:attribute>
                                    <xsl:attribute name="source">ISTEX</xsl:attribute>
                                    <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:attribute>
                                    <xsl:text>other</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </note>
                        <note type="publication-type" subtype="journal">
                            <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0GLKJH51-B</xsl:attribute>
                            <xsl:text>journal</xsl:text>
                        </note>
                    </notesStmt>
                    <!-- métadonnées décrivant l'original -->
                    <sourceDesc>
                        <biblStruct>
                            <analytic>
                                <xsl:choose>
                                    <xsl:when test="$codeTitreFre !=''">
                                        <title level="a" xml:id="fr">
                                            <xsl:value-of select="$codeTitreFre"/>
                                        </title>
                                        <title level="a" xml:id="en">
                                            <xsl:value-of select="$codeTitreEng"/>
                                        </title>
                                    </xsl:when>
                                </xsl:choose>
                                <!-- Titre(s) article -->
                                <xsl:apply-templates select="header/title-group/title | title/title_full |title/surtitle"/>
                                <xsl:apply-templates select="header/title-group/short-title"/>
                                <xsl:apply-templates select="header/title-group/ej-title"/>
                                <!-- Auteurs article -->
                                <!-- <short-author-list> non repris -->
                                <xsl:apply-templates select="authors/* except(//short-author-list|//authors_toc| //affil)" mode ="IOP"/>
                                <xsl:apply-templates select="header/author-group/* except(//short-author-list|//authors_toc| //affil)" mode ="IOP"/>
                                <xsl:apply-templates select="header/collaboration except(//short-author-list|//authors_toc| //affil)" mode ="IOP"/>
                               

                                <!-- Adresse(s) d'affiliation -->
                                <xsl:apply-templates select="header/editor-group | header/author-group/collaboration | header/authors/collaboration | header/editors/collaboration"/>

                                <!-- Identifiants article (DOI, PII et 3 IDS internes à IOP ...) -->
                                <xsl:apply-templates select="article-metadata/article-data/doi[string-length() &gt; 0] | ident/doi[string-length() &gt; 0]"/>
                                <xsl:apply-templates select="article-metadata/article-data/pii[string-length() &gt; 0]"/>
                                <xsl:apply-templates select="article-metadata/article-data/ccc[string-length() &gt; 0]"/>
                                <xsl:apply-templates select="article-metadata/article-data/article-number[string-length() &gt; 0]| ident/artnum[string-length() &gt; 0]"/>
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
                                <xsl:if test="ident/pii[string-length() &gt; 0 ]">
                                    <idno type="PII">
                                        <xsl:value-of select="ident/pii"/>
                                    </idno>
                                </xsl:if>
                                <xsl:if test="@artid|ident/artnum">
                                    <idno type="articleId">
                                        <xsl:value-of select="@artid|ident/artnum"/>
                                    </idno>
                                </xsl:if>
                                <xsl:if test="text/fulltext/@pdf[string-length() &gt; 0 ]">
                                    <idno type="pdf">
                                        <xsl:value-of select="text/fulltext/@pdf"/>
                                    </idno>
                                </xsl:if>
                            </analytic>

                            <monogr>
                                <xsl:choose>
                                    <xsl:when test="ident/issn">
                                        <title level="j" type="main">
                                            <xsl:value-of select="$codeTitleIOP"/>
                                        </title>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <!-- Titres du périodique NB: suppose un <jnl-data> ! -->
                                        <xsl:apply-templates select="article-metadata/jnl-data/jnl-fullname"/>
                                        <xsl:apply-templates
                                            select="article-metadata/jnl-data/jnl-abbreviation"/>
                                        <xsl:apply-templates
                                            select="article-metadata/jnl-data/jnl-shortname"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                                
                                <!-- Identifiants journal (ISSN et CODEN) -->
                                <xsl:apply-templates select="article-metadata/jnl-data/jnl-issn | ident/issn"/>
                                <xsl:apply-templates select="article-metadata/jnl-data/jnl-coden"/>
                                <xsl:apply-templates select="article-metadata/jnl-data/jnl-web-address"/>
                                <xsl:apply-templates select="ident/ecs"/>
                                <xsl:apply-templates select="ident/serial"/>
                                <imprint>
                                    <!-- VOLUMAISON -->
                                    <xsl:apply-templates
                                        select="article-metadata/volume-data/year-publication"/>
                                    <xsl:apply-templates
                                        select="article-metadata/issue-data/coverdate"/>
                                    <xsl:apply-templates
                                        select="/header/dates/date_cover"/>
                                    <xsl:apply-templates
                                        select="article-metadata/volume-data/volume-number |ident/volume"/>
                                                                                         
                                    <xsl:apply-templates
                                        select="article-metadata/issue-data/issue-number | ident/issue"/>

                                    <!-- Pagination de l'article dans la monographie ou le fascicule -->
                                    <xsl:if test="ident/pages/@range[string-length() &gt; 0]">
                                        <biblScope unit="page-range">
                                            <xsl:value-of select="ident/pages/@range"/>
                                        </biblScope> 
                                    </xsl:if>
                                    <biblScope unit="page">
                                        <xsl:attribute name="from" select="article-metadata/article-data/first-page | ident/pages/@start"/>
                                        <xsl:value-of select="article-metadata/article-data/first-page | ident/pages/@start"/>
                                    </biblScope>
                                    <xsl:if test="article-metadata/article-data/last-page[string-length() &gt; 0] | ident/pages/@end[string-length() &gt; 0]">
                                        <biblScope unit="page">
                                            <xsl:attribute name="to" select="article-metadata/article-data/last-page | ident/pages/@end"/>
                                            <xsl:value-of select="article-metadata/article-data/last-page | ident/pages/@end"/>
                                        </biblScope>
                                    </xsl:if>

                                    <xsl:apply-templates
                                        select="article-metadata/article-data/length"/>
                                </imprint>
                            </monogr>
                        </biblStruct>
                    </sourceDesc>
                </fileDesc>
                <!-- versionning -->
                <xsl:call-template name="insertVersion"/>
                <!-- métadonnées de profil (thématique et historique du doc) -->
                <profileDesc>
                    <!--language english | french | german dtd iopv1_8-->
                    <langUsage>
                        <xsl:choose>
                            <xsl:when test="//article-data/doi='10.1088/1751-8113/42/8/085201'">
                                <language ident="en">en</language>
                            </xsl:when>
                            <xsl:when test="//header/title-group/title/@lang[string-length() &gt; 0]">
                                <language>
                                    <xsl:attribute name="ident">
                                        <xsl:value-of select="$codeLangIOP"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="//header/title-group/title/@lang"/>
                                </language>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- ******************* Language / eng par défaut ******************************-->
                                <language ident="en">en</language>
                            </xsl:otherwise>
                        </xsl:choose>
                    </langUsage>
                    <!-- Le résumé: abstract -->
                    <xsl:apply-templates select="header/abstract-group"/>
					
                    <!-- Reprise directe de toutes les classifications de l'article -->
                    <xsl:apply-templates select="header/classifications"/>
                    <!-- textClass ==> les classCode "pacs"
                                   ==> les subj. areas (propres à une série ?)
                                   ==> les kwds (si pas d'autre meilleur endroit)-->
                    
                    <!-- history => creation/date+ -->
                    <xsl:apply-templates select="header/history"/>

                </profileDesc>
                
                <!-- traceability -->
                <revisionDesc>
                    <change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
                </revisionDesc>
            </teiHeader>
                <text>
                    <xsl:choose>
                        <xsl:when test="//sec-level1">
                            <body>
                                <xsl:apply-templates select="//sec-level1"/>
                            </body>
                        </xsl:when>
                        <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                            <body>
                                <div>
                                    <p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
                                </div>
                            </body>
                        </xsl:when>
                        <xsl:otherwise>
                            <body>
                                <div><p></p></div>
                            </body>
                        </xsl:otherwise>
                    </xsl:choose>
                    <back>
                        <!-- remerciements -->
                        <xsl:apply-templates select="/article/body/acknowledgment"/>
                        <!-- Lancement des refbibs -->
                        <xsl:apply-templates select="/article/back/references"/>
                        <!-- <listBibl> (<biblStruct/> +) </listBibl> -->
                        
                        
                        <!-- Notes de bas de page -->
                        <xsl:apply-templates select="/article/back/footnotes"/>
                    </back>
                </text>
        </TEI>

    </xsl:template>


    <!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        première partie de l'input :
        
        =============================
          ARTICLE-METADATA/
              [ART|ISS|VOL|JNL]-DATA
        =============================
    -->


    <!-- ARTICLE-DATA ***************************

        IN: /article/article-metadata/article-data/* <<
        La zone article-data recelle plein de trucs

        ==> templates "identifiants"
        écrivent uniquement dans header/.../analytic (d'où elles sont appelées)

        OUT: 
        teiHeader/fileDesc/sourceDesc/biblStruct/analytic/.
        >> idno
        
    -->
<!-- title -->
<xsl:template match="title/title_full">
    <xsl:choose>
        <xsl:when test="//ident/doi='10.1088/0264-9381/21/1/E01'">
            <title level="a" type="main">
                <xsl:attribute name="lang">en</xsl:attribute>
                <xsl:value-of select="normalize-space(//title/surtitle)"/>
            </title>
        </xsl:when>
        <xsl:otherwise>
            <title level="a" type="main">
                <xsl:if test="@lang">
                    <xsl:attribute name="xml:lang">
                        <xsl:value-of select="@lang"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:apply-templates/>
            </title>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
    
   

    <!-- identifiant DOI-->
    <xsl:template match="article-data/doi">
        <idno type="DOI">
            <xsl:value-of select="."/>
        </idno>
    </xsl:template>

    <!-- identifiant PII -->
    <xsl:template match="article-data/pii">
        <idno type="PII">
            <xsl:value-of select="."/>
        </idno>
    </xsl:template>

    <!-- identifiant commercial IOP dit "ccc" -->
    <xsl:template match="article-data/ccc">
        <idno type="iop-ccc">
            <xsl:value-of select="."/>
        </idno>
    </xsl:template>

    <!-- numéro d'article IOP -->
    <xsl:template match="article-data/article-number">
        <idno type="articleNumber">
            <xsl:value-of select="."/>
        </idno>
    </xsl:template>


    <!-- 
        Il y a aussi des imprint-like
        
        OUT: 
        teiHeader/fileDesc/sourceDesc/biblStruct/monogr/imprint
        >> pubPlace
        >> biblScope
    -->

    <!-- printed in => pubPlace  -->
    <xsl:template match="article-data/printed">
        <pubPlace>
            <xsl:value-of select="."/>
        </pubPlace>
    </xsl:template>

    <!-- length => biblScope pp range  -->
    <xsl:template match="article-data/length">
       <biblScope unit="page-count">
           <xsl:value-of select="."/>
       </biblScope>
    </xsl:template>

    <!-- first-page et last-page utilisés directement dans monogr -->

    <!-- FIN ARTICLE-DATA *********************** -->




    <!-- JOURNAL-DATA ***************************
        IN: /article/article-metadata/jnl-data/* <<
        
        OUT: 
        teiHeader/fileDesc/sourceDesc/biblStruct/monogr
        >> title
        >> idno (ISSN, coden)
        >> ref (adresse web)
    -->

    <!-- full j title 
         ex: "Journal of Physics D: Applied Physics" -->
    <xsl:template match="jnl-data/jnl-fullname">
        <title level="j" type="main">
            <xsl:apply-templates/>
        </title>
    </xsl:template>

    <!-- abbrev j title 
        ex: "J. Phys. D: Appl. Phys." -->
    <xsl:template match="jnl-data/jnl-abbreviation">
        <title level="j" type="alt">
            <xsl:apply-templates/>
        </title>
    </xsl:template>

    <!-- short j title 
        ex: "JPhysD" -->
    <xsl:template match="jnl-data/jnl-shortname">
        <title level="j" type="short">
            <xsl:apply-templates/>
        </title>
    </xsl:template>

    <!-- ISSN
        ex: "0022-3727" -->
    <xsl:template match="jnl-data/jnl-issn">
        <idno type="pISSN">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>

    <!-- CODEN 
        ex: "JPAPBE" -->
    <xsl:template match="jnl-data/jnl-coden">
        <idno type="CODEN">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>

    <!-- web address
        ex: "stacks.iop.org/JPhysD" -->
    <xsl:template match="jnl-data/jnl-web-address">
        <idno type="URL">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>

    <!-- imprint (~publisher)
        ex: "IOP Publishing" -->
    <xsl:template match="jnl-data/jnl-imprint">
        <publisher>
            <xsl:apply-templates/>
        </publisher>
    </xsl:template>

    <!-- FIN JOURNAL-DATA *********************** -->



    <!-- ISSUE-DATA **************************
        
        IN: /article/article-metadata/issue-data/* <<
        
        OUT: 
        teiHeader/fileDesc/sourceDesc/biblStruct/monogr/imprint
        >> biblScope
        >> date
    -->
    
    <xsl:template match="date_cover">
        <date when="{.}">
            <xsl:value-of select="substring-before(.,'-')"/>
        </date>
    </xsl:template>

    <!-- issue number => biblScope unit issue 
        ex: "4" -->
    <xsl:template match="issue-data/issue-number">
        <biblScope unit="issue">
            <xsl:value-of select="."/>
        </biblScope>
    </xsl:template>

    <!-- coverdate => date type="cover"  ?? 
        ex: "April 2006" -->
    <xsl:template match="issue-data/coverdate">
        
        <!-- On tokenize sur les espaces -->
        <xsl:param name="segments" 
            select="tokenize(.,' ')"/>
        <xsl:param name="nbSegments" 
            select="count($segments)"/>
        
        <date type="issue-cover">
            <!-- l'attribut iso @when -->
            <xsl:attribute name="when">
                <xsl:choose>
                    <xsl:when test="$nbSegments = 3">
                        <xsl:call-template name="makeISODateFromComponents">
                            <xsl:with-param name="oldDay" select="$segments[1]"/>
                            <xsl:with-param name="oldMonth" select="$segments[2]"/>
                            <xsl:with-param name="oldYear" select="$segments[3]"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$nbSegments = 2">
                        <xsl:call-template name="makeISODateFromComponents">
                            <xsl:with-param name="oldMonth" select="$segments[1]"/>
                            <xsl:with-param name="oldYear" select="$segments[2]"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="makeISODateFromComponents">
                            <xsl:with-param name="oldYear" select="$segments[$nbSegments]"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            
            <!-- et bien sur la valeur d'origine -->
            <xsl:value-of select="."/>
        </date>
    </xsl:template>


    <!-- et VOLUME-DATA ***
        
        IN: /article/article-metadata/volume-data/* <<
        
        OUT: 
        teiHeader/fileDesc/sourceDesc/biblStruct/monogr/imprint
        >> biblScope
        >> date
    -->
    <!-- volume-number
        ex: "Journal of Physics D: Applied Physics" -->
    <xsl:template match="volume-data/volume-number">
        <biblScope unit="vol">
            <xsl:value-of select="."/>
        </biblScope>
    </xsl:template>

    <!-- year-publication => année seule => date sans when
        ex: "2007" -->
    <xsl:template match="volume-data/year-publication">
        <date type="published" when="{.}">
            <xsl:value-of select="."/>
        </date>
    </xsl:template>

    <!-- FIN ISSUE/VOLUME ******************** -->






    <!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        ==============
            HEADER
        ==============
    -->

    <!-- TITRES DE L'ARTICLE ***********************
        IN: /article/header/title-group/* <<
        OUT: teiHeader/fileDesc/sourceDesc/biblStruct/analytic
             >> title
    -->
    <xsl:template match="/article/header/title-group">
        <!-- On évite de copier la balise <title-group> 
            mais on doit couvrir tous les cas de figure -->
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="title-group/short-title">
        <title level="a" type="short">
            <xsl:apply-templates/>
        </title>
    </xsl:template>

    <xsl:template match="title-group/ej-title">
        <title level="a" type="alt" subtype="ej">
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <!-- FIN TITRES DE L'ARTICLE*********************** -->



    <!-- AUTEURS ***************************************
        
        Ces templates servent à 2 endroits : <header> et <references>
        /article/header/author-group/* 
        /article/back/references//(journal-ref|book-ref|conf-ref|misc-ref)/authors
        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        
        IN: author-group/* 
            authors/*
            editors/*
        
        OUT: /TEI/teiHeader//sourceDesc/biblStruct
             /TEI/text/back//listBibl/biblStruct +
             
           >> analytic/author+/*
           >> analytic/editor+/*
    -->
    
    <!-- author-group (dans le header) 
         authors (dans les références biblio)
         
         => deux conteneurs de liste d'auteurs, un même comportement
         
         TODO: (pour editors uniquement) utiliser éventuellement l'attribut optionnel @order
    -->
    <xsl:template match="header/author-group">
        <!-- Pas de liste en TEI, mais on remontera parfois à ce tag 
             car les author IOP ne sont pas tous des author TEI,
             notamment pour les editor        -->
        <xsl:apply-templates/>
    </xsl:template>
    


    <!-- author | au
         
         IN: author-group/author (templates au-dessus)
             authors/au
             editors/author
             editors/au
             
        OUT: author/persName
        
        Cas "auteur normal"
    -->
    <xsl:template match="author-group | collaboration">
        <xsl:apply-templates select="*" mode="IOP"/>
    </xsl:template>
    <xsl:template match="authors">
        <xsl:apply-templates select="au" mode="IOP"/>
    </xsl:template>
    <xsl:template match="author|author_granular" mode="IOP">
        <!-- On tokenize sur les espaces -->
        <xsl:param name="items" 
            select="tokenize(.,' ')"/>
        <xsl:param name="nbItems" 
            select="count($items)"/>
        <author>
            <xsl:variable name="i" select="position() -1"/>
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
            </xsl:attribute>
            
            <xsl:choose>
                <xsl:when test="first-names">
                    <persName>
                        <!-- ne préjuge pas de l'ordre -->
                        <xsl:apply-templates/>
                    </persName>
                </xsl:when>
                <xsl:when test="given">
                    <persName>
                        <!-- ne préjuge pas de l'ordre -->
                        <xsl:apply-templates/>
                    </persName>
                </xsl:when>
                <xsl:otherwise>
                        <!-- exemple  <author>S C Tisley</author> -->
                    <xsl:choose>
                        <xsl:when test="$nbItems = 3">
                            <persName>
                                <forename type="first">
                                    <xsl:value-of select="concat($items[1],'.',$items[2],'.')"/>
                                </forename>
                                <surname>
                                    <xsl:value-of select="$items[3]"/>
                                </surname>
                            </persName>
                        </xsl:when>
                        <xsl:when test="$nbItems = 2">
                            <persName>
                                <forename type="first">
                                    <xsl:value-of select="$items[1]"/>
                                </forename>
                                <surname>
                                    <xsl:value-of select="$items[2]"/>
                                </surname>
                            </persName>
                        </xsl:when>
                        <xsl:otherwise>
                            <name>
                                <xsl:value-of select="."/>
                            </name>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="//address-group/address[@id=current()/@address]">
                    <affiliation>
                        <xsl:call-template name="parseAffiliation">
                            <xsl:with-param name="theAffil">
                                <xsl:value-of select="//address-group/address[@id=current()/@address]"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </affiliation>
                </xsl:when>
                <xsl:when test="//affil[@id=current()/@affil]">
                    <affiliation>
                        <xsl:call-template name="parseAffiliation">
                            <xsl:with-param name="theAffil">
                                <xsl:value-of select="//affil[@id=current()/@affil]"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </affiliation>
                </xsl:when>
                <xsl:when test="//affil">
                    <affiliation>
                        <xsl:call-template name="parseAffiliation">
                            <xsl:with-param name="theAffil">
                                <xsl:value-of select="//affil"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </affiliation>
                </xsl:when>
            </xsl:choose>
        </author>
    </xsl:template>
    <xsl:template match="au" mode="IOP">
        <author>
            <xsl:choose>
                <xsl:when test="first-names">
                    <persName>
                        <!-- ne préjuge pas de l'ordre -->
                        <xsl:apply-templates/>
                    </persName>
                </xsl:when>
                <xsl:otherwise>
                    <name>
                        <xsl:apply-templates/>
                    </name>
                </xsl:otherwise>
            </xsl:choose>
        </author>
    </xsl:template>
    
    <!-- idem si père = editors -->
    <xsl:template match="editors/author
                       | editors/au">
        <editor>
            <persName>
                <!-- ne préjuge pas de l'ordre -->
                <xsl:apply-templates select="./*[contains(name(),'-name')]"/>
            </persName>
        </editor>
    </xsl:template>
    
    
    <!-- (Cas rares)
        IN: (authors | author-group | editors)/.
         << short-author-list
         << corporate
         << collaboration
         << collaboration/group
         << authors/others
    -->

    
    <!-- "les auteurs" : version "condensée conventionnellement"
        Ex: "K Rahmani et al"
        Uniquement dans la référence du header (->sourceDesc)
        
        TODO <author> ou <bibl> ?
    -->
    <xsl:template match="author-group/short-author-list">
        <author>
            <xsl:value-of select="."/>
        </author>
    </xsl:template>
    
    <!-- idem si père = editors -->
    <xsl:template match="editors/others">
        <editor>
            <xsl:value-of select="."/>
        </editor>
    </xsl:template>

    <!-- corporate
        Ex: "K Rahmani et al"
        
        TODO <author> ou <bibl> ?
    -->
    <xsl:template match="author-group/corporate | authors/corporate">
        <author>
            <orgName>
                <xsl:value-of select="."/>
            </orgName>
        </author>
    </xsl:template>
    
    <!-- idem si père = editors -->
    <xsl:template match="editors/corporate">
        <editor>
            <orgName>
                <xsl:value-of select="."/>
            </orgName>
        </editor>
    </xsl:template>
    
    <!--authors/collaboration 
        "Collaborateur" non spécifique => respStmt
        Ex: "the ASDEX Upgrade Team"
        
        TODO :
          - attribut @reflist en entrée à examiner et éventuellement reprendre
    -->
    <xsl:template match="author-group/collaboration | authors/collaboration | editors/collaboration">
        <xsl:apply-templates select="author"/>
        <xsl:apply-templates select="editor"/>
        <xsl:apply-templates select="group"/>
    </xsl:template>
    
    <!--authors/collaboration/group
        (optionnel) le seul sous-élément autorisé de <collaboration>
        TODO voir si on peut ajouter quelque chose ici
    -->
    <xsl:template match="collaboration/group">
        <author>
            <name>
        <xsl:apply-templates/>
            </name>
        </author>
    </xsl:template>
    <!--authors/others
        Ex: "<other><italic>et al.</italic></other>"
        Vu uniquement dans les références de fin d'article
    -->
    <xsl:template match="authors/others">
        <author ana="other-authors">
            <xsl:value-of select="normalize-space(.)"/>
        </author>
    </xsl:template>
    
    <!-- idem si père = editors -->
    <xsl:template match="editors/others">
        <editor ana="other-authors">
            <xsl:value-of select="normalize-space(.)"/>
        </editor>
    </xsl:template>
    
    

    <!-- sous-éléments AUTEURS *************
        NB: utilisables pour le header et pour les refbibs du <back>
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        IN: << /article/header/author-group/author/*
            << /article/back/references/reference-list/*-ref/authors/au/*
    -->
    
    <!-- prénoms -->
    <xsl:template match="first-names">
        <forename type="first">
            <xsl:value-of select="."/>
        </forename>
    </xsl:template>


    <!-- nom de famille -->
    <xsl:template match="second-name">
        <surname>
            <xsl:value-of select="."/>
        </surname>
    </xsl:template>


    <!-- FIN AUTEURS *********************** -->


    <!-- ADRESSES ***********************
        IN: /article/header/address-group/*  <<
        
        TODO : correspondances auteurs <=> adresses
    -->
    <xsl:template match="/article/header/address-group">
        <!-- 2 possibilités: adresse postale ou email -->
        <xsl:apply-templates/>
    </xsl:template>

    <!-- 1) adresse postale -->
    <xsl:template match="/article/header/address-group/address">
        <xsl:apply-templates/>
    </xsl:template>


    <!--      (si pays)
              IN: address-group/address/country
              OUT: ./country
              ==> rien à faire tant que apply-templates en amont 
                                 et qu'il n'y pas de namespaces
        
              Ex: "Belgium"
    -->

    <!-- (si orgname)
             IN: <orgname>
             OUT: <orgName>
             Ex: "Laboratoire de physique des plasmas—Laboratorium voor Plasmafysica, 
                  Association ‘Euratom-Etat Belge’—Associatie ‘Euratom-Belgische Staat’, 
                  Ecole Royale Militaire—Koninklijke Militaire School"
    -->
    <xsl:template match="/article/header/address-group/address/orgname">
        <orgName type="institution">
            <xsl:apply-templates/>
        </orgName>
    </xsl:template>


    <!-- 2) email : conteneur "e-adresse" -->
    <xsl:template match="/article/header/address-group/e-address/email">
        <email>
            <xsl:value-of select="."/>
        </email>
    </xsl:template>

    <!-- email proprement dit
        IN: address-group/e-address/email
        OUT: ./email
        Ex: "sam.gamegie@cityhall.shire"
        ==> rien à faire tant que apply-templates en amont
                            et qu'il n'y pas de namespaces
    -->

    <!-- FIN ADDR *********************** -->



    <!-- ABSTRACT ***********************
        IN: /article/header/abstract-group/*  <<
        
        OUT: teiHeader/profileDesc/abstract
             >> head
             >> p
        
        TODO passer tout ça dans KeywordsAbstract.xsl
    -->

    <xsl:template match="abstract-group">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- les templates pour <heading> et <p> sont plus bas
         dans la zone BODY -->


    <!-- FIN ABS *********************** -->



    <!-- CLASSIFICATIONS ***********************
        IN: /article/header/classifications  <<
        
       OUT: teiHeader/fileDesc/profileDesc/
            >> textClass/classCode
            >> textClass/keywords
            >> biblScope ?
    -->
    
    <!-- Déjà on met un textClass 
         (car cet elt recouvre bien tous les 
         contenus possibles de <classifications>) -->
    <xsl:template match="classifications">
        <xsl:apply-templates/>
            <!--<xsl:apply-templates select="subject-areas"/>
            <xsl:apply-templates select="class-codes"/>
        
        <textClass ana="keywords">
            <xsl:apply-templates select="keywords"/>
        </textClass>-->
    </xsl:template>

    <!-- class-codes ==> classCodes
       La tei a un niveau d'imbrication de moins => on plonge direct
       (mais on reviendra chercher l'attribut scheme ici) 
       
       Ex: <class-codes scheme="pacs"> 
              (<code>)+ 
           </class-codes>
    -->
    <!--  IN: celui au-dessus  <<
         OUT: profileDesc/textClass
              >> classCode +
         Ex:  "52.35.Ra"
    -->
    <xsl:template match="class-codes">
        <xsl:choose>
            <!-- kwd écartés car données sources mal-formées
                voir ark:/67375/0T8-WVGSN7SL-Q
                <classifications>
                    <class-codes scheme="pacs">
                        <code>93C40</code>
                        <code>Adaptive</code>
                        <code>control</code>
                        <code>74M05</code>
                        <code>Control</code>
                        <code>switches</code>
                        <code>and</code>
                        <code>devices</code>
                        <code>(&ldquo;smart</code>
                        <code>materials&rdquo;)</code>
                        <code>70Q05</code>
                        <code>Control</code>
                        <code>of</code>
                        <code>mechanical</code>
                        <code>systems</code>
                     </class-codes>
                </classifications>
                -->
            <xsl:when test="//article/article-metadata/article-data/doi='10.1088/0964-1726/16/5/043'"/>
            <xsl:otherwise>
                <textClass ana="classifications">
                        <xsl:apply-templates/>
                </textClass>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="code">
        <xsl:variable name="codePacsOrig">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:variable>
        <xsl:variable name="codePacs">
            <xsl:value-of select="translate($codePacsOrig,'.','')"/>
        </xsl:variable>
        <xsl:variable name="resultCodePacs">
            <xsl:value-of select="normalize-space($titleCodesPACS/descendant::tei:row[translate(tei:cell[@role = 'code']/text(),'.','') = $codePacs]/tei:cell[@role = 'name'])"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$codePacsOrig='-'"/>
            <xsl:otherwise>
                <classCode>
                    <xsl:attribute name="scheme" select="../@scheme"/>
                    <xsl:attribute name="n" select="."/>
                    <xsl:choose>
                        <!-- réparation d'un pb de code contenant les codes et la verbalisation des données-->
                        <xsl:when test="contains($codePacsOrig,' ') and contains($codePacsOrig,'.')">
                            <xsl:variable name="corrCode">
                                <xsl:value-of select="substring-after($codePacsOrig,' ')"/>
                            </xsl:variable>
                            <xsl:value-of select="$corrCode"/>
                            <!--<xsl:value-of select="exslt:node-set($table_codePacs)/row[@raw = $corrCode]/@value"/>-->
                        </xsl:when>
                        <xsl:when test="$resultCodePacs !=''">
                            <xsl:value-of select="."/><xsl:text>: </xsl:text>
                            <xsl:value-of select="$resultCodePacs"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$codePacsOrig"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </classCode>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!--  keywords  ==> keywords
        
          IN: classification  <<
         OUT: profileDesc/textClass
              >> keywords
    -->

    <!--  
         IN: celui au-dessus  <<
        OUT: profileDesc/textClass/keywords
          >> term
    -->
    <!-- On traite les subject-areas comme des classCode  
        
        subject-areas ==> classCode (en enlevant une imbrication)
        
        IN: classification  <<
        OUT: skip inside
    -->    
    <xsl:template match="subject-areas">
        <textClass ana="classifications">
            <xsl:apply-templates/>
        </textClass>
    </xsl:template>
    
    <!--  
        IN: celui au-dessus  <<
        OUT: profileDesc/textClass
        >> classCode +
    -->
    <xsl:template match="category">
        <classCode>
            <xsl:attribute name="scheme" select="../@type"/>
            <xsl:choose>
                <xsl:when test="@code">
                     <xsl:value-of select="@code"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </classCode>
    </xsl:template>
    <!-- FIN CLASSIFS ************************** -->


    <!-- HISTORY ************************ 
        
        IN : /article/header/history  <<
        OUT: teiHeader/creation
             >> date +
    
        Ex: <history received="14 January 2010" finalform="4 March 2010" online="14 April 2010"/>
        
        ==> apparement cette fois tout est dans les attributs
    -->
    
    <xsl:template match="header/history">
        <creation>
            <xsl:for-each select="attribute::node()">
                <date>
                    <!-- TODO l'attribut iso @when -->
                    
                    <!-- reprise du type annoncé par iop -->
                    <xsl:attribute name="type" select="name()"/>
                        
                    <!-- reprise de valeur depuis le contenu de l'attribut -->
                    <xsl:value-of select="."/>
                </date>
            </xsl:for-each>
        </creation>
            
    </xsl:template>

    <!-- FIN HISTORY ******************** -->




    <!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        ==============
            BODY
        ==============
        
    -->
    <xsl:template match="sec-level1">
        <div>
            <!-- id -->
            <xsl:attribute name="xml:id" select="@id"/>
            <xsl:attribute name="n" select="@label"/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="sec-level2">
        <div>
            <!-- id -->
            <xsl:attribute name="xml:id" select="@id"/>
            <xsl:attribute name="n" select="@label"/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- FIN BODY *********************** -->
    
    
    
    <!-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        dernière partie de l'input :
        
        ==============
             BACK
        ==============
        
        < REFERENCES
        < FOOTNOTES
        
    -->

   
    <!-- ^^^^^^^^^^
         REFERENCES (biblio)
         ^^^^^^^^^^
        IN: /article/back << references
        
        OUT: TEI/text/back/div[@id="references]/listBibl/
        >> biblStruct +/analytic
        >> biblStruct +/monographic
        
       NB:  Ces 7 templates forment une structure générale qui 
            appelle ensuite les sous-éléments ad hoc (plus bas)
            
       NB2: On place les identifiants à leur niveau pertinent (DOI article => analytic, ISBN, ISSN => monogr)
            mais les liens web ref[@url] en dehors d'analytic et monogr, comme dans l'exemple
            n° 4 (Coombs) de la doc sur www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COBICOL
        
        TODO 
          - harmoniser avec Bibliography.xsl
          - idem avec JournalComponents.xsl (volume, etc)
          - l'y incorporer éventuellement
          - étudier les cas de l'attribut body/@refstyle en input
            (valeurs observées = "numeric" ou "alphabetic")
    -->
    
    <!-- conteneur section -->
    <xsl:template match="article/back/references">
        <div type="references">
            <xsl:apply-templates select="reference-list"/>
        </div>
    </xsl:template>
    
    <!-- reference-list ***********************
          IN:  article/back/references/reference-list <<
         OUT: >>listBibl
      -->
    <xsl:template match="reference-list">
        <listBibl>
            <!-- n entrées de tag parmi {journal-ref | book-ref | conf-ref | misc-ref} 
                         ou cas "multipart" (imbrication gigogne de plusieurs entrées)
            -->
            <xsl:apply-templates select="multipart | ref-group | *[ends-with(local-name(),'-ref')]"/>
        </listBibl>
    </xsl:template> 
    
    <!-- multipart | ref-group
          (cas de refbibs gigognes éventuellement récursives)
          IN:  le précédent
          OUT: listBibl
     -->
    <xsl:template match="reference-list//multipart | reference-list//refgroup">
        <!-- k entrées de tag parmi {journal-ref | book-ref | conf-ref | misc-ref} -->
        <xsl:apply-templates select="multipart | ref-group | *[ends-with(local-name(),'-ref')]"/>
    </xsl:template> 
    
    <!-- SOUS-ELEMENTS BIBLIO (1/4: pour analytic) ********************
        
        IN:  journal-ref | book-ref | conf-ref | misc-ref
             << art-title
             << art-number
             << preprint-info/art-number
             << crossref/cr_doi
             
        OUT: biblStruct
             >> analytic/title[@level="a"]
             >> analytic/idno[@type="..."]
    -->

    <!-- art-title -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/art-title">
        <title level="a" type="main">
            <xsl:value-of select="normalize-space(.)"/>
        </title>
    </xsl:template>
    
    <!-- misc-title -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/misc-title">
        <title level="a">
            <xsl:value-of select="normalize-space(.)"/>
        </title>
    </xsl:template> 
    
    <!-- art-number | preprint-info/art-number
         @type observé parmi jcap|jstat|jhep|arxiv (donc émis par la revue ou par un site externe)
         
         NB : peut se trouver directement dans *-ref ou bien (plus rare) sous preprint-info
    -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/art-number 
                       | *[ends-with(local-name(),'-ref')]/preprint-info/art-number">
        <idno>
            <xsl:attribute name="type" select="@type"/>
            <xsl:value-of select="."/>
        </idno>
    </xsl:template>

    <!-- misc-text/extdoi 
         NB: les autres misc-text sont traités en elts <note> après monogr -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/misc-text/extdoi">
        <idno type="DOI">
            <xsl:value-of select="."/>
        </idno>
    </xsl:template>
    
    <!-- crossref/cr_doi -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/crossref/cr_doi">
        <idno type="DOI">
            <xsl:value-of select="substring-after(.,'http://dx.doi.org/')"/>
        </idno>
        <idno type="URL">
            <xsl:value-of select="."/>
        </idno>
    </xsl:template>
    
    <!--TODO     links misc-text preprint-info-->
    

    <!-- SOUS-ELEMENTS BIBLIO (2/4: pour monogr) *********************
        
        IN: journal-ref | book-ref | conf-ref | misc-ref
        <<jnl-title
        <<book-title
        <<conf-title
        <<edition
        <<crossref/cr_issn
        <<year
        <<volume
        <<part
        <<chap
        <<issno
        <<pages
        <<source
        <<publication/publisher
        <<publication/place
        
        
        NB: <<conf-title et <<conf-place traités directement dans conf-ref
        
        OUT: biblStruct/monogr
        >> title[@level="j"]
        >> title[@level="m"]
        >> edition
        >> meeting
        >> imprint/date[@type="year"]
        >> imprint/biblScope[@unit="vol"]
        >> imprint/biblScope[@unit="part"]
        >> imprint/biblScope[@unit="chap"]
        >> imprint/biblScope[@unit="issue"]
        >> imprint/biblScope[@unit="pp"]
        >> imprint/publisher
        >> imprint/pubPlace
        
    -->
    
    <!-- jnl-title -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/jnl-title">
        <title level="j">
            <xsl:value-of select="."/>
        </title>
    </xsl:template>
    
    <!-- book-title -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/book-title">
        <title level="m">
            <xsl:value-of select="."/>
            <!-- tei:meeting sous-catégorise le lieu -->
            <xsl:apply-templates select="../conf-place"/>
        </title>
    </xsl:template>
    
    <!-- conf-title *dans les cas rares* d'un parent journal-ref ou misc-ref
         (pour les conf-ref on ne passe pas par ici)           -->
    <xsl:template match="journal-ref/conf-title">
        <meeting>
            <xsl:value-of select="."/>
        </meeting>
    </xsl:template>
    
    <!--edition
        ex: "4th edn" -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/edition">
        <edition>
            <xsl:value-of select="."/>
        </edition>
    </xsl:template>

    <!--patent-number
        ex: "US Patent US 2003/0116528 A1" -->
    <xsl:template match="misc-ref/patent-number">
        <idno type="docNumber">
            <xsl:value-of select="."/>
        </idno>
    </xsl:template>

    <!-- crossref/cr_issn -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/crossref/cr_issn">
        <idno>
            <xsl:attribute name="type">
                <xsl:choose>
                    <xsl:when test="@type='electronic'">eISSN</xsl:when>
                    <xsl:otherwise>pISSN</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:variable name="issnReconstruct">
                <xsl:value-of select="."/>
            </xsl:variable>
            <xsl:value-of select="substring($issnReconstruct,-3,string-length($issnReconstruct))"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="substring($issnReconstruct,5,string-length($issnReconstruct))"/>
        </idno>
    </xsl:template>
    
    <!-- misc-text/~ISBN-like~
        NB: les autres misc-text sont traités en elts <note> après monogr -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/misc-text[matches(normalize-space(.), '^ISBN(-1[03])?\s?:?\s[-0-9xX ]{10,17}$')]">
        <idno type="ISBN">
            <xsl:value-of select="."/>
        </idno>
    </xsl:template>
    
    <!--   - - - - 
        >> IMPRINT 
           - - - -    -->
    
    <!-- year
         TODO: attribut ISO @when
    -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/year">
        <xsl:variable name="nettoieDate">
            <xsl:value-of select="normalize-space(translate(.,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',''))"/>
        </xsl:variable>
        <date when="{$nettoieDate}">
            <xsl:value-of select="$nettoieDate"/>
        </date>
    </xsl:template>
    
    
    <!-- volume -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/volume">
        <biblScope unit="vol">
            <xsl:value-of select="."/>
        </biblScope>
    </xsl:template>
    
    <!-- part   -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/part">
        <biblScope unit="part">
            <xsl:value-of select="."/>
        </biblScope>
    </xsl:template>
    
    <!-- chap   -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/chap">
        <biblScope unit="chap">
            <xsl:value-of select="."/>
        </biblScope>
    </xsl:template>
    
    <!-- issno  -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/issue">
        <biblScope unit="issue">
            <xsl:value-of select="."/>
        </biblScope>
    </xsl:template>
    
    <!-- pages  -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/pages">
        <biblScope unit="pages">
            <xsl:value-of select="."/>
        </biblScope>
    </xsl:template>

    <!-- source 
        ex: l'université pour les thèses de doctorat 
            (se rencontre surtout dans les misc-ref)
        TODO : voir si tei:authority convient mieux que tei:publisher
    -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/source">
        <publisher>
            <xsl:value-of select="."/>
        </publisher>
    </xsl:template>
    
    <!-- publication/publisher -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/publication/publisher">
        <publisher>
            <xsl:value-of select="."/>
        </publisher>
    </xsl:template>
    
    <!-- publication/place -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/publication/place">
        <pubPlace>
            <xsl:value-of select="."/>
        </pubPlace>
    </xsl:template>
    

    
    
    <!-- SOUS-ELEMENTS BIBLIO (3/4: pour author+ et editor+) *****************
             +++++++++++++++++
        Déjà traités plus haut dans /article/header pour /TEI/header/sourceDesc
             +++++++++++++++++
        
    -->
    
    <!-- SOUS-ELEMENTS BIBLIO (4/4: ni analy. ni monogr.) ********************
       
    -->

    <!-- series | series/volume -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/series">
        <series>
            <title type="main" level="s">
                <xsl:value-of select="text()"/>
            </title>
            <xsl:if test="volume">
                <biblScope unit="vol">
                    <xsl:value-of select="volume"/>
                </biblScope>
            </xsl:if>
        </series>
    </xsl:template>
    
    <!-- misc-text
        
        NB: malheureusement très varié ! 

        Pourra devenir en TEI l'un des éléments suivants :
           - idno[@type="DOI|ISBN"]   => traités à part (ci-dessus, resp. dans analytic et dans monogr)
           - note                     => traités ici
           - ref[@type="url"]         => traités ici
        
        ex: <misc-text>in preparation</misc-text>
        ex: <misc-text>at press, <extdoi doi="10.1007/s11082-009-9349-3" base="http://dx.doi.org/">doi:10.1007/s11082-009-9349-3</extdoi></misc-text>
        ex: <misc-text>ISBN 0-9586039-2-8</misc-text>
        ex: <misc-text><italic>ICTP Internal Report</italic> IC/95/216</misc-text>
        ex: <misc-text>arXiv:<arxiv url="cond-mat/0408518v1">cond-mat/0408518v1</arxiv></misc-text>
        ex: <misc-text>On the fluctuating flow characteristics in the vicinity of gate slots <italic>PhD Thesis</italic> Division of Hydraulic Engineering, University of Trondheim, Norwegian Institute of Technology</misc-text>
        ex: <misc-text>(Book of abstracts 3)</misc-text>
        ex: <misc-text>OptoDesigner by PhoeniX Software <webref url="http://www.phoenixbv.com/">http://www.phoenixbv.com/</webref>
    -->
    <xsl:template name="autres_misc-text"
                  match="*[ends-with(local-name(),'-ref')]/misc-text[not(extdoi) 
                                                                 and not(matches(normalize-space(.), '^ISBN(-1[03])?\s?:?\s[-0-9xX ]{10,17}$'))]">
        <note place="inline">
            <xsl:value-of select="text()"/>
            <xsl:apply-templates select="webref | arxiv"/>
        </note>
    </xsl:template>
    
    <!-- liens inclus dans une note -->
    <xsl:template match="misc-text/webref | misc-text/arxiv | links/arxiv">
        <ref type="url">
            <xsl:if test="@url">
                <xsl:attribute name="target" select="@url"/>
            </xsl:if>
            <xsl:value-of select="."/>
        </ref>
    </xsl:template>
    
    <!-- preprint >> note
         NB: preprint-info/art-number déjà traité dans les templates pour analytic!
    -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/preprint-info/preprint
                       | *[ends-with(local-name(),'-ref')]/preprint">
        <note place="inline">
            <xsl:value-of select="."/>
        </note>
    </xsl:template>
    
    <!-- thesis >> note
         sert aussi comme test pour l'attribut ../biblStruct[@type]
    -->
    <xsl:template match="misc-ref/thesis | book-ref/thesis">
        <note place="inline">
            <xsl:value-of select="."/>
        </note>
    </xsl:template>
    
    <!-- links[not(arxiv)] >> | note
        ex: <links><spires jnl="GRGVA" vol="33" page="1381">SPIRES</spires></links>
        ex: <aps jnl="PRL" vol="93" page="080601" start="volume" end="pages"/>
        
        TODO actuellement cette template n'est pas référencée
    -->
    <xsl:template match="*[ends-with(local-name(),'-ref')]/links[not(arxiv)]">
        <note place="inline">
            <xsl:for-each select="//@*">
                <xsl:value-of select="concat( ., ' ')"/>
            </xsl:for-each>
            <xsl:value-of select="."/>
         </note>
    </xsl:template>

    <!-- FIN REFERENCES *********************** -->



    <!-- FOOTNOTES ***********************
        IN: /article/back/footnotes  <<
        
        OUT: /TEI/text/back/
        >> note[@place="foot"]
        
        TODO templates pour les styles de présentation à l'intérieur
             (p, bold, etc.) au lieu de value-of et normalize-space()
    -->
    
    <!-- footnotes -->
    <xsl:template match="article/back/footnotes">
        <div type="footnotes">
            <xsl:apply-templates select='footnote'/>
        </div>
    </xsl:template>
    
    <!-- acknowledgment -->
    <xsl:template match="acknowledgment">
        <div type="acknowledgment">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- FIN FOOTNOTES *********************** -->
   
</xsl:stylesheet>
