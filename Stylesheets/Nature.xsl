<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:m="http://www.w3.org/1998/Math/MathML" exclude-result-prefixes="#all">
    
    <xsl:output encoding="UTF-8" method="xml"/>
 <!-- genre -->
   <xsl:variable name="codeGenreNature1">
        <xsl:value-of select="normalize-space(//pubfm/categ/@id)"/>
    </xsl:variable>
    <xsl:variable name="codeGenreNature">
        <xsl:choose>
            <xsl:when test="$codeGenreNature1='20q'">Twenty Questions</xsl:when>
            <xsl:when test="$codeGenreNature1='50and100yrsago'">50 and 100 Years Ago</xsl:when>
            <xsl:when test="$codeGenreNature1='50yrsago'">50 Years Ago</xsl:when>
            <xsl:when test="$codeGenreNature1='absd'">Abstract and Discussion</xsl:when>
            <xsl:when test="$codeGenreNature1='ac'">Author Contribution</xsl:when>
            <xsl:when test="$codeGenreNature1='acmgcn'">ACMG College News</xsl:when>
            <xsl:when test="$codeGenreNature1='acmgpolicy'">ACMG Policy Statement</xsl:when>
            <xsl:when test="$codeGenreNature1='acmgprac'">ACMG Practice Guidelines</xsl:when>
            <xsl:when test="$codeGenreNature1='acmgpres'">ACMG Presidential Address</xsl:when>
            <xsl:when test="$codeGenreNature1='acmgrec'">ACMG Recommendations</xsl:when>
            <xsl:when test="$codeGenreNature1='acmgstd'">ACMG Standards and Guidelines</xsl:when>
            <xsl:when test="$codeGenreNature1='acrossedsdesk'">Across the Editor's Desk</xsl:when>
            <xsl:when test="$codeGenreNature1='add'">Addendum</xsl:when>
            <xsl:when test="$codeGenreNature1='adfeat'">Technology Feature</xsl:when>
            <xsl:when test="$codeGenreNature1='adv'">Advances</xsl:when>
            <xsl:when test="$codeGenreNature1='advert'">Advertorial</xsl:when>
            <xsl:when test="$codeGenreNature1='advice'">Advice</xsl:when>
            <xsl:when test="$codeGenreNature1='aeronauticalnotes'">Aeronautical Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='af'">Article</xsl:when>
            <xsl:when test="$codeGenreNature1='amateurtelescopemaker'">The Amateur Telescope Maker</xsl:when>
            <xsl:when test="$codeGenreNature1='ampedsoc'">The American Pediatric Society</xsl:when>
            <xsl:when test="$codeGenreNature1='an'">Analysis</xsl:when>
            <xsl:when test="$codeGenreNature1='annmtg'">Annual meeting</xsl:when>
            <xsl:when test="$codeGenreNature1='announcement'">Announcement</xsl:when>
            <xsl:when test="$codeGenreNature1='apn'">Application Note</xsl:when>
            <xsl:when test="$codeGenreNature1='ar'">Article Report</xsl:when>
            <xsl:when test="$codeGenreNature1='archeology'">Archeology</xsl:when>
            <xsl:when test="$codeGenreNature1='ars'">Art and Science</xsl:when>
            <xsl:when test="$codeGenreNature1='astronomy'">Astronomy</xsl:when>
            <xsl:when test="$codeGenreNature1='au'">Authors</xsl:when>
            <xsl:when test="$codeGenreNature1='aub'">Autumn Books</xsl:when>
            <xsl:when test="$codeGenreNature1='aviation'">Aviation</xsl:when>
            <xsl:when test="$codeGenreNature1='ba'">Books and Arts</xsl:when>
            <xsl:when test="$codeGenreNature1='backoffrontispiece'">Back of Frontispiece</xsl:when>
            <xsl:when test="$codeGenreNature1='bb'">Between Bedside and Bench</xsl:when>
            <xsl:when test="$codeGenreNature1='bc'">Brief Communications</xsl:when>
            <xsl:when test="$codeGenreNature1='bca'">Brief Communication Arising</xsl:when>
            <xsl:when test="$codeGenreNature1='bio'">Bioentrepreneur</xsl:when>
            <xsl:when test="$codeGenreNature1='biov'">Biovision</xsl:when>
            <xsl:when test="$codeGenreNature1='bks'">Book Review</xsl:when>
            <xsl:when test="$codeGenreNature1='bkstory'">Backstory</xsl:when>
            <xsl:when test="$codeGenreNature1='blog'">Blog</xsl:when>
            <xsl:when test="$codeGenreNature1='blogosphere'">Blogosphere</xsl:when>
            <xsl:when test="$codeGenreNature1='blogroll'">Blogroll</xsl:when>
            <xsl:when test="$codeGenreNature1='bn'">Business</xsl:when>
            <xsl:when test="$codeGenreNature1='bnf'">Business Feature</xsl:when>
            <xsl:when test="$codeGenreNature1='bo'">Book Review</xsl:when>
            <xsl:when test="$codeGenreNature1='bonekyw'">BoneKEy Watch</xsl:when>
            <xsl:when test="$codeGenreNature1='boo'">Book</xsl:when>
            <xsl:when test="$codeGenreNature1='books'">Books</xsl:when>
            <xsl:when test="$codeGenreNature1='bp'">Brief Report</xsl:when>
            <xsl:when test="$codeGenreNature1='br'">Briefing</xsl:when>
            <xsl:when test="$codeGenreNature1='brfnw'">News Brief</xsl:when>
            <xsl:when test="$codeGenreNature1='brn'">Business and Regulatory News</xsl:when>
            <xsl:when test="$codeGenreNature1='browsingwitheditor'">Browsing With the Editor</xsl:when>
            <xsl:when test="$codeGenreNature1='bru'">Briefing Update</xsl:when>
            <xsl:when test="$codeGenreNature1='bsn'">Business News</xsl:when>
            <xsl:when test="$codeGenreNature1='businessandpersonal'">Business and Personal</xsl:when>
            <xsl:when test="$codeGenreNature1='byndbndrs'">Beyond Boundaries</xsl:when>
            <xsl:when test="$codeGenreNature1='cameraangles'">Camera Angles</xsl:when>
            <xsl:when test="$codeGenreNature1='cameraanglesroundtable'">Camera Angles Round Table</xsl:when>
            <xsl:when test="$codeGenreNature1='car'">Careers and Recruitment</xsl:when>
            <xsl:when test="$codeGenreNature1='case'">Case Study</xsl:when>
            <xsl:when test="$codeGenreNature1='casefv'">Case Study FV</xsl:when>
            <xsl:when test="$codeGenreNature1='caser'">Case Report</xsl:when>
            <xsl:when test="$codeGenreNature1='cc'">Community Corner</xsl:when>
            <xsl:when test="$codeGenreNature1='cg'">Corrigendum</xsl:when>
            <xsl:when test="$codeGenreNature1='chemistryinindustry'">Chemistry in Industry</xsl:when>
            <xsl:when test="$codeGenreNature1='civilengnrngnotes'">Civil Engineering Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='clin'">Clinical</xsl:when>
            <xsl:when test="$codeGenreNature1='clinadv'">Clinical Advance</xsl:when>
            <xsl:when test="$codeGenreNature1='clincase'">Clinical Cases</xsl:when>
            <xsl:when test="$codeGenreNature1='clincon'">Clinical Context</xsl:when>
            <xsl:when test="$codeGenreNature1='clincr'">Clinical Case Report</xsl:when>
            <xsl:when test="$codeGenreNature1='clinfor'">Clinical Informatics</xsl:when>
            <xsl:when test="$codeGenreNature1='clinimg'">Clinical Image</xsl:when>
            <xsl:when test="$codeGenreNature1='clinres'">Clinical research</xsl:when>
            <xsl:when test="$codeGenreNature1='clintechnq'">Clinical Techniques</xsl:when>
            <xsl:when test="$codeGenreNature1='clncon'">Clinical context</xsl:when>
            <xsl:when test="$codeGenreNature1='clnimg'">Clinical image</xsl:when>
            <xsl:when test="$codeGenreNature1='cm'">Commentary</xsl:when>
            <xsl:when test="$codeGenreNature1='cme'">Continuing Medical Education</xsl:when>
            <xsl:when test="$codeGenreNature1='cmeed'">CME Editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='cmtrep'">Committee Report</xsl:when>
            <xsl:when test="$codeGenreNature1='cn'">Communication</xsl:when>
            <xsl:when test="$codeGenreNature1='cna'">Communications Arising</xsl:when>
            <xsl:when test="$codeGenreNature1='co'">Commentary</xsl:when>
            <xsl:when test="$codeGenreNature1='col'">Column</xsl:when>
            <xsl:when test="$codeGenreNature1='collabrv'">Collaborative Review</xsl:when>
            <xsl:when test="$codeGenreNature1='collnews'">College News</xsl:when>
            <xsl:when test="$codeGenreNature1='com'">Comment</xsl:when>
            <xsl:when test="$codeGenreNature1='commrclpropnews'">Commercial Property News</xsl:when>
            <xsl:when test="$codeGenreNature1='compbio'">Computational Biology</xsl:when>
            <xsl:when test="$codeGenreNature1='conc'">Concepts</xsl:when>
            <xsl:when test="$codeGenreNature1='conf'">Conference</xsl:when>
            <xsl:when test="$codeGenreNature1='cons'">Consensus Statement</xsl:when>
            <xsl:when test="$codeGenreNature1='contest'">Contest</xsl:when>
            <xsl:when test="$codeGenreNature1='couch'">From the Analyst's Couch</xsl:when>
            <xsl:when test="$codeGenreNature1='cprot'">Classic Protocol</xsl:when>
            <xsl:when test="$codeGenreNature1='cr'">Correspondence</xsl:when>
            <xsl:when test="$codeGenreNature1='crsswrd'">Crossword</xsl:when>
            <xsl:when test="$codeGenreNature1='cs'">Correction</xsl:when>
            <xsl:when test="$codeGenreNature1='cse'">Case Series</xsl:when>
            <xsl:when test="$codeGenreNature1='cstory'">Cover Story</xsl:when>
            <xsl:when test="$codeGenreNature1='currntbulltnbrfs'">Current Bulletin Briefs</xsl:when>
            <xsl:when test="$codeGenreNature1='cy'">Commentary</xsl:when>
            <xsl:when test="$codeGenreNature1='dabs'">Discussion of Abstracts</xsl:when>
            <xsl:when test="$codeGenreNature1='db'">Debate</xsl:when>
            <xsl:when test="$codeGenreNature1='dbases'">Databases</xsl:when>
            <xsl:when test="$codeGenreNature1='dd'">Data Descriptor</xsl:when>
            <xsl:when test="$codeGenreNature1='dept'">Department</xsl:when>
            <xsl:when test="$codeGenreNature1='diary'">Diary</xsl:when>
            <xsl:when test="$codeGenreNature1='dplat'">Drug Platforms</xsl:when>
            <xsl:when test="$codeGenreNature1='dsdv'">Discovery &amp; Development</xsl:when>
            <xsl:when test="$codeGenreNature1='dtech'">Distillery: Techniques</xsl:when>
            <xsl:when test="$codeGenreNature1='dther'">Distillery: Therapeutics</xsl:when>
            <xsl:when test="$codeGenreNature1='dw'">Disease Watch</xsl:when>
            <xsl:when test="$codeGenreNature1='ecr'">EMBO Conference Report</xsl:when>
            <xsl:when test="$codeGenreNature1='ED'">Editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='ed'">Editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='edfocus'">Editor's Focus</xsl:when>
            <xsl:when test="$codeGenreNature1='edfv'">Editorial FV</xsl:when>
            <xsl:when test="$codeGenreNature1='edin'">Editor's introduction</xsl:when>
            <xsl:when test="$codeGenreNature1='ednote'">Editor's Note</xsl:when>
            <xsl:when test="$codeGenreNature1='eds'">Editor's Letter</xsl:when>
            <xsl:when test="$codeGenreNature1='edu'">Education</xsl:when>
            <xsl:when test="$codeGenreNature1='eduforum'">Educational Forum</xsl:when>
            <xsl:when test="$codeGenreNature1='edurep'">Educational Report</xsl:when>
            <xsl:when test="$codeGenreNature1='egame'">Endgame</xsl:when>
            <xsl:when test="$codeGenreNature1='egapp'">EGAPP Recommendation Statement</xsl:when>
            <xsl:when test="$codeGenreNature1='el'">Elements</xsl:when>
            <xsl:when test="$codeGenreNature1='electricalnotes'">Electrical Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='electronics'">Electronics</xsl:when>
            <xsl:when test="$codeGenreNature1='emr'">EMBO Members Review</xsl:when>
            <xsl:when test="$codeGenreNature1='eng'">In English, Nature</xsl:when>
            <xsl:when test="$codeGenreNature1='engineering'">Engineering</xsl:when>
            <xsl:when test="$codeGenreNature1='epig'">Epigenetics</xsl:when>
            <xsl:when test="$codeGenreNature1='er'">Erratum</xsl:when>
            <xsl:when test="$codeGenreNature1='erp'">Editorial Reprise</xsl:when>
            <xsl:when test="$codeGenreNature1='essay'">Essay</xsl:when>
            <xsl:when test="$codeGenreNature1='essaycon'">Essay Concept</xsl:when>
            <xsl:when test="$codeGenreNature1='ethicsw'">Ethics Watch</xsl:when>
            <xsl:when test="$codeGenreNature1='evrv'">Evidence Review</xsl:when>
            <xsl:when test="$codeGenreNature1='ewr'">EMBO Workshop Report</xsl:when>
            <xsl:when test="$codeGenreNature1='explorationnotes'">Exploration Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='exprv'">Expert Review</xsl:when>
            <xsl:when test="$codeGenreNature1='fa'">Featured Articles</xsl:when>
            <xsl:when test="$codeGenreNature1='faq'">Frequently asked Questions</xsl:when>
            <xsl:when test="$codeGenreNature1='fd'">Foreword</xsl:when>
            <xsl:when test="$codeGenreNature1='fe'">Feature</xsl:when>
            <xsl:when test="$codeGenreNature1='fep'">Featured Editor's Picks</xsl:when>
            <xsl:when test="$codeGenreNature1='filmr'">Film Review</xsl:when>
            <xsl:when test="$codeGenreNature1='firearmsfishing'">Your Firearms and Fishing Tackle</xsl:when>
            <xsl:when test="$codeGenreNature1='fn'">Finance</xsl:when>
            <xsl:when test="$codeGenreNature1='fnisn'">ISN Forefronts in Nephrology</xsl:when>
            <xsl:when test="$codeGenreNature1='fno'">Field Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='focus'">Focus</xsl:when>
            <xsl:when test="$codeGenreNature1='focusrev'">Focus Review</xsl:when>
            <xsl:when test="$codeGenreNature1='forestindustry'">Forest Industry</xsl:when>
            <xsl:when test="$codeGenreNature1='forum'">Forum</xsl:when>
            <xsl:when test="$codeGenreNature1='fpln'">Fresh from the Pipeline</xsl:when>
            <xsl:when test="$codeGenreNature1='fqc'">Focus Quality Control</xsl:when>
            <xsl:when test="$codeGenreNature1='fr'">Film Review</xsl:when>
            <xsl:when test="$codeGenreNature1='fromed'">From The Editors</xsl:when>
            <xsl:when test="$codeGenreNature1='frontispiece'">Frontispiece</xsl:when>
            <xsl:when test="$codeGenreNature1='ftw'">Feeding the World</xsl:when>
            <xsl:when test="$codeGenreNature1='fundamentalscience'">Fundamental Science</xsl:when>
            <xsl:when test="$codeGenreNature1='fut'">Futures</xsl:when>
            <xsl:when test="$codeGenreNature1='gen'">General</xsl:when>
            <xsl:when test="$codeGenreNature1='genecardupd'">Clinical Utility Gene Card Update</xsl:when>
            <xsl:when test="$codeGenreNature1='genetestrv'">GeneTest Review</xsl:when>
            <xsl:when test="$codeGenreNature1='getact'">Get Active</xsl:when>
            <xsl:when test="$codeGenreNature1='gic'">General Information for Contributors</xsl:when>
            <xsl:when test="$codeGenreNature1='gnintl'">International Genetics</xsl:when>
            <xsl:when test="$codeGenreNature1='gnlg'">Genetics Legacies</xsl:when>
            <xsl:when test="$codeGenreNature1='governmentalactivities'">Governmental Activities</xsl:when>
            <xsl:when test="$codeGenreNature1='graphicscience'">Graphic Science</xsl:when>
            <xsl:when test="$codeGenreNature1='grow'">GROW Report</xsl:when>
            <xsl:when test="$codeGenreNature1='gu'">Guidelines</xsl:when>
            <xsl:when test="$codeGenreNature1='gus'">Guidelines Summary</xsl:when>
            <xsl:when test="$codeGenreNature1='gw'">Genome Watch</xsl:when>
            <xsl:when test="$codeGenreNature1='hc'">Historical Commentary</xsl:when>
            <xsl:when test="$codeGenreNature1='health'">Health</xsl:when>
            <xsl:when test="$codeGenreNature1='healthscience'">Health Science</xsl:when>
            <xsl:when test="$codeGenreNature1='hh'">Human Health</xsl:when>
            <xsl:when test="$codeGenreNature1='hi'">Hypertension Illustrated</xsl:when>
            <xsl:when test="$codeGenreNature1='highlts'">Research Highlights</xsl:when>
            <xsl:when test="$codeGenreNature1='highwaytransportation'">Highway Transportation</xsl:when>
            <xsl:when test="$codeGenreNature1='hliss'">Highlights of This Issue</xsl:when>
            <xsl:when test="$codeGenreNature1='hn'">Historical News and Views</xsl:when>
            <xsl:when test="$codeGenreNature1='hor'">Horizons</xsl:when>
            <xsl:when test="$codeGenreNature1='householdinventions'">Household Inventions</xsl:when>
            <xsl:when test="$codeGenreNature1='hp'">Historical Perspective</xsl:when>
            <xsl:when test="$codeGenreNature1='hrn'">Historical Research Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='hs'">History</xsl:when>
            <xsl:when test="$codeGenreNature1='hsaw'">Harland Sanders Award</xsl:when>
            <xsl:when test="$codeGenreNature1='htman'">How to manage...</xsl:when>
            <xsl:when test="$codeGenreNature1='hv'">Historical Vignette</xsl:when>
            <xsl:when test="$codeGenreNature1='hyp'">Hypothesis</xsl:when>
            <xsl:when test="$codeGenreNature1='hys'">Have you seen?</xsl:when>
            <xsl:when test="$codeGenreNature1='hyst'">Have you seen?</xsl:when>
            <xsl:when test="$codeGenreNature1='ib'">In Brief</xsl:when>
            <xsl:when test="$codeGenreNature1='in'">Introduction</xsl:when>
            <xsl:when test="$codeGenreNature1='inclass'">In The Classroom</xsl:when>
            <xsl:when test="$codeGenreNature1='index'">Index</xsl:when>
            <xsl:when test="$codeGenreNature1='indexofinventions'">Index of Inventions</xsl:when>
            <xsl:when test="$codeGenreNature1='indp'">Industry Perspective</xsl:when>
            <xsl:when test="$codeGenreNature1='industrialdigest'">Industrial Digest</xsl:when>
            <xsl:when test="$codeGenreNature1='industriesatoms'">Industries From Atoms</xsl:when>
            <xsl:when test="$codeGenreNature1='industrltrnds'">Industrial Trends</xsl:when>
            <xsl:when test="$codeGenreNature1='industry'">Industry</xsl:when>
            <xsl:when test="$codeGenreNature1='info'">Information</xsl:when>
            <xsl:when test="$codeGenreNature1='iniss'">In This Issue</xsl:when>
            <xsl:when test="$codeGenreNature1='inothrflds'">In Other Fields</xsl:when>
            <xsl:when test="$codeGenreNature1='inpress'">In the press</xsl:when>
            <xsl:when test="$codeGenreNature1='INSIGHT'">Insight</xsl:when>
            <xsl:when test="$codeGenreNature1='insight'">Insight</xsl:when>
            <xsl:when test="$codeGenreNature1='insit'">In Situ</xsl:when>
            <xsl:when test="$codeGenreNature1='intheedsmail'">In the Editor's Mail</xsl:when>
            <xsl:when test="$codeGenreNature1='intvw'">Interview</xsl:when>
            <xsl:when test="$codeGenreNature1='invcm'">Invited Commentary</xsl:when>
            <xsl:when test="$codeGenreNature1='invcme'">Invited Review/CME Article</xsl:when>
            <xsl:when test="$codeGenreNature1='inved'">Invited Editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='inventions'">Inventions</xsl:when>
            <xsl:when test="$codeGenreNature1='inventionshousehold'">Inventions for the Household</xsl:when>
            <xsl:when test="$codeGenreNature1='inventionsnew'">Inventions New and Interesting</xsl:when>
            <xsl:when test="$codeGenreNature1='is'">Insight</xsl:when>
            <xsl:when test="$codeGenreNature1='itp'">Inside The Paper</xsl:when>
            <xsl:when test="$codeGenreNature1='ix'">Index</xsl:when>
            <xsl:when test="$codeGenreNature1='iye'">In Your Element</xsl:when>
            <xsl:when test="$codeGenreNature1='japau'">Japanese Author</xsl:when>
            <xsl:when test="$codeGenreNature1='japlnf'">Local News Feature</xsl:when>
            <xsl:when test="$codeGenreNature1='japmuse'">muse@nature.com</xsl:when>
            <xsl:when test="$codeGenreNature1='japnf'">Japan News Feature</xsl:when>
            <xsl:when test="$codeGenreNature1='japnw'">Nature News</xsl:when>
            <xsl:when test="$codeGenreNature1='japsi'">Scientist Interview</xsl:when>
            <xsl:when test="$codeGenreNature1='japsn'">Science News</xsl:when>
            <xsl:when test="$codeGenreNature1='jcb'">Journal Club</xsl:when>
            <xsl:when test="$codeGenreNature1='jr'">Journal Review</xsl:when>
            <xsl:when test="$codeGenreNature1='labmeth'">Laboratory Methods</xsl:when>
            <xsl:when test="$codeGenreNature1='le'">Letter</xsl:when>
            <xsl:when test="$codeGenreNature1='learningtousewings'">Learning to Use Our Wings</xsl:when>
            <xsl:when test="$codeGenreNature1='led'">Letter to the Editor</xsl:when>
            <xsl:when test="$codeGenreNature1='legalhighlights'">Legal High-Lights</xsl:when>
            <xsl:when test="$codeGenreNature1='legalnotes'">Legal Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='lfln'">Lifeline</xsl:when>
            <xsl:when test="$codeGenreNature1='lgu'">Legal Update</xsl:when>
            <xsl:when test="$codeGenreNature1='li'">Inside Lab Invest</xsl:when>
            <xsl:when test="$codeGenreNature1='lm'">Landmark</xsl:when>
            <xsl:when test="$codeGenreNature1='lstwrd'">Last Word</xsl:when>
            <xsl:when test="$codeGenreNature1='lt'">Letters to Nature</xsl:when>
            <xsl:when test="$codeGenreNature1='ma'">Mergers and Acquisitions</xsl:when>
            <xsl:when test="$codeGenreNature1='mabs'">Meeting Abstracts</xsl:when>
            <xsl:when test="$codeGenreNature1='mark'">Markers</xsl:when>
            <xsl:when test="$codeGenreNature1='marw'">Market Watch</xsl:when>
            <xsl:when test="$codeGenreNature1='mcal'">Meeting Calendar</xsl:when>
            <xsl:when test="$codeGenreNature1='mechengnrngnotes'">Mechanical Engineering Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='medgncal'">Medical Genetics Calendar</xsl:when>
            <xsl:when test="$codeGenreNature1='medgndp'">Medical Genetics Diplomates</xsl:when>
            <xsl:when test="$codeGenreNature1='medicalscience'">Medical Science</xsl:when>
            <xsl:when test="$codeGenreNature1='medrv'">Medal Review</xsl:when>
            <xsl:when test="$codeGenreNature1='meetteam'">Meet the team</xsl:when>
            <xsl:when test="$codeGenreNature1='mem'">In Memorium</xsl:when>
            <xsl:when test="$codeGenreNature1='memrv'">Member Review</xsl:when>
            <xsl:when test="$codeGenreNature1='metalsinindustry'">Metals in Industry</xsl:when>
            <xsl:when test="$codeGenreNature1='methods'">Methods</xsl:when>
            <xsl:when test="$codeGenreNature1='methodstowatch'">Method to Watch</xsl:when>
            <xsl:when test="$codeGenreNature1='mgt'">Management</xsl:when>
            <xsl:when test="$codeGenreNature1='mib'">Methods in Brief</xsl:when>
            <xsl:when test="$codeGenreNature1='militaryscience'">Military Science</xsl:when>
            <xsl:when test="$codeGenreNature1='mindinpictures'">Mind in Pictures</xsl:when>
            <xsl:when test="$codeGenreNature1='minirv'">Mini Review</xsl:when>
            <xsl:when test="$codeGenreNature1='misc'">miscellany</xsl:when>
            <xsl:when test="$codeGenreNature1='miscellaneousnotes'">Miscellaneous Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='miscellany'">Miscellany</xsl:when>
            <xsl:when test="$codeGenreNature1='mktana'">Market Analysis</xsl:when>
            <xsl:when test="$codeGenreNature1='modofthemonth'">Model of the Month</xsl:when>
            <xsl:when test="$codeGenreNature1='motordrvncmmrclvhcl'">The Motor-Driven Commercial Vehicle</xsl:when>
            <xsl:when test="$codeGenreNature1='mp'">Marketplace</xsl:when>
            <xsl:when test="$codeGenreNature1='mr'">Meeting Report</xsl:when>
            <xsl:when test="$codeGenreNature1='mt'">Meetings</xsl:when>
            <xsl:when test="$codeGenreNature1='mtp'">Making the Paper</xsl:when>
            <xsl:when test="$codeGenreNature1='multr'">Multimedia Review</xsl:when>
            <xsl:when test="$codeGenreNature1='na'">News and Analysis</xsl:when>
            <xsl:when test="$codeGenreNature1='nationaldefense'">National Defense</xsl:when>
            <xsl:when test="$codeGenreNature1='naturalhistory'">Natural History</xsl:when>
            <xsl:when test="$codeGenreNature1='natureindex'">Nature Index</xsl:when>
            <xsl:when test="$codeGenreNature1='naturejobs'">Naturejobs</xsl:when>
            <xsl:when test="$codeGenreNature1='natview'">Natureview</xsl:when>
            <xsl:when test="$codeGenreNature1='navigation'">Navigation</xsl:when>
            <xsl:when test="$codeGenreNature1='nb'">News in Brief</xsl:when>
            <xsl:when test="$codeGenreNature1='nbr'">News in Brief</xsl:when>
            <xsl:when test="$codeGenreNature1='nbri'">News in Brief</xsl:when>
            <xsl:when test="$codeGenreNature1='ne'">News</xsl:when>
            <xsl:when test="$codeGenreNature1='nemr'">New EMBO Members Review</xsl:when>
            <xsl:when test="$codeGenreNature1='neuro'">Neurotechniques</xsl:when>
            <xsl:when test="$codeGenreNature1='newboatandequip'">New Boat and Boat Equipment</xsl:when>
            <xsl:when test="$codeGenreNature1='newgenetest'">New at GeneTests</xsl:when>
            <xsl:when test="$codeGenreNature1='newprodcts'">New Products</xsl:when>
            <xsl:when test="$codeGenreNature1='newprodctsandprocesses'">New Products and Processes</xsl:when>
            <xsl:when test="$codeGenreNature1='nf'">News Feature</xsl:when>
            <xsl:when test="$codeGenreNature1='ngal'">Nature Gallery</xsl:when>
            <xsl:when test="$codeGenreNature1='nj'">New Journals</xsl:when>
            <xsl:when test="$codeGenreNature1='nm'">New on the Market</xsl:when>
            <xsl:when test="$codeGenreNature1='nmr'">New Member Review</xsl:when>
            <xsl:when test="$codeGenreNature1='nobellr'">Nobel Lecture</xsl:when>
            <xsl:when test="$codeGenreNature1='notesandqueries'">Notes and Queries</xsl:when>
            <xsl:when test="$codeGenreNature1='noveldevicesforshop'">Novel Devices for the Shop and the Home</xsl:when>
            <xsl:when test="$codeGenreNature1='np'">News Profile</xsl:when>
            <xsl:when test="$codeGenreNature1='npedrv'">Nanopediatrics Review Article</xsl:when>
            <xsl:when test="$codeGenreNature1='ntbm'">Not To Be Missed</xsl:when>
            <xsl:when test="$codeGenreNature1='nv'">News and Views</xsl:when>
            <xsl:when test="$codeGenreNature1='nvb'">News and Views in Brief</xsl:when>
            <xsl:when test="$codeGenreNature1='nvf'">News and Views Feature</xsl:when>
            <xsl:when test="$codeGenreNature1='nvfv'">News and Views FV</xsl:when>
            <xsl:when test="$codeGenreNature1='nvqa'">News and Views Q&amp;A</xsl:when>
            <xsl:when test="$codeGenreNature1='nw'">News</xsl:when>
            <xsl:when test="$codeGenreNature1='oa'">Original Article</xsl:when>
            <xsl:when test="$codeGenreNature1='ob'">Obituary</xsl:when>
            <xsl:when test="$codeGenreNature1='ofgeneralintrst'">Of General Interest</xsl:when>
            <xsl:when test="$codeGenreNature1='ofintrsttomtrsts'">Of Interest to Motorists</xsl:when>
            <xsl:when test="$codeGenreNature1='onbr'">Online News in Brief</xsl:when>
            <xsl:when test="$codeGenreNature1='onyrft'">On Your Feet</xsl:when>
            <xsl:when test="$codeGenreNature1='op'">Opinion</xsl:when>
            <xsl:when test="$codeGenreNature1='opcom'">Opinion and Comment</xsl:when>
            <xsl:when test="$codeGenreNature1='osa'">Original Research Article</xsl:when>
            <xsl:when test="$codeGenreNature1='ourbookcorner'">Our Book Corner</xsl:when>
            <xsl:when test="$codeGenreNature1='ourpointofvieweds'">Our Point of View - Editorials</xsl:when>
            <xsl:when test="$codeGenreNature1='ourreaderspointofview'">Our Readers' Point of View</xsl:when>
            <xsl:when test="$codeGenreNature1='out'">Outlook</xsl:when>
            <xsl:when test="$codeGenreNature1='outlab'">Out of the lab</xsl:when>
            <xsl:when test="$codeGenreNature1='ov'">Overview</xsl:when>
            <xsl:when test="$codeGenreNature1='pa'">Poster Abstract</xsl:when>
            <xsl:when test="$codeGenreNature1='patentandtmnotes'">Patent and Trade-mark Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='patentnotes'">Patent Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='patentsrcntlyissd'">Patents Recently Issued</xsl:when>
            <xsl:when test="$codeGenreNature1='pe'">Perspectives</xsl:when>
            <xsl:when test="$codeGenreNature1='pedr'">Pediatric Research</xsl:when>
            <xsl:when test="$codeGenreNature1='pefv'">Perspective FV</xsl:when>
            <xsl:when test="$codeGenreNature1='personaltsinindstry'">Personalities in Industry</xsl:when>
            <xsl:when test="$codeGenreNature1='personaltsinscnce'">Personalities in Science</xsl:when>
            <xsl:when test="$codeGenreNature1='petroleum'">Petroleum</xsl:when>
            <xsl:when test="$codeGenreNature1='phot'">Photonics at NPG</xsl:when>
            <xsl:when test="$codeGenreNature1='photography'">Photography</xsl:when>
            <xsl:when test="$codeGenreNature1='pi'">Picture Story</xsl:when>
            <xsl:when test="$codeGenreNature1='pl'">Plus</xsl:when>
            <xsl:when test="$codeGenreNature1='plastics'">Plastics</xsl:when>
            <xsl:when test="$codeGenreNature1='pn'">Product News</xsl:when>
            <xsl:when test="$codeGenreNature1='pod'">Podcast</xsl:when>
            <xsl:when test="$codeGenreNature1='polw'">Policy Watch</xsl:when>
            <xsl:when test="$codeGenreNature1='ppi'">Public-Private Interface</xsl:when>
            <xsl:when test="$codeGenreNature1='ppro'">Product Profile</xsl:when>
            <xsl:when test="$codeGenreNature1='ppt'">Practice Point</xsl:when>
            <xsl:when test="$codeGenreNature1='pr'">Progress</xsl:when>
            <xsl:when test="$codeGenreNature1='prac'">Practice</xsl:when>
            <xsl:when test="$codeGenreNature1='previewsofindstrlhrzn'">Previews of the Industrial Horizon</xsl:when>
            <xsl:when test="$codeGenreNature1='prf'">Product Focus</xsl:when>
            <xsl:when test="$codeGenreNature1='prhl'">Product Highlights</xsl:when>
            <xsl:when test="$codeGenreNature1='prim'">Primer</xsl:when>
            <xsl:when test="$codeGenreNature1='pro'">Profile</xsl:when>
            <xsl:when test="$codeGenreNature1='proceeding'">Conference Proceeding</xsl:when>
            <xsl:when test="$codeGenreNature1='prog'">Progress Article</xsl:when>
            <xsl:when test="$codeGenreNature1='prorv'">Protocol Review</xsl:when>
            <xsl:when test="$codeGenreNature1='prot'">Protocol</xsl:when>
            <xsl:when test="$codeGenreNature1='protupdate'">Protocol Update</xsl:when>
            <xsl:when test="$codeGenreNature1='prv'">Product Review</xsl:when>
            <xsl:when test="$codeGenreNature1='psychicresearch'">Psychic Research</xsl:when>
            <xsl:when test="$codeGenreNature1='puzzle'">Puzzle page</xsl:when>
            <xsl:when test="$codeGenreNature1='pw'">Patent Watch</xsl:when>
            <xsl:when test="$codeGenreNature1='qa'">Q&amp;A</xsl:when>
            <xsl:when test="$codeGenreNature1='quotes'">Quotes</xsl:when>
            <xsl:when test="$codeGenreNature1='ra'">Research Article</xsl:when>
            <xsl:when test="$codeGenreNature1='radionotes'">Radio Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='railroadtransportation'">Railroad Transportation</xsl:when>
            <xsl:when test="$codeGenreNature1='rcom'">Research Commentary</xsl:when>
            <xsl:when test="$codeGenreNature1='rd'">Regional Development</xsl:when>
            <xsl:when test="$codeGenreNature1='rdpub'">Rapid Publication</xsl:when>
            <xsl:when test="$codeGenreNature1='re'">Research</xsl:when>
            <xsl:when test="$codeGenreNature1='recentlyptntdinvntns'">Recently Patented Inventions</xsl:when>
            <xsl:when test="$codeGenreNature1='refutation'">Refutation</xsl:when>
            <xsl:when test="$codeGenreNature1='rep'">Report</xsl:when>
            <xsl:when test="$codeGenreNature1='reply'">Reply</xsl:when>
            <xsl:when test="$codeGenreNature1='ret'">Retraction</xsl:when>
            <xsl:when test="$codeGenreNature1='reviewers'">Reviewers</xsl:when>
            <xsl:when test="$codeGenreNature1='rhighlts'">Research Highlight</xsl:when>
            <xsl:when test="$codeGenreNature1='rl'">Research Library</xsl:when>
            <xsl:when test="$codeGenreNature1='rlet'">Research Letters</xsl:when>
            <xsl:when test="$codeGenreNature1='rn'">Research News</xsl:when>
            <xsl:when test="$codeGenreNature1='rnote'">Research Note</xsl:when>
            <xsl:when test="$codeGenreNature1='rr'">Research Review</xsl:when>
            <xsl:when test="$codeGenreNature1='rs'">Resource</xsl:when>
            <xsl:when test="$codeGenreNature1='ru'">Round-up</xsl:when>
            <xsl:when test="$codeGenreNature1='RV'">Review</xsl:when>
            <xsl:when test="$codeGenreNature1='rv'">Review</xsl:when>
            <xsl:when test="$codeGenreNature1='rvfv'">Review FV</xsl:when>
            <xsl:when test="$codeGenreNature1='rw'">Regulation Watch</xsl:when>
            <xsl:when test="$codeGenreNature1='safety'">Safety</xsl:when>
            <xsl:when test="$codeGenreNature1='sb'">Spring Books</xsl:when>
            <xsl:when test="$codeGenreNature1='sc'">Scientific Correspondence</xsl:when>
            <xsl:when test="$codeGenreNature1='sciamdigest'">Scientific American Digest</xsl:when>
            <xsl:when test="$codeGenreNature1='sciamindstrldigest'">Scientific American Industrial Digest</xsl:when>
            <xsl:when test="$codeGenreNature1='scienceagenda'">Science Agenda</xsl:when>
            <xsl:when test="$codeGenreNature1='scienceandmoney'">Science and Money</xsl:when>
            <xsl:when test="$codeGenreNature1='scienceinindstry'">Science in Industry</xsl:when>
            <xsl:when test="$codeGenreNature1='sciencenotes'">Science Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='scienceofhealth'">The Science of Health</xsl:when>
            <xsl:when test="$codeGenreNature1='scientificresearch'">Scientific Research</xsl:when>
            <xsl:when test="$codeGenreNature1='scinw'">Science - in the News</xsl:when>
            <xsl:when test="$codeGenreNature1='servicechemist'">Service of the Chemist</xsl:when>
            <xsl:when test="$codeGenreNature1='sevendays'">Seven Days</xsl:when>
            <xsl:when test="$codeGenreNature1='sf'">Special Feature</xsl:when>
            <xsl:when test="$codeGenreNature1='si'">Social Issues</xsl:when>
            <xsl:when test="$codeGenreNature1='sim'">Science and Image</xsl:when>
            <xsl:when test="$codeGenreNature1='snaps'">Snapshot</xsl:when>
            <xsl:when test="$codeGenreNature1='sp'">Strategic Planning</xsl:when>
            <xsl:when test="$codeGenreNature1='spar'">Special Article</xsl:when>
            <xsl:when test="$codeGenreNature1='spfwd'">Sponsor's Foreword</xsl:when>
            <xsl:when test="$codeGenreNature1='spot'">Spotlight</xsl:when>
            <xsl:when test="$codeGenreNature1='sprep'">Special Report</xsl:when>
            <xsl:when test="$codeGenreNature1='SR'">Scientific Reports</xsl:when>
            <xsl:when test="$codeGenreNature1='sr'">Scientific Reports</xsl:when>
            <xsl:when test="$codeGenreNature1='SS'">Science and Society</xsl:when>
            <xsl:when test="$codeGenreNature1='ss'">Science and Society</xsl:when>
            <xsl:when test="$codeGenreNature1='straysfromether'">Strays From the Ether</xsl:when>
            <xsl:when test="$codeGenreNature1='strev'">Structured Review</xsl:when>
            <xsl:when test="$codeGenreNature1='strle'">Star Letter</xsl:when>
            <xsl:when test="$codeGenreNature1='stw'">Structure Watch</xsl:when>
            <xsl:when test="$codeGenreNature1='su'">Summaries</xsl:when>
            <xsl:when test="$codeGenreNature1='summerbooks'">Summer Books</xsl:when>
            <xsl:when test="$codeGenreNature1='swr'">Software Report</xsl:when>
            <xsl:when test="$codeGenreNature1='talk'">Talking point</xsl:when>
            <xsl:when test="$codeGenreNature1='tech'">Technology</xsl:when>
            <xsl:when test="$codeGenreNature1='technofiles'">TechnoFiles</xsl:when>
            <xsl:when test="$codeGenreNature1='telescoptics'">Telescoptics</xsl:when>
            <xsl:when test="$codeGenreNature1='tenv'">The Environment</xsl:when>
            <xsl:when test="$codeGenreNature1='tf'">Technology Feature</xsl:when>
            <xsl:when test="$codeGenreNature1='th'">Technical Highlight</xsl:when>
            <xsl:when test="$codeGenreNature1='thebackyarastronomer'">The Back Yard Astronomer</xsl:when>
            <xsl:when test="$codeGenreNature1='theheavens'">The Heavens</xsl:when>
            <xsl:when test="$codeGenreNature1='thes'">Thesis</xsl:when>
            <xsl:when test="$codeGenreNature1='theservicechemist'">The Service of the Chemist</xsl:when>
            <xsl:when test="$codeGenreNature1='thismo'">This Month</xsl:when>
            <xsl:when test="$codeGenreNature1='thread'">Thread</xsl:when>
            <xsl:when test="$codeGenreNature1='thtr'">Theatre Review</xsl:when>
            <xsl:when test="$codeGenreNature1='tib'">Tools in Brief</xsl:when>
            <xsl:when test="$codeGenreNature1='timeln'">Timeline</xsl:when>
            <xsl:when test="$codeGenreNature1='tlbx'">Toolbox</xsl:when>
            <xsl:when test="$codeGenreNature1='tmat'">Training Matters</xsl:when>
            <xsl:when test="$codeGenreNature1='tmech'">Targets and Mechanisms</xsl:when>
            <xsl:when test="$codeGenreNature1='tn'">Trade News</xsl:when>
            <xsl:when test="$codeGenreNature1='tools'">Tools</xsl:when>
            <xsl:when test="$codeGenreNature1='tr'">Technical Report</xsl:when>
            <xsl:when test="$codeGenreNature1='trialw'">Trial Watch</xsl:when>
            <xsl:when test="$codeGenreNature1='tt'">Techniques and Technology</xsl:when>
            <xsl:when test="$codeGenreNature1='turnp'">Turning Points</xsl:when>
            <xsl:when test="$codeGenreNature1='tut'">Tutorial</xsl:when>
            <xsl:when test="$codeGenreNature1='tvr'">Television Review</xsl:when>
            <xsl:when test="$codeGenreNature1='upfrnt'">Up front</xsl:when>
            <xsl:when test="$codeGenreNature1='vp'">Viewpoint</xsl:when>
            <xsl:when test="$codeGenreNature1='vpt'">View Point</xsl:when>
            <xsl:when test="$codeGenreNature1='vr'">Video Review</xsl:when>
            <xsl:when test="$codeGenreNature1='war'">War</xsl:when>
            <xsl:when test="$codeGenreNature1='wdiag'">What's Your Diagnosis</xsl:when>
            <xsl:when test="$codeGenreNature1='whatsnewphtgrphceqpmnt'">What's New in Photographic Equipment</xsl:when>
            <xsl:when test="$codeGenreNature1='wildlifenotes'">Wild Life Notes</xsl:when>
            <xsl:when test="$codeGenreNature1='worldwideradio'">World-Wide Radio</xsl:when>
            <xsl:when test="$codeGenreNature1='wsrep'">Workshop Report</xsl:when>
            <xsl:when test="$codeGenreNature1='yearinreview'">Year in Review</xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name="codeGenreNature2">
        <xsl:choose>
            <xsl:when test="$codeGenreNature1='adfeat'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='af'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='absd'">abstract</xsl:when>
            <xsl:when test="$codeGenreNature1='adfeat'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='amateurtelescopemaker'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='ampedsoc'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='an'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='ar'">review-article</xsl:when>
            <xsl:when test="$codeGenreNature1='archeology'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='astronomy'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='aviation'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='bc'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='bca'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreNature1='bks'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreNature1='bo'">book-reviews</xsl:when>
            <xsl:when test="$codeGenreNature1='brfnw'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreNature1='case'">case-report</xsl:when>
            <xsl:when test="$codeGenreNature1='casefv'">case-report</xsl:when>
            <xsl:when test="$codeGenreNature1='caser'">case-report</xsl:when>
            <xsl:when test="$codeGenreNature1='categtxt'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='chemistryinindustry'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='clin'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='clinadv'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='clincase'">case-report</xsl:when>
            <xsl:when test="$codeGenreNature1='clincr'">case-report</xsl:when>
            <xsl:when test="$codeGenreNature1='clinfor'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='clinres'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='clintechnq'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='cmeed'">editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='cn'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='cna'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='co'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='collabrv'">review-article</xsl:when>
            <xsl:when test="$codeGenreNature1='comment'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='com'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='compbio'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='conf'">conference</xsl:when>
            <xsl:when test="$codeGenreNature1='cm'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='cr'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='cs'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='cse'">case-report</xsl:when>
            <xsl:when test="$codeGenreNature1='cy'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='dsdv'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='ecr'">conference</xsl:when>
            <xsl:when test="$codeGenreNature1='ED'">Editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='ed'">editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='edfv'">editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='edin'">editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='edurep'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='electronics'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='engineering'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='erq'">editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='erp'">editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='essay'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='ewr'">conference</xsl:when>
            <xsl:when test="$codeGenreNature1='exprv'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='fa'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='fd'">editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='fe'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='forestindustry'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='fundamentalscience'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='gen'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='genetestrv'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='gnintl'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='grow'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='hc'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='health'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='healthscience'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='hh'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='hn'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='hp'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='hrn'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='in'">editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='indp'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='industriesatoms'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='industry'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='invcm'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='invcme'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='inved'">editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='japnf'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='japnw'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='japsn'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='jr'">review-article</xsl:when>
            <xsl:when test="$codeGenreNature1='le'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='lt'">
                <xsl:choose>
                    <xsl:when test="//fm/websumm">research-article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$codeGenreNature1='mabs'">conference</xsl:when>
            <xsl:when test="$codeGenreNature1='medicalscience'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='memrv'">review-article</xsl:when>
            <xsl:when test="$codeGenreNature1='metalsinindustry'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='methods'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='militaryscience'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='minirv'">review-article</xsl:when>
            <xsl:when test="$codeGenreNature1='mr'">conference</xsl:when>
            <xsl:when test="$codeGenreNature1='mt'">conference</xsl:when>
            <xsl:when test="$codeGenreNature1='multr'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='nationaldefense'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='naturalhistory'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='na'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='nb'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='nbr'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='nbri'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='natview'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='neuro'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='newboatandequip'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='nf'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='npedrv'">review-article</xsl:when>
            <xsl:when test="$codeGenreNature1='nw'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='nv'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='nvqa'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='nvf'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='nvfv'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='op'">editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='osa'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='ov'">editorial</xsl:when>
            <xsl:when test="$codeGenreNature1='pa'">conference</xsl:when>
            <xsl:when test="$codeGenreNature1='pe'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='pedr'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='petroleum'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='plastics'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='prhl'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='proceeding'">conference</xsl:when>
            <xsl:when test="$codeGenreNature1='prog'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='prv'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='psychicresearch'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='ra'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='railroadtransportation'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='rep'">case-report</xsl:when>
            <xsl:when test="$codeGenreNature1='reply'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='research'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='rlet'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='rn'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='rnote'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='rr'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='rd'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='rdpub'">brief-communication</xsl:when>
            <xsl:when test="$codeGenreNature1='rcom'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='rhighlts'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='rs'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='rv'">review-article</xsl:when>
            <xsl:when test="$codeGenreNature1='RV'">review-article</xsl:when>
            <xsl:when test="$codeGenreNature1='rvfv'">review-article</xsl:when>
            <xsl:when test="$codeGenreNature1='sc'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='sf'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='SR'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='sr'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='SS'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='ss'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='scienceinindstry'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='scientificresearch'">research-article</xsl:when>
            <xsl:when test="$codeGenreNature1='spar'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='sprep'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='strev'">review-article</xsl:when>
            <xsl:when test="$codeGenreNature1='swr'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='tf'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='th'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='tr'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='tt'">article</xsl:when>
            <xsl:when test="$codeGenreNature1='wsrep'">conference</xsl:when>
            <xsl:when test="$codeGenreNature1='wdiag'">case-report</xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="//article/front/article-meta/kwd-group/kwd[string-length() &gt; 0]">research-article</xsl:when>
                    <xsl:when test="//article/front/article-meta/abstract[string-length() &gt; 0]">article</xsl:when>
                    <xsl:otherwise>other</xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
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
