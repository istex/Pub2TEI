<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" version="2.0" exclude-result-prefixes="#all">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> June 14, 2021</xd:p>
            <xd:p><xd:b>Author:</xd:b> Stéphanie GREGORIO</xd:p>
            <xd:p>Parsing of Degruyter ebooks subject codes</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="identifySubjectCode">
        <xsl:param name="theCode"/>
        <xsl:choose>
            <xsl:when test="normalize-space($theCode)='SC-AD'">Architecture and Design</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01'">Architecture and Design / Architecture</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01-01'">Architecture and Design/ Architecture/ Architects, Buildings</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01-02'">Architecture and Design/ Architecture/ Construction</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01-03'">Architecture and Design/ Architecture/ Materials</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01-04'">Architecture and Design/ Architecture/ Types, Functions</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01-05'">Architecture and Design/ Architecture/ Cities, Regions</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01-06'">Architecture and Design/ Architecture/ Urbanism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01-07'">Architecture and Design / Architecture/ Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01-08'">Architecture and Design / Architecture/ Professional Practice</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01-09'">Architecture and Design/ Architecture/  Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01-10'">Architecture and Design/ Architecture/  History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01-10-01'">Architecture and Design / Architecture / History/ History, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01-10-02'">Architecture and Design/ Architecture/  History/ Dehio</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-01-10-03'">Architecture and Design/ Architecture/  History/ Conservation, Preservation, Restauration </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-02'">Architecture and Design / Landscape Architecture</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-02-01'">Architecture and Design / Landscape Architecture / Landscape Architects</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-02-02'">Architecture and Design / Landscape Architecture / Gardens, Landscapes</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-02-03'">Architecture and Design / Landscape Architecture / Construction, Materials</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-02-04'">Architecture and Design / Landscape Architecture / Studies, Professional Practice</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-03'">Architecture and Design / Design</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-03-01'">Architecture and Design / Design / Designers </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-03-02'">Architecture and Design / Design / Product Design, Interiors, Materials </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-03-03'">Architecture and Design / Design / Graphics, Communication</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-03-04'">Architecture and Design / Design / Studies, Professional Practice</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AD-04'">Architecture and Design / Architecture and Design, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR'">Arts</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-01'">Arts / Arts, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-02'">Arts / Art Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-03'">Arts / Genres</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-03-01'">Arts / Genres / Painting</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-03-02'">Arts / Genres / Sculpture</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-03-03'">Arts / Genres / Photography</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-03-04'">Arts / Genres / Graphic Arts</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-03-05'">Arts / Genres / Applied Arts</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-03-06'">Arts / Genres / Genres, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-04'">Arts / Periods</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-04-01'">Arts / Periods / 8th-15th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-04-02'">Arts / Periods / 16th-17th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-04-03'">Arts / Periods / 18th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-04-04'">Arts / Periods / 19th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-04-05'">Arts / Periods / 20th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-04-06'">Arts / Periods / 21st Century </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-05'">Arts / Museums and Collections</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-06'">Arts / Art Market and Provenance Research</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-07'">Arts / History of Art History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-08'">Arts / Exhibition Catalogues</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-09'">Arts / Dehio</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-10'">Arts / Conservation, Preservation, Restauration </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11'">Arts / Art Guides</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-01'">Arts / Art Guides / Baden-Württemberg</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-02'">Arts / Art Guides / Bavaria</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-03'">Arts / Art Guides / Berlin</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-04'">Arts / Art Guides / Brandenburg</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-05'">Arts / Art Guides / Bremen</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-06'">Arts / Art Guides / Hamburg</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-07'">Arts / Art Guides / Hesse</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-08'">Arts / Art Guides / Lower Saxony</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-09'">Arts / Art Guides / Mecklenburg-Vorpommern</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-10'">Arts / Art Guides / North Rhine-Westphalia</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-11'">Arts / Art Guides / Rhineland-Palatinate</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-12'">Arts / Art Guides / Saarland</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-13'">Arts / Art Guides / Saxony</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-14'">Arts / Art Guides / Saxony-Anhalt</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-15'">Arts / Art Guides / Schleswig-Holstein</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-11-16'">Arts / Art Guides / Thuringa</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AR-12'">Arts / Antiques and Collectibles</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS'">Asian and Pacific Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-06'">Asian and Pacific Studies / East Asia</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-06-01'">Asian and Pacific Studies / East Asia / China</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-06-02'">Asian and Pacific Studies / East Asia / Japan</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-06-03'">Asian and Pacific Studies / East Asia / Korea</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-07'">Asian and Pacific Studies / North and Central Asia</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-08'">Asian and Pacific Studies / Oceania and the Pacific</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-08-01'">Asian and Pacific Studies / Oceania and the Pacific / Australia and New Zealand</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-08-02'">Asian and Pacific Studies / Oceania and the Pacific / New Guinea</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-08-03'">Asian and Pacific Studies / Oceania and the Pacific / Other Pacific Islands</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-09'">Asian and Pacific Studies / South Asia</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-09-01'">Asian and Pacific Studies / South Asia / India</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-09-02'">Asian and Pacific Studies / South Asia / South Asia, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-10'">Asian and Pacific Studies / Southeast Asia</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-11'">Asian and Pacific Studies / Western Asia</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-11-01'">Asian and Pacific Studies / Western Asia / The Arab world</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-11-02'">Asian and Pacific Studies / Western Asia / Iran</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-11-03'">Asian and Pacific Studies / Western Asia / Israel</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-11-04'">Asian and Pacific Studies / Western Asia / Turkey</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-AS-11-05'">Asian and Pacific Studies / Western Asia / Western Asia, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH'">Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-01'">Chemistry / Analytical Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-02'">Chemistry / Biochemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-03'">Chemistry / Environmental Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-05'">Chemistry / Sustainable and Green Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-06'">Chemistry / Inorganic Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-08'">Chemistry / Coordination Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-10'">Chemistry / Solid State Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-11'">Chemistry / Nuclear Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-12'">Chemistry / Organic Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-14'">Chemistry / Catalysis</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-15'">Chemistry / Macromolecular Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-16'">Chemistry / Pharmaceutical and Medicinal Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-17'">Chemistry / Physical Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-19'">Chemistry / Electrochemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-20'">Chemistry / Spectroscopy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-22'">Chemistry / Theoretical and Quantum Chemistry </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-23'">Chemistry / Computational Chemistry and Molecular Modeling</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-25'">Chemistry / Toxicology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CH-26'">Chemistry / Chemistry, other </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL'">Classical and Ancient Near Eastern Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01'">Classical and Ancient Near Eastern Studies / Classical Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-01'">Classical and Ancient Near Eastern Studies / Classical Studies / Greek</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-01-01'">Classical and Ancient Near Eastern Studies / Classical Studies / Greek / Greek Authors</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-01-02'">Classical and Ancient Near Eastern Studies / Classical Studies / Greek / Greek Language and Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-02'">Classical and Ancient Near Eastern Studies / Classical Studies / Latin</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-02-01'">Classical and Ancient Near Eastern Studies / Classical Studies / Latin / Latin Authors</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-02-02'">Classical and Ancient Near Eastern Studies / Classical Studies / Latin / Latin Language and Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-03'">Classical and Ancient Near Eastern Studies / Classical Studies / Ancient Science and Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-04'">Classical and Ancient Near Eastern Studies / Classical Studies / Ancient History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-05'">Classical and Ancient Near Eastern Studies / Classical Studies / Classical Archaeology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-06'">Classical and Ancient Near Eastern Studies / Classical Studies / Classical Tradition and Reception</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-07'">Classical and Ancient Near Eastern Studies / Classical Studies / Papyrology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-08'">Classical and Ancient Near Eastern Studies / Classical Studies / Epigraphy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-09'">Classical and Ancient Near Eastern Studies / Classical Studies / Ancient Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-10'">Classical and Ancient Near Eastern Studies / Classical Studies / Early Christianity</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-01-11'">Classical and Ancient Near Eastern Studies / Classical Studies / Ancient Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-02'">Classical and Ancient Near Eastern Studies / Ancient Near Eastern Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-03'">Classical and Ancient Near Eastern Studies / Byzantine Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-04'">Classical and Ancient Near Eastern Studies / Egyptology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CL-05'">Classical and Ancient Near Eastern Studies / Classical Studies, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO'">Computer Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-01'">Computer Sciences / Fundamentals of Computer Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-02'">Computer Sciences / History of Computer Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-03'">Computer Sciences / Artificial Intelligence</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-04'">Computer Sciences / Theoretical Computer Sciences </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-05'">Computer Sciences / Information Technology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-06'">Computer Sciences / Project Management</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-07'">Computer Sciences / Computer Architecture</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-08'">Computer Sciences / Programming and Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-09'">Computer Sciences / Algorithms</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-10'">Computer Sciences / Software Development</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-11'">Computer Sciences / IT-Security and Cryptology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-12'">Computer Sciences / Databases and Data Mining</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-14'">Computer Sciences / Computer Science and Media</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-15'">Computer Sciences / Operating Systems</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-16'">Computer Sciences / Business Informatics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-17'">Computer Sciences / Bioinformatics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-18'">Computer Sciences / Computer Sciences, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-19'">Computer Sciences / Computer Sciences in Industry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-20'">Computer Sciences / Computer Sciences in the Humanities</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-21'">Computer Sciences / Computer Sciences in Medicine and Life Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-22'">Computer Sciences / Computer Sciences in Natural Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-23'">Computer Sciences / Graphics/Sound/Video</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-24'">Computer Sciences / Networking</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CO-25'">Computer Sciences / Human-Machine Interaction</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS'">Cultural Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-01'">Cultural Studies / Media Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-01-01'">Cultural Studies / Media Studies / Media Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-01-02'">Cultural Studies / Media Studies / Media History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-01-03'">Cultural Studies / Media Studies / Media Aesthetics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-02'">Cultural Studies / Genres and Media in Cultural Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-02-01'">Cultural Studies / Genres and Media in Cultural Studies / General Genre and Media Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-02-02'">Cultural Studies / Genres and Media in Cultural Studies / Drama, Theater</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-02-03'">Cultural Studies / Genres and Media in Cultural Studies / Dance</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-02-04'">Cultural Studies / Genres and Media in Cultural Studies / Film</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-02-05'">Cultural Studies / Genres and Media in Cultural Studies / Music</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-02-06'">Cultural Studies / Genres and Media in Cultural Studies / Visual Arts, Photography</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-02-07'">Cultural Studies / Genres and Media in Cultural Studies / Book</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-02-08'">Cultural Studies / Genres and Media in Cultural Studies / Digital Media and Communication</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-02-09'">Cultural Studies / Genres and Media in Cultural Studies / Other Genres and Media</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-03'">Cultural Studies / Cultural Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-03-01'">Cultural Studies / Cultural Theory / General Cultural Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-03-02'">Cultural Studies / Cultural Theory / Gender Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-03-03'">Cultural Studies / Cultural Theory / Media Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-03-04'">Cultural Studies / Cultural Theory / Political Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-03-05'">Cultural Studies / Cultural Theory / Theories of Society</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-03-06'">Cultural Studies / Cultural Theory / Semiotics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-04'">Cultural Studies / Topics in Cultural Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-04-01'">Cultural Studies / Topics in Cultural Studies / Gender</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-04-02'">Cultural Studies / Topics in Cultural Studies / Media</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-04-03'">Cultural Studies / Topics in Cultural Studies / Society</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-04-04'">Cultural Studies / Topics in Cultural Studies / Popular Culture</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-04-05'">Cultural Studies / Topics in Cultural Studies / Emotions</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-04-06'">Cultural Studies / Topics in Cultural Studies / Memory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-04-07'">Cultural Studies / Topics in Cultural Studies / Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-04-08'">Cultural Studies / Topics in Cultural Studies / Postcolonial Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-04-11'">Cultural Studies / Topics in Cultural Studies / Aging Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-04-12'">Cultural Studies / Topics in Cultural Studies / Human-Animal Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-04-13'">Cultural Studies / Topics in Cultural Studies / Other Topics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-05'">Cultural Studies / History of Cultural Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-CS-06'">Cultural Studies / General Cultural Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC'">Business and Economics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-01'">Business and Economics / Political Economics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-01-01'">Business and Economics / Political Economics / Economic Theory, Systems and Structures</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-01-02'">Business and Economics / Political Economics / Microeconomics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-01-03'">Business and Economics / Political Economics / Macroecomics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-01-04'">Business and Economics / Political Economics / Public Finance and Fiscal Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-01-05'">Business and Economics / Political Economics / Economic Policy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-01-06'">Business and Economics / Political Economics / History of Economics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-01-07'">Business and Economics / Political Economics / Political Economics, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02'">Business and Economics / Business Management</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-01'">Business and Economics / Business Management / Management Accounting, Financial Controlling, Cost Calculation, Investment</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-02'">Business and Economics / Business Management / Financial Reporting, Group Accounting, Accounting and Balancing</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-03'">Business and Economics / Business Management / Marketing, Sales, Customer Relations</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-04'">Business and Economics / Business Management / Management, Organization, Corporate Governance</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-05'">Business and Economics / Business Management / Corporate Social Responsibility (CSR), Compliance Management, Business Ethics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-06'">Business and Economics / Business Management / Business Development, Change Management, Cooperation</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-07'">Business and Economics / Business Management / Entrepreneurship</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-08'">Business and Economics / Business Management / Human Resources, Labor Practice,  Job and Career</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-09'">Business and Economics / Business Management / Business Communication, Business Etiquette</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-10'">Business and Economics / Business Management / Business Management, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11'">Business and Economics / Business Management / Industries</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-01'">Business and Economics / Business Management / Industries / Tourism, Hospitality, Travel</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-02'">Business and Economics / Business Management / Industries / Event Industry, Leisure Industry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-03'">Business and Economics / Business Management / Industries / Sports</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-04'">Business and Economics / Business Management / Industries / Entertainment Industry, Media, Publishing Companies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-05'">Business and Economics / Business Management / Industries / Banks, Financial Service Provider, Insurers</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-06'">Business and Economics / Business Management / Industries / Real Estate</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-07'">Business and Economics / Business Management / Industries / Health Care</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-08'">Business and Economics / Business Management / Industries / Agribusiness, Food Industry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-09'">Business and Economics / Business Management / Industries / Retail, Service Industry,  Skilled Crafts and Trades</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-10'">Business and Economics / Business Management / Industries / Energy Industry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-11'">Business and Economics / Business Management / Industries / Automobile Industry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-12'">Business and Economics / Business Management / Industries / Transportation, Logistics, Air Traffic, Shipping</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-13'">Business and Economics / Business Management / Industries / Non Profit Organizations (NPO), Foundations, Charities, Associations</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-14'">Business and Economics / Business Management / Industries / Small and Medium-Sized Companies (SMU), Small Businesses, Startups</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-15'">Business and Economics / Business Management / Industries / Public Sector, Public Private Partnerships,  Public Administration</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-16'">Business and Economics / Business Management / Industries / Environmental Management</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-17'">Business and Economics / Business Management / Industries / Cultural Management</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-11-18'">Business and Economics / Business Management / Industries / Consulting, Inhouse-Consulting, Internal Audit</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-12'">Business and Economics / Business Management / Business Informatics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-12-01'">Business and Economics / Business Management / Business Informatics / Business Intelligence</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-12-02'">Business and Economics / Business Management / Business Informatics / Information Management</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-12-03'">Business and Economics/ Business Management / Business Informatics / Information and Communications Sytems</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-12-04'">Business and Economics / Business Management / Business Informatics / Internet Economy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-12-05'">Business and Economics / Business Management / Business Informatics / Process Management</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-02-13'">Business and Economics / Business Management / Business Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-03'">Business and Economics / Mathematics and Statistics for Economists</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-03-01'">Business and Economics /  Mathematics and Statistics for Economists / Mathematics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-03-02'">Business and Economics / Mathematics and Statistics for Economists / Statitistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-03-03'">Business and Economics / Mathematics and Statistics for Economists / Econometrics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-04'">Business and Economics / Key Competences in Scholarly Research</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EC-05'">Business and Economics / Finance</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN'">Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-01'">Engineering / Introductions and Overviews</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-01-01'">Engineering / Introductions and Overviews / Engineering, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-01-02'">Engineering / Introductions and Overviews / History of Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-01-03'">Engineering / Introductions and Overviews / Basics and Tools</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-02'">Engineering / Electrical Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-02-01'">Engineering / Electrical Engineering / Fundamentals of Electrical Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-02-02'">Engineering / Electrical Engineering / Automation</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-02-03'">Engineering / Electrical Engineering / Control Engineering, Metrology and Testing</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-02-04'">Engineering / Electrical Engineering / Electronics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-02-05'">Engineering / Electrical Engineering / Circuits</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-02-06'">Engineering / Electrical Engineering / Information Technology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-02-07'">Engineering / Electrical Engineering / Energy Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-02-08'">Engineering / Electrical Engineering / Signal Processing</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-02-10'">Engineering / Electrical Engineering / Robotics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-02-11'">Engineering / Electrical Engineering / Sensor Technology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-02-12'">Engineering / Electrical Engineering / Microtechnologies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-03'">Engineering / Mechanical Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-03-01'">Engineering / Mechanical Engineering / Fundamentals of Mechanical Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-03-02'">Engineering / Mechanical Engineering / Mechanics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-03-03'">Engineering / Mechanical Engineering / Thermodynamics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-03-04'">Engineering / Mechanical Engineering / Production Technology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-03-05'">Engineering / Mechanical Engineering / Energy Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-03-06'">Engineering / Mechanical Engineering / Tools and Methods </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-03-07'">Engineering / Mechanical Engineering / Mechatronics and Automotive</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-03-08'">Engineering / Mechanical Engineering / Process Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-03-09'">Engineering / Mechanical Engineering / Fluid Mechanics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-03-10'">Engineering / Mechanical Engineering / Safety</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-03-11'">Engineering / Mechanical Engineering / Aeronautics &amp; Astronautics </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-03-12'">Engineering / Mechanical Engineering / Materials Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-04'">Engineering / Bioengineering and Biomedical Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-04-01'">Engineering / Bioengineering and Biomedical Engineering / Biomedical Electronics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-04-02'">Engineering / Bioengineering and Biomedical Engineering / Biotechnology </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-04-03'">Engineering / Bioengineering and Biomedical Engineering / Biomaterials</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-04-04'">Engineering / Bioengineering and Biomedical Engineering / BioMEMS</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-04-05'">Engineering / Bioengineering and Biomedical Engineering / Cellular and Tissue Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-04-06'">Engineering / Bioengineering and Biomedical Engineering / Nanomedicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-04-07'">Engineering / Bioengineering and Biomedical Engineering / Biomechanics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-04-08'">Engineering / Bioengineering and Biomedical Engineering / Medical Imaging and Radiology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-04-09'">Engineering / Bioengineering and Biomedical Engineering / Medical Robotics and Surgery</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-04-10'">Engineering / Bioengineering and Biomedical Engineering / Medical Devices</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-04-11'">Engineering / Bioengineering and Biomedical Engineering / Bionanotechnology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-05'">Engineering / Civil Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-05-01'">Engineering / Civil Engineering / Hydrology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-05-02'">Engineering / Civil Engineering / Soil Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-05-03'">Engineering / Civil Engineering / Materials</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-05-04'">Engineering / Civil Engineering / Energy Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-EN-05-05'">Engineering / Civil Engineering / Environmental Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-GL'">General Interest</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-GS'">Geosciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-GS-01'">Geosciences / Geodesy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-GS-02'">Geosciences / Geography</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-GS-03'">Geosciences / Cartography and Photogrammetry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-GS-04'">Geosciences / Atmospheric Science and Climatology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-GS-05'">Geosciences / Geophysics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-GS-06'">Geosciences / Geology and Mineralogy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-GS-07'">Geosciences / Remote Sensing </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-GS-08'">Geosciences / Geosciences, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI'">History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01'">History / Historical Periods</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-01'">History / Historical Periods / Pre-History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-02'">History / Historical Periods / Germanic History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-03'">History / Historical Periods / Ancient History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-04'">History / Historical Periods / Byzantine Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-05'">History / Historical Periods / Medieval History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-06'">History / Historical Periods / Early Modern History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-07'">History / Historical Periods / Modern History </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-08'">History / Historical Periods / Contemporary History until 1945</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-08-01'">History / Historical Periods / Contemporary History until 1945 / Other Topics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-08-03'">History / Historical Periods / Contemporary History until 1945 / World War I</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-08-04'">History / Historical Periods / Contemporary History until 1945 / Weimar Republic</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-08-05'">History / Historical Periods / Contemporary History until 1945 / World War II</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-08-06'">History / Historical Periods / Contemporary History until 1945 / Nazi Germany</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-09'">History / Historical Periods / Contemporary History since 1945</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-09-01'">History / Historical Periods / Contemporary History since 1945 / East and West Germany</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-09-02'">History / Historical Periods / Contemporary History since 1945 / Cold War</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-09-03'">History / Historical Periods / Contemporary History since 1945 / Other Topics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-01-10'">History / Historical Periods / Epoch-spanning History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02'">History / Regional and National History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-01'">History / Regional and National History / Germany</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-01-01'">History / Regional and National History / Germany / Berlin, Brandenburg, Prussia</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-01-02'">History / Regional and National History / Germany / Bavaria</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-01-03'">History / Regional and National History / Germany / General German History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-02'">History / Regional and National History / Austria</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-03'">History / Regional and National History / Europe</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-03-01'">History / Regional and National History / Europe / Western Europe</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-03-02'">History / Regional and National History / Europe / Eastern Europe</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-03-03'">History / Regional and National History / Europe / Northern Europe</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-03-04'">History / Regional and National History / Europe / Southern Europe</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-03-05'">History / Regional and National History / Europe / General European History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-03-06'">History / Regional and National History / Europe / East Central Europe</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-03-07'">History / Regional and National History / Europe / South Eastern Europe</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-04'">History / Regional and National History / North America</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-04-01'">History / Regional and National History / North America / United States of America</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-04-02'">History / Regional and National History / North America / Canada</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-05'">History / Regional and National History / Latin America</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-06'">History / Regional and National History / Africa</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-07'">History / Regional and National History / Arab World</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-02-08'">History / Regional and National History / Asia-Pacific</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03'">History / Topics in History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-01'">History / Topics in History / Constitutional and Legal History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-02'">History / Topics in History / Jewish History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-02-01'">History / Topics in History / Jewish History / Jewish History and Culture</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-02-02'">History / Topics in History / Jewish History / Israel and Palestine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-02-03'">History / Topics in History / Jewish History / Zionism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-02-04'">History / Topics in History / Jewish History / Diaspora</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-02-05'">History / Topics in History / Jewish History / Jewish Thought</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-02-06'">History / Topics in History / Jewish History / German-Jewish History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-02-07'">History / Topics in History / Jewish History / Antisemitism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-02-08'">History / Topics in History / Jewish History / Holocaust </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-03'">History / Topics in History / Exile History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-04'">History / Topics in History / Topics in History, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-06'">History / Topics in History / Military History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-07'">History / Topics in History / Economic History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-08'">History / Topics in History / History of Science</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-09'">History / Topics in History / Social History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-10'">History / Topics in History / Gender History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-11'">History / Topics in History / Labour History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-12'">History / Topics in History / Migration History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-13'">History / Topics in History / Global History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-14'">History / Topics in History / History of Knowledge</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-15'">History / Topics in History / Cultural History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-16'">History / Topics in History / Environmental History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-17'">History / Topics in History / Political Ideologies and Ideas</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-18'">History / Topics in History / History of Religions</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-19'">History / Topics in History / Colonial and Postcolonial History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-21'">History / Topics in History / Digital History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-03-22'">History / Topics in History / Public History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-04'">History / Miscellaneous</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-05'">History / Theories, Methods, and Auxiliary Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-05-01'">History / Theories, Methods, and Auxiliary Sciences / Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-05-02'">History / Theories, Methods, and Auxiliary Sciences / Methods</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-05-03'">History / Theories, Methods, and Auxiliary Sciences / Auxiliary Sciences of History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-05-03-01'">History / Theories, Methods, and Auxiliary Sciences / Auxiliary Sciences of History / Diplomatic</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-HI-05-03-02'">History / Theories, Methods, and Auxiliary Sciences / Auxiliary Sciences of History / Heraldry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC'">Industrial Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-01'">Industrial Chemistry / Biochemical Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-02'">Industrial Chemistry / Biotechnology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-03'">Industrial Chemistry / Business and Management</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-04'">Industrial Chemistry / Catalysis</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-05'">Industrial Chemistry / Chemical Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-06'">Industrial Chemistry / Energy Harvesting and Conversion </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-07'">Industrial Chemistry / Green and Sustainable Technology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-10'">Industrial Chemistry / Plant Design</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-11'">Industrial Chemistry / Process Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-14'">Industrial Chemistry / Safety and Risk Management</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-16'">Industrial Chemistry / Industrial Chemistry, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-17'">Industrial Chemistry / Agrochemicals</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-18'">Industrial Chemistry / Cellulose, Paper and Textiles</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-19'">Industrial Chemistry / Detergents</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-20'">Industrial Chemistry / Explosives, Propellants and Pyrotechnics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-21'">Industrial Chemistry / Food Science and Technology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-22'">Industrial Chemistry / Pharmaceuticals</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-23'">Industrial Chemistry / Petrochemistry and Fuels</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-24'">Industrial Chemistry / Polymer Science and Technology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-25'">Industrial Chemistry / Substances and Products</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IC-26'">Industrial Chemistry / Paints, Pigments, Coatings and Dyes</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS'">Islamic and Middle Eastern Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-01'">Islamic and Middle Eastern Studies/Introductions and Overviews</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-02'">Islamic and Middle Eastern Studies/Ancient Middle East</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-03'">Islamic and Middle Eastern Studies/Text and Exegesis</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-04'">Islamic and Middle Eastern Studies/Quran</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-05'">Islamic and Middle Eastern Studies/Theology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-06'">Islamic and Middle Eastern Studies/Religious Life </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-07'">Islamic and Middle Eastern Studies/Religious Groups</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-08'">Islamic and Middle Eastern Studies/Interreligious Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-09'">Islamic and Middle Eastern Studies/History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-10'">Islamic and Middle Eastern Studies/Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-11'">Islamic and Middle Eastern Studies/Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-12'">Islamic and Middle Eastern Studies/Politics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-13'">Islamic and Middle Eastern Studies/Culture and Society</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-14'">Islamic and Middle Eastern Studies/Language and Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-15'">Islamic and Middle Eastern Studies/Art and Architecture</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-IS-16'">Islamic and Middle Eastern Studies/Business and Economy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS'">Jewish Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-01'">Jewish Studies / Jewish History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-01-01'">Jewish Studies / Jewish History / General Jewish History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-01-02'">Jewish Studies / Jewish History / Israel and Palestine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-01-03'">Jewish Studies / Jewish History / Zionism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-01-04'">Jewish Studies / Jewish History / Diaspora</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-01-05'">Jewish Studies / Jewish History / Jewish Thought</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-01-06'">Jewish Studies / Jewish History / German-Jewish History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-01-07'">Jewish Studies / Jewish History / Antisemitism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-01-08'">Jewish Studies / Jewish History / Holocaust </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-02'">Jewish Studies / Judaism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-02-01'">Jewish Studies / Judaism / Overviews and Introductions</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-02-02'">Jewish Studies / Judaism / Hellenistic-Roman Era</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-02-03'">Jewish Studies / Judaism / Rabbinic Judaism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-02-04'">Jewish Studies / Judaism / Middle Ages and Early Modern Times</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-02-05'">Jewish Studies / Judaism / Modern Times</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-03'">Jewish Studies / Jewish Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-03-01'">Jewish Studies / Jewish Literature / Jewish Literature, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-03-02'">Jewish Studies / Jewish Literature / Early Jewish Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-03-03'">Jewish Studies / Jewish Literature / Reception of Jewish Texts</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-03-04'">Jewish Studies / Jewish Literature / Modern Jewish Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-04'">Jewish Studies / Jewish Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-04-01'">Jewish Studies / Jewish Languages / Hebrew</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-04-02'">Jewish Studies / Jewish Languages / Yiddish, Judeo-German</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-04-03'">Jewish Studies / Jewish Languages / Ladino, Judeo-Spanish</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-04-04'">Jewish Studies / Jewish Languages / Judeo-Arabic</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-04-05'">Jewish Studies / Jewish Languages / Aramaic</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-04-06'">Jewish Studies / Jewish Languages / Other Jewish Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-05'">Jewish Studies / Jewish Culture</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-05-01'">Jewish Studies / Jewish Culture / Jewish Art</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-05-02'">Jewish Studies / Jewish Culture / Jewish Music</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-05-03'">Jewish Studies / Jewish Culture / Jewish Folklore</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-JS-05-04'">Jewish Studies / Jewish Culture / Jewish Culture, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA'">Law </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-01'">Law  / History, Philosophy and Sociology of Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-02'">Law  / International Law, Foreign Law, Comparative Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-02-01'">Law  / International Law, Foreign Law, Comparative Law / International Law, Foreign Law, Comparative Law, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-02-02'">Law  / International Law, Foreign Law, Comparative Law / International Law and  Foreign Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-02-03'">Law  / International Law, Foreign Law, Comparative Law / Public International Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-02-04'">Law  / International Law, Foreign Law, Comparative Law / Comparative Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-02-05'">Law  / International Law, Foreign Law, Comparative Law / Private International Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-02-06'">Law  / International Law, Foreign Law, Comparative Law / International Arbitration</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-03'">Law  / German Civil Code</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-03-01'">Law  / German Civil Code / German Civil Code, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-03-02'">Law  / German Civil Code / General Part</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-03-03'">Law  / German Civil Code / Law of Obligations</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-03-04'">Law  / German Civil Code / Property Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-03-05'">Law  / German Civil Code / Family Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-03-06'">Law  / German Civil Code / Inheritance Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-04'">Law  / Commercial Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-04-01'">Law  / Commercial Law / Commercial Law, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-04-02'">Law  / Commercial Law / Business Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-04-03'">Law  / Commercial Law / Corporate Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-04-04'">Law  / Commercial Law / Securities Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-04-05'">Law  / Commercial Law / Private Insurance Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-04-06'">Law  / Commercial Law / Consumer Protection</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-04-07'">Law  / Commercial Law / Copyright and Media Law, Publishing Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-05'">Law  / Commercial Legal Protection</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-05-01'">Law  / Commercial Legal Protection / Commercial Legal Protection, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-05-02'">Law  / Commercial Legal Protection / Patent, Trademark and Design Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-05-03'">Law  / Commercial Legal Protection / Competition and Antitrust Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-06'">Law  / Law of Civil Procedure, Voluntary Jurisdiction</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-06-01'">Law  / Law of Civil Procedure, Voluntary Jurisdiction / Law of Civil Procedure, Voluntary Jurisdiction, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-06-02'">Law  / Law of Civil Procedure, Voluntary Jurisdiction / Civil Procedure Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-06-03'">Law  / Law of Civil Procedure, Voluntary Jurisdiction / Enforcement Proceedings, Compulsory Sale Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-06-04'">Law  / Law of Civil Procedure, Voluntary Jurisdiction / Insolvency Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-06-05'">Law  / Law of Civil Procedure, Voluntary Jurisdiction / Class Actions</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-06-06'">Law  / Law of Civil Procedure, Voluntary Jurisdiction / Voluntary Jurisdiction, Real Property Registration Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-06-07'">Law  / Law of Civil Procedure, Voluntary Jurisdiction / Fees and Costs, Attorney and Notary Public Regulation</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-07'">Law  / European Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-07-01'">Law  / European Law / European Family Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-07-02'">Law  / European Law / European Law of Succession</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-07-03'">Law  / European Law / European Sales Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-07-04'">Law  / European Law / European Commercial Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-07-05'">Law  / European Law / European Law, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-08'">Law  / Labor Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-08-01'">Law  / Labor Law / Labor Law, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-08-02'">Law  / Labor Law / Individual Labor Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-08-03'">Law  / Labor Law / Collective Labor Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-08-04'">Law  / Labor Law / Labor Court Procedure Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-09'">Law  / Social Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-09-01'">Law  / Social Law / Social Law, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-09-02'">Law  / Social Law / Substantive Social Law, Social Administrative Procedure Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-09-03'">Law  / Social Law / Social Court Procedure Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-10'">Law  / Public Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-10-01'">Law  / Public Law / Public Law, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-10-02'">Law  / Public Law / Constitutional Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-10-03'">Law  / Public Law / General Administrative Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-10-04'">Law  / Public Law / Special Administrative Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-10-05'">Law  / Public Law / Tax and Accounting Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-10-06'">Law  / Public Law / Health Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-10-07'">Law  / Public Law / Public Construction Law, Road and Water Legislation</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-10-08'">Law  / Public Law / Procurement Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-10-09'">Law  / Public Law / Energy Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-10-10'">Law  / Public Law / Traffic Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-10-11'">Law  / Public Law / Ecclesiastical Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-10-12'">Law  / Public Law / Constitutional Jurisdiction, Administrative Procedural Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-11'">Law  / Criminal Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-11-01'">Law  / Criminal Law / Criminal Law, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-11-02'">Law  / Criminal Law / Substantive Criminal Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-11-03'">Law  / Criminal Law / Criminology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-11-04'">Law  / Criminal Law / Criminal Procedure Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-11-05'">Law  / Criminal Law / Penalty Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LA-12'">Law  / Law, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LB'">Library and Information Science, Book Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LB-01'">Library and Information Science, Book Studies / Libraries and Library Science</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LB-02'">Library and Information Science, Book Studies / Information Science</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LB-03'">Library and Information Science, Book Studies / Book History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LB-04'">Library and Information Science, Book Studies / Publishing and Book Trade</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LB-05'">Library and Information Science, Book Studies / Media and Press</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LB-06'">Library and Information Science, Book Studies / Archives and Museums</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LB-07'">Library and Information Science, Book Studies / Preservation and Restoration</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LB-08'">Library and Information Science, Book Studies / Library and Information Science, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF'">Life Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-01'">Life Sciences / Molecular Biology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-02'">Life Sciences / Genetics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-03'">Life Sciences / Biochemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-04'">Life Sciences / Biophysics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-05'">Life Sciences / Developmental Biology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-06'">Life Sciences / Human Biology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-07'">Life Sciences / Neurobiology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-08'">Life Sciences / Biotechnology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-09'">Life Sciences / Microbiology and Virology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-10'">Life Sciences / Plant Science</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-11'">Life Sciences / Zoology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-12'">Life Sciences / Anatomy and Physiology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-13'">Life Sciences / Evolutionary Biology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-14'">Life Sciences / Ecology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-15'">Life Sciences / Behavioral Biology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-16'">Life Sciences / Anthropology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-17'">Life Sciences / Bioinformatics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-18'">Life Sciences / Bionics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-19'">Life Sciences / Cell Biology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LF-20'">Life Sciences / Life Sciences, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS'">Linguistics and Semiotics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-01'">Linguistics and Semiotics / Applied Linguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-01-02'">Linguistics and Semiotics / Applied Linguistics / Forensic Linguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-01-03'">Linguistics and Semiotics / Applied Linguistics / Language Assessment and Testing</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-01-04'">Linguistics and Semiotics / Applied Linguistics / Language Policy and Planning</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-01-05'">Linguistics and Semiotics / Applied Linguistics / Language Teaching and Learning</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-01-06'">Linguistics and Semiotics / Applied Linguistics / Lexicography</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-01-07'">Linguistics and Semiotics / Applied Linguistics / Quantitative, Computational, and Corpus Linguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-01-08'">Linguistics and Semiotics / Applied Linguistics / Translation Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-01-09'">Linguistics and Semiotics / Applied Linguistics / Writing Systems and Orthography</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-01-10'">Linguistics and Semiotics / Applied Linguistics / Applied Linguistics, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-02'">Linguistics and Semiotics / Languages of Africa</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-02-01'">Linguistics and Semiotics / Languages of Africa / Bantu Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-02-02'">Linguistics and Semiotics / Languages of Africa / African Languages, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-03'">Linguistics and Semiotics / Languages of Asia</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-03-01'">Linguistics and Semiotics / Languages of Asia / Japonic Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-03-02'">Linguistics and Semiotics / Languages of Asia / Semitic Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-03-02-01'">Linguistics and Semiotics / Languages of Asia / Semitic Languages / Hebrew</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-03-02-02'">Linguistics and Semiotics / Languages of Asia / Semitic Languages / Arabic</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-03-02-03'">Linguistics and Semiotics / Languages of Asia / Semitic Languages / Semitic Languages, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-03-03'">Linguistics and Semiotics / Languages of Asia / Sino-Tibetan Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-03-03-01'">Linguistics and Semiotics / Languages of Asia / Sino-Tibetan Languages / Sino-Tibetan Languages, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-03-03-02'">Linguistics and Semiotics / Languages of Asia / Sino-Tibetan Languages / Chinese</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-03-04'">Linguistics and Semiotics / Languages of Asia / Asian Languages, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-04'">Linguistics and Semiotics / Languages of Australia</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-04-01'">Linguistics and Semiotics / Languages of Australia / Pama–Nyungan Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-04-02'">Linguistics and Semiotics / Languages of Australia / Non Pama–Nyungan Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-04-03'">Linguistics and Semiotics / Languages of Australia / Australian Languages, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-05'">Linguistics and Semiotics / Other Languages of Europe</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-05-02'">Linguistics and Semiotics / Other Languages of Europe / Greek</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-05-03'">Linguistics and Semiotics / Other Languages of Europe / Latin</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-05-04'">Linguistics and Semiotics / Other Languages of Europe / Classical Languages, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-05-05'">Linguistics and Semiotics / Other Languages of Europe / Slavic Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-05-06'">Linguistics and Semiotics / Other Languages of Europe / European Languages, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-06'">Linguistics and Semiotics / Languages of the Americas</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-06-01'">Linguistics and Semiotics / Languages of the Americas / Na-Dené Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-06-02'">Linguistics and Semiotics / Languages of the Americas / Algic Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-06-03'">Linguistics and Semiotics / Languages of the Americas / Uto-Aztecan Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-06-04'">Linguistics and Semiotics / Languages of the Americas / Languages of the Americas, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-07'">Linguistics and Semiotics / Languages of the Pacific Islands</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-07-01'">Linguistics and Semiotics / Languages of the Pacific Islands / Austronesian Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-07-02'">Linguistics and Semiotics / Languages of the Pacific Islands / Papuan Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-07-03'">Linguistics and Semiotics / Languages of the Pacific Islands / Languages of the Pacific Islands, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-08'">Linguistics and Semiotics / Pidgins and Creoles</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-09'">Linguistics and Semiotics / Levels of Linguistic Analysis</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-09-01'">Linguistics and Semiotics / Levels of Linguistic Analysis / Interfaces</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-09-02'">Linguistics and Semiotics / Levels of Linguistic Analysis / Discourse</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-09-03'">Linguistics and Semiotics / Levels of Linguistic Analysis / Morphology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-09-04'">Linguistics and Semiotics / Levels of Linguistic Analysis / Phonetics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-09-05'">Linguistics and Semiotics / Levels of Linguistic Analysis / Phonology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-09-06'">Linguistics and Semiotics / Levels of Linguistic Analysis / Pragmatics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-09-07'">Linguistics and Semiotics / Levels of Linguistic Analysis / Semantics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-09-08'">Linguistics and Semiotics / Levels of Linguistic Analysis / Syntax</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-10'">Linguistics and Semiotics / Semiotics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-10-01'">Linguistics and Semiotics / Semiotics / Biosemiotics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-10-02'">Linguistics and Semiotics / Semiotics / Cognitive Semiotics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-10-03'">Linguistics and Semiotics / Semiotics / Cultural Semiotics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-10-04'">Linguistics and Semiotics / Semiotics / Semiotic Theory </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-10-05'">Linguistics and Semiotics / Semiotics / Social Semiotics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-10-06'">Linguistics and Semiotics / Semiotics / Zoosemiotics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-10-07'">Linguistics and Semiotics / Semiotics / Semiotics, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-11'">Linguistics and Semiotics / The Work of Major Linguists</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-11-01'">Linguistics and Semiotics / The Work of Major Linguists / Chomsky</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-11-02'">Linguistics and Semiotics / The Work of Major Linguists / Jakobson</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-11-03'">Linguistics and Semiotics / The Work of Major Linguists / Langacker</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-11-04'">Linguistics and Semiotics / The Work of Major Linguists / Sapir</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-11-05'">Linguistics and Semiotics / The Work of Major Linguists / Linguists, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-01'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / General Linguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-02'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Anthropological Linguistics and Ethnolinguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-04'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Bilingualism and Multilingualism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-05'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Cognitive Linguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-06'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Contrastive Linguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-07'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Dialectology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-08'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Discourse Analysis</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-09'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / First Language Acquisition</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-10'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Functional Theories of Grammar</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-11'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Generative Linguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-12'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Historical Linguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-13'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / History of Linguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-14'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Language Contact</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-15'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Language Documentation</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-16'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Lexicology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-17'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Linguistic Typology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-18'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Narrative Analysis</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-19'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Neurolinguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-20'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Onomastics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-21'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Psycholinguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-22'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Second language Acquisition</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-23'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Sign Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-24'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Sociolinguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-25'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Structuralism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-26'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Linguistics, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-27'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Philosophy of Language</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-28'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Evolutionary Analysis</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-29'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Multimodality</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-12-30'">Linguistics and Semiotics / Theoretical Frameworks and Disciplines / Construction Grammar</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-13'">Linguistics and Semiotics / Romance Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-13-01'">Linguistics and Semiotics / Romance Languages / Romance Languages, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-13-02'">Linguistics and Semiotics / Romance Languages / French</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-13-03'">Linguistics and Semiotics / Romance Languages / Italian</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-13-04'">Linguistics and Semiotics / Romance Languages / Romance Languages, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-13-05'">Linguistics and Semiotics / Romance Languages / Spanish</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-13-06'">Linguistics and Semiotics / Romance Languages / Portuguese</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-14'">Linguistics and Semiotics / Germanic Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-14-01'">Linguistics and Semiotics / Germanic Languages / English</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-14-02'">Linguistics and Semiotics / Germanic Languages / German</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-14-03'">Linguistics and Semiotics / Germanic Languages / Scandinavian</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-14-04'">Linguistics and Semiotics / Germanic Languages / Germanic Languges, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LS-14-05'">Linguistics and Semiotics / Germanic Languages / Germanic Languges, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT'">Literary Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-01'">Literary Studies / Literary Studies, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-02'">Literary Studies / Comparative Literary Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-03'">Literary Studies / Anglo-American Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-03-01'">Literary Studies / Anglo-American Literature / Anglo-American Literature, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-03-02'">Literary Studies / Anglo-American Literature / 8th-15th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-03-03'">Literary Studies / Anglo-American Literature / 16th-17th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-03-04'">Literary Studies / Anglo-American Literature / 18th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-03-05'">Literary Studies / Anglo-American Literature / 19th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-03-06'">Literary Studies / Anglo-American Literature / 20th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-03-07'">Literary Studies / Anglo-American Literature / 21st Century </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-04'">Literary Studies / German Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-04-01'">Literary Studies / German Literature / German Literature, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-04-02'">Literary Studies / German Literature / 8th-15th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-04-03'">Literary Studies / German Literature / 16th-17th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-04-04'">Literary Studies / German Literature / 18th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-04-05'">Literary Studies / German Literature / 19th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-04-06'">Literary Studies / German Literature / 20th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-04-07'">Literary Studies / German Literature / 21st Century </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-05'">Literary Studies / Jewish Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-05-01'">Literary Studies / Jewish Literature / Jewish Literature, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-05-02'">Jewish Studies / Jewish Literature / Early Jewish Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-05-03'">Literary Studies / Jewish Literature / Reception of Jewish Texts</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-05-04'">Literary Studies / Jewish Literature / Modern Jewish Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06'">Literary Studies / Romance Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-01'">Literary Studies / Romance Literature / Romance Literature, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-02'">Literary Studies / Romance Literature / French Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-02-01'">Literary Studies / Romance Literature / French Literature / French Literature, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-02-02'">Literary Studies / Romance Literature / French Literature / 8th-15th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-02-03'">Literary Studies / Romance Literature / French Literature / 16th-17th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-02-04'">Literary Studies / Romance Literature / French Literature / 18th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-02-05'">Literary Studies / Romance Literature / French Literature / 19th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-02-06'">Literary Studies / Romance Literature / French Literature / 20th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-02-07'">Literary Studies / Romance Literature / French Literature / 21st Century </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-03'">Literary Studies / Romance Literature / Italian Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-03-01'">Literary Studies / Romance Literature / Italian Literature / Italian Literature, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-03-02'">Literary Studies / Romance Literature / Italian Literature / 13th-15th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-03-03'">Literary Studies / Romance Literature / Italian Literature / 16th-17th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-03-04'">Literary Studies / Romance Literature / Italian Literature / 18th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-03-05'">Literary Studies / Romance Literature / Italian Literature / 19th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-03-06'">Literary Studies / Romance Literature / Italian Literature / 20th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-03-07'">Literary Studies / Romance Literature / Italian Literature / 21st Century </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-04'">Literary Studies / Romance Literature / Hispanic Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-04-01'">Literary Studies / Romance Literature / Hispanic Literature / Hispanic Literature, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-04-02'">Literary Studies / Romance Literature / Hispanic Literature / 10th-15th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-04-03'">Literary Studies / Romance Literature / Hispanic Literature / 16th-17th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-04-04'">Literary Studies / Romance Literature / Hispanic Literature / 18th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-04-05'">Literary Studies / Romance Literature / Hispanic Literature / 19th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-04-06'">Literary Studies / Romance Literature / Hispanic Literature / 20th Century</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-06-04-07'">Literary Studies / Romance Literature / Hispanic Literature / 21st Century </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-07'">Literary Studies / Literature of other Nations and Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-07-01'">Literary Studies / Literature of other Nations and Languages / Indo-European Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-07-02'">Literary Studies / Literature of other Nations and Languages / Asian Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-07-03'">Literary Studies / Literature of other Nations and Languages / Scandinavian Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-07-04'">Literary Studies / Literature of other Nations and Languages / Slavic Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-07-05'">Literary Studies / Literature of other Nations and Languages / Other Nations and Languages</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-08'">Literary Studies / Literary Genres and Media</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-08-01'">Literary Studies / Literary Genres and Media / Genre Studies, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-08-02'">Literary Studies / Literary Genres and Media / Drama, Theater</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-08-03'">Literary Studies / Literary Genres and Media / Graphic Novel</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-08-04'">Literary Studies / Literary Genres and Media / Poetry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-08-05'">Literary Studies / Literary Genres and Media / Prose</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-08-06'">Literary Studies / Literary Genres and Media / Biography and Autobiography</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-08-07'">Literary Studies / Literary Genres and Media / Diaries, Letters and Journals</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-08-08'">Literary Studies / Literary Genres and Media / other Genres</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-09'">Literary Studies / Textual Scholarship </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-10'">Literary Studies / Literary History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-11'">Literary Studies / Literary Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-12'">Literary Studies / Narratology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13'">Literary Studies / Topics in Literary Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-01'">Literary Studies / Topics in Literary Studies / Exile Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-02'">Literary Studies / Topics in Literary Studies / Gender and Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-03'">Literary Studies / Topics in Literary Studies / Individual Motifs, Motif Research</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-04'">Literary Studies / Topics in Literary Studies / Literary Studies and Linguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-05'">Literary Studies / Topics in Literary Studies / Mythology and Folk Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-06'">Literary Studies / Topics in Literary Studies / Poetics </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-07'">Literary Studies / Topics in Literary Studies / Rhetoric</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-08'">Literary Studies / Topics in Literary Studies / Antiquity</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-09'">Literary Studies / Topics in Literary Studies / Memory </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-10'">Literary Studies / Topics in Literary Studies / Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-11'">Literary Studies / Topics in Literary Studies / Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-12'">Literary Studies / Topics in Literary Studies / Knowledge</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-13'">Literary Studies / Topics in Literary Studies / Travel</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-14'">Literary Studies / Topics in Literary Studies / Avantgarde</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-15'">Literary Studies / Topics in Literary Studies / Emotion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-16'">Literary Studies / Topics in Literary Studies / Psychology, Psychoanalysis</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-17'">Literary Studies / Topics in Literary Studies / Fantasy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-18'">Literary Studies / Topics in Literary Studies / Mediality, Intermediality</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-19'">Literary Studies / Topics in Literary Studies / Performativeness</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-20'">Literary Studies / Topics in Literary Studies / Sociology of Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-21'">Literary Studies / Topics in Literary Studies / Postcolonial Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-22'">Literary Studies / Topics in Literary Studies / Other Topics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-13-23'">Literary Studies / Topics in Literary Studies / Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-LT-14'">Literary Studies / History of Literary Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD'">Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-01'">Medicine / Assistive Professions, Nursing</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-02'">Medicine / Biomedical Engineering</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-03'">Medicine / Basic Medical Science</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-03-01'">Medicine / Basic Medical Science / Basic Medical Science, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-03-02'">Medicine / Basic Medical Science / Anatomy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-03-03'">Medicine / Basic Medical Science / Embryology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-03-04'">Medicine / Basic Medical Science / Cytology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-03-05'">Medicine / Basic Medical Science / Biochemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-03-06'">Medicine / Basic Medical Science / Immunology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-03-07'">Medicine / Basic Medical Science / Physiology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-03-08'">Medicine / Basic Medical Science / History and Ethics of Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04'">Medicine / Clinical Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-01'">Medicine / Clinical Medicine / Clinical Medicine, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-02'">Medicine / Clinical Medicine / Ophthalmology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-03'">Medicine / Clinical Medicine / Internal Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-03-01'">Medicine / Clinical Medicine / Internal Medicine / Internal Medicine, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-03-02'">Medicine / Clinical Medicine / Internal Medicine / Endocrinology, Diabetology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-03-03'">Medicine / Clinical Medicine / Internal Medicine / Cardiology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-03-04'">Medicine / Clinical Medicine / Internal Medicine / Angiology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-03-05'">Medicine / Clinical Medicine / Internal Medicine / Gastroenterology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-03-06'">Medicine / Clinical Medicine / Internal Medicine / Haematology, Oncology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-03-07'">Medicine / Clinical Medicine / Internal Medicine / Nephrology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-03-08'">Medicine / Clinical Medicine / Internal Medicine / Pneumology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-03-09'">Medicine / Clinical Medicine / Internal Medicine / Rheumatology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-04'">Medicine / Clinical Medicine / Pediatrics and Juvenile Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-04-01'">Medicine / Clinical Medicine / Pediatrics and Juvenile Medicine / Paediatric Haematology and Oncology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-04-02'">Medicine / Clinical Medicine / Pediatrics and Juvenile Medicine / Paediatric Cardiology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-04-03'">Medicine / Clinical Medicine / Pediatrics and Juvenile Medicine / Neonatology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-04-04'">Medicine / Clinical Medicine / Pediatrics and Juvenile Medicine / Neuropaediatrics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-05'">Medicine / Clinical Medicine / Surgery</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-05-01'">Medicine / Clinical Medicine / Surgery / Surgery, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-05-02'">Medicine / Clinical Medicine / Surgery / Vascular Surgery</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-05-03'">Medicine / Clinical Medicine / Surgery / Cardiac Surgery</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-05-04'">Medicine / Clinical Medicine / Surgery / Paediatric Surgery</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-05-05'">Medicine / Clinical Medicine / Surgery / Orthopaediatrics and Accident Surgery</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-05-06'">Medicine / Clinical Medicine / Surgery / Plastic, Reconstructive and Aesthetic Surgery</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-05-07'">Medicine / Clinical Medicine / Surgery / Thoracic Surgery</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-05-08'">Medicine / Clinical Medicine / Surgery / Visceral Surgery</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-06'">Medicine / Clinical Medicine / Neurosurgery</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-07'">Medicine / Clinical Medicine / Anaesthesiology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-08'">Medicine / Clinical Medicine / Emergency Medicine and Intensive-Care Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-09'">Medicine / Clinical Medicine / Gynaecology and Obstetrics </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-09-01'">Medicine / Clinical Medicine / Gynaecology and Obstetrics  / Gynaecology and Obstetrics, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-09-02'">Medicine / Clinical Medicine / Gynaecology and Obstetrics  / Gynaecological Endocrinology and Reproductive Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-09-03'">Medicine / Clinical Medicine / Gynaecology and Obstetrics  / Gynaecological Oncology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-09-04'">Medicine / Clinical Medicine / Gynaecology and Obstetrics  / Special Obstetrics and Perinatal Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-10'">Medicine / Clinical Medicine / Urology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-11'">Medicine / Clinical Medicine / Otorhinolaryngology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-11-01'">Medicine / Clinical Medicine / Otorhinolaryngology / Speech, Voice and Paediatric Hearing Disorders</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-12'">Medicine / Clinical Medicine / Dermatological and Veneral Diseases</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-13'">Medicine / Clinical Medicine / Psychiatry, Psychotherapy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-14'">Medicine / Clinical Medicine / Microbiology, Virology and Infection Epidemiology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-15'">Medicine / Clinical Medicine / Laboratory Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-16'">Medicine / Clinical Medicine / Clinical Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-17'">Medicine / Clinical Medicine / Pathology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-18'">Medicine / Clinical Medicine / Neurology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-19'">Medicine / Clinical Medicine / Radiology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-20'">Medicine / Clinical Medicine / Radiotherapy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-21'">Medicine / Clinical Medicine / Physical and Rehabilitation Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-22'">Medicine / Clinical Medicine / Public Health</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-23'">Medicine / Clinical Medicine / Pharmacology, Toxicology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-24'">Medicine / Clinical Medicine / Complementary Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-25'">Medicine / Clinical Medicine / Andrology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-26'">Medicine / Clinical Medicine / Forensic Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-27'">Medicine / Clinical Medicine / Transfusion Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-28'">Medicine / Clinical Medicine / Psychosomatic Medicine and Psychotherapy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-29'">Medicine / Clinical Medicine / Nuclear Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-30'">Medicine / Clinical Medicine / Oromaxillofacial Surgery</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-31'">Medicine / Clinical Medicine / Paediatric and Juvenile Psychatry and Psychotherapy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-32'">Medicine / Clinical Medicine / Hygiene and Environmental Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-04-33'">Medicine / Clinical Medicine / Human Genetics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MD-05'">Medicine / Veterinary Medicine</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS'">Materials Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-01'">Materials Sciences / Materials Sciences, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-02'">Materials Sciences /Biomaterials and Natural Materials </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-03'">Materials Sciences / Ceramics and Glass </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-04'">Materials Sciences / Composites</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-05'">Materials Sciences / Nanomaterials </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-06'">Materials Sciences / Polymers</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-07'">Materials Sciences / Porous Materials</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-08'">Materials Sciences / Soft Matter</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-09'">Materials Sciences / Thin Films, Surfaces and Interfaces</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-10'">Materials Sciences / Electronic Materials</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-11'">Materials Sciences / Functional, Smart Materials</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-12'">Materials Sciences / Magnetic Materials</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-13'">Materials Sciences / Materials for Energy </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-16'">Materials Sciences / Corrosion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-18'">Materials Sciences / Materials Characterization and Properties</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-20'">Materials Sciences / Materials Processing </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-21'">Materials Sciences / Modeling and Simulations</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-23'">Materials Sciences / Carbon Materials</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-24'">Materials Sciences / Metals and Alloys</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-25'">Materials Sciences / Structural and Construction Materials</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MS-26'">Material Sciences / Crystallography</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MT'">Mathematics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MT-01'">Mathematics / History and Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MT-02'">Mathematics / Logic and Set Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MT-03'">Mathematics / Algebra and Number Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MT-04'">Mathematics / Analysis</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MT-05'">Mathematics / Differential Equations and Dynamical Systems</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MT-07'">Mathematics / Geometry and Topology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MT-08'">Mathematics / Discrete Mathematics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MT-09'">Mathematics / Probability and Statistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MT-10'">Mathematics / Numerical and Computational Mathematics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MT-11'">Mathematics / Applied Mathematics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MT-12'">Mathematics / General Mathematics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MU'">Music</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MU-01'">Music / Theory and Methods</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MU-02'">Music / Styles and Genres </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MU-03'">Music / Musicians and Singers</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MU-04'">Music / Lyrics and Libretti</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-MU-05'">Music / Music, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL'">Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-01'">Philosophy / History of Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-01-01'">Philosophy / History of Philosophy / Ancient Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-01-02'">Philosophy / History of Philosophy / Medieval Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-01-03'">Philosophy / History of Philosophy / Modern Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-01-03-01'">Philosophy / History of Philosophy / Modern Philosophy / Early Modern Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-01-03-02'">Philosophy / History of Philosophy / Modern Philosophy / 18th and 19th Century Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-01-03-03'">Philosophy / History of Philosophy / Modern Philosophy / 2th and 21st Century Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-01-04'">Philosophy / History of Philosophy / History of Philosophy, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-02'">Philosophy / Ethics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-02-01'">Philosophy / Ethics / Applied Ethics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-02-01-01'">Philosophy / Ethics / Applied Ethics / Bio Ethics and Ethics of Medicine, Ethics of Science</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-02-01-02'">Philosophy / Ethics / Applied Ethics / Business Ethics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-02-01-03'">Philosophy / Ethics / Applied Ethics / Ethics of Ecology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-02-01-04'">Philosophy / Ethics / Applied Ethics / Applied Ethics, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-02-02'">Philosophy / Ethics / Meta-Ethics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-02-03'">Philosophy / Ethics / Normative Ethics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-04'">Philosophy / Metaphysics, Ontology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-05'">Philosophy / Epistemology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-06'">Philosophy / Philosophy of Language</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-07'">Philosophy / Logic</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-08'">Philosophy / Philosophy of Science</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-08-01'">Philosophy / Philosophy of Science / General Philosophy of Science</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-08-02'">Philosophy / Philosophy of Science / Philosophy of the Natural Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-08-03'">Philosophy / Philosophy of Science / Philosophy of the Social Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-08-04'">Philosophy / Philosophy of Science / Philosophy of the Humanities and Cultural Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-08-05'">Philosophy / Philosophy of Science / Philosophy of Mathematics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-08-06'">Philosophy / Philosophy of Science / History of Philosophy of Science</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-09'">Philosophy / Political Philosophy and Social Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-10'">Philosophy / Philosophy of Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-11'">Philosophy / Philosophy of Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-12'">Philosophy / Aesthetics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-13'">Philosophy / Philosophical Anthropology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14'">Philosophy / Selected Philosophical Movements</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-01'">Philosophy / Selected Philosophical Movements / Analytical Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-02'">Philosophy / Selected Philosophical Movements / Aristotelianism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-03'">Philosophy / Selected Philosophical Movements / British Idealism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-04'">Philosophy / Selected Philosophical Movements / Deconstruction</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-05'">Philosophy / Selected Philosophical Movements / Empiricism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-06'">Philosophy / Selected Philosophical Movements / Enlightenment</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-07'">Philosophy / Selected Philosophical Movements / Existentialism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-08'">Philosophy / Selected Philosophical Movements / Frankfurt School</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-09'">Philosophy / Selected Philosophical Movements / German Idealism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-10'">Philosophy / Selected Philosophical Movements / Hellenism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-11'">Philosophy / Selected Philosophical Movements / Hermeneutics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-12'">Philosophy / Selected Philosophical Movements / Humanism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-13'">Philosophy / Selected Philosophical Movements / Logical Positivism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-14'">Philosophy / Selected Philosophical Movements / Marxism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-15'">Philosophy / Selected Philosophical Movements / Mysticism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-16'">Philosophy / Selected Philosophical Movements / Neokantianism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-17'">Philosophy / Selected Philosophical Movements / Neoplatonism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-18'">Philosophy / Selected Philosophical Movements / Phenomenology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-19'">Philosophy / Selected Philosophical Movements / Platonism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-20'">Philosophy / Selected Philosophical Movements / Pragmatism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-21'">Philosophy / Selected Philosophical Movements / Presocratics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-22'">Philosophy / Selected Philosophical Movements / Process Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-23'">Philosophy / Selected Philosophical Movements / Rationalism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-24'">Philosophy / Selected Philosophical Movements / Romanticism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-25'">Philosophy / Selected Philosophical Movements / Scholastic</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-26'">Philosophy / Selected Philosophical Movements / Stoa</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-27'">Philosophy / Selected Philosophical Movements / Structuralism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-14-28'">Philosophy / Selected Philosophical Movements / Utilitarianism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-15'">Philosophy / Intercultural Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-16'">Philosophy / Eastern Philosophy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-17'">Philosophy / Philosophy of Culture</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18'">Philosophy / Selected Philosophers</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-01'">Philosophy / Selected Philosophers / Adorno</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-02'">Philosophy / Selected Philosophers / Aristoteles</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-03'">Philosophy / Selected Philosophers / Feuerbach</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-04'">Philosophy / Selected Philosophers / Fichte</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-05'">Philosophy / Selected Philosophers / Hartmann N.</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-06'">Philosophy / Selected Philosophers / Hegel</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-07'">Philosophy / Selected Philosophers / Heidegger</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-08'">Philosophy / Selected Philosophers / Husserl</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-09'">Philosophy / Selected Philosophers / Kant</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-10'">Philosophy / Selected Philosophers / Leibniz</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-11'">Philosophy / Selected Philosophers / Marx</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-12'">Philosophy / Selected Philosophers / Nietzsche</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-13'">Philosophy / Selected Philosophers / Platon</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-18-14'">Philosophy / Selected Philosophers / Wittgenstein</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PL-19'">Philosophy / Philosophy, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PM'">Pharmacy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PM-01'">Pharmacy / Pharmaceutical Chemistry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PM-02'">Pharmacy / Clinical Pharmacy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PM-03'">Pharmacy / Pharmacology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PM-04'">Pharmacy / Toxicology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PM-05'">Pharmacy / Pharmacy, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY'">Physics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-01'">Physics / Theoretical and Mathematical Physics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-02'">Physics / Experimental Physics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-03'">Physics / Nanotechnology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-04'">Physics / Mechanics and Fluid Dynamics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-05'">Physics / Atom, Molecular and Plasma Physics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-06'">Physics / Nuclear and Particle Physics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-07'">Physics / Condensed Matter Physics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-08'">Physics / Quantum Physics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-09'">Physics / Relativity and Gravitational Physics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-10'">Physics / Thermodynamics and Statistical Physics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-11'">Physics / Electromagnetism, Optics and Photonics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-12'">Physics / Technical and Applied Physics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-13'">Physics / Astronomy and Astrophysics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-14'">Physics / Biophysics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-15'">Physics / Medical Physics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-16'">Physics / Spectroscopy and Metrology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-17'">Physics / Nonlinear and Complex Systems</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-18'">Physics / Physics, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-PY-19'">Physics / Computational Physics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN'">Social Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01'">Social Sciences / Sociology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-01'">Social Sciences / Sociology / History of Sociology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-02'">Social Sciences / Sociology / Sociological Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-03'">Social Sciences / Sociology / Methods, Techniques, Statistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-04'">Social Sciences / Sociology / Social Structures, Social Interaction, Population, Social Anthropology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-05'">Social Sciences / Sociology / Labor, Trade Unions</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-06'">Social Sciences / Sociology / Social Policy, Social Work, Development Aid</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-07'">Social Sciences / Sociology / Culture</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-08'">Social Sciences / Sociology / Sociology, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-09'">Social Sciences / Sociology / Sociology of Family, Youth, and Aging</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-10'">Social Sciences / Sociology / Sociology of Economy, Organizations, and Industry</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-11'">Social Sciences / Sociology / Sociology of Gender and the Body</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-12'">Social Sciences / Sociology / Sociology of Science, Technology, and Environment</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-13'">Social Sciences / Sociology / Sociology of Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-14'">Social Sciences / Sociology / Political Sociology </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-15'">Social Sciences / Sociology / Sociology of Migration</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-01-16'">Social Sciences / Sociology / Urban and Spatial Sociology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-02'">Social Sciences / Political Science</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-02-01'">Social Sciences / Political Science / Political Science, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-02-02'">Social Sciences / Political Science / Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-02-03'">Social Sciences / Political Science / Political Thought</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-02-04'">Social Sciences / Political Science / Domestic Policy, Parties, Other Political Organizations</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-02-05'">Social Sciences / Political Science / Foreign Policy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-02-06'">Social Sciences / Political Science / Military Policy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-02-07'">Social Sciences / Political Science / International Relations</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-02-08'">Social Sciences / Political Science / Human Rights</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-02-09'">Social Sciences / Political Science / Local Government and Administration</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-03'">Social Sciences / Psychology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-03-01'">Social Sciences / Psychology / Psychology, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-03-02'">Social Sciences / Psychology / Methods and Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-03-03'">Social Sciences / Psychology / Development Psychology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-03-04'">Social Sciences / Psychology / Applied Psychology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-04'">Social Sciences / Education</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-04-01'">Social Sciences / Education / Theory and History of Education</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-04-02'">Social Sciences / Education / Curriculum and Pedagogy</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-04-03'">Social Sciences / Education / Education Administration </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-04-04'">Social Sciences / Education / Education Systems</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-04-05'">Social Sciences / Education / Education, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-04-06'">Social Sciences / Education / Specialist Studies in Education</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-04-07'">Social Sciences / Education / Social Pedagogy, Social Work</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-05'">Social Sciences / Communication Science</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-05-01'">Social Sciences / Communication Science / Communication Research Methods</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-05-02'">Social Sciences / Communication Science / Communication Technology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-05-03'">Social Sciences / Communication Science / Communication Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-05-04'">Social Sciences / Communication Science / Group and Organizational Communication</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-05-05'">Social Sciences / Communication Science / Health Communication</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-05-06'">Social Sciences / Communication Science / Intercultural Communication</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-05-07'">Social Sciences / Communication Science / Interpersonal Communication</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-05-08'">Social Sciences / Communication Science / Mass Communication</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-05-09'">Social Sciences / Communication Science / Public and Political Communication</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-05-10'">Social Sciences / Communication Science / Visual Communication</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-05-11'">Social Sciences / Communication Science / Communication Science, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-06'">Social Sciences / Humor Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-06-01'">Social Sciences / Humor Studies / Empirical Humor Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-06-02'">Social Sciences / Humor Studies / Humor and Health</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-06-03'">Social Sciences / Humor Studies / Humor in Arts and Literature</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-06-04'">Social Sciences / Humor Studies / Humor and Social Sciences</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-06-05'">Social Sciences / Humor Studies / Humor Theory</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-06-06'">Social Sciences / Humor Studies / Humor and Linguistics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-06-07'">Social Sciences / Humor Studies / Humor and Psychology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-06-08'">Social Sciences / Humor Studies / Humor Studies, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-07'">Social Sciences / Anthropology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-07-01'">Social Sciences / Anthropology / Archeological Anthropology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-07-02'">Social Sciences / Anthropology / Social Anthropology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-07-03'">Social Sciences / Anthropology / Cultural Anthropology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-07-04'">Social Sciences / Anthropology / Linguistic Anthropology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-07-05'">Social Sciences / Anthropology / Biological Anthropology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SN-08'">Social Sciences / Social Sciences, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SR'">Sports and Recreation</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SR-01'">Sports and Recreation / History of Sports</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SR-02'">Sports and Recreation / Physical Education</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SR-03'">Sports and Recreation / Sports Psychology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SR-04'">Sports and Recreation / Sociology of Sports</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-SR-05'">Sports and Recreation / Sports and Recreation, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL'">Theology and Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-01'">Theology and Religion / General Topics and Biblical Reception </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-01-01'">Theology and Religion / General Topics and Biblical Reception / General</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-01-02'">Theology and Religion / General Topics and Biblical Reception / Biblical Reception</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-02'">Theology and Religion / Old Testament / Ancient Near East</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-02-01'">Theology and Religion / Old Testament / Ancient Near East / Introductions and Overviews</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-02-02'">Theology and Religion / Old Testament / Ancient Near East / Language and Textual History</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-02-03'">Theology and Religion / Old Testament / Ancient Near East / History of Exegesis, Methodology, Bibliographies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-02-04'">Theology and Religion / Old Testament / Ancient Near East / History of Reception</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-02-05'">Theology and Religion / Old Testament / Ancient Near East / Ancient Near East</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-02-06'">Theology and Religion / Old Testament / Ancient Near East / Exegetical Monographs, general</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-02-07'">Theology and Religion / Old Testament / Ancient Near East / Pentateuch and Historical Books</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-02-08'">Theology and Religion / Old Testament / Ancient Near East / Wisdom and Psalms</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-02-08-01'">Theology and Religion / Old Testament / Ancient Near East / Wisdom and Psalms / Wisdom and Psalms, other</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-02-09'">Theology and Religion / Old Testament / Ancient Near East / Prophets</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-02-10'">Theology and Religion / Old Testament / Ancient Near East / Apocrypha and Pseudepigrapha</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-02-11'">Theology and Religion / Old Testament / Ancient Near East / Qumran</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-03'">Theology and Religion / New Testament</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-03-01'">Theology and Religion / New Testament / Introductions and Overviews</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-03-02'">Theology and Religion / New Testament / Language and Reference Works</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-03-03'">Theology and Religion / New Testament / Textual History and Criticism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-03-04'">Theology and Religion / New Testament / History of Exegesis, Methodology, Bibliographies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-03-05'">Theology and Religion / New Testament / History of Reception</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-03-06'">Theology and Religion / New Testament / Historical, Political and Cultural Background</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-03-07'">Theology and Religion / New Testament / Exegetical Monographs, general </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-03-08'">Theology and Religion / New Testament / Synoptic Gospels and Acts</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-03-09'">Theology and Religion / New Testament / Paul</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-03-10'">Theology and Religion / New Testament / John </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-03-11'">Theology and Religion / New Testament / Hebrews and Catholic Epistles</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-03-12'">Theology and Religion / New Testament / New Testament Apocrypha and Pseudepigrapha</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-04'">Theology and Religion / Patristics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-04-01'">Theology and Religion / Patristics / Introductions and Overviews</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-04-02'">Theology and Religion / Patristics /  Patristic Authors</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-04-03'">Theology and Religion / Patristics / Nag Hammadi</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-04-04'">Theology and Religion / Patristics / Acts of Synods, Catenae and other Sources</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-04-05'">Theology and Religion / Patristics / Christian Apocrypha</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-04-06'">Theology and Religion / Patristics / Byzantine Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-04-07'">Theology and Religion / Patristics / History of Research</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-05'">Theology and Religion / Medieval Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-06'">Theology and Religion / Reformation Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-07'">Theology and Religion / Early Modern Times</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-08'">Theology and Religion / Modern Church History (19th and 20th Centuries)</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-09'">Theology and Religion / Modern Christian Thinkers and Philosophers of Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-09-01'">Theology and Religion / Modern Christian Thinkers and Philosophers of Religion / Enlightenment and German Idealism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-09-02'">Theology and Religion / Modern Christian Thinkers and Philosophers of Religion / Schleiermacher</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-09-03'">Theology and Religion / Modern Christian Thinkers and Philosophers of Religion / Kierkegaard</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-09-04'">Theology and Religion / Modern Christian Thinkers and Philosophers of Religion / Other 19th-Century Thinkers</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-09-05'">Theology and Religion / Modern Christian Thinkers and Philosophers of Religion / Tillich</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-09-06'">Theology and Religion / Modern Christian Thinkers and Philosophers of Religion / Troeltsch</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-09-07'">Theology and Religion / Modern Christian Thinkers and Philosophers of Religion / Other 20th-Century Thinkers</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-10'">Theology and Religion / Systematic Theology and Philosophy of Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-10-01'">Theology and Religion / Systematic Theology and Philosophy of Religion / Systematic Theology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-10-02'">Theology and Religion / Systematic Theology and Philosophy of Religion / Dogmatics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-10-03'">Theology and Religion / Systematic Theology and Philosophy of Religion / Ethics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-10-04'">Theology and Religion / Systematic Theology and Philosophy of Religion / Philosophy of Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-11'">Theology and Religion / Practical Theology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-11-01'">Theology and Religion / Practical Theology / History and Theory of Practical Theology</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-11-02'">Theology and Religion / Practical Theology / Homiletics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-11-03'">Theology and Religion / Practical Theology / Pastoral Counseling</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-11-04'">Theology and Religion / Practical Theology / Liturgical Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-11-05'">Theology and Religion / Practical Theology / Christian Education</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-11-06'">Theology and Religion / Practical Theology / Sociology of Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-11-07'">Theology and Religion / Practical Theology / Christian Life</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-12'">Theology and Religion / Denominational Studies, Ecumenism, World Christianity</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-13'">Theology and Religion / Church Law</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-14'">Theology and Religion / Jewish Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-14-01'">Theology and Religion / Jewish Studies / Introductions and Overviews</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-14-02'">Theology and Religion / Jewish Studies / Hellenistic-Roman Era</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-14-03'">Theology and Religion / Jewish Studies / Rabbinic Judaism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-14-04'">Theology and Religion / Jewish Studies / Middle Ages and Early Modern Times</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-14-05'">Theology and Religion / Jewish Studies / Modern Times</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-14-06'">Theology and Religion / Jewish Studies / Philosophy </xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-14-07'">Theology and Religion / Jewish Studies / Jewish Life</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-14-08'">Theology and Religion / Jewish Studies / Samaritans</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-14-09'">Theology and Religion / Jewish Studies / Sephardic and Oriental Jews</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15'">Theology and Religion / Religious Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-01'">Theology and Religion / Religious Studies / Introductions and Overviews</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-02'">Theology and Religion / Religious Studies / Comparative Studies</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-03'">Theology and Religion / Religious Studies / Ancient Religions</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-04'">Theology and Religion / Religious Studies / Buddhism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-05'">Theology and Religion / Religious Studies / Christianity</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-06'">Theology and Religion / Religious Studies / Hinduism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-07'">Theology and Religion / Religious Studies / Indigenous Religions and Native Traditions</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-08'">Theology and Religion / Religious Studies / Islam</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-09'">Theology and Religion / Religious Studies / Judaism</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-10'">Theology and Religion / Religious Studies / Other Religions</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-11'">Theology and Religion / Religious Studies / New Religious Movements</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-12'">Theology and Religion / Religious Studies / Anthropology of Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-13'">Theology and Religion / Religious Studies / History of Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-14'">Theology and Religion / Religious Studies / Philosophy of Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-15'">Theology and Religion / Religious Studies / Psychology of Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-16'">Theology and Religion / Religious Studies / Sociology of Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-17'">Theology and Religion / Religious Studies / Theory of Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-18'">Theology and Religion / Religious Studies / Religion and Media</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-19'">Theology and Religion / Religious Studies / Religion and Politics</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-20'">Theology and Religion / Religious Studies / Religion in Africa</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-21'">Theology and Religion / Religious Studies / Religion in Asia</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-22'">Theology and Religion / Religious Studies / Religion in Europe</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-23'">Theology and Religion / Religious Studies / Religion in Latin America</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-24'">Theology and Religion / Religious Studies / Religion in North America</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-25'">Theology and Religion / Religious Studies / Religion in the Middle East</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-26'">Theology and Religion / Religious Studies / Religion in Oceania</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-15-27'">Theology and Religion / Religious Studies / Secularity and Non-Religion</xsl:when>
            <xsl:when test="normalize-space($theCode)='SC-TL-16'">Theology and Religion / Islamic Studies</xsl:when>
            <xsl:otherwise>
                <xsl:message>Code inconnu: <xsl:value-of select="$theCode"/></xsl:message>
                <xsl:text></xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
