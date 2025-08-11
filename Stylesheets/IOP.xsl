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
        <xsl:value-of select="//header/ident/doi"/>
    </xsl:variable>
    <xsl:variable name="codeTitreFre">
        <xsl:choose>
            <xsl:when test="normalize-space($codeTitre)='10.1088/0022-3727/30/2/012'">Analyse des fondements de la conduction électronique dans les états localisés, en fonction de la fréquence: II. Analyse des hypothèses fondamentales des théories existantes</xsl:when>
            <xsl:when test="normalize-space($codeTitre)='10.1088/0951-7715/21/6/013'">Expériences sur certaines transformations birationnelles quadratiques</xsl:when>
            <xsl:when test="normalize-space($codeTitre)='10.1088/0954-3899/27/10/301'">Expériences de détection directe de la matière sombre non baryonique</xsl:when>
            <xsl:when test="normalize-space($codeTitre)='10.1088/0022-3727/30/2/011'">Analyse des fondements de la conduction électronique dans les états localisés, en fonction de la fréquence: I. Analyse des méthodes de calcul dans les théories existantes</xsl:when>
            <xsl:when test="normalize-space($codeTitre)='10.1088/0026-1394/7/3/001'">Variation de la masse volumique de l'eau en fonction de sa composition isotopique</xsl:when>
            <xsl:when test="normalize-space($codeTitre)='10.1088/0031-9155/41/5/003'">Caractérisation de la réponse des collimateurs à trous parallèles hexagonaux des caméras à scintillation</xsl:when>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="codeTitreEng">
        <xsl:choose>
            <xsl:when test="normalize-space($codeTitre)='10.1088/0022-3727/30/2/012'">Analysis of the foundations of the frequency-dependent electronic conductivity in localized states: II. Analysis of the fundamental hypotheses of the existing theories</xsl:when>
            <xsl:when test="normalize-space($codeTitre)='10.1088/0951-7715/21/6/013'">Experiments on some birational quadratic transformations</xsl:when>
            <xsl:when test="normalize-space($codeTitre)='10.1088/0954-3899/27/10/301'">Direct searches for non-baryonic dark matter</xsl:when>
            <xsl:when test="normalize-space($codeTitre)='10.1088/0022-3727/30/2/011'">Analysis of the foundations of the frequency-dependent electronic conductivity in localized states: I. Analysis of the methods of calculation in the available theories</xsl:when>
            <xsl:when test="normalize-space($codeTitre)='10.1088/0026-1394/7/3/001'">Variation of the Water Density as a Function of its Isotopic Composition</xsl:when>
            <xsl:when test="normalize-space($codeTitre)='10.1088/0031-9155/41/5/003'">Characterization of the response of hexagonal parallel-hole collimators of scintillation cameras</xsl:when>
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
                                <language ident="{//header/title-group/title/@lang}">
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
        <abstract>
            <xsl:apply-templates select="abstract/heading"/>
            <xsl:apply-templates select="abstract/p"/>
        </abstract>
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
        <textClass ana="classification">
            <xsl:apply-templates select="subject-areas"/>
            <xsl:apply-templates select="class-codes"/>
        </textClass>
        <textClass ana="keywords">
            <xsl:apply-templates select="keywords"/>
        </textClass>
    </xsl:template>

    <!-- class-codes ==> classCodes
       La tei a un niveau d'imbrication de moins => on plonge direct
       (mais on reviendra chercher l'attribut scheme ici) 
       
       Ex: <class-codes scheme="pacs"> 
              (<code>)+ 
           </class-codes>
    -->
    <xsl:template match="classifications/class-codes">
        <xsl:apply-templates/>
    </xsl:template>


    <!--  IN: celui au-dessus  <<
         OUT: profileDesc/textClass
              >> classCode +
         Ex:  "52.35.Ra"
    -->
    <xsl:template match="classifications/class-codes/code">
        <xsl:variable name="codePacs">
            <xsl:value-of select="."/>
        </xsl:variable>
        <classCode>
            <xsl:attribute name="scheme" select="../@scheme"/>
            <xsl:value-of select="."/>
        </classCode>
        <keywords>
            <xsl:attribute name="scheme" select="../@scheme"/>
            <xsl:attribute name="n" select="."/>
            <term>
            <xsl:choose>
                            <xsl:when test="contains($codePacs,'01.10.-m')">Announcements, news, and organizational activities</xsl:when>
                            <xsl:when test="contains($codePacs,'01.10.Cr')">Announcements, news, and awards</xsl:when>
                            <xsl:when test="contains($codePacs,'01.10.Fv')">Conferences, lectures, and institutes</xsl:when>
                            <xsl:when test="contains($codePacs,'01.10.Hx')">Physics organizational activities</xsl:when>
                            <xsl:when test="contains($codePacs,'01.30.-y')">Physics literature and publications</xsl:when>
                            <xsl:when test="contains($codePacs,'01.30.Bb')">Publications of lectures (advanced institutes, summer schools, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'01.30.Cc')">Conference proceedings</xsl:when>
                            <xsl:when test="contains($codePacs,'01.30.Ee')">Monographs and collections</xsl:when>
                            <xsl:when test="contains($codePacs,'01.30.Kj')">Handbooks, dictionaries, tables, and data compilations</xsl:when>
                            <xsl:when test="contains($codePacs,'01.30.M-')">Textbooks</xsl:when>
                            <xsl:when test="contains($codePacs,'01.30.Mm')">Textbooks for graduates and researchers</xsl:when>
                            <xsl:when test="contains($codePacs,'01.30.Os')">Books of general interest to physics teachers</xsl:when>
                            <xsl:when test="contains($codePacs,'01.30.Rr')">Surveys and tutorial papers; resource letters</xsl:when>
                            <xsl:when test="contains($codePacs,'01.30.Tt')">Bibliographies</xsl:when>
                            <xsl:when test="contains($codePacs,'01.30.Vv')">Book reviews</xsl:when>
                            <xsl:when test="contains($codePacs,'01.30.Ww')">Editorials</xsl:when>
                            <xsl:when test="contains($codePacs,'01.30.mm')">Textbooks for graduates and researchers</xsl:when>
                            <xsl:when test="contains($codePacs,'01.40.-d')">Education</xsl:when>
                            <xsl:when test="contains($codePacs,'01.40.Di')">Course design and evaluation</xsl:when>
                            <xsl:when test="contains($codePacs,'01.40.E-')">Science in school</xsl:when>
                            <xsl:when test="contains($codePacs,'01.40.Ha')">Learning theory and science teaching</xsl:when>
                            <xsl:when test="contains($codePacs,'01.40.gb')">Teaching methods and strategies</xsl:when>
                            <xsl:when test="contains($codePacs,'01.40.gf')">Theory of testing and techniques</xsl:when>
                            <xsl:when test="contains($codePacs,'01.50.-i')">Educational aids</xsl:when>
                            <xsl:when test="contains($codePacs,'01.50.Fr')">Audio and visual aids, films</xsl:when>
                            <xsl:when test="contains($codePacs,'01.50.H-')">Computers in education</xsl:when>
                            <xsl:when test="contains($codePacs,'01.50.My')">Demonstration experiments and apparatus</xsl:when>
                            <xsl:when test="contains($codePacs,'01.50.Pa')">Laboratory experiments and apparatus</xsl:when>
                            <xsl:when test="contains($codePacs,'01.50.Qb')">Laboratory course design, organization, and evaluation</xsl:when>
                            <xsl:when test="contains($codePacs,'01.50.ht')">Instructional computer use</xsl:when>
                            <xsl:when test="contains($codePacs,'01.52.+r')">National and international laboratory facilities</xsl:when>
                            <xsl:when test="contains($codePacs,'01.55.+b')">General physics</xsl:when>
                            <xsl:when test="contains($codePacs,'01.60.+q')">Biographies, tributes, personal notes, and obituaries</xsl:when>
                            <xsl:when test="contains($codePacs,'01.65.+g')">History of science</xsl:when>
                            <xsl:when test="contains($codePacs,'01.70.+w')">Philosophy of science</xsl:when>
                            <xsl:when test="contains($codePacs,'01.75.+m')">Science and society</xsl:when>
                            <xsl:when test="contains($codePacs,'01.78.+p')">Science and government (funding, politics, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'01.90.+g')">Other topics of general interest</xsl:when>
                            <xsl:when test="contains($codePacs,'02.00.00')">Mathematical methods in physics</xsl:when>
                            <xsl:when test="contains($codePacs,'02.10.-v')">Logic, set theory, and algebra</xsl:when>
                            <xsl:when test="contains($codePacs,'02.10.Ox')">Combinatorics; graph theory</xsl:when>
                            <xsl:when test="contains($codePacs,'02.10.Ud')">Linear algebra</xsl:when>
                            <xsl:when test="contains($codePacs,'02.10.Yn')">Matrix theory</xsl:when>
                            <xsl:when test="contains($codePacs,'02.20.-a')">Group theory</xsl:when>
                            <xsl:when test="contains($codePacs,'02.20.Qs')">General properties, structure, and representation of Lie groups</xsl:when>
                            <xsl:when test="contains($codePacs,'02.20.Sv')">Lie algebras of Lie groups</xsl:when>
                            <xsl:when test="contains($codePacs,'02.20.Uw')">Quantum groups</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.-f')">Function theory, analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.Em')">Potential theory</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.Gp')">Special functions</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.Hq')">Ordinary differential equations</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.Ik')">Integrable systems</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.Jr')">Partial differential equations</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.Mv')">Approximations and expansions</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.Nw')">Fourier analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.Px')">Abstract harmonic analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.Rz')">Integral equations</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.Tb')">Operator theory</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.Uu')">Integral transforms</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.Yy')">Control theory</xsl:when>
                            <xsl:when test="contains($codePacs,'02.30.Zz')">Inverse problems</xsl:when>
                            <xsl:when test="contains($codePacs,'02.40.-k')">Geometry, differential geometry, and topology</xsl:when>
                            <xsl:when test="contains($codePacs,'02.40.Dr')">Euclidean and projective geometries</xsl:when>
                            <xsl:when test="contains($codePacs,'02.40.Hw')">Classical differential geometry</xsl:when>
                            <xsl:when test="contains($codePacs,'02.40.Ky')">Riemannian geometries</xsl:when>
                            <xsl:when test="contains($codePacs,'02.40.Pc')">General topology</xsl:when>
                            <xsl:when test="contains($codePacs,'02.40.Re')">Algebraic topology</xsl:when>
                            <xsl:when test="contains($codePacs,'02.40.Sf')">Manifolds and cell complexes</xsl:when>
                            <xsl:when test="contains($codePacs,'02.40.Vh')">Global analysis and analysis on manifolds</xsl:when>
                            <xsl:when test="contains($codePacs,'02.40.Xx')">Singularity theory</xsl:when>
                            <xsl:when test="contains($codePacs,'02.50.-r')">Probability theory, stochastic processes, and statistics</xsl:when>
                            <xsl:when test="contains($codePacs,'02.50.Cw')">Probability theory</xsl:when>
                            <xsl:when test="contains($codePacs,'02.50.Ey')">Stochastic processes</xsl:when>
                            <xsl:when test="contains($codePacs,'02.50.Fz')">Stochastic analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'02.50.Ga')">Markov processes</xsl:when>
                            <xsl:when test="contains($codePacs,'02.50.Ng')">Distribution theory and Monte Carlo studies</xsl:when>
                            <xsl:when test="contains($codePacs,'02.60.-x')">Numerical approximation and analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'02.60.Cb')">Numerical simulation; solution of equations</xsl:when>
                            <xsl:when test="contains($codePacs,'02.60.Ed')">Interpolation; curve fitting</xsl:when>
                            <xsl:when test="contains($codePacs,'02.70.-c')">Computational techniques; simulations</xsl:when>
                            <xsl:when test="contains($codePacs,'02.70.Ns')">Molecular dynamics and particle methods</xsl:when>
                            <xsl:when test="contains($codePacs,'02.70.Rr')">General statistical methods</xsl:when>
                            <xsl:when test="contains($codePacs,'02.70.Ss')">Quantum Monte Carlo methods</xsl:when>
                            <xsl:when test="contains($codePacs,'02.70.Uu')">Applications of Monte Carlo methods</xsl:when>
                            <xsl:when test="contains($codePacs,'02.90.+p')">Other topics in mathematical methods in physics</xsl:when>
                            <xsl:when test="contains($codePacs,'03.00.00')">Quantum mechanics, field theories, and special relativity</xsl:when>
                            <xsl:when test="contains($codePacs,'03.30.+p')">Special relativity</xsl:when>
                            <xsl:when test="contains($codePacs,'03.50.-z')">Classical field theories</xsl:when>
                            <xsl:when test="contains($codePacs,'03.50.De')">Classical electromagnetism, Maxwell equations</xsl:when>
                            <xsl:when test="contains($codePacs,'03.50.Kk')">Other special classical field theories</xsl:when>
                            <xsl:when test="contains($codePacs,'03.65.-w')">Quantum mechanics</xsl:when>
                            <xsl:when test="contains($codePacs,'03.65.Ca')">Formalism</xsl:when>
                            <xsl:when test="contains($codePacs,'03.65.Db')">Functional analytical methods</xsl:when>
                            <xsl:when test="contains($codePacs,'03.65.Fd')">Algebraic methods</xsl:when>
                            <xsl:when test="contains($codePacs,'03.65.Ge')">Solutions of wave equations: bound states</xsl:when>
                            <xsl:when test="contains($codePacs,'03.65.Nk')">Scattering theory</xsl:when>
                            <xsl:when test="contains($codePacs,'03.65.Pm')">Relativistic wave equations</xsl:when>
                            <xsl:when test="contains($codePacs,'03.65.Sq')">Semiclassical theories and applications</xsl:when>
                            <xsl:when test="contains($codePacs,'03.65.Ta')">Foundations of quantum mechanics; measurement theory</xsl:when>
                            <xsl:when test="contains($codePacs,'03.65.Ud')">Entanglement and quantum nonlocality</xsl:when>
                            <xsl:when test="contains($codePacs,'03.65.Vf')">Phases: geometric; dynamic or topological</xsl:when>
                            <xsl:when test="contains($codePacs,'03.65.Xp')">Tunneling, traversal time, quantum Zeno dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'03.65.Yz')">Decoherence; open systems; quantum statistical methods</xsl:when>
                            <xsl:when test="contains($codePacs,'03.67.-a')">Quantum information</xsl:when>
                            <xsl:when test="contains($codePacs,'03.67.Bg')">Entanglement production and manipulation</xsl:when>
                            <xsl:when test="contains($codePacs,'03.67.Lx')">Quantum computation architectures and implementations</xsl:when>
                            <xsl:when test="contains($codePacs,'03.70.+k')">Theory of quantized fields</xsl:when>
                            <xsl:when test="contains($codePacs,'03.75.-b')">Matter waves</xsl:when>
                            <xsl:when test="contains($codePacs,'03.75.Be')">Atom and neutron optics</xsl:when>
                            <xsl:when test="contains($codePacs,'03.75.Dg')">Atom and neutron interferometry</xsl:when>
                            <xsl:when test="contains($codePacs,'03.75.Hh')">Static properties of condensates; thermodynamical, statistical, and structural properties</xsl:when>
                            <xsl:when test="contains($codePacs,'03.75.Kk')">Dynamic properties of condensates; collective and hydrodynamic excitations, superfluid flow</xsl:when>
                            <xsl:when test="contains($codePacs,'03.75.Lm')">Tunneling, Josephson effect, Bose-Einstein condensates in periodic potentials, solitons, vortices, and topological excitations</xsl:when>
                            <xsl:when test="contains($codePacs,'03.75.Nt')">Other Bose-Einstein condensation phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'03.75.Ss')">Degenerate Fermi gases</xsl:when>
                            <xsl:when test="contains($codePacs,'04.00.00')">General relativity and gravitation</xsl:when>
                            <xsl:when test="contains($codePacs,'04.20.-q')">Classical general relativity</xsl:when>
                            <xsl:when test="contains($codePacs,'04.20.Cv')">Fundamental problems and general formalism</xsl:when>
                            <xsl:when test="contains($codePacs,'04.20.Dw')">Singularities and cosmic censorship</xsl:when>
                            <xsl:when test="contains($codePacs,'04.20.Fy')">Canonical formalism, Lagrangians, and variational principles</xsl:when>
                            <xsl:when test="contains($codePacs,'04.20.Gz')">Spacetime topology, causal structure, spinor structure</xsl:when>
                            <xsl:when test="contains($codePacs,'04.20.Jb')">Exact solutions</xsl:when>
                            <xsl:when test="contains($codePacs,'04.25.Nx')">Post-Newtonian approximation; perturbation theory; related approximations</xsl:when>
                            <xsl:when test="contains($codePacs,'04.25.dg')">Numerical studies of black holes and black-hole binaries</xsl:when>
                            <xsl:when test="contains($codePacs,'04.30.-w')">Gravitational waves</xsl:when>
                            <xsl:when test="contains($codePacs,'04.30.Db')">Wave generation and sources</xsl:when>
                            <xsl:when test="contains($codePacs,'04.30.Nk')">Wave propagation and interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'04.30.Tv')">Gravitational-wave astrophysics</xsl:when>
                            <xsl:when test="contains($codePacs,'04.40.-b')">Self-gravitating systems; continuous media and classical fields in curved spacetime</xsl:when>
                            <xsl:when test="contains($codePacs,'04.40.Dg')">Relativistic stars: structure, stability, and oscillations</xsl:when>
                            <xsl:when test="contains($codePacs,'04.50.+h')">Gravity in more than four dimensions, Kaluza-Klein theory, unified field theories; alternative theories of gravity</xsl:when>
                            <xsl:when test="contains($codePacs,'04.50.-h')">Higher-dimensional gravity and other theories of gravity</xsl:when>
                            <xsl:when test="contains($codePacs,'04.50.Gh')">Higher-dimensional black holes, black strings, and related objects</xsl:when>
                            <xsl:when test="contains($codePacs,'04.50.Kd')">Modified theories of gravity</xsl:when>
                            <xsl:when test="contains($codePacs,'04.60.-m')">Quantum gravity</xsl:when>
                            <xsl:when test="contains($codePacs,'04.60.Bc')">Phenomenology of quantum gravity</xsl:when>
                            <xsl:when test="contains($codePacs,'04.60.Ds')">Canonical quantization</xsl:when>
                            <xsl:when test="contains($codePacs,'04.60.Gw')">Covariant and sum-over-histories quantization</xsl:when>
                            <xsl:when test="contains($codePacs,'04.62.+v')">Quantum fields in curved spacetime</xsl:when>
                            <xsl:when test="contains($codePacs,'04.65.+e')">Supergravity</xsl:when>
                            <xsl:when test="contains($codePacs,'04.70.-s')">Physics of black holes</xsl:when>
                            <xsl:when test="contains($codePacs,'04.70.Bw')">Classical black holes</xsl:when>
                            <xsl:when test="contains($codePacs,'04.70.Dy')">Quantum aspects of black holes, evaporation, thermodynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'04.80.-y')">Experimental studies of gravity</xsl:when>
                            <xsl:when test="contains($codePacs,'04.80.Cc')">Experimental tests of gravitational theories</xsl:when>
                            <xsl:when test="contains($codePacs,'04.80.Nn')">Gravitational wave detectors and experiments</xsl:when>
                            <xsl:when test="contains($codePacs,'05.00.00')">Statistical physics, thermodynamics, and nonlinear dynamical systems</xsl:when>
                            <xsl:when test="contains($codePacs,'05.10.Cc')">Renormalization group methods</xsl:when>
                            <xsl:when test="contains($codePacs,'05.10.Gg')">Stochastic analysis methods (Fokker-Planck, Langevin, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'05.10.Ln')">Monte Carlo methods</xsl:when>
                            <xsl:when test="contains($codePacs,'05.20.-y')">Classical statistical mechanics</xsl:when>
                            <xsl:when test="contains($codePacs,'05.20.Dd')">Kinetic theory</xsl:when>
                            <xsl:when test="contains($codePacs,'05.20.Gg')">Classical ensemble theory</xsl:when>
                            <xsl:when test="contains($codePacs,'05.20.Jj')">Statistical mechanics of classical fluids</xsl:when>
                            <xsl:when test="contains($codePacs,'05.30.-d')">Quantum statistical mechanics</xsl:when>
                            <xsl:when test="contains($codePacs,'05.30.Ch')">Quantum ensemble theory</xsl:when>
                            <xsl:when test="contains($codePacs,'05.30.Fk')">Fermion systems and electron gas</xsl:when>
                            <xsl:when test="contains($codePacs,'05.30.Jp')">Boson systems</xsl:when>
                            <xsl:when test="contains($codePacs,'05.40.-a')">Fluctuation phenomena, random processes, noise, and Brownian motion</xsl:when>
                            <xsl:when test="contains($codePacs,'05.40.Ca')">Noise</xsl:when>
                            <xsl:when test="contains($codePacs,'05.40.Fb')">Random walks and Levy flights</xsl:when>
                            <xsl:when test="contains($codePacs,'05.40.Jc')">Brownian motion</xsl:when>
                            <xsl:when test="contains($codePacs,'05.45.-a')">Nonlinear dynamics and chaos</xsl:when>
                            <xsl:when test="contains($codePacs,'05.45.Ac')">Low-dimensional chaos</xsl:when>
                            <xsl:when test="contains($codePacs,'05.45.Df')">Fractals</xsl:when>
                            <xsl:when test="contains($codePacs,'05.45.Mt')">Quantum chaos; semiclassical methods</xsl:when>
                            <xsl:when test="contains($codePacs,'05.45.Ra')">Coupled map lattices</xsl:when>
                            <xsl:when test="contains($codePacs,'05.45.Tp')">Time series analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'05.45.Xt')">Synchronization; coupled oscillators</xsl:when>
                            <xsl:when test="contains($codePacs,'05.45.Yv')">Solitons</xsl:when>
                            <xsl:when test="contains($codePacs,'05.50.+q')">Lattice theory and statistics</xsl:when>
                            <xsl:when test="contains($codePacs,'05.60.-k')">Transport processes</xsl:when>
                            <xsl:when test="contains($codePacs,'05.60.Gg')">Quantum transport</xsl:when>
                            <xsl:when test="contains($codePacs,'05.65.+b')">Self-organized systems</xsl:when>
                            <xsl:when test="contains($codePacs,'05.70.-a')">Thermodynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'05.70.Ce')">Thermodynamic functions and equations of state</xsl:when>
                            <xsl:when test="contains($codePacs,'05.70.Fh')">Phase transitions: general studies</xsl:when>
                            <xsl:when test="contains($codePacs,'05.70.Ln')">Nonequilibrium and irreversible thermodynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'05.70.Np')">Interface and surface thermodynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'05.90.+m')">Other topics in statistical physics, thermodynamics, and nonlinear dynamical systems</xsl:when>
                            <xsl:when test="contains($codePacs,'06.00.00')">Metrology, measurements, and laboratory procedures</xsl:when>
                            <xsl:when test="contains($codePacs,'06.20.-f')">Metrology</xsl:when>
                            <xsl:when test="contains($codePacs,'06.20.Dk')">Measurement and error theory</xsl:when>
                            <xsl:when test="contains($codePacs,'06.20.Fn')">Units and standards</xsl:when>
                            <xsl:when test="contains($codePacs,'06.20.Jr')">Determination of fundamental constants</xsl:when>
                            <xsl:when test="contains($codePacs,'06.20.fb')">Standards and calibration</xsl:when>
                            <xsl:when test="contains($codePacs,'06.30.-k')">Measurements common to several branches of physics and astronomy</xsl:when>
                            <xsl:when test="contains($codePacs,'06.30.Bp')">Spatial dimensions (e.g., position, lengths, volume, angles, and displacements)</xsl:when>
                            <xsl:when test="contains($codePacs,'06.30.Dr')">Mass and density</xsl:when>
                            <xsl:when test="contains($codePacs,'06.30.Ft')">Time and frequency</xsl:when>
                            <xsl:when test="contains($codePacs,'06.60.Jn')">High-speed techniques (microsecond to femtosecond)</xsl:when>
                            <xsl:when test="contains($codePacs,'07.00.00')">Instruments, apparatus, and components common to several branches of physics and astronomy</xsl:when>
                            <xsl:when test="contains($codePacs,'07.05.-t')">Computers in experimental physics</xsl:when>
                            <xsl:when test="contains($codePacs,'07.05.Bx')">Computer systems: hardware, operating systems, computer languages, and utilities</xsl:when>
                            <xsl:when test="contains($codePacs,'07.05.Fb')">Design of experiments</xsl:when>
                            <xsl:when test="contains($codePacs,'07.05.Hd')">Data acquisition: hardware and software</xsl:when>
                            <xsl:when test="contains($codePacs,'07.05.Kf')">Data analysis: algorithms and implementation; data management</xsl:when>
                            <xsl:when test="contains($codePacs,'07.05.Mh')">Neural networks, fuzzy logic, artificial intelligence</xsl:when>
                            <xsl:when test="contains($codePacs,'07.05.Tp')">Computer modeling and simulation</xsl:when>
                            <xsl:when test="contains($codePacs,'07.05.Wr')">Computer interfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'07.07.-a')">General equipment</xsl:when>
                            <xsl:when test="contains($codePacs,'07.07.Df')">Sensors (chemical, optical, electrical, movement, gas, etc.); remote sensing</xsl:when>
                            <xsl:when test="contains($codePacs,'07.07.Hj')">Display and recording equipment, oscilloscopes, TV cameras, etc.</xsl:when>
                            <xsl:when test="contains($codePacs,'07.07.Mp')">Transducers</xsl:when>
                            <xsl:when test="contains($codePacs,'07.10.-h')">Mechanical instruments and equipment</xsl:when>
                            <xsl:when test="contains($codePacs,'07.10.Pz')">Instruments for strain, force, and torque</xsl:when>
                            <xsl:when test="contains($codePacs,'07.20.-n')">Thermal instruments and apparatus</xsl:when>
                            <xsl:when test="contains($codePacs,'07.20.Dt')">Thermometers</xsl:when>
                            <xsl:when test="contains($codePacs,'07.20.Hy')">Furnaces; heaters</xsl:when>
                            <xsl:when test="contains($codePacs,'07.20.Ka')">High-temperature instrumentation; pyrometers</xsl:when>
                            <xsl:when test="contains($codePacs,'07.20.Mc')">Cryogenics; refrigerators, low-temperature detectors, and other low-temperature equipment</xsl:when>
                            <xsl:when test="contains($codePacs,'07.20.Pe')">Heat engines; heat pumps; heat pipes</xsl:when>
                            <xsl:when test="contains($codePacs,'07.30.-t')">Vacuum apparatus</xsl:when>
                            <xsl:when test="contains($codePacs,'07.30.Cy')">Vacuum pumps</xsl:when>
                            <xsl:when test="contains($codePacs,'07.35.+k')">High-pressure apparatus; shock tubes; diamond anvil cells</xsl:when>
                            <xsl:when test="contains($codePacs,'07.50.-e')">Electrical and electronic instruments and components</xsl:when>
                            <xsl:when test="contains($codePacs,'07.50.Ek')">Circuits and circuit components</xsl:when>
                            <xsl:when test="contains($codePacs,'07.55.-w')">Magnetic instruments and components</xsl:when>
                            <xsl:when test="contains($codePacs,'07.55.Db')">Generation of magnetic fields; magnets</xsl:when>
                            <xsl:when test="contains($codePacs,'07.55.Ge')">Magnetometers for magnetic field measurements</xsl:when>
                            <xsl:when test="contains($codePacs,'07.57.-c')">Infrared, submillimeter wave, microwave and radiowave instruments and equipment</xsl:when>
                            <xsl:when test="contains($codePacs,'07.57.Kp')">Bolometers; infrared, submillimeter wave, microwave, and radiowave receivers and detectors</xsl:when>
                            <xsl:when test="contains($codePacs,'07.57.Pt')">Submillimeter wave, microwave and radiowave spectrometers; magnetic resonance spectrometers, auxiliary equipment, and techniques</xsl:when>
                            <xsl:when test="contains($codePacs,'07.57.Ty')">Infrared spectrometers, auxiliary equipment, and techniques</xsl:when>
                            <xsl:when test="contains($codePacs,'07.60.-j')">Optical instruments and equipment</xsl:when>
                            <xsl:when test="contains($codePacs,'07.60.Dq')">Photometers, radiometers, and colorimeters</xsl:when>
                            <xsl:when test="contains($codePacs,'07.60.Hv')">Refractometers and reflectometers</xsl:when>
                            <xsl:when test="contains($codePacs,'07.60.Ly')">Interferometers</xsl:when>
                            <xsl:when test="contains($codePacs,'07.60.Pb')">Conventional optical microscopes</xsl:when>
                            <xsl:when test="contains($codePacs,'07.60.Rd')">Visible and ultraviolet spectrometers</xsl:when>
                            <xsl:when test="contains($codePacs,'07.60.Vg')">Fiber-optic instruments</xsl:when>
                            <xsl:when test="contains($codePacs,'07.68.+m')">Photography, photographic instruments; xerography</xsl:when>
                            <xsl:when test="contains($codePacs,'07.75.+h')">Mass spectrometers</xsl:when>
                            <xsl:when test="contains($codePacs,'07.77.-n')">Atomic, molecular, and charged-particle sources and detectors</xsl:when>
                            <xsl:when test="contains($codePacs,'07.77.Gx')">Atomic and molecular beam sources and detectors</xsl:when>
                            <xsl:when test="contains($codePacs,'07.77.Ka')">Charged-particle beam sources and detectors</xsl:when>
                            <xsl:when test="contains($codePacs,'07.78.+s')">Electron, positron, and ion microscopes; electron diffractometers</xsl:when>
                            <xsl:when test="contains($codePacs,'07.79.-v')">Scanning probe microscopes and components</xsl:when>
                            <xsl:when test="contains($codePacs,'07.79.Cz')">Scanning tunneling microscopes</xsl:when>
                            <xsl:when test="contains($codePacs,'07.79.Fc')">Near-field scanning optical microscopes</xsl:when>
                            <xsl:when test="contains($codePacs,'07.81.+a')">Electron and ion spectrometers</xsl:when>
                            <xsl:when test="contains($codePacs,'07.85.-m')">X- and γ-ray instruments</xsl:when>
                            <xsl:when test="contains($codePacs,'07.85.Fv')">X- and γ-ray sources, mirrors, gratings, and detectors</xsl:when>
                            <xsl:when test="contains($codePacs,'07.85.Nc')">X-ray and γ-ray spectrometers</xsl:when>
                            <xsl:when test="contains($codePacs,'07.85.Tt')">X-ray microscopes</xsl:when>
                            <xsl:when test="contains($codePacs,'07.87.+v')">Spaceborne and space research instruments, apparatus, and components</xsl:when>
                            <xsl:when test="contains($codePacs,'07.89.+b')">Environmental effects on instruments</xsl:when>
                            <xsl:when test="contains($codePacs,'07.90.+c')">Other topics in instruments, apparatus, and components common to several branches of physics and astronomy</xsl:when>
                            <xsl:when test="contains($codePacs,'11.00.00')">General theory of fields and particles</xsl:when>
                            <xsl:when test="contains($codePacs,'11.10.-z')">Field theory</xsl:when>
                            <xsl:when test="contains($codePacs,'11.10.Cd')">Axiomatic approach</xsl:when>
                            <xsl:when test="contains($codePacs,'11.10.Ef')">Lagrangian and Hamiltonian approach</xsl:when>
                            <xsl:when test="contains($codePacs,'11.10.Gh')">Renormalization</xsl:when>
                            <xsl:when test="contains($codePacs,'11.10.Hi')">Renormalization group evolution of parameters</xsl:when>
                            <xsl:when test="contains($codePacs,'11.10.Jj')">Asymptotic problems and properties</xsl:when>
                            <xsl:when test="contains($codePacs,'11.10.Kk')">Field theories in dimensions other than four</xsl:when>
                            <xsl:when test="contains($codePacs,'11.10.Lm')">Nonlinear or nonlocal theories and models</xsl:when>
                            <xsl:when test="contains($codePacs,'11.10.St')">Bound and unstable states; Bethe-Salpeter equations</xsl:when>
                            <xsl:when test="contains($codePacs,'11.10.Wx')">Finite-temperature field theory</xsl:when>
                            <xsl:when test="contains($codePacs,'11.15.-q')">Gauge field theories</xsl:when>
                            <xsl:when test="contains($codePacs,'11.15.Bt')">General properties of perturbation theory</xsl:when>
                            <xsl:when test="contains($codePacs,'11.15.Ex')">Spontaneous breaking of gauge symmetries</xsl:when>
                            <xsl:when test="contains($codePacs,'11.15.Ha')">Lattice gauge theory</xsl:when>
                            <xsl:when test="contains($codePacs,'11.15.Kc')">Classical and semiclassical techniques</xsl:when>
                            <xsl:when test="contains($codePacs,'11.15.Pg')">Expansions for large numbers of components (e.g., 1/Nc expansions)</xsl:when>
                            <xsl:when test="contains($codePacs,'11.15.Yc')">Chern-Simons gauge theory</xsl:when>
                            <xsl:when test="contains($codePacs,'11.25.-w')">Strings and branes</xsl:when>
                            <xsl:when test="contains($codePacs,'11.25.Db')">Properties of perturbation theory</xsl:when>
                            <xsl:when test="contains($codePacs,'11.25.Hf')">Conformal field theory, algebraic structures</xsl:when>
                            <xsl:when test="contains($codePacs,'11.25.Mj')">Compactification and four-dimensional models</xsl:when>
                            <xsl:when test="contains($codePacs,'11.25.Wx')">String and brane phenomenology</xsl:when>
                            <xsl:when test="contains($codePacs,'11.27.+d')">Extended classical solutions; cosmic strings, domain walls, texture</xsl:when>
                            <xsl:when test="contains($codePacs,'11.30.-j')">Symmetry and conservation laws</xsl:when>
                            <xsl:when test="contains($codePacs,'11.30.Cp')">Lorentz and Poincaré invariance</xsl:when>
                            <xsl:when test="contains($codePacs,'11.30.Er')">Charge conjugation, parity, time reversal, and other discrete symmetries</xsl:when>
                            <xsl:when test="contains($codePacs,'11.30.Fs')">Global symmetries (e.g., baryon number, lepton number)</xsl:when>
                            <xsl:when test="contains($codePacs,'11.30.Ly')">Other internal and higher symmetries</xsl:when>
                            <xsl:when test="contains($codePacs,'11.30.Na')">Nonlinear and dynamical symmetries (spectrum-generating symmetries)</xsl:when>
                            <xsl:when test="contains($codePacs,'11.30.Pb')">Supersymmetry</xsl:when>
                            <xsl:when test="contains($codePacs,'11.30.Qc')">Spontaneous and radiative symmetry breaking</xsl:when>
                            <xsl:when test="contains($codePacs,'11.30.Rd')">Chiral symmetries</xsl:when>
                            <xsl:when test="contains($codePacs,'11.40.Ex')">Formal properties of current algebras</xsl:when>
                            <xsl:when test="contains($codePacs,'11.40.Ha')">Partially conserved axial-vector currents</xsl:when>
                            <xsl:when test="contains($codePacs,'11.55.-m')">S-matrix theory; analytic structure of amplitudes</xsl:when>
                            <xsl:when test="contains($codePacs,'11.55.Bq')">Analytic properties of S matrix</xsl:when>
                            <xsl:when test="contains($codePacs,'11.55.Fv')">Dispersion relations</xsl:when>
                            <xsl:when test="contains($codePacs,'11.55.Hx')">Sum rules</xsl:when>
                            <xsl:when test="contains($codePacs,'11.55.Jy')">Regge formalism</xsl:when>
                            <xsl:when test="contains($codePacs,'11.80.-m')">Relativistic scattering theory</xsl:when>
                            <xsl:when test="contains($codePacs,'11.80.Cr')">Kinematical properties (helicity and invariant amplitudes, kinematic singularities, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'11.80.Et')">Partial-wave analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'11.80.Jy')">Many-body scattering and Faddeev equation</xsl:when>
                            <xsl:when test="contains($codePacs,'11.90.+t')">Other topics in general theory of fields and particles</xsl:when>
                            <xsl:when test="contains($codePacs,'12.00.00')">Specific theories and interaction models; particle systematics</xsl:when>
                            <xsl:when test="contains($codePacs,'12.10.-g')">Unified field theories and models</xsl:when>
                            <xsl:when test="contains($codePacs,'12.10.Dm')">Unified theories and models of strong and electroweak interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'12.10.Kt')">Unification of couplings; mass relations</xsl:when>
                            <xsl:when test="contains($codePacs,'12.15.-y')">Electroweak interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'12.15.Ff')">Quark and lepton masses and mixing</xsl:when>
                            <xsl:when test="contains($codePacs,'12.15.Lk')">Electroweak radiative corrections</xsl:when>
                            <xsl:when test="contains($codePacs,'12.15.Mm')">Neutral currents</xsl:when>
                            <xsl:when test="contains($codePacs,'12.20.-m')">Quantum electrodynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'12.20.Ds')">Specific calculations</xsl:when>
                            <xsl:when test="contains($codePacs,'12.20.Fv')">Experimental tests</xsl:when>
                            <xsl:when test="contains($codePacs,'12.38.-t')">Quantum chromodynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'12.38.Aw')">General properties of QCD (dynamics, confinement, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'12.38.Bx')">Perturbative calculations</xsl:when>
                            <xsl:when test="contains($codePacs,'12.38.Gc')">Lattice QCD calculations</xsl:when>
                            <xsl:when test="contains($codePacs,'12.38.Mh')">Quark-gluon plasma</xsl:when>
                            <xsl:when test="contains($codePacs,'12.38.Qk')">Experimental tests</xsl:when>
                            <xsl:when test="contains($codePacs,'12.39.-x')">Phenomenological quark models</xsl:when>
                            <xsl:when test="contains($codePacs,'12.39.Ba')">Bag model</xsl:when>
                            <xsl:when test="contains($codePacs,'12.39.Dc')">Skyrmions</xsl:when>
                            <xsl:when test="contains($codePacs,'12.39.Fe')">Chiral Lagrangians</xsl:when>
                            <xsl:when test="contains($codePacs,'12.39.Jh')">Nonrelativistic quark model</xsl:when>
                            <xsl:when test="contains($codePacs,'12.39.Mk')">Glueball and nonstandard multi-quark/gluon states</xsl:when>
                            <xsl:when test="contains($codePacs,'12.39.Pn')">Potential models</xsl:when>
                            <xsl:when test="contains($codePacs,'12.40.-y')">Other models for strong interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'12.40.Ee')">Statistical models</xsl:when>
                            <xsl:when test="contains($codePacs,'12.40.Nn')">Regge theory, duality, absorptive/optical models</xsl:when>
                            <xsl:when test="contains($codePacs,'12.40.Yx')">Hadron mass models and calculations</xsl:when>
                            <xsl:when test="contains($codePacs,'12.60.-i')">Models beyond the standard model</xsl:when>
                            <xsl:when test="contains($codePacs,'12.90.+b')">Miscellaneous theoretical ideas and models</xsl:when>
                            <xsl:when test="contains($codePacs,'13.00.00')">Specific reactions and phenomenology</xsl:when>
                            <xsl:when test="contains($codePacs,'13.15.+g')">Neutrino interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'13.20.-v')">Leptonic, semileptonic, and radiative decays of mesons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.20.Cz')">Decays of π mesons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.20.Eb')">Decays of K mesons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.20.Gd')">Decays of J/ψ, Υ, and other quarkonia</xsl:when>
                            <xsl:when test="contains($codePacs,'13.20.He')">Decays of bottom mesons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.20.Jf')">Decays of other mesons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.25.Cq')">Decays of π mesons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.25.Es')">Decays of K mesons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.25.Ft')">Decays of charmed mesons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.25.Gv')">Decays of J/ψ, Υ, and other quarkonia</xsl:when>
                            <xsl:when test="contains($codePacs,'13.25.Hw')">Decays of bottom mesons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.25.Jx')">Decays of other mesons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.30.-a')">Decays of baryons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.30.Ce')">Leptonic, semileptonic, and radiative decays</xsl:when>
                            <xsl:when test="contains($codePacs,'13.30.Eg')">Hadronic decays</xsl:when>
                            <xsl:when test="contains($codePacs,'13.35.-r')">Decays of leptons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.35.Bv')">Decays of muons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.40.-f')">Electromagnetic processes and properties</xsl:when>
                            <xsl:when test="contains($codePacs,'13.40.Em')">Electric and magnetic moments</xsl:when>
                            <xsl:when test="contains($codePacs,'13.40.Gp')">Electromagnetic form factors</xsl:when>
                            <xsl:when test="contains($codePacs,'13.40.Hq')">Electromagnetic decays</xsl:when>
                            <xsl:when test="contains($codePacs,'13.40.Ks')">Electromagnetic corrections to strong- and weak-interaction processes</xsl:when>
                            <xsl:when test="contains($codePacs,'13.60.-r')">Photon and charged-lepton interactions with hadrons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.60.Fz')">Elastic and Compton scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'13.60.Hb')">Total and inclusive cross sections (including deep-inelastic processes)</xsl:when>
                            <xsl:when test="contains($codePacs,'13.60.Le')">Meson production</xsl:when>
                            <xsl:when test="contains($codePacs,'13.60.Rj')">Baryon production</xsl:when>
                            <xsl:when test="contains($codePacs,'13.66.-a')">Lepton-lepton interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'13.66.Bc')">Hadron production in e−e+ interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'13.66.De')">Lepton production in e−e+ interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'13.66.Jn')">Precision measurements in e−e+ interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'13.75.-n')">Hadron-induced low- and intermediate-energy reactions and scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'13.75.Cs')">Nucleon-nucleon interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'13.75.Ev')">Hyperon-nucleon interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'13.75.Gx')">Pion-baryon interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'13.75.Jz')">Kaon-baryon interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'13.75.Lb')">Meson-meson interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'13.85.-t')">Hadron-induced high- and super-high-energy interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'13.85.Dz')">Elastic scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'13.85.Fb')">Inelastic scattering: two-particle final states</xsl:when>
                            <xsl:when test="contains($codePacs,'13.85.Hd')">Inelastic scattering: many-particle final states</xsl:when>
                            <xsl:when test="contains($codePacs,'13.85.Lg')">Total cross sections</xsl:when>
                            <xsl:when test="contains($codePacs,'13.85.Ni')">Inclusive production with identified hadrons</xsl:when>
                            <xsl:when test="contains($codePacs,'13.85.Qk')">Inclusive production with identified leptons, photons, or other nonhadronic particles</xsl:when>
                            <xsl:when test="contains($codePacs,'13.85.Tp')">Cosmic-ray interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'13.87.Ce')">Production</xsl:when>
                            <xsl:when test="contains($codePacs,'13.88.+e')">Polarization in interactions and scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'13.90.+i')">Other topics in specific reactions and phenomenology of elementary particles</xsl:when>
                            <xsl:when test="contains($codePacs,'14.00.00')">Properties of specific particles</xsl:when>
                            <xsl:when test="contains($codePacs,'14.20.-c')">Baryons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.20.Dh')">Protons and neutrons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.20.Gk')">Baryon resonances (S=C=B=0)</xsl:when>
                            <xsl:when test="contains($codePacs,'14.20.Jn')">Hyperons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.20.Pt')">Exotic baryons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.40.-n')">Mesons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.40.Aq')">pi, K, and eta mesons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.40.Cs')">Other mesons with S=C=0, mass &lt; 2.5 GeV</xsl:when>
                            <xsl:when test="contains($codePacs,'14.40.Ev')">Other strange mesons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.40.Gx')">Mesons with S=C=B=0, mass &gt; 2.5 GeV (including quarkonia)</xsl:when>
                            <xsl:when test="contains($codePacs,'14.40.Lb')">Charmed mesons (|C|&gt;0, B=0)</xsl:when>
                            <xsl:when test="contains($codePacs,'14.40.Nd')">Bottom mesons (|B|&gt;0)</xsl:when>
                            <xsl:when test="contains($codePacs,'14.60.-z')">Leptons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.60.Cd')">Electrons (including positrons)</xsl:when>
                            <xsl:when test="contains($codePacs,'14.60.Ef')">Muons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.60.Fg')">Taus</xsl:when>
                            <xsl:when test="contains($codePacs,'14.60.Lm')">Ordinary neutrinos</xsl:when>
                            <xsl:when test="contains($codePacs,'14.60.Pq')">Neutrino mass and mixing</xsl:when>
                            <xsl:when test="contains($codePacs,'14.60.St')">Non-standard-model neutrinos, right-handed neutrinos, etc.</xsl:when>
                            <xsl:when test="contains($codePacs,'14.65.-q')">Quarks</xsl:when>
                            <xsl:when test="contains($codePacs,'14.65.Dw')">Charmed quarks</xsl:when>
                            <xsl:when test="contains($codePacs,'14.65.Fy')">Bottom quarks</xsl:when>
                            <xsl:when test="contains($codePacs,'14.65.Ha')">Top quarks</xsl:when>
                            <xsl:when test="contains($codePacs,'14.70.Bh')">Photons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.70.Dj')">Gluons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.70.Fm')">W bosons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.70.Hp')">Z bosons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.80.-j')">Other particles (including hypothetical)</xsl:when>
                            <xsl:when test="contains($codePacs,'14.80.Cp')">Non-standard-model Higgs bosons</xsl:when>
                            <xsl:when test="contains($codePacs,'14.80.Hv')">Magnetic monopoles</xsl:when>
                            <xsl:when test="contains($codePacs,'14.80.Ly')">Supersymmetric partners of known particles</xsl:when>
                            <xsl:when test="contains($codePacs,'14.80.Mz')">Axions and other Nambu-Goldstone bosons (Majorons, familons, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'14.80.Nb')">Neutralinos and charginos</xsl:when>
                            <xsl:when test="contains($codePacs,'21.00.00')">Nuclear structure</xsl:when>
                            <xsl:when test="contains($codePacs,'21.10.-k')">Properties of nuclei; nuclear energy levels</xsl:when>
                            <xsl:when test="contains($codePacs,'21.10.Dr')">Binding energies and masses</xsl:when>
                            <xsl:when test="contains($codePacs,'21.10.Ft')">Charge distribution</xsl:when>
                            <xsl:when test="contains($codePacs,'21.10.Gv')">Nucleon distributions and halo features</xsl:when>
                            <xsl:when test="contains($codePacs,'21.10.Hw')">Spin, parity, and isobaric spin</xsl:when>
                            <xsl:when test="contains($codePacs,'21.10.Jx')">Spectroscopic factors and asymptotic normalization coefficients</xsl:when>
                            <xsl:when test="contains($codePacs,'21.10.Ky')">Electromagnetic moments</xsl:when>
                            <xsl:when test="contains($codePacs,'21.10.Ma')">Level density</xsl:when>
                            <xsl:when test="contains($codePacs,'21.10.Pc')">Single-particle levels and strength functions</xsl:when>
                            <xsl:when test="contains($codePacs,'21.10.Re')">Collective levels</xsl:when>
                            <xsl:when test="contains($codePacs,'21.10.Tg')">Lifetimes, widths</xsl:when>
                            <xsl:when test="contains($codePacs,'21.30.-x')">Nuclear forces</xsl:when>
                            <xsl:when test="contains($codePacs,'21.30.Fe')">Forces in hadronic systems and effective interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'21.45.+v')">Few-body systems</xsl:when>
                            <xsl:when test="contains($codePacs,'21.45.-v')">Few-body systems</xsl:when>
                            <xsl:when test="contains($codePacs,'21.60.-n')">Nuclear structure models and methods</xsl:when>
                            <xsl:when test="contains($codePacs,'21.60.Cs')">Shell model</xsl:when>
                            <xsl:when test="contains($codePacs,'21.60.Ev')">Collective models</xsl:when>
                            <xsl:when test="contains($codePacs,'21.60.Fw')">Models based on group theory</xsl:when>
                            <xsl:when test="contains($codePacs,'21.60.Gx')">Cluster models</xsl:when>
                            <xsl:when test="contains($codePacs,'21.65.+f')">Nuclear matter</xsl:when>
                            <xsl:when test="contains($codePacs,'21.80.+a')">Hypernuclei</xsl:when>
                            <xsl:when test="contains($codePacs,'21.90.+f')">Other topics in nuclear structure</xsl:when>
                            <xsl:when test="contains($codePacs,'23.00.00')">Radioactive decay and in-beam spectroscopy</xsl:when>
                            <xsl:when test="contains($codePacs,'23.20.-g')">Electromagnetic transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'23.20.En')">Angular distribution and correlation measurements</xsl:when>
                            <xsl:when test="contains($codePacs,'23.20.Js')">Multipole matrix elements</xsl:when>
                            <xsl:when test="contains($codePacs,'23.20.Lv')">γ transitions and level energies</xsl:when>
                            <xsl:when test="contains($codePacs,'23.20.Nx')">Internal conversion and extranuclear effects (including Auger electrons and internal bremsstrahlung)</xsl:when>
                            <xsl:when test="contains($codePacs,'23.40.-s')">β decay; double β decay; electron and muon capture</xsl:when>
                            <xsl:when test="contains($codePacs,'23.40.Bw')">Weak-interaction and lepton</xsl:when>
                            <xsl:when test="contains($codePacs,'23.40.Hc')">Relation with nuclear matrix elements and nuclear structure</xsl:when>
                            <xsl:when test="contains($codePacs,'23.50.+z')">Decay by proton emission</xsl:when>
                            <xsl:when test="contains($codePacs,'23.60.+e')">α decay</xsl:when>
                            <xsl:when test="contains($codePacs,'23.90.+w')">Other topics in radioactive decay and in-beam spectroscopy</xsl:when>
                            <xsl:when test="contains($codePacs,'24.00.00')">Nuclear reactions: general</xsl:when>
                            <xsl:when test="contains($codePacs,'24.10.-i')">Nuclear reaction models and methods</xsl:when>
                            <xsl:when test="contains($codePacs,'24.10.Cn')">Many-body theory</xsl:when>
                            <xsl:when test="contains($codePacs,'24.10.Ht')">Optical and diffraction models</xsl:when>
                            <xsl:when test="contains($codePacs,'24.10.Nz')">Hydrodynamic models</xsl:when>
                            <xsl:when test="contains($codePacs,'24.10.Pa')">Thermal and statistical models</xsl:when>
                            <xsl:when test="contains($codePacs,'24.30.Cz')">Giant resonances</xsl:when>
                            <xsl:when test="contains($codePacs,'24.50.+g')">Direct reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'24.60.-k')">Statistical theory and fluctuations</xsl:when>
                            <xsl:when test="contains($codePacs,'24.60.Dr')">Statistical compound-nucleus reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'24.60.Ky')">Fluctuation phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'24.60.Lz')">Chaos in nuclear systems</xsl:when>
                            <xsl:when test="contains($codePacs,'24.70.+s')">Polarization phenomena in reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'24.75.+i')">General properties of fission</xsl:when>
                            <xsl:when test="contains($codePacs,'24.85.+p')">Quarks, gluons, and QCD in nuclear reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.00.00')">Nuclear reactions: specific reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.20.-x')">Photonuclear reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.20.Dc')">Photon absorption and scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'25.30.-c')">Lepton-induced reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.30.Dh')">Inelastic electron scattering to specific states</xsl:when>
                            <xsl:when test="contains($codePacs,'25.30.Mr')">Muon-induced reactions (including the EMC effect)</xsl:when>
                            <xsl:when test="contains($codePacs,'25.40.-h')">Nucleon-induced reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.40.Cm')">Elastic proton scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'25.40.Dn')">Elastic neutron scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'25.40.Ep')">Inelastic proton scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'25.40.Fq')">Inelastic neutron scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'25.40.Hs')">Transfer reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.40.Kv')">Charge-exchange reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.40.Lw')">Radiative capture</xsl:when>
                            <xsl:when test="contains($codePacs,'25.45.-z')">2H-induced reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.45.De')">Elastic and inelastic scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'25.45.Hi')">Transfer reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.45.Kk')">Charge-exchange reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.55.-e')">3H-, 3He-, and 4He-induced reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.55.Ci')">Elastic and inelastic scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'25.60.Pj')">Fusion reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.70.-z')">Low and intermediate energy heavy-ion reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.70.De')">Coulomb excitation</xsl:when>
                            <xsl:when test="contains($codePacs,'25.70.Hi')">Transfer reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.70.Kk')">Charge-exchange reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.75.-q')">Relativistic heavy-ion collisions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.75.Nq')">Quark deconfinement, quark-gluon plasma production, and phase transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.80.-e')">Meson- and hyperon-induced reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.80.Dj')">Pion elastic scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'25.80.Gn')">Pion charge-exchange reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.80.Hp')">Pion-induced reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.80.Nv')">Kaon-induced reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.85.-w')">Fission reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'25.85.Ca')">Spontaneous fission</xsl:when>
                            <xsl:when test="contains($codePacs,'25.85.Ec')">Neutron-induced fission</xsl:when>
                            <xsl:when test="contains($codePacs,'25.85.Ge')">Charged-particle-induced fission</xsl:when>
                            <xsl:when test="contains($codePacs,'25.85.Jg')">Photofission</xsl:when>
                            <xsl:when test="contains($codePacs,'26.00.00')">Nuclear astrophysics</xsl:when>
                            <xsl:when test="contains($codePacs,'26.30.-k')">Nucleosynthesis in novae, supernovae, and other explosive environments</xsl:when>
                            <xsl:when test="contains($codePacs,'26.35.+c')">Big Bang nucleosynthesis</xsl:when>
                            <xsl:when test="contains($codePacs,'26.50.+x')">Nuclear physics aspects of novae, supernovae, and other explosive environments</xsl:when>
                            <xsl:when test="contains($codePacs,'26.60.+c')">Nuclear matter aspects of neutron stars</xsl:when>
                            <xsl:when test="contains($codePacs,'26.60.-c')">Nuclear matter aspects of neutron stars</xsl:when>
                            <xsl:when test="contains($codePacs,'26.65.+t')">Solar neutrinos</xsl:when>
                            <xsl:when test="contains($codePacs,'27.00.00')">Properties of specific nuclei listed by mass ranges</xsl:when>
                            <xsl:when test="contains($codePacs,'27.10.+h')">A &#8804; 5</xsl:when>
                            <xsl:when test="contains($codePacs,'27.20.+n')">6 &#8804; A &#8804; 19</xsl:when>
                            <xsl:when test="contains($codePacs,'27.30.+t')">20 &#8804; A &#8804; 38</xsl:when>
                            <xsl:when test="contains($codePacs,'27.50.+e')">59 &#8804; A &#8804; 89</xsl:when>
                            <xsl:when test="contains($codePacs,'27.60.+j')">90 &#8804; A &#8804; 149</xsl:when>
                            <xsl:when test="contains($codePacs,'27.80.+w')">190 &#8804; A &#8804; 219</xsl:when>
                            <xsl:when test="contains($codePacs,'27.90.+b')">A &#8805; 220</xsl:when>
                            <xsl:when test="contains($codePacs,'28.00.00')">Nuclear engineering and nuclear power studies</xsl:when>
                            <xsl:when test="contains($codePacs,'28.20.-v')">Neutron physics</xsl:when>
                            <xsl:when test="contains($codePacs,'28.20.Cz')">Neutron scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'28.20.Gd')">Neutron transport: diffusion and moderation</xsl:when>
                            <xsl:when test="contains($codePacs,'28.41.-i')">Fission reactors</xsl:when>
                            <xsl:when test="contains($codePacs,'28.41.Ak')">Theory, design, and computerized simulation</xsl:when>
                            <xsl:when test="contains($codePacs,'28.41.Bm')">Fuel elements, preparation, reloading, and reprocessing</xsl:when>
                            <xsl:when test="contains($codePacs,'28.41.Kw')">Radioactive wastes, waste disposal</xsl:when>
                            <xsl:when test="contains($codePacs,'28.41.My')">Reactor control systems</xsl:when>
                            <xsl:when test="contains($codePacs,'28.41.Pa')">Moderators</xsl:when>
                            <xsl:when test="contains($codePacs,'28.41.Te')">Protection systems, safety, radiation monitoring, accidents, and dismantling</xsl:when>
                            <xsl:when test="contains($codePacs,'28.50.-k')">Fission reactor types</xsl:when>
                            <xsl:when test="contains($codePacs,'28.50.Dr')">Research reactors</xsl:when>
                            <xsl:when test="contains($codePacs,'28.50.Ft')">Fast and breeder reactors</xsl:when>
                            <xsl:when test="contains($codePacs,'28.52.-s')">Fusion reactors</xsl:when>
                            <xsl:when test="contains($codePacs,'28.52.Av')">Theory, design, and computerized simulation</xsl:when>
                            <xsl:when test="contains($codePacs,'28.52.Cx')">Fueling, heating and ignition</xsl:when>
                            <xsl:when test="contains($codePacs,'28.60.+s')">Isotope separation and enrichment</xsl:when>
                            <xsl:when test="contains($codePacs,'28.70.+y')">Nuclear explosions</xsl:when>
                            <xsl:when test="contains($codePacs,'28.90.+i')">Other topics in nuclear engineering and nuclear power studies</xsl:when>
                            <xsl:when test="contains($codePacs,'29.00.00')">Experimental methods and instrumentation for elementary-particle and nuclear physics</xsl:when>
                            <xsl:when test="contains($codePacs,'29.17.+w')">Electrostatic, collective, and linear accelerators</xsl:when>
                            <xsl:when test="contains($codePacs,'29.20.-c')">Accelerators</xsl:when>
                            <xsl:when test="contains($codePacs,'29.20.D-')">Cyclic accelerators and storage rings</xsl:when>
                            <xsl:when test="contains($codePacs,'29.20.Dh')">Storage rings</xsl:when>
                            <xsl:when test="contains($codePacs,'29.20.Fj')">Betatrons</xsl:when>
                            <xsl:when test="contains($codePacs,'29.20.Hm')">Cyclotrons</xsl:when>
                            <xsl:when test="contains($codePacs,'29.20.Lq')">Synchrotrons</xsl:when>
                            <xsl:when test="contains($codePacs,'29.20.db')">Storage rings and colliders</xsl:when>
                            <xsl:when test="contains($codePacs,'29.25.Bx')">Electron sources</xsl:when>
                            <xsl:when test="contains($codePacs,'29.25.Dz')">Neutron sources</xsl:when>
                            <xsl:when test="contains($codePacs,'29.25.Ni')">Ion sources: positive and negative</xsl:when>
                            <xsl:when test="contains($codePacs,'29.25.Rm')">Sources of radioactive nuclei</xsl:when>
                            <xsl:when test="contains($codePacs,'29.27.-a')">Beams in particle accelerators</xsl:when>
                            <xsl:when test="contains($codePacs,'29.27.Ac')">Beam injection and extraction</xsl:when>
                            <xsl:when test="contains($codePacs,'29.27.Bd')">Beam dynamics; collective effects and instabilities</xsl:when>
                            <xsl:when test="contains($codePacs,'29.27.Fh')">Beam characteristics</xsl:when>
                            <xsl:when test="contains($codePacs,'29.27.Hj')">Polarized beams</xsl:when>
                            <xsl:when test="contains($codePacs,'29.30.-h')">Spectrometers and spectroscopic techniques</xsl:when>
                            <xsl:when test="contains($codePacs,'29.30.Hs')">Neutron spectroscopy</xsl:when>
                            <xsl:when test="contains($codePacs,'29.40.-n')">Radiation detectors</xsl:when>
                            <xsl:when test="contains($codePacs,'29.40.Cs')">Gas-filled counters: ionization chambers, proportional, and avalanche counters</xsl:when>
                            <xsl:when test="contains($codePacs,'29.40.Gx')">Tracking and position-sensitive detectors</xsl:when>
                            <xsl:when test="contains($codePacs,'29.40.Ka')">Cherenkov detectors</xsl:when>
                            <xsl:when test="contains($codePacs,'29.40.Mc')">Scintillation detectors</xsl:when>
                            <xsl:when test="contains($codePacs,'29.40.Rg')">Nuclear emulsions</xsl:when>
                            <xsl:when test="contains($codePacs,'29.40.Vj')">Calorimeters</xsl:when>
                            <xsl:when test="contains($codePacs,'29.40.Wk')">Solid-state detectors</xsl:when>
                            <xsl:when test="contains($codePacs,'29.50.+v')">Computer interfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'29.90.+r')">Other topics in elementary-particle and nuclear physics experimental methods and instrumentation</xsl:when>
                            <xsl:when test="contains($codePacs,'31.00.00')">Electronic structure of atoms and molecules: theory</xsl:when>
                            <xsl:when test="contains($codePacs,'31.10.+z')">Theory of electronic structure, electronic transitions, and chemical binding</xsl:when>
                            <xsl:when test="contains($codePacs,'31.15.-p')">Calculations and mathematical techniques in atomic and molecular physics</xsl:when>
                            <xsl:when test="contains($codePacs,'31.15.Bs')">Statistical model calculations (including Thomas-Fermi and Thomas-Fermi-Dirac models)</xsl:when>
                            <xsl:when test="contains($codePacs,'31.15.Ct')">Semi-empirical and empirical calculations (differential overlap, Huckel, PPP methods, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'31.15.E-')">Density-functional theory</xsl:when>
                            <xsl:when test="contains($codePacs,'31.15.Gy')">Semiclassical methods</xsl:when>
                            <xsl:when test="contains($codePacs,'31.15.Hz')">Group theory</xsl:when>
                            <xsl:when test="contains($codePacs,'31.15.Md')">Perturbation theory</xsl:when>
                            <xsl:when test="contains($codePacs,'31.15.Ne')">Self-consistent-field methods</xsl:when>
                            <xsl:when test="contains($codePacs,'31.15.bt')">Statistical model calculations (including Thomas-Fermi and Thomas-Fermi-Dirac models)</xsl:when>
                            <xsl:when test="contains($codePacs,'31.15.xh')">Group-theoretical methods</xsl:when>
                            <xsl:when test="contains($codePacs,'31.25.-v')">Electron correlation calculations for atoms and molecules</xsl:when>
                            <xsl:when test="contains($codePacs,'31.25.Jf')">Electron correlation calculations for atoms and ions: excited states</xsl:when>
                            <xsl:when test="contains($codePacs,'31.25.Qm')">Electron correlation calculations for polyatomic molecules</xsl:when>
                            <xsl:when test="contains($codePacs,'31.30.Gs')">Hyperfine interactions and isotope effects</xsl:when>
                            <xsl:when test="contains($codePacs,'31.30.Jv')">Relativistic and quantum electrodynamic effects in atoms and molecules</xsl:when>
                            <xsl:when test="contains($codePacs,'31.70.Ks')">Molecular solids</xsl:when>
                            <xsl:when test="contains($codePacs,'31.90.+s')">Other topics in the theory of the electronic structure of atoms and molecules</xsl:when>
                            <xsl:when test="contains($codePacs,'32.00.00')">Atomic properties and interactions with photons</xsl:when>
                            <xsl:when test="contains($codePacs,'32.10.-f')">Properties of atoms</xsl:when>
                            <xsl:when test="contains($codePacs,'32.10.Bi')">Atomic masses, mass spectra, abundances, and isotopes</xsl:when>
                            <xsl:when test="contains($codePacs,'32.10.Dk')">Electric and magnetic moments, polarizabilities</xsl:when>
                            <xsl:when test="contains($codePacs,'32.10.Fn')">Fine and hyperfine structure</xsl:when>
                            <xsl:when test="contains($codePacs,'32.10.Hq')">Ionization potentials, electron affinities</xsl:when>
                            <xsl:when test="contains($codePacs,'32.30.-r')">Atomic spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'32.30.Bv')">Radio-frequency, microwave, and infrared spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'32.30.Dx')">Magnetic resonance spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'32.30.Jc')">Visible and ultraviolet spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'32.30.Rj')">X-ray spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'32.50.+d')">Fluorescence, phosphorescence (including quenching)</xsl:when>
                            <xsl:when test="contains($codePacs,'32.60.+i')">Zeeman and Stark effects</xsl:when>
                            <xsl:when test="contains($codePacs,'32.70.-n')">Intensities and shapes of atomic spectral lines</xsl:when>
                            <xsl:when test="contains($codePacs,'32.70.Cs')">Oscillator strengths, lifetimes, transition moments</xsl:when>
                            <xsl:when test="contains($codePacs,'32.70.Fw')">Absolute and relative intensities</xsl:when>
                            <xsl:when test="contains($codePacs,'32.70.Jz')">Line shapes, widths, and shifts</xsl:when>
                            <xsl:when test="contains($codePacs,'32.80.-t')">Photoionization and excitation</xsl:when>
                            <xsl:when test="contains($codePacs,'32.80.Bx')">Level crossing and optical pumping</xsl:when>
                            <xsl:when test="contains($codePacs,'32.80.Cy')">Atomic scattering, cross sections, and form factors; Compton scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'32.80.Dz')">Autoionization</xsl:when>
                            <xsl:when test="contains($codePacs,'32.80.Fb')">Photoionization of atoms and ions</xsl:when>
                            <xsl:when test="contains($codePacs,'32.80.Gc')">Photodetachment of atomic negative ions</xsl:when>
                            <xsl:when test="contains($codePacs,'32.80.Hd')">Auger effect</xsl:when>
                            <xsl:when test="contains($codePacs,'32.80.Pj')">Optical cooling of atoms; trapping</xsl:when>
                            <xsl:when test="contains($codePacs,'32.80.Qk')">Coherent control of atomic interactions with photons</xsl:when>
                            <xsl:when test="contains($codePacs,'32.80.Rm')">Multiphoton ionization and excitation to highly excited states</xsl:when>
                            <xsl:when test="contains($codePacs,'32.80.Wr')">Other multiphoton processes</xsl:when>
                            <xsl:when test="contains($codePacs,'32.80.Ys')">Weak-interaction effects in atoms</xsl:when>
                            <xsl:when test="contains($codePacs,'32.90.+a')">Other topics in atomic properties and interactions of atoms with photons</xsl:when>
                            <xsl:when test="contains($codePacs,'33.00.00')">Molecular properties and interactions with photons</xsl:when>
                            <xsl:when test="contains($codePacs,'33.15.Bh')">General molecular conformation and symmetry; stereochemistry</xsl:when>
                            <xsl:when test="contains($codePacs,'33.15.Dj')">Interatomic distances and angles</xsl:when>
                            <xsl:when test="contains($codePacs,'33.15.Fm')">Bond strengths, dissociation energies</xsl:when>
                            <xsl:when test="contains($codePacs,'33.15.Hp')">Barrier heights (internal rotation, inversion, rotational isomerism, conformational dynamics)</xsl:when>
                            <xsl:when test="contains($codePacs,'33.15.Kr')">Electric and magnetic moments (and derivatives), polarizability, and magnetic susceptibility</xsl:when>
                            <xsl:when test="contains($codePacs,'33.15.Mt')">Rotation, vibration, and vibration-rotation constants</xsl:when>
                            <xsl:when test="contains($codePacs,'33.15.Pw')">Fine and hyperfine structure</xsl:when>
                            <xsl:when test="contains($codePacs,'33.15.Ry')">Ionization potentials, electron affinities, molecular core binding energy</xsl:when>
                            <xsl:when test="contains($codePacs,'33.15.Ta')">Mass spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'33.20.-t')">Molecular spectra (see also 78.47.J- Ultrafast spectroscopy (</xsl:when>
                            <xsl:when test="contains($codePacs,'33.20.Bx')">Radio-frequency and microwave spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'33.20.Ea')">Infrared spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'33.20.Fb')">Raman and Rayleigh spectra (including optical scattering)</xsl:when>
                            <xsl:when test="contains($codePacs,'33.20.Lg')">Ultraviolet spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'33.20.Ni')">Vacuum ultraviolet spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'33.20.Sn')">Rotational analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'33.20.Tp')">Vibrational analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'33.20.Vq')">Vibration-rotation analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'33.20.Wr')">Vibronic, rovibronic, and rotation-electron-spin interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'33.25.+k')">Nuclear resonance and relaxation</xsl:when>
                            <xsl:when test="contains($codePacs,'33.50.-j')">Fluorescence and phosphorescence; radiationless transitions, quenching</xsl:when>
                            <xsl:when test="contains($codePacs,'33.50.Dq')">Fluorescence and phosphorescence spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'33.50.Hv')">Radiationless transitions, quenching</xsl:when>
                            <xsl:when test="contains($codePacs,'33.55.Be')">Zeeman and Stark effects</xsl:when>
                            <xsl:when test="contains($codePacs,'33.60.Fy')">X-ray photoelectron spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'33.70.Ca')">Oscillator and band strengths, lifetimes, transition moments, and Franck-Condon factors</xsl:when>
                            <xsl:when test="contains($codePacs,'33.70.Fd')">Absolute and relative line and band intensities</xsl:when>
                            <xsl:when test="contains($codePacs,'33.70.Jg')">Line and band widths, shapes, and shifts</xsl:when>
                            <xsl:when test="contains($codePacs,'33.80.-b')">Photon interactions with molecules</xsl:when>
                            <xsl:when test="contains($codePacs,'33.80.Be')">Level crossing and optical pumping</xsl:when>
                            <xsl:when test="contains($codePacs,'33.80.Eh')">Autoionization, photoionization, and photodetachment</xsl:when>
                            <xsl:when test="contains($codePacs,'33.80.Gj')">Diffuse spectra; predissociation, photodissociation</xsl:when>
                            <xsl:when test="contains($codePacs,'33.80.Rv')">Multiphoton ionization and excitation to highly excited states (e.g., Rydberg states)</xsl:when>
                            <xsl:when test="contains($codePacs,'33.80.Wz')">Other multiphoton processes</xsl:when>
                            <xsl:when test="contains($codePacs,'33.90.+h')">Other topics in molecular properties and interactions with photons</xsl:when>
                            <xsl:when test="contains($codePacs,'34.00.00')">Atomic and molecular collision processes and interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'34.10.+x')">General theories and models of atomic and molecular collisions and interactions (including statistical theories, transition state, stochastic and trajectory models, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'34.20.-b')">Interatomic and intermolecular potentials and forces, potential energy surfaces for collisions</xsl:when>
                            <xsl:when test="contains($codePacs,'34.20.Gj')">Intermolecular and atom-molecule potentials and forces</xsl:when>
                            <xsl:when test="contains($codePacs,'34.30.+h')">Intramolecular energy transfer; intramolecular dynamics; dynamics of van der Waals molecules</xsl:when>
                            <xsl:when test="contains($codePacs,'34.35.+a')">Interactions of atoms and molecules with surfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'34.50.-s')">Scattering of atoms and molecules</xsl:when>
                            <xsl:when test="contains($codePacs,'34.50.Bw')">Energy loss and stopping power</xsl:when>
                            <xsl:when test="contains($codePacs,'34.50.Dy')">Interactions of atoms and molecules with surfaces; photon and electron emission; neutralization of ions</xsl:when>
                            <xsl:when test="contains($codePacs,'34.50.Fa')">Electronic excitation and ionization of atoms (including beam-foil excitation and ionization)</xsl:when>
                            <xsl:when test="contains($codePacs,'34.50.Gb')">Electronic excitation and ionization of molecules</xsl:when>
                            <xsl:when test="contains($codePacs,'34.50.Lf')">Chemical reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'34.70.+e')">Charge transfer</xsl:when>
                            <xsl:when test="contains($codePacs,'34.80.-i')">Electron and positron scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'34.80.Bm')">Elastic scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'34.80.Dp')">Atomic excitation and ionization</xsl:when>
                            <xsl:when test="contains($codePacs,'34.80.Gs')">Molecular excitation and ionization</xsl:when>
                            <xsl:when test="contains($codePacs,'34.80.Ht')">Dissociation and dissociative attachment</xsl:when>
                            <xsl:when test="contains($codePacs,'34.80.Lx')">Recombination, attachment, and positronium formation</xsl:when>
                            <xsl:when test="contains($codePacs,'34.80.Nz')">Spin dependence of cross sections; polarized beam experiments</xsl:when>
                            <xsl:when test="contains($codePacs,'36.00.00')">Exotic atoms and molecules; macromolecules; clusters</xsl:when>
                            <xsl:when test="contains($codePacs,'36.10.-k')">Exotic atoms and molecules (containing mesons, antiprotons and other unusual particles)</xsl:when>
                            <xsl:when test="contains($codePacs,'36.10.Dr')">Positronium</xsl:when>
                            <xsl:when test="contains($codePacs,'36.10.Gv')">Mesonic, hyperonic and antiprotonic atoms and molecules</xsl:when>
                            <xsl:when test="contains($codePacs,'36.20.-r')">Macromolecules and polymer molecules</xsl:when>
                            <xsl:when test="contains($codePacs,'36.20.Ey')">Conformation (statistics and dynamics)</xsl:when>
                            <xsl:when test="contains($codePacs,'36.20.Fz')">Constitution (chains and sequences)</xsl:when>
                            <xsl:when test="contains($codePacs,'36.20.Hb')">Configuration (bonds, dimensions)</xsl:when>
                            <xsl:when test="contains($codePacs,'36.20.Ng')">Vibrational and rotational structure, infrared and Raman spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'36.40.-c')">Atomic and molecular clusters</xsl:when>
                            <xsl:when test="contains($codePacs,'36.40.Ei')">Phase transitions in clusters</xsl:when>
                            <xsl:when test="contains($codePacs,'36.40.Gk')">Plasma and collective effects in clusters</xsl:when>
                            <xsl:when test="contains($codePacs,'36.40.Mr')">Spectroscopy and geometrical structure of clusters</xsl:when>
                            <xsl:when test="contains($codePacs,'36.40.Sx')">Diffusion and dynamics of clusters</xsl:when>
                            <xsl:when test="contains($codePacs,'36.40.Vz')">Optical properties of clusters</xsl:when>
                            <xsl:when test="contains($codePacs,'37.00.00')">Mechanical control of atoms, molecules, and ions</xsl:when>
                            <xsl:when test="contains($codePacs,'37.10.De')">Atom cooling methods</xsl:when>
                            <xsl:when test="contains($codePacs,'37.10.Ty')">Ion trapping</xsl:when>
                            <xsl:when test="contains($codePacs,'39.00.00')">Instrumentation and techniques for atomic and molecular physics</xsl:when>
                            <xsl:when test="contains($codePacs,'39.10.+j')">Atomic and molecular beam sources and techniques</xsl:when>
                            <xsl:when test="contains($codePacs,'39.30.+w')">Spectroscopic techniques</xsl:when>
                            <xsl:when test="contains($codePacs,'39.90.+d')">Other instrumentation and techniques for atomic and molecular physics</xsl:when>
                            <xsl:when test="contains($codePacs,'41.00.00')">Electromagnetism; electron and ion optics</xsl:when>
                            <xsl:when test="contains($codePacs,'41.20.-q')">Applied classical electromagnetism</xsl:when>
                            <xsl:when test="contains($codePacs,'41.20.Cv')">Electrostatics; Poisson and Laplace equations, boundary-value problems</xsl:when>
                            <xsl:when test="contains($codePacs,'41.20.Gz')">Magnetostatics; magnetic shielding, magnetic induction, boundary-value problems</xsl:when>
                            <xsl:when test="contains($codePacs,'41.20.Jb')">Electromagnetic wave propagation; radiowave propagation</xsl:when>
                            <xsl:when test="contains($codePacs,'41.50.+h')">X-ray beams and x-ray optics</xsl:when>
                            <xsl:when test="contains($codePacs,'41.60.-m')">Radiation by moving charges</xsl:when>
                            <xsl:when test="contains($codePacs,'41.60.Ap')">Synchrotron radiation</xsl:when>
                            <xsl:when test="contains($codePacs,'41.60.Bq')">Cherenkov radiation</xsl:when>
                            <xsl:when test="contains($codePacs,'41.60.Cr')">Free-electron lasers</xsl:when>
                            <xsl:when test="contains($codePacs,'41.75.-i')">Charged-particle beams</xsl:when>
                            <xsl:when test="contains($codePacs,'41.75.Ak')">Positive-ion beams</xsl:when>
                            <xsl:when test="contains($codePacs,'41.75.Fr')">Electron and positron beams</xsl:when>
                            <xsl:when test="contains($codePacs,'41.75.Ht')">Relativistic electron and positron beams</xsl:when>
                            <xsl:when test="contains($codePacs,'41.75.Jv')">Laser-driven acceleration</xsl:when>
                            <xsl:when test="contains($codePacs,'41.85.-p')">Beam optics</xsl:when>
                            <xsl:when test="contains($codePacs,'41.85.Ar')">Particle beam extraction, beam injection</xsl:when>
                            <xsl:when test="contains($codePacs,'41.85.Ct')">Particle beam shaping, beam splitting</xsl:when>
                            <xsl:when test="contains($codePacs,'41.85.Gy')">Chromatic and geometrical aberrations</xsl:when>
                            <xsl:when test="contains($codePacs,'41.85.Lc')">Particle beam focusing and bending magnets, wiggler magnets, and quadrupoles</xsl:when>
                            <xsl:when test="contains($codePacs,'41.90.+e')">Other topics in electromagnetism; electron and ion optics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.00.00')">Optics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.15.-i')">Geometrical optics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.15.Dp')">Wave fronts and ray tracing</xsl:when>
                            <xsl:when test="contains($codePacs,'42.15.Fr')">Aberrations</xsl:when>
                            <xsl:when test="contains($codePacs,'42.25.-p')">Wave optics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.25.Bs')">Wave propagation, transmission and absorption</xsl:when>
                            <xsl:when test="contains($codePacs,'42.25.Dd')">Wave propagation in random media</xsl:when>
                            <xsl:when test="contains($codePacs,'42.25.Fx')">Diffraction and scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'42.25.Gy')">Edge and boundary effects; reflection and refraction</xsl:when>
                            <xsl:when test="contains($codePacs,'42.25.Hz')">Interference</xsl:when>
                            <xsl:when test="contains($codePacs,'42.25.Ja')">Polarization</xsl:when>
                            <xsl:when test="contains($codePacs,'42.25.Kb')">Coherence</xsl:when>
                            <xsl:when test="contains($codePacs,'42.25.Lc')">Birefringence</xsl:when>
                            <xsl:when test="contains($codePacs,'42.30.-d')">Imaging and optical processing</xsl:when>
                            <xsl:when test="contains($codePacs,'42.30.Kq')">Fourier optics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.30.Lr')">Modulation and optical transfer functions</xsl:when>
                            <xsl:when test="contains($codePacs,'42.30.Ms')">Speckle and moiré patterns</xsl:when>
                            <xsl:when test="contains($codePacs,'42.30.Rx')">Phase retrieval</xsl:when>
                            <xsl:when test="contains($codePacs,'42.30.Va')">Image forming and processing</xsl:when>
                            <xsl:when test="contains($codePacs,'42.30.Wb')">Image reconstruction; tomography</xsl:when>
                            <xsl:when test="contains($codePacs,'42.40.-i')">Holography</xsl:when>
                            <xsl:when test="contains($codePacs,'42.40.Eq')">Holographic optical elements; holographic gratings</xsl:when>
                            <xsl:when test="contains($codePacs,'42.40.Ht')">Hologram recording and readout methods</xsl:when>
                            <xsl:when test="contains($codePacs,'42.40.Kw')">Holographic interferometry; other holographic techniques</xsl:when>
                            <xsl:when test="contains($codePacs,'42.40.Lx')">Diffraction efficiency, resolution, and other hologram characteristics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.40.My')">Applications</xsl:when>
                            <xsl:when test="contains($codePacs,'42.40.Pa')">Volume holograms</xsl:when>
                            <xsl:when test="contains($codePacs,'42.50.-p')">Quantum optics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.50.Ar')">Photon statistics and coherence theory</xsl:when>
                            <xsl:when test="contains($codePacs,'42.50.Ct')">Quantum description of interaction of light and matter; related experiments</xsl:when>
                            <xsl:when test="contains($codePacs,'42.50.Dv')">Quantum state engineering and measurements</xsl:when>
                            <xsl:when test="contains($codePacs,'42.50.Ex')">Optical implementations of quantum information processing and transfer</xsl:when>
                            <xsl:when test="contains($codePacs,'42.50.Fx')">Cooperative phenomena in quantum optical systems</xsl:when>
                            <xsl:when test="contains($codePacs,'42.50.Gy')">Effects of atomic coherence on propagation, absorption, and amplification of light; electromagnetically induced transparency and absorption</xsl:when>
                            <xsl:when test="contains($codePacs,'42.50.Hz')">Strong-field excitation of optical transitions in quantum systems; multiphoton processes; dynamic Stark shift</xsl:when>
                            <xsl:when test="contains($codePacs,'42.50.Lc')">Quantum fluctuations, quantum noise, and quantum jumps</xsl:when>
                            <xsl:when test="contains($codePacs,'42.50.Md')">Optical transient phenomena: quantum beats, photon echo, free-induction decay, dephasings and revivals, optical nutation, and self-induced transparency</xsl:when>
                            <xsl:when test="contains($codePacs,'42.50.Nn')">Quantum optical phenomena in absorbing, amplifying, dispersive and conducting media; cooperative phenomena in quantum optical systems</xsl:when>
                            <xsl:when test="contains($codePacs,'42.50.Pq')">Cavity quantum electrodynamics; micromasers</xsl:when>
                            <xsl:when test="contains($codePacs,'42.50.Wk')">Mechanical effects of light on material media, microstructures and particles</xsl:when>
                            <xsl:when test="contains($codePacs,'42.55.-f')">Lasers</xsl:when>
                            <xsl:when test="contains($codePacs,'42.55.Ah')">General laser theory</xsl:when>
                            <xsl:when test="contains($codePacs,'42.55.Ks')">Chemical lasers</xsl:when>
                            <xsl:when test="contains($codePacs,'42.55.Lt')">Gas lasers including excimer and metal-vapor lasers</xsl:when>
                            <xsl:when test="contains($codePacs,'42.55.Mv')">Dye lasers</xsl:when>
                            <xsl:when test="contains($codePacs,'42.55.Px')">Semiconductor lasers; laser diodes</xsl:when>
                            <xsl:when test="contains($codePacs,'42.55.Rz')">Doped-insulator lasers and other solid state lasers</xsl:when>
                            <xsl:when test="contains($codePacs,'42.55.Vc')">X- and γ-ray lasers</xsl:when>
                            <xsl:when test="contains($codePacs,'42.55.Wd')">Fiber lasers</xsl:when>
                            <xsl:when test="contains($codePacs,'42.55.Ye')">Raman lasers</xsl:when>
                            <xsl:when test="contains($codePacs,'42.60.-v')">Laser optical systems: design and operation</xsl:when>
                            <xsl:when test="contains($codePacs,'42.60.By')">Design of specific laser systems</xsl:when>
                            <xsl:when test="contains($codePacs,'42.60.Da')">Resonators, cavities, amplifiers, arrays, and rings</xsl:when>
                            <xsl:when test="contains($codePacs,'42.60.Fc')">Modulation, tuning, and mode locking</xsl:when>
                            <xsl:when test="contains($codePacs,'42.60.Gd')">Q-switching</xsl:when>
                            <xsl:when test="contains($codePacs,'42.60.Jf')">Beam characteristics: profile, intensity, and power; spatial pattern formation</xsl:when>
                            <xsl:when test="contains($codePacs,'42.60.Lh')">Efficiency, stability, gain, and other operational parameters</xsl:when>
                            <xsl:when test="contains($codePacs,'42.60.Mi')">Dynamical laser instabilities; noisy laser behavior</xsl:when>
                            <xsl:when test="contains($codePacs,'42.60.Pk')">Continuous operation</xsl:when>
                            <xsl:when test="contains($codePacs,'42.60.Rn')">Relaxation oscillations and long pulse operation</xsl:when>
                            <xsl:when test="contains($codePacs,'42.62.-b')">Laser applications</xsl:when>
                            <xsl:when test="contains($codePacs,'42.62.Be')">Biological and medical applications</xsl:when>
                            <xsl:when test="contains($codePacs,'42.62.Cf')">Industrial applications</xsl:when>
                            <xsl:when test="contains($codePacs,'42.62.Eh')">Metrological applications; optical frequency synthesizers for precision spectroscopy</xsl:when>
                            <xsl:when test="contains($codePacs,'42.62.Fi')">Laser spectroscopy</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.-k')">Nonlinear optics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.An')">Optical susceptibility, hyperpolarizability</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.Dr')">Stimulated Raman scattering; CARS</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.Es')">Stimulated Brillouin and Rayleigh scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.Hw')">Phase conjugation; photorefractive and Kerr effects</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.Jx')">Beam trapping, self-focusing and defocusing; self-phase modulation</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.Ky')">Frequency conversion; harmonic generation, including higher-order harmonic generation</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.Lm')">Parametric down conversion and production of entangled photons</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.Pc')">Optical bistability, multistability, and switching, including local field effects</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.Re')">Ultrafast processes; optical pulse generation and pulse compression</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.Sf')">Dynamics of nonlinear optical systems; optical instabilities, optical chaos and complexity, and optical spatio-temporal dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.Tg')">Optical solitons; nonlinear guided waves</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.Wi')">Nonlinear waveguides</xsl:when>
                            <xsl:when test="contains($codePacs,'42.65.Yj')">Optical parametric oscillators and amplifiers</xsl:when>
                            <xsl:when test="contains($codePacs,'42.66.-p')">Physiological optics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.66.Ct')">Anatomy and optics of eye</xsl:when>
                            <xsl:when test="contains($codePacs,'42.68.-w')">Atmospheric and ocean optics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.68.Ay')">Propagation, transmission, attenuation, and radiative transfer</xsl:when>
                            <xsl:when test="contains($codePacs,'42.68.Bz')">Atmospheric turbulence effects</xsl:when>
                            <xsl:when test="contains($codePacs,'42.68.Ca')">Spectral absorption by atmospheric gases</xsl:when>
                            <xsl:when test="contains($codePacs,'42.68.Jg')">Effects of aerosols</xsl:when>
                            <xsl:when test="contains($codePacs,'42.68.Kh')">Effects of air pollution</xsl:when>
                            <xsl:when test="contains($codePacs,'42.68.Mj')">Scattering, polarization</xsl:when>
                            <xsl:when test="contains($codePacs,'42.68.Wt')">Remote sensing; LIDAR and adaptive systems</xsl:when>
                            <xsl:when test="contains($codePacs,'42.68.Xy')">Ocean optics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.70.-a')">Optical materials</xsl:when>
                            <xsl:when test="contains($codePacs,'42.70.Ce')">Glasses, quartz</xsl:when>
                            <xsl:when test="contains($codePacs,'42.70.Df')">Liquid crystals</xsl:when>
                            <xsl:when test="contains($codePacs,'42.70.Hj')">Laser materials</xsl:when>
                            <xsl:when test="contains($codePacs,'42.70.Jk')">Polymers and organics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.70.Ln')">Holographic recording materials; optical storage media</xsl:when>
                            <xsl:when test="contains($codePacs,'42.70.Mp')">Nonlinear optical crystals</xsl:when>
                            <xsl:when test="contains($codePacs,'42.70.Nq')">Other nonlinear optical materials; photorefractive and semiconductor materials</xsl:when>
                            <xsl:when test="contains($codePacs,'42.70.Qs')">Photonic bandgap materials</xsl:when>
                            <xsl:when test="contains($codePacs,'42.72.-g')">Optical sources and standards</xsl:when>
                            <xsl:when test="contains($codePacs,'42.72.Bj')">Visible and ultraviolet sources</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.-e')">Optical elements, devices, and systems</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.Ag')">Apertures, collimators</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.Bh')">Lenses, prisms and mirrors</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.Ci')">Filters, zone plates, and polarizers</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.Dj')">Gratings</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.Fm')">Reflectors, beam splitters, and deflectors</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.Gn')">Optical waveguides and couplers</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.Hp')">Optical processors, correlators, and modulators</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.Jq')">Acousto-optical devices</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.Kr')">Display devices, liquid-crystal devices</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.Ls')">Scanners, image intensifiers, and image converters</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.Pw')">Imaging detectors and sensors</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.Sz')">Optical communication systems, multiplexers, and demultiplexers</xsl:when>
                            <xsl:when test="contains($codePacs,'42.79.Wc')">Optical coatings</xsl:when>
                            <xsl:when test="contains($codePacs,'42.81.-i')">Fiber optics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.81.Bm')">Fabrication, cladding, and splicing</xsl:when>
                            <xsl:when test="contains($codePacs,'42.81.Dp')">Propagation, scattering, and losses; solitons</xsl:when>
                            <xsl:when test="contains($codePacs,'42.81.Gs')">Birefringence, polarization</xsl:when>
                            <xsl:when test="contains($codePacs,'42.81.Pa')">Sensors, gyros</xsl:when>
                            <xsl:when test="contains($codePacs,'42.81.Qb')">Fiber waveguides, couplers, and arrays</xsl:when>
                            <xsl:when test="contains($codePacs,'42.81.Wg')">Other fiber-optical devices</xsl:when>
                            <xsl:when test="contains($codePacs,'42.82.-m')">Integrated optics</xsl:when>
                            <xsl:when test="contains($codePacs,'42.82.Cr')">Fabrication techniques; lithography, pattern transfer</xsl:when>
                            <xsl:when test="contains($codePacs,'42.82.Et')">Waveguides, couplers, and arrays</xsl:when>
                            <xsl:when test="contains($codePacs,'42.82.Gw')">Other integrated-optical elements and systems</xsl:when>
                            <xsl:when test="contains($codePacs,'43.00.00')">Acoustics</xsl:when>
                            <xsl:when test="contains($codePacs,'43.10.Ce')">Conferences, lectures, and announcements</xsl:when>
                            <xsl:when test="contains($codePacs,'43.10.Df')">Other acoustical societies and their publications, online journals, and other electronic publications</xsl:when>
                            <xsl:when test="contains($codePacs,'43.10.Eg')">Biographical, historical, and personal notes</xsl:when>
                            <xsl:when test="contains($codePacs,'43.10.Sv')">Education in acoustics, tutorial papers of interest to acoustics educators</xsl:when>
                            <xsl:when test="contains($codePacs,'43.20.+g')">General linear acoustics</xsl:when>
                            <xsl:when test="contains($codePacs,'43.20.Bi')">Mathematical theory of wave propagation</xsl:when>
                            <xsl:when test="contains($codePacs,'43.20.Dk')">Ray acoustics</xsl:when>
                            <xsl:when test="contains($codePacs,'43.20.El')">Reflection, refraction, diffraction of acoustic waves</xsl:when>
                            <xsl:when test="contains($codePacs,'43.20.Fn')">Scattering of acoustic waves</xsl:when>
                            <xsl:when test="contains($codePacs,'43.20.Rz')">Steady-state radiation from sources, impedance, radiation patterns, boundary element methods</xsl:when>
                            <xsl:when test="contains($codePacs,'43.25.+y')">Nonlinear acoustics</xsl:when>
                            <xsl:when test="contains($codePacs,'43.25.-x')">Nonlinear acoustics</xsl:when>
                            <xsl:when test="contains($codePacs,'43.25.Dc')">Nonlinear acoustics of solids</xsl:when>
                            <xsl:when test="contains($codePacs,'43.25.Ed')">Effect of nonlinearity on velocity and attenuation</xsl:when>
                            <xsl:when test="contains($codePacs,'43.25.Hg')">Interaction of intense sound waves with noise</xsl:when>
                            <xsl:when test="contains($codePacs,'43.25.Nm')">Acoustic streaming</xsl:when>
                            <xsl:when test="contains($codePacs,'43.25.Vt')">Intense sound sources</xsl:when>
                            <xsl:when test="contains($codePacs,'43.25.Yw')">Nonlinear acoustics of bubbly liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'43.28.-g')">Aeroacoustics and atmospheric sound</xsl:when>
                            <xsl:when test="contains($codePacs,'43.28.Bj')">Mechanisms affecting sound propagation in air, sound speed in the air</xsl:when>
                            <xsl:when test="contains($codePacs,'43.28.Mw')">Shock and blast waves, sonic boom</xsl:when>
                            <xsl:when test="contains($codePacs,'43.28.Py')">Interaction of fluid motion and sound, Doppler effect, and sound in flow ducts</xsl:when>
                            <xsl:when test="contains($codePacs,'43.30.+m')">Underwater sound</xsl:when>
                            <xsl:when test="contains($codePacs,'43.30.-k')">Underwater sound</xsl:when>
                            <xsl:when test="contains($codePacs,'43.30.Jx')">Radiation from objects vibrating under water, acoustic and mechanical impedance</xsl:when>
                            <xsl:when test="contains($codePacs,'43.35.-c')">Ultrasonics, quantum acoustics, and physical effects of sound</xsl:when>
                            <xsl:when test="contains($codePacs,'43.35.Bf')">Ultrasonic velocity, dispersion, scattering, diffraction, and attenuation in liquids, liquid crystals, suspensions, and emulsions</xsl:when>
                            <xsl:when test="contains($codePacs,'43.35.Cg')">Ultrasonic velocity, dispersion, scattering, diffraction, and attenuation in solids; elastic constants</xsl:when>
                            <xsl:when test="contains($codePacs,'43.35.Pt')">Surface waves in solids and liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'43.35.Rw')">Magnetoacoustic effect; oscillations and resonance</xsl:when>
                            <xsl:when test="contains($codePacs,'43.35.Sx')">Acoustooptical effects, optoacoustics, acoustical visualization, acoustical microscopy, and acoustical holography</xsl:when>
                            <xsl:when test="contains($codePacs,'43.35.Ud')">Thermoacoustics, high temperature acoustics, photoacoustic effect</xsl:when>
                            <xsl:when test="contains($codePacs,'43.35.Xd')">Nuclear acoustical resonance, acoustical magnetic resonance</xsl:when>
                            <xsl:when test="contains($codePacs,'43.35.Yb')">Ultrasonic instrumentation and measurement techniques</xsl:when>
                            <xsl:when test="contains($codePacs,'43.35.Zc')">Use of ultrasonics in nondestructive testing, industrial processes, and industrial products</xsl:when>
                            <xsl:when test="contains($codePacs,'43.38.-p')">Transduction; acoustical devices for the generation and reproduction of sound</xsl:when>
                            <xsl:when test="contains($codePacs,'43.38.Ja')">Loudspeakers and horns, practical sound sources</xsl:when>
                            <xsl:when test="contains($codePacs,'43.38.Kb')">Microphones and their calibration</xsl:when>
                            <xsl:when test="contains($codePacs,'43.38.Zp')">Acoustooptic and photoacoustic transducers</xsl:when>
                            <xsl:when test="contains($codePacs,'43.55.-n')">Architectural acoustics</xsl:when>
                            <xsl:when test="contains($codePacs,'43.55.Dt')">Sound absorption in enclosures: theory and measurement; use of absorption in offices, commercial and domestic spaces</xsl:when>
                            <xsl:when test="contains($codePacs,'43.58.-e')">Acoustical measurements and instrumentation (see also specific sections for specialized instrumentation)</xsl:when>
                            <xsl:when test="contains($codePacs,'43.58.Kr')">Spectrum and frequency analyzers and filters; acoustical and electrical oscillographs; photoacoustic spectrometers; acoustical delay lines and resonators</xsl:when>
                            <xsl:when test="contains($codePacs,'43.58.Ls')">Acoustical lenses and microscopes</xsl:when>
                            <xsl:when test="contains($codePacs,'43.60.-c')">Acoustic signal processing</xsl:when>
                            <xsl:when test="contains($codePacs,'43.60.Vx')">Acoustic sensing and acquisition</xsl:when>
                            <xsl:when test="contains($codePacs,'43.66.-x')">Psychological acoustics</xsl:when>
                            <xsl:when test="contains($codePacs,'43.66.Lj')">Perceptual effects of sound</xsl:when>
                            <xsl:when test="contains($codePacs,'43.75.-z')">Music and musical instruments</xsl:when>
                            <xsl:when test="contains($codePacs,'44.00.00')">Heat transfer</xsl:when>
                            <xsl:when test="contains($codePacs,'44.05.+e')">Analytical and numerical techniques</xsl:when>
                            <xsl:when test="contains($codePacs,'44.10.+i')">Heat conduction</xsl:when>
                            <xsl:when test="contains($codePacs,'44.25.+f')">Natural convection</xsl:when>
                            <xsl:when test="contains($codePacs,'44.30.+v')">Heat flow in porous media</xsl:when>
                            <xsl:when test="contains($codePacs,'44.35.+c')">Heat flow in multiphase systems</xsl:when>
                            <xsl:when test="contains($codePacs,'44.40.+a')">Thermal radiation</xsl:when>
                            <xsl:when test="contains($codePacs,'44.90.+c')">Other topics in heat transfer</xsl:when>
                            <xsl:when test="contains($codePacs,'45.00.00')">Classical mechanics of discrete systems</xsl:when>
                            <xsl:when test="contains($codePacs,'45.05.+x')">General theory of classical mechanics of discrete systems</xsl:when>
                            <xsl:when test="contains($codePacs,'45.20.-d')">Formalisms in classical mechanics</xsl:when>
                            <xsl:when test="contains($codePacs,'45.20.D-')">Newtonian mechanics</xsl:when>
                            <xsl:when test="contains($codePacs,'45.20.dc')">Rotational dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'45.20.df')">Momentum conservation</xsl:when>
                            <xsl:when test="contains($codePacs,'45.20.dh')">Energy conservation</xsl:when>
                            <xsl:when test="contains($codePacs,'45.40.Cc')">Rigid body and gyroscope motion</xsl:when>
                            <xsl:when test="contains($codePacs,'45.50.Pk')">Celestial mechanics</xsl:when>
                            <xsl:when test="contains($codePacs,'45.50.Tn')">Collisions</xsl:when>
                            <xsl:when test="contains($codePacs,'45.70.Mg')">Granular flow: mixing, segregation and stratification</xsl:when>
                            <xsl:when test="contains($codePacs,'46.00.00')">Continuum mechanics of solids</xsl:when>
                            <xsl:when test="contains($codePacs,'46.40.Ff')">Resonance, damping, and dynamic stability</xsl:when>
                            <xsl:when test="contains($codePacs,'47.00.00')">Fluid dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'47.10.+g')">General theory</xsl:when>
                            <xsl:when test="contains($codePacs,'47.10.-g')">General theory in fluid dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'47.10.A-')">Mathematical formulations</xsl:when>
                            <xsl:when test="contains($codePacs,'47.10.ab')">Conservation laws and constitutive relations</xsl:when>
                            <xsl:when test="contains($codePacs,'47.10.ad')">Navier-Stokes equations</xsl:when>
                            <xsl:when test="contains($codePacs,'47.11.-j')">Computational methods in fluid dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'47.15.-x')">Laminar flows</xsl:when>
                            <xsl:when test="contains($codePacs,'47.15.G-')">Low-Reynolds-number (creeping) flows</xsl:when>
                            <xsl:when test="contains($codePacs,'47.20.-k')">Flow instabilities</xsl:when>
                            <xsl:when test="contains($codePacs,'47.20.Bp')">Buoyancy-driven instabilities (e.g., Rayleigh-Benard)</xsl:when>
                            <xsl:when test="contains($codePacs,'47.20.Dr')">Surface-tension-driven instability</xsl:when>
                            <xsl:when test="contains($codePacs,'47.20.Ft')">Instability of shear flows (e.g., Kelvin-Helmholtz)</xsl:when>
                            <xsl:when test="contains($codePacs,'47.20.Ib')">Instability of boundary layers; separation</xsl:when>
                            <xsl:when test="contains($codePacs,'47.20.Ky')">Nonlinearity, bifurcation, and symmetry breaking</xsl:when>
                            <xsl:when test="contains($codePacs,'47.20.Qr')">Centrifugal instabilities (e.g., Taylor-Couette flow)</xsl:when>
                            <xsl:when test="contains($codePacs,'47.27.-i')">Turbulent flows</xsl:when>
                            <xsl:when test="contains($codePacs,'47.27.Ak')">Fundamentals</xsl:when>
                            <xsl:when test="contains($codePacs,'47.27.Cn')">Transition to turbulence</xsl:when>
                            <xsl:when test="contains($codePacs,'47.27.De')">Coherent structures</xsl:when>
                            <xsl:when test="contains($codePacs,'47.27.E-')">Turbulence simulation and modeling</xsl:when>
                            <xsl:when test="contains($codePacs,'47.27.Gs')">Isotropic turbulence; homogeneous turbulence</xsl:when>
                            <xsl:when test="contains($codePacs,'47.27.Jv')">High-Reynolds-number turbulence</xsl:when>
                            <xsl:when test="contains($codePacs,'47.27.Qb')">Turbulent diffusion</xsl:when>
                            <xsl:when test="contains($codePacs,'47.27.ed')">Dynamical systems approaches</xsl:when>
                            <xsl:when test="contains($codePacs,'47.27.ef')">Field-theoretic formulations and renormalization</xsl:when>
                            <xsl:when test="contains($codePacs,'47.27.er')">Spectral methods</xsl:when>
                            <xsl:when test="contains($codePacs,'47.32.-y')">Vortex dynamics; rotating fluids</xsl:when>
                            <xsl:when test="contains($codePacs,'47.32.C-')">Vortex dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'47.32.Ef')">Rotating and swirling flows</xsl:when>
                            <xsl:when test="contains($codePacs,'47.32.cd')">Vortex stability and breakdown</xsl:when>
                            <xsl:when test="contains($codePacs,'47.35.+i')">Hydrodynamic waves</xsl:when>
                            <xsl:when test="contains($codePacs,'47.35.Bb')">Gravity waves</xsl:when>
                            <xsl:when test="contains($codePacs,'47.35.De')">Shear waves</xsl:when>
                            <xsl:when test="contains($codePacs,'47.35.Fg')">Solitary waves</xsl:when>
                            <xsl:when test="contains($codePacs,'47.35.Pq')">Capillary waves</xsl:when>
                            <xsl:when test="contains($codePacs,'47.35.Rs')">Sound waves</xsl:when>
                            <xsl:when test="contains($codePacs,'47.37.+q')">Hydrodynamic aspects of superfluidity; quantum fluids</xsl:when>
                            <xsl:when test="contains($codePacs,'47.40.-x')">Compressible flows; shock waves</xsl:when>
                            <xsl:when test="contains($codePacs,'47.40.Dc')">General subsonic flows</xsl:when>
                            <xsl:when test="contains($codePacs,'47.40.Hg')">Transonic flows</xsl:when>
                            <xsl:when test="contains($codePacs,'47.40.Ki')">Supersonic and hypersonic flows</xsl:when>
                            <xsl:when test="contains($codePacs,'47.40.Nm')">Shock wave interactions and shock effects</xsl:when>
                            <xsl:when test="contains($codePacs,'47.40.Rs')">Detonation waves</xsl:when>
                            <xsl:when test="contains($codePacs,'47.45.Ab')">Kinetic theory of gases</xsl:when>
                            <xsl:when test="contains($codePacs,'47.45.Gx')">Slip flows and accommodation</xsl:when>
                            <xsl:when test="contains($codePacs,'47.52.+j')">Chaos in fluid dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'47.53.+n')">Fractals in fluid dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'47.55.D-')">Drops and bubbles</xsl:when>
                            <xsl:when test="contains($codePacs,'47.55.dp')">Cavitation and boiling</xsl:when>
                            <xsl:when test="contains($codePacs,'47.55.dr')">Interactions with surfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'47.55.pb')">Thermal convection</xsl:when>
                            <xsl:when test="contains($codePacs,'47.56.+r')">Flows through porous media</xsl:when>
                            <xsl:when test="contains($codePacs,'47.60.+i')">Flows in ducts, channels, nozzles, and conduits</xsl:when>
                            <xsl:when test="contains($codePacs,'47.63.Gd')">Swimming microorganisms</xsl:when>
                            <xsl:when test="contains($codePacs,'47.65.-d')">Magnetohydrodynamics and electrohydrodynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'47.65.Md')">Plasma dynamos</xsl:when>
                            <xsl:when test="contains($codePacs,'47.70.Fw')">Chemically reactive flows</xsl:when>
                            <xsl:when test="contains($codePacs,'47.70.Pq')">Flames; combustion</xsl:when>
                            <xsl:when test="contains($codePacs,'47.80.-v')">Instrumentation and measurement methods in fluid dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'47.80.Cb')">Velocity measurements</xsl:when>
                            <xsl:when test="contains($codePacs,'47.80.Fg')">Pressure and temperature measurements</xsl:when>
                            <xsl:when test="contains($codePacs,'47.80.Jk')">Flow visualization</xsl:when>
                            <xsl:when test="contains($codePacs,'47.85.Dh')">Hydrodynamics, hydraulics, hydrostatics</xsl:when>
                            <xsl:when test="contains($codePacs,'47.85.Gj')">Aerodynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'51.00.00')">Physics of gases</xsl:when>
                            <xsl:when test="contains($codePacs,'51.10.+y')">Kinetic and transport theory of gases</xsl:when>
                            <xsl:when test="contains($codePacs,'51.20.+d')">Viscosity, diffusion, and thermal conductivity</xsl:when>
                            <xsl:when test="contains($codePacs,'51.30.+i')">Thermodynamic properties, equations of state</xsl:when>
                            <xsl:when test="contains($codePacs,'51.40.+p')">Acoustical properties</xsl:when>
                            <xsl:when test="contains($codePacs,'51.50.+v')">Electrical properties</xsl:when>
                            <xsl:when test="contains($codePacs,'51.70.+f')">Optical and dielectric properties</xsl:when>
                            <xsl:when test="contains($codePacs,'52.00.00')">Physics of plasmas and electric discharges</xsl:when>
                            <xsl:when test="contains($codePacs,'52.20.-j')">Elementary processes in plasmas</xsl:when>
                            <xsl:when test="contains($codePacs,'52.20.Dq')">Particle orbits</xsl:when>
                            <xsl:when test="contains($codePacs,'52.20.Fs')">Electron collisions</xsl:when>
                            <xsl:when test="contains($codePacs,'52.20.Hv')">Atomic, molecular, ion, and heavy-particle collisions</xsl:when>
                            <xsl:when test="contains($codePacs,'52.25.-b')">Plasma properties</xsl:when>
                            <xsl:when test="contains($codePacs,'52.25.Dg')">Plasma kinetic equations</xsl:when>
                            <xsl:when test="contains($codePacs,'52.25.Fi')">Transport properties</xsl:when>
                            <xsl:when test="contains($codePacs,'52.25.Gj')">Fluctuation and chaos phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'52.25.Jm')">Ionization of plasmas</xsl:when>
                            <xsl:when test="contains($codePacs,'52.25.Kn')">Thermodynamics of plasmas</xsl:when>
                            <xsl:when test="contains($codePacs,'52.25.Mq')">Dielectric properties</xsl:when>
                            <xsl:when test="contains($codePacs,'52.25.Os')">Emission, absorption, and scattering of electromagnetic radiation</xsl:when>
                            <xsl:when test="contains($codePacs,'52.25.Tx')">Emission, absorption, and scattering of particles</xsl:when>
                            <xsl:when test="contains($codePacs,'52.25.Vy')">Impurities in plasmas</xsl:when>
                            <xsl:when test="contains($codePacs,'52.25.Xz')">Magnetized plasmas</xsl:when>
                            <xsl:when test="contains($codePacs,'52.27.Cm')">Multicomponent and negative-ion plasmas</xsl:when>
                            <xsl:when test="contains($codePacs,'52.27.Ep')">Electron-positron plasmas</xsl:when>
                            <xsl:when test="contains($codePacs,'52.27.Gr')">Strongly-coupled plasmas</xsl:when>
                            <xsl:when test="contains($codePacs,'52.27.Lw')">Dusty or complex plasmas; plasma crystals</xsl:when>
                            <xsl:when test="contains($codePacs,'52.27.Ny')">Relativistic plasmas</xsl:when>
                            <xsl:when test="contains($codePacs,'52.30.-q')">Plasma dynamics and flow</xsl:when>
                            <xsl:when test="contains($codePacs,'52.30.Cv')">Magnetohydrodynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'52.35.-g')">Waves, oscillations, and instabilities in plasmas and intense beams</xsl:when>
                            <xsl:when test="contains($codePacs,'52.35.Bj')">Magnetohydrodynamic waves (e.g., Alfven waves)</xsl:when>
                            <xsl:when test="contains($codePacs,'52.35.Dm')">Sound waves</xsl:when>
                            <xsl:when test="contains($codePacs,'52.35.Fp')">Electrostatic waves and oscillations (e.g., ion-acoustic waves)</xsl:when>
                            <xsl:when test="contains($codePacs,'52.35.Hr')">Electromagnetic waves (e.g., electron-cyclotron, Whistler, Bernstein, upper hybrid, lower hybrid)</xsl:when>
                            <xsl:when test="contains($codePacs,'52.35.Kt')">Drift waves</xsl:when>
                            <xsl:when test="contains($codePacs,'52.35.Mw')">Nonlinear phenomena: waves, wave propagation, and other interactions (including parametric effects, mode coupling, ponderomotive effects, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'52.35.Py')">Macroinstabilities (hydromagnetic, e.g., kink, fire-hose, mirror, ballooning, tearing, trapped-particle, flute, Rayleigh-Taylor, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'52.35.Qz')">Microinstabilities (ion-acoustic, two-stream, loss-cone, beam-plasma, drift, ion- or electron-cyclotron, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'52.35.Ra')">Plasma turbulence</xsl:when>
                            <xsl:when test="contains($codePacs,'52.35.Sb')">Solitons; BGK modes</xsl:when>
                            <xsl:when test="contains($codePacs,'52.35.Tc')">Shock waves and discontinuities</xsl:when>
                            <xsl:when test="contains($codePacs,'52.35.We')">Plasma vorticity</xsl:when>
                            <xsl:when test="contains($codePacs,'52.38.-r')">Laser-plasma interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'52.38.Bv')">Rayleigh scattering; stimulated Brillouin and Raman scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'52.38.Dx')">Laser light absorption in plasmas (collisional, parametric, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'52.38.Hb')">Self-focussing, channeling, and filamentation in plasmas</xsl:when>
                            <xsl:when test="contains($codePacs,'52.38.Kd')">Laser-plasma acceleration of electrons and ions</xsl:when>
                            <xsl:when test="contains($codePacs,'52.38.Ph')">X-ray, γ-ray, and particle generation</xsl:when>
                            <xsl:when test="contains($codePacs,'52.40.-w')">Plasma interactions (nonlaser)</xsl:when>
                            <xsl:when test="contains($codePacs,'52.40.Db')">Electromagnetic</xsl:when>
                            <xsl:when test="contains($codePacs,'52.40.Fd')">Plasma interactions with antennas; plasma-filled waveguides</xsl:when>
                            <xsl:when test="contains($codePacs,'52.40.Hf')">Plasma-material interactions; boundary layer effects</xsl:when>
                            <xsl:when test="contains($codePacs,'52.40.Kh')">Plasma sheaths</xsl:when>
                            <xsl:when test="contains($codePacs,'52.40.Mj')">Particle beam interactions in plasmas</xsl:when>
                            <xsl:when test="contains($codePacs,'52.50.-b')">Plasma production and heating</xsl:when>
                            <xsl:when test="contains($codePacs,'52.50.Dg')">Plasma sources</xsl:when>
                            <xsl:when test="contains($codePacs,'52.50.Gj')">Plasma heating by particle beams</xsl:when>
                            <xsl:when test="contains($codePacs,'52.50.Jm')">Plasma production and heating by laser beams (laser-foil, laser-cluster, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'52.50.Lp')">Plasma production and heating by shock waves and compression</xsl:when>
                            <xsl:when test="contains($codePacs,'52.50.Qt')">Plasma heating by radio-frequency fields; ICR, ICP, helicons</xsl:when>
                            <xsl:when test="contains($codePacs,'52.50.Sw')">Plasma heating by microwaves; ECR, LH, collisional heating</xsl:when>
                            <xsl:when test="contains($codePacs,'52.55.-s')">Magnetic confinement and equilibrium</xsl:when>
                            <xsl:when test="contains($codePacs,'52.55.Dy')">General theory and basic studies of plasma lifetime, particle and heat loss, energy balance, field structure, etc.</xsl:when>
                            <xsl:when test="contains($codePacs,'52.55.Ez')">Theta pinch</xsl:when>
                            <xsl:when test="contains($codePacs,'52.55.Fa')">Tokamaks, spherical tokamaks</xsl:when>
                            <xsl:when test="contains($codePacs,'52.55.Hc')">Stellarators, torsatrons, heliacs, bumpy tori, and other toroidal confinement devices</xsl:when>
                            <xsl:when test="contains($codePacs,'52.55.Ip')">Spheromaks</xsl:when>
                            <xsl:when test="contains($codePacs,'52.55.Jd')">Magnetic mirrors, gas dynamic traps</xsl:when>
                            <xsl:when test="contains($codePacs,'52.55.Lf')">Field-reversed configurations, rotamaks, astrons, ion rings, magnetized target fusion, and cusps</xsl:when>
                            <xsl:when test="contains($codePacs,'52.55.Pi')">Fusion products effects (e.g., alpha-particles, etc.), fast particle effects</xsl:when>
                            <xsl:when test="contains($codePacs,'52.55.Rk')">Power exhaust; divertors</xsl:when>
                            <xsl:when test="contains($codePacs,'52.55.Tn')">Ideal and resistive MHD modes; kinetic modes</xsl:when>
                            <xsl:when test="contains($codePacs,'52.57.-z')">Laser inertial confinement</xsl:when>
                            <xsl:when test="contains($codePacs,'52.58.Lq')">Z-pinches, plasma focus, and other pinch devices</xsl:when>
                            <xsl:when test="contains($codePacs,'52.59.-f')">Intense particle beams and radiation sources</xsl:when>
                            <xsl:when test="contains($codePacs,'52.65.-y')">Plasma simulation</xsl:when>
                            <xsl:when test="contains($codePacs,'52.65.Ff')">Fokker-Planck and Vlasov equation</xsl:when>
                            <xsl:when test="contains($codePacs,'52.65.Kj')">Magnetohydrodynamic and fluid equation</xsl:when>
                            <xsl:when test="contains($codePacs,'52.65.Vv')">Perturbative methods</xsl:when>
                            <xsl:when test="contains($codePacs,'52.70.-m')">Plasma diagnostic techniques and instrumentation</xsl:when>
                            <xsl:when test="contains($codePacs,'52.70.Ds')">Electric and magnetic measurements</xsl:when>
                            <xsl:when test="contains($codePacs,'52.70.Gw')">Radio-frequency and microwave measurements</xsl:when>
                            <xsl:when test="contains($codePacs,'52.70.Kz')">Optical (ultraviolet, visible, infrared) measurements</xsl:when>
                            <xsl:when test="contains($codePacs,'52.75.-d')">Plasma devices</xsl:when>
                            <xsl:when test="contains($codePacs,'52.75.Di')">Ion and plasma propulsion</xsl:when>
                            <xsl:when test="contains($codePacs,'52.75.Fk')">Magnetohydrodynamic generators and thermionic convertors; plasma diodes</xsl:when>
                            <xsl:when test="contains($codePacs,'52.77.-j')">Plasma applications</xsl:when>
                            <xsl:when test="contains($codePacs,'52.80.-s')">Electric discharges</xsl:when>
                            <xsl:when test="contains($codePacs,'52.80.Dy')">Low-field and Townsend discharges</xsl:when>
                            <xsl:when test="contains($codePacs,'52.80.Hc')">Glow; corona</xsl:when>
                            <xsl:when test="contains($codePacs,'52.80.Mg')">Arcs; sparks; lightning; atmospheric electricity</xsl:when>
                            <xsl:when test="contains($codePacs,'52.80.Pi')">High-frequency and RF discharges</xsl:when>
                            <xsl:when test="contains($codePacs,'52.80.Qj')">Explosions; exploding wires</xsl:when>
                            <xsl:when test="contains($codePacs,'52.80.Tn')">Other gas discharges</xsl:when>
                            <xsl:when test="contains($codePacs,'52.80.Vp')">Discharge in vacuum</xsl:when>
                            <xsl:when test="contains($codePacs,'52.80.Wq')">Discharge in liquids and solids</xsl:when>
                            <xsl:when test="contains($codePacs,'52.90.+z')">Other topics in physics of plasmas and electric discharges</xsl:when>
                            <xsl:when test="contains($codePacs,'61.00.00')">Structure of solids and liquids; crystallography</xsl:when>
                            <xsl:when test="contains($codePacs,'61.05.-a')">Techniques for structure determination</xsl:when>
                            <xsl:when test="contains($codePacs,'61.05.C-')">X-ray diffraction and scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'61.05.F-')">Neutron diffraction and scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'61.05.fg')">Neutron scattering (including small-angle scattering)</xsl:when>
                            <xsl:when test="contains($codePacs,'61.10.-i')">X-ray diffraction and scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'61.10.Eq')">X-ray scattering (including small-angle scattering)</xsl:when>
                            <xsl:when test="contains($codePacs,'61.10.Ht')">X-ray absorption spectroscopy: EXAFS, NEXAFS, XANES, etc.</xsl:when>
                            <xsl:when test="contains($codePacs,'61.10.Kw')">X-ray reflectometry (surfaces, interfaces, films)</xsl:when>
                            <xsl:when test="contains($codePacs,'61.10.Nz')">X-ray diffraction</xsl:when>
                            <xsl:when test="contains($codePacs,'61.12.-q')">Neutron diffraction and scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'61.12.Bt')">Theories of diffraction and scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'61.12.Ex')">Neutron scattering (including small-angle scattering)</xsl:when>
                            <xsl:when test="contains($codePacs,'61.12.Ld')">Neutron diffraction</xsl:when>
                            <xsl:when test="contains($codePacs,'61.14.-x')">Electron diffraction and scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'61.14.Dc')">Theories of diffraction and scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'61.14.Hg')">Low-energy electron diffraction (LEED) and reflection high-energy electron diffraction (RHEED)</xsl:when>
                            <xsl:when test="contains($codePacs,'61.20.-p')">Structure of liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'61.20.Gy')">Theory and models of liquid structure</xsl:when>
                            <xsl:when test="contains($codePacs,'61.20.Ja')">Computer simulation of liquid structure</xsl:when>
                            <xsl:when test="contains($codePacs,'61.20.Lc')">Time-dependent properties; relaxation</xsl:when>
                            <xsl:when test="contains($codePacs,'61.20.Ne')">Structure of simple liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'61.25.-f')">Studies of specific liquid structures</xsl:when>
                            <xsl:when test="contains($codePacs,'61.25.Hq')">Macromolecular and polymer solutions; polymer melts; swelling</xsl:when>
                            <xsl:when test="contains($codePacs,'61.25.Mv')">Liquid metals and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'61.30.-v')">Liquid crystals</xsl:when>
                            <xsl:when test="contains($codePacs,'61.30.Cz')">Molecular and microscopic models and theories of liquid crystal structure</xsl:when>
                            <xsl:when test="contains($codePacs,'61.30.Dk')">Continuum models and theories of liquid crystal structure</xsl:when>
                            <xsl:when test="contains($codePacs,'61.30.Eb')">Experimental determinations of smectic, nematic, cholesteric, and other structures</xsl:when>
                            <xsl:when test="contains($codePacs,'61.30.Gd')">Orientational order of liquid crystals; electric and magnetic field effects on order</xsl:when>
                            <xsl:when test="contains($codePacs,'61.30.Hn')">Surface phenomena: alignment, anchoring, anchoring transitions, surface-induced layering, surface-induced ordering, wetting, prewetting transitions, and wetting transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'61.30.Jf')">Defects in liquid crystals</xsl:when>
                            <xsl:when test="contains($codePacs,'61.30.Mp')">Blue phases and other defect-phases</xsl:when>
                            <xsl:when test="contains($codePacs,'61.30.St')">Lyotropic phases</xsl:when>
                            <xsl:when test="contains($codePacs,'61.30.Vx')">Polymer liquid crystals</xsl:when>
                            <xsl:when test="contains($codePacs,'61.41.+e')">Polymers, elastomers, and plastics</xsl:when>
                            <xsl:when test="contains($codePacs,'61.43.-j')">Disordered solids</xsl:when>
                            <xsl:when test="contains($codePacs,'61.43.Bn')">Structural modeling: serial-addition models, computer simulation</xsl:when>
                            <xsl:when test="contains($codePacs,'61.43.Dq')">Amorphous semiconductors, metals, and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'61.43.Er')">Other amorphous solids</xsl:when>
                            <xsl:when test="contains($codePacs,'61.43.Fs')">Glasses</xsl:when>
                            <xsl:when test="contains($codePacs,'61.43.Gt')">Powders, porous materials</xsl:when>
                            <xsl:when test="contains($codePacs,'61.43.Hv')">Fractals; macroscopic aggregates (including diffusion-limited aggregates)</xsl:when>
                            <xsl:when test="contains($codePacs,'61.44.-n')">Semi-periodic solids</xsl:when>
                            <xsl:when test="contains($codePacs,'61.44.Br')">Quasicrystals</xsl:when>
                            <xsl:when test="contains($codePacs,'61.44.Fw')">Incommensurate crystals</xsl:when>
                            <xsl:when test="contains($codePacs,'61.46.+w')">Nanoscale materials: clusters, nanoparticles, nanotubes, and nanocrystals</xsl:when>
                            <xsl:when test="contains($codePacs,'61.46.-w')">Structure of nanoscale materials</xsl:when>
                            <xsl:when test="contains($codePacs,'61.46.Bc')">Structure of clusters (e.g., metcars; not fragments of crystals; free or loosely aggregated or loosely attached to a substrate)</xsl:when>
                            <xsl:when test="contains($codePacs,'61.46.Df')">Structure of nanocrystals and nanoparticles ("colloidal" quantum dots but not gate-isolated embedded quantum dots)</xsl:when>
                            <xsl:when test="contains($codePacs,'61.46.Np')">Structure of nanotubes (hollow nanowires)</xsl:when>
                            <xsl:when test="contains($codePacs,'61.48.+c')">Fullerenes and fullerene-related materials</xsl:when>
                            <xsl:when test="contains($codePacs,'61.48.-c')">Structure of fullerenes and related hollow and planar molecular structures</xsl:when>
                            <xsl:when test="contains($codePacs,'61.48.De')">Structure of carbon nanotubes, boron nanotubes, and other related systems</xsl:when>
                            <xsl:when test="contains($codePacs,'61.50.-f')">Structure of bulk crystals</xsl:when>
                            <xsl:when test="contains($codePacs,'61.50.Ah')">Theory of crystal structure, crystal symmetry; calculations and modeling</xsl:when>
                            <xsl:when test="contains($codePacs,'61.50.Ks')">Crystallographic aspects of phase transformations; pressure effects</xsl:when>
                            <xsl:when test="contains($codePacs,'61.50.Lt')">Crystal binding; cohesive energy</xsl:when>
                            <xsl:when test="contains($codePacs,'61.50.Nw')">Crystal stoichiometry</xsl:when>
                            <xsl:when test="contains($codePacs,'61.66.-f')">Structure of specific crystalline solids</xsl:when>
                            <xsl:when test="contains($codePacs,'61.66.Bi')">Elemental solids</xsl:when>
                            <xsl:when test="contains($codePacs,'61.66.Dk')">Alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'61.66.Fn')">Inorganic compounds</xsl:when>
                            <xsl:when test="contains($codePacs,'61.66.Hq')">Organic compounds</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.-y')">Defects and impurities in crystals; microstructure</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.Bb')">Theories and models of crystal defects</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.Cc')">Kinetics of defect formation and annealing</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.Ff')">Direct observation of dislocations and other defects (etch pits, decoration, electron microscopy, x-ray topography, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.Hh')">Indirect evidence of dislocations and other defects (resistivity, slip, creep, strains, internal friction, EPR, NMR, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.Ji')">Point defects (vacancies, interstitials, color centers, etc.) and defect clusters</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.Lk')">Linear defects: dislocations, disclinations</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.Mm')">Grain and twin boundaries</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.Nn')">Stacking faults and other planar or extended defects</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.Ss')">Impurity concentration, distribution, and gradients</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.Tt')">Doping and impurity implantation in germanium and silicon</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.Vv')">Doping and impurity implantation in III-V and II-VI semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.Ww')">Doping and impurity implantation in other materials</xsl:when>
                            <xsl:when test="contains($codePacs,'61.72.Yx')">Interaction between different crystal defects; gettering effect</xsl:when>
                            <xsl:when test="contains($codePacs,'61.80.-x')">Physical radiation effects, radiation damage</xsl:when>
                            <xsl:when test="contains($codePacs,'61.80.Az')">Theory and models of radiation effects</xsl:when>
                            <xsl:when test="contains($codePacs,'61.80.Ba')">Ultraviolet, visible, and infrared radiation effects (including laser radiation)</xsl:when>
                            <xsl:when test="contains($codePacs,'61.80.Ed')">γ-ray effects</xsl:when>
                            <xsl:when test="contains($codePacs,'61.80.Fe')">Electron and positron radiation effects</xsl:when>
                            <xsl:when test="contains($codePacs,'61.80.Hg')">Neutron radiation effects</xsl:when>
                            <xsl:when test="contains($codePacs,'61.80.Jh')">Ion radiation effects</xsl:when>
                            <xsl:when test="contains($codePacs,'61.80.Lj')">Atom and molecule irradiation effects</xsl:when>
                            <xsl:when test="contains($codePacs,'61.82.Bg')">Metals and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'61.82.Fk')">Semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'61.82.Ms')">Insulators</xsl:when>
                            <xsl:when test="contains($codePacs,'61.82.Pv')">Polymers, organic compounds</xsl:when>
                            <xsl:when test="contains($codePacs,'61.85.+p')">Channeling phenomena (blocking, energy loss, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'61.90.+d')">Other topics in structure of solids and liquids; crystallography</xsl:when>
                            <xsl:when test="contains($codePacs,'62.00.00')">Mechanical and acoustical properties of condensed matter</xsl:when>
                            <xsl:when test="contains($codePacs,'62.10.+s')">Mechanical properties of liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'62.20.-x')">Mechanical properties of solids</xsl:when>
                            <xsl:when test="contains($codePacs,'62.20.Dc')">Elasticity, elastic constants</xsl:when>
                            <xsl:when test="contains($codePacs,'62.20.Fe')">Deformation and plasticity</xsl:when>
                            <xsl:when test="contains($codePacs,'62.20.Hg')">Creep</xsl:when>
                            <xsl:when test="contains($codePacs,'62.20.Mk')">Fatigue, brittleness, fracture, and cracks</xsl:when>
                            <xsl:when test="contains($codePacs,'62.20.Qp')">Friction, tribology, and hardness</xsl:when>
                            <xsl:when test="contains($codePacs,'62.25.-g')">Mechanical properties of nanoscale systems</xsl:when>
                            <xsl:when test="contains($codePacs,'62.25.Fg')">High-frequency properties, responses to resonant or transient (time-dependent) fields</xsl:when>
                            <xsl:when test="contains($codePacs,'62.30.+d')">Mechanical and elastic waves; vibrations</xsl:when>
                            <xsl:when test="contains($codePacs,'62.40.+i')">Anelasticity, internal friction, stress relaxation, and mechanical resonances</xsl:when>
                            <xsl:when test="contains($codePacs,'62.50.+p')">High-pressure and shock wave effects in solids and liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'62.50.-p')">High-pressure effects in solids and liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'62.60.+v')">Acoustical properties of liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'62.65.+k')">Acoustical properties of solids</xsl:when>
                            <xsl:when test="contains($codePacs,'63.00.00')">Lattice dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'63.20.-e')">Phonons in crystal lattices</xsl:when>
                            <xsl:when test="contains($codePacs,'63.20.Dj')">Phonon states and bands, normal modes, and phonon dispersion</xsl:when>
                            <xsl:when test="contains($codePacs,'63.20.Kr')">Phonon-electron and phonon-phonon interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'63.20.Ls')">Phonon interactions with other quasiparticles</xsl:when>
                            <xsl:when test="contains($codePacs,'63.20.Mt')">Phonon-defect interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'63.20.Pw')">Localized modes</xsl:when>
                            <xsl:when test="contains($codePacs,'63.20.Ry')">Anharmonic lattice modes</xsl:when>
                            <xsl:when test="contains($codePacs,'63.20.dk')">First-principles theory</xsl:when>
                            <xsl:when test="contains($codePacs,'63.20.kd')">Phonon-electron interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'63.20.kp')">Phonon-defect interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'63.50.+x')">Vibrational states in disordered systems</xsl:when>
                            <xsl:when test="contains($codePacs,'63.70.+h')">Statistical mechanics of lattice vibrations and displacive phase transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'63.90.+t')">Other topics in lattice dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'64.00.00')">Equations of state, phase equilibria, and phase transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'64.10.+h')">General theory of equations of state and phase equilibria</xsl:when>
                            <xsl:when test="contains($codePacs,'64.30.+t')">Equations of state of specific substances</xsl:when>
                            <xsl:when test="contains($codePacs,'64.60.-i')">General studies of phase transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'64.60.Ak')">Renormalization-group, fractal, and percolation studies of phase transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'64.60.Cn')">Order-disorder transformations</xsl:when>
                            <xsl:when test="contains($codePacs,'64.60.Fr')">Equilibrium properties near critical points, critical exponents</xsl:when>
                            <xsl:when test="contains($codePacs,'64.60.Ht')">Dynamic critical phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'64.60.Kw')">Multicritical points</xsl:when>
                            <xsl:when test="contains($codePacs,'64.60.My')">Metastable phases</xsl:when>
                            <xsl:when test="contains($codePacs,'64.60.Qb')">Nucleation</xsl:when>
                            <xsl:when test="contains($codePacs,'64.60.ae')">Renormalization-group theory</xsl:when>
                            <xsl:when test="contains($codePacs,'64.70.-p')">Specific phase transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'64.70.D-')">Solid-liquid transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'64.70.Dv')">Solid-liquid transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'64.70.Fx')">Liquid-vapor transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'64.70.Hz')">Solid-vapor transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'64.70.Ja')">Liquid-liquid transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'64.70.Kb')">Solid-solid transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'64.70.Md')">Transitions in liquid crystals</xsl:when>
                            <xsl:when test="contains($codePacs,'64.70.P-')">Glass transitions of specific systems</xsl:when>
                            <xsl:when test="contains($codePacs,'64.70.Pf')">Glass transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'64.70.Rh')">Commensurate-incommensurate transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'64.75.+g')">Solubility, segregation, and mixing; phase separation</xsl:when>
                            <xsl:when test="contains($codePacs,'65.00.00')">Thermal properties of condensed matter</xsl:when>
                            <xsl:when test="contains($codePacs,'65.20.+w')">Thermal properties of liquids: heat capacity, thermal expansion, etc.</xsl:when>
                            <xsl:when test="contains($codePacs,'65.40.-b')">Thermal properties of crystalline solids</xsl:when>
                            <xsl:when test="contains($codePacs,'65.40.Ba')">Heat capacity</xsl:when>
                            <xsl:when test="contains($codePacs,'65.40.De')">Thermal expansion; thermomechanical effects</xsl:when>
                            <xsl:when test="contains($codePacs,'65.40.Gr')">Entropy and other thermodynamical quantities</xsl:when>
                            <xsl:when test="contains($codePacs,'65.60.+a')">Thermal properties of amorphous solids and glasses: heat capacity, thermal expansion, etc.</xsl:when>
                            <xsl:when test="contains($codePacs,'65.80.+n')">Thermal properties of small particles, nanocrystals, and nanotubes</xsl:when>
                            <xsl:when test="contains($codePacs,'65.80.Ck')">Thermal properties of graphene</xsl:when>
                            <xsl:when test="contains($codePacs,'66.00.00')">Nonelectronic transport properties of condensed matter</xsl:when>
                            <xsl:when test="contains($codePacs,'66.10.Cb')">Diffusion and thermal diffusion</xsl:when>
                            <xsl:when test="contains($codePacs,'66.10.Ed')">Ionic conduction</xsl:when>
                            <xsl:when test="contains($codePacs,'66.20.+d')">Viscosity of liquids; diffusive momentum transport</xsl:when>
                            <xsl:when test="contains($codePacs,'66.20.-d')">Viscosity of liquids; diffusive momentum transport</xsl:when>
                            <xsl:when test="contains($codePacs,'66.30.-h')">Diffusion in solids</xsl:when>
                            <xsl:when test="contains($codePacs,'66.30.Dn')">Theory of diffusion and ionic conduction in solids</xsl:when>
                            <xsl:when test="contains($codePacs,'66.30.Fq')">Self-diffusion in metals, semimetals, and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'66.30.Hs')">Self-diffusion and ionic conduction in nonmetals</xsl:when>
                            <xsl:when test="contains($codePacs,'66.30.Jt')">Diffusion of impurities</xsl:when>
                            <xsl:when test="contains($codePacs,'66.30.Lw')">Diffusion of other defects</xsl:when>
                            <xsl:when test="contains($codePacs,'66.70.+f')">Nonelectronic thermal conduction and heat-pulse propagation in solids; thermal waves</xsl:when>
                            <xsl:when test="contains($codePacs,'67.00.00')">Quantum fluids and solids</xsl:when>
                            <xsl:when test="contains($codePacs,'67.20.+k')">Quantum effects on the structure and dynamics of nondegenerate fluids (e.g., normal phase liquid 4He)</xsl:when>
                            <xsl:when test="contains($codePacs,'67.30.er')">Magnetic properties, NMR</xsl:when>
                            <xsl:when test="contains($codePacs,'67.40.-w')">Boson degeneracy and superfluidity of 4He</xsl:when>
                            <xsl:when test="contains($codePacs,'67.40.Bz')">Phenomenology and two-fluid models</xsl:when>
                            <xsl:when test="contains($codePacs,'67.40.Fd')">Dynamics of relaxation phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'67.40.Hf')">Hydrodynamics in specific geometries, flow in narrow channels</xsl:when>
                            <xsl:when test="contains($codePacs,'67.40.Jg')">Ions in liquid 4He</xsl:when>
                            <xsl:when test="contains($codePacs,'67.40.Kh')">Thermodynamic properties</xsl:when>
                            <xsl:when test="contains($codePacs,'67.40.Mj')">First sound</xsl:when>
                            <xsl:when test="contains($codePacs,'67.40.Pm')">Transport processes, second and other sounds, and thermal counterflow; Kapitza resistance</xsl:when>
                            <xsl:when test="contains($codePacs,'67.40.Vs')">Vortices and turbulence</xsl:when>
                            <xsl:when test="contains($codePacs,'67.55.-s')">Normal phase of liquid 3He</xsl:when>
                            <xsl:when test="contains($codePacs,'67.55.Cx')">Thermodynamic properties</xsl:when>
                            <xsl:when test="contains($codePacs,'67.55.Fa')">Hydrodynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'67.55.Hc')">Transport properties</xsl:when>
                            <xsl:when test="contains($codePacs,'67.57.-z')">Superfluid phase of liquid 3He</xsl:when>
                            <xsl:when test="contains($codePacs,'67.57.Bc')">Thermodynamic properties</xsl:when>
                            <xsl:when test="contains($codePacs,'67.57.De')">Superflow and hydrodynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'67.57.Fg')">Textures and vortices</xsl:when>
                            <xsl:when test="contains($codePacs,'67.57.Hi')">Transport properties</xsl:when>
                            <xsl:when test="contains($codePacs,'67.57.Jj')">Collective modes</xsl:when>
                            <xsl:when test="contains($codePacs,'67.57.Lm')">Spin dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'67.60.-g')">Mixtures of 3He and 4He</xsl:when>
                            <xsl:when test="contains($codePacs,'67.60.Dm')">HeI-3He</xsl:when>
                            <xsl:when test="contains($codePacs,'67.70.+n')">Films (including physical adsorption)</xsl:when>
                            <xsl:when test="contains($codePacs,'67.80.-s')">Quantum solids</xsl:when>
                            <xsl:when test="contains($codePacs,'67.80.Cx')">Structure, lattice dynamics, and sound propagation</xsl:when>
                            <xsl:when test="contains($codePacs,'67.80.Gb')">Thermal properties</xsl:when>
                            <xsl:when test="contains($codePacs,'67.80.Jd')">Magnetic properties and nuclear magnetic resonance</xsl:when>
                            <xsl:when test="contains($codePacs,'67.80.Mg')">Defects, impurities, and diffusion</xsl:when>
                            <xsl:when test="contains($codePacs,'67.85.-d')">Ultracold gases, trapped gases</xsl:when>
                            <xsl:when test="contains($codePacs,'67.90.+z')">Other topics in quantum fluids and solids</xsl:when>
                            <xsl:when test="contains($codePacs,'68.00.00')">Surfaces and interfaces; thin films and nanosystems (structure and nonelectronic properties)</xsl:when>
                            <xsl:when test="contains($codePacs,'68.03.Cd')">Surface tension and related phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'68.03.Fg')">Evaporation and condensation of liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'68.03.Hj')">Liquid surface structure: measurements and simulations</xsl:when>
                            <xsl:when test="contains($codePacs,'68.05.-n')">Liquid-liquid interfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'68.08.-p')">Liquid-solid interfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'68.15.+e')">Liquid thin films</xsl:when>
                            <xsl:when test="contains($codePacs,'68.18.Fg')">Liquid thin film structure: measurements and simulations</xsl:when>
                            <xsl:when test="contains($codePacs,'68.18.Jk')">Phase transitions in liquid thin films</xsl:when>
                            <xsl:when test="contains($codePacs,'68.35.-p')">Solid surfaces and solid-solid interfaces: structure and energetics</xsl:when>
                            <xsl:when test="contains($codePacs,'68.35.Bs')">Structure of clean surfaces (reconstruction)</xsl:when>
                            <xsl:when test="contains($codePacs,'68.35.Ct')">Interface structure and roughness</xsl:when>
                            <xsl:when test="contains($codePacs,'68.35.Dv')">Composition, segregation; defects and impurities</xsl:when>
                            <xsl:when test="contains($codePacs,'68.35.Fx')">Diffusion; interface formation</xsl:when>
                            <xsl:when test="contains($codePacs,'68.35.Gy')">Mechanical properties; surface strains</xsl:when>
                            <xsl:when test="contains($codePacs,'68.35.Iv')">Acoustical properties</xsl:when>
                            <xsl:when test="contains($codePacs,'68.35.Ja')">Surface and interface dynamics and vibrations</xsl:when>
                            <xsl:when test="contains($codePacs,'68.35.Md')">Surface thermodynamics, surface energies</xsl:when>
                            <xsl:when test="contains($codePacs,'68.35.Np')">Adhesion</xsl:when>
                            <xsl:when test="contains($codePacs,'68.35.Rh')">Phase transitions and critical phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'68.37.-d')">Microscopy of surfaces, interfaces, and thin films</xsl:when>
                            <xsl:when test="contains($codePacs,'68.37.Ef')">Scanning tunneling microscopy (including chemistry induced with STM)</xsl:when>
                            <xsl:when test="contains($codePacs,'68.37.Hk')">Scanning electron microscopy (SEM) (including EBIC)</xsl:when>
                            <xsl:when test="contains($codePacs,'68.37.Lp')">Transmission electron microscopy (TEM)</xsl:when>
                            <xsl:when test="contains($codePacs,'68.37.Ps')">Atomic force microscopy (AFM)</xsl:when>
                            <xsl:when test="contains($codePacs,'68.37.Vj')">Field emission and field-ion microscopy</xsl:when>
                            <xsl:when test="contains($codePacs,'68.37.Yz')">X-ray microscopy</xsl:when>
                            <xsl:when test="contains($codePacs,'68.43.-h')">Chemisorption/physisorption: adsorbates on surfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'68.43.Fg')">Adsorbate structure (binding sites, geometry)</xsl:when>
                            <xsl:when test="contains($codePacs,'68.43.Jk')">Diffusion of adsorbates, kinetics of coarsening and aggregation</xsl:when>
                            <xsl:when test="contains($codePacs,'68.43.Mn')">Adsorption kinetics</xsl:when>
                            <xsl:when test="contains($codePacs,'68.47.De')">Metallic surfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'68.47.Fg')">Semiconductor surfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'68.47.Pe')">Langmuir-Blodgett films on solids; polymers on surfaces; biological molecules on surfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'68.49.Jk')">Electron scattering from surfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'68.49.Sf')">Ion scattering from surfaces (charge transfer, sputtering, SIMS)</xsl:when>
                            <xsl:when test="contains($codePacs,'68.49.Uv')">X-ray standing waves</xsl:when>
                            <xsl:when test="contains($codePacs,'68.55.A-')">Nucleation and growth</xsl:when>
                            <xsl:when test="contains($codePacs,'68.55.Jk')">Structure and morphology; thickness; crystalline orientation and texture</xsl:when>
                            <xsl:when test="contains($codePacs,'68.55.Ln')">Defects and impurities: doping, implantation, distribution, concentration, etc.</xsl:when>
                            <xsl:when test="contains($codePacs,'68.55.Nq')">Composition and phase identification</xsl:when>
                            <xsl:when test="contains($codePacs,'68.60.Bs')">Mechanical and acoustical properties</xsl:when>
                            <xsl:when test="contains($codePacs,'68.60.Dv')">Thermal stability; thermal effects</xsl:when>
                            <xsl:when test="contains($codePacs,'68.65.-k')">Low-dimensional, mesoscopic, nanoscale and other related systems: structure and nonelectronic properties</xsl:when>
                            <xsl:when test="contains($codePacs,'68.65.Ac')">Multilayers</xsl:when>
                            <xsl:when test="contains($codePacs,'68.65.Cd')">Superlattices</xsl:when>
                            <xsl:when test="contains($codePacs,'68.65.Pq')">Graphene films</xsl:when>
                            <xsl:when test="contains($codePacs,'68.70.+w')">Whiskers and dendrites (growth, structure, and nonelectronic properties)</xsl:when>
                            <xsl:when test="contains($codePacs,'68.90.+g')">Other topics in structure, and nonelectronic properties of surfaces and interfaces; thin films and low-dimensional structures</xsl:when>
                            <xsl:when test="contains($codePacs,'71.00.00')">Electronic structure of bulk materials</xsl:when>
                            <xsl:when test="contains($codePacs,'71.10.-w')">Theories and models of many-electron systems</xsl:when>
                            <xsl:when test="contains($codePacs,'71.10.Ay')">Fermi-liquid theory and other phenomenological models</xsl:when>
                            <xsl:when test="contains($codePacs,'71.10.Ca')">Electron gas, Fermi gas</xsl:when>
                            <xsl:when test="contains($codePacs,'71.10.Fd')">Lattice fermion models (Hubbard model, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'71.15.-m')">Methods of electronic structure calculations</xsl:when>
                            <xsl:when test="contains($codePacs,'71.15.Ap')">Basis sets (LCAO, plane-wave, APW, etc.) and related methodology (scattering methods, ASA, linearized methods, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'71.15.Dx')">Computational methodology (Brillouin zone sampling, iterative diagonalization, pseudopotential construction)</xsl:when>
                            <xsl:when test="contains($codePacs,'71.15.Mb')">Density functional theory, local density approximation, gradient and other corrections</xsl:when>
                            <xsl:when test="contains($codePacs,'71.15.Nc')">Total energy and cohesive energy calculations</xsl:when>
                            <xsl:when test="contains($codePacs,'71.18.+y')">Fermi surface: calculations and measurements; effective mass, g factor</xsl:when>
                            <xsl:when test="contains($codePacs,'71.20.-b')">Electron density of states and band structure of crystalline solids</xsl:when>
                            <xsl:when test="contains($codePacs,'71.20.Be')">Transition metals and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'71.20.Dg')">Alkali and alkaline earth metals</xsl:when>
                            <xsl:when test="contains($codePacs,'71.20.Eh')">Rare earth metals and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'71.20.Gj')">Other metals and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'71.20.Mq')">Elemental semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'71.20.Nr')">Semiconductor compounds</xsl:when>
                            <xsl:when test="contains($codePacs,'71.20.Ps')">Other inorganic compounds</xsl:when>
                            <xsl:when test="contains($codePacs,'71.20.Rv')">Polymers and organic compounds</xsl:when>
                            <xsl:when test="contains($codePacs,'71.23.-k')">Electronic structure of disordered solids</xsl:when>
                            <xsl:when test="contains($codePacs,'71.23.An')">Theories and models; localized states</xsl:when>
                            <xsl:when test="contains($codePacs,'71.23.Cq')">Amorphous semiconductors, metallic glasses, glasses</xsl:when>
                            <xsl:when test="contains($codePacs,'71.23.Ft')">Quasicrystals</xsl:when>
                            <xsl:when test="contains($codePacs,'71.27.+a')">Strongly correlated electron systems; heavy fermions</xsl:when>
                            <xsl:when test="contains($codePacs,'71.28.+d')">Narrow-band systems; intermediate-valence solids</xsl:when>
                            <xsl:when test="contains($codePacs,'71.30.+h')">Metal-insulator transitions and other electronic transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'71.35.-y')">Excitons and related phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'71.35.Aa')">Frenkel excitons and self-trapped excitons</xsl:when>
                            <xsl:when test="contains($codePacs,'71.35.Cc')">Intrinsic properties of excitons; optical absorption spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'71.35.Ee')">Electron-hole drops and electron-hole plasma</xsl:when>
                            <xsl:when test="contains($codePacs,'71.35.Ji')">Excitons in magnetic fields; magnetoexcitons</xsl:when>
                            <xsl:when test="contains($codePacs,'71.35.Lk')">Collective effects (Bose effects, phase space filling, and excitonic phase transitions)</xsl:when>
                            <xsl:when test="contains($codePacs,'71.36.+c')">Polaritons (including photon-phonon and photon-magnon interactions)</xsl:when>
                            <xsl:when test="contains($codePacs,'71.38.-k')">Polarons and electron-phonon interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'71.38.Ht')">Self-trapped or small polarons</xsl:when>
                            <xsl:when test="contains($codePacs,'71.38.Mx')">Bipolarons</xsl:when>
                            <xsl:when test="contains($codePacs,'71.45.-d')">Collective effects</xsl:when>
                            <xsl:when test="contains($codePacs,'71.45.Gm')">Exchange, correlation, dielectric and magnetic response functions, plasmons</xsl:when>
                            <xsl:when test="contains($codePacs,'71.45.Lr')">Charge-density-wave systems</xsl:when>
                            <xsl:when test="contains($codePacs,'71.55.-i')">Impurity and defect levels</xsl:when>
                            <xsl:when test="contains($codePacs,'71.55.Ak')">Metals, semimetals, and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'71.55.Cn')">Elemental semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'71.55.Gs')">II-VI semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'71.55.Ht')">Other nonmetals</xsl:when>
                            <xsl:when test="contains($codePacs,'71.55.Jv')">Disordered structures; amorphous and glassy solids</xsl:when>
                            <xsl:when test="contains($codePacs,'71.60.+z')">Positron states</xsl:when>
                            <xsl:when test="contains($codePacs,'71.70.-d')">Level splitting and interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'71.70.Ch')">Crystal and ligand fields</xsl:when>
                            <xsl:when test="contains($codePacs,'71.70.Di')">Landau levels</xsl:when>
                            <xsl:when test="contains($codePacs,'71.70.Ej')">Spin-orbit coupling, Zeeman and Stark splitting, Jahn-Teller effect</xsl:when>
                            <xsl:when test="contains($codePacs,'71.70.Gm')">Exchange interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'71.70.Jp')">Nuclear states and interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'71.90.+q')">Other topics in electronic structure</xsl:when>
                            <xsl:when test="contains($codePacs,'72.00.00')">Electronic transport in condensed matter</xsl:when>
                            <xsl:when test="contains($codePacs,'72.10.-d')">Theory of electronic transport; scattering mechanisms</xsl:when>
                            <xsl:when test="contains($codePacs,'72.10.Bg')">General formulation of transport theory</xsl:when>
                            <xsl:when test="contains($codePacs,'72.10.Di')">Scattering by phonons, magnons, and other nonlocalized excitations</xsl:when>
                            <xsl:when test="contains($codePacs,'72.10.Fk')">Scattering by point defects, dislocations, surfaces, and other imperfections (including Kondo effect)</xsl:when>
                            <xsl:when test="contains($codePacs,'72.15.-v')">Electronic conduction in metals and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'72.15.Cz')">Electrical and thermal conduction in amorphous and liquid metals and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'72.15.Eb')">Electrical and thermal conduction in crystalline metals and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'72.15.Gd')">Galvanomagnetic and other magnetotransport effects</xsl:when>
                            <xsl:when test="contains($codePacs,'72.15.Jf')">Thermoelectric and thermomagnetic effects</xsl:when>
                            <xsl:when test="contains($codePacs,'72.15.Lh')">Relaxation times and mean free paths</xsl:when>
                            <xsl:when test="contains($codePacs,'72.15.Qm')">Scattering mechanisms and Kondo effect</xsl:when>
                            <xsl:when test="contains($codePacs,'72.15.Rn')">Localization effects (Anderson or weak localization)</xsl:when>
                            <xsl:when test="contains($codePacs,'72.20.-i')">Conductivity phenomena in semiconductors and insulators</xsl:when>
                            <xsl:when test="contains($codePacs,'72.20.Dp')">General theory, scattering mechanisms</xsl:when>
                            <xsl:when test="contains($codePacs,'72.20.Ee')">Mobility edges; hopping transport</xsl:when>
                            <xsl:when test="contains($codePacs,'72.20.Fr')">Low-field transport and mobility; piezoresistance</xsl:when>
                            <xsl:when test="contains($codePacs,'72.20.Ht')">High-field and nonlinear effects</xsl:when>
                            <xsl:when test="contains($codePacs,'72.20.Jv')">Charge carriers: generation, recombination, lifetime, and trapping</xsl:when>
                            <xsl:when test="contains($codePacs,'72.20.My')">Galvanomagnetic and other magnetotransport effects</xsl:when>
                            <xsl:when test="contains($codePacs,'72.20.Pa')">Thermoelectric and thermomagnetic effects</xsl:when>
                            <xsl:when test="contains($codePacs,'72.25.-b')">Spin polarized transport</xsl:when>
                            <xsl:when test="contains($codePacs,'72.25.Ba')">Spin polarized transport in metals</xsl:when>
                            <xsl:when test="contains($codePacs,'72.25.Dc')">Spin polarized transport in semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'72.25.Hg')">Electrical injection of spin polarized carriers</xsl:when>
                            <xsl:when test="contains($codePacs,'72.25.Pn')">Current-driven spin pumping</xsl:when>
                            <xsl:when test="contains($codePacs,'72.30.+q')">High-frequency effects; plasma effects</xsl:when>
                            <xsl:when test="contains($codePacs,'72.40.+w')">Photoconduction and photovoltaic effects</xsl:when>
                            <xsl:when test="contains($codePacs,'72.50.+b')">Acoustoelectric effects</xsl:when>
                            <xsl:when test="contains($codePacs,'72.55.+s')">Magnetoacoustic effects</xsl:when>
                            <xsl:when test="contains($codePacs,'72.60.+g')">Mixed conductivity and conductivity transitions</xsl:when>
                            <xsl:when test="contains($codePacs,'72.70.+m')">Noise processes and phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'72.80.-r')">Conductivity of specific materials</xsl:when>
                            <xsl:when test="contains($codePacs,'72.80.Cw')">Elemental semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'72.80.Ey')">III-V and II-VI semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'72.80.Jc')">Other crystalline inorganic semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'72.80.Le')">Polymers; organic compounds (including organic semiconductors)</xsl:when>
                            <xsl:when test="contains($codePacs,'72.80.Ng')">Disordered solids</xsl:when>
                            <xsl:when test="contains($codePacs,'72.80.Ph')">Liquid semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'72.80.Rj')">Fullerenes and related materials</xsl:when>
                            <xsl:when test="contains($codePacs,'72.80.Tm')">Composite materials</xsl:when>
                            <xsl:when test="contains($codePacs,'72.80.Vp')">Electronic transport in graphene</xsl:when>
                            <xsl:when test="contains($codePacs,'72.90.+y')">Other topics in electronic transport in condensed matter</xsl:when>
                            <xsl:when test="contains($codePacs,'73.00.00')">Electronic structure and electrical properties of surfaces, interfaces, thin films, and low-dimensional structures</xsl:when>
                            <xsl:when test="contains($codePacs,'73.20.-r')">Electron states at surfaces and interfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'73.20.At')">Surface states, band structure, electron density of states</xsl:when>
                            <xsl:when test="contains($codePacs,'73.20.Jc')">Delocalization processes</xsl:when>
                            <xsl:when test="contains($codePacs,'73.20.Mf')">Collective excitations</xsl:when>
                            <xsl:when test="contains($codePacs,'73.20.Qt')">Electron solids</xsl:when>
                            <xsl:when test="contains($codePacs,'73.21.-b')">Electron states and collective excitations in multilayers, quantum wells, mesoscopic, and nanoscale systems</xsl:when>
                            <xsl:when test="contains($codePacs,'73.21.Cd')">Superlattices</xsl:when>
                            <xsl:when test="contains($codePacs,'73.21.Fg')">Quantum wells</xsl:when>
                            <xsl:when test="contains($codePacs,'73.21.La')">Quantum dots</xsl:when>
                            <xsl:when test="contains($codePacs,'73.22.-f')">Electronic structure of nanoscale materials and related systems</xsl:when>
                            <xsl:when test="contains($codePacs,'73.23.-b')">Electronic transport in mesoscopic systems</xsl:when>
                            <xsl:when test="contains($codePacs,'73.25.+i')">Surface conductivity and carrier phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'73.30.+y')">Surface double layers, Schottky barriers, and work functions</xsl:when>
                            <xsl:when test="contains($codePacs,'73.40.-c')">Electronic transport in interface structures</xsl:when>
                            <xsl:when test="contains($codePacs,'73.40.Cg')">Contact resistance, contact potential</xsl:when>
                            <xsl:when test="contains($codePacs,'73.40.Gk')">Tunneling</xsl:when>
                            <xsl:when test="contains($codePacs,'73.40.Jn')">Metal-to-metal contacts</xsl:when>
                            <xsl:when test="contains($codePacs,'73.40.Kp')">III-V semiconductor-to-semiconductor contacts, p-n junctions, and heterojunctions</xsl:when>
                            <xsl:when test="contains($codePacs,'73.40.Lq')">Other semiconductor-to-semiconductor contacts, p-n junctions, and heterojunctions</xsl:when>
                            <xsl:when test="contains($codePacs,'73.40.Mr')">Semiconductor-electrolyte contacts</xsl:when>
                            <xsl:when test="contains($codePacs,'73.40.Ns')">Metal-nonmetal contacts</xsl:when>
                            <xsl:when test="contains($codePacs,'73.40.Qv')">Metal-insulator-semiconductor structures (including semiconductor-to-insulator)</xsl:when>
                            <xsl:when test="contains($codePacs,'73.43.-f')">Quantum Hall effects</xsl:when>
                            <xsl:when test="contains($codePacs,'73.43.Cd')">Theory and modeling</xsl:when>
                            <xsl:when test="contains($codePacs,'73.43.Fj')">Novel experimental methods; measurements</xsl:when>
                            <xsl:when test="contains($codePacs,'73.43.Jn')">Tunneling</xsl:when>
                            <xsl:when test="contains($codePacs,'73.43.Qt')">Magnetoresistance</xsl:when>
                            <xsl:when test="contains($codePacs,'73.50.-h')">Electronic transport phenomena in thin films</xsl:when>
                            <xsl:when test="contains($codePacs,'73.50.Gr')">Charge carriers: generation, recombination, lifetime, trapping, mean free paths</xsl:when>
                            <xsl:when test="contains($codePacs,'73.50.Jt')">Galvanomagnetic and other magnetotransport effects (including thermomagnetic effects)</xsl:when>
                            <xsl:when test="contains($codePacs,'73.50.Lw')">Thermoelectric effects</xsl:when>
                            <xsl:when test="contains($codePacs,'73.50.Mx')">High-frequency effects; plasma effects</xsl:when>
                            <xsl:when test="contains($codePacs,'73.50.Pz')">Photoconduction and photovoltaic effects</xsl:when>
                            <xsl:when test="contains($codePacs,'73.61.-r')">Electrical properties of specific thin films</xsl:when>
                            <xsl:when test="contains($codePacs,'73.61.At')">Metal and metallic alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'73.61.Le')">Other inorganic semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'73.63.-b')">Electronic transport in nanoscale materials and structures</xsl:when>
                            <xsl:when test="contains($codePacs,'73.63.Fg')">Nanotubes</xsl:when>
                            <xsl:when test="contains($codePacs,'73.63.Hs')">Quantum wells</xsl:when>
                            <xsl:when test="contains($codePacs,'73.63.Rt')">Nanoscale contacts</xsl:when>
                            <xsl:when test="contains($codePacs,'73.90.+f')">Other topics in electronic structure and electrical properties of surfaces, interfaces, thin films, and low-dimensional structures</xsl:when>
                            <xsl:when test="contains($codePacs,'74.00.00')">Superconductivity phase diagrams</xsl:when>
                            <xsl:when test="contains($codePacs,'74.10.+v')">Occurrence, potential candidates</xsl:when>
                            <xsl:when test="contains($codePacs,'74.20.-z')">Theories and models of superconducting state</xsl:when>
                            <xsl:when test="contains($codePacs,'74.20.De')">Phenomenological theories (two-fluid, Ginzburg-Landau, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'74.20.Fg')">BCS theory and its development</xsl:when>
                            <xsl:when test="contains($codePacs,'74.20.Mn')">Nonconventional mechanisms</xsl:when>
                            <xsl:when test="contains($codePacs,'74.20.Rp')">Pairing symmetries (other than s-wave)</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.-q')">Properties of superconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.Bt')">Thermodynamic properties</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.Dw')">Superconductivity phase diagrams</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.Fy')">Transport properties (electric and thermal conductivity, thermoelectric effects, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.Gz')">Optical properties</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.Ha')">Magnetic properties including vortex structures and related phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.Jb')">Electronic structure (photoemission, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.Kc')">Phonons</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.Ld')">Mechanical and acoustical properties, elasticity, and ultrasonic attenuation</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.Nf')">Response to electromagnetic fields (nuclear magnetic resonance, surface impedance, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.Op')">Mixed states, critical fields, and surface sheaths</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.Qt')">Vortex lattices, flux pinning, flux creep</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.Sv')">Critical currents</xsl:when>
                            <xsl:when test="contains($codePacs,'74.25.Uv')">Vortex phases (includes vortex lattices, vortex liquids, and vortex glasses)</xsl:when>
                            <xsl:when test="contains($codePacs,'74.40.+k')">Fluctuations (noise, chaos, nonequilibrium superconductivity, localization, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'74.45.+c')">Proximity effects; Andreev reflection; SN and SNS junctions</xsl:when>
                            <xsl:when test="contains($codePacs,'74.50.+r')">Tunneling phenomena; Josephson effects</xsl:when>
                            <xsl:when test="contains($codePacs,'74.62.-c')">Transition temperature variations, phase diagrams</xsl:when>
                            <xsl:when test="contains($codePacs,'74.62.Bf')">Effects of material synthesis, crystal structure, and chemical composition</xsl:when>
                            <xsl:when test="contains($codePacs,'74.62.Dh')">Effects of crystal defects, doping and substitution</xsl:when>
                            <xsl:when test="contains($codePacs,'74.62.Fj')">Effects of pressure</xsl:when>
                            <xsl:when test="contains($codePacs,'74.70.-b')">Superconducting materials other than cuprates</xsl:when>
                            <xsl:when test="contains($codePacs,'74.70.Ad')">Metals; alloys and binary compounds (including A15, MgB2, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'74.70.Dd')">Ternary, quaternary, and multinary compounds (including Chevrel phases, borocarbides, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'74.70.Kn')">Organic superconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'74.70.Tx')">Heavy-fermion superconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'74.72.-h')">Cuprate superconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'74.72.Bk')">Y-based cuprates</xsl:when>
                            <xsl:when test="contains($codePacs,'74.72.Dn')">La-based cuprates</xsl:when>
                            <xsl:when test="contains($codePacs,'74.72.Hs')">Bi-based cuprates</xsl:when>
                            <xsl:when test="contains($codePacs,'74.72.Jt')">Other cuprates, including Tl and Hg-based cuprates</xsl:when>
                            <xsl:when test="contains($codePacs,'74.78.-w')">Superconducting films and low-dimensional structures</xsl:when>
                            <xsl:when test="contains($codePacs,'74.78.Bz')">High-Tc films</xsl:when>
                            <xsl:when test="contains($codePacs,'74.81.Bd')">Granular, melt-textured, amorphous, and composite superconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'74.90.+n')">Other topics in superconductivity</xsl:when>
                            <xsl:when test="contains($codePacs,'75.00.00')">Magnetic properties and materials</xsl:when>
                            <xsl:when test="contains($codePacs,'75.10.-b')">General theory and models of magnetic ordering</xsl:when>
                            <xsl:when test="contains($codePacs,'75.10.Dg')">Crystal-field theory and spin Hamiltonians</xsl:when>
                            <xsl:when test="contains($codePacs,'75.10.Hk')">Classical spin models</xsl:when>
                            <xsl:when test="contains($codePacs,'75.10.Jm')">Quantized spin models, including quantum spin frustration</xsl:when>
                            <xsl:when test="contains($codePacs,'75.10.Lp')">Band and itinerant models</xsl:when>
                            <xsl:when test="contains($codePacs,'75.10.Nr')">Spin-glass and other random models</xsl:when>
                            <xsl:when test="contains($codePacs,'75.20.-g')">Diamagnetism, paramagnetism, and superparamagnetism</xsl:when>
                            <xsl:when test="contains($codePacs,'75.20.Ck')">Nonmetals</xsl:when>
                            <xsl:when test="contains($codePacs,'75.25.+z')">Spin arrangements in magnetically ordered materials</xsl:when>
                            <xsl:when test="contains($codePacs,'75.30.-m')">Intrinsic properties of magnetically ordered materials</xsl:when>
                            <xsl:when test="contains($codePacs,'75.30.Cr')">Saturation moments and magnetic susceptibilities</xsl:when>
                            <xsl:when test="contains($codePacs,'75.30.Ds')">Spin waves</xsl:when>
                            <xsl:when test="contains($codePacs,'75.30.Et')">Exchange and superexchange interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'75.30.Fv')">Spin-density waves</xsl:when>
                            <xsl:when test="contains($codePacs,'75.30.Gw')">Magnetic anisotropy</xsl:when>
                            <xsl:when test="contains($codePacs,'75.30.Hx')">Magnetic impurity interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'75.30.Kz')">Magnetic phase boundaries</xsl:when>
                            <xsl:when test="contains($codePacs,'75.30.Mb')">Valence fluctuation, Kondo lattice, and heavy-fermion phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'75.30.Sg')">Magnetocaloric effect, magnetic cooling</xsl:when>
                            <xsl:when test="contains($codePacs,'75.40.-s')">Critical-point effects, specific heats, short-range order</xsl:when>
                            <xsl:when test="contains($codePacs,'75.40.Cx')">Static properties (order parameter, static susceptibility, heat capacities, critical exponents, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'75.40.Gb')">Dynamic properties (dynamic susceptibility, spin waves, spin diffusion, dynamic scaling, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'75.45.+j')">Macroscopic quantum phenomena in magnetic systems</xsl:when>
                            <xsl:when test="contains($codePacs,'75.47.-m')">Magnetotransport phenomena; materials for magnetotransport</xsl:when>
                            <xsl:when test="contains($codePacs,'75.47.Lx')">Magnetic oxides</xsl:when>
                            <xsl:when test="contains($codePacs,'75.47.Np')">Metals and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'75.50.-y')">Studies of specific magnetic materials</xsl:when>
                            <xsl:when test="contains($codePacs,'75.50.Bb')">Fe and its alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'75.50.Cc')">Other ferromagnetic metals and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'75.50.Dd')">Nonmetallic ferromagnetic materials</xsl:when>
                            <xsl:when test="contains($codePacs,'75.50.Ee')">Antiferromagnetics</xsl:when>
                            <xsl:when test="contains($codePacs,'75.50.Gg')">Ferrimagnetics</xsl:when>
                            <xsl:when test="contains($codePacs,'75.50.Kj')">Amorphous and quasicrystalline magnetic materials</xsl:when>
                            <xsl:when test="contains($codePacs,'75.50.Lk')">Spin glasses and other random magnets</xsl:when>
                            <xsl:when test="contains($codePacs,'75.50.Mm')">Magnetic liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'75.50.Pp')">Magnetic semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'75.50.Ss')">Magnetic recording materials</xsl:when>
                            <xsl:when test="contains($codePacs,'75.50.Tt')">Fine-particle systems; nanocrystalline materials</xsl:when>
                            <xsl:when test="contains($codePacs,'75.50.Ww')">Permanent magnets</xsl:when>
                            <xsl:when test="contains($codePacs,'75.60.-d')">Domain effects, magnetization curves, and hysteresis</xsl:when>
                            <xsl:when test="contains($codePacs,'75.60.Ch')">Domain walls and domain structure</xsl:when>
                            <xsl:when test="contains($codePacs,'75.60.Ej')">Magnetization curves, hysteresis, Barkhausen and related effects</xsl:when>
                            <xsl:when test="contains($codePacs,'75.60.Jk')">Magnetization reversal mechanisms</xsl:when>
                            <xsl:when test="contains($codePacs,'75.70.-i')">Magnetic properties of thin films, surfaces, and interfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'75.70.Ak')">Magnetic properties of monolayers and thin films</xsl:when>
                            <xsl:when test="contains($codePacs,'75.70.Cn')">Magnetic properties of interfaces (multilayers, superlattices, heterostructures)</xsl:when>
                            <xsl:when test="contains($codePacs,'75.70.Kw')">Domain structure</xsl:when>
                            <xsl:when test="contains($codePacs,'75.70.Rf')">Surface magnetism</xsl:when>
                            <xsl:when test="contains($codePacs,'75.75.-c')">Magnetic properties of nanostructures</xsl:when>
                            <xsl:when test="contains($codePacs,'75.76.+j')">Spin transport effects</xsl:when>
                            <xsl:when test="contains($codePacs,'75.78.-n')">Magnetization dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'75.80.+q')">Magnetomechanical effects, magnetostriction</xsl:when>
                            <xsl:when test="contains($codePacs,'75.85.+t')">Magnetoelectric effects, multiferroics</xsl:when>
                            <xsl:when test="contains($codePacs,'75.90.+w')">Other topics in magnetic properties and materials</xsl:when>
                            <xsl:when test="contains($codePacs,'76.00.00')">Magnetic resonances and relaxations in condensed matter, mössbauer effect</xsl:when>
                            <xsl:when test="contains($codePacs,'76.20.+q')">General theory of resonances and relaxations</xsl:when>
                            <xsl:when test="contains($codePacs,'76.30.-v')">Electron paramagnetic resonance and relaxation</xsl:when>
                            <xsl:when test="contains($codePacs,'76.30.Da')">Ions and impurities: general</xsl:when>
                            <xsl:when test="contains($codePacs,'76.30.Fc')">Iron group (3d) ions and impurities (Ti-Cu)</xsl:when>
                            <xsl:when test="contains($codePacs,'76.30.Kg')">Rare-earth ions and impurities</xsl:when>
                            <xsl:when test="contains($codePacs,'76.30.Lh')">Other ions and impurities</xsl:when>
                            <xsl:when test="contains($codePacs,'76.30.Mi')">Color centers and other defects</xsl:when>
                            <xsl:when test="contains($codePacs,'76.30.Pk')">Conduction electrons</xsl:when>
                            <xsl:when test="contains($codePacs,'76.30.Rn')">Free radicals</xsl:when>
                            <xsl:when test="contains($codePacs,'76.40.+b')">Diamagnetic and cyclotron resonances</xsl:when>
                            <xsl:when test="contains($codePacs,'76.50.+g')">Ferromagnetic, antiferromagnetic, and ferrimagnetic resonances; spin-wave resonance</xsl:when>
                            <xsl:when test="contains($codePacs,'76.60.-k')">Nuclear magnetic resonance and relaxation</xsl:when>
                            <xsl:when test="contains($codePacs,'76.60.Cq')">Chemical and Knight shifts</xsl:when>
                            <xsl:when test="contains($codePacs,'76.60.Es')">Relaxation effects</xsl:when>
                            <xsl:when test="contains($codePacs,'76.60.Gv')">Quadrupole resonance</xsl:when>
                            <xsl:when test="contains($codePacs,'76.60.Jx')">Effects of internal magnetic fields</xsl:when>
                            <xsl:when test="contains($codePacs,'76.60.Lz')">Spin echoes</xsl:when>
                            <xsl:when test="contains($codePacs,'76.70.-r')">Magnetic double resonances and cross effects</xsl:when>
                            <xsl:when test="contains($codePacs,'76.70.Dx')">Electron-nuclear double resonance (ENDOR), electron double resonance (ELDOR)</xsl:when>
                            <xsl:when test="contains($codePacs,'76.70.Fz')">Double nuclear magnetic resonance (DNMR), dynamical nuclear polarization</xsl:when>
                            <xsl:when test="contains($codePacs,'76.75.+i')">Muon spin rotation and relaxation</xsl:when>
                            <xsl:when test="contains($codePacs,'76.80.+y')">Mössbauer effect; other γ-ray spectroscopy</xsl:when>
                            <xsl:when test="contains($codePacs,'77.00.00')">Dielectrics, piezoelectrics, and ferroelectrics and their properties</xsl:when>
                            <xsl:when test="contains($codePacs,'77.22.-d')">Dielectric properties of solids and liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'77.22.Ch')">Permittivity</xsl:when>
                            <xsl:when test="contains($codePacs,'77.22.Ej')">Polarization and depolarization</xsl:when>
                            <xsl:when test="contains($codePacs,'77.22.Gm')">Dielectric loss and relaxation</xsl:when>
                            <xsl:when test="contains($codePacs,'77.22.Jp')">Dielectric breakdown and space-charge effects</xsl:when>
                            <xsl:when test="contains($codePacs,'77.55.+f')">Dielectric thin films</xsl:when>
                            <xsl:when test="contains($codePacs,'77.55.-g')">Dielectric thin films</xsl:when>
                            <xsl:when test="contains($codePacs,'77.65.-j')">Piezoelectricity and electromechanical effects</xsl:when>
                            <xsl:when test="contains($codePacs,'77.65.Dq')">Acoustoelectric effects and surface acoustic waves</xsl:when>
                            <xsl:when test="contains($codePacs,'77.65.Fs')">Electromechanical resonance; quartz resonators</xsl:when>
                            <xsl:when test="contains($codePacs,'77.70.+a')">Pyroelectric and electrocaloric effects</xsl:when>
                            <xsl:when test="contains($codePacs,'77.80.-e')">Ferroelectricity and antiferroelectricity</xsl:when>
                            <xsl:when test="contains($codePacs,'77.80.Bh')">Phase transitions and Curie point</xsl:when>
                            <xsl:when test="contains($codePacs,'77.80.Dj')">Domain structure; hysteresis</xsl:when>
                            <xsl:when test="contains($codePacs,'77.84.-s')">Dielectric, piezoelectric, ferroelectric, and antiferroelectric materials</xsl:when>
                            <xsl:when test="contains($codePacs,'77.84.Bw')">Elements, oxides, nitrides, borides, carbides, chalcogenides, etc.</xsl:when>
                            <xsl:when test="contains($codePacs,'77.84.Dy')">Niobates, titanates, tantalates, PZT ceramics, etc.</xsl:when>
                            <xsl:when test="contains($codePacs,'77.84.Fa')">KDP- and TGS-type crystals</xsl:when>
                            <xsl:when test="contains($codePacs,'77.84.Nh')">Liquids, emulsions, and suspensions; liquid crystals</xsl:when>
                            <xsl:when test="contains($codePacs,'77.90.+k')">Other topics in dielectrics, piezoelectrics, and ferroelectrics and their properties</xsl:when>
                            <xsl:when test="contains($codePacs,'78.00.00')">Optical properties, condensed-matter spectroscopy and other interactions of radiation and particles with condensed matter</xsl:when>
                            <xsl:when test="contains($codePacs,'78.20.-e')">Optical properties of bulk materials and thin films</xsl:when>
                            <xsl:when test="contains($codePacs,'78.20.Bh')">Theory, models, and numerical simulation</xsl:when>
                            <xsl:when test="contains($codePacs,'78.20.Ci')">Optical constants (including refractive index, complex dielectric constant, absorption, reflection and transmission coefficients, emissivity)</xsl:when>
                            <xsl:when test="contains($codePacs,'78.20.Ek')">Optical activity</xsl:when>
                            <xsl:when test="contains($codePacs,'78.20.Fm')">Birefringence</xsl:when>
                            <xsl:when test="contains($codePacs,'78.20.Hp')">Piezo-, elasto-, and acoustooptical effects; photoacoustic effects</xsl:when>
                            <xsl:when test="contains($codePacs,'78.20.Jq')">Electro-optical effects</xsl:when>
                            <xsl:when test="contains($codePacs,'78.20.Ls')">Magneto-optical effects</xsl:when>
                            <xsl:when test="contains($codePacs,'78.20.Nv')">Thermooptical and photothermal effects</xsl:when>
                            <xsl:when test="contains($codePacs,'78.30.-j')">Infrared and Raman spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'78.30.Cp')">Liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'78.30.Er')">Solid metals and alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'78.30.Fs')">III-V and II-VI semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'78.30.Hv')">Other nonmetallic inorganics</xsl:when>
                            <xsl:when test="contains($codePacs,'78.30.Jw')">Organic compounds, polymers</xsl:when>
                            <xsl:when test="contains($codePacs,'78.30.Ly')">Disordered solids</xsl:when>
                            <xsl:when test="contains($codePacs,'78.30.Na')">Fullerenes and related materials</xsl:when>
                            <xsl:when test="contains($codePacs,'78.35.+c')">Brillouin and Rayleigh scattering; other light scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'78.40.-q')">Absorption and reflection spectra: visible and ultraviolet</xsl:when>
                            <xsl:when test="contains($codePacs,'78.40.Dw')">Liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'78.40.Me')">Organic compounds and polymers</xsl:when>
                            <xsl:when test="contains($codePacs,'78.45.+h')">Stimulated emission</xsl:when>
                            <xsl:when test="contains($codePacs,'78.47.+p')">Time-resolved optical spectroscopies and other ultrafast optical measurements in condensed matter</xsl:when>
                            <xsl:when test="contains($codePacs,'78.55.-m')">Photoluminescence, properties and materials</xsl:when>
                            <xsl:when test="contains($codePacs,'78.55.Ap')">Elemental semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'78.55.Bq')">Liquids</xsl:when>
                            <xsl:when test="contains($codePacs,'78.55.Cr')">III-V semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'78.55.Et')">II-VI semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'78.55.Fv')">Solid alkali halides</xsl:when>
                            <xsl:when test="contains($codePacs,'78.55.Hx')">Other solid inorganic materials</xsl:when>
                            <xsl:when test="contains($codePacs,'78.55.Kz')">Solid organic materials</xsl:when>
                            <xsl:when test="contains($codePacs,'78.60.-b')">Other luminescence and radiative recombination</xsl:when>
                            <xsl:when test="contains($codePacs,'78.60.Fi')">Electroluminescence</xsl:when>
                            <xsl:when test="contains($codePacs,'78.60.Hk')">Cathodoluminescence, ionoluminescence</xsl:when>
                            <xsl:when test="contains($codePacs,'78.60.Mq')">Sonoluminescence, triboluminescence</xsl:when>
                            <xsl:when test="contains($codePacs,'78.60.Ps')">Chemiluminescence</xsl:when>
                            <xsl:when test="contains($codePacs,'78.66.-w')">Optical properties of specific thin films</xsl:when>
                            <xsl:when test="contains($codePacs,'78.66.Bz')">Metals and metallic alloys</xsl:when>
                            <xsl:when test="contains($codePacs,'78.66.Jg')">Amorphous semiconductors; glasses</xsl:when>
                            <xsl:when test="contains($codePacs,'78.66.Li')">Other semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'78.67.-n')">Optical properties of low-dimensional, mesoscopic, and nanoscale materials and structures</xsl:when>
                            <xsl:when test="contains($codePacs,'78.67.De')">Quantum wells</xsl:when>
                            <xsl:when test="contains($codePacs,'78.67.Pt')">Multilayers; superlattices; photonic structures; metamaterials</xsl:when>
                            <xsl:when test="contains($codePacs,'78.68.+m')">Optical properties of surfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'78.70.-g')">Interactions of particles and radiation with matter</xsl:when>
                            <xsl:when test="contains($codePacs,'78.70.Bj')">Positron annihilation</xsl:when>
                            <xsl:when test="contains($codePacs,'78.70.Ck')">X-ray scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'78.70.Dm')">X-ray absorption spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'78.70.En')">X-ray emission spectra and fluorescence</xsl:when>
                            <xsl:when test="contains($codePacs,'78.70.Gq')">Microwave and radio-frequency interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'78.70.Nx')">Neutron inelastic scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'78.90.+t')">Other topics in optical properties, condensed matter spectroscopy and other interactions of particles and radiation with condensed matter</xsl:when>
                            <xsl:when test="contains($codePacs,'79.00.00')">Electron and ion emission by liquids and solids; impact phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'79.20.Ds')">Laser-beam impact phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'79.20.Eb')">Laser ablation</xsl:when>
                            <xsl:when test="contains($codePacs,'79.20.Fv')">Electron impact: Auger emission</xsl:when>
                            <xsl:when test="contains($codePacs,'79.20.Hx')">Electron impact: secondary emission</xsl:when>
                            <xsl:when test="contains($codePacs,'79.20.La')">Photon- and electron-stimulated desorption</xsl:when>
                            <xsl:when test="contains($codePacs,'79.20.Rf')">Atomic, molecular, and ion beam impact and interactions with surfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'79.40.+z')">Thermionic emission</xsl:when>
                            <xsl:when test="contains($codePacs,'79.60.-i')">Photoemission and photoelectron spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'79.60.Bm')">Clean metal, semiconductor, and insulator surfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'79.60.Cn')">Liquids and liquid surfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'79.60.Jv')">Interfaces; heterostructures; nanostructures</xsl:when>
                            <xsl:when test="contains($codePacs,'79.70.+q')">Field emission, ionization, evaporation, and desorption</xsl:when>
                            <xsl:when test="contains($codePacs,'79.75.+g')">Exoelectron emission</xsl:when>
                            <xsl:when test="contains($codePacs,'79.90.+b')">Other topics in electron and ion emission by liquids and solids and impact phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'81.00.00')">Materials science</xsl:when>
                            <xsl:when test="contains($codePacs,'81.05.Hd')">Other semiconductors</xsl:when>
                            <xsl:when test="contains($codePacs,'81.05.ue')">Graphene</xsl:when>
                            <xsl:when test="contains($codePacs,'81.07.Wx')">Nanopowders</xsl:when>
                            <xsl:when test="contains($codePacs,'81.10.-h')">Methods of crystal growth; physics and chemistry of crystal growth, crystal morphology, and orientation</xsl:when>
                            <xsl:when test="contains($codePacs,'81.10.Aj')">Theory and models of crystal growth; physics and chemistry of crystal growth, crystal morphology, and orientation</xsl:when>
                            <xsl:when test="contains($codePacs,'81.10.Bk')">Growth from vapor</xsl:when>
                            <xsl:when test="contains($codePacs,'81.10.Dn')">Growth from solutions</xsl:when>
                            <xsl:when test="contains($codePacs,'81.10.Fq')">Growth from melts; zone melting and refining</xsl:when>
                            <xsl:when test="contains($codePacs,'81.15.-z')">Methods of deposition of films and coatings; film growth and epitaxy</xsl:when>
                            <xsl:when test="contains($codePacs,'81.15.Cd')">Deposition by sputtering</xsl:when>
                            <xsl:when test="contains($codePacs,'81.15.Gh')">Chemical vapor deposition</xsl:when>
                            <xsl:when test="contains($codePacs,'81.15.Hi')">Molecular, atomic, ion, and chemical beam epitaxy</xsl:when>
                            <xsl:when test="contains($codePacs,'81.20.-n')">Methods of materials synthesis and materials processing</xsl:when>
                            <xsl:when test="contains($codePacs,'81.30.-t')">Phase diagrams and microstructures developed by solidification and solid-solid phase transformations</xsl:when>
                            <xsl:when test="contains($codePacs,'81.30.Bx')">Phase diagrams of metals, alloys, and oxides</xsl:when>
                            <xsl:when test="contains($codePacs,'81.30.Dz')">Phase diagrams of other materials</xsl:when>
                            <xsl:when test="contains($codePacs,'81.30.Fb')">Solidification</xsl:when>
                            <xsl:when test="contains($codePacs,'81.30.Hd')">Constant-composition solid-solid phase transformations: polymorphic, massive, and order-disorder</xsl:when>
                            <xsl:when test="contains($codePacs,'81.30.Kf')">Martensitic transformations</xsl:when>
                            <xsl:when test="contains($codePacs,'81.40.Gh')">Other heat and thermomechanical treatments</xsl:when>
                            <xsl:when test="contains($codePacs,'81.40.Jj')">Elasticity and anelasticity, stress-strain relations</xsl:when>
                            <xsl:when test="contains($codePacs,'81.40.Lm')">Deformation, plasticity, and creep</xsl:when>
                            <xsl:when test="contains($codePacs,'81.40.Np')">Fatigue, corrosion fatigue, embrittlement, cracking, fracture, and failure</xsl:when>
                            <xsl:when test="contains($codePacs,'81.40.Pq')">Friction, lubrication, and wear</xsl:when>
                            <xsl:when test="contains($codePacs,'81.65.Cf')">Surface cleaning, etching, patterning</xsl:when>
                            <xsl:when test="contains($codePacs,'81.65.Mq')">Oxidation</xsl:when>
                            <xsl:when test="contains($codePacs,'81.70.-q')">Methods of materials testing and analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'81.70.Bt')">Mechanical testing, impact tests, static and dynamic loads</xsl:when>
                            <xsl:when test="contains($codePacs,'81.70.Cv')">Nondestructive testing: ultrasonic testing, photoacoustic testing</xsl:when>
                            <xsl:when test="contains($codePacs,'81.70.Ex')">Nondestructive testing: electromagnetic testing, eddy-current testing</xsl:when>
                            <xsl:when test="contains($codePacs,'81.70.Ha')">Testing in microgravity environments</xsl:when>
                            <xsl:when test="contains($codePacs,'82.00.00')">Physical chemistry and chemical physics</xsl:when>
                            <xsl:when test="contains($codePacs,'82.20.-w')">Chemical kinetics and dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'82.20.Fd')">Collision theories; trajectory models</xsl:when>
                            <xsl:when test="contains($codePacs,'82.20.Hf')">Product distribution</xsl:when>
                            <xsl:when test="contains($codePacs,'82.20.Ln')">Semiclassical theory of reactions and/or energy transfer</xsl:when>
                            <xsl:when test="contains($codePacs,'82.20.Nk')">Classical theories of reactions and/or energy transfer</xsl:when>
                            <xsl:when test="contains($codePacs,'82.20.Pm')">Rate constants, reaction cross sections, and activation energies</xsl:when>
                            <xsl:when test="contains($codePacs,'82.30.-b')">Specific chemical reactions; reaction mechanisms</xsl:when>
                            <xsl:when test="contains($codePacs,'82.30.Cf')">Atom and radical reactions; chain reactions; molecule-molecule reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'82.30.Fi')">Ion-molecule, ion-ion, and charge-transfer reactions</xsl:when>
                            <xsl:when test="contains($codePacs,'82.30.Gg')">Positronium chemistry</xsl:when>
                            <xsl:when test="contains($codePacs,'82.30.Lp')">Decomposition reactions (pyrolysis, dissociation, and fragmentation)</xsl:when>
                            <xsl:when test="contains($codePacs,'82.33.Pt')">Solid state chemistry</xsl:when>
                            <xsl:when test="contains($codePacs,'82.33.Vx')">Reactions in flames, combustion, and explosions</xsl:when>
                            <xsl:when test="contains($codePacs,'82.33.Xj')">Plasma reactions (including flowing afterglow and electric discharges)</xsl:when>
                            <xsl:when test="contains($codePacs,'82.35.-x')">Polymers: properties; reactions; polymerization</xsl:when>
                            <xsl:when test="contains($codePacs,'82.35.Jk')">Copolymers, phase transitions, structure</xsl:when>
                            <xsl:when test="contains($codePacs,'82.35.Rs')">Polyelectrolytes</xsl:when>
                            <xsl:when test="contains($codePacs,'82.39.-k')">Chemical kinetics in biological systems</xsl:when>
                            <xsl:when test="contains($codePacs,'82.39.Wj')">Ion exchange, dialysis, osmosis, electro-osmosis, membrane processes</xsl:when>
                            <xsl:when test="contains($codePacs,'82.40.-g')">Chemical kinetics and reactions: special regimes and techniques</xsl:when>
                            <xsl:when test="contains($codePacs,'82.40.Fp')">Shock wave initiated reactions, high-pressure chemistry</xsl:when>
                            <xsl:when test="contains($codePacs,'82.45.Fk')">Electrodes</xsl:when>
                            <xsl:when test="contains($codePacs,'82.45.Gj')">Electrolytes</xsl:when>
                            <xsl:when test="contains($codePacs,'82.45.Vp')">Semiconductor materials in electrochemistry</xsl:when>
                            <xsl:when test="contains($codePacs,'82.47.-a')">Applied electrochemistry</xsl:when>
                            <xsl:when test="contains($codePacs,'82.50.-m')">Photochemistry</xsl:when>
                            <xsl:when test="contains($codePacs,'82.50.Hp')">Processes caused by visible and UV light</xsl:when>
                            <xsl:when test="contains($codePacs,'82.60.Cx')">Enthalpies of combustion, reaction, and formation</xsl:when>
                            <xsl:when test="contains($codePacs,'82.60.Hc')">Chemical equilibria and equilibrium constants</xsl:when>
                            <xsl:when test="contains($codePacs,'82.60.Lf')">Thermodynamics of solutions</xsl:when>
                            <xsl:when test="contains($codePacs,'82.65.+r')">Surface and interface chemistry; heterogeneous catalysis at surfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'82.70.Dd')">Colloids</xsl:when>
                            <xsl:when test="contains($codePacs,'82.70.Gg')">Gels and sols</xsl:when>
                            <xsl:when test="contains($codePacs,'82.70.Kj')">Emulsions and suspensions</xsl:when>
                            <xsl:when test="contains($codePacs,'82.70.Rr')">Aerosols and foams</xsl:when>
                            <xsl:when test="contains($codePacs,'82.70.Uv')">Surfactants, micellar solutions, vesicles, lamellae, amphiphilic systems,</xsl:when>
                            <xsl:when test="contains($codePacs,'82.80.-d')">Chemical analysis and related physical methods of analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'82.80.Ej')">X-ray, Mössbauer, and other γ-ray spectroscopic analysis methods</xsl:when>
                            <xsl:when test="contains($codePacs,'82.80.Gk')">Analytical methods involving vibrational spectroscopy</xsl:when>
                            <xsl:when test="contains($codePacs,'82.80.Pv')">Electron spectroscopy (X-ray photoelectron (XPS), Auger electron spectroscopy (AES), etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'82.90.+j')">Other topics in physical chemistry and chemical physics</xsl:when>
                            <xsl:when test="contains($codePacs,'84.00.00')">Electronics; radiowave and microwave technology; direct energy conversion and storage</xsl:when>
                            <xsl:when test="contains($codePacs,'84.30.Jc')">Power electronics; power supply circuits</xsl:when>
                            <xsl:when test="contains($codePacs,'84.30.Le')">Amplifiers</xsl:when>
                            <xsl:when test="contains($codePacs,'84.30.Ng')">Oscillators, pulse generators, and function generators</xsl:when>
                            <xsl:when test="contains($codePacs,'84.30.Qi')">Modulators and demodulators; discriminators, comparators, mixers, limiters, and compressors</xsl:when>
                            <xsl:when test="contains($codePacs,'84.30.Sk')">Pulse and digital circuits</xsl:when>
                            <xsl:when test="contains($codePacs,'84.30.Vn')">Filters</xsl:when>
                            <xsl:when test="contains($codePacs,'84.32.Dd')">Connectors, relays, and switches</xsl:when>
                            <xsl:when test="contains($codePacs,'84.32.Ff')">Conductors, resistors (including thermistors, varistors, and photoresistors)</xsl:when>
                            <xsl:when test="contains($codePacs,'84.32.Hh')">Inductors and coils; wiring</xsl:when>
                            <xsl:when test="contains($codePacs,'84.32.Tt')">Capacitors</xsl:when>
                            <xsl:when test="contains($codePacs,'84.35.+i')">Neural networks</xsl:when>
                            <xsl:when test="contains($codePacs,'84.37.+q')">Measurements in electric variables (including voltage, current, resistance, capacitance, inductance, impedance, and admittance, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'84.40.-x')">Radiowave and microwave</xsl:when>
                            <xsl:when test="contains($codePacs,'84.40.Az')">Waveguides, transmission lines, striplines</xsl:when>
                            <xsl:when test="contains($codePacs,'84.40.Ba')">Antennas: theory, components and accessories</xsl:when>
                            <xsl:when test="contains($codePacs,'84.40.Fe')">Microwave tubes (e.g., klystrons, magnetrons, traveling-wave, backward-wave tubes, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'84.40.Ik')">Masers; gyrotrons (cyclotron-resonance masers)</xsl:when>
                            <xsl:when test="contains($codePacs,'84.40.Lj')">Microwave integrated electronics</xsl:when>
                            <xsl:when test="contains($codePacs,'84.40.Ua')">Telecommunications: signal transmission and processing; communication satellites</xsl:when>
                            <xsl:when test="contains($codePacs,'84.40.Xb')">Telemetry: remote control, remote sensing; radar</xsl:when>
                            <xsl:when test="contains($codePacs,'84.47.+w')">Vacuum tubes</xsl:when>
                            <xsl:when test="contains($codePacs,'84.60.-h')">Direct energy conversion and storage</xsl:when>
                            <xsl:when test="contains($codePacs,'84.60.Jt')">Photoelectric conversion: solar cells and arrays</xsl:when>
                            <xsl:when test="contains($codePacs,'84.70.+p')">High-current and high-voltage technology: power systems; power transmission lines and cables</xsl:when>
                            <xsl:when test="contains($codePacs,'84.71.Ba')">Superconducting magnets; magnetic levitation devices</xsl:when>
                            <xsl:when test="contains($codePacs,'84.71.Mn')">Superconducting wires, fibers, and tapes</xsl:when>
                            <xsl:when test="contains($codePacs,'85.00.00')">Electronic and magnetic devices; microelectronics</xsl:when>
                            <xsl:when test="contains($codePacs,'85.30.-z')">Semiconductor devices</xsl:when>
                            <xsl:when test="contains($codePacs,'85.30.De')">Semiconductor-device characterization, design, and modeling</xsl:when>
                            <xsl:when test="contains($codePacs,'85.30.Kk')">Junction diodes</xsl:when>
                            <xsl:when test="contains($codePacs,'85.30.Mn')">Junction breakdown and tunneling devices (including resonance tunneling devices)</xsl:when>
                            <xsl:when test="contains($codePacs,'85.30.Tv')">Field effect devices</xsl:when>
                            <xsl:when test="contains($codePacs,'85.40.-e')">Microelectronics: LSI, VLSI, ULSI; integrated circuit fabrication technology</xsl:when>
                            <xsl:when test="contains($codePacs,'85.40.Bh')">Computer-aided design of microcircuits; layout and modeling</xsl:when>
                            <xsl:when test="contains($codePacs,'85.40.Hp')">Lithography, masks and pattern transfer</xsl:when>
                            <xsl:when test="contains($codePacs,'85.40.Qx')">Microcircuit quality, noise, performance, and failure analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'85.60.-q')">Optoelectronic devices</xsl:when>
                            <xsl:when test="contains($codePacs,'85.60.Dw')">Photodiodes; phototransistors; photoresistors</xsl:when>
                            <xsl:when test="contains($codePacs,'85.60.Gz')">Photodetectors</xsl:when>
                            <xsl:when test="contains($codePacs,'85.60.Ha')">Photomultipliers; phototubes and photocathodes</xsl:when>
                            <xsl:when test="contains($codePacs,'85.60.Jb')">Light-emitting devices</xsl:when>
                            <xsl:when test="contains($codePacs,'85.60.Pg')">Display systems</xsl:when>
                            <xsl:when test="contains($codePacs,'85.65.+h')">Molecular electronic devices</xsl:when>
                            <xsl:when test="contains($codePacs,'85.70.-w')">Magnetic devices</xsl:when>
                            <xsl:when test="contains($codePacs,'85.70.Li')">Other magnetic recording and storage devices (including tapes, disks, and drums)</xsl:when>
                            <xsl:when test="contains($codePacs,'85.70.Sq')">Magnetooptical devices</xsl:when>
                            <xsl:when test="contains($codePacs,'85.80.Fi')">Thermoelectric devices</xsl:when>
                            <xsl:when test="contains($codePacs,'87.00.00')">Biological and medical physics</xsl:when>
                            <xsl:when test="contains($codePacs,'87.10.+e')">General theory and mathematical aspects</xsl:when>
                            <xsl:when test="contains($codePacs,'87.10.-e')">General theory and mathematical aspects</xsl:when>
                            <xsl:when test="contains($codePacs,'87.10.Ed')">Ordinary differential equations (ODE), partial differential equations (PDE), integrodifferential models</xsl:when>
                            <xsl:when test="contains($codePacs,'87.14.-g')">Biomolecules: types</xsl:when>
                            <xsl:when test="contains($codePacs,'87.14.Cc')">Lipids</xsl:when>
                            <xsl:when test="contains($codePacs,'87.14.Ee')">Proteins</xsl:when>
                            <xsl:when test="contains($codePacs,'87.14.G-')">Nucleic acids</xsl:when>
                            <xsl:when test="contains($codePacs,'87.14.Gg')">DNA, RNA</xsl:when>
                            <xsl:when test="contains($codePacs,'87.15.-v')">Biomolecules: structure and physical properties</xsl:when>
                            <xsl:when test="contains($codePacs,'87.15.Aa')">Theory and modeling; computer simulation</xsl:when>
                            <xsl:when test="contains($codePacs,'87.15.By')">Structure and bonding</xsl:when>
                            <xsl:when test="contains($codePacs,'87.15.Cc')">Folding: thermodynamics, statistical mechanics, models, and pathways</xsl:when>
                            <xsl:when test="contains($codePacs,'87.15.He')">Dynamics and conformational changes</xsl:when>
                            <xsl:when test="contains($codePacs,'87.15.Kg')">Molecular interactions; membrane-protein interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'87.15.La')">Mechanical properties</xsl:when>
                            <xsl:when test="contains($codePacs,'87.15.Mi')">Spectra, photodissociation, and photoionization; luminescence</xsl:when>
                            <xsl:when test="contains($codePacs,'87.15.Nn')">Properties of solutions; aggregation and crystallization of macromolecules</xsl:when>
                            <xsl:when test="contains($codePacs,'87.15.Rn')">Reactions and kinetics; polymerization</xsl:when>
                            <xsl:when test="contains($codePacs,'87.15.Tt')">Electrophoresis</xsl:when>
                            <xsl:when test="contains($codePacs,'87.15.ht')">Ultrafast dynamics; charge transfer</xsl:when>
                            <xsl:when test="contains($codePacs,'87.16.-b')">Subcellular structure and processes</xsl:when>
                            <xsl:when test="contains($codePacs,'87.16.Dg')">Membranes, bilayers, and vesicles</xsl:when>
                            <xsl:when test="contains($codePacs,'87.16.Sr')">Chromosomes, histones</xsl:when>
                            <xsl:when test="contains($codePacs,'87.16.Tb')">Mitochondria and other organelles</xsl:when>
                            <xsl:when test="contains($codePacs,'87.16.Uv')">Active transport processes</xsl:when>
                            <xsl:when test="contains($codePacs,'87.17.-d')">Cell processes</xsl:when>
                            <xsl:when test="contains($codePacs,'87.17.Ee')">Growth and division</xsl:when>
                            <xsl:when test="contains($codePacs,'87.17.Jj')">Cell locomotion, chemotaxis</xsl:when>
                            <xsl:when test="contains($codePacs,'87.18.-h')">Biological complexity</xsl:when>
                            <xsl:when test="contains($codePacs,'87.18.Ed')">Cell aggregation</xsl:when>
                            <xsl:when test="contains($codePacs,'87.18.Hf')">Spatiotemporal pattern formation in cellular populations</xsl:when>
                            <xsl:when test="contains($codePacs,'87.18.Sn')">Neural networks and synaptic communication</xsl:when>
                            <xsl:when test="contains($codePacs,'87.19.-j')">Properties of higher organisms</xsl:when>
                            <xsl:when test="contains($codePacs,'87.19.Dd')">Information processing in vision and hearing</xsl:when>
                            <xsl:when test="contains($codePacs,'87.19.Ff')">Muscles</xsl:when>
                            <xsl:when test="contains($codePacs,'87.19.La')">Neuroscience</xsl:when>
                            <xsl:when test="contains($codePacs,'87.19.Nn')">Electrophysiology</xsl:when>
                            <xsl:when test="contains($codePacs,'87.19.Rr')">Mechanical properties of tissues and organs</xsl:when>
                            <xsl:when test="contains($codePacs,'87.19.Xx')">Diseases</xsl:when>
                            <xsl:when test="contains($codePacs,'87.19.xj')">Cancer</xsl:when>
                            <xsl:when test="contains($codePacs,'87.23.-n')">Ecology and evolution</xsl:when>
                            <xsl:when test="contains($codePacs,'87.23.Kg')">Dynamics of evolution</xsl:when>
                            <xsl:when test="contains($codePacs,'87.50.-a')">Effects of electromagnetic and acoustic fields on biological systems</xsl:when>
                            <xsl:when test="contains($codePacs,'87.50.Jk')">Radio frequency and microwave radiation (power lines)</xsl:when>
                            <xsl:when test="contains($codePacs,'87.50.Mn')">Magnetic fields</xsl:when>
                            <xsl:when test="contains($codePacs,'87.52.-g')">Radiation monitoring, control, and safety</xsl:when>
                            <xsl:when test="contains($codePacs,'87.53.-j')">Effects of ionizing radiation on biological systems</xsl:when>
                            <xsl:when test="contains($codePacs,'87.53.Qc')">Proton, neutron, and heavier particle dosimetry: measurements</xsl:when>
                            <xsl:when test="contains($codePacs,'87.53.Tf')">Treatment planning, optimization, tissue response factors, and dose-volume analysis</xsl:when>
                            <xsl:when test="contains($codePacs,'87.63.Lk')">Visible radiation: diaphanography, transillumination, laser imaging</xsl:when>
                            <xsl:when test="contains($codePacs,'87.64.-t')">Spectroscopic and microscopic techniques in biophysics and medical physics</xsl:when>
                            <xsl:when test="contains($codePacs,'87.64.Cc')">Scattering of visible, uv, and infrared radiation</xsl:when>
                            <xsl:when test="contains($codePacs,'87.64.Ee')">Electron microscopy</xsl:when>
                            <xsl:when test="contains($codePacs,'87.64.Gb')">X-ray spectroscopy</xsl:when>
                            <xsl:when test="contains($codePacs,'87.64.Je')">Infrared and Raman spectroscopy</xsl:when>
                            <xsl:when test="contains($codePacs,'87.64.Pj')">Mossbauer spectroscopy</xsl:when>
                            <xsl:when test="contains($codePacs,'87.66.Jj')">Ionization dosimetry</xsl:when>
                            <xsl:when test="contains($codePacs,'87.68.+z')">Biomaterials and biological interfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'87.80.-y')">Biophysical techniques (research methods)</xsl:when>
                            <xsl:when test="contains($codePacs,'87.80.Rb')">Tissue and cellular engineering and biotechnology</xsl:when>
                            <xsl:when test="contains($codePacs,'89.00.00')">Other areas of applied and interdisciplinary physics</xsl:when>
                            <xsl:when test="contains($codePacs,'89.20.Bb')">Industrial and technological research and development</xsl:when>
                            <xsl:when test="contains($codePacs,'89.20.Dd')">Military technology and weapons systems; arms control</xsl:when>
                            <xsl:when test="contains($codePacs,'89.20.Kk')">Engineering</xsl:when>
                            <xsl:when test="contains($codePacs,'89.30.Cc')">Solar power</xsl:when>
                            <xsl:when test="contains($codePacs,'89.30.Gg')">Nuclear fission power</xsl:when>
                            <xsl:when test="contains($codePacs,'89.30.Jj')">Nuclear fusion power</xsl:when>
                            <xsl:when test="contains($codePacs,'89.60.-k')">Environmental studies</xsl:when>
                            <xsl:when test="contains($codePacs,'89.60.Gg')">Impact of natural and man-made disasters</xsl:when>
                            <xsl:when test="contains($codePacs,'89.65.Gh')">Economics; econophysics, financial markets, business and management</xsl:when>
                            <xsl:when test="contains($codePacs,'89.70.+c')">Information theory and communication theory</xsl:when>
                <xsl:when test="contains($codePacs,'89.90.+n')">Other topics in areas of applied and interdisciplinary physics</xsl:when>
                <xsl:when test="contains($codePacs,'91.00.00')">Solid earth physics</xsl:when>
                <xsl:when test="contains($codePacs,'91.10.Kg')">Crustal movements and deformation</xsl:when>
                <xsl:when test="contains($codePacs,'91.10.Nj')">Rotational variations; polar wobble</xsl:when>
                <xsl:when test="contains($codePacs,'91.10.Op')">Gravity anomalies; time variable gravity</xsl:when>
                <xsl:when test="contains($codePacs,'91.25.-r')">Geomagnetism and paleomagnetism; geoelectricity</xsl:when>
                <xsl:when test="contains($codePacs,'91.25.Cw')">Origins and models of the magnetic field; dynamo theories</xsl:when>
                <xsl:when test="contains($codePacs,'91.25.Le')">Time variations in geomagnetism</xsl:when>
                <xsl:when test="contains($codePacs,'91.25.Mf')">Magnetic field reversals: process and timescale</xsl:when>
                <xsl:when test="contains($codePacs,'91.25.Qi')">Geoelectricity, electromagnetic induction, and telluric currents</xsl:when>
                <xsl:when test="contains($codePacs,'91.25.St')">Magnetic fabrics and anisotropy</xsl:when>
                <xsl:when test="contains($codePacs,'91.30.-f')">Seismology</xsl:when>
                <xsl:when test="contains($codePacs,'91.30.Cd')">Body wave propagation</xsl:when>
                <xsl:when test="contains($codePacs,'91.30.Dk')">Seismicity</xsl:when>
                <xsl:when test="contains($codePacs,'91.30.Nw')">Tsunamis</xsl:when>
                <xsl:when test="contains($codePacs,'91.30.Px')">Earthquakes</xsl:when>
                <xsl:when test="contains($codePacs,'91.32.De')">Crust and lithosphere</xsl:when>
                <xsl:when test="contains($codePacs,'91.35.-x')">Earth’s interior structure and properties</xsl:when>
                <xsl:when test="contains($codePacs,'91.35.Dc')">Heat flow; geothermy</xsl:when>
                <xsl:when test="contains($codePacs,'91.35.Ed')">Structure of the Earth’s interior below the upper mantle</xsl:when>
                <xsl:when test="contains($codePacs,'91.35.Gf')">Structure of the crust and upper mantle</xsl:when>
                <xsl:when test="contains($codePacs,'91.35.Lj')">Composition and state of the Earth’s interior</xsl:when>
                <xsl:when test="contains($codePacs,'91.40.Jk')">Magma migration</xsl:when>
                <xsl:when test="contains($codePacs,'91.60.Np')">Permeability and porosity</xsl:when>
                <xsl:when test="contains($codePacs,'91.60.Pn')">Magnetic and electrical properties</xsl:when>
                <xsl:when test="contains($codePacs,'91.62.La')">Nitrogen cycling (biogeosciences)</xsl:when>
                <xsl:when test="contains($codePacs,'91.62.Mn')">Plant ecology, biogeosciences</xsl:when>
                <xsl:when test="contains($codePacs,'91.65.Ej')">Extrusive structures and rocks</xsl:when>
                <xsl:when test="contains($codePacs,'91.65.Gk')">Intrusive structures and rocks</xsl:when>
                <xsl:when test="contains($codePacs,'91.67.-y')">Geochemistry</xsl:when>
                <xsl:when test="contains($codePacs,'92.00.00')">Hydrospheric and atmospheric geophysics</xsl:when>
                <xsl:when test="contains($codePacs,'92.05.Df')">Climate, inter-annual variability (oceanography</xsl:when>
                <xsl:when test="contains($codePacs,'92.05.Hj')">Physical and chemical properties of seawater (salinity, density, temperature)</xsl:when>
                <xsl:when test="contains($codePacs,'92.10.-c')">Physical oceanography</xsl:when>
                <xsl:when test="contains($codePacs,'92.10.Fj')">Upper ocean and mixed layer processes</xsl:when>
                <xsl:when test="contains($codePacs,'92.10.Hm')">Ocean waves and oscillations</xsl:when>
                <xsl:when test="contains($codePacs,'92.10.Lq')">Turbulence, diffusion, and mixing processes in oceanography</xsl:when>
                <xsl:when test="contains($codePacs,'92.10.Ns')">Fine structure and microstructure in oceanography</xsl:when>
                <xsl:when test="contains($codePacs,'92.10.Vz')">Underwater sound</xsl:when>
                <xsl:when test="contains($codePacs,'92.10.ab')">General circulation</xsl:when>
                <xsl:when test="contains($codePacs,'92.10.ak')">Eddies and mesoscale processes</xsl:when>
                <xsl:when test="contains($codePacs,'92.20.jp')">Ecology, ocean biology</xsl:when>
                <xsl:when test="contains($codePacs,'92.20.Xy')">Carbon cycling, oceans</xsl:when>
                <xsl:when test="contains($codePacs,'92.30.Wx')">Palynology (paleoceanography)</xsl:when>
                <xsl:when test="contains($codePacs,'92.40.Je')">Evapotranspiration (hydrology)</xsl:when>
                <xsl:when test="contains($codePacs,'92.40.Oj')">Plant ecology</xsl:when>
                <xsl:when test="contains($codePacs,'92.40.Zg')">Hydrometeorology, hydroclimatology</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.-e')">Properties and dynamics of the atmosphere; meteorology</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Aa')">Modeling and model calibration</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Bh')">General circulation</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Ek')">Convection, turbulence, and diffusion</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Fm')">Boundary layer structure and processes</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.H-')">Atmospheric composition, structure, and properties</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Iv')">Paleoclimatology</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Hp')">Chemical composition and chemical interactions</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Jq')">Water in the atmosphere</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Ls')">Ion chemistry of the atmosphere</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Mt')">Particles and aerosols</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Nv')">Cloud physics and chemistry</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Pw')">Atmospheric electricity, lightning</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Qx')">Storms</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Ry')">Climatology, climate change and variability</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Sz')">Air quality and air pollution</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Ta')">Electromagnetic wave propagation</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Vb')">Radiative processes, solar radiation</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Wc')">Weather analysis and prediction</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.Xg')">Stratosphere/troposphere interactions</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.hc')">Mesospheric composition, energy deposition, constituent transport and chemistry</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.hd')">Stratospheric composition and chemistry</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.hf')">Tropospheric composition and chemistry, constituent transport and chemistry</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.hh')">Acoustic gravity waves, tides, and compressional waves</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.hk')">Convection, turbulence, and diffusion</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.hv')">Pressure, density, and temperature</xsl:when>
                <xsl:when test="contains($codePacs,'92.60.hw')">Airglow and aurorae</xsl:when>
                <xsl:when test="contains($codePacs,'92.70.Gt')">Climate dynamics</xsl:when>
                <xsl:when test="contains($codePacs,'92.70.Kb')">Climate, regional change</xsl:when>
                            <xsl:when test="contains($codePacs,'92.90.+x')">Other topics in hydrospheric and atmospheric geophysics</xsl:when>
                            <xsl:when test="contains($codePacs,'93.00.00')">Geophysical observations, instrumentation, and techniques</xsl:when>
                            <xsl:when test="contains($codePacs,'93.30.Bz')">Africa</xsl:when>
                            <xsl:when test="contains($codePacs,'93.30.Db')">Asia</xsl:when>
                            <xsl:when test="contains($codePacs,'93.85.+q')">Instrumentation and techniques for geophysical research</xsl:when>
                            <xsl:when test="contains($codePacs,'93.85.-q')">Instruments and techniques for geophysical research: Exploration geophysics</xsl:when>
                            <xsl:when test="contains($codePacs,'93.85.Jk')">Magnetic and electrical methods</xsl:when>
                            <xsl:when test="contains($codePacs,'94.00.00')">Physics of the ionosphere and magnetosphere</xsl:when>
                            <xsl:when test="contains($codePacs,'94.05.-a')">Space plasma physics</xsl:when>
                            <xsl:when test="contains($codePacs,'94.05.Dd')">Radiation processes</xsl:when>
                            <xsl:when test="contains($codePacs,'94.05.Jq')">Spacecraft sheaths, wakes, and charging</xsl:when>
                            <xsl:when test="contains($codePacs,'94.05.Sd')">Space weather</xsl:when>
                            <xsl:when test="contains($codePacs,'94.10.-s')">Physics of the neutral atmosphere</xsl:when>
                            <xsl:when test="contains($codePacs,'94.10.Lf')">Convection, diffusion, mixing, turbulence, and fallout</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.-y')">Physics of the ionosphere</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.Ac')">Auroral ionosphere</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.Bb')">Wave propagation</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.D-')">Ionospheric structure, composition</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.Fg')">Plasma temperature and density</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.Ss')">Electric fields; current system</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.Tt')">Ionospheric soundings; active experiments</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.Vv')">Ionospheric disturbances, irregularities, and storms</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.Xa')">Meteor-trail physics</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.de')">D region</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.dg')">E region</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.dj')">F region</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.dk')">Polar cap ionosphere</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.dv')">Ion chemistry and composition; ionization mechanisms</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.wc')">Plasma motion; plasma convection; particle acceleration</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.wf')">Plasma waves and instabilities</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.wh')">Ionosphere/magnetosphere interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.wj')">Wave/particle interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.wl')">Plasma interactions with dust and aerosols</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.wq')">Solar radiation and cosmic ray effects</xsl:when>
                            <xsl:when test="contains($codePacs,'94.20.ws')">Electromagnetic wave propagation</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.-d')">Physics of the magnetosphere</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.Aa')">Auroral phenomena in magnetosphere</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.Hn')">Energetic trapped particles</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.Kq')">Electric fields, field-aligned currents and current systems, and ring currents</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.Lr')">Magnetic storms, substorms</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.Ms')">Magnetic pulsations</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.Ny')">Energetic particle precipitation</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.Tz')">Electromagnetic wave propagation</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.Va')">Magnetosphere interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.Xy')">Radiation belts</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.cg')">Magnetospheric cusp</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.ch')">Magnetopause</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.cl')">Magnetotail</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.cq')">MHD waves, plasma waves, and instabilities</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.cs')">Plasma motion; plasma convection</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.ct')">Plasma sheet</xsl:when>
                            <xsl:when test="contains($codePacs,'94.30.cv')">Plasmasphere</xsl:when>
                            <xsl:when test="contains($codePacs,'94.80.+g')">Instrumentation for space plasma physics, ionosphere, and magnetosphere</xsl:when>
                            <xsl:when test="contains($codePacs,'95.00.00')">Fundamental astronomy and astrophysics; instrumentation, techniques, and astronomical observations</xsl:when>
                            <xsl:when test="contains($codePacs,'95.10.-a')">Fundamental astronomy</xsl:when>
                            <xsl:when test="contains($codePacs,'95.10.Ce')">Celestial mechanics</xsl:when>
                            <xsl:when test="contains($codePacs,'95.10.Eg')">Orbit determination and improvement</xsl:when>
                            <xsl:when test="contains($codePacs,'95.10.Jk')">Astrometry and reference systems</xsl:when>
                            <xsl:when test="contains($codePacs,'95.10.Km')">Ephemerides, almanacs, and calendars</xsl:when>
                            <xsl:when test="contains($codePacs,'95.30.-k')">Fundamental aspects of astrophysics</xsl:when>
                            <xsl:when test="contains($codePacs,'95.30.Cq')">Elementary particle processes</xsl:when>
                            <xsl:when test="contains($codePacs,'95.30.Dr')">Atomic processes and interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'95.30.Gv')">Radiation mechanisms; polarization</xsl:when>
                            <xsl:when test="contains($codePacs,'95.30.Jx')">Radiative transfer; scattering</xsl:when>
                            <xsl:when test="contains($codePacs,'95.30.Ky')">Atomic and molecular data, spectra, and spectral parameters (opacities, rotation constants, line identification, oscillator strengths, gf values, transition probabilities, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'95.30.Lz')">Hydrodynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'95.30.Qd')">Magnetohydrodynamics and plasmas</xsl:when>
                            <xsl:when test="contains($codePacs,'95.30.Sf')">Relativity and gravitation</xsl:when>
                            <xsl:when test="contains($codePacs,'95.30.Tg')">Thermodynamic processes, conduction, convection, equations of state</xsl:when>
                            <xsl:when test="contains($codePacs,'95.30.Wi')">Dust processes (condensation, evaporation, sputtering, mantle growth, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'95.35.+d')">Dark matter</xsl:when>
                            <xsl:when test="contains($codePacs,'95.40.+s')">Artificial Earth satellites</xsl:when>
                            <xsl:when test="contains($codePacs,'95.45.+i')">Observatories and site testing</xsl:when>
                            <xsl:when test="contains($codePacs,'95.55.-n')">Astronomical and space-research instrumentation</xsl:when>
                            <xsl:when test="contains($codePacs,'95.55.Br')">Astrometric and interferometric instruments</xsl:when>
                            <xsl:when test="contains($codePacs,'95.55.Cs')">Ground-based ultraviolet, optical and infrared telescopes</xsl:when>
                            <xsl:when test="contains($codePacs,'95.55.Ev')">Solar instruments</xsl:when>
                            <xsl:when test="contains($codePacs,'95.55.Fw')">Space-based ultraviolet, optical, and infrared telescopes</xsl:when>
                            <xsl:when test="contains($codePacs,'95.55.Jz')">Radio telescopes and instrumentation; heterodyne receivers</xsl:when>
                            <xsl:when test="contains($codePacs,'95.55.Ka')">X- and γ-ray telescopes and instrumentation</xsl:when>
                            <xsl:when test="contains($codePacs,'95.55.Qf')">Photometric, polarimetric, and spectroscopic instrumentation</xsl:when>
                            <xsl:when test="contains($codePacs,'95.55.Vj')">Neutrino, muon, pion, and other elementary particle detectors; cosmic ray detectors</xsl:when>
                            <xsl:when test="contains($codePacs,'95.55.Ym')">Gravitational radiation detectors; mass spectrometers; and other instrumentation and techniques</xsl:when>
                            <xsl:when test="contains($codePacs,'95.75.-z')">Observation and data reduction techniques; computer modeling and simulation</xsl:when>
                            <xsl:when test="contains($codePacs,'95.75.De')">Photography and photometry (including microlensing techniques)</xsl:when>
                            <xsl:when test="contains($codePacs,'95.75.Fg')">Spectroscopy and spectrophotometry</xsl:when>
                            <xsl:when test="contains($codePacs,'95.75.Kk')">Interferometry</xsl:when>
                            <xsl:when test="contains($codePacs,'95.75.Mn')">Image processing (including source extraction)</xsl:when>
                            <xsl:when test="contains($codePacs,'95.75.Qr')">Adaptive and segmented optics</xsl:when>
                            <xsl:when test="contains($codePacs,'95.80.+p')">Astronomical catalogs, atlases, sky surveys, databases, retrieval systems, archives, etc.</xsl:when>
                            <xsl:when test="contains($codePacs,'95.85.-e')">Astronomical observations (additional primary heading(s) must be chosen with these entries to represent the astronomical objects and/or properties studied)</xsl:when>
                            <xsl:when test="contains($codePacs,'95.85.Bh')">Radio, microwave (&gt;1 mm)</xsl:when>
                            <xsl:when test="contains($codePacs,'95.85.Fm')">Submillimeter (300 μm-1 mm)</xsl:when>
                            <xsl:when test="contains($codePacs,'95.85.Jq')">Near infrared (0.75-3 μm)</xsl:when>
                            <xsl:when test="contains($codePacs,'95.85.Pw')">γB3;-ray</xsl:when>
                            <xsl:when test="contains($codePacs,'95.85.Ry')">Neutrino, muon, pion, and other elementary particles; cosmic rays</xsl:when>
                            <xsl:when test="contains($codePacs,'95.85.Sz')">Gravitational radiation, magnetic fields, and other observations</xsl:when>
                            <xsl:when test="contains($codePacs,'96.00.00')">Solar system; planetology</xsl:when>
                            <xsl:when test="contains($codePacs,'96.10.+i')">General; solar nebula; cosmogony</xsl:when>
                            <xsl:when test="contains($codePacs,'96.12.-a')">Planetology of solid surface planets</xsl:when>
                            <xsl:when test="contains($codePacs,'96.12.Bc')">Origin and evolution</xsl:when>
                            <xsl:when test="contains($codePacs,'96.12.De')">Orbital and rotational dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'96.12.Fe')">Gravitational fields</xsl:when>
                            <xsl:when test="contains($codePacs,'96.12.Hg')">Magnetic field and magnetism</xsl:when>
                            <xsl:when test="contains($codePacs,'96.12.Jt')">Atmospheres</xsl:when>
                            <xsl:when test="contains($codePacs,'96.12.Kz')">Surfaces</xsl:when>
                            <xsl:when test="contains($codePacs,'96.12.Ma')">Composition</xsl:when>
                            <xsl:when test="contains($codePacs,'96.12.Pc')">Interiors</xsl:when>
                            <xsl:when test="contains($codePacs,'96.15.De')">Orbital and rotational dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'96.15.Ef')">Gravitational fields</xsl:when>
                            <xsl:when test="contains($codePacs,'96.15.Gh')">Magnetic field and magnetism</xsl:when>
                            <xsl:when test="contains($codePacs,'96.15.Hy')">Atmospheres</xsl:when>
                            <xsl:when test="contains($codePacs,'96.15.Uv')">Rings and dust</xsl:when>
                            <xsl:when test="contains($codePacs,'96.20.-n')">Moon</xsl:when>
                            <xsl:when test="contains($codePacs,'96.20.Dt')">Features, landmarks, mineralogy, and petrology</xsl:when>
                            <xsl:when test="contains($codePacs,'96.20.Jz')">Gravitational field, selenodesy, and magnetic fields</xsl:when>
                            <xsl:when test="contains($codePacs,'96.25.-f')">Planetology of comets and small bodies</xsl:when>
                            <xsl:when test="contains($codePacs,'96.25.De')">Orbital and rotational dynamics</xsl:when>
                            <xsl:when test="contains($codePacs,'96.25.Hs')">Composition</xsl:when>
                            <xsl:when test="contains($codePacs,'96.25.Qr')">Interactions with solar wind plasma and fields</xsl:when>
                            <xsl:when test="contains($codePacs,'96.25.St')">Plasma and MHD instabilities</xsl:when>
                            <xsl:when test="contains($codePacs,'96.25.Tg')">Radiation and spectra</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.-t')">Solar system objects</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.Cw')">Comets</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.Dz')">Mercury</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.Ea')">Venus</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.Gc')">Mars</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.Hf')">Martian satellites</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.Kf')">Jupiter</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.Mh')">Saturn</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.Pj')">Uranus</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.Qk')">Uranian satellites</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.Vb')">Dust, extraterrestrial materials</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.Wr')">Planetary rings</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.Ys')">Asteroids, meteoroids</xsl:when>
                            <xsl:when test="contains($codePacs,'96.30.Za')">Meteors, meteorites and tektites</xsl:when>
                            <xsl:when test="contains($codePacs,'96.40.Fg')">Energetic solar particles and photons</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.-e')">Interplanetary physics</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.Bh')">Interplanetary magnetic fields</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.Ci')">Solar wind plasma; sources of solar wind</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.Dj')">Interplanetary dust and gas</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.Ek')">Heliopause and solar wind termination</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.Fm')">Planetary bow shocks; interplanetary shocks</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.Gn')">Comets</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.Qx')">Corotating streams</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.S-')">Cosmic rays</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.Tf')">MHD waves; plasma waves, turbulence</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.Vg')">Energetic particles</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.Xy')">Heliosphere/interstellar medium interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.sb')">Composition, energy spectra and interactions</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.sd')">Extensive air showers</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.sf')">Interactions with terrestrial matter</xsl:when>
                            <xsl:when test="contains($codePacs,'96.50.sh')">Interplanetary propagation and effects</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.-j')">Solar physics</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Bn')">Diameter, rotation, and mass</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Fs')">Composition</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Hv')">Electric and magnetic fields, solar magnetism</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Iv')">Magnetic reconnection</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Jw')">Solar interior</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Ly')">Helioseismology, pulsations, and shock waves</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Mz')">Photosphere</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Na')">Chromosphere</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.P-')">Corona</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Q-')">Solar activity</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Qc')">Sunspots, faculae, plages</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Rd')">Flares, bursts, and related phenomena</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Se')">Prominences</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Tf')">Solar electromagnetic emission</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Ub')">Solar irradiance</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.Vg')">Particle emission, solar wind</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.pf')">Coronal loops, streamers</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.qd')">Sun spots, solar cycles</xsl:when>
                            <xsl:when test="contains($codePacs,'96.60.qe')">Flares</xsl:when>
                            <xsl:when test="contains($codePacs,'96.90.+c')">Other topics on the Solar system and planetology</xsl:when>
                            <xsl:when test="contains($codePacs,'97.00.00')">Stars</xsl:when>
                            <xsl:when test="contains($codePacs,'97.10.-q')">Stellar characteristics and properties</xsl:when>
                            <xsl:when test="contains($codePacs,'97.10.Bt')">Star formation</xsl:when>
                            <xsl:when test="contains($codePacs,'97.10.Cv')">Stellar structure, interiors, evolution, nucleosynthesis, ages</xsl:when>
                            <xsl:when test="contains($codePacs,'97.10.Ex')">Stellar atmospheres (photospheres, chromospheres, coronae, magnetospheres); radiative transfer; opacity and line formation</xsl:when>
                            <xsl:when test="contains($codePacs,'97.10.Fy')">Circumstellar shells, clouds, and expanding envelopes; circumstellar masers</xsl:when>
                            <xsl:when test="contains($codePacs,'97.10.Gz')">Accretion and accretion disks</xsl:when>
                            <xsl:when test="contains($codePacs,'97.10.Kc')">Stellar rotation</xsl:when>
                            <xsl:when test="contains($codePacs,'97.10.Ld')">Magnetic and electric fields; polarization of starlight</xsl:when>
                            <xsl:when test="contains($codePacs,'97.10.Nf')">Masses</xsl:when>
                            <xsl:when test="contains($codePacs,'97.10.Ri')">Luminosities; magnitudes; effective temperatures, colors, and spectral classification</xsl:when>
                            <xsl:when test="contains($codePacs,'97.10.Sj')">Pulsations, oscillations, and stellar seismology</xsl:when>
                            <xsl:when test="contains($codePacs,'97.10.Tk')">Abundances, chemical composition</xsl:when>
                            <xsl:when test="contains($codePacs,'97.10.Vm')">Distances, parallaxes</xsl:when>
                            <xsl:when test="contains($codePacs,'97.20.-w')">Normal stars (by class): general or individual</xsl:when>
                            <xsl:when test="contains($codePacs,'97.20.Ec')">Main-sequence: early-type stars (O and B)</xsl:when>
                            <xsl:when test="contains($codePacs,'97.20.Li')">Giant and subgiant stars</xsl:when>
                            <xsl:when test="contains($codePacs,'97.20.Pm')">Supergiant stars</xsl:when>
                            <xsl:when test="contains($codePacs,'97.20.Rp')">Faint blue stars</xsl:when>
                            <xsl:when test="contains($codePacs,'97.21.+a')">Pre-main sequence objects, young stellar objects</xsl:when>
                            <xsl:when test="contains($codePacs,'97.30.Dg')">Low-amplitude blue variables (alpha Cygni, beta Cephei, delta Scuti, delta Delphini, delta Canis Majoris, SX Phoenicius, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'97.30.Eh')">Emission-line stars (Of, Be, Luminous Blue Variables, Wolf-Rayet, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'97.30.Fi')">Chemically peculiar stars (Ap, Am, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'97.30.Kn')">RR Lyrae stars; RV Tauri and PV Telescopii variables</xsl:when>
                            <xsl:when test="contains($codePacs,'97.30.Nr')">Flare stars (UV Ceti, RS Canum Venaticorum, FU Orionis, R Coronae Borealis variables, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'97.30.Qt')">Novae, dwarf novae, recurrent novae, and other cataclysmic</xsl:when>
                            <xsl:when test="contains($codePacs,'97.60.Bw')">Supernovae</xsl:when>
                            <xsl:when test="contains($codePacs,'97.60.Gb')">Pulsars</xsl:when>
                            <xsl:when test="contains($codePacs,'97.60.Jd')">Neutron stars</xsl:when>
                            <xsl:when test="contains($codePacs,'97.60.Lf')">Black holes</xsl:when>
                            <xsl:when test="contains($codePacs,'97.80.-d')">Binary and multiple stars</xsl:when>
                            <xsl:when test="contains($codePacs,'97.80.Fk')">Spectroscopic binaries; close binaries</xsl:when>
                            <xsl:when test="contains($codePacs,'97.80.Gm')">Cataclysmic binaries</xsl:when>
                            <xsl:when test="contains($codePacs,'97.80.Hn')">Eclipsing binaries</xsl:when>
                            <xsl:when test="contains($codePacs,'97.80.Jp')">X-ray binaries</xsl:when>
                            <xsl:when test="contains($codePacs,'98.00.00')">Stellar systems; interstellar medium; galactic and extragalactic objects and systems; the universe</xsl:when>
                            <xsl:when test="contains($codePacs,'98.35.-a')">Characteristics and properties of the Milky Way galaxy</xsl:when>
                            <xsl:when test="contains($codePacs,'98.35.Ac')">Origin, formation, evolution, age, and star formation</xsl:when>
                            <xsl:when test="contains($codePacs,'98.35.Df')">Kinematics, dynamics, and rotation</xsl:when>
                            <xsl:when test="contains($codePacs,'98.35.Eg')">Electric and magnetic fields</xsl:when>
                            <xsl:when test="contains($codePacs,'98.35.Hj')">Spiral arms and galactic disk</xsl:when>
                            <xsl:when test="contains($codePacs,'98.35.Jk')">Galactic center, bar, circumnuclear matter, and bulge (including black hole and distance measurements)</xsl:when>
                            <xsl:when test="contains($codePacs,'98.38.-j')">Interstellar medium (ISM) and nebulae in Milky Way</xsl:when>
                            <xsl:when test="contains($codePacs,'98.38.Am')">Physical properties (abundances, electron density, magnetic fields, scintillation, scattering, kinematics, dynamics, turbulence, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'98.38.Bn')">Atomic, molecular, chemical, and grain processes</xsl:when>
                            <xsl:when test="contains($codePacs,'98.38.Er')">Interstellar masers</xsl:when>
                            <xsl:when test="contains($codePacs,'98.38.Jw')">Infrared emission</xsl:when>
                            <xsl:when test="contains($codePacs,'98.38.Kx')">Intercloud medium (ICM); hot and highly ionized gas; bubbles</xsl:when>
                            <xsl:when test="contains($codePacs,'98.38.Ly')">Planetary nebulae</xsl:when>
                            <xsl:when test="contains($codePacs,'98.38.Mz')">Supernova remnants</xsl:when>
                            <xsl:when test="contains($codePacs,'98.52.Nr')">Spiral galaxies</xsl:when>
                            <xsl:when test="contains($codePacs,'98.54.-h')">Quasars; active or peculiar galaxies, objects, and systems</xsl:when>
                            <xsl:when test="contains($codePacs,'98.54.Aj')">Quasars</xsl:when>
                            <xsl:when test="contains($codePacs,'98.54.Cm')">Active and peculiar galaxies and related systems (including BL Lacertae objects, blazars, Seyfert galaxies, Markarian galaxies, and active galactic nuclei)</xsl:when>
                            <xsl:when test="contains($codePacs,'98.54.Ep')">Starburst galaxies and infrared excess galaxies</xsl:when>
                            <xsl:when test="contains($codePacs,'98.54.Gr')">Radio galaxies</xsl:when>
                            <xsl:when test="contains($codePacs,'98.56.Si')">Magellanic Clouds and other irregular galaxies</xsl:when>
                            <xsl:when test="contains($codePacs,'98.56.Wm')">Dwarf galaxies (elliptical, irregular, and spheroidal)</xsl:when>
                            <xsl:when test="contains($codePacs,'98.58.-w')">Interstellar medium (ISM) and nebulae in external galaxies</xsl:when>
                            <xsl:when test="contains($codePacs,'98.58.Bz')">Atomic, molecular, chemical, and grain processes</xsl:when>
                            <xsl:when test="contains($codePacs,'98.58.Ca')">Interstellar dust grains; diffuse emission; infrared cirrus</xsl:when>
                            <xsl:when test="contains($codePacs,'98.58.Db')">Molecular clouds, H2 clouds, dense clouds, and dark clouds</xsl:when>
                            <xsl:when test="contains($codePacs,'98.58.Hf')">H II regions; emission and reflection nebulae</xsl:when>
                            <xsl:when test="contains($codePacs,'98.58.Kh')">Intercloud medium (ICM); hot and highly ionized gas; bubbles</xsl:when>
                            <xsl:when test="contains($codePacs,'98.58.Li')">Planetary nebulae</xsl:when>
                            <xsl:when test="contains($codePacs,'98.58.Mj')">Supernova remnants</xsl:when>
                            <xsl:when test="contains($codePacs,'98.62.Ai')">Origin, formation, evolution, age, and star formation</xsl:when>
                            <xsl:when test="contains($codePacs,'98.62.Dm')">Kinematics, dynamics, and rotation</xsl:when>
                            <xsl:when test="contains($codePacs,'98.62.Gq')">Galactic halos</xsl:when>
                            <xsl:when test="contains($codePacs,'98.62.Hr')">Spiral arms and bars; galactic disks</xsl:when>
                            <xsl:when test="contains($codePacs,'98.62.Js')">Galactic nuclei (including black holes), circumnuclear matter, and bulges</xsl:when>
                            <xsl:when test="contains($codePacs,'98.62.Mw')">Infall, accretion, and accretion disks</xsl:when>
                            <xsl:when test="contains($codePacs,'98.62.Py')">Distances, redshifts, radial velocities; spatial distribution of galaxies</xsl:when>
                            <xsl:when test="contains($codePacs,'98.62.Ra')">Intergalactic matter; quasar absorption and emission-line systems; Lyman forest</xsl:when>
                            <xsl:when test="contains($codePacs,'98.62.Sb')">Gravitational lenses and luminous arcs</xsl:when>
                            <xsl:when test="contains($codePacs,'98.65.-r')">Galaxy groups, clusters, and superclusters; large scale structure of the Universe</xsl:when>
                            <xsl:when test="contains($codePacs,'98.65.Cw')">Galaxy clusters</xsl:when>
                            <xsl:when test="contains($codePacs,'98.65.Dx')">Superclusters; large-scale structure of the Universe (including voids, pancakes, great wall, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'98.70.-f')">Unidentified sources of radiation outside the Solar System</xsl:when>
                            <xsl:when test="contains($codePacs,'98.70.Dk')">Radio sources</xsl:when>
                            <xsl:when test="contains($codePacs,'98.70.Lt')">IR sources</xsl:when>
                            <xsl:when test="contains($codePacs,'98.70.Qy')">X-ray sources; X-ray bursts</xsl:when>
                            <xsl:when test="contains($codePacs,'98.70.Rz')">γ-ray sources; γ-ray bursts</xsl:when>
                            <xsl:when test="contains($codePacs,'98.70.Sa')">Cosmic rays</xsl:when>
                            <xsl:when test="contains($codePacs,'98.70.Vc')">Background radiations</xsl:when>
                            <xsl:when test="contains($codePacs,'98.80.-k')">Cosmology</xsl:when>
                            <xsl:when test="contains($codePacs,'98.80.Bp')">Origin and formation of the Universe</xsl:when>
                            <xsl:when test="contains($codePacs,'98.80.Cq')">Particle-theory and field-theory models of the early Universe (including cosmic pancakes, cosmic strings, chaotic phenomena, inflationary universe, etc.)</xsl:when>
                            <xsl:when test="contains($codePacs,'98.80.Es')">Observational cosmology (including Hubble constant, distance scale, cosmological constant, early Universe, etc)</xsl:when>
                            <xsl:when test="contains($codePacs,'98.80.Ft')">Origin, formation, and abundances of the elements</xsl:when>
                            <xsl:when test="contains($codePacs,'98.80.Jk')">Mathematical and relativistic aspects of cosmology</xsl:when>
                            <xsl:when test="contains($codePacs,'98.80.Qc')">Quantum cosmology</xsl:when>
                            <xsl:when test="contains($codePacs,'99.10.Cd')">Errata</xsl:when>
                            <xsl:when test="contains($codePacs,'99.10.Np')">Editorial note</xsl:when>
                        </xsl:choose>
            </term>
        </keywords>
    </xsl:template>


    <!--  keywords  ==> keywords
        
          IN: classification  <<
         OUT: profileDesc/textClass
              >> keywords
    -->
    <xsl:template match="classifications/keywords">
        <keywords>
            <xsl:if test="@type">
                <xsl:attribute name="scheme" select="@type"/>
            </xsl:if>
            <xsl:apply-templates/>
        </keywords>
    </xsl:template>

    <!--  
         IN: celui au-dessus  <<
        OUT: profileDesc/textClass/keywords
          >> term
    -->
    <xsl:template match="classifications/keywords/keyword">
        <term>
            <xsl:choose>
                <xsl:when test="@code">
                    <xsl:value-of select="@code"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </term>
    </xsl:template>


    <!-- On traite les subject-areas comme des classCode  
        
        subject-areas ==> classCode (en enlevant une imbrication)
        
        IN: classification  <<
        OUT: skip inside
    -->    
    <xsl:template match="classifications/subject-areas">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!--  
        IN: celui au-dessus  <<
        OUT: profileDesc/textClass
        >> classCode +
    -->
    <xsl:template match="classifications/subject-areas/category">
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
        <title level="m" type="main">
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
        <date when="{.}">
            <xsl:value-of select="."/>
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
