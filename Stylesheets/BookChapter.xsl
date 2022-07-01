<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns:m="http://www.w3.org/1998/Math/MathML"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" method="xml"/>
    <xsl:variable name="docIssue" select="document($partOfSetXmlPath)"/>
    <xsl:variable name="collectionNames" select="document('CollectionNames.xml')"/>
    <xsl:variable name="currentDoi" select="//book-series-meta/book-id[@pub-id-type='doi']"/>
    <xsl:variable name="currentTitle" select="normalize-space(//book-series-meta/series)"/>
    <!-- todo : abstract niveau supérieur book / series
    todo: issue
    todo: completer book-categories
    todo : publisher depuis $docIssue
    todo : type de publication / type de contenu-->
    <!-- TEI document structure, creation of main header components, front (summary), body, and back -->
    
    <!-- brill-rgrwo -->
    
    <xsl:variable name="titleToDeduceGenre">
        <xsl:value-of select="normalize-space(//book-part[not(body/book-part)]/book-part-meta/title-group/title)"/>
    </xsl:variable>
    <xsl:variable name="doi">
        <xsl:value-of select="//body/book-part/book-part-meta/book-part-id[@pub-id-type = 'doi'] | //book-body/book-part/book-part-meta/book-part-id[@book-part-id-type = 'doi']"/>
    </xsl:variable>
    <xsl:variable name="codeLangTitle">
        <xsl:value-of select="translate(//book-part[not(body/book-part)]/book-part-meta/title-group/title[1]/@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
    </xsl:variable>
    <xsl:variable name="codeLang">
        <xsl:choose>
            <!-- SG : correction langues erronées -->
            <!-- spa -->
            <xsl:when test="$doi='10.1515/9783110650167-004' or $doi='10.1515/9783110551754-031' or $doi='10.1515/9783110211665.8.625' or $doi='10.1515/9783110211665.7.501' or $doi='10.1515/9783110211665.7.515' or $doi='10.1515/9783110211665.8.637' or $doi='10.1515/9783110211665.4.209' or $doi='10.1515/9783110551754-031' or $doi='10.1515/9783110539479-029' or $doi='10.1515/9783110211665.8.601' or $doi='10.1515/9783110211665.9.679' or $doi='10.1515/9783110211665.5.255' or $doi='10.1515/9783110211665.8.591' or $doi='10.1515/9783110211665.10.815' or $doi='10.1515/9783110211665.3.33' or $doi='10.1515/9783110651997-003'">es</xsl:when>
            <!-- fre -->
            <xsl:when test="$doi='10.1515/9781501505249-014' or $doi='10.1515/9783050075259.169' or $doi='10.1515/9783050075259.207' or $doi='10.1515/9783050075259.23' or $doi='10.1515/9783050075259.523' or $doi='10.1515/9783110228830.173' or $doi='10.1515/9783110260779.201' or $doi='10.1515/9783110260779.25' or $doi='10.1515/9783110345186.189' or $doi='10.1515/9783110420876-005' or $doi='10.1515/9783110420876-011' or $doi='10.1515/9783110420876-013' or $doi='10.1515/9783110420876-016' or $doi='10.1515/9783110421323-013' or $doi='10.1515/9783110469851-004' or $doi='10.1515/9783110493108-007' or $doi='10.1515/9783110493108-019' or $doi='10.1515/9783110495959-038' or $doi='10.1515/9783110566987-003' or $doi='10.1515/9783110566987-005' or $doi='10.1515/9783110613759-013' or $doi='10.1515/9783110613759-014' or $doi='10.1515/9783110629705-049' or $doi='10.1515/9783110657111-045' or $doi='10.1515/9783110800807.176' or $doi='10.1515/9783110804348.451' or $doi='10.1515/9783110804348.59' or $doi='10.1515/9783110815139-009' or $doi='10.1515/9783110815139-016' or $doi='10.1515/9783110815146-003' or $doi='10.1515/9783110815146-005' or $doi='10.1515/9783110815146-009' or $doi='10.1515/9783110854725-011' or $doi='10.1515/9783110854725-012' or $doi='10.1515/9783110857115-006' or $doi='10.1515/9783110861532-009' or $doi='10.1515/9783110861532-009' or $doi='10.1515/9783110875973.113' or $doi='10.1515/9783110875973.471' or $doi='10.1515/9783110877274-001' or $doi='10.1515/9783110877274-004' or $doi='10.1515/9783110877274-008' or $doi='10.1515/9783110877274-011' or $doi='10.1515/9783110877274-016' or $doi='10.1515/9783110894073.146' or $doi='10.1515/9783110896022.269' or $doi='10.1515/9783110896022.377' or $doi='10.1515/9783110896022.387' or $doi='10.1515/9783110909760.221' or $doi='10.1515/9783110909760.340' or $doi='10.1515/9783110909760.528' or $doi='10.1515/9783110925869.197' or $doi='10.1515/9783110938210.145' or $doi='10.1515/9783110938210.145' or $doi='10.1515/9783110938210.213' or $doi='10.1515/9783110958614.116' or $doi='10.1515/9783110958614.137' or $doi='10.1515/9783110958614.172' or $doi='10.1515/9783110958614.210' or $doi='10.1515/9783110958614.257' or $doi='10.1515/9783110958614.306' or $doi='10.1515/9783110958614.40' or $doi='10.1515/9783110958614.55' or $doi='10.1515/9783110958614.71' or $doi='10.1515/9783110958638.67' or $doi='10.1515/9783110959758.95' or $doi='10.1515/9783110960082.75' or $doi='10.1515/9783110960082.85' or $doi='10.1515/9783110960556.122' or $doi='10.1515/9783110960556.76' or $doi='10.1515/9783110960556.96' or $doi='10.1515/9783110962406.326' or $doi='10.1515/9783110974812.109' or $doi='10.1515/9783110974812.175' or $doi='10.1515/9783110210378.242' or $doi='10.1515/9783110211665.10.733' or $doi='10.1515/9783110211665.3.53' or $doi='10.1515/9783110211665.3.85' or $doi='10.1515/9783110211665.8.577' or $doi='10.1515/9783110336337-011' or $doi='10.1515/9783110336337-025' or $doi='10.1515/9783110352511-005' or $doi='10.1515/9783110352511-006' or $doi='10.1515/9783110352511-007' or $doi='10.1515/9783110352511-009' or $doi='10.1515/9783110352511-014' or $doi='10.1515/9783110493108-012' or $doi='10.1515/9783110498417-007' or $doi='10.1515/9783110498417-009' or $doi='10.1515/9783110498417-010' or $doi='10.1515/9783110539479-004' or $doi='10.1515/9783110539479-026' or $doi='10.1515/9783110551754-205' or $doi='10.1515/9783110551754-423' or $doi='10.1515/9783110551754-723' or $doi='10.1515/9783110551754-837' or $doi='10.1515/9783110557800-004' or $doi='10.1515/9783110612516-008' or $doi='10.1515/9783110629705-027' or $doi='10.1515/9783110629705-030' or $doi='10.1515/9783110629705-031' or $doi='10.1515/9783110629705-032' or $doi='10.1515/9783110638332-006' or $doi='10.1515/9783110638332-015' or $doi='10.1515/9783110809008-002' or $doi='10.1515/9783110809008-011' or $doi='10.1515/9783110809008-012' or $doi='10.1515/9783110809008-013' or $doi='10.1515/9783110815139-005' or $doi='10.1515/9783110815146-011' or $doi='10.1515/9783110851403-017' or $doi='10.1515/9783110852714-016' or $doi='10.1515/9783110854725-018' or $doi='10.1515/9783110857023-014' or $doi='10.1515/9783110857115-002' or $doi='10.1515/9783110857115-003' or $doi='10.1515/9783110857115-004' or $doi='10.1515/9783110857115-011' or $doi='10.1515/9783110857115-015' or $doi='10.1515/9783110857115-017' or $doi='10.1515/9783110857115-018' or $doi='10.1515/9783110857115-019' or $doi='10.1515/9783110857115-021' or $doi='10.1515/9783110861532-011' or $doi='10.1515/9783110861563-002' or $doi='10.1515/9783110861563-007' or $doi='10.1515/9783110861563-017' or $doi='10.1515/9783110862942-006' or $doi='10.1515/9783110864298-002' or $doi='10.1515/9783110864298-010' or $doi='10.1515/9783110872880-012' or $doi='10.1515/9783110875393-008' or $doi='10.1515/9783110875393-009' or $doi='10.1515/9783110875393-010' or $doi='10.1515/9783110875393-014' or $doi='10.1515/9783110875720-008' or $doi='10.1515/9783110875720-009' or $doi='10.1515/9783110875720-010' or $doi='10.1515/9783110877274-003' or $doi='10.1515/9783110877274-009' or $doi='10.1515/9783110877274-010' or $doi='10.1515/9783110877274-013' or $doi='10.1515/9783110877274-017' or $doi='10.1515/9783110878912-007' or $doi='10.1515/9783110878912-010' or $doi='10.1515/9783110878912-012' or $doi='10.1515/9783110883732-006' or $doi='10.1515/9783110883732-007' or $doi='10.1515/9783110887877-012' or $doi='10.1515/9783110887877-018' or $doi='10.1515/9783110887877-019' or $doi='10.1515/9783110918229.209' or $doi='10.1515/9783110923865.259'">fr</xsl:when>
            <!-- ita -->
            <xsl:when test="$doi='10.1515/9783110489972-002' or $doi='10.1515/9781501505249-005' or $doi='10.1515/9783050073910-004' or $doi='10.1515/9783050075259.295' or $doi='10.1515/9783050075259.69' or $doi='10.1515/9783050088914-006' or $doi='10.1515/9783110263916.224' or $doi='10.1515/9783110263916.586' or $doi='10.1515/9783110354348-012' or $doi='10.1515/9783110354348-019' or $doi='10.1515/9783110354348-023' or $doi='10.1515/9783110354348-028' or $doi='10.1515/9783110354348-030' or $doi='10.1515/9783110354348-031' or $doi='10.1515/9783110420876-006' or $doi='10.1515/9783110420876-022' or $doi='10.1515/9783110448009-019' or $doi='10.1515/9783110642261-004' or $doi='10.1515/9783110650167-007' or $doi='10.1515/9783110650167-014' or $doi='10.1515/9783110813579-006' or $doi='10.1515/9783110813579-006' or $doi='10.1515/9783110815139-010' or $doi='10.1515/9783110851403-010' or $doi='10.1515/9783110851403-010' or $doi='10.1515/9783110852714-012' or $doi='10.1515/9783110854725-013' or $doi='10.1515/9783110854725-020' or $doi='10.1515/9783110857023-009' or $doi='10.1515/9783110857023-015' or $doi='10.1515/9783110857115-012' or $doi='10.1515/9783110861563-015' or $doi='10.1515/9783110875393-011' or $doi='10.1515/9783110875393-011' or $doi='10.1515/9783110878912-014' or $doi='10.1515/9783110878912-014' or $doi='10.1515/9783110883732-003' or $doi='10.1515/9783110883732-004' or $doi='10.1515/9783110883732-022' or $doi='10.1515/9783110898927.287' or $doi='10.1515/9783110898927.3' or $doi='10.1515/9783110898927.83' or $doi='10.1515/9783110909760.204' or $doi='10.1515/9783110909760.257' or $doi='10.1515/9783110910230.352' or $doi='10.1515/9783110912104.21' or $doi='10.1515/9783110925869.148' or $doi='10.1515/9783110933611.313' or $doi='10.1515/9783110934793.101' or $doi='10.1515/9783110934793.165' or $doi='10.1515/9783110938715.335' or $doi='10.1515/9783110943085.127' or $doi='10.1515/9783110945690.125' or $doi='10.1515/9783110952896.123' or $doi='10.1515/9783110952896.129' or $doi='10.1515/9783110952896.139' or $doi='10.1515/9783110952896.153' or $doi='10.1515/9783110952896.213' or $doi='10.1515/9783110952896.223' or $doi='10.1515/9783110952896.253' or $doi='10.1515/9783110952896.63' or $doi='10.1515/9783110952896.97' or $doi='10.1515/9783110959758.145' or $doi='10.1515/9783110959758.15' or $doi='10.1515/9783110959758.173' or $doi='10.1515/9783110959758.257' or $doi='10.1515/9783110959758.281' or $doi='10.1515/9783110959758.95' or $doi='10.1515/9783110211665.7.461' or $doi='10.1515/9783110222371.125' or $doi='10.1515/9783110311945.123' or $doi='10.1515/9783110336337-020' or $doi='10.1515/9783110336337-027' or $doi='10.1515/9783110352511-009a' or $doi='10.1515/9783110431896-016' or $doi='10.1515/9783110539479-017' or $doi='10.1515/9783110539479-023' or $doi='10.1515/9783110551754-069' or $doi='10.1515/9783110551754-089' or $doi='10.1515/9783110551754-167' or $doi='10.1515/9783110551754-193' or $doi='10.1515/9783110551754-357' or $doi='10.1515/9783110551754-395' or $doi='10.1515/9783110551754-469' or $doi='10.1515/9783110551754-503' or $doi='10.1515/9783110551754-535' or $doi='10.1515/9783110551754-637' or $doi='10.1515/9783110551754-747' or $doi='10.1515/9783110551754-757' or $doi='10.1515/9783110551754-823' or $doi='10.1515/9783110551754-847' or $doi='10.1515/9783110612516-005' or $doi='10.1515/9783110617993-007' or $doi='10.1515/9783110617993-007' or $doi='10.1515/9783110638332-019' or $doi='10.1515/9783110809008-006' or $doi='10.1515/9783110815139-002' or $doi='10.1515/9783110815139-018' or $doi='10.1515/9783110815139-019' or $doi='10.1515/9783110815146-010' or $doi='10.1515/9783110851403-003' or $doi='10.1515/9783110851403-008' or $doi='10.1515/9783110851403-020' or $doi='10.1515/9783110854725-002' or $doi='10.1515/9783110857023-002' or $doi='10.1515/9783110857023-003' or $doi='10.1515/9783110857023-013' or $doi='10.1515/9783110861532-016' or $doi='10.1515/9783110861563-003' or $doi='10.1515/9783110861563-013' or $doi='10.1515/9783110864298-003' or $doi='10.1515/9783110864298-005' or $doi='10.1515/9783110864298-006' or $doi='10.1515/9783110872880-003' or $doi='10.1515/9783110872880-005' or $doi='10.1515/9783110872880-006' or $doi='10.1515/9783110875393-013' or $doi='10.1515/9783110875393-017' or $doi='10.1515/9783110875393-019' or $doi='10.1515/9783110875393-022' or $doi='10.1515/9783110875393-025' or $doi='10.1515/9783110875720-014' or $doi='10.1515/9783110878554-011' or $doi='10.1515/9783110878912-020' or $doi='10.1515/9783110878912-021' or $doi='10.1515/9783110883732-015' or $doi='10.1515/9783110883732-016' or $doi='10.1515/9783110883732-023' or $doi='10.1515/9783110887877-011' or $doi='10.1515/9783110887877-013' or $doi='10.1515/9783110887877-016' or $doi='10.1515/9783110887877-021' or $doi='10.1515/9783110918229.308' or $doi='10.1515/9783110942507.159'">it</xsl:when>
            <!-- ger -->
            <xsl:when test="$doi='10.1515/9783110473377-003' or $doi='10.1515/9783110267501-030' or $doi='10.1515/9783110267501-043' or $doi='10.1515/9783110336337-028' or $doi='10.1515/9783110336337-030' or $doi='10.1515/9783110347166.1.281' or $doi='10.1515/9783110447378-007' or $doi='10.1515/9783110473377-002' or $doi='10.1515/9783110473377-004' or $doi='10.1515/9783110473377-007' or $doi='10.1515/9783110473377-009' or $doi='10.1515/9783110473377-011' or $doi='10.1515/9783110473377-013' or $doi='10.1515/9783110473377-017' or $doi='10.1515/9783110498417-002' or $doi='10.1515/9783110516951-010' or $doi='10.1515/9783110594065-006' or $doi='10.1515/9783110594065-007' or $doi='10.1515/9783110594065-009' or $doi='10.1515/9783110594065-012' or $doi='10.1515/9783110594065-013' or $doi='10.1515/9783110594065-014' or $doi='10.1515/9783110594065-018' or $doi='10.1515/9783110594065-019' or $doi='10.1515/9783110594065-020' or $doi='10.1515/9783110638332-005' or $doi='10.1515/9783110638332-009' or $doi='10.1515/9783110638332-010' or $doi='10.1515/9783110638332-011' or $doi='10.1515/9783110638332-016' or $doi='10.1515/9783110942507.107' or $doi='10.1515/9783110942507.185' or $doi='10.1515/9783110942507.211' or $doi='10.1515/9783110942507.29' or $doi='10.1515/9783110963724.1' or $doi='10.1515/9783110638332-022'">de</xsl:when>
            <!-- eng -->
            <xsl:when test="$doi='10.1515/9783110944495.ix' or $doi='10.1515/9783110958614.370' or $doi='10.1515/9783050075259.221' or $doi='10.1515/9781501503221-009' or $doi='10.1515/9781501505249-006' or $doi='10.1515/9781501505249-008' or $doi='10.1515/9781501505249-012' or $doi='10.1515/9781501505249-016' or $doi='10.1515/9781501505249-018' or $doi='10.1515/9783050075259.643' or $doi='10.1515/9783050088914-010' or $doi='10.1515/9783050094717.225' or $doi='10.1515/9783110210507.245' or $doi='10.1515/9783110228830.126' or $doi='10.1515/9783110260779.223' or $doi='10.1515/9783110260779.331' or $doi='10.1515/9783110260779.455' or $doi='10.1515/9783110311945.221' or $doi='10.1515/9783110311945.235' or $doi='10.1515/9783110331417.39' or $doi='10.1515/9783110354348-004' or $doi='10.1515/9783110354348-020' or $doi='10.1515/9783110354348-032' or $doi='10.1515/9783110354348-036' or $doi='10.1515/9783110404951.263' or $doi='10.1515/9783110420876-003' or $doi='10.1515/9783110420876-015' or $doi='10.1515/9783110421323-006' or $doi='10.1515/9783110421323-012' or $doi='10.1515/9783110421323-015' or $doi='10.1515/9783110421323-016' or $doi='10.1515/9783110421323-023' or $doi='10.1515/9783110431384-003' or $doi='10.1515/9783110458213-005' or $doi='10.1515/9783110469851-006' or $doi='10.1515/9783110469851-010' or $doi='10.1515/9783110471502-003' or $doi='10.1515/9783110471502-004' or $doi='10.1515/9783110471502-012' or $doi='10.1515/9783110471502-014' or $doi='10.1515/9783110473117-004' or $doi='10.1515/9783110473117-012' or $doi='10.1515/9783110473117-015' or $doi='10.1515/9783110473292-003' or $doi='10.1515/9783110473292-006' or $doi='10.1515/9783110493108-006' or $doi='10.1515/9783110493108-011' or $doi='10.1515/9783110493108-016' or $doi='10.1515/9783110499261-005' or $doi='10.1515/9783110517569-006' or $doi='10.1515/9783110517569-009' or $doi='10.1515/9783110532968-010' or $doi='10.1515/9783110533804-007' or $doi='10.1515/9783110533804-009' or $doi='10.1515/9783110533804-014' or $doi='10.1515/9783110533804-015' or $doi='10.1515/9783110566987-009' or $doi='10.1515/9783110569995-002' or $doi='10.1515/9783110571820-006' or $doi='10.1515/9783110571820-009' or $doi='10.1515/9783110571820-010' or $doi='10.1515/9783110571820-011' or $doi='10.1515/9783110571820-012' or $doi='10.1515/9783110571820-013' or $doi='10.1515/9783110593600-008' or $doi='10.1515/9783110593600-009' or $doi='10.1515/9783110612516-007' or $doi='10.1515/9783110612516-010' or $doi='10.1515/9783110613759-004' or $doi='10.1515/9783110629040-004' or $doi='10.1515/9783110629040-005' or $doi='10.1515/9783110629040-013' or $doi='10.1515/9783110629705-012' or $doi='10.1515/9783110629705-048' or $doi='10.1515/9783110629705-050' or $doi='10.1515/9783110641042-016' or $doi='10.1515/9783110643503-014' or $doi='10.1515/9783110643503-016' or $doi='10.1515/9783110643503-021' or $doi='10.1515/9783110657111-040' or $doi='10.1515/9783110657111-041' or $doi='10.1515/9783110664836-004' or $doi='10.1515/9783110664836-005' or $doi='10.1515/9783110664836-010' or $doi='10.1515/9783110664836-012' or $doi='10.1515/9783110664836-015' or $doi='10.1515/9783110664836-018' or $doi='10.1515/9783110664836-022' or $doi='10.1515/9783110800319.248' or $doi='10.1515/9783110809008-016' or $doi='10.1515/9783110813579-009' or $doi='10.1515/9783110814422.1' or $doi='10.1515/9783110814422.223' or $doi='10.1515/9783110815139-015' or $doi='10.1515/9783110815146-001' or $doi='10.1515/9783110821901.117' or $doi='10.1515/9783110821901.150' or $doi='10.1515/9783110821901.186' or $doi='10.1515/9783110821901.197' or $doi='10.1515/9783110821901.253' or $doi='10.1515/9783110821901.434' or $doi='10.1515/9783110821901.448' or $doi='10.1515/9783110821901.508' or $doi='10.1515/9783110821901.592' or $doi='10.1515/9783110821901.601' or $doi='10.1515/9783110821901.629' or $doi='10.1515/9783110821901.639' or $doi='10.1515/9783110821901.647' or $doi='10.1515/9783110821901.660' or $doi='10.1515/9783110822823.149' or $doi='10.1515/9783110822823.167' or $doi='10.1515/9783110822823.173' or $doi='10.1515/9783110822823.25' or $doi='10.1515/9783110823554.169' or $doi='10.1515/9783110850444.1' or $doi='10.1515/9783110850444.116' or $doi='10.1515/9783110850444.411' or $doi='10.1515/9783110851397-012' or $doi='10.1515/9783110852714-017' or $doi='10.1515/9783110854725-005' or $doi='10.1515/9783110854725-017' or $doi='10.1515/9783110854725-019' or $doi='10.1515/9783110854725-023' or $doi='10.1515/9783110857023-010' or $doi='10.1515/9783110861532-008' or $doi='10.1515/9783110861563-011' or $doi='10.1515/9783110861563-019' or $doi='10.1515/9783110861563-021' or $doi='10.1515/9783110861563-023' or $doi='10.1515/9783110862768-009' or $doi='10.1515/9783110872880-016' or $doi='10.1515/9783110872880-017' or $doi='10.1515/9783110875393-002' or $doi='10.1515/9783110875393-003' or $doi='10.1515/9783110875393-016' or $doi='10.1515/9783110875720-013' or $doi='10.1515/9783110875973.210' or $doi='10.1515/9783110875973.263' or $doi='10.1515/9783110875973.352' or $doi='10.1515/9783110875973.620' or $doi='10.1515/9783110877274-007' or $doi='10.1515/9783110877366.128' or $doi='10.1515/9783110878554-012' or $doi='10.1515/9783110878912-008' or $doi='10.1515/9783110878912-013' or $doi='10.1515/9783110878912-019' or $doi='10.1515/9783110883732-010' or $doi='10.1515/9783110883732-014' or $doi='10.1515/9783110894073.100' or $doi='10.1515/9783110894073.418' or $doi='10.1515/9783110894073.454' or $doi='10.1515/9783110894073.496' or $doi='10.1515/9783110894073.496' or $doi='10.1515/9783110894073.553' or $doi='10.1515/9783110894073.581' or $doi='10.1515/9783110894073.689' or $doi='10.1515/9783110894073.9' or $doi='10.1515/9783110900903.162' or $doi='10.1515/9783110900903.345' or $doi='10.1515/9783110900903.414' or $doi='10.1515/9783110900903.53' or $doi='10.1515/9783110907698.103' or $doi='10.1515/9783110910193.12' or $doi='10.1515/9783110910964.309' or $doi='10.1515/9783110911473.308' or $doi='10.1515/9783110911473.57' or $doi='10.1515/9783110911473.659' or $doi='10.1515/9783110911473.76' or $doi='10.1515/9783110912104.155' or $doi='10.1515/9783110914603.163' or $doi='10.1515/9783110914603.38' or $doi='10.1515/9783110914603.56' or $doi='10.1515/9783110918229.194' or $doi='10.1515/9783110922981.209' or $doi='10.1515/9783110923865.13' or $doi='10.1515/9783110923865.277' or $doi='10.1515/9783110923865.357' or $doi='10.1515/9783110923865.419' or $doi='10.1515/9783110925869.230' or $doi='10.1515/9783110925869.66' or $doi='10.1515/9783110926361.151' or $doi='10.1515/9783110926361.211' or $doi='10.1515/9783110926378.173' or $doi='10.1515/9783110926378.335' or $doi='10.1515/9783110930160.109' or $doi='10.1515/9783110930160.309' or $doi='10.1515/9783110930160.331' or $doi='10.1515/9783110933611.26' or $doi='10.1515/9783110934601.351' or $doi='10.1515/9783110934793.225' or $doi='10.1515/9783110938210.11' or $doi='10.1515/9783110938210.185' or $doi='10.1515/9783110943085.95' or $doi='10.1515/9783110943726.355' or $doi='10.1515/9783110943740.95' or $doi='10.1515/9783110945690.225' or $doi='10.1515/9783110950533.67' or $doi='10.1515/9783110952926.137' or $doi='10.1515/9783110952926.332' or $doi='10.1515/9783110957013.165' or $doi='10.1515/9783110957235.1' or $doi='10.1515/9783110958614.1' or $doi='10.1515/9783110958614.191' or $doi='10.1515/9783110958614.200' or $doi='10.1515/9783110958614.264' or $doi='10.1515/9783110958614.329' or $doi='10.1515/9783110958614.342' or $doi='10.1515/9783110958614.354' or $doi='10.1515/9783110958614.46' or $doi='10.1515/9783110958638.479' or $doi='10.1515/9783110960082.131' or $doi='10.1515/9783110960082.27' or $doi='10.1515/9783110960082.313' or $doi='10.1515/9783110960082.51' or $doi='10.1515/9783110960082.63' or $doi='10.1515/9783110961911.247' or $doi='10.1515/9783110962406.9' or $doi='10.1515/9783110965353.247' or $doi='10.1515/9783110965353.33' or $doi='10.1515/9783110974829-021' or $doi='10.1515/9783110210507.258' or $doi='10.1515/9783110210507.284' or $doi='10.1515/9783110447378-013' or $doi='10.1515/9783110448009-004' or $doi='10.1515/9783110448009-008' or $doi='10.1515/9783110448009-013' or $doi='10.1515/9783110448009-014' or $doi='10.1515/9783110448009-016' or $doi='10.1515/9783110448009-020' or $doi='10.1515/9783110448009-021' or $doi='10.1515/9783110449006-005' or $doi='10.1515/9783110449006-013' or $doi='10.1515/9783110486193-007' or $doi='10.1515/9783110486193-011' or $doi='10.1515/9783110486193-012' or $doi='10.1515/9783110493108-010' or $doi='10.1515/9783110493108-013' or $doi='10.1515/9783110516340-009' or $doi='10.1515/9783110516340-010' or $doi='10.1515/9783110516340-013' or $doi='10.1515/9783110521689-002' or $doi='10.1515/9783110521689-007' or $doi='10.1515/9783110521689-011' or $doi='10.1515/9783110521689-012' or $doi='10.1515/9783110521689-017' or $doi='10.1515/9783110521689-018' or $doi='10.1515/9783110612516-003' or $doi='10.1515/9783110612516-009' or $doi='10.1515/9783110612516-013' or $doi='10.1515/9783110612516-018' or $doi='10.1515/9783110612516-023' or $doi='10.1515/9783110612516-024' or $doi='10.1515/9783110612516-026' or $doi='10.1515/9783110612516-028' or $doi='10.1515/9783110612516-031' or $doi='10.1515/9783110629705-014' or $doi='10.1515/9783110629705-026' or $doi='10.1515/9783110629705-036' or $doi='10.1515/9783110629705-037' or $doi='10.1515/9783110629705-038' or $doi='10.1515/9783110629705-041' or $doi='10.1515/9783110629705-061' or $doi='10.1515/9783110651997-009' or $doi='10.1515/9783110652543-002' or $doi='10.1515/9783110809008-009' or $doi='10.1515/9783110809008-010' or $doi='10.1515/9783110809008-015' or $doi='10.1515/9783110809008-017' or $doi='10.1515/9783110809008-018' or $doi='10.1515/9783110809008-019' or $doi='10.1515/9783110809008-020' or $doi='10.1515/9783110813579-001' or $doi='10.1515/9783110813579-005' or $doi='10.1515/9783110813579-008' or $doi='10.1515/9783110813579-010' or $doi='10.1515/9783110813579-012' or $doi='10.1515/9783110815139-001' or $doi='10.1515/9783110815139-007' or $doi='10.1515/9783110815139-008' or $doi='10.1515/9783110815139-013' or $doi='10.1515/9783110815139-014' or $doi='10.1515/9783110815146-002' or $doi='10.1515/9783110815146-007' or $doi='10.1515/9783110815146-008' or $doi='10.1515/9783110815146-014' or $doi='10.1515/9783110815146-015' or $doi='10.1515/9783110815146-016' or $doi='10.1515/9783110815146-019' or $doi='10.1515/9783110815146-020' or $doi='10.1515/9783110821901.539' or $doi='10.1515/9783110851397-011' or $doi='10.1515/9783110851397-013' or $doi='10.1515/9783110851403-005' or $doi='10.1515/9783110851403-007' or $doi='10.1515/9783110851403-009' or $doi='10.1515/9783110851403-014' or $doi='10.1515/9783110851403-015' or $doi='10.1515/9783110851403-016' or $doi='10.1515/9783110851403-018' or $doi='10.1515/9783110851403-019' or $doi='10.1515/9783110851403-023' or $doi='10.1515/9783110852714-004' or $doi='10.1515/9783110852714-005' or $doi='10.1515/9783110852714-006' or $doi='10.1515/9783110852714-007' or $doi='10.1515/9783110852714-008' or $doi='10.1515/9783110852714-009' or $doi='10.1515/9783110852714-011' or $doi='10.1515/9783110852714-013' or $doi='10.1515/9783110854725-003' or $doi='10.1515/9783110854725-004' or $doi='10.1515/9783110854725-007' or $doi='10.1515/9783110854725-008' or $doi='10.1515/9783110854725-010' or $doi='10.1515/9783110854725-014' or $doi='10.1515/9783110854725-015' or $doi='10.1515/9783110854725-021' or $doi='10.1515/9783110854725-022' or $doi='10.1515/9783110854725-025' or $doi='10.1515/9783110857023-004' or $doi='10.1515/9783110857023-007' or $doi='10.1515/9783110857023-012' or $doi='10.1515/9783110857115-007' or $doi='10.1515/9783110857115-009' or $doi='10.1515/9783110857115-010' or $doi='10.1515/9783110857115-016' or $doi='10.1515/9783110861532-005' or $doi='10.1515/9783110861532-006' or $doi='10.1515/9783110861532-010' or $doi='10.1515/9783110861532-014' or $doi='10.1515/9783110861563-006' or $doi='10.1515/9783110861563-018' or $doi='10.1515/9783110861563-022' or $doi='10.1515/9783110862768-007' or $doi='10.1515/9783110862768-010' or $doi='10.1515/9783110862768-011' or $doi='10.1515/9783110862942-002' or $doi='10.1515/9783110862942-003' or $doi='10.1515/9783110862942-004' or $doi='10.1515/9783110862942-011' or $doi='10.1515/9783110864298-004' or $doi='10.1515/9783110864298-007' or $doi='10.1515/9783110864298-009' or $doi='10.1515/9783110872880-009' or $doi='10.1515/9783110872880-010' or $doi='10.1515/9783110872880-015' or $doi='10.1515/9783110875393-012' or $doi='10.1515/9783110875393-015' or $doi='10.1515/9783110875393-018' or $doi='10.1515/9783110875720-003' or $doi='10.1515/9783110875720-005' or $doi='10.1515/9783110875720-006' or $doi='10.1515/9783110875720-011' or $doi='10.1515/9783110877274-005' or $doi='10.1515/9783110877274-006' or $doi='10.1515/9783110878554-003' or $doi='10.1515/9783110878912-002' or $doi='10.1515/9783110878912-003' or $doi='10.1515/9783110878912-005' or $doi='10.1515/9783110878912-006' or $doi='10.1515/9783110878912-018' or $doi='10.1515/9783110883732-002' or $doi='10.1515/9783110883732-005' or $doi='10.1515/9783110883732-009' or $doi='10.1515/9783110883732-011' or $doi='10.1515/9783110883732-012' or $doi='10.1515/9783110883732-020' or $doi='10.1515/9783110883732-021' or $doi='10.1515/9783110886641.513' or $doi='10.1515/9783110887877-004' or $doi='10.1515/9783110887877-006' or $doi='10.1515/9783110918229.20' or $doi='10.1515/9783110918229.218' or $doi='10.1515/9783110923865.1' or $doi='10.1515/9783110923865.223' or $doi='10.1515/9783110923865.429' or $doi='10.1515/9783110923865.463' or $doi='10.1515/9783110923865.69'">en</xsl:when>
            <xsl:when test="$codeLangTitle='aar'">aa</xsl:when>
            <xsl:when test="$codeLangTitle='abk'">ab</xsl:when>
            <xsl:when test="$codeLangTitle='afr'">af</xsl:when>
            <xsl:when test="$codeLangTitle='aka'">ak</xsl:when>
            <xsl:when test="$codeLangTitle='alb'">sq</xsl:when>
            <xsl:when test="$codeLangTitle='amh'">am</xsl:when>
            <xsl:when test="$codeLangTitle='ara'">ar</xsl:when>
            <xsl:when test="$codeLangTitle='arg'">an</xsl:when>
            <xsl:when test="$codeLangTitle='hye'">hy</xsl:when>
            <xsl:when test="$codeLangTitle='arm'">hy</xsl:when>
            <xsl:when test="$codeLangTitle='asm'">as</xsl:when>
            <xsl:when test="$codeLangTitle='ava'">av</xsl:when>
            <xsl:when test="$codeLangTitle='ave'">ae</xsl:when>
            <xsl:when test="$codeLangTitle='aym'">ay</xsl:when>
            <xsl:when test="$codeLangTitle='aze'">az</xsl:when>
            <xsl:when test="$codeLangTitle='bak'">ba</xsl:when>
            <xsl:when test="$codeLangTitle='bam'">bm</xsl:when>
            <xsl:when test="$codeLangTitle='eus'">eu</xsl:when>
            <xsl:when test="$codeLangTitle='baq'">eu</xsl:when>
            <xsl:when test="$codeLangTitle='bel'">be</xsl:when>
            <xsl:when test="$codeLangTitle='ben'">bn</xsl:when>
            <xsl:when test="$codeLangTitle='bih'">bh</xsl:when>
            <xsl:when test="$codeLangTitle='bis'">bi</xsl:when>
            <xsl:when test="$codeLangTitle='bod'">bo</xsl:when>
            <xsl:when test="$codeLangTitle='bos'">bs</xsl:when>
            <xsl:when test="$codeLangTitle='bre'">br</xsl:when>
            <xsl:when test="$codeLangTitle='bul'">bg</xsl:when>
            <xsl:when test="$codeLangTitle='bur'">my</xsl:when>
            <xsl:when test="$codeLangTitle='mya'">my</xsl:when>
            <xsl:when test="$codeLangTitle='cat'">ca</xsl:when>
            <xsl:when test="$codeLangTitle='ces'">cs</xsl:when>
            <xsl:when test="$codeLangTitle='cha'">ch</xsl:when>
            <xsl:when test="$codeLangTitle='che'">ce</xsl:when>
            <xsl:when test="$codeLangTitle='chi'">zh</xsl:when>
            <xsl:when test="$codeLangTitle='chu'">cu</xsl:when>
            <xsl:when test="$codeLangTitle='chv'">cv</xsl:when>
            <xsl:when test="$codeLangTitle='cor'">kw</xsl:when>
            <xsl:when test="$codeLangTitle='cos'">co</xsl:when>
            <xsl:when test="$codeLangTitle='cre'">cr</xsl:when>
            <xsl:when test="$codeLangTitle='cym'">cy</xsl:when>
            <xsl:when test="$codeLangTitle='cze'">cs</xsl:when>
            <xsl:when test="$codeLangTitle='dan'">da</xsl:when>
            <xsl:when test="$codeLangTitle='deu'">de</xsl:when>
            <xsl:when test="$codeLangTitle='div'">dv</xsl:when>
            <xsl:when test="$codeLangTitle='dut'">nl</xsl:when>
            <xsl:when test="$codeLangTitle='nld'">nl</xsl:when>
            <xsl:when test="$codeLangTitle='dzo'">dz</xsl:when>
            <xsl:when test="$codeLangTitle='eng'">en</xsl:when>
            <xsl:when test="$codeLangTitle='epo'">eo</xsl:when>
            <xsl:when test="$codeLangTitle='est'">et</xsl:when>
            <xsl:when test="$codeLangTitle='ewe'">ee</xsl:when>
            <xsl:when test="$codeLangTitle='fao'">fo</xsl:when>
            <xsl:when test="$codeLangTitle='fij'">fj</xsl:when>
            <xsl:when test="$codeLangTitle='fin'">fi</xsl:when>
            <xsl:when test="$codeLangTitle='fre'">fr</xsl:when>
            <xsl:when test="$codeLangTitle='fra'">fr</xsl:when>
            <xsl:when test="$codeLangTitle='fry'">fy</xsl:when>
            <xsl:when test="$codeLangTitle='ful'">ff</xsl:when>
            <xsl:when test="$codeLangTitle='geo'">ka</xsl:when>
            <xsl:when test="$codeLangTitle='kat'">ka</xsl:when>
            <xsl:when test="$codeLangTitle='ger'">de</xsl:when>
            <xsl:when test="$codeLangTitle='gla'">gd</xsl:when>
            <xsl:when test="$codeLangTitle='gle'">ga</xsl:when>
            <xsl:when test="$codeLangTitle='glg'">gl</xsl:when>
            <xsl:when test="$codeLangTitle='glv'">gv</xsl:when>
            <xsl:when test="$codeLangTitle='gre'">el</xsl:when>
            <xsl:when test="$codeLangTitle='ell'">el</xsl:when>
            <xsl:when test="$codeLangTitle='grn'">gn</xsl:when>
            <xsl:when test="$codeLangTitle='guj'">gu</xsl:when>
            <xsl:when test="$codeLangTitle='hat'">ht</xsl:when>
            <xsl:when test="$codeLangTitle='hau'">ha</xsl:when>
            <xsl:when test="$codeLangTitle='heb'">he</xsl:when>
            <xsl:when test="$codeLangTitle='her'">hz</xsl:when>
            <xsl:when test="$codeLangTitle='hin'">hi</xsl:when>
            <xsl:when test="$codeLangTitle='hmo'">ho</xsl:when>
            <xsl:when test="$codeLangTitle='hrv'">hr</xsl:when>
            <xsl:when test="$codeLangTitle='scr'">hr</xsl:when>
            <xsl:when test="$codeLangTitle='hun'">hu</xsl:when>
            <xsl:when test="$codeLangTitle='ibo'">ig</xsl:when>
            <xsl:when test="$codeLangTitle='ice'">is</xsl:when>
            <xsl:when test="$codeLangTitle='isl'">is</xsl:when>
            <xsl:when test="$codeLangTitle='ido'">io</xsl:when>
            <xsl:when test="$codeLangTitle='iii'">ii</xsl:when>
            <xsl:when test="$codeLangTitle='iku'">iu</xsl:when>
            <xsl:when test="$codeLangTitle='ile'">ie</xsl:when>
            <xsl:when test="$codeLangTitle='ina'">ia</xsl:when>
            <xsl:when test="$codeLangTitle='ind'">id</xsl:when>
            <xsl:when test="$codeLangTitle='ipk'">ik</xsl:when>
            <xsl:when test="$codeLangTitle='ita'">it</xsl:when>
            <xsl:when test="$codeLangTitle='jav'">jv</xsl:when>
            <xsl:when test="$codeLangTitle='jpn'">ja</xsl:when>
            <xsl:when test="$codeLangTitle='kal'">kl</xsl:when>
            <xsl:when test="$codeLangTitle='kan'">kn</xsl:when>
            <xsl:when test="$codeLangTitle='kas'">ks</xsl:when>
            <xsl:when test="$codeLangTitle='kau'">kr</xsl:when>
            <xsl:when test="$codeLangTitle='kaz'">kk</xsl:when>
            <xsl:when test="$codeLangTitle='khm'">km</xsl:when>
            <xsl:when test="$codeLangTitle='kik'">ki</xsl:when>
            <xsl:when test="$codeLangTitle='kin'">rw</xsl:when>
            <xsl:when test="$codeLangTitle='kir'">ky</xsl:when>
            <xsl:when test="$codeLangTitle='kom'">kv</xsl:when>
            <xsl:when test="$codeLangTitle='kon'">kg</xsl:when>
            <xsl:when test="$codeLangTitle='kor'">ko</xsl:when>
            <xsl:when test="$codeLangTitle='kua'">kj</xsl:when>
            <xsl:when test="$codeLangTitle='kur'">ku</xsl:when>
            <xsl:when test="$codeLangTitle='lao'">lo</xsl:when>
            <xsl:when test="$codeLangTitle='lat'">la</xsl:when>
            <xsl:when test="$codeLangTitle='lav'">lv</xsl:when>
            <xsl:when test="$codeLangTitle='lim'">li</xsl:when>
            <xsl:when test="$codeLangTitle='lin'">ln</xsl:when>
            <xsl:when test="$codeLangTitle='lit'">lt</xsl:when>
            <xsl:when test="$codeLangTitle='ltz'">lb</xsl:when>
            <xsl:when test="$codeLangTitle='lub'">lu</xsl:when>
            <xsl:when test="$codeLangTitle='lug'">lg</xsl:when>
            <xsl:when test="$codeLangTitle='mac'">mk</xsl:when>
            <xsl:when test="$codeLangTitle='mkd'">mk</xsl:when>
            <xsl:when test="$codeLangTitle='mah'">mh</xsl:when>
            <xsl:when test="$codeLangTitle='mal'">ml</xsl:when>
            <!-- etude degruyter code "mis" = allemand -->
            <xsl:when test="$codeLangTitle='mis'">de</xsl:when>
            <xsl:when test="$codeLangTitle='mri'">mi</xsl:when>
            <xsl:when test="$codeLangTitle='mao'">mi</xsl:when>
            <xsl:when test="$codeLangTitle='mar'">mr</xsl:when>
            <xsl:when test="$codeLangTitle='may'">ms</xsl:when>
            <xsl:when test="$codeLangTitle='msa'">ms</xsl:when>
            <xsl:when test="$codeLangTitle='mlg'">mg</xsl:when>
            <xsl:when test="$codeLangTitle='mlt'">mt</xsl:when>
            <xsl:when test="$codeLangTitle='mon'">mn</xsl:when>
            <xsl:when test="$codeLangTitle='nau'">na</xsl:when>
            <xsl:when test="$codeLangTitle='nav'">nv</xsl:when>
            <xsl:when test="$codeLangTitle='nbl'">nr</xsl:when>
            <xsl:when test="$codeLangTitle='nde'">nd</xsl:when>
            <xsl:when test="$codeLangTitle='ndo'">ng</xsl:when>
            <xsl:when test="$codeLangTitle='nep'">ne</xsl:when>
            <xsl:when test="$codeLangTitle='nno'">nn</xsl:when>
            <xsl:when test="$codeLangTitle='nob'">nb</xsl:when>
            <xsl:when test="$codeLangTitle='nor'">no</xsl:when>
            <xsl:when test="$codeLangTitle='nya'">ny</xsl:when>
            <xsl:when test="$codeLangTitle='oci'">oc</xsl:when>
            <xsl:when test="$codeLangTitle='oji'">oj</xsl:when>
            <xsl:when test="$codeLangTitle='ori'">or</xsl:when>
            <xsl:when test="$codeLangTitle='orm'">om</xsl:when>
            <xsl:when test="$codeLangTitle='oss'">os</xsl:when>
            <xsl:when test="$codeLangTitle='pan'">pa</xsl:when>
            <xsl:when test="$codeLangTitle='fas'">fa</xsl:when>
            <xsl:when test="$codeLangTitle='per'">fa</xsl:when>
            <xsl:when test="$codeLangTitle='pli'">pi</xsl:when>
            <xsl:when test="$codeLangTitle='pol'">pl</xsl:when>
            <xsl:when test="$codeLangTitle='por'">pt</xsl:when>
            <xsl:when test="$codeLangTitle='pus'">ps</xsl:when>
            <xsl:when test="$codeLangTitle='que'">qu</xsl:when>
            <xsl:when test="$codeLangTitle='roh'">rm</xsl:when>
            <xsl:when test="$codeLangTitle='ron'">ro</xsl:when>
            <xsl:when test="$codeLangTitle='rum'">ro</xsl:when>
            <xsl:when test="$codeLangTitle='run'">rn</xsl:when>
            <xsl:when test="$codeLangTitle='rus'">ru</xsl:when>
            <xsl:when test="$codeLangTitle='sag'">sg</xsl:when>
            <xsl:when test="$codeLangTitle='san'">sa</xsl:when>
            <xsl:when test="$codeLangTitle='scc'">sr</xsl:when>
            <xsl:when test="$codeLangTitle='sin'">si</xsl:when>
            <xsl:when test="$codeLangTitle='slo'">sk</xsl:when>
            <xsl:when test="$codeLangTitle='slk'">sk</xsl:when>
            <xsl:when test="$codeLangTitle='slv'">sl</xsl:when>
            <xsl:when test="$codeLangTitle='sme'">se</xsl:when>
            <xsl:when test="$codeLangTitle='smo'">sm</xsl:when>
            <xsl:when test="$codeLangTitle='sna'">sn</xsl:when>
            <xsl:when test="$codeLangTitle='snd'">sd</xsl:when>
            <xsl:when test="$codeLangTitle='som'">so</xsl:when>
            <xsl:when test="$codeLangTitle='sot'">st</xsl:when>
            <xsl:when test="$codeLangTitle='spa'">es</xsl:when>
            <xsl:when test="$codeLangTitle='sqi'">sq</xsl:when>
            <xsl:when test="$codeLangTitle='srd'">sc</xsl:when>
            <xsl:when test="$codeLangTitle='srp'">sr</xsl:when>
            <xsl:when test="$codeLangTitle='ssw'">ss</xsl:when>
            <xsl:when test="$codeLangTitle='sun'">su</xsl:when>
            <xsl:when test="$codeLangTitle='swa'">sw</xsl:when>
            <xsl:when test="$codeLangTitle='swe'">sv</xsl:when>
            <xsl:when test="$codeLangTitle='tah'">ty</xsl:when>
            <xsl:when test="$codeLangTitle='tam'">ta</xsl:when>
            <xsl:when test="$codeLangTitle='tat'">tt</xsl:when>
            <xsl:when test="$codeLangTitle='tel'">te</xsl:when>
            <xsl:when test="$codeLangTitle='tgk'">tg</xsl:when>
            <xsl:when test="$codeLangTitle='tgl'">tl</xsl:when>
            <xsl:when test="$codeLangTitle='tha'">th</xsl:when>
            <xsl:when test="$codeLangTitle='tib'">bo</xsl:when>
            <xsl:when test="$codeLangTitle='tir'">ti</xsl:when>
            <xsl:when test="$codeLangTitle='ton'">to</xsl:when>
            <xsl:when test="$codeLangTitle='tsn'">tn</xsl:when>
            <xsl:when test="$codeLangTitle='tso'">ts</xsl:when>
            <xsl:when test="$codeLangTitle='tuk'">tk</xsl:when>
            <xsl:when test="$codeLangTitle='tur'">tr</xsl:when>
            <xsl:when test="$codeLangTitle='twi'">tw</xsl:when>
            <xsl:when test="$codeLangTitle='uig'">ug</xsl:when>
            <xsl:when test="$codeLangTitle='ukr'">uk</xsl:when>
            <xsl:when test="$codeLangTitle='urd'">ur</xsl:when>
            <xsl:when test="$codeLangTitle='uzb'">uz</xsl:when>
            <xsl:when test="$codeLangTitle='ven'">ve</xsl:when>
            <xsl:when test="$codeLangTitle='vie'">vi</xsl:when>
            <xsl:when test="$codeLangTitle='vol'">vo</xsl:when>
            <xsl:when test="$codeLangTitle='wel'">cy</xsl:when>
            <xsl:when test="$codeLangTitle='wln'">wa</xsl:when>
            <xsl:when test="$codeLangTitle='wol'">wo</xsl:when>
            <xsl:when test="$codeLangTitle='xho'">xh</xsl:when>
            <xsl:when test="$codeLangTitle='yid'">yi</xsl:when>
            <xsl:when test="$codeLangTitle='yor'">yo</xsl:when>
            <xsl:when test="$codeLangTitle='zha'">za</xsl:when>
            <xsl:when test="$codeLangTitle='zho'">zh</xsl:when>
            <xsl:when test="$codeLangTitle='zul'">zu</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$codeLangTitle"/>
                <!--<xsl:choose>
                    <xsl:when test="string-length($codeLangTitle)=2">
                        <xsl:value-of select="$codeLangTitle"/>
                    </xsl:when>
                    <xsl:otherwise>en</xsl:otherwise>
                </xsl:choose>-->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
        
    <!-- FIN CODE LANGUE BRILL-EBOOKS-->
    <!-- code langue ECCO -->
    <xsl:variable name="codeLangEcco">
        <xsl:value-of select="//bookInfo/language"/>
    </xsl:variable>
    <xsl:variable name="langEcco">
        <xsl:choose>
            <xsl:when test="$codeLangEcco='Afar'">aa</xsl:when>
            <xsl:when test="$codeLangEcco='Abkhaz'">ab</xsl:when>
            <xsl:when test="$codeLangEcco='Afrikaans'">af</xsl:when>
            <xsl:when test="$codeLangEcco='Akan'">ak</xsl:when>
            <xsl:when test="$codeLangEcco='Albanian'">sq</xsl:when>
            <xsl:when test="$codeLangEcco='Amharic'">am</xsl:when>
            <xsl:when test="$codeLangEcco='Arabic'">ar</xsl:when>
            <xsl:when test="$codeLangEcco='Aragonese'">an</xsl:when>
            <xsl:when test="$codeLangEcco='Armenian'">hy</xsl:when>
            <xsl:when test="$codeLangEcco='Armenian'">hy</xsl:when>
            <xsl:when test="$codeLangEcco='Assamese'">as</xsl:when>
            <xsl:when test="$codeLangEcco='Avaric'">av</xsl:when>
            <xsl:when test="$codeLangEcco='Avestan'">ae</xsl:when>
            <xsl:when test="$codeLangEcco='Aymara'">ay</xsl:when>
            <xsl:when test="$codeLangEcco='Azerbaijani'">az</xsl:when>
            <xsl:when test="$codeLangEcco='Bashkir'">ba</xsl:when>
            <xsl:when test="$codeLangEcco='Bambara'">bm</xsl:when>
            <xsl:when test="$codeLangEcco='Basque'">eu</xsl:when>
            <xsl:when test="$codeLangEcco='Belarusian'">be</xsl:when>
            <xsl:when test="$codeLangEcco='Bengali'">bn</xsl:when>
            <xsl:when test="$codeLangEcco='Bihari (languages)'">bh</xsl:when>
            <xsl:when test="$codeLangEcco='Bislama'">bi</xsl:when>
            <xsl:when test="$codeLangEcco='Bosnian'">bs</xsl:when>
            <xsl:when test="$codeLangEcco='Breton'">br</xsl:when>
            <xsl:when test="$codeLangEcco='Bulgarian'">bg</xsl:when>
            <xsl:when test="$codeLangEcco='Burmese'">my</xsl:when>
            <xsl:when test="$codeLangEcco='Catalan'">ca</xsl:when>
            <xsl:when test="$codeLangEcco='Chamorro'">ch</xsl:when>
            <xsl:when test="$codeLangEcco='Chechen'">ce</xsl:when>
            <xsl:when test="$codeLangEcco='Chinese'">zh</xsl:when>
            <xsl:when test="$codeLangEcco='Church Slavic'">cu</xsl:when>
            <xsl:when test="$codeLangEcco='Old Slavonic'">cu</xsl:when>
            <xsl:when test="$codeLangEcco='Church Slavonic'">cu</xsl:when>
            <xsl:when test="$codeLangEcco='Old Church Slavonic'">cu</xsl:when>
            <xsl:when test="$codeLangEcco='Old Bulgarian'">cu</xsl:when>
            <xsl:when test="$codeLangEcco='Chuvash'">cv</xsl:when>
            <xsl:when test="$codeLangEcco='Cornish'">kw</xsl:when>
            <xsl:when test="$codeLangEcco='Corsican'">co</xsl:when>
            <xsl:when test="$codeLangEcco='Cree'">cr</xsl:when>
            <xsl:when test="$codeLangEcco='Czech'">cs</xsl:when>
            <xsl:when test="$codeLangEcco='Danish'">da</xsl:when>
            <xsl:when test="$codeLangEcco='Divehi'">dv</xsl:when>
            <xsl:when test="$codeLangEcco='Dhivehi'">dv</xsl:when>
            <xsl:when test="$codeLangEcco='Maldivian'">dv</xsl:when>
            <xsl:when test="$codeLangEcco='Dutch'">nl</xsl:when>
            <xsl:when test="$codeLangEcco='Flemish'">nl</xsl:when>
            <xsl:when test="$codeLangEcco='Dzongkha'">dz</xsl:when>
            <xsl:when test="$codeLangEcco='English'">en</xsl:when>
            <xsl:when test="$codeLangEcco='Esperanto'">eo</xsl:when>
            <xsl:when test="$codeLangEcco='Estonian'">et</xsl:when>
            <xsl:when test="$codeLangEcco='Ewe'">ee</xsl:when>
            <xsl:when test="$codeLangEcco='Faroese'">fo</xsl:when>
            <xsl:when test="$codeLangEcco='Fijian'">fj</xsl:when>
            <xsl:when test="$codeLangEcco='Finnish'">fi</xsl:when>
            <xsl:when test="$codeLangEcco='French'">fr</xsl:when>
            <xsl:when test="$codeLangEcco='Western Frisian'">fy</xsl:when>
            <xsl:when test="$codeLangEcco='Fulah'">ff</xsl:when>
            <xsl:when test="$codeLangEcco='Georgian'">ka</xsl:when>
            <xsl:when test="$codeLangEcco='German'">de</xsl:when>
            <xsl:when test="$codeLangEcco='Gaelic'">gd</xsl:when>
            <xsl:when test="$codeLangEcco='Scottish Gaelic'">gd</xsl:when>
            <xsl:when test="$codeLangEcco='Irish'">ga</xsl:when>
            <xsl:when test="$codeLangEcco='Galician'">gl</xsl:when>
            <xsl:when test="$codeLangEcco='Manx'">gv</xsl:when>
            <xsl:when test="$codeLangEcco='Modern Greek (since 1453–)'">el</xsl:when>
            <xsl:when test="$codeLangEcco='Guarani'">gn</xsl:when>
            <xsl:when test="$codeLangEcco='Gujarati'">gu</xsl:when>
            <xsl:when test="$codeLangEcco='Haitian Creole'">ht</xsl:when>
            <xsl:when test="$codeLangEcco='Haitian'">ht</xsl:when>
            <xsl:when test="$codeLangEcco='Hausa'">ha</xsl:when>
            <xsl:when test="$codeLangEcco='Hebrew'">he</xsl:when>
            <xsl:when test="$codeLangEcco='Herero'">hz</xsl:when>
            <xsl:when test="$codeLangEcco='Hindi'">hi</xsl:when>
            <xsl:when test="$codeLangEcco='Hiri Motu'">ho</xsl:when>
            <xsl:when test="$codeLangEcco='Croatian'">hr</xsl:when>
            <xsl:when test="$codeLangEcco='Hungarian'">hu</xsl:when>
            <xsl:when test="$codeLangEcco='Igbo'">ig</xsl:when>
            <xsl:when test="$codeLangEcco='Icelandic'">is</xsl:when>
            <xsl:when test="$codeLangEcco='Ido'">io</xsl:when>
            <xsl:when test="$codeLangEcco='Nuosu'">ii</xsl:when>
            <xsl:when test="$codeLangEcco='Sichuan Yi'">ii</xsl:when>
            <xsl:when test="$codeLangEcco='Inuktitut'">iu</xsl:when>
            <xsl:when test="$codeLangEcco='Interlingue'">ie</xsl:when>
            <xsl:when test="$codeLangEcco='Occidental'">ie</xsl:when>
            <xsl:when test="$codeLangEcco='Interlingua (International Auxiliary Language Association)'">ia</xsl:when>
            <xsl:when test="$codeLangEcco='Indonesian'">id</xsl:when>
            <xsl:when test="$codeLangEcco='Inupiaq'">ik</xsl:when>
            <xsl:when test="$codeLangEcco='Italian'">it</xsl:when>
            <xsl:when test="$codeLangEcco='Javanese'">jv</xsl:when>
            <xsl:when test="$codeLangEcco='Japanese'">ja</xsl:when>
            <xsl:when test="$codeLangEcco='Greenlandic'">kl</xsl:when>
            <xsl:when test="$codeLangEcco='Kalaallisut'">kl</xsl:when>
            <xsl:when test="$codeLangEcco='Kannada'">kn</xsl:when>
            <xsl:when test="$codeLangEcco='Kashmiri'">ks</xsl:when>
            <xsl:when test="$codeLangEcco='Kanuri'">kr</xsl:when>
            <xsl:when test="$codeLangEcco='Kazakh'">kk</xsl:when>
            <xsl:when test="$codeLangEcco='Central Khmer'">km</xsl:when>
            <xsl:when test="$codeLangEcco='Kikuyu'">ki</xsl:when>
            <xsl:when test="$codeLangEcco='Gikuyu'">ki</xsl:when>
            <xsl:when test="$codeLangEcco='Kinyarwanda'">rw</xsl:when>
            <xsl:when test="$codeLangEcco='Kirghiz'">ky</xsl:when>
            <xsl:when test="$codeLangEcco='Komi'">kv</xsl:when>
            <xsl:when test="$codeLangEcco='Kongo'">kg</xsl:when>
            <xsl:when test="$codeLangEcco='Korean'">ko</xsl:when>
            <xsl:when test="$codeLangEcco='Kuanyama'">kj</xsl:when>
            <xsl:when test="$codeLangEcco='Kwanyama'">kj</xsl:when>
            <xsl:when test="$codeLangEcco='Kurdish'">ku</xsl:when>
            <xsl:when test="$codeLangEcco='Lao'">lo</xsl:when>
            <xsl:when test="$codeLangEcco='Latin'">la</xsl:when>
            <xsl:when test="$codeLangEcco='Latvian'">lv</xsl:when>
            <xsl:when test="$codeLangEcco='Limburgish'">li</xsl:when>
            <xsl:when test="$codeLangEcco='Limburgan'">li</xsl:when>
            <xsl:when test="$codeLangEcco='Limburgish'">li</xsl:when>
            <xsl:when test="$codeLangEcco='Lingala'">ln</xsl:when>
            <xsl:when test="$codeLangEcco='Lithuanian'">lt</xsl:when>
            <xsl:when test="$codeLangEcco='Letzeburgesch'">lb</xsl:when>
            <xsl:when test="$codeLangEcco='Luxembourgish'">lb</xsl:when>
            <xsl:when test="$codeLangEcco='Luba-Katanga'">lu</xsl:when>
            <xsl:when test="$codeLangEcco='Ganda'">lg</xsl:when>
            <xsl:when test="$codeLangEcco='Macedonian'">mk</xsl:when>
            <xsl:when test="$codeLangEcco='Marshallese'">mh</xsl:when>
            <xsl:when test="$codeLangEcco='Malayalam'">ml</xsl:when>
            <xsl:when test="$codeLangEcco='Māori'">mi</xsl:when>
            <xsl:when test="$codeLangEcco='Marathi'">mr</xsl:when>
            <xsl:when test="$codeLangEcco='Malay'">ms</xsl:when>
            <xsl:when test="$codeLangEcco='Malagasy'">mg</xsl:when>
            <xsl:when test="$codeLangEcco='Maltese'">mt</xsl:when>
            <xsl:when test="$codeLangEcco='Mongolian'">mn</xsl:when>
            <xsl:when test="$codeLangEcco='Nauruan'">na</xsl:when>
            <xsl:when test="$codeLangEcco='Navajo'">nv</xsl:when>
            <xsl:when test="$codeLangEcco='Navaho'">nv</xsl:when>
            <xsl:when test="$codeLangEcco='South Ndebele'">nr</xsl:when>
            <xsl:when test="$codeLangEcco='North Ndebele'">nd</xsl:when>
            <xsl:when test="$codeLangEcco='Ndonga'">ng</xsl:when>
            <xsl:when test="$codeLangEcco='Nepali'">ne</xsl:when>
            <xsl:when test="$codeLangEcco='Norwegian Nynorsk'">nn</xsl:when>
            <xsl:when test="$codeLangEcco='Norwegian Bokmål'">nb</xsl:when>
            <xsl:when test="$codeLangEcco='Norwegian'">no</xsl:when>
            <xsl:when test="$codeLangEcco='Chichewa'">ny</xsl:when>
            <xsl:when test="$codeLangEcco='Chewa'">ny</xsl:when>
            <xsl:when test="$codeLangEcco='Nyanja'">ny</xsl:when>
            <xsl:when test="$codeLangEcco='Occitan (post 1500)'">oc</xsl:when>
            <xsl:when test="$codeLangEcco='Provençal'">oc</xsl:when>
            <xsl:when test="$codeLangEcco='Ojibwa'">oj</xsl:when>
            <xsl:when test="$codeLangEcco='Oriya'">or</xsl:when>
            <xsl:when test="$codeLangEcco='Oromo'">om</xsl:when>
            <xsl:when test="$codeLangEcco='Ossetian'">os</xsl:when>
            <xsl:when test="$codeLangEcco='Ossetic'">os</xsl:when>
            <xsl:when test="$codeLangEcco='Punjabi'">pa</xsl:when>
            <xsl:when test="$codeLangEcco='Panjabi'">pa</xsl:when>
            <xsl:when test="$codeLangEcco='Persian'">fa</xsl:when>
            <xsl:when test="$codeLangEcco='Pali'">pi</xsl:when>
            <xsl:when test="$codeLangEcco='Polish'">pl</xsl:when>
            <xsl:when test="$codeLangEcco='Portuguese'">pt</xsl:when>
            <xsl:when test="$codeLangEcco='Pushto'">ps</xsl:when>
            <xsl:when test="$codeLangEcco='Pashto'">ps</xsl:when>
            <xsl:when test="$codeLangEcco='Quechua'">qu</xsl:when>
            <xsl:when test="$codeLangEcco='Romansh'">rm</xsl:when>
            <xsl:when test="$codeLangEcco='Romanian'">ro</xsl:when>
            <xsl:when test="$codeLangEcco='Moldavian'">ro</xsl:when>
            <xsl:when test="$codeLangEcco='Moldovan'">ro</xsl:when>
            <xsl:when test="$codeLangEcco='Rundi'">rn</xsl:when>
            <xsl:when test="$codeLangEcco='Russian'">ru</xsl:when>
            <xsl:when test="$codeLangEcco='Sango'">sg</xsl:when>
            <xsl:when test="$codeLangEcco='Sanskrit'">sa</xsl:when>
            <xsl:when test="$codeLangEcco='Sinhala'">si</xsl:when>
            <xsl:when test="$codeLangEcco='Sinhalese'">si</xsl:when>
            <xsl:when test="$codeLangEcco='Slovak'">sk</xsl:when>
            <xsl:when test="$codeLangEcco='Slovenian'">sl</xsl:when>
            <xsl:when test="$codeLangEcco='Northern Sami'">se</xsl:when>
            <xsl:when test="$codeLangEcco='Samoan'">sm</xsl:when>
            <xsl:when test="$codeLangEcco='Shona'">sn</xsl:when>
            <xsl:when test="$codeLangEcco='Sindhi'">sd</xsl:when>
            <xsl:when test="$codeLangEcco='Somali'">so</xsl:when>
            <xsl:when test="$codeLangEcco='Southern Sotho'">st</xsl:when>
            <xsl:when test="$codeLangEcco='Spanish'">es</xsl:when>
            <xsl:when test="$codeLangEcco='Castilian'">es</xsl:when>
            <xsl:when test="$codeLangEcco='Sardinian'">sc</xsl:when>
            <xsl:when test="$codeLangEcco='Serbian'">sr</xsl:when>
            <xsl:when test="$codeLangEcco='Swati'">ss</xsl:when>
            <xsl:when test="$codeLangEcco='Sundanese'">su</xsl:when>
            <xsl:when test="$codeLangEcco='Swahili'">sw</xsl:when>
            <xsl:when test="$codeLangEcco='Swedish'">sv</xsl:when>
            <xsl:when test="$codeLangEcco='Tahitian'">ty</xsl:when>
            <xsl:when test="$codeLangEcco='Tamil'">ta</xsl:when>
            <xsl:when test="$codeLangEcco='Tatar'">tt</xsl:when>
            <xsl:when test="$codeLangEcco='Telugu'">te</xsl:when>
            <xsl:when test="$codeLangEcco='Tajik'">tg</xsl:when>
            <xsl:when test="$codeLangEcco='Tagalog'">tl</xsl:when>
            <xsl:when test="$codeLangEcco='Thai'">th</xsl:when>
            <xsl:when test="$codeLangEcco='Tibetan'">bo</xsl:when>
            <xsl:when test="$codeLangEcco='Tigrinya'">ti</xsl:when>
            <xsl:when test="$codeLangEcco='Tongan'">to</xsl:when>
            <xsl:when test="$codeLangEcco='Tswana'">tn</xsl:when>
            <xsl:when test="$codeLangEcco='Tsonga'">ts</xsl:when>
            <xsl:when test="$codeLangEcco='Turkmen'">tk</xsl:when>
            <xsl:when test="$codeLangEcco='Turkish'">tr</xsl:when>
            <xsl:when test="$codeLangEcco='Twi'">tw</xsl:when>
            <xsl:when test="$codeLangEcco='Uighur'">ug</xsl:when>
            <xsl:when test="$codeLangEcco='Uyghur'">ug</xsl:when>
            <xsl:when test="$codeLangEcco='Ukrainian'">uk</xsl:when>
            <xsl:when test="$codeLangEcco='Urdu'">ur</xsl:when>
            <xsl:when test="$codeLangEcco='Uzbek'">uz</xsl:when>
            <xsl:when test="$codeLangEcco='Venda'">ve</xsl:when>
            <xsl:when test="$codeLangEcco='Vietnamese'">vi</xsl:when>
            <xsl:when test="$codeLangEcco='Volapük'">vo</xsl:when>
            <xsl:when test="$codeLangEcco='Welsh'">cy</xsl:when>
            <xsl:when test="$codeLangEcco='Walloon'">wa</xsl:when>
            <xsl:when test="$codeLangEcco='Wolof'">wo</xsl:when>
            <xsl:when test="$codeLangEcco='Xhosa'">xh</xsl:when>
            <xsl:when test="$codeLangEcco='Yiddish'">yi</xsl:when>
            <xsl:when test="$codeLangEcco='Yoruba'">yo</xsl:when>
            <xsl:when test="$codeLangEcco='Zhuang'">za</xsl:when>
            <xsl:when test="$codeLangEcco='Chuang'">za</xsl:when>
            <xsl:when test="$codeLangEcco='Zulu'">zu</xsl:when>
        </xsl:choose>
    </xsl:variable>
  
    <xsl:variable name="DOI">
        <xsl:value-of select="//book-part-id[@book-part-id-type='doi']"/>
    </xsl:variable>
    <xsl:variable name="isbn">
        <xsl:value-of select="//isbn[@publication-format='online']| //isbn[@pub-type='epub']"/>
    </xsl:variable>
    
    <xsl:template match="book">
        <TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
            <xsl:attribute name="xsi:noNamespaceSchemaLocation">
                <xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
            </xsl:attribute>
            <xsl:choose>
               <!-- traitement spécial TaylorFrancis -->
                <xsl:when test="starts-with(book-meta/book-id[@pub-id-type='doi'],'10.4324/') or contains(book/book-meta/publisher/publisher-name,'Routledge')">
                    <xsl:apply-templates select="book-meta" mode="TF"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="//book-meta/book-id[@pub-id-type='doi']='10.1484/M.IPM-EB.5.112141'">
                            <xsl:attribute name="xml:lang">fr</xsl:attribute>
                        </xsl:when>
                        <!-- numerique premium -->
                        <xsl:when test="//abstract/@xml:lang[string-length() &gt; 0]">
                            <xsl:for-each select="//abstract/@xml:lang">
                                <xsl:attribute name="xml:lang">
                                    <xsl:value-of select="translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                </xsl:attribute>
                            </xsl:for-each>
                        </xsl:when>
                        <!-- brepols book -->
                        <xsl:when test="//body/book-part/@xml:lang[string-length()&gt; 0]">
                            <xsl:for-each select="//body/book-part/@xml:lang">
                                <xsl:attribute name="xml:lang">
                                    <xsl:value-of select="translate(.,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                </xsl:attribute>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                    <teiHeader>
                        <fileDesc>
                            <titleStmt>
                                <!-- Title information related to the paper goes here -->
                                <xsl:choose>
                                    <xsl:when test="//book/entryGroup/entry/headGroup/head[string-length()&gt; 0]">
                                        <title level="a" type="main">
                                            <xsl:if test="//book/entryGroup/entry/headGroup/label[string-length()&gt; 0]">
                                                <xsl:value-of select="/book/entryGroup/entry/headGroup/label"/>
                                                <xsl:text> - </xsl:text>
                                            </xsl:if>
                                            <xsl:value-of select="/book/entryGroup/entry/headGroup/head"/>
                                        </title>
                                    </xsl:when>
                                    <!-- ecco -->
                                    <xsl:when test="citation/titleGroup/fullTitle[string-length()&gt; 0]">
                                        <title level="a" type="main" xml:lang="{$langEcco}">
                                            <xsl:value-of select="citation/titleGroup/fullTitle"/>
                                        </title>
                                    </xsl:when>
                                    <xsl:when test="citation/titleGroup/displayTitle[string-length()&gt; 0]">
                                        <title level="a" type="main" xml:lang="{$langEcco}">
                                            <xsl:value-of select="citation/titleGroup/displayTitle"/>
                                        </title>
                                    </xsl:when>
                                    <xsl:when test="citation/titleGroup/uniformTitle[string-length()&gt; 0]">
                                        <title level="a" type="main" xml:lang="{$langEcco}">
                                            <xsl:value-of select="citation/titleGroup/uniformTitle"/>
                                        </title>
                                    </xsl:when>
                                    <!-- fin ecco -->
                                    <xsl:when test="//book-part[not(body/book-part)]/book-part-meta[string-length()&gt; 0]">
                                        <xsl:choose>
                                            <xsl:when test="//book-part[not(body/book-part)]/book-part-meta/title-group/title[string-length()&gt; 0]">
                                                <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/title-group/title"/>
                                            </xsl:when>
                                            <xsl:otherwise> 
                                                <!-- cambridge titre vide prendre type de contenu -->
                                                <title level="a" type="main">
                                                    <xsl:value-of select="translate(//book-part[not(body/book-part)]/@book-part-type,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/> 
                                                </title>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="/book/book-body/book-part/book-part-meta/title-group/title[string-length()&gt; 0]">
                                        <xsl:apply-templates select="/book/book-body/book-part/book-part-meta/title-group/title"/>
                                    </xsl:when>
                                    <xsl:when test="book-meta/book-title-group/book-title">
                                        <xsl:apply-templates select="book-meta/book-title-group/book-title" mode="analytic"/>
                                    </xsl:when>
                                </xsl:choose>
                            </titleStmt>
                            <!-- ecco -->
                            <xsl:if test="//citation/edition | //citation/collation">
                                <editionStmt>
                                    <xsl:if test="//citation/edition[string-length()&gt; 0]">
                                        <edition><xsl:value-of select="//citation/edition"/></edition></xsl:if>
                                    <!--<xsl:if test="//citation/imprint/imprintYear[string-length()&gt; 0]">
                                        <date><xsl:value-of select="//citation/imprint/imprintYear"/></date></xsl:if>-->
                                    <xsl:if test="//citation/collation[string-length()&gt; 0]">
                                        <p><xsl:value-of select="//citation/collation"/></p></xsl:if>
                                </editionStmt>
                            </xsl:if>
                            <publicationStmt>
                                <authority>ISTEX</authority>
                                <xsl:choose>
                                    <xsl:when test="book-meta/publisher/publisher-name='De Gruyter'">
                                        <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-1JLL5NJT-J">
                                            <xsl:value-of select="book-meta/publisher/publisher-name"/></publisher>
                                    </xsl:when>
                                    <xsl:when test="bookInfo/sourceBibCitation='ESTC Short Title Catalogue'">
                                        <publisher ref="http://scientific-publisher.data.istex.fr/ark:/67375/H02-P08W2FQ2-9">Gale Cengage</publisher>
                                    </xsl:when>
                                    <xsl:when test="book-meta/publisher/publisher-name[string-length() &gt; 0]">
                                        <xsl:choose>
                                            <xsl:when test="book-meta/publisher[1]/publisher-name[string-length() &gt; 0]">
                                                <publisher>
                                                    <xsl:if test="book-meta/publisher[1]/publisher-name='Cambridge University Press'">
                                                        <xsl:attribute name="ref">https://scientific-publisher.data.istex.fr/ark:/67375/H02-7XSK0Q94-6</xsl:attribute>
                                                    </xsl:if>
                                                    <xsl:value-of select="book-meta/publisher[1]/publisher-name"/></publisher>
                                            </xsl:when>
                                            <xsl:when test="book-meta/publisher[1]/publisher-loc[string-length() &gt; 0]">
                                                <pubPlace><xsl:value-of select="normalize-space(book-meta/publisher[1]/publisher-loc)"/></pubPlace>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:if test="contains(//self-uri/@xlink:href,'numeriquepremium')">
                                                    <publisher ref="https://scientific-publisher.data.istex.fr/ark:/67375/H02-ZX4M1CKJ-Z">Numérique Premium</publisher>
                                                </xsl:if>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:if test="//bookInfo">
                                    <availability>
                                        <licence><xsl:text>&#169; Gale-Eighteenth Century Collections Online. All rights reserved.</xsl:text></licence>
                                    </availability>
                                </xsl:if>
                                <xsl:if test="book-meta/pub-date/year[string-length() &gt; 0] |$docIssue//pub-date/year[string-length() &gt; 0] | /book/metadata/pubDate[string-length() &gt; 0] | //permissions">
                                    <availability>
                                        <xsl:if test="/book/body/book-part/book-part-meta/permissions/license[@license-type='free'] |//license[@license-type='open-access']">
                                            <xsl:attribute name="status">free</xsl:attribute>
                                        </xsl:if>
                                        <licence>
                                            
                                            <xsl:if test="/book/body/book-part/book-part-meta/permissions/license/@license-type='free'">
                                                <xsl:if test="/book/body/book-part/book-part-meta/permissions/license/license-p[string-length() &gt; 0]">
                                                <p>
                                                    <xsl:value-of select="/book/body/book-part/book-part-meta/permissions/license/license-p"/>
                                                </p>
                                                </xsl:if>
                                            </xsl:if>
                                            <xsl:choose>
                                                <!-- brill-ebooks -->
                                                <xsl:when test="//license[@license-type='open-access']">
                                                    <p>
                                                        <xsl:value-of select="//license[@license-type='open-access']/license-p"/>
                                                    </p>
                                                </xsl:when>
                                                <xsl:when test="book-meta/permissions/copyright-statement[string-length() &gt; 0] |//book/metadata/copyright[string-length() &gt; 0]">
                                                    <p>
                                                        <xsl:value-of select="book-meta/permissions/copyright-statement |//book/metadata/copyright[string-length() &gt; 0]"/>
                                                    </p>
                                                </xsl:when>
                                                <xsl:when test="book-meta/pub-date/year[string-length() &gt; 0]">
                                                    <p>©<xsl:value-of select="book-meta/pub-date[1]/year"/> Numérique Premium</p>
                                                </xsl:when>
                                                <xsl:when test="/book/metadata/pubDate[string-length() &gt; 0]">
                                                    <p>©<xsl:value-of select="/book/metadata/pubDate"/> Brill</p>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:if test="$docIssue//pub-date/year">
                                                        <p>©<xsl:value-of select="$docIssue//pub-date/year"/> Brepols Publishers</p>
                                                    </xsl:if>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </licence>
                                    </availability>
                                </xsl:if>
                                <xsl:choose>
                                    <!-- ecco -->
                                    <xsl:when test="//bookInfo/pubDate">
                                        <date type="published">
                                            <xsl:attribute name="when">
                                                <xsl:call-template name="dateEcco"/>
                                            </xsl:attribute>
                                            <xsl:call-template name="dateEcco"/>
                                        </date>
                                    </xsl:when>
                                    <xsl:when test="book-meta/pub-date[@publication-format='print']/year[string-length() &gt; 0]">
                                        <date type="published">
                                            <xsl:attribute name="when">
                                                <xsl:value-of select="book-meta/pub-date[@publication-format='print']/year"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="book-meta/pub-date[@publication-format='print']/year"/>
                                        </date>
                                    </xsl:when>
                                    <xsl:when test="book-meta/pub-date[@pub-type='ppub']/year[string-length() &gt; 0]">
                                        <date type="published">
                                            <xsl:attribute name="when">
                                                <xsl:value-of select="book-meta/pub-date[@pub-type='ppub']/year"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="book-meta/pub-date[@pub-type='ppub']/year"/>
                                        </date>
                                    </xsl:when>
                                    <xsl:when test="book-meta/pub-date[@pub-type='epub']/year[string-length() &gt; 0]">
                                        <date type="epublished">
                                            <xsl:attribute name="when">
                                                <xsl:value-of select="book-meta/pub-date[@pub-type='epub']/year"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="book-meta/pub-date[@pub-type='epub']/year"/>
                                        </date>
                                    </xsl:when>
                                    <xsl:when test="book-meta/pub-date[1]/year[string-length() &gt; 0]">
                                        <date type="published">
                                            <xsl:attribute name="when">
                                                <xsl:value-of select="book-meta/pub-date[1]/year"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="book-meta/pub-date[1]/year"/>
                                        </date>
                                    </xsl:when>
                                    <xsl:when test="$docIssue//pub-date[1]/year">
                                        <date type="published" when="{$docIssue//pub-date[1]/year}">
                                            <xsl:value-of select="$docIssue//pub-date[1]/year[string-length()&gt; 0]"/>
                                        </date>
                                    </xsl:when>
                                    <xsl:when test="/book/book-meta/pub-history/event/date[@publication-format='print']/year"><xsl:apply-templates select="/book/book-meta/pub-history/event/date[@publication-format='print']/year"/></xsl:when>
                                </xsl:choose>
                            </publicationStmt>
                            
                            <!-- SG - ajout du codeGenre book -->
                            <notesStmt>
                                <!-- niveau chapter -->
                                <note type="content-type">
                                    <xsl:choose>
                                        <!-- brepols -->
                                        <xsl:when test="starts-with(/book/book-meta/book-id[@pub-id-type='doi'][1],'10.1484/')">
                                            <xsl:attribute name="subtype">
                                                <xsl:value-of select="$codeGenreIstex"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="source">
                                                <xsl:value-of select="normalize-space($codeGenreAll)"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="scheme">
                                                <xsl:value-of select="$codeGenreArk"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="$codeGenreIstex"/>
                                        </xsl:when>
                                        <!-- Brill-rgrwo / deGruyter-->
                                        <xsl:when test="//book-part[not(body/book-part)]/book-part-meta/title-group/title">
                                            <xsl:choose>
                                                <xsl:when test="contains(//book-part[not(body/book-part)]/book-part-meta/title-group/label,'Chapter')
                                                    or contains(//book-part[not(body/book-part)]/book-part-meta/title-group/label,'CHAPTER')
                                                    or contains($titleToDeduceGenre,'Chapter')
                                                    or contains($titleToDeduceGenre,'CHAPTER')
                                                    or contains($titleToDeduceGenre,'MITRAIC')
                                                    or contains($titleToDeduceGenre,'DIVINITÉS')
                                                    or contains($titleToDeduceGenre,'IDÉE')
                                                    or contains($titleToDeduceGenre,'SYMBOLS')
                                                    or contains($titleToDeduceGenre,'PERSPECTIVES')
                                                    or contains($titleToDeduceGenre,'Survey')">
                                                    <xsl:attribute name="source">chapter</xsl:attribute>
                                                    <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6</xsl:attribute>
                                                    <xsl:text>chapter</xsl:text>
                                                </xsl:when>
                                                <xsl:when test="starts-with($titleToDeduceGenre,'Preface') or 
                                                    starts-with($titleToDeduceGenre,'Préface') or 
                                                    starts-with($titleToDeduceGenre,'PREFACE') or 
                                                    starts-with($titleToDeduceGenre,'PREFACE') or 
                                                    starts-with($titleToDeduceGenre,'PRÉFACE') or 
                                                    starts-with($titleToDeduceGenre,'PRÉFACE LA DOMUS À MONTAILLOU ET EN HAUTE-ARIÈGE') or 
                                                    contains($titleToDeduceGenre,'Prefazione') or 
                                                    contains($titleToDeduceGenre,'PREFAZIONE') or 
                                                    contains($titleToDeduceGenre,'Praefatio') or 
                                                    starts-with($titleToDeduceGenre,'Premessa') or 
                                                    starts-with($titleToDeduceGenre,'Criteri editoriali') or 
                                                    starts-with($titleToDeduceGenre,'Introduction Générale') or 
                                                    starts-with($titleToDeduceGenre,'Introduction') or 
                                                    starts-with($titleToDeduceGenre,'Introduzione') or 
                                                    starts-with($titleToDeduceGenre,'Avant-Propos') or 
                                                    starts-with($titleToDeduceGenre,'AVANT-PROPOS') or 
                                                    starts-with($titleToDeduceGenre,'INTRODUCTION') or 
                                                    starts-with($titleToDeduceGenre,'INTRODUCTION ET PROGRAMME') or
                                                    contains($titleToDeduceGenre,'Vorwort') or
                                                    contains($titleToDeduceGenre,'Vorbemerkung') or 
                                                    starts-with($titleToDeduceGenre,'Einleitung') or
                                                    starts-with($titleToDeduceGenre,'A Einleitung') or 
                                                    contains($titleToDeduceGenre,'Vorwort des Herausgebers')">
                                                    <xsl:attribute name="source">editorial</xsl:attribute>
                                                    <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-STW636XV-K</xsl:attribute>
                                                    <xsl:text>editorial</xsl:text>
                                                </xsl:when>
                                                <xsl:when test="contains($titleToDeduceGenre,'Preliminary')
                                                    or contains($titleToDeduceGenre,'INDEX')
                                                    or contains($titleToDeduceGenre,'ABRÉVIATIONS')
                                                    or contains($titleToDeduceGenre,'AUTEURS MODERNES')
                                                    or contains($titleToDeduceGenre,'Abbreviations')
                                                    or contains($titleToDeduceGenre,'ANNEXE')
                                                    or contains($titleToDeduceGenre,'BIBLIO')
                                                    or contains($titleToDeduceGenre,'Biblio')
                                                    or contains($titleToDeduceGenre,'BAS-RELIEFS')
                                                    or contains($titleToDeduceGenre,'BRVTTIVM')
                                                    or contains($titleToDeduceGenre,'CONCORDANC')
                                                    or contains($titleToDeduceGenre,'Concordanc')
                                                    or contains($titleToDeduceGenre,'PICENVM')
                                                    or contains($titleToDeduceGenre,'ADDEND')
                                                    or contains($titleToDeduceGenre,'Errata')
                                                    or contains($titleToDeduceGenre,'ACKNOWLEDGEMENTS')
                                                    or contains($titleToDeduceGenre,'ABBILDUNGEN')
                                                    or contains($titleToDeduceGenre,'Abbildungen')
                                                    or contains($titleToDeduceGenre,'REGISTER')
                                                    or contains($titleToDeduceGenre,'Kataloge')
                                                    or contains($titleToDeduceGenre,'NACHTRÄGE')
                                                    or contains($titleToDeduceGenre,'ÉTUDES PRÉLIMINAIRES')
                                                    or contains($titleToDeduceGenre,'RELIGIONS IN THE GRAECO')
                                                    or contains($titleToDeduceGenre,'RELIGIOUS GRADES AND FUNCTIONS')
                                                    or contains($titleToDeduceGenre,'CORRIGENDA')
                                                    or contains($titleToDeduceGenre,'CONCORDANCE')
                                                    or contains($titleToDeduceGenre,'LITERATURVERZEICHNIS')
                                                    or contains($titleToDeduceGenre,'PLANCHES')
                                                    or contains($titleToDeduceGenre,'Planches')
                                                    or contains($titleToDeduceGenre,'Carte')
                                                    or contains($titleToDeduceGenre,'CARTE')
                                                    or contains($titleToDeduceGenre,'PREFACE')
                                                    or contains($titleToDeduceGenre,'Preface')
                                                    or contains($titleToDeduceGenre,'PREFAZIONE')
                                                    or contains($titleToDeduceGenre,'Prefazione')
                                                    or contains($titleToDeduceGenre,'Matière Preliminaire')
                                                    or contains($titleToDeduceGenre,'Bibliographie Thématique')
                                                    or contains($titleToDeduceGenre,'Preliminary material')
                                                    or contains($titleToDeduceGenre,'Figures')
                                                    or contains($titleToDeduceGenre,'FIGURES')
                                                    or contains($titleToDeduceGenre,'GLOSSA')
                                                    or contains($titleToDeduceGenre,'Glossa')
                                                    or contains($titleToDeduceGenre,'LIST')
                                                    or contains($titleToDeduceGenre,'MAP')
                                                    or contains($titleToDeduceGenre,'Map')
                                                    or contains($titleToDeduceGenre,'NOTE')
                                                    or contains($titleToDeduceGenre,'Plates')
                                                    or contains($titleToDeduceGenre,'PLATE')
                                                    or contains($titleToDeduceGenre,'PHOTONACHWEIS')
                                                    or contains($titleToDeduceGenre,'Photonachweis')
                                                    or contains($titleToDeduceGenre,'PUTE I')
                                                    or contains($titleToDeduceGenre,'INDICE')
                                                    or contains($titleToDeduceGenre,'Index')
                                                    or contains($titleToDeduceGenre,'INDEX')
                                                    or contains($titleToDeduceGenre,'CIMRM')
                                                    or contains($titleToDeduceGenre,'REALIA')
                                                    or contains($titleToDeduceGenre,'TAFEL')
                                                    or contains($titleToDeduceGenre,'Tafel')
                                                    or contains($titleToDeduceGenre,'TAVOL')
                                                    or contains($titleToDeduceGenre,'TAV.')
                                                    or contains($titleToDeduceGenre,'Tav.')
                                                    or contains($titleToDeduceGenre,'TABLE')
                                                    or contains($titleToDeduceGenre,'Table')
                                                    or contains($titleToDeduceGenre,'TABEL')
                                                    or contains($titleToDeduceGenre,'TEXTSTELLEN')
                                                    or contains($titleToDeduceGenre,'SVPPLEMENTVM')
                                                    or contains($titleToDeduceGenre,'REFERENCES') or
                                                    starts-with($titleToDeduceGenre,'Backmatter') or 
                                                    starts-with($titleToDeduceGenre,'A. Tableaux statistiques') or 
                                                    starts-with($titleToDeduceGenre,'Abréviations') or 
                                                    starts-with($titleToDeduceGenre,'ABRÉVIATIONS') or 
                                                    contains($titleToDeduceGenre,'Abbreviazioni') or 
                                                    starts-with($titleToDeduceGenre,'ABBREVIAZIONI') or 
                                                    starts-with($titleToDeduceGenre,'Autori') or 
                                                    starts-with($titleToDeduceGenre,'ANNEXE') or 
                                                    starts-with($titleToDeduceGenre,'ARCHIVES') or 
                                                    starts-with($titleToDeduceGenre,'Avertissement') or 
                                                    contains($titleToDeduceGenre,'Avvertenz') or 
                                                    starts-with($titleToDeduceGenre,'Β. Cartes') or 
                                                    contains($titleToDeduceGenre,'Bibliogra') or 
                                                    contains($titleToDeduceGenre,'BIBLIOGRA') or 
                                                    starts-with($titleToDeduceGenre,'Choix et utilisation des sources') or 
                                                    starts-with($titleToDeduceGenre,'C. Graphiques') or 
                                                    starts-with($titleToDeduceGenre,'Carte') or 
                                                    starts-with($titleToDeduceGenre,'Exercices et compléments') or 
                                                    starts-with($titleToDeduceGenre,'GLOSSAIRE') or 
                                                    starts-with($titleToDeduceGenre,'Glossaire') or 
                                                    starts-with($titleToDeduceGenre,'GRAPHIQUE') or 
                                                    starts-with($titleToDeduceGenre,'IMPRIMÉS') or 
                                                    starts-with($titleToDeduceGenre,'Index') or 
                                                    contains($titleToDeduceGenre,'INDEX') or 
                                                    starts-with($titleToDeduceGenre,'Indici') or 
                                                    starts-with($titleToDeduceGenre,'Indice') or 
                                                    starts-with($titleToDeduceGenre,'List') or 
                                                    starts-with($titleToDeduceGenre,'LIST') or 
                                                    starts-with($titleToDeduceGenre,'Noms des auteurs') or 
                                                    starts-with($titleToDeduceGenre,'NOTE') or 
                                                    starts-with($titleToDeduceGenre,'Nota al Testo') or 
                                                    starts-with($titleToDeduceGenre,'Plan de') or 
                                                    starts-with($titleToDeduceGenre,'PIÈCES JUSTIFICATIVES') or 
                                                    starts-with($titleToDeduceGenre,'PRINCIPAUX OUVRAGES UTILISES') or 
                                                    starts-with($titleToDeduceGenre,'PROGRAMME') or 
                                                    starts-with($titleToDeduceGenre,'Quelques thèmes') or 
                                                    starts-with($titleToDeduceGenre,'REMERCIEMENTS') or 
                                                    starts-with($titleToDeduceGenre,'RÈGLES DE TRADUCTION') or 
                                                    starts-with($titleToDeduceGenre,'Remerciements') or 
                                                    starts-with($titleToDeduceGenre,'Revisori') or 
                                                    starts-with($titleToDeduceGenre,'Repères bibliographiques') or 
                                                    starts-with($titleToDeduceGenre,'Ringraziamenti') or 
                                                    starts-with($titleToDeduceGenre,'SIGLE') or 
                                                    starts-with($titleToDeduceGenre,'Siglorum') or 
                                                    contains($titleToDeduceGenre,'siglorum') or 
                                                    starts-with($titleToDeduceGenre,'Sommaire') or 
                                                    starts-with($titleToDeduceGenre,'Sommario') or 
                                                    starts-with($titleToDeduceGenre,'SOMMAIRE DU TOME PREMIER') or 
                                                    starts-with($titleToDeduceGenre,'SOURCE') or 
                                                    starts-with($titleToDeduceGenre,'Source') or 
                                                    starts-with($titleToDeduceGenre,'TABLE') or 
                                                    starts-with($titleToDeduceGenre,'Table') or 
                                                    starts-with($titleToDeduceGenre,'Tabula') or 
                                                    starts-with($titleToDeduceGenre,'TABULA') or 
                                                    starts-with($titleToDeduceGenre,'TAB.') or 
                                                    starts-with($titleToDeduceGenre,'Indice generale') or 
                                                    starts-with($titleToDeduceGenre,'Curatori') or 
                                                    starts-with($titleToDeduceGenre,'Addenda') or 
                                                    starts-with($titleToDeduceGenre,'Register') or 
                                                    contains($titleToDeduceGenre,'Text und Übersetzung') or 
                                                    contains($titleToDeduceGenre,'Kommentar') or 
                                                    contains($titleToDeduceGenre,'KOMMENTAR') or 
                                                    contains($titleToDeduceGenre,'Geleitwort') or 
                                                    contains($titleToDeduceGenre,'GELEITWORT') or 
                                                    contains($titleToDeduceGenre,'Systematisches Literaturverzeichnis') or 
                                                    contains($titleToDeduceGenre,'Literaturverzeichnis') or 
                                                    contains($titleToDeduceGenre,'LITERATURVERZEICHNIS') or 
                                                    contains($titleToDeduceGenre,'Anhang') or 
                                                    contains($titleToDeduceGenre,'Quellen und Rezeption') or 
                                                    contains($titleToDeduceGenre,'Stellenregister') or 
                                                    contains($titleToDeduceGenre,'KATALOG') or 
                                                    contains($titleToDeduceGenre,'Sprache und Literatur') or 
                                                    starts-with($titleToDeduceGenre,'Literatur') or 
                                                    contains($titleToDeduceGenre,'Gesamtregister') or 
                                                    contains($titleToDeduceGenre,'Textchronologische Analyse der Bilder') or 
                                                    contains($titleToDeduceGenre,'Sonderfälle') or 
                                                    contains($titleToDeduceGenre,'Kritische Edition und Übersetzung') or 
                                                    contains($titleToDeduceGenre,'Abbildungsnachweis') or 
                                                    contains($titleToDeduceGenre,'Zur Textgestaltung') or 
                                                    contains($titleToDeduceGenre,'Abbildungen') or 
                                                    contains($titleToDeduceGenre,'Autorenkürzel') or 
                                                    contains($titleToDeduceGenre,'Karten') or 
                                                    contains($titleToDeduceGenre,'Farbtafeln') or 
                                                    contains($titleToDeduceGenre,'Personennamenindex') or 
                                                    contains($titleToDeduceGenre,'Redaktionelle Hinweise') or 
                                                    contains($titleToDeduceGenre,'INHALT') or 
                                                    contains($titleToDeduceGenre,'Schlußfolgerung') or 
                                                    contains($titleToDeduceGenre,'ADDENDA et CORRIGENDA') or 
                                                    contains($titleToDeduceGenre,'Abkürzungsverzeichnis') or   
                                                    contains($titleToDeduceGenre,'VORBEMERKUNG ZU TEXT UND KRITISCHEM APPARAT') or 
                                                    contains($titleToDeduceGenre,'Inhaltsverzeichnis') or 
                                                    contains($titleToDeduceGenre,'Nachträge und Berichtigungen') or 
                                                    contains($titleToDeduceGenre,'Ortsnamenindex') or 
                                                    contains($titleToDeduceGenre,'Personenregister') or 
                                                    contains($titleToDeduceGenre,'Zeichenerklärung') or 
                                                    contains($titleToDeduceGenre,'Namenindex') or 
                                                    contains($titleToDeduceGenre,'Siglen') or 
                                                    contains($titleToDeduceGenre,'Tabula Gratulatoria') or 
                                                    contains($titleToDeduceGenre,'INHALT') or 
                                                    contains($titleToDeduceGenre,'Abkürzungsverzeichnis') or 
                                                    contains($titleToDeduceGenre,'Front matter') or 
                                                    contains($titleToDeduceGenre,'Danksagung') or 
                                                    contains($titleToDeduceGenre,'Nachwort der Herausgeber') or 
                                                    contains($titleToDeduceGenre,'Tafelanhang') or 
                                                    contains($titleToDeduceGenre,'Anhang') or 
                                                    contains($titleToDeduceGenre,'Fragestellungen und Methoden') or 
                                                    contains($titleToDeduceGenre,'Tabel') or 
                                                    contains($titleToDeduceGenre,'Corrigenda') or 
                                                    contains($titleToDeduceGenre,'Grußwort') or 
                                                    contains($titleToDeduceGenre,'Abgekürzt') or 
                                                    contains($titleToDeduceGenre,'Auctores') or 
                                                    contains($titleToDeduceGenre,'Abkürzungen') or 
                                                    contains($titleToDeduceGenre,'Abgekürzt zitierte Literatur') or 
                                                    contains($titleToDeduceGenre,'Die Autoren') or 
                                                    contains($titleToDeduceGenre,'register') or 
                                                    contains($titleToDeduceGenre,'Abbildungsnachweise') or 
                                                    contains($titleToDeduceGenre,'Abgekürzt zitierte Literatur') or 
                                                    contains($titleToDeduceGenre,'Vorbemerkung') or 
                                                    contains($titleToDeduceGenre,'Konkordanz') or 
                                                    contains($titleToDeduceGenre,'Autorenverzeichnis') or 
                                                    contains($titleToDeduceGenre,'Schlußwort') or 
                                                    contains($titleToDeduceGenre,'Conspectus metrorum') or
                                                    contains($titleToDeduceGenre,'Dramatis Personae') or
                                                    contains($titleToDeduceGenre,'Legende') or
                                                    contains($titleToDeduceGenre,'Zusammenfassung') or
                                                    contains($titleToDeduceGenre,'Summary') or
                                                    contains($titleToDeduceGenre,'Grafische') or
                                                    contains($titleToDeduceGenre,'Frontmatter') or
                                                    contains($titleToDeduceGenre,'Auctores') or
                                                    contains($titleToDeduceGenre,'Währungen') or
                                                    contains($titleToDeduceGenre,'Primärliteratur') or
                                                    contains($titleToDeduceGenre,'Sachbegriffe') or
                                                    contains($titleToDeduceGenre,'PRAESCRIPTUM') or
                                                    contains($titleToDeduceGenre,'CHRONOLOGIE') or
                                                    $titleToDeduceGenre='A' or 
                                                    $titleToDeduceGenre='B' or 
                                                    $titleToDeduceGenre='C' or 
                                                    $titleToDeduceGenre='D' or 
                                                    $titleToDeduceGenre='E' or 
                                                    $titleToDeduceGenre='F' or
                                                    $titleToDeduceGenre='G' or 
                                                    $titleToDeduceGenre='H' or 
                                                    $titleToDeduceGenre='I' or
                                                    $titleToDeduceGenre='II' or 
                                                    $titleToDeduceGenre='J' or 
                                                    $titleToDeduceGenre='K' or
                                                    $titleToDeduceGenre='KO' or
                                                    $titleToDeduceGenre='KE' or
                                                    $titleToDeduceGenre='KU' or
                                                    $titleToDeduceGenre='L' or 
                                                    $titleToDeduceGenre='MA' or
                                                    $titleToDeduceGenre='M' or 
                                                    $titleToDeduceGenre='N' or 
                                                    $titleToDeduceGenre='O' or 
                                                    $titleToDeduceGenre='P' or 
                                                    $titleToDeduceGenre='Q' or 
                                                    $titleToDeduceGenre='R' or 
                                                    $titleToDeduceGenre='S' or 
                                                    $titleToDeduceGenre='T' or 
                                                    $titleToDeduceGenre='TU' or 
                                                    $titleToDeduceGenre='TO' or
                                                    $titleToDeduceGenre='U' or 
                                                    $titleToDeduceGenre='V' or 
                                                    $titleToDeduceGenre='W' or 
                                                    $titleToDeduceGenre='X' or 
                                                    $titleToDeduceGenre='XY' or 
                                                    $titleToDeduceGenre='Z' or  
                                                    $titleToDeduceGenre='ZO' or 
                                                    $titleToDeduceGenre='PA' or 
                                                    $titleToDeduceGenre='PI' or
                                                    $titleToDeduceGenre='WE'">
                                                     <xsl:attribute name="source">other</xsl:attribute>
                                                    <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0</xsl:attribute>
                                                    <xsl:text>other</xsl:text>
                                                </xsl:when>
                                                <xsl:when test="//book-part[not(body/book-part)]/@book-part-type">
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
                                            </xsl:choose>
                                        </xsl:when>
                                        <!-- Numérique premium --><!-- ECCO -->
                                        <xsl:when test="collection-meta[@collection-type='book collection'] |bookInfo">
                                            <xsl:attribute name="source">book</xsl:attribute>
                                            <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-94FB0L8V-T</xsl:attribute>
                                            <xsl:text>book</xsl:text>
                                        </xsl:when>
                                        <!-- Brill-hacco -->
                                        <xsl:when test="//book[metadata]/@type">
                                            <xsl:attribute name="source"><xsl:value-of select="//book[metadata]/@type"/></xsl:attribute>
                                            <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-36WXPZKG-C</xsl:attribute>
                                            <xsl:text>collected-courses</xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="source">chapter</xsl:attribute>
                                            <xsl:attribute name="scheme">https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6</xsl:attribute>
                                            <xsl:text>chapter</xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </note>
                                <!-- niveau revue / book -->
                                <xsl:choose>
                                    <xsl:when test="$docIssue/book/book-series-meta">
                                        <note type="publication-type">
                                            <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                            <xsl:text>book-series</xsl:text>
                                        </note>
                                    </xsl:when>
                                    <!-- Brill-ebooks-->
                                    <xsl:when test="//book/collection-meta | /book/book-series-meta">
                                        <note type="publication-type">
                                            <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-0G6R5W5T-Z</xsl:attribute>
                                            <xsl:text>book-series</xsl:text>
                                        </note>
                                    </xsl:when>
                                    <!-- Brill-hacco -->
                                    <xsl:when test="//book[metadata]/@type">
                                        <note type="publication-type">
                                            <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5540BQ2P-Q</xsl:attribute>
                                            <xsl:text>reference-works</xsl:text>
                                        </note>
                                    </xsl:when>
                                    <!-- Ecco -->
                                    <xsl:when test="//book/bookInfo">
                                        <note type="publication-type">
                                            <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-NTSGR1R0-Z</xsl:attribute>
                                            <xsl:text>database</xsl:text>
                                        </note>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <!-- niveau revue -->
                                        <note type="publication-type">
                                            <xsl:attribute name="subtype">book</xsl:attribute>
                                            <xsl:attribute name="scheme">https://publication-type.data.istex.fr/ark:/67375/JMC-5WTPMB5N-F</xsl:attribute>
                                            <xsl:text>book</xsl:text>
                                        </note>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:if test="front/article-meta/volume-id">
                                    <xsl:apply-templates select="front/article-meta/volume-id"/>
                                </xsl:if>
                                <xsl:if test="//bookInfo/notes[string-length()&gt; 0]">
                                    <note type="documentaryNotes">
                                        <xsl:value-of select="//bookInfo/notes"/>
                                    </note>
                                </xsl:if>
                                <xsl:if test="//bookInfo/comments[string-length()&gt; 0]">
                                    <note type="comments">
                                        <xsl:value-of select="//bookInfo/comments"/>
                                    </note>
                                </xsl:if>
                            </notesStmt>
                            <sourceDesc>
                                <xsl:choose>
                                    <xsl:when test="//body/book-part[@book-part-type='chapter']/book-part-meta">
                                        <xsl:apply-templates select="//book" mode="editor"/>
                                    </xsl:when>
                                    <xsl:when test="//body/book-part/book-part-meta">
                                        <xsl:apply-templates select="//book-part" mode="sourceDesc"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:apply-templates select="//book" mode="editor"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </sourceDesc>
                        </fileDesc>
                        <!-- versionning -->
                        <xsl:call-template name="insertVersion"/>
                        
                        <xsl:choose>
                            <xsl:when test="//body/book-part/book-part-meta/abstract |$docIssue//subj-group/subject">
                                <profileDesc>
                                    <langUsage>
                                        <language>
                                            <xsl:attribute name="ident">
                                                <xsl:choose>
                                                    <xsl:when test="//body/book-part/@xml:lang">
                                                        <xsl:value-of select="//body/book-part/@xml:lang"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="$codeLang"/>
                                                    </xsl:otherwise>
                                                </xsl:choose> 
                                            </xsl:attribute>
                                        </language>
                                    </langUsage>
                                    
                                    <xsl:apply-templates select="//body/book-part/book-part-meta/abstract"/>
                                    <xsl:if test="$docIssue//subj-group/subject[string-length() &gt; 0]">
                                        <textClass ana="subject">
                                            <xsl:apply-templates select="$docIssue//book-categories/subj-group"/>
                                        </textClass>
                                    </xsl:if>
                                    <!-- brill-ebooks -->
                                    <xsl:if test="//book-part[not(body/book-part)]/book-part-meta/kwd-group">
                                        <textClass ana="keyword">
                                            <keywords>
                                                <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/kwd-group/kwd"/>
                                            </keywords>
                                        </textClass>
                                    </xsl:if>
                                </profileDesc>
                            </xsl:when>
                            <xsl:when test="//book/entryGroup/keywordGroup | //book[metadata]/../abstract| /book/metadata/title/@lang">
                                <profileDesc>
                                    <xsl:apply-templates select="//book[metadata]/../abstract"/>
                                    <xsl:if test="//book/entryGroup/keywordGroup/keyword[string-length() &gt; 0]">
                                        <xsl:for-each select="//book/entryGroup/keywordGroup">
                                        <textClass ana="subject">
                                            <xsl:if test="@type">
                                                <xsl:attribute name="xml:lang">
                                                    <xsl:value-of select="@type"/>
                                                </xsl:attribute>
                                            </xsl:if>
                                            <keywords>
                                                <xsl:apply-templates select="keyword"/>
                                            </keywords>
                                        </textClass>
                                        </xsl:for-each>
                                    </xsl:if>
                                    <xsl:if test="/book/metadata/title/@lang[string-length()&gt; 0]">
                                        <langUsage>
                                            <language>
                                                <xsl:attribute name="ident">
                                                    <xsl:value-of select="/book/metadata/title/@lang"/>
                                                </xsl:attribute>
                                            </language>
                                        </langUsage>
                                    </xsl:if>
                                    
                                </profileDesc>
                            </xsl:when>
                            <xsl:when test="//abstract[string-length() &gt; 0] |$docIssue//book-meta/pub-date | //kwd-group | //module">
                                <profileDesc>
                                    <creation>
                                        <xsl:choose>
                                            <xsl:when test="$docIssue//book-meta/pub-date"><xsl:apply-templates select="$docIssue//book-meta/pub-date"></xsl:apply-templates></xsl:when>
                                            <xsl:when test="//book-meta/pub-date"><xsl:apply-templates select="//book-meta/pub-date"/></xsl:when>
                                            <xsl:when test="/book/book-meta/pub-history/event/date[@publication-format='print']/year"><xsl:apply-templates select="/book/book-meta/pub-history/event/date[@publication-format='print']/year"/></xsl:when>
                                            <xsl:when test="//bookInfo/pubDate"><xsl:call-template name="dateEcco"/></xsl:when>
                                        </xsl:choose>
                                    </creation>
                                    <!-- PL: abstract is moved from <front> to here -->
                                    <xsl:choose>
                                        <xsl:when test="//book-part[not(body/book-part)]/book-part-meta">
                                            <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/abstract"/>
                                        </xsl:when>
                                        <!-- ne pas reprendre les abstracts du livre si on traite les chapitres-->
                                        <xsl:when test="/book/book-meta/abstract and /book/body/book-part/book-part-meta/title-group/title"/>
                                        <xsl:otherwise>
                                            <xsl:if test="book-meta/abstract[string-length() &gt; 0]">
                                                <xsl:apply-templates select="book-meta/abstract"/>
                                            </xsl:if>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    
                                    <!-- keywords -->
                                    <xsl:choose>
                                        <!-- ne pas reprendre les keywords du livre si on traite les chapitres-->
                                        <xsl:when test="//book-part[not(body/book-part)]/book-part-meta">
                                            <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/kwd-group"/>
                                        </xsl:when>
                                        <!-- NPremium - book_collection -->
                                        <xsl:when test="collection-meta[@collection-type='book collection']/title-group/title[string-length() &gt; 0]">
                                            <textClass ana="collection">
                                                <keywords>
                                                    <xsl:for-each select="collection-meta[@collection-type='book collection']/title-group">
                                                        <xsl:choose>
                                                            <xsl:when test="title">
                                                                <term>
                                                                    <xsl:value-of select="title"/>
                                                                </term>
                                                            </xsl:when>
                                                        </xsl:choose>
                                                    </xsl:for-each>
                                                    
                                                </keywords>
                                            </textClass>
                                        </xsl:when>
                                        <xsl:when test="book-meta/subj-group[string-length() &gt; 0]">
                                            <textClass ana="subject">
                                                <xsl:for-each select="book-meta/subj-group">
                                                    <xsl:if test="subject">
                                                        <keywords>
                                                            <list>
                                                                <xsl:if test="subj-group/subject[string-length() &gt; 0]">
                                                                    <item>
                                                                        <xsl:value-of select="subj-group/subject"/>
                                                                    </item>
                                                                </xsl:if>
                                                                <xsl:if test="subj-group/subj-group/subj-group/subj-group/subject">
                                                                    <item>
                                                                        <xsl:value-of select="normalize-space(subj-group/subj-group/subj-group/subj-group/subject)"/>
                                                                    </item>
                                                                </xsl:if>
                                                                <xsl:if test="subj-group/subj-group/subject">
                                                                    <item>
                                                                        <xsl:value-of select="normalize-space(./subj-group/subj-group/subject)"/>
                                                                    </item>
                                                                </xsl:if>
                                                                <xsl:if test="subj-group/subj-group/subj-group/subject">
                                                                    <item>
                                                                        <xsl:value-of select="normalize-space(subj-group/subj-group/subj-group/subject)"/>
                                                                    </item>
                                                                </xsl:if>
                                                            </list>
                                                        </keywords>
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </textClass>
                                        </xsl:when>
                                        <xsl:when test="$docIssue//book-meta/book-categories[string-length() &gt; 0]">
                                            <textClass ana="journal-subject">
                                                <xsl:for-each select="$docIssue//book-meta/book-categories/subj-group">
                                                    <keywords scheme="journal-subject">
                                                        <list>
                                                            <xsl:apply-templates select="subject" mode="brepols"/>
                                                        </list>
                                                    </keywords>
                                                </xsl:for-each>
                                            </textClass>
                                        </xsl:when>
                                        <xsl:when test="book-meta/book-categories[string-length() &gt; 0] and not(contains(//publisher-name,'Gruyter'))">
                                            <textClass ana="book-subject">
                                                <xsl:for-each select="book-meta/book-categories/subj-group">
                                                    <keywords scheme="book-subject">
                                                        <list>
                                                            <xsl:apply-templates select="subject" mode="degruyter"/>
                                                        </list>
                                                    </keywords>
                                                </xsl:for-each>
                                            </textClass>
                                        </xsl:when>
                                        <xsl:when test="book-meta/kwd-group[string-length() &gt; 0]">
                                            <xsl:apply-templates select="book-meta/kwd-group"/>
                                        </xsl:when>
                                        <!-- ecco -->
                                        <xsl:when test="//module[string-length()&gt; 0]|//locSubjectHead[string-length() &gt; 0]">
                                            <textClass>
                                                <xsl:if test="//module[string-length()&gt; 0]">
                                                    <keywords ana="discipline">
                                                        <xsl:for-each select="//module">
                                                            <term>
                                                                <xsl:value-of select="normalize-space(.)"/>
                                                            </term>
                                                        </xsl:for-each>
                                                    </keywords>
                                                </xsl:if>
                                                <xsl:if test="//locSubjectHead[string-length()&gt; 0]">
                                                    <xsl:for-each select="//locSubjectHead">
                                                        <keywords ana="subject">
                                                            <xsl:choose>
                                                                <xsl:when test="@type='geographicalLocation'">
                                                                    <xsl:attribute name="source">
                                                                        <xsl:value-of select="@type"/>
                                                                    </xsl:attribute>
                                                                    <xsl:if test="locSubject[@subField='y'] | locSubject[@subField='a']">
                                                                        <term type="geographical">
                                                                                <xsl:value-of select="locSubject[@subField='y'] | locSubject[@subField='a']"/>
                                                                        </term>
                                                                    </xsl:if>
                                                                    <xsl:if test="locSubject[@subField='x']">
                                                                        <term>
                                                                            <xsl:value-of select="locSubject[@subField='x']"/>
                                                                        </term>
                                                                    </xsl:if>
                                                                    <xsl:if test="locSubject[@subField='v']">
                                                                        <term type="genre">
                                                                            <xsl:value-of select="locSubject[@subField='v']"/>
                                                                        </term>
                                                                    </xsl:if>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:attribute name="source">
                                                                        <xsl:value-of select="@type"/>
                                                                    </xsl:attribute>
                                                                    <xsl:attribute name="scheme">#LCSH</xsl:attribute>
                                                                    <term>
                                                                        <xsl:value-of select="normalize-space(locSubject[@subField='a'])"/>
                                                                    </term>
                                                                </xsl:otherwise>
                                                            </xsl:choose> 
                                                        </keywords>
                                                    </xsl:for-each>
                                                </xsl:if>
                                            </textClass>
                                            <xsl:if test="$langEcco">
                                                <xsl:choose>
                                                    <xsl:when test="//language='French|English'">
                                                        <langUsage>
                                                            <language>
                                                                <xsl:attribute name="ident">
                                                                    <xsl:text>fr</xsl:text>
                                                                </xsl:attribute>
                                                            </language>
                                                            <language>
                                                                <xsl:attribute name="ident">
                                                                    <xsl:text>en</xsl:text>
                                                                </xsl:attribute>
                                                            </language>
                                                        </langUsage>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <langUsage>
                                                            <language>
                                                                <xsl:attribute name="ident">
                                                                    <xsl:value-of select="$langEcco"/>
                                                                </xsl:attribute>
                                                            </language>
                                                        </langUsage>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:if>
                                        </xsl:when>
                                    </xsl:choose>
                                    <!-- language -->
                                    <xsl:choose>
                                        <xsl:when test="$codeLang !=''">
                                            <langUsage>
                                                <language>
                                                    <xsl:attribute name="ident">
                                                        <xsl:value-of select="$codeLang"/>
                                                    </xsl:attribute>
                                                </language>
                                            </langUsage>
                                        </xsl:when>
                                        <xsl:when test="//book-part[not(body/book-part)]/book-part-meta/title-group/title[1]/@xml:lang">
                                            <langUsage>
                                                <language>
                                                    <xsl:attribute name="ident">
                                                        <xsl:value-of select="//book-part[not(body/book-part)]/book-part-meta/title-group/title[1]/@xml:lang"/>
                                                    </xsl:attribute>
                                                </language>
                                            </langUsage>
                                        </xsl:when>
                                        <xsl:when test="book-meta/volume[1]/@xml:lang">
                                            <langUsage>
                                                <language>
                                                    <xsl:attribute name="ident">
                                                        <xsl:value-of select="translate(book-meta/volume[1]/@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                    </xsl:attribute>
                                                </language>
                                            </langUsage>
                                        </xsl:when>
                                        <xsl:when test="$docIssue/book-meta/volume[1]/@xml:lang">
                                            <langUsage>
                                                <language>
                                                    <xsl:attribute name="ident">
                                                        <xsl:value-of select="translate($docIssue/book-meta/volume[1]/@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                    </xsl:attribute>
                                                </language>
                                            </langUsage>
                                        </xsl:when>
                                        <xsl:when test="book-meta/abstract[1]/@xml:lang">
                                            <langUsage>
                                                <language>
                                                    <xsl:attribute name="ident">
                                                        <xsl:value-of select="translate(book-meta/abstract[1]/@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                    </xsl:attribute>
                                                </language>
                                            </langUsage></xsl:when>
                                        <xsl:when test="//publisher-name='Cambridge University Press'">
                                            <!-- Cambridge-polit-sci langue par défaut "en"-->
                                            <langUsage>
                                                <language>
                                                    <xsl:attribute name="ident">en</xsl:attribute>
                                                </language>
                                            </langUsage>
                                        </xsl:when>
                                    </xsl:choose>
                                </profileDesc>
                            </xsl:when>
                            <xsl:otherwise>
                                <profileDesc>
                                    <langUsage>
                                        <xsl:choose>
                                            <xsl:when test="$codeLang">
                                                <language>
                                                    <xsl:attribute name="ident">
                                                        <xsl:value-of select="$codeLang"/>
                                                    </xsl:attribute>
                                                </language>
                                            </xsl:when>
                                            <xsl:when test="book/body/book-part/book-part-meta/book-part-id[@pub-id-type='doi']='10.1515/9783484970465.1.9'">
                                                <language>
                                                    <xsl:attribute name="ident">en</xsl:attribute>
                                                </language>
                                            </xsl:when>
                                            <xsl:when test="/book/metadata/title/@lang">
                                                <language>
                                                    <xsl:attribute name="ident">
                                                        <xsl:value-of select="translate(/book/metadata/title/@lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                    </xsl:attribute>
                                                </language>
                                            </xsl:when>
                                            <xsl:when test="/book/@xml:lang">
                                                <language>
                                                    <xsl:attribute name="ident">
                                                        <xsl:value-of select="translate(/book/@xml:lang,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
                                                    </xsl:attribute>
                                                </language>
                                            </xsl:when>
                                            <xsl:when test="//book-meta/book-id[@pub-id-type='doi']='10.1484/M.IPM-EB.5.112141'">
                                                <language>
                                                    <xsl:attribute name="ident">fr</xsl:attribute>
                                                </language>
                                            </xsl:when>
                                            <xsl:when test="//book-meta/book-id[@pub-id-type='doi']='10.1484/M.TEMA-EB.4.00775'">
                                                <language>
                                                    <xsl:attribute name="ident">en</xsl:attribute>
                                                </language>
                                            </xsl:when>
                                            <xsl:when test="//book-meta/book-id[@pub-id-type='doi']='10.1484/M.IPM-EB.4.2017034'">
                                                <language>
                                                    <xsl:attribute name="ident">la</xsl:attribute>
                                                </language>
                                            </xsl:when>
                                            <xsl:when test="//book-part[not(body/book-part)]/book-part-meta/title-group/title[1]/@xml:lang !=''">
                                                <language>
                                                    <xsl:attribute name="ident">
                                                        <xsl:value-of select="$codeLangTitle"/>
                                                    </xsl:attribute>
                                                </language>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <language>
                                                    <xsl:attribute name="ident">en</xsl:attribute>
                                                </language>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </langUsage>
                                </profileDesc>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- traceability -->
                        <revisionDesc>
                            <change when="{$releasedate}" who="istex" xml:id="pub2tei">formatting</change>
                        </revisionDesc>
                    </teiHeader>
                    <text>
                        <xsl:if test="//book-part[@book-part-type='part']/book-part-meta/title-group/title[string-length()&gt; 0]">
                            <front>
                                <titlePage>
                                    <docTitle>
                                        <titlePart>
                                            <xsl:if test="//book-part[@book-part-type='part']/book-part-meta/title-group/label[string-length()&gt; 0]">
                                                <xsl:value-of select="normalize-space(//book-part[@book-part-type='part']/book-part-meta/title-group/label)"/>
                                                <xsl:text> - </xsl:text>
                                            </xsl:if>
                                            <xsl:value-of select="normalize-space(//book-part[@book-part-type='part']/book-part-meta/title-group/title)"/>
                                        </titlePart>
                                    </docTitle>
                                </titlePage>
                            </front>
                        </xsl:if>
                        <body>
                            <xsl:choose>
                                <!-- brill-ebooks -->
                                <xsl:when test="//book-part[not(body/book-part)]/body">
                                    <xsl:apply-templates select="//book-part[not(body/book-part)]/body"/>
                                </xsl:when>
                                <xsl:when test="//book/body/book-part/body">
                                    <xsl:apply-templates select="/book/body/book-part/body"/>
                                </xsl:when>
                                <xsl:when test="//book/book-body/book-part/body">
                                    <xsl:apply-templates select="//book/book-body/book-part/body"/>
                                </xsl:when>
                                <!-- cup-ebooks -->
                                <xsl:when test="//front-matter/ack | //front-matter//named-book-part-body |//front-matter/toc|//front-matter/glossary ">
                                    <xsl:apply-templates select="//front-matter/*  "/>
                                </xsl:when>
                                <xsl:when test="//book-back/index |//book-back/app">
                                    <xsl:apply-templates select="//book-back/*"/>
                                </xsl:when>
                                <!-- fin cup-ebooks -->
                                <xsl:otherwise>
                                    <div>
                                        <xsl:choose>
                                            <!-- ecco -->
                                            <xsl:when test="/book/text/page/pageContent/p[string-length()&gt; 0]">
                                                <xsl:apply-templates select="/book/text/page/pageContent/p"/>
                                            </xsl:when>
                                            <xsl:when test="string-length($rawfulltextpath) &gt; 0">
                                                <p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <p></p>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </div>
                                </xsl:otherwise>
                            </xsl:choose>
                        </body>
                        <xsl:choose> 
                            <xsl:when test="//book/body/book-part/back">
                                <back>
                                    <xsl:apply-templates select="//book/body/book-part/back/*"/>
                                </back>
                            </xsl:when>
                            <xsl:when test="//back">
                                <back>
                                    <!-- brill-ebooks-->
                                    <xsl:apply-templates select="//back/*"/>
                                </back>
                            </xsl:when>
                           
                        </xsl:choose>
                    </text>
                </xsl:otherwise>
            </xsl:choose>
        </TEI>
    </xsl:template>

    <!-- Building the sourceDesc bibliographical representation -->
    <xsl:template match="book-part" mode="sourceDesc">
        <biblStruct>
            <analytic>
                <!-- Title information related to the chapter goes here -->
                <xsl:apply-templates select="//body/book-part/book-part-meta/title-group/title"/>
                <!-- All authors are included here -->
                <xsl:apply-templates select="//body/book-part/book-part-meta/contrib-group/contrib"/>
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
                <xsl:if test="//body/book-part/book-part-meta/book-part-id[@pub-id-type='doi'] | //book-part[not(body/book-part)]/book-part-meta/book-part-id[@book-part-id-type='doi']">
                    <idno type="DOI">
                        <xsl:value-of select="//body/book-part/book-part-meta/book-part-id[@pub-id-type='doi'] | //book-part[not(body/book-part)]/book-part-meta/book-part-id[@book-part-id-type='doi']"/>
                    </idno>
                </xsl:if>
                <xsl:if test="//book-part-meta/alternate-form">
                    <xsl:for-each select="//book-part-meta/alternate-form">
                        <idno type="{@alternate-form-type}">
                            <xsl:value-of select="normalize-space(@xlink:href)"/>
                        </idno>
                    </xsl:for-each>
                </xsl:if>
            </analytic>
            <monogr>
                <xsl:apply-templates select="//book/book-meta/book-title-group/book-title"/>
                <xsl:apply-templates select="//book/book-meta/book-title-group/subtitle" mode="monogr"/>
                <xsl:if test="$docIssue//book-meta/isbn[@pub-type='ppub'] | //book/book-meta/isbn[@pub-type='ppub']">
                    <idno type="ISBN">
                        <xsl:value-of select="$docIssue//book-meta/isbn[@pub-type='ppub'] | //book/book-meta/isbn[@pub-type='ppub']"/>
                    </idno>
                </xsl:if>
                <xsl:if test="$docIssue//book-meta/isbn[@pub-type='epub'] | //book/book-meta/isbn[@pub-type='epub']">
                    <idno type="eISBN">
                        <xsl:value-of select="$docIssue//book-meta/isbn[@pub-type='epub'] | //book/book-meta/isbn[@pub-type='epub']"/>
                    </idno>
                </xsl:if>
                <xsl:if test="//book/book-meta/book-id[@pub-id-type='doi']">
                    <idno type="DOI">
                        <xsl:value-of select="//book/book-meta/book-id[@pub-id-type='doi']"/>
                    </idno>
                </xsl:if>
                <xsl:apply-templates select="//body/book-part/book-part-meta/book-part-id[@pub-id-type='doi']"/>
                <xsl:apply-templates select="$docIssue//book-meta/counts/page-count"/>
                <xsl:apply-templates select="//body/book-part/book-part-meta/counts"/>
                <xsl:apply-templates select="$docIssue//book-meta/contrib-group/contrib"/>
                <xsl:apply-templates select="//book/book-meta/contrib-group/contrib"/>
                <imprint>
                    <!-- publisher-->
                    <xsl:apply-templates select="$docIssue//book-meta/publisher"/>
                    <!-- traiter volume numéro pubdate depuis fichier externe -->
                    <xsl:choose>
                        <xsl:when test="$docIssue//book-meta/pub-date/year">
                            <xsl:apply-templates select="$docIssue//book-meta/pub-date/year"/>
                        </xsl:when>
                        <xsl:when test="$docIssue//body/book-meta/pub-date/year">
                            <xsl:apply-templates select="$docIssue//body/book-meta/pub-date/year"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="//book/book-meta/volume[1]">
                            <xsl:apply-templates select="//book/book-meta/volume [1]"/>
                        </xsl:when>
                        <xsl:when test="$docIssue//book-meta/volume">
                            <xsl:apply-templates select="$docIssue//book-meta/volume"/>
                        </xsl:when>
                        <xsl:when test="$docIssue//body/book-meta/volume">
                            <xsl:apply-templates select="$docIssue//body/book-meta/volume"/>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:apply-templates select="//body/book-part/book-part-meta/fpage"/>
                    <xsl:apply-templates select="//body/book-part/book-part-meta/lpage"/>
                </imprint>
            </monogr>
            <!-- faire un if et gérer le niveau série dans fichier externe -->
            <xsl:choose>
                <!-- traitement degruyter ebooks special 
                exemple 10.1515/9781501504396-->
                <xsl:when test="contains(/book/book-meta/book-title-group/book-title,'Homer’s Iliad')">
                    <series>
                        <title level="s" type="main">
                            <xsl:value-of select="/book/book-meta/book-title-group/book-title"/>
                        </title>
                        <editor>
                            <persName>
                                <surname>Bierl</surname>
                                <forename type="first">Anton</forename>
                            </persName>
                        </editor>
                        <editor>
                            <persName>
                                <surname>Joachim Latacz</surname>
                                <forename type="first">Joachim</forename>
                            </persName>
                        </editor>
                    </series>
                </xsl:when>
                <xsl:when test="$docIssue//book-series-meta/book-title-group/book-title">
                    <series>
                        <xsl:apply-templates select="$docIssue//book-series-meta/book-title-group/book-title"/>
                        <xsl:apply-templates select="SeriesInfo/SeriesTitle"/>
                        <xsl:apply-templates select="SeriesInfo/SeriesPrintISSN"/>
                        <xsl:apply-templates select="SeriesInfo/SeriesElectronicISSN"/>
                        <xsl:apply-templates select="$docIssue//book-series-meta/book-id[@pub-id-type='doi']"/>
                    </series>
                </xsl:when>
                <xsl:when test="//book/book-series-meta/book-id">
                    <series>
                        <xsl:variable name="titreSerieDG">
                            <xsl:choose>
                                <xsl:when test="/book/book-series-meta/book-id[@pub-id-type='doi']='10.1515/ba'">Byzantinisches Archiv</xsl:when>
                                <xsl:when test="/book/book-series-meta/book-id[@pub-id-type='doi']='10.1515/icon'">Image &amp; Context</xsl:when>
                                <xsl:when test="/book/book-meta/book-id[@pub-id-type='doi']='10.1515/9783110942330' or /book/book-meta/book-id[@pub-id-type='doi']='10.1515/9783110634211'">Berliner Griechische Urkunden</xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="issnSerieDG">
                            <xsl:choose>
                                <xsl:when test="/book/book-series-meta/book-id[@pub-id-type='doi']='10.1515/ba'">1864-9785</xsl:when>
                                <xsl:when test="/book/book-series-meta/book-id[@pub-id-type='doi']='10.1515/icon'">1868-4777</xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:variable name="eissnSerieDG">
                            <xsl:choose>
                                <xsl:when test="/book/book-series-meta/book-id[@pub-id-type='doi']='10.1515/ba'">2366-7052</xsl:when>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:if test="contains(/book/book-series-meta/book-id[@pub-id-type='doi'],'10.1515/')">
                            <title level="s" type="main">
                                <xsl:value-of select="$titreSerieDG"/>
                            </title>
                            <xsl:if test="$issnSerieDG !=''">
                            <idno type="ISSN">
                                <xsl:value-of select="$issnSerieDG"/>
                            </idno>
                            </xsl:if>
                            <xsl:if test="$eissnSerieDG !=''">
                            <idno type="eISSN">
                                <xsl:value-of select="$eissnSerieDG"/>
                            </idno>
                            </xsl:if>
                       </xsl:if>
                        <xsl:apply-templates select="//book/book-series-meta/book-id[@pub-id-type='doi']"/>
                    </series>
                </xsl:when>
            </xsl:choose>
        </biblStruct>
    </xsl:template>
    
    <!-- Building the sourceDesc bibliographical representation -->
    <xsl:template match="book" mode="editor">
        <biblStruct>
            <!-- Genre     -->
            <xsl:if test="@type[string-length()&gt; 0]">
                <xsl:attribute name="type">
                    <xsl:value-of select="normalize-space(@type)"/>
                </xsl:attribute>
            </xsl:if>
            <analytic>
                <!-- Title information related to the paper goes here -->
                <xsl:choose>
                    <xsl:when test="//book/entryGroup/entry/headGroup/head[string-length()&gt; 0]">
                        <title level="a" type="main">
                            <xsl:if test="//book/entryGroup/entry/headGroup/label[string-length()&gt; 0]">
                                <xsl:value-of select="/book/entryGroup/entry/headGroup/label"/>
                                <xsl:text> - </xsl:text>
                            </xsl:if>
                            <xsl:value-of select="/book/entryGroup/entry/headGroup/head"/>
                        </title>
                    </xsl:when>
                    <xsl:when test="//book-part[not(body/book-part)]/book-part-meta[string-length()&gt; 0]">
                        <xsl:choose>
                            <xsl:when test="//book-part[not(body/book-part)]/book-part-meta/title-group/title[string-length()&gt; 0]">
                                <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/title-group/title"/>
                            </xsl:when>
                            <xsl:otherwise> 
                                <!-- cambridge titre vide prendre type de contenu -->
                                <title level="a" type="main">
                                    <xsl:value-of select="translate(//book-part[not(body/book-part)]/@book-part-type,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/> 
                                </title>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="/book/book-body/book-part/book-part-meta/title-group/title[string-length()&gt; 0]">
                        <xsl:apply-templates select="/book/book-body/book-part/book-part-meta/title-group/title"/>
                    </xsl:when>
                    <xsl:when test="book-meta/book-title-group/book-title">
                        <xsl:apply-templates select="book-meta/book-title-group/book-title" mode="analytic"/>
                    </xsl:when>
                    <!-- ecco -->
                    <xsl:when test="citation/titleGroup/fullTitle[string-length()&gt; 0]">
                        <title level="a" type="main" xml:lang="{$langEcco}">
                            <xsl:value-of select="citation/titleGroup/fullTitle"/>
                        </title>
                    </xsl:when>
                </xsl:choose>
                
                
                <!-- All authors are included here -->
                <xsl:choose>
                    <xsl:when test="//book-part[not(body/book-part)]/book-part-meta/contrib-group/contrib[@contrib-type='author']/name[string-length()&gt; 0]">
                        <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/contrib-group/contrib[@contrib-type='author']"/>
                    </xsl:when>
                    <xsl:when test="/book/book-meta/contrib-group/contrib[@contrib-type='editor']">
                        <xsl:apply-templates select="/book/book-meta/contrib-group/contrib[@contrib-type='editor']" mode="analytic"/>
                    </xsl:when>
                    <xsl:when test="//metadata/author[string-length()&gt; 0]">
                        <xsl:apply-templates select="//metadata/author"/>
                    </xsl:when>
                    <xsl:when test="//metadata/author[string-length()&gt; 0]">
                        <xsl:apply-templates select="//metadata/author"/>
                    </xsl:when>
                    <xsl:when test="/book/citation/authorGroup/author[string-length()&gt; 0]">
                        <xsl:apply-templates select="/book/citation/authorGroup/author"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="$docIssue/book/book-meta/contrib-group/contrib[@contrib-type = 'author']/name [string-length() &gt; 0]">
                                <xsl:apply-templates select="$docIssue//book/book-meta/contrib-group/contrib[@contrib-type = 'author']"/>
                            </xsl:when>
                       <xsl:otherwise>
                           <xsl:apply-templates select="book-meta/contrib-group"/>
                       </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
                
                
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
                <!-- ecco -->
                <xsl:if
                    test="//ESTCID[string-length() &gt; 0 ]">
                    <idno>
                        <xsl:attribute name="type">ESTCID</xsl:attribute>
                        <xsl:value-of select="//ESTCID"/>
                    </idno>
                </xsl:if>
                <xsl:if
                    test="//bookInfo/documentID[string-length() &gt; 0 ]">
                    <idno>
                        <xsl:attribute name="type">documentID</xsl:attribute>
                        <xsl:value-of select="//bookInfo/documentID"/>
                    </idno>
                </xsl:if>
                <xsl:if
                    test="//bookInfo/unit[string-length() &gt; 0 ]">
                    <idno>
                        <xsl:attribute name="type">local</xsl:attribute>
                        <xsl:value-of select="//bookInfo/unit"/>
                    </idno>
                </xsl:if>
                <xsl:if test="/book/entryGroup/entry/identifier[string-length() &gt; 0]">
                    <xsl:for-each select="/book/entryGroup/entry/identifier">
                        <idno type="{translate(@type,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')}">
                            <xsl:value-of select="normalize-space(.)"/>
                        </idno>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="//entryGroup/@id[string-length() &gt; 0]">
                    <idno type="ArticleID">
                        <xsl:value-of select="normalize-space(//entryGroup/@id)"/>
                    </idno>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="//book-part[not(body/book-part)]/book-part-meta">
                        <xsl:choose>
                            <xsl:when test="//book-part[not(body/book-part)]/book-part-meta/book-part-id[@book-part-id-type='doi']|//book-part[not(body/book-part)]/book-part-meta/book-part-id[@pub-id-type='doi']">
                                <idno type="DOI">
                                    <xsl:value-of select="normalize-space(//book-part[not(body/book-part)]/book-part-meta/book-part-id[@book-part-id-type='doi']|//book-part[not(body/book-part)]/book-part-meta/book-part-id[@pub-id-type='doi'])"/>
                                </idno>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="/book/body/book-part/book-part-meta/book-part-id[@pub-id-type='doi']">
                        <idno type="DOI">
                            <xsl:value-of select="normalize-space(/book/body/book-part/book-part-meta/book-part-id[@pub-id-type='doi'])"/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="/book/book-body/book-part/book-part-meta/book-part-id[@book-part-id-type='doi']">
                        <idno type="DOI">
                            <xsl:value-of select="normalize-space(/book/book-body/book-part/book-part-meta/book-part-id[@book-part-id-type='doi'])"/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="/book/book-body/book-part/book-part-meta/book-part-id[@book-part-id-type='doi']|book/body/book-part/book-part-meta/book-part-id[@pub-id-type='doi']">
                        <idno type="DOI">
                            <xsl:value-of select="normalize-space(/book/book-body/book-part/book-part-meta/book-part-id[@book-part-id-type='doi']|book/body/book-part/book-part-meta/book-part-id[@pub-id-type='doi'])"/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="book-meta/book-id[string-length() &gt; 0]">
                        <xsl:for-each select="book-meta/book-id">
                            <idno type="{translate(@book-id-type,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')}">
                                <xsl:choose>
                                    <xsl:when test="@book-id-type='doi'[string-length() &gt; 0]">
                                        <xsl:choose>
                                            <xsl:when test="starts-with(.,'10')">
                                                <xsl:value-of select="normalize-space(.)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>10.14375/NP.</xsl:text>
                                                <xsl:value-of select="normalize-space(@book-id-type)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </idno>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="//book-part[not(body/book-part)]/book-part-meta/self-uri">
                        <idno type="URI">
                            <xsl:value-of select="//book-part[not(body/book-part)]/book-part-meta/self-uri"/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="book-meta/self-uri">
                        <xsl:for-each select="book-meta/self-uri">
                            <idno>
                                <xsl:if test="@content-type">
                                    <xsl:attribute name="type">
                                        <xsl:value-of select="normalize-space(@content-type)"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="contains(.,'http://dx.doi.org/')">
                                    <xsl:attribute name="type">URI-DOI</xsl:attribute>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="@xlink:href">
                                        <xsl:value-of select="normalize-space(@xlink:href)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="."/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </idno>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="//toc/item/@id[string-length() &gt; 0]">
                    <xsl:for-each select="//toc/item/@id">
                        <idno>
                            <xsl:attribute name="type">ArticleNumber</xsl:attribute>
                            <xsl:value-of select="normalize-space(.)"/>
                        </idno>
                    </xsl:for-each>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="//book-part[not(body/book-part)]/@id[string-length() &gt; 0]">
                        <idno>
                            <xsl:attribute name="type">chapterID</xsl:attribute>
                            <xsl:value-of select="normalize-space(//book-part[not(body/book-part)]/@id)"/>
                        </idno>
                    </xsl:when><xsl:when test="$docIssue//book-part[not(body/book-part)]/@id[string-length() &gt; 0]">
                        <idno>
                            <xsl:attribute name="type">chapterID</xsl:attribute>
                            <xsl:value-of select="normalize-space($docIssue//book-part[not(body/book-part)]/@id)"/>
                        </idno>
                    </xsl:when>
                </xsl:choose>
                
            </analytic>
            <monogr>
                <xsl:choose>
                    <xsl:when test="book-meta/book-title-group">
                        <xsl:apply-templates select="book-meta/book-title-group/book-title" mode="monogr"/>
                        <xsl:apply-templates select="book-meta/book-title-group/subtitle"/>
                    </xsl:when>
                    <!-- ecco -->
                    <xsl:when test="citation/titleGroup/fullTitle[string-length()&gt; 0]">
                        <title level="a" type="main">
                            <xsl:value-of select="citation/titleGroup/fullTitle"/>
                        </title>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="$docIssue/book-meta/book-title-group">
                            <xsl:apply-templates select="$docIssue/book-meta/book-title-group/book-title" mode="monogr"/>
                            <xsl:apply-templates select="$docIssue/book-meta/book-title-group/subtitle"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:apply-templates select="metadata/title"/>
                <xsl:apply-templates select="metadata/subtitle"/>

                <!-- ********************************** Identifier *******************************-->
                
                <!--reel ID number-->
                <xsl:if test="//bookInfo/reel[string-length() &gt; 0 ]">
                    <idno>
                        <xsl:attribute name="type">reel_ID_number</xsl:attribute>
                        <xsl:value-of select="//bookInfo/reel"/>
                    </idno>
                </xsl:if>
                <xsl:if test="//SeriesElectronicISSN[string-length() &gt; 0 ]">
                    <idno>
                        <xsl:attribute name="type">eISSN</xsl:attribute>
                        <xsl:value-of select="//SeriesElectronicISSN"/>
                    </idno>
                </xsl:if>
                <xsl:if test="//bookInfo/mcode[string-length() &gt; 0 ]">
                    <idno>
                        <xsl:attribute name="type">mcode</xsl:attribute>
                        <xsl:value-of select="//bookInfo/mcode"/>
                    </idno>
                </xsl:if>
                <xsl:if test="//bookInfo/unit[string-length() &gt; 0 ]">
                    <idno>
                        <xsl:attribute name="type">local</xsl:attribute>
                        <xsl:value-of select="//bookInfo/unit"/>
                    </idno>
                </xsl:if>
                <xsl:if
                    test="//ESTCID[string-length() &gt; 0 ]">
                    <idno>
                        <xsl:attribute name="type">ESTCID</xsl:attribute>
                        <xsl:value-of select="//ESTCID"/>
                    </idno>
                </xsl:if>
                <xsl:if
                    test="//bookInfo/documentID[string-length() &gt; 0 ]">
                    <idno>
                        <xsl:attribute name="type">documentID</xsl:attribute>
                        <xsl:value-of select="//bookInfo/documentID"/>
                    </idno>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="book-meta/isbn[string-length() &gt; 0]">
                        <xsl:for-each select="book-meta/isbn">
                            <xsl:choose>
                                <xsl:when test="@publication-format='online' or @publication-format='electronic' or @pub-type='epub'">
                                    <idno type='eISBN'>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </idno>
                                </xsl:when>
                                <xsl:when test="@publication-format='hardback'">
                                    <idno type='hISBN'>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </idno>
                                </xsl:when>
                                <xsl:otherwise>
                                    <idno type='ISBN'>
                                        <xsl:if test="@content-type[string-length() &gt; 0]">
                                            <xsl:attribute name="subtype">
                                                <xsl:value-of select="@content-type"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </idno>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="$docIssue//book-meta/isbn[string-length() &gt; 0]">
                        <xsl:for-each select="$docIssue//book-meta/isbn">
                            <xsl:choose>
                                <xsl:when test="@publication-format='online' or @publication-format='electronic' or @pub-type='epub'">
                                    <idno type='eISBN'>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </idno>
                                </xsl:when>
                                <xsl:when test="@publication-format='hardback'">
                                    <idno type='hISBN'>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </idno>
                                </xsl:when>
                                <xsl:otherwise>
                                    <idno type='ISBN'>
                                        <xsl:if test="@content-type[string-length() &gt; 0]">
                                            <xsl:attribute name="subtype">
                                                <xsl:value-of select="@content-type"/>
                                            </xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </idno>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:when>
                </xsl:choose>
                
                <xsl:if test="metadata/isbn[string-length() &gt; 0]">
                    <xsl:for-each select="metadata/isbn">
                        <idno type="ISBN">
                            <xsl:value-of select="normalize-space(.)"/>
                        </idno>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="/book/@id[string-length() &gt; 0]">
                    <idno type="bookID">
                        <xsl:value-of select="normalize-space(/book/@id)"/>
                    </idno>
                </xsl:if>
                <xsl:if test="/book/metadata/identifier[string-length() &gt; 0]">
                    <xsl:for-each select="/book/metadata/identifier">
                        <idno type="{translate(@type,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')}">
                            <xsl:value-of select="normalize-space(.)"/>
                        </idno>
                    </xsl:for-each>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="/book/book-meta/book-id[@book-id-type='doi'] | /book/book-meta/book-id[@pub-id-type='doi']">
                        <idno type="DOI">
                            <xsl:value-of select="normalize-space(/book/book-meta/book-id[@book-id-type='doi'] | /book/book-meta/book-id[@pub-id-type='doi'])"/>
                        </idno>
                    </xsl:when>
                    <xsl:when test="$docIssue/book/book-meta/book-id[@book-id-type='doi'] | $docIssue/book/book-meta/book-id[@pub-id-type='doi']">
                        <idno type="DOI">
                            <xsl:value-of select="normalize-space($docIssue/book/book-meta/book-id[@book-id-type='doi'] | $docIssue/book/book-meta/book-id[@pub-id-type='doi'])"/>
                        </idno>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="book-meta/self-uri">
                    <xsl:for-each select="book-meta/self-uri">
                        <idno>
                            <xsl:if test="@content-type">
                                <xsl:attribute name="type">
                                    <xsl:value-of select="normalize-space(@content-type)"/>
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:if test="contains(.,'http://dx.doi.org/')">
                                <xsl:attribute name="type">URI-DOI</xsl:attribute>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="@xlink:href">
                                    <xsl:value-of select="normalize-space(@xlink:href)"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="."/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </idno>
                    </xsl:for-each>
                </xsl:if>
                <!-- All authors are included here -->
                <xsl:choose>
                    <xsl:when test="/book/book-meta/contrib-group/contrib[@contrib-type='editor'] |/book/book-meta/contrib-group/contrib[@contrib-type='volume editor']">
                        <xsl:apply-templates select="/book/book-meta/contrib-group/contrib[@contrib-type='editor'] |/book/book-meta/contrib-group/contrib[@contrib-type='volume editor']" mode="editor"/>       
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="/book/book-meta/contrib-group" mode="monogr"/>
                    </xsl:otherwise>
                </xsl:choose>


                <imprint>
                    <xsl:choose>
                        <xsl:when test="book-meta/publisher[1]/publisher-name | metadata/publisher|//imprintPublisher">
                            <publisher><xsl:value-of select="book-meta/publisher[1]/publisher-name |metadata/publisher|//imprintPublisher"/></publisher>
                        </xsl:when>
                        <xsl:when test="$docIssue/book-meta/publisher[1]/publisher-name">
                            <publisher><xsl:value-of select="$docIssue/book-meta/publisher[1]/publisher-name"/></publisher>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="$docIssue/book-meta/publisher[1]/publisher-loc | book-meta/publisher[1]/publisher-loc | metadata/pubPlace |//publicationPlace[string-length()&gt; 0]">
                            <pubPlace>
                                <xsl:choose>
                                    <xsl:when test="book-meta/publisher[1]/publisher-loc='Cambridge'">UK</xsl:when>
                                    <xsl:when test="book-meta/publisher[1]/publisher-loc | metadata/pubPlace|//publicationPlace[string-length()&gt; 0]">
                                        <xsl:value-of select="book-meta/publisher[1]/publisher-loc | metadata/pubPlace|//publicationPlace"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="$docIssue/book-meta/publisher[1]/publisher-loc"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </pubPlace>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <!-- ecco -->
                        <xsl:when test="//bookInfo/pubDate">
                            <date type="published">
                                <xsl:attribute name="when">
                                    <xsl:call-template name="dateEcco"/>
                                </xsl:attribute>
                                <xsl:call-template name="dateEcco"/>
                            </date>
                        </xsl:when>
                        <xsl:when test="book-meta/pub-date[@publication-format='print']/year[string-length() &gt; 0]">
                            <date type="published">
                                <xsl:attribute name="when">
                                    <xsl:value-of select="book-meta/pub-date[@publication-format='print']/year"/>
                                </xsl:attribute>
                                <xsl:value-of select="book-meta/pub-date[@publication-format='print']/year"/>
                            </date>
                        </xsl:when>
                        <xsl:when test="book-meta/pub-date/year">
                            <date type="published">
                                <xsl:attribute name="when">
                                    <xsl:value-of select="normalize-space(book-meta/pub-date[1]/year)"/>
                                </xsl:attribute>
                                <xsl:value-of select="normalize-space(book-meta/pub-date[1]/year)"/>
                            </date>
                        </xsl:when>
                        <xsl:when test="$docIssue/book-meta/pub-date/year">
                            <date type="published">
                                <xsl:attribute name="when">
                                    <xsl:value-of select="normalize-space($docIssue/book-meta/pub-date[1]/year)"/>
                                </xsl:attribute>
                                <xsl:value-of select="normalize-space($docIssue/book-meta/pub-date[1]/year)"/>
                            </date>
                        </xsl:when>
                        <xsl:when test="//metadata/pubDate[string-length() &gt; 0] != 'na'">
                            <date type="published">
                                <xsl:attribute name="when">
                                    <xsl:value-of select="//metadata/pubDate"/>
                                </xsl:attribute>
                                <xsl:value-of select="//metadata/pubDate"/>
                            </date>
                        </xsl:when>
                        <xsl:when test="/book/book-meta/pub-history/event/date[@publication-format='print']/year"><xsl:apply-templates select="/book/book-meta/pub-history/event/date[@publication-format='print']/year"/></xsl:when>
                        <xsl:when test="/book/book-meta/pub-history/event/date[@publication-format='print']/year"><xsl:apply-templates select="/book/book-meta/pub-history/event/date[@publication-format='online']/year"/></xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="//metadata/date[@type='course'][string-length() &gt; 0] != 'na'">
                                <date type="published">
                                    <xsl:attribute name="when">
                                        <xsl:value-of select="//metadata/date[@type='course']"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="//metadata/date[@type='course']"/>
                                </date>   
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="/book/collection-meta[2]/volume-in-collection/volume-number">
                            <biblScope unit="vol">
                                <xsl:value-of select="/book/collection-meta[2]/volume-in-collection/volume-number"/>
                            </biblScope>
                        </xsl:when>
                        <!-- degruyter -->
                        <xsl:when test="/book/book-meta/volume[1]">
                            <biblScope unit="vol">
                                <xsl:choose>
                                    <xsl:when test="contains(/book/book-meta/volume[1],' ')">
                                        <xsl:value-of select="substring-after(/book/book-meta/volume[1],' ')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="/book/book-meta/volume[1]"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </biblScope>
                        </xsl:when>
                        <xsl:when test="$docIssue/book/book-meta/volume[1]">
                            <biblScope unit="vol">
                                <xsl:value-of select="substring-after($docIssue/book/book-meta/volume[1],' ')"/>
                            </biblScope>
                        </xsl:when>
                        <xsl:when test="//citation/volumeGroup/currentVolume[string-length() &gt; 0 ] !='0'">
                            <biblScope unit="vol">
                                <xsl:if test="//citation/volumeGroup/volumeSet/filmedVolume[string-length() &gt; 0 ]">
                                    <xsl:value-of select="normalize-space(translate(//citation/volumeGroup/volumeSet/filmedVolume,'Volume',''))"/>
                                    <xsl:text>-</xsl:text>
                                </xsl:if>
                                <xsl:value-of select="normalize-space(translate(//citation/volumeGroup/currentVolume,'Volume',''))"/>
                            </biblScope>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="/book/collection-meta/volume-in-collection/volume-number"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="//series[1]/@n[string-length() &gt; 0] and not(contains(//series[1]/@n,'978'))">
                            <biblScope unit="vol">
                                <xsl:choose>
                                    <xsl:when test="starts-with(//series[1]/@n, '00')">
                                        <xsl:value-of select="substring-after(//series[1]/@n,'00')"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with(//series[1]/@n, '0')">
                                        <xsl:value-of select="substring-after(//series[1]/@n,'0')"/>
                                    </xsl:when>
                                    <xsl:when test="starts-with(//series[1]/@n, '-')">
                                        <xsl:value-of select="substring-after(//series[1]/@n,'-')"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="//series[1]/@n"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </biblScope>
                        </xsl:when>
                    </xsl:choose>
                    <!-- ******************* pagination ******************************-->
                    <xsl:if test="//book/entryGroup/entry/@startpage[string-length() &gt; 0] | /book/book-body/book-part/book-part-meta/fpage[string-length() &gt; 0] |//book-part[not(body/book-part)]/book-part-meta/fpage[string-length() &gt; 0]">
                        <biblScope unit="page" from="{//book/entryGroup/entry/@startpage| /book/book-body/book-part/book-part-meta/fpage |//book-part[not(body/book-part)]/book-part-meta/fpage}">
                            <xsl:value-of select="//book/entryGroup/entry/@startpage| /book/book-body/book-part/book-part-meta/fpage |//book-part[not(body/book-part)]/book-part-meta/fpage"/>
                        </biblScope>
                        <biblScope unit="page" to="{//book/entryGroup/entry/@endpage| /book/book-body/book-part/book-part-meta/lpage |//book-part[not(body/book-part)]/book-part-meta/lpage}">
                            <xsl:value-of select="//book/entryGroup/entry/@endpage| /book/book-body/book-part/book-part-meta/lpage |//book-part[not(body/book-part)]/book-part-meta/lpage"/>
                        </biblScope>
                    </xsl:if>
                    <xsl:apply-templates select="book-meta/counts/book-page-count"/>
                    <xsl:apply-templates select="book-body/book-part/book-part-meta/counts/book-page-count"/>
                    <xsl:apply-templates select="//book-part[not(body/book-part)]/book-part-meta/counts/page-count"/>
                    
                    <xsl:if test="//citation/totalPages[string-length() &gt; 0 ]">
                        <biblScope unit="total-book-pages">
                            <xsl:value-of select="//citation/totalPages"/>
                        </biblScope>
                    </xsl:if>
                </imprint>
            </monogr>
                
            <xsl:apply-templates select="collection-meta"/>
            <xsl:choose>
                <xsl:when test="book-series-meta">
                    <xsl:apply-templates select="book-series-meta"/>
                </xsl:when>
                <xsl:when test="$docIssue/book-series-meta">
                    <xsl:apply-templates select="$docIssue/book-series-meta"/>
                </xsl:when>
            </xsl:choose>
            
            <xsl:if test="//metadata/series[string-length() &gt; 0]">
                <series>
                    <xsl:apply-templates select="//metadata/series"/>
                </series>
            </xsl:if>
            <xsl:if test="/book/book-meta/related-object">
                <xsl:apply-templates select="/book/book-meta/related-object"/>
            </xsl:if>
        </biblStruct>
    </xsl:template>
    <xsl:template match="//book-categories/subj-group">
        <keywords>
            <xsl:attribute name="scheme">
                <xsl:choose>
                    <xsl:when test="@subj-group-type">
                        <xsl:value-of select="@subj-group-type"/>
                    </xsl:when>
                    <xsl:otherwise>subject</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="subject/@code">
                    <list>
                        <xsl:apply-templates/>
                    </list>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </keywords>
    </xsl:template>
    <xsl:template match="//book-categories/subj-group/subject">
        <xsl:choose>
            <xsl:when test="@code">
                <label>
                    <xsl:value-of select="@code"/>
                </label>
                <item>
                    <xsl:apply-templates/>
                </item>
            </xsl:when>
            <xsl:otherwise>
                <term>
                    <xsl:apply-templates/>
                </term>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="//book-categories/subj-group/subject" mode="brepols">
        <xsl:choose>
            <xsl:when test="@code">
                <item>
                <label>
                    <xsl:value-of select="@code"/>
                </label>
                <term>
                    <xsl:apply-templates/>
                </term>
                </item>
            </xsl:when>
            <xsl:otherwise>
                <term>
                    <xsl:apply-templates/>
                </term>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="//book-categories/subj-group/subject" mode="degruyter">
        <item>
            <xsl:attribute name="xml:id">
                <xsl:value-of select="."/>
            </xsl:attribute>
            <term>
            <xsl:call-template name="identifySubjectCode">
                <xsl:with-param name="theCode">
                    <xsl:value-of select="."/>
                </xsl:with-param>
            </xsl:call-template>
            </term>
        </item>
    </xsl:template>
    
    <!-- Numérique Premium -->
    <!-- author related information -->
  <xsl:template match="book-meta/contrib-group">
        <xsl:apply-templates select="contrib"/>
    </xsl:template>
    
    
    <!-- page-count-->
    <xsl:template match="book-meta/counts/book-page-count">
        <biblScope unit="page-count">
            <xsl:value-of select="@count"/>
        </biblScope>
    </xsl:template>
    <xsl:template match="book-body/book-part/book-part-meta/counts/book-page-count">
        <biblScope unit="chapter-count">
            <xsl:value-of select="@count"/>
        </biblScope>
    </xsl:template>
    
    <xsl:template match="contrib" mode="editorSeries">
        <xsl:choose>
            <xsl:when test="contains(x,'Edit')"/>
            <xsl:otherwise>
                <editor>
                    <xsl:apply-templates/>
                    <xsl:if test="@contrib-type[string-length() &gt; 0]">
                        <roleName>
                            <xsl:value-of select="@contrib-type"/>
                        </roleName>
                    </xsl:if>
                </editor>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    <xsl:template match="contrib" mode="editor">
        <editor>
            <xsl:variable name="i" select="position()-1"/>
            <xsl:variable name="editorNumber">
                <xsl:choose>
                    <xsl:when test="$i &lt; 10">
                        <xsl:value-of select="concat('editor-000', $i)"/>
                    </xsl:when>
                    <xsl:when test="$i &lt; 100">
                        <xsl:value-of select="concat('editor-00', $i)"/>
                    </xsl:when>
                    <xsl:when test="$i &lt; 1000">
                        <xsl:value-of select="concat('editor-0', $i)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('editor-', $i)"/>
                    </xsl:otherwise>
                </xsl:choose> 
            </xsl:variable>
            <xsl:if test="not(ancestor::sub-article | ancestor::ref)">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="$editorNumber"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
            <xsl:if test="@contrib-type[string-length() &gt; 0]">
                <roleName>
                    <xsl:value-of select="@contrib-type"/>
                </roleName>
            </xsl:if>
        </editor>
    </xsl:template>
    <xsl:template match="contrib" mode="author">
        <author>
            <xsl:variable name="i" select="position()-1"/>
            <xsl:variable name="authorNumber">
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
            </xsl:variable>
            <xsl:if test="not(ancestor::sub-article | ancestor::ref)">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="$authorNumber"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
            <xsl:if test="@contrib-type[string-length() &gt; 0]">
                <roleName>
                    <xsl:value-of select="@contrib-type"/>
                </roleName>
            </xsl:if>
        </author>
    </xsl:template>
    <xsl:template match="book-title" mode="analytic">
        <title level="a" type="main">
            <xsl:if test="@Language | @xml:lang">
                <xsl:attribute name="xml:lang">
                    <xsl:choose>
                        <xsl:when test="@Language='' or @xml:lang=''">
                            <xsl:text>en</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="Varia2ISO639">
                                <xsl:with-param name="code" select="@Language | @xml:lang"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    <xsl:template match="book-title" mode="monogr">
        <title level="m" type="main">
            <xsl:if test="@Language | @xml:lang">
                <xsl:attribute name="xml:lang">
                    <xsl:choose>
                        <xsl:when test="@Language='' or @xml:lang=''">
                            <xsl:text>en</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:call-template name="Varia2ISO639">
                                <xsl:with-param name="code" select="@Language | @xml:lang"/>
                            </xsl:call-template>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="/book/book-meta/isbn[@publication-format='online']='9789004301351' or /book/book-meta/isbn[@publication-format='online']='9789004295100'">
                    <xsl:text>Herodotus, Book II : </xsl:text>
                    <xsl:value-of select="/book/book-meta/book-title-group/book-title"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                </xsl:otherwise>
            </xsl:choose>
        </title>
    </xsl:template>
    
    <xsl:template match="contrib[@contrib-type = 'editor']" mode="analytic">
        <author>
            <xsl:variable name="i" select="position()-1"/>
            <xsl:variable name="authorNumber">
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
            </xsl:variable>
            <xsl:if test="not(ancestor::sub-article)">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="$authorNumber"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </author>
    </xsl:template>
    <xsl:template match="counts">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="page-count">
        <biblScope unit="page-count">
            <xsl:apply-templates select="@count"/>
        </biblScope>
    </xsl:template>
    <xsl:template match="publisher">
        <xsl:apply-templates select="publisher-name"/>
        <xsl:apply-templates select="publisher-loc"/>
    </xsl:template>
    <xsl:template match="persName">
        <persName>
            <xsl:apply-templates select="foreName"/>
            <xsl:apply-templates select="surname"/>
        </persName>
    </xsl:template>
    
    <!-- liens vers images externes en relation chez Cambridge ebooks -->
    <xsl:template match="related-object">
        <relatedItem>
            <xsl:if test="@content-type">
                <xsl:attribute name="type">
                    <xsl:value-of select="@content-type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@object-type">
                <xsl:attribute name="subtype">
                    <xsl:value-of select="@object-type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@xlink:href">
                <ref>
                    <xsl:value-of select="@xlink:href"/>
                </ref>
            </xsl:if>
        </relatedItem>
    </xsl:template>
    
    <xsl:template match="series">
        <title level="s" type="main">
            <xsl:if test="@lang">
                <xsl:attribute name="xml:lang">
                    <xsl:value-of select="@lang"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    
    <xsl:template match="target">
        <ptr target="#{@id}"/>
    </xsl:template>
    
    <xsl:template match="volume-in-collection/volume-number">
        <biblScope unit="vol">
            <xsl:apply-templates/>
        </biblScope>
    </xsl:template>
    <xsl:template match="collection-id">
        <idno type="collection-id">
            <xsl:apply-templates/>
        </idno>
    </xsl:template>
    <xsl:template match="collection-meta">
        <series>
            <xsl:choose>
                <xsl:when test="@collection-type='series'">
                    <xsl:attribute name="ana">series</xsl:attribute>
                </xsl:when>
                <xsl:when test="@collection-type='book-set'">
                    <xsl:attribute name="ana">sub-series</xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="title-group/title"/>
            <xsl:apply-templates select="title-group/subtitle"/>
            <xsl:apply-templates select="contrib-group/contrib" mode="editorSeries"/>
            <xsl:apply-templates select="issn"/>
            <xsl:apply-templates select="collection-id"/>
            <xsl:apply-templates select="volume-in-collection/volume-number"/>
        </series>
    </xsl:template>
    <xsl:template match="book-series-meta">
        <xsl:choose>
            <xsl:when test="$currentDoi='10.1515/monographs'"/>
            <xsl:when test="$currentDoi='10.1515/lecorfranz'"/>
            <xsl:otherwise>
                <series>
                    <xsl:choose>
                        <xsl:when test="series[string-length() &gt; 0] and issn">
                            <title level="s" type="main">
                                <xsl:value-of select="$currentTitle"/>
                            </title>
                            <idno type="ISSN">
                                <xsl:value-of select="issn"/>
                            </idno>
                            <xsl:if test="$currentDoi">
                                <idno type="DOI">
                                    <xsl:value-of select="$currentDoi"/>
                                </idno>
                            </xsl:if>
                            <xsl:if test="contrib-group[string-length() &gt; 0]">
                                <xsl:apply-templates select="contrib-group" mode="editorSeries"/>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="series[string-length() &gt; 0]">
                            <title level="s" type="main">
                                <xsl:value-of select="$collectionNames/descendant::tei:row[tei:cell[@role='name'] = $currentTitle]/tei:cell[@role = 'name']"/>
                            </title>
                            <idno type="ISSN">
                                <xsl:value-of select="$collectionNames/descendant::tei:row[tei:cell[@role='name'] = $currentTitle]/tei:cell[@role = 'issn']"/>
                            </idno>
                            <idno type="DOI">
                                <xsl:value-of select="$collectionNames/descendant::tei:row[tei:cell[@role='name'] = $currentTitle]/tei:cell[@role = 'doi']"/>
                            </idno>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="book-id[@pub-id-type='doi'][string-length() &gt; 0]">
                                <title level="s" type="main">
                                    <xsl:value-of select="$collectionNames/descendant::tei:row[tei:cell[@role='doi'] = $currentDoi]/tei:cell[@role = 'name']"/>
                                </title>
                                <idno type="ISSN">
                                    <xsl:value-of select="$collectionNames/descendant::tei:row[tei:cell[@role='doi'] = $currentDoi]/tei:cell[@role = 'issn']"/>
                                </idno>
                                <idno type="DOI">
                                    <xsl:value-of select="$currentDoi"/>
                                </idno>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </series>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- appendix -->
    <xsl:template match="app">
        <div type="appendix">
            <xsl:if test="label">
                <xsl:attribute name="n">
                    <xsl:value-of select="label"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <!-- index -->
    <xsl:template match="index">
        <div type="index">
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="index-div">
        <list>
            <xsl:apply-templates/>
        </list>
    </xsl:template>
    <xsl:template match="nav-pointer-group">
        <source>
            <xsl:apply-templates/>
        </source>
    </xsl:template>
    <xsl:template match="nav-pointer">
        <ptr type="page">
            <xsl:if test="@nav-pointer-type">
                <xsl:attribute name="type">
                    <xsl:value-of select="@nav-pointer-type"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="target">
                <xsl:apply-templates/>
            </xsl:attribute>
        </ptr>
    </xsl:template>
    <xsl:template match="front-matter-part">
        <div type="contributors">
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="preface">
        <div type="preface">
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="dedication">
        <div type="dedication">
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="foreword">
        <div type="foreword">
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="named-book-part-body">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="toc">
        <div type="contents">
            <xsl:if test="@id">
                <xsl:attribute name="xml:id">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </xsl:if>
            <list>
                <xsl:apply-templates/>
            </list>
        </div>
    </xsl:template>
    <!-- date ECCO -->
    <xsl:template name="dateEcco">
        <xsl:choose>
            <xsl:when test="//bookInfo/documentID='1685402300'">1757</xsl:when>
            <xsl:when test="//bookInfo/documentID='1310502800'">1792</xsl:when>
            <xsl:when test="//bookInfo/documentID='1661300900'">1716</xsl:when>
            <xsl:when test="//bookInfo/documentID='1289500301'">1700</xsl:when>
            <xsl:when test="//bookInfo/documentID='0060801400'">1772</xsl:when>
            <xsl:when test="//bookInfo/documentID='1299603100'">1794</xsl:when>
            <xsl:when test="//bookInfo/documentID='1685402600'">1777</xsl:when>
            <xsl:when test="//bookInfo/documentID='1544600201'">1798</xsl:when>
            <xsl:when test="//bookInfo/documentID='1657600300'">1793</xsl:when>
            <xsl:when test="//bookInfo/documentID='1679400300'">1720</xsl:when>
            <xsl:when test="//bookInfo/documentID='1661300600'">1718</xsl:when>
            <xsl:when test="//bookInfo/documentID='1661300800'">1718</xsl:when>
            <xsl:when test="//bookInfo/documentID='1685301900'">1738</xsl:when>
            <xsl:when test="//bookInfo/documentID='1661301000'">1719</xsl:when>
            <xsl:when test="//bookInfo/documentID='1633400500'">1755</xsl:when>
            <xsl:when test="//bookInfo/documentID='1434400200'">1793</xsl:when>
            <xsl:when test="//bookInfo/documentID='1701802300'">1784</xsl:when>
            <xsl:when test="//bookInfo/documentID='1444900100'">1771</xsl:when>
            <xsl:when test="//bookInfo/documentID='1654700700'">1771</xsl:when>
            <xsl:when test="//bookInfo/documentID='1309201101'">1740</xsl:when>
            <xsl:when test="//bookInfo/documentID='1712200500'">1776</xsl:when>
            <xsl:when test="//bookInfo/documentID='1661301100'">1742</xsl:when>
            <xsl:when test="//bookInfo/documentID='1719800900'">1700</xsl:when>
            <xsl:when test="//bookInfo/documentID='1289500501'">1744</xsl:when>
            <xsl:when test="//bookInfo/documentID='1572601000'">1737</xsl:when>
            <xsl:when test="//bookInfo/documentID='1429100400'">1764</xsl:when>
            <xsl:when test="//bookInfo/documentID='1346300900'">1784</xsl:when>
            <xsl:when test="//bookInfo/documentID='1493300106'">1776</xsl:when>
            <xsl:when test="//bookInfo/documentID='1493300108'">1776</xsl:when>
            <xsl:when test="//bookInfo/documentID='1493400110'">1776</xsl:when>
            <xsl:when test="//bookInfo/documentID='1493300104'">1776</xsl:when>
            <xsl:when test="//bookInfo/documentID='1493400111'">1776</xsl:when>
            <xsl:when test="//bookInfo/documentID='1289903503'">1793</xsl:when>
            <xsl:when test="//bookInfo/documentID='1290000106'">1793</xsl:when>
            <xsl:when test="//bookInfo/documentID='1290000105'">1793</xsl:when>
            <xsl:when test="//bookInfo/documentID='1290000104'">1793</xsl:when>
            <xsl:when test="//bookInfo/documentID='1710200600'">1728</xsl:when>
            <xsl:when test="//bookInfo/documentID='419801500'">1726</xsl:when>
            <xsl:when test="//bookInfo/documentID='154603700'">1792</xsl:when>
            <xsl:when test="//bookInfo/documentID='72900400'">1720</xsl:when>
            <xsl:when test="//bookInfo/documentID='531600300'">1733</xsl:when>
            <xsl:when test="//bookInfo/documentID='277000600'">1756</xsl:when>
            <xsl:when test="//bookInfo/documentID='0872200600'">1782</xsl:when>
            <xsl:when test="//bookInfo/documentID='0872200700'">1786</xsl:when>
            <xsl:when test="//bookInfo/documentID='0531600300'">1733</xsl:when>
            <xsl:when test="//bookInfo/documentID='0277000600'">1719</xsl:when>
            <xsl:when test="//bookInfo/documentID='0154603700'">1792</xsl:when>
            <xsl:otherwise>
                <xsl:variable name="date">
                    <xsl:value-of select="//pubDate"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="contains(//imprintYear,' [')">
                        <xsl:variable name="nettoie">
                            <xsl:value-of select="normalize-space(//imprintYear)"/> 
                        </xsl:variable>
                        <xsl:variable name="nettoie2">
                            <xsl:value-of select="substring-after($nettoie,' [')"/> 
                        </xsl:variable>
                        <xsl:variable name="nettoieFinal">
                            <xsl:value-of select="translate($nettoie2,'?]','')"/> 
                        </xsl:variable>
                        <xsl:value-of select="normalize-space($nettoieFinal)"/> 
                    </xsl:when>
                    <!-- ex: <pubDate>[?1789.]</pubDate> -->
                    <xsl:when test="contains(//pubDate,'[')">
                        <xsl:value-of select="normalize-space(translate(//pubDate,'[?]MDCLXIV.',''))"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring($date,1,4)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
