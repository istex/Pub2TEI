<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
	xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:marc="http://www.loc.gov/MARC21/slim"  xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="#all">
	<xsl:output encoding="UTF-8" method="xml"/>
	<xsl:strip-space elements="*"/>

	<!-- Réadaptation Stéphanie Gregorio - INIST/CNRS - FRANCE
		- xsl inpirée de la feuille MARC21slim2MODS3-5 disponible sur le site de MODS (https://www.loc.gov/standards/mods/v3/mods-mapping-3-5.html)
		- réadaptée au format TEI
	-->
	<xsl:variable name="ascii">
		<xsl:text> !"#$%&amp;'()*+,-./0123456789:;&lt;=&gt;?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~</xsl:text>
	</xsl:variable>
	<xsl:variable name="latin1">
		<xsl:text> ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ</xsl:text>
	</xsl:variable>
	<xsl:variable name="safe">
		<xsl:text>!'()*-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~</xsl:text>
	</xsl:variable>
	<xsl:variable name="hex">0123456789ABCDEF</xsl:variable>
	<xsl:variable name="controlField005" select="//marc:controlfield[@tag='005']"/>
	<xsl:variable name="controlField008" select="//marc:controlfield[@tag='008']"/>
	<xsl:variable name="controlField008-7-10" select="normalize-space(substring($controlField008, 8, 4))"/>
	<xsl:variable name="controlField008-11-14" select="normalize-space(substring($controlField008, 12, 4))"/>
	<xsl:variable name="controlField008-6" select="normalize-space(substring($controlField008, 7, 1))"/>
	<xsl:variable name="controlField008-35-37" select="normalize-space(translate(substring($controlField008,36,3),'|#',''))"/>
	<xsl:variable name="copyright" select="normalize-space(substring($controlField005, 0, 5))"/>
	
	<!-- bookID eeb2-->
	<xsl:variable name="zone826" select="substring-after(/marc:collection/marc:record/marc:datafield[@tag='856'][1]/marc:subfield[@code='u'],'https://search.proquest.com/docview/')"/>
	
	<!-- language -->
			<xsl:variable name="CorrLangInist">
				<xsl:choose>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm43078090e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm58042622e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99888245e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99830058e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99835938e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99836053e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99839750e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99847728e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99847740e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99847822e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99848007e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99852217e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99857285e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99857286e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99898382e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm11795672e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm12017438e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm12029817e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm12598339e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm13713762e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm16997773e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm17160458e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm17162921e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99887204e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99887249e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99887402e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99887766e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99890822e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99894448e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm19603760e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99888215e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99826620e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99828149e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm23175441e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99857484e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99834070e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm12766060e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99898712e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm23162514e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm15868784e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm12761157e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99844353e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99825527e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99825463e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99854693e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99848881e'">ga</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99836121e'">la</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99900410e'">la</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm23956650e'">la</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99844970e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99871140e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99898887e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm09519335e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm10114116e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm10325320e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm12877910e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm15553063e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm18217379e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm52633077e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99887015e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99891874e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99893693e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99893695e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99894413e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99894548e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99894872e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm13099058e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99898745e'">la</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm63041292e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm23032344e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99884581e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99893697e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='99895200e'">en</xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm09053212e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm09418473e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm09456525e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm09794510e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm10793334e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm10793398e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm11403649e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm11774586e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm12616631e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm12935822e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm12936059e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm12936129e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm13732880e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm19501967e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm21481165e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm22221951e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm22222047e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm22222321e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm22441450e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm22605292e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm24146175e'"></xsl:when>
					<xsl:when test="//marc:controlfield[@tag=001]='ocm99891770e'">en</xsl:when>
					<xsl:when test="$controlField008-35-37='g d'">en</xsl:when>
					<xsl:when test="$controlField008-35-37='d'">en</xsl:when>
					<xsl:when test="$controlField008-35-37='ng'">en</xsl:when>
					<xsl:when test="$controlField008-35-37='N/A'"></xsl:when>
					<xsl:when test="$controlField008-35-37='iri'">ga</xsl:when>
					<xsl:when test="$controlField008-35-37='gae'">gd</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<!-- code langue abes -->
							<xsl:when test="//marc:datafield[@tag='101']">
								<xsl:value-of select="//marc:datafield[@tag='101']/marc:subfield[@code='a']"/>
							</xsl:when>
							<xsl:when test="contains($controlField008,'|')">
								<xsl:value-of select="substring($controlField008,25,3)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="substring($controlField008,24,3)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="codeLangMarc">
				<xsl:choose>
					<xsl:when test="$CorrLangInist='aar'">aa</xsl:when>
					<xsl:when test="$CorrLangInist='abk'">ab</xsl:when>
					<xsl:when test="$CorrLangInist='afr'">af</xsl:when>
					<xsl:when test="$CorrLangInist='aka'">ak</xsl:when>
					<xsl:when test="$CorrLangInist='alb'">sq</xsl:when>
					<xsl:when test="$CorrLangInist='amh'">am</xsl:when>
					<xsl:when test="$CorrLangInist='ara'">ar</xsl:when>
					<xsl:when test="$CorrLangInist='arg'">an</xsl:when>
					<xsl:when test="$CorrLangInist='hye'">hy</xsl:when>
					<xsl:when test="$CorrLangInist='arm'">hy</xsl:when>
					<xsl:when test="$CorrLangInist='asm'">as</xsl:when>
					<xsl:when test="$CorrLangInist='ava'">av</xsl:when>
					<xsl:when test="$CorrLangInist='ave'">ae</xsl:when>
					<xsl:when test="$CorrLangInist='aym'">ay</xsl:when>
					<xsl:when test="$CorrLangInist='aze'">az</xsl:when>
					<xsl:when test="$CorrLangInist='bak'">ba</xsl:when>
					<xsl:when test="$CorrLangInist='bam'">bm</xsl:when>
					<xsl:when test="$CorrLangInist='eus'">eu</xsl:when>
					<xsl:when test="$CorrLangInist='baq'">eu</xsl:when>
					<xsl:when test="$CorrLangInist='bel'">be</xsl:when>
					<xsl:when test="$CorrLangInist='ben'">bn</xsl:when>
					<xsl:when test="$CorrLangInist='bih'">bh</xsl:when>
					<xsl:when test="$CorrLangInist='bis'">bi</xsl:when>
					<xsl:when test="$CorrLangInist='bod'">bo</xsl:when>
					<xsl:when test="$CorrLangInist='bos'">bs</xsl:when>
					<xsl:when test="$CorrLangInist='bre'">br</xsl:when>
					<xsl:when test="$CorrLangInist='bul'">bg</xsl:when>
					<xsl:when test="$CorrLangInist='bur'">my</xsl:when>
					<xsl:when test="$CorrLangInist='mya'">my</xsl:when>
					<xsl:when test="$CorrLangInist='cat'">ca</xsl:when>
					<xsl:when test="$CorrLangInist='ces'">cs</xsl:when>
					<xsl:when test="$CorrLangInist='cha'">ch</xsl:when>
					<xsl:when test="$CorrLangInist='che'">ce</xsl:when>
					<xsl:when test="$CorrLangInist='chi'">zh</xsl:when>
					<xsl:when test="$CorrLangInist='chu'">cu</xsl:when>
					<xsl:when test="$CorrLangInist='chv'">cv</xsl:when>
					<xsl:when test="$CorrLangInist='cor'">kw</xsl:when>
					<xsl:when test="$CorrLangInist='cos'">co</xsl:when>
					<xsl:when test="$CorrLangInist='cre'">cr</xsl:when>
					<xsl:when test="$CorrLangInist='cym'">cy</xsl:when>
					<xsl:when test="$CorrLangInist='cze'">cs</xsl:when>
					<xsl:when test="$CorrLangInist='dan'">da</xsl:when>
					<xsl:when test="$CorrLangInist='deu'">de</xsl:when>
					<xsl:when test="$CorrLangInist='div'">dv</xsl:when>
					<xsl:when test="$CorrLangInist='dut'">nl</xsl:when>
					<xsl:when test="$CorrLangInist='nld'">nl</xsl:when>
					<xsl:when test="$CorrLangInist='dzo'">dz</xsl:when>
					<xsl:when test="$CorrLangInist='eng'">en</xsl:when>
					<xsl:when test="$CorrLangInist='epo'">eo</xsl:when>
					<xsl:when test="$CorrLangInist='est'">et</xsl:when>
					<xsl:when test="$CorrLangInist='ewe'">ee</xsl:when>
					<xsl:when test="$CorrLangInist='fao'">fo</xsl:when>
					<xsl:when test="$CorrLangInist='fij'">fj</xsl:when>
					<xsl:when test="$CorrLangInist='fin'">fi</xsl:when>
					<xsl:when test="$CorrLangInist='fre'">fr</xsl:when>
					<xsl:when test="$CorrLangInist='fra'">fr</xsl:when>
					<xsl:when test="$CorrLangInist='fry'">fy</xsl:when>
					<xsl:when test="$CorrLangInist='ful'">ff</xsl:when>
					<xsl:when test="$CorrLangInist='geo'">ka</xsl:when>
					<xsl:when test="$CorrLangInist='kat'">ka</xsl:when>
					<xsl:when test="$CorrLangInist='ger'">de</xsl:when>
					<xsl:when test="$CorrLangInist='gla'">gd</xsl:when>
					<xsl:when test="$CorrLangInist='gle'">ga</xsl:when>
					<xsl:when test="$CorrLangInist='glg'">gl</xsl:when>
					<xsl:when test="$CorrLangInist='glv'">gv</xsl:when>
					<xsl:when test="$CorrLangInist='gre'">el</xsl:when>
					<xsl:when test="$CorrLangInist='ell'">el</xsl:when>
					<xsl:when test="$CorrLangInist='grn'">gn</xsl:when>
					<xsl:when test="$CorrLangInist='guj'">gu</xsl:when>
					<xsl:when test="$CorrLangInist='hat'">ht</xsl:when>
					<xsl:when test="$CorrLangInist='hau'">ha</xsl:when>
					<xsl:when test="$CorrLangInist='heb'">he</xsl:when>
					<xsl:when test="$CorrLangInist='her'">hz</xsl:when>
					<xsl:when test="$CorrLangInist='hin'">hi</xsl:when>
					<xsl:when test="$CorrLangInist='hmo'">ho</xsl:when>
					<xsl:when test="$CorrLangInist='hrv'">hr</xsl:when>
					<xsl:when test="$CorrLangInist='scr'">hr</xsl:when>
					<xsl:when test="$CorrLangInist='hun'">hu</xsl:when>
					<xsl:when test="$CorrLangInist='ibo'">ig</xsl:when>
					<xsl:when test="$CorrLangInist='ice'">is</xsl:when>
					<xsl:when test="$CorrLangInist='isl'">is</xsl:when>
					<xsl:when test="$CorrLangInist='ido'">io</xsl:when>
					<xsl:when test="$CorrLangInist='iii'">ii</xsl:when>
					<xsl:when test="$CorrLangInist='iku'">iu</xsl:when>
					<xsl:when test="$CorrLangInist='ile'">ie</xsl:when>
					<xsl:when test="$CorrLangInist='ina'">ia</xsl:when>
					<xsl:when test="$CorrLangInist='ind'">id</xsl:when>
					<xsl:when test="$CorrLangInist='ipk'">ik</xsl:when>
					<xsl:when test="$CorrLangInist='ita'">it</xsl:when>
					<xsl:when test="$CorrLangInist='jav'">jv</xsl:when>
					<xsl:when test="$CorrLangInist='jpn'">ja</xsl:when>
					<xsl:when test="$CorrLangInist='kal'">kl</xsl:when>
					<xsl:when test="$CorrLangInist='kan'">kn</xsl:when>
					<xsl:when test="$CorrLangInist='kas'">ks</xsl:when>
					<xsl:when test="$CorrLangInist='kau'">kr</xsl:when>
					<xsl:when test="$CorrLangInist='kaz'">kk</xsl:when>
					<xsl:when test="$CorrLangInist='khm'">km</xsl:when>
					<xsl:when test="$CorrLangInist='kik'">ki</xsl:when>
					<xsl:when test="$CorrLangInist='kin'">rw</xsl:when>
					<xsl:when test="$CorrLangInist='kir'">ky</xsl:when>
					<xsl:when test="$CorrLangInist='kom'">kv</xsl:when>
					<xsl:when test="$CorrLangInist='kon'">kg</xsl:when>
					<xsl:when test="$CorrLangInist='kor'">ko</xsl:when>
					<xsl:when test="$CorrLangInist='kua'">kj</xsl:when>
					<xsl:when test="$CorrLangInist='kur'">ku</xsl:when>
					<xsl:when test="$CorrLangInist='lao'">lo</xsl:when>
					<xsl:when test="$CorrLangInist='lat'">la</xsl:when>
					<xsl:when test="$CorrLangInist='lav'">lv</xsl:when>
					<xsl:when test="$CorrLangInist='lim'">li</xsl:when>
					<xsl:when test="$CorrLangInist='lin'">ln</xsl:when>
					<xsl:when test="$CorrLangInist='lit'">lt</xsl:when>
					<xsl:when test="$CorrLangInist='ltz'">lb</xsl:when>
					<xsl:when test="$CorrLangInist='lub'">lu</xsl:when>
					<xsl:when test="$CorrLangInist='lug'">lg</xsl:when>
					<xsl:when test="$CorrLangInist='mac'">mk</xsl:when>
					<xsl:when test="$CorrLangInist='mkd'">mk</xsl:when>
					<xsl:when test="$CorrLangInist='mah'">mh</xsl:when>
					<xsl:when test="$CorrLangInist='mal'">ml</xsl:when>
					<xsl:when test="$CorrLangInist='mri'">mi</xsl:when>
					<xsl:when test="$CorrLangInist='mao'">mi</xsl:when>
					<xsl:when test="$CorrLangInist='mar'">mr</xsl:when>
					<xsl:when test="$CorrLangInist='may'">ms</xsl:when>
					<xsl:when test="$CorrLangInist='msa'">ms</xsl:when>
					<xsl:when test="$CorrLangInist='mlg'">mg</xsl:when>
					<xsl:when test="$CorrLangInist='mlt'">mt</xsl:when>
					<xsl:when test="$CorrLangInist='mon'">mn</xsl:when>
					<xsl:when test="$CorrLangInist='nau'">na</xsl:when>
					<xsl:when test="$CorrLangInist='nav'">nv</xsl:when>
					<xsl:when test="$CorrLangInist='nbl'">nr</xsl:when>
					<xsl:when test="$CorrLangInist='nde'">nd</xsl:when>
					<xsl:when test="$CorrLangInist='ndo'">ng</xsl:when>
					<xsl:when test="$CorrLangInist='nep'">ne</xsl:when>
					<xsl:when test="$CorrLangInist='nno'">nn</xsl:when>
					<xsl:when test="$CorrLangInist='nob'">nb</xsl:when>
					<xsl:when test="$CorrLangInist='nor'">no</xsl:when>
					<xsl:when test="$CorrLangInist='nya'">ny</xsl:when>
					<xsl:when test="$CorrLangInist='oci'">oc</xsl:when>
					<xsl:when test="$CorrLangInist='oji'">oj</xsl:when>
					<xsl:when test="$CorrLangInist='ori'">or</xsl:when>
					<xsl:when test="$CorrLangInist='orm'">om</xsl:when>
					<xsl:when test="$CorrLangInist='oss'">os</xsl:when>
					<xsl:when test="$CorrLangInist='pan'">pa</xsl:when>
					<xsl:when test="$CorrLangInist='fas'">fa</xsl:when>
					<xsl:when test="$CorrLangInist='per'">fa</xsl:when>
					<xsl:when test="$CorrLangInist='pli'">pi</xsl:when>
					<xsl:when test="$CorrLangInist='pol'">pl</xsl:when>
					<xsl:when test="$CorrLangInist='por'">pt</xsl:when>
					<xsl:when test="$CorrLangInist='pus'">ps</xsl:when>
					<xsl:when test="$CorrLangInist='que'">qu</xsl:when>
					<xsl:when test="$CorrLangInist='roh'">rm</xsl:when>
					<xsl:when test="$CorrLangInist='ron'">ro</xsl:when>
					<xsl:when test="$CorrLangInist='rum'">ro</xsl:when>
					<xsl:when test="$CorrLangInist='run'">rn</xsl:when>
					<xsl:when test="$CorrLangInist='rus'">ru</xsl:when>
					<xsl:when test="$CorrLangInist='sag'">sg</xsl:when>
					<xsl:when test="$CorrLangInist='san'">sa</xsl:when>
					<xsl:when test="$CorrLangInist='scc'">sr</xsl:when>
					<xsl:when test="$CorrLangInist='sin'">si</xsl:when>
					<xsl:when test="$CorrLangInist='slo'">sk</xsl:when>
					<xsl:when test="$CorrLangInist='slk'">sk</xsl:when>
					<xsl:when test="$CorrLangInist='slv'">sl</xsl:when>
					<xsl:when test="$CorrLangInist='sme'">se</xsl:when>
					<xsl:when test="$CorrLangInist='smo'">sm</xsl:when>
					<xsl:when test="$CorrLangInist='sna'">sn</xsl:when>
					<xsl:when test="$CorrLangInist='snd'">sd</xsl:when>
					<xsl:when test="$CorrLangInist='som'">so</xsl:when>
					<xsl:when test="$CorrLangInist='sot'">st</xsl:when>
					<xsl:when test="$CorrLangInist='spa'">es</xsl:when>
					<xsl:when test="$CorrLangInist='sqi'">sq</xsl:when>
					<xsl:when test="$CorrLangInist='srd'">sc</xsl:when>
					<xsl:when test="$CorrLangInist='srp'">sr</xsl:when>
					<xsl:when test="$CorrLangInist='ssw'">ss</xsl:when>
					<xsl:when test="$CorrLangInist='sun'">su</xsl:when>
					<xsl:when test="$CorrLangInist='swa'">sw</xsl:when>
					<xsl:when test="$CorrLangInist='swe'">sv</xsl:when>
					<xsl:when test="$CorrLangInist='tah'">ty</xsl:when>
					<xsl:when test="$CorrLangInist='tam'">ta</xsl:when>
					<xsl:when test="$CorrLangInist='tat'">tt</xsl:when>
					<xsl:when test="$CorrLangInist='tel'">te</xsl:when>
					<xsl:when test="$CorrLangInist='tgk'">tg</xsl:when>
					<xsl:when test="$CorrLangInist='tgl'">tl</xsl:when>
					<xsl:when test="$CorrLangInist='tha'">th</xsl:when>
					<xsl:when test="$CorrLangInist='tib'">bo</xsl:when>
					<xsl:when test="$CorrLangInist='tir'">ti</xsl:when>
					<xsl:when test="$CorrLangInist='ton'">to</xsl:when>
					<xsl:when test="$CorrLangInist='tsn'">tn</xsl:when>
					<xsl:when test="$CorrLangInist='tso'">ts</xsl:when>
					<xsl:when test="$CorrLangInist='tuk'">tk</xsl:when>
					<xsl:when test="$CorrLangInist='tur'">tr</xsl:when>
					<xsl:when test="$CorrLangInist='twi'">tw</xsl:when>
					<xsl:when test="$CorrLangInist='uig'">ug</xsl:when>
					<xsl:when test="$CorrLangInist='ukr'">uk</xsl:when>
					<xsl:when test="$CorrLangInist='urd'">ur</xsl:when>
					<xsl:when test="$CorrLangInist='uzb'">uz</xsl:when>
					<xsl:when test="$CorrLangInist='ven'">ve</xsl:when>
					<xsl:when test="$CorrLangInist='vie'">vi</xsl:when>
					<xsl:when test="$CorrLangInist='vol'">vo</xsl:when>
					<xsl:when test="$CorrLangInist='wel'">cy</xsl:when>
					<xsl:when test="$CorrLangInist='wln'">wa</xsl:when>
					<xsl:when test="$CorrLangInist='wol'">wo</xsl:when>
					<xsl:when test="$CorrLangInist='xho'">xh</xsl:when>
					<xsl:when test="$CorrLangInist='yid'">yi</xsl:when>
					<xsl:when test="$CorrLangInist='yor'">yo</xsl:when>
					<xsl:when test="$CorrLangInist='zha'">za</xsl:when>
					<xsl:when test="$CorrLangInist='zho'">zh</xsl:when>
					<xsl:when test="$CorrLangInist='zul'">zu</xsl:when>
					<xsl:otherwise><xsl:value-of select="$CorrLangInist"/></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
<!-- debut des templates -->
	<xsl:template match="//marc:collection">
		<TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
			<xsl:attribute name="xsi:noNamespaceSchemaLocation">
				<xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
			</xsl:attribute>
			<teiHeader>
				<fileDesc>
					<xsl:for-each select="//marc:record">
						<xsl:call-template name="marcRecord"/>
					</xsl:for-each>
				</fileDesc>
			</teiHeader>
			<text>
				<body>
					<xsl:choose>
						<xsl:when test="string-length($rawfulltextpath) &gt; 0">
							<div>
								<p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div><p></p></div>
						</xsl:otherwise>
					</xsl:choose>
				</body>
			</text>
		</TEI>
	</xsl:template>
	<xsl:template name="marcRecord">
		<xsl:variable name="leader" select="marc:leader"/>
		<xsl:variable name="leader6" select="substring($leader,7,1)"/>
		<xsl:variable name="leader7" select="substring($leader,8,1)"/>
		<xsl:variable name="leader19" select="substring($leader,20,1)"/>
		<xsl:variable name="typeOf008">
			<xsl:choose>
				<xsl:when test="$leader6='a'">
					<xsl:choose>
						<xsl:when test="$leader7='a' or $leader7='c' or $leader7='d' or $leader7='m'">BK</xsl:when>
						<xsl:when test="$leader7='b' or $leader7='i' or $leader7='s'">SE</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$leader6='t'">BK</xsl:when>
				<xsl:when test="$leader6='p'">MM</xsl:when>
				<xsl:when test="$leader6='m'">CF</xsl:when>
				<xsl:when test="$leader6='e' or $leader6='f'">MP</xsl:when>
				<xsl:when test="$leader6='g' or $leader6='k' or $leader6='o' or $leader6='r'">VM</xsl:when>
				<xsl:when test="$leader6='c' or $leader6='d' or $leader6='i' or $leader6='j'">MU</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="date">
			<xsl:choose>
				<xsl:when test="//marc:controlfield[@tag=001]='ocm27647912e '">
					<xsl:text>1680</xsl:text>
				</xsl:when>
				<xsl:when test="//marc:controlfield[@tag=001]='ocm27903504e '">
					<xsl:text>1640</xsl:text>
				</xsl:when>
				<xsl:when test="//marc:controlfield[@tag=001]='ocm99882523e '">
					<xsl:text>1689</xsl:text>
				</xsl:when>
				<xsl:when test="//marc:controlfield[@tag=001]='ocm27648311e '">
					<xsl:text>1680</xsl:text>
				</xsl:when>
				<xsl:when test="//marc:controlfield[@tag=001]='ocm99882531e '">
					<xsl:text>1737</xsl:text>
				</xsl:when>
				<xsl:when test="//marc:controlfield[@tag=001]='ocm27698320e '">
					<xsl:text>1654</xsl:text>
				</xsl:when>
				<xsl:when test="//marc:controlfield[@tag=001]='ocn226317594e '">
					<xsl:text>1800</xsl:text>
				</xsl:when>
				<xsl:when test="//marc:controlfield[@tag=001]='ocm99882525e '">
					<xsl:text>1691</xsl:text>
				</xsl:when>
				<xsl:when test="//marc:controlfield[@tag=001]='ocm27954405e '">
					<xsl:text>1670</xsl:text>
				</xsl:when>
				<xsl:when test="//marc:controlfield[@tag=001]='ocm99888822e '">
					<xsl:text>1690</xsl:text>
				</xsl:when>
				<!-- date eeb2-->
				<xsl:when test="$zone826='2126543607' or $zone826='2126543503' or $zone826='2126543599' or $zone826='2126543775' or $zone826='2126543336' or $zone826='2126543293' or $zone826='2126543593' or $zone826='2126543656' or $zone826='2126543621' or $zone826='2126543502' or $zone826='2126543657' or $zone826='2126543723' or $zone826='2126543566' or $zone826='2126543592' or $zone826='2090363417' or $zone826='2126543493' or $zone826='2126543652' or $zone826='2126543542' or $zone826='2126543553' or $zone826='2126543488' or $zone826='2126543510' or $zone826='2126543565' or $zone826='2126543484' or $zone826='2126543726' or $zone826='2126543533' or $zone826='2126543637' or $zone826='2126543714' or $zone826='2090358698' or $zone826='2126543660' or $zone826='2126543568' or $zone826='2126543668' or $zone826='2126543481' or $zone826='2090342402' or $zone826='2090361660' or $zone826='2090362932' or $zone826='2090364680'">1455</xsl:when>
				<xsl:when test="$zone826='2090342724' or $zone826='2090326260'">1466</xsl:when>
				<xsl:when test="$zone826='2090334614'">1468</xsl:when>
				<xsl:when test="$zone826='2090334603' or $zone826='2090341198'">1469</xsl:when>
				<xsl:when test="$zone826='2090320969' or $zone826='2090340831' or $zone826='2090333992' or $zone826='2090320389' or $zone826='2090331854'">1470</xsl:when>
				<xsl:when test="$zone826='2090317917' or $zone826='2090328480' or $zone826='2090320799' or $zone826='2090331088' or $zone826='2090340636' or $zone826='2090342409' or $zone826='2090340716'">1471</xsl:when>
				<xsl:when test="$zone826='2090321039' or $zone826='2090330928' or $zone826='2090334036' or $zone826='2090340727' or $zone826='2090325726' or $zone826='2090326415' or $zone826='2090325929' or $zone826='2090304918' or $zone826='2090340549' or $zone826='2090326570' or $zone826='2090338752' or $zone826='2090331640' or $zone826='2090336427' or $zone826='2090342407' or $zone826='2090337018' or $zone826='2090342337' or $zone826='2090334360' or $zone826='2090334369'">1472</xsl:when>
				<xsl:when test="$zone826='2090331634' or $zone826='2090320970' or $zone826='2090340571' or $zone826='2090318508' or $zone826='2090338678' or $zone826='2090336448' or $zone826='2090342795' or $zone826='2090340622' or $zone826='2090336853' or $zone826='2090340501'">1473</xsl:when>
				<xsl:when test="$zone826='2090340842' or $zone826='2090326469' or $zone826='2090334337' or $zone826='2090323621' or $zone826='2090336356' or $zone826='2090304529' or $zone826='2090318033' or $zone826='2090331133' or $zone826='2090336597' or $zone826='2090331443' or $zone826='2090336601' or $zone826='2090320671' or $zone826='2090339085' or $zone826='2090326558' or $zone826='2090326289' or $zone826='2090328442' or $zone826='2090339172' or $zone826='2090328466' or $zone826='2090328418' or $zone826='2090325946' or $zone826='2090318651' or $zone826='2090334466' or $zone826='2090328850' or $zone826='2090318060' or $zone826='2090334554' or $zone826='2090331001'">1474</xsl:when>
				<xsl:when test="$zone826='2090336594' or $zone826='2090331623' or $zone826='2090305272' or $zone826='2090331447' or $zone826='2090340803' or $zone826='2090333851' or $zone826='2090304666' or $zone826='2090331131' or $zone826='2090336396' or $zone826='2090340741' or $zone826='2090330975' or $zone826='2090323669' or $zone826='2090318140' or $zone826='2090323807' or $zone826='2090340944' or $zone826='2090318560' or $zone826='2090342794' or $zone826='2090331140' or $zone826='2090333982' or $zone826='2090338746' or $zone826='2090325945' or $zone826='2090342293' or $zone826='2090338772' or $zone826='2090299249' or $zone826='2090340496' or $zone826='2090312919' or $zone826='2090315151' or $zone826='2090324045' or $zone826='2090339090' or $zone826='2090298574' or $zone826='2090328983' or $zone826='2090337017' or $zone826='2090339040' or $zone826='2090338767' or $zone826='2090320518' or $zone826='2090326422' or $zone826='2090340640' or $zone826='2090338753'">1475</xsl:when>
				<xsl:when test="$zone826='2090334473' or $zone826='2090326523' or $zone826='2090326269' or $zone826='2090320018' or $zone826='2090334087' or $zone826='2090336382' or $zone826='2090340708' or $zone826='2090338656' or $zone826='2090338731' or $zone826='2090323350' or $zone826='2090320098' or $zone826='2090338669' or $zone826='2090321020' or $zone826='2090342338' or $zone826='2090330949' or $zone826='2090328834' or $zone826='2090326547' or $zone826='2090320221' or $zone826='2090318690' or $zone826='2090325686' or $zone826='2090328656' or $zone826='2090331138'">1476</xsl:when>
				<xsl:when test="$zone826='2090320319' or $zone826='2090328903' or $zone826='2090310961' or $zone826='2090325911' or $zone826='2090331844' or $zone826='2090320820' or $zone826='2090342804' or $zone826='2090328270' or $zone826='2090334174' or $zone826='2090336899' or $zone826='2090340614' or $zone826='2090325906' or $zone826='2090320782' or $zone826='2090342424' or $zone826='2090340560' or $zone826='2090323687' or $zone826='2090336628' or $zone826='2090338980' or $zone826='2090339079' or $zone826='2090339055' or $zone826='2090339022' or $zone826='2090340572' or $zone826='2090320609' or $zone826='2090336829' or $zone826='2090339027'">1477</xsl:when>
				<xsl:when test="$zone826='2090330983' or $zone826='2090320813' or $zone826='2090330907' or $zone826='2090328454' or $zone826='2090342400' or $zone826='2090322989' or $zone826='2090328290' or $zone826='2090331407' or $zone826='2090323046' or $zone826='2090336561' or $zone826='2090326427' or $zone826='2090342309' or $zone826='2090310394' or $zone826='2090328488'">1478</xsl:when>
				<xsl:when test="$zone826='2090334446' or $zone826='2090334482' or $zone826='2090331430' or $zone826='2090339049' or $zone826='2090318625' or $zone826='2090318114' or $zone826='2090318451' or $zone826='2090338773' or $zone826='2090331448' or $zone826='2090328730' or $zone826='2090331128' or $zone826='2090334029' or $zone826='2090336611' or $zone826='2090328471' or $zone826='2090330938' or $zone826='2090336445' or $zone826='2090342412' or $zone826='2090330986'">1479</xsl:when>
				<xsl:when test="$zone826='2090323226' or $zone826='2090336844' or $zone826='2090338739' or $zone826='2090328295' or $zone826='2090331139' or $zone826='2090320388' or $zone826='2090340644' or $zone826='2090323536' or $zone826='2090323449' or $zone826='2090298908' or $zone826='2090320702' or $zone826='2090334079' or $zone826='2090336627' or $zone826='2090334333' or $zone826='2090340899' or $zone826='2090334053' or $zone826='2090328298' or $zone826='2090340931' or $zone826='2090331756' or $zone826='2090331798' or $zone826='2090338999' or $zone826='2090318544' or $zone826='2090323632' or $zone826='2090334340' or $zone826='2090339170' or $zone826='2090336419' or $zone826='2090320286' or $zone826='2090322964' or $zone826='2090328632' or $zone826='2090320112' or $zone826='2090331142' or $zone826='2090336826' or $zone826='2090340611' or $zone826='2090338928' or $zone826='2090334090' or $zone826='2090320694' or $zone826='2090336556'">1480</xsl:when>
				<xsl:when test="$zone826='2090298703' or $zone826='2090341185' or $zone826='2090342298' or $zone826='2090328462' or $zone826='2090323370' or $zone826='2090317959' or $zone826='2090318249' or $zone826='2090338989' or $zone826='2090342294' or $zone826='2090338947' or $zone826='2090342792' or $zone826='2090325771' or $zone826='2090325901' or $zone826='2090322901' or $zone826='2090325934' or $zone826='2090326554' or $zone826='2090337074' or $zone826='2090331095' or $zone826='2090323504' or $zone826='2090326438' or $zone826='2090334180' or $zone826='2090318575' or $zone826='2090323837' or $zone826='2090334217' or $zone826='2090342314' or $zone826='2090318713' or $zone826='2090321198' or $zone826='2090318058' or $zone826='2090339017' or $zone826='2090334080' or $zone826='2090323602' or $zone826='2090328501' or $zone826='2090333866'">1481</xsl:when>
				<xsl:when test="$zone826='2090318436' or $zone826='2090336808' or $zone826='2090326563' or $zone826='2090336734' or $zone826='2090342708' or $zone826='2090338921' or $zone826='2090336401' or $zone826='2090326161' or $zone826='2090323694' or $zone826='2090331424' or $zone826='2090328647' or $zone826='2090318784' or $zone826='2090331056' or $zone826='2090339097' or $zone826='2090331641' or $zone826='2090341188' or $zone826='2090334578' or $zone826='2090340837'">1482</xsl:when>
				<xsl:when test="$zone826='2090331444' or $zone826='2090340596' or $zone826='2090326143' or $zone826='2090320223' or $zone826='2090334570' or $zone826='2090318099' or $zone826='2090320296' or $zone826='2090318334' or $zone826='2090328897' or $zone826='2090331352' or $zone826='2090338756' or $zone826='2090340722' or $zone826='2090323534' or $zone826='2090342800' or $zone826='2090333921' or $zone826='2090340742' or $zone826='2090340527' or $zone826='2090322932' or $zone826='2090334205' or $zone826='2126543508' or $zone826='2090331652' or $zone826='2090331418' or $zone826='2090339013' or $zone826='2090333864' or $zone826='2090328932' or $zone826='2090318417' or $zone826='2090328414' or $zone826='2090324069' or $zone826='2090323452' or $zone826='2090336377' or $zone826='2090325922'">1483</xsl:when>
				<xsl:when test="$zone826='2090340706' or $zone826='2090331811' or $zone826='2090320039' or $zone826='2090325890' or $zone826='2090326417' or $zone826='2090339207' or $zone826='2090330952' or $zone826='2090320373' or $zone826='2090325698' or $zone826='2090331307' or $zone826='2090320792' or $zone826='2090340710'">1484</xsl:when>
				<xsl:when test="$zone826='2090341148' or $zone826='2090341156' or $zone826='2090323275' or $zone826='2090326224' or $zone826='2090331869' or $zone826='2090331859' or $zone826='2090323836' or $zone826='2090326572' or $zone826='2090325887' or $zone826='2090331078' or $zone826='2090334220' or $zone826='2090320075' or $zone826='2090337020' or $zone826='2090334577' or $zone826='2090307320' or $zone826='2090320693' or $zone826='2090336429' or $zone826='2090328970' or $zone826='2090326395' or $zone826='2090331102' or $zone826='2090333839' or $zone826='2090340553' or $zone826='2090336818' or $zone826='2090323013' or $zone826='2090318424' or $zone826='2090328390' or $zone826='2090337030' or $zone826='2090339231' or $zone826='2090336681' or $zone826='2090314506' or $zone826='2090328494' or $zone826='2090326573' or $zone826='2090320333' or $zone826='2090318735' or $zone826='2090338995' or $zone826='2090326406'">1485</xsl:when>
				<xsl:when test="$zone826='2090322895' or $zone826='2090331343' or $zone826='2090340937' or $zone826='2090340918' or $zone826='2090328451' or $zone826='2090328275' or $zone826='2090334459' or $zone826='2090320383' or $zone826='2090320864' or $zone826='2090342312' or $zone826='2090331409' or $zone826='2090320099' or $zone826='2090338949'">1486</xsl:when>
				<xsl:when test="$zone826='2090298969' or $zone826='2090331773' or $zone826='2090333833' or $zone826='2090340829' or $zone826='2090325742' or $zone826='2090318332' or $zone826='2090331805' or $zone826='2090318354' or $zone826='2090338776' or $zone826='2090323402' or $zone826='2090338932' or $zone826='2090328894' or $zone826='2090336605' or $zone826='2090323270' or $zone826='2090322969' or $zone826='2090318657' or $zone826='2090340920' or $zone826='2090323697' or $zone826='2090341164' or $zone826='2090334560' or $zone826='2090339158' or $zone826='2090325940' or $zone826='2090328980' or $zone826='2090326456' or $zone826='2090336372' or $zone826='2090340637' or $zone826='2090320329' or $zone826='2090340712' or $zone826='2090325889' or $zone826='2090339209' or $zone826='2090340642' or $zone826='2090334076' or $zone826='2090334057' or $zone826='2090340832'">1487</xsl:when>
				<xsl:when test="$zone826='2090340800' or $zone826='2090320370' or $zone826='2090338931' or $zone826='2090305019' or $zone826='2090331452' or $zone826='2090337032' or $zone826='2090331558' or $zone826='2090331608' or $zone826='2090328510' or $zone826='2090328623' or $zone826='2090336598' or $zone826='2090336426' or $zone826='2090326452' or $zone826='2090331107' or $zone826='2090326398' or $zone826='2090326293' or $zone826='2090323244' or $zone826='2090323290' or $zone826='2090339180' or $zone826='2090334462' or $zone826='2090328899' or $zone826='2090333883' or $zone826='2090339225' or $zone826='2090336833' or $zone826='2090299310' or $zone826='2090325965' or $zone826='2090336710' or $zone826='2090339035' or $zone826='2090320525' or $zone826='2090338950' or $zone826='2090340696' or $zone826='2090331769' or $zone826='2090338968' or $zone826='2090330990' or $zone826='2090320405' or $zone826='2090325717' or $zone826='2090340506' or $zone826='2090318116' or $zone826='2090340839' or $zone826='2090301411'">1488</xsl:when>
				<xsl:when test="$zone826='2090337047' or $zone826='2090321201' or $zone826='2090331353' or $zone826='2090331068' or $zone826='2090336842' or $zone826='2090340641' or $zone826='2090328303' or $zone826='2090333991' or $zone826='2090336846' or $zone826='2090338659' or $zone826='2090342330' or $zone826='2090336566' or $zone826='2090330961' or $zone826='2090326272' or $zone826='2090334104' or $zone826='2090323721' or $zone826='2090342430' or $zone826='2090342740' or $zone826='2090342302' or $zone826='2090342778' or $zone826='2090339034' or $zone826='2090336745' or $zone826='2090318530' or $zone826='2090338725' or $zone826='2090336831' or $zone826='2090338712' or $zone826='2090320797' or $zone826='2090328995' or $zone826='2090320259' or $zone826='2090336584' or $zone826='2090336839' or $zone826='2090338793' or $zone826='2090336699' or $zone826='2090328989' or $zone826='2090342435' or $zone826='2090331777' or $zone826='2090323033' or $zone826='2090318617' or $zone826='2090341149' or $zone826='2090331075' or $zone826='2090325683'">1489</xsl:when>
				<xsl:when test="$zone826='2090308633' or $zone826='2090334072' or $zone826='2090338781' or $zone826='2090310385' or $zone826='2090328754' or $zone826='2090330940' or $zone826='2090333879' or $zone826='2090331819' or $zone826='2090334186' or $zone826='2090318263' or $zone826='2090325917' or $zone826='2090330905' or $zone826='2090336750' or $zone826='2090323670' or $zone826='2090323611' or $zone826='2090323594' or $zone826='2090326097' or $zone826='2090334211' or $zone826='2090342339' or $zone826='2090340735' or $zone826='2090336639' or $zone826='2090320672' or $zone826='2090303606' or $zone826='2090308919' or $zone826='2090306076' or $zone826='2090311431' or $zone826='2090323801' or $zone826='2090307937' or $zone826='2090323411' or $zone826='2090342324' or $zone826='2090336976' or $zone826='2090340939' or $zone826='2090340816' or $zone826='2090336629' or $zone826='2090326444' or $zone826='2090318103' or $zone826='2090320350' or $zone826='2090328392' or $zone826='2090333830' or $zone826='2090315202' or $zone826='2090318425' or $zone826='2090296863' or $zone826='2090322918' or $zone826='2090321076' or $zone826='2090334004' or $zone826='2090328912' or $zone826='2090321056' or $zone826='2090331337' or $zone826='2090340499' or $zone826='2090321010' or $zone826='2090331809' or $zone826='2090320543' or $zone826='2090336649' or $zone826='2090321033' or $zone826='2090333869' or $zone826='2090334201' or $zone826='2090339219' or $zone826='2090326243' or $zone826='2090310432' or $zone826='2090331436'">1490</xsl:when>
				<xsl:when test="$zone826='2090334044' or $zone826='2090340811' or $zone826='2090310807' or $zone826='2090340830' or $zone826='2090325719' or $zone826='2090336890' or $zone826='2090328978' or $zone826='2090307499' or $zone826='2090322890' or $zone826='2090323384' or $zone826='2090340532' or $zone826='2090338668' or $zone826='2090342420' or $zone826='2090318717' or $zone826='2090318670' or $zone826='2090336751' or $zone826='2090318090' or $zone826='2090336747' or $zone826='2090326087' or $zone826='2090326487' or $zone826='2090334486' or $zone826='2090336967' or $zone826='2090323994' or $zone826='2090328949' or $zone826='2090328976' or $zone826='2090342316' or $zone826='2090336435' or $zone826='2090334596' or $zone826='2090336965' or $zone826='2090342706' or $zone826='2090323881' or $zone826='2090336707' or $zone826='2090341166' or $zone826='2090328517' or $zone826='2090342396' or $zone826='2090321091' or $zone826='2090320555' or $zone826='2090331106'">1491</xsl:when>
				<xsl:when test="$zone826='2090299132' or $zone826='2090326256' or $zone826='2090328748' or $zone826='2090341159' or $zone826='2090338706' or $zone826='2090313601' or $zone826='2090313705' or $zone826='2090340810' or $zone826='2090320841' or $zone826='2090331771' or $zone826='2090326437' or $zone826='2090296731' or $zone826='2090336352' or $zone826='2090336861' or $zone826='2090341147' or $zone826='2090340707' or $zone826='2090321191' or $zone826='2090331069' or $zone826='2090331416' or $zone826='2090336973' or $zone826='2090338951' or $zone826='2090342416' or $zone826='2090340513' or $zone826='2090338919' or $zone826='2090339064' or $zone826='2090338666' or $zone826='2090341169' or $zone826='2090320222' or $zone826='2090306132' or $zone826='2090316496' or $zone826='2090323733' or $zone826='2090337040' or $zone826='2090340936' or $zone826='2090330947' or $zone826='2090318460' or $zone826='2090340815' or $zone826='2090331754' or $zone826='2090339186' or $zone826='2090336618' or $zone826='2090339047' or $zone826='2090330999' or $zone826='2090341184' or $zone826='2090336371' or $zone826='2090320591' or $zone826='2090321073' or $zone826='2090340547' or $zone826='2090328646' or $zone826='2090336447' or $zone826='2090325971' or $zone826='2090338671' or $zone826='2090341146' or $zone826='2090298269' or $zone826='2090342406' or $zone826='2090318739' or $zone826='2090331639' or $zone826='2090333878'">1492</xsl:when>
				<xsl:when test="$zone826='2090333894' or $zone826='2090325914' or $zone826='2090340804' or $zone826='2090334045' or $zone826='2090331082' or $zone826='2090299000' or $zone826='2090302015' or $zone826='2090328293' or $zone826='2090342323' or $zone826='2090328728' or $zone826='2090331414' or $zone826='2090328437' or $zone826='2090342735' or $zone826='2090326400' or $zone826='2090313778' or $zone826='2090334365' or $zone826='2090333852' or $zone826='2090323388' or $zone826='2090308800' or $zone826='2090319176' or $zone826='2090314577' or $zone826='2090311630' or $zone826='2090317135' or $zone826='2090328410' or $zone826='2090336365' or $zone826='2090331060' or $zone826='2090318701' or $zone826='2090301987' or $zone826='2090326217' or $zone826='2090318331' or $zone826='2090340729' or $zone826='2090322931' or $zone826='2090342431' or $zone826='2090340565' or $zone826='2090320855' or $zone826='2090326170' or $zone826='2090307599' or $zone826='2090313752' or $zone826='2090331148' or $zone826='2090310197' or $zone826='2090328911' or $zone826='2090299308' or $zone826='2090326206' or $zone826='2090328734' or $zone826='2090340934' or $zone826='2090331574' or $zone826='2090340728'">1493</xsl:when>
				<xsl:when test="$zone826='2090318120' or $zone826='2090301499' or $zone826='2090333903' or $zone826='2090342333' or $zone826='2090318549' or $zone826='2090342392' or $zone826='2090320105' or $zone826='2090325752' or $zone826='2090336697' or $zone826='2090323228' or $zone826='2090336867' or $zone826='2090328650' or $zone826='2090328426' or $zone826='2090334450' or $zone826='2090302160' or $zone826='2090321078' or $zone826='2090326267' or $zone826='2090301309' or $zone826='2090318689' or $zone826='2090322970' or $zone826='2090328399' or $zone826='2090305518' or $zone826='2090317184' or $zone826='2090309276' or $zone826='2090317183' or $zone826='2090334552' or $zone826='2090338749' or $zone826='2090339228' or $zone826='2090341191' or $zone826='2090336804' or $zone826='2090340932' or $zone826='2090328752' or $zone826='2090340732' or $zone826='2090340625' or $zone826='2090320519' or $zone826='2090326431' or $zone826='2090330957' or $zone826='2090342787' or $zone826='2090338726' or $zone826='2090340843' or $zone826='2090328635' or $zone826='2090298601' or $zone826='2090334110' or $zone826='2090340923' or $zone826='2090336676' or $zone826='2090328958' or $zone826='2090331834'">1494</xsl:when>
				<xsl:when test="$zone826='2090331856' or $zone826='2090307928' or $zone826='2090323505' or $zone826='2090331565' or $zone826='2090324032' or $zone826='2090330955' or $zone826='2090331614' or $zone826='2090339157' or $zone826='2090339215' or $zone826='2090328314' or $zone826='2090345968' or $zone826='2090336746' or $zone826='2090334194' or $zone826='2090322943' or $zone826='2090318057' or $zone826='2090328440' or $zone826='2090326392' or $zone826='2090323302' or $zone826='2090338708' or $zone826='2090328401' or $zone826='2090326238' or $zone826='2090326556' or $zone826='2090328719' or $zone826='2090298573' or $zone826='2090326094' or $zone826='2090334092' or $zone826='2090328305' or $zone826='2090331120' or $zone826='2090340520' or $zone826='2090341160' or $zone826='2090328955' or $zone826='2090315227' or $zone826='2090326600' or $zone826='2090301907' or $zone826='2090336974' or $zone826='2090301265' or $zone826='2090333837' or $zone826='2090326106' or $zone826='2090336669' or $zone826='2090307241' or $zone826='2090340577' or $zone826='2090340585' or $zone826='2090321183' or $zone826='2090318246' or $zone826='2090325925' or $zone826='2090314410' or $zone826='2090341195' or $zone826='2090299884' or $zone826='2090317191' or $zone826='2090323481' or $zone826='2090333828' or $zone826='2090326476' or $zone826='2090320770' or $zone826='2090331821' or $zone826='2090323183' or $zone826='2090317926' or $zone826='2090339242' or $zone826='2090339174' or $zone826='2090328665' or $zone826='2090302127' or $zone826='2090317930' or $zone826='2090328485' or $zone826='2090342712' or $zone826='2090358312' or $zone826='2090322993' or $zone826='2090323469' or $zone826='2090307286' or $zone826='2090338702' or $zone826='2090315169' or $zone826='2090298877' or $zone826='2090326150' or $zone826='2090337073' or $zone826='2090307967' or $zone826='2090318142' or $zone826='2090318509' or $zone826='2090334101' or $zone826='2090318515' or $zone826='2090340734' or $zone826='2090307829' or $zone826='2090323688' or $zone826='2090339168' or $zone826='2090336958' or $zone826='2090318032' or $zone826='2090340802' or $zone826='2090342788' or $zone826='2090342313' or $zone826='2090310601'">1495</xsl:when>
				<xsl:when test="$zone826='2090323390' or $zone826='2090320486' or $zone826='2090331841' or $zone826='2090323247' or $zone826='2090301955' or $zone826='2090298950' or $zone826='2090318024' or $zone826='2090323645' or $zone826='2090334107' or $zone826='2090342733' or $zone826='2090305242' or $zone826='2090318240' or $zone826='2090336820' or $zone826='2090318747' or $zone826='2090336413' or $zone826='2090318633' or $zone826='2090331435' or $zone826='2090325724' or $zone826='2090307616' or $zone826='2090318570' or $zone826='2090339095' or $zone826='2090325740' or $zone826='2090342738' or $zone826='2090320449' or $zone826='2090313965' or $zone826='2090342803' or $zone826='2090326519' or $zone826='2090338991' or $zone826='2090323993' or $zone826='2090328469' or $zone826='2090331786' or $zone826='2090338801' or $zone826='2090339206' or $zone826='2090340544' or $zone826='2090340723' or $zone826='2090301816' or $zone826='2090336870' or $zone826='2090325880' or $zone826='2090316667' or $zone826='2090333885' or $zone826='2090340589' or $zone826='2090324040' or $zone826='2090298604' or $zone826='2090331098' or $zone826='2090337078' or $zone826='2090331633' or $zone826='2090308071' or $zone826='2090310386' or $zone826='2090342425' or $zone826='2090304318' or $zone826='2090310560' or $zone826='2090328915' or $zone826='2090325935' or $zone826='2090336972' or $zone826='2090325766' or $zone826='2090333867' or $zone826='2090341182' or $zone826='2090318440' or $zone826='2090318076' or $zone826='2090331124' or $zone826='2090299263' or $zone826='2090318658' or $zone826='2090326484'">1496</xsl:when>
				<xsl:when test="$zone826='2090299013' or $zone826='2090301328' or $zone826='2090333825' or $zone826='2090331415' or $zone826='2090336862' or $zone826='2090340898' or $zone826='2090338906' or $zone826='2090307194' or $zone826='2090340508' or $zone826='2090340844' or $zone826='2090331832' or $zone826='2090350874' or $zone826='2090302101' or $zone826='2090326122' or $zone826='2090331421' or $zone826='2090342781' or $zone826='2090328475' or $zone826='2090318162' or $zone826='2090334118' or $zone826='2090336430' or $zone826='2090334176' or $zone826='2090310864' or $zone826='2090318155' or $zone826='2090326130' or $zone826='2090331817' or $zone826='2090334540' or $zone826='2090320234' or $zone826='2090338771' or $zone826='2090301908' or $zone826='2090320231' or $zone826='2090326463' or $zone826='2090331861' or $zone826='2090313667' or $zone826='2090336436' or $zone826='2090328441' or $zone826='2090340745' or $zone826='2090323691' or $zone826='2090331446' or $zone826='2090323819' or $zone826='2090325948' or $zone826='2090331326' or $zone826='2090313352' or $zone826='2090326115' or $zone826='2090318771' or $zone826='2090336959' or $zone826='2090304279' or $zone826='2090323023' or $zone826='2090340599' or $zone826='2090349555' or $zone826='2090326550' or $zone826='2090340545' or $zone826='2090336579' or $zone826='2090312962' or $zone826='2090328847' or $zone826='2090323398' or $zone826='2090340838' or $zone826='2090331146' or $zone826='2090331838' or $zone826='2090334204' or $zone826='2090325697' or $zone826='2090308103' or $zone826='2090331620' or $zone826='2090328928' or $zone826='2090298353' or $zone826='2090325944' or $zone826='2090313219' or $zone826='2090328620' or $zone826='2090307505' or $zone826='2090334550' or $zone826='2090310330' or $zone826='2090324034' or $zone826='2090326282' or $zone826='2090338800' or $zone826='2090326528' or $zone826='2090331330' or $zone826='2090334063' or $zone826='2090328379' or $zone826='2090328733' or $zone826='2090320444' or $zone826='2090341186' or $zone826='2090331451' or $zone826='2090336600' or $zone826='2090318772' or $zone826='2090342715' or $zone826='2090313828' or $zone826='2090333882' or $zone826='2090299205' or $zone826='2090330971' or $zone826='2090340605' or $zone826='2090310241' or $zone826='2090342721' or $zone826='2090331651'">1497</xsl:when>
				<xsl:when test="$zone826='2090336636' or $zone826='2090342411' or $zone826='2090322863' or $zone826='2090331624' or $zone826='2090342798' or $zone826='2090339195' or $zone826='2090333904' or $zone826='2090323825' or $zone826='2090328311' or $zone826='2090341179' or $zone826='2090328459' or $zone826='2090310525' or $zone826='2090328906' or $zone826='2090340797' or $zone826='2090338778' or $zone826='2090320432' or $zone826='2090331341' or $zone826='2090339156' or $zone826='2090331790' or $zone826='2090330989' or $zone826='2090298834' or $zone826='2090305028' or $zone826='2090340570' or $zone826='2090342299' or $zone826='2090341151' or $zone826='2090306151' or $zone826='2090314109' or $zone826='2090299910' or $zone826='2090322948' or $zone826='2090331572' or $zone826='2090340615' or $zone826='2090331611' or $zone826='2090310879' or $zone826='2090331319' or $zone826='2090336706' or $zone826='2090331768' or $zone826='2090330930' or $zone826='2090318046' or $zone826='2090339030' or $zone826='2090340557' or $zone826='2090320895' or $zone826='2090330981' or $zone826='2090333838' or $zone826='2090342321' or $zone826='2090326566' or $zone826='2090338654' or $zone826='2090323167' or $zone826='2090308102' or $zone826='2090341167' or $zone826='2090323681' or $zone826='2090331606' or $zone826='2090336449' or $zone826='2090338750' or $zone826='2090326405'">1498</xsl:when>
				<xsl:when test="$zone826='2090338733' or $zone826='2090328449' or $zone826='2090328852' or $zone826='2090301691' or $zone826='2090328289' or $zone826='2090334592' or $zone826='2090361088' or $zone826='2090340721' or $zone826='2090326247' or $zone826='2090326536' or $zone826='2090323015' or $zone826='2090339007' or $zone826='2090318226' or $zone826='2090320025' or $zone826='2090331573' or $zone826='2090320793' or $zone826='2090305386' or $zone826='2090337006' or $zone826='2090320255' or $zone826='2090342295' or $zone826='2090336736' or $zone826='2090358503' or $zone826='2090331843' or $zone826='2090336624' or $zone826='2090339065' or $zone826='2090328819' or $zone826='2090320482' or $zone826='2090342308' or $zone826='2090326152' or $zone826='2090342315' or $zone826='2090320386' or $zone826='2090326562' or $zone826='2090340915' or $zone826='2090326397' or $zone826='2090333865' or $zone826='2090317923' or $zone826='2090328283' or $zone826='2090331091' or $zone826='2090318707' or $zone826='2090334573' or $zone826='2090340743' or $zone826='2090320282' or $zone826='2090358756' or $zone826='2090338673'">1499</xsl:when>
				<xsl:when test="$zone826='2090320573' or $zone826='2090331111' or $zone826='2090318152' or $zone826='2126543596' or $zone826='2090299244' or $zone826='2090337005' or $zone826='2126543297' or $zone826='2126543767' or $zone826='2126543631' or $zone826='2126543704' or $zone826='2126543722' or $zone826='2090338948' or $zone826='2090323050' or $zone826='2090336405' or $zone826='2090340902' or $zone826='2090328429' or $zone826='2090299328' or $zone826='2090336814' or $zone826='2090325927' or $zone826='2090333900' or $zone826='2126543747' or $zone826='2126543774' or $zone826='2126543574' or $zone826='2090323218' or $zone826='2090337077' or $zone826='2090317919' or $zone826='2090302019' or $zone826='2090323738' or $zone826='2090326441' or $zone826='2090328668' or $zone826='2090342719' or $zone826='2090336440' or $zone826='2090339154' or $zone826='2090307994' or $zone826='2090310444' or $zone826='2090323590' or $zone826='2090338923' or $zone826='2090330920' or $zone826='2090322962' or $zone826='2126543712' or $zone826='2090340515' or $zone826='2090304801' or $zone826='2090342340' or $zone826='2126543654' or $zone826='2126543474' or $zone826='2126543776' or $zone826='2090320113' or $zone826='2090331566' or $zone826='2090339059' or $zone826='2090326421' or $zone826='2126543669' or $zone826='2090318995' or $zone826='2126543525' or $zone826='2126543728' or $zone826='2126543766' or $zone826='2126543313' or $zone826='2126543583' or $zone826='2126543685' or $zone826='2126543307' or $zone826='2126543642' or $zone826='2126543328' or $zone826='2126543711' or $zone826='2126543719' or $zone826='2126543610' or $zone826='2126543590' or $zone826='2126543738' or $zone826='2126543479' or $zone826='2126543317' or $zone826='2126543605' or $zone826='2126543677' or $zone826='2126543671' or $zone826='2126543619' or $zone826='2126543709' or $zone826='2126543739' or $zone826='2126543729' or $zone826='2126543769' or $zone826='2126543544' or $zone826='2126543495' or $zone826='2126543757' or $zone826='2126543680' or $zone826='2126543540' or $zone826='2126543601' or $zone826='2126543520' or $zone826='2126543697' or $zone826='2126543326' or $zone826='2126543303' or $zone826='2126543730' or $zone826='2126543586' or $zone826='2090313995' or $zone826='2126543710' or $zone826='2126543500' or $zone826='2126543684' or $zone826='2126543690' or $zone826='2126543311' or $zone826='2126543556' or $zone826='2126543616' or $zone826='2126543492' or $zone826='2126543708' or $zone826='2126543338' or $zone826='2126543736' or $zone826='2126543602' or $zone826='2126543519' or $zone826='2126543521' or $zone826='2126543524' or $zone826='2126543675' or $zone826='2126543718' or $zone826='2126543613' or $zone826='2126543577' or $zone826='2126543716' or $zone826='2126543310' or $zone826='2126543324' or $zone826='2126543507' or $zone826='2126543522' or $zone826='2126543746' or $zone826='2126543724' or $zone826='2126543717' or $zone826='2126543518' or $zone826='2126543741' or $zone826='2126543323' or $zone826='2126543291' or $zone826='2090298310' or $zone826='2090321035' or $zone826='2090336741' or $zone826='2090326544' or $zone826='2126543309' or $zone826='2126543689' or $zone826='2126543581' or $zone826='2090342393' or $zone826='2090336730' or $zone826='2090333999' or $zone826='2090325759' or $zone826='2126543318' or $zone826='2090334453' or $zone826='2090321160' or $zone826='2090298527' or $zone826='2090342422' or $zone826='2090307541' or $zone826='2090320362' or $zone826='2090323718' or $zone826='2090325954' or $zone826='2090318453' or $zone826='2090323977' or $zone826='2090342329' or $zone826='2090340724' or $zone826='2090342305' or $zone826='2126543673' or $zone826='2126543755' or $zone826='2126543715' or $zone826='2126543617' or $zone826='2090323633' or $zone826='2090334549' or $zone826='2090339076' or $zone826='2090328738' or $zone826='2126543682' or $zone826='2090330942' or $zone826='2090310678' or $zone826='2090323664' or $zone826='2090320560' or $zone826='2090340601' or $zone826='2126543528' or $zone826='2126543496' or $zone826='2090331305'">1500</xsl:when>
				<xsl:when test="$zone826='2090326133' or $zone826='2090358308' or $zone826='2090365146' or $zone826='2090360114' or $zone826='2090360777' or $zone826='2090362831' or $zone826='2090356701' or $zone826='2090358297' or $zone826='2090364454' or $zone826='2090364799' or $zone826='2090353515' or $zone826='2090361999' or $zone826='2090354855' or $zone826='2090320403' or $zone826='2090324739' or $zone826='2090359922'">1501</xsl:when>
				<xsl:when test="$zone826='2090353435' or $zone826='2090353450' or $zone826='2090331867' or $zone826='2090338762' or $zone826='2090345026' or $zone826='2090357335' or $zone826='2090358187' or $zone826='2090363437' or $zone826='2090364636' or $zone826='2090350109' or $zone826='2090359789' or $zone826='2090363460' or $zone826='2090308781' or $zone826='2090346185' or $zone826='2090360089' or $zone826='2090310458' or $zone826='2090350959' or $zone826='2090359723' or $zone826='2090345525' or $zone826='2090347066' or $zone826='2090356692' or $zone826='2090356036' or $zone826='2090351153' or $zone826='2090352397' or $zone826='2090357174'">1502</xsl:when>
				<xsl:when test="$zone826='2090364684' or $zone826='2090303559' or $zone826='2090363816' or $zone826='2090353127' or $zone826='2090354980' or $zone826='2090356808' or $zone826='2090311676' or $zone826='2090364750' or $zone826='2090304412'">1503</xsl:when>
				<xsl:when test="$zone826='2090348889' or $zone826='2090352575' or $zone826='2090354426' or $zone826='2090359969' or $zone826='2090351784' or $zone826='2090347429' or $zone826='2090362110' or $zone826='2090349188' or $zone826='2090356090' or $zone826='2090351196' or $zone826='2090309230' or $zone826='2090352836'">1504</xsl:when>
				<xsl:when test="$zone826='2090349110' or $zone826='2090361706' or $zone826='2090364706' or $zone826='2090350289' or $zone826='2090363415' or $zone826='2090360986' or $zone826='2090353368' or $zone826='2090320776' or $zone826='2090328408' or $zone826='2090310818' or $zone826='2090325910' or $zone826='2090298912' or $zone826='2090318335' or $zone826='2090328745' or $zone826='2090341174'">1505</xsl:when>
				<xsl:when test="$zone826='2090349183' or $zone826='2090340904' or $zone826='2090300247'">1507</xsl:when>
				<xsl:when test="$zone826='2090354996' or $zone826='2090362009' or $zone826='2090353416' or $zone826='2090352847' or $zone826='2090303419' or $zone826='2090326863' or $zone826='2090325963'">1508</xsl:when>
				<xsl:when test="$zone826='2090357303' or $zone826='2090302997' or $zone826='2090351418' or $zone826='2090311515'">1509</xsl:when>
				<xsl:when test="$zone826='2090331638' or $zone826='2090326426' or $zone826='2090330919' or $zone826='2090363011' or $zone826='2090363935' or $zone826='2090344855' or $zone826='2090321694' or $zone826='2090321468' or $zone826='2090303407' or $zone826='2090299919' or $zone826='2090306584' or $zone826='2090311678' or $zone826='2090300380' or $zone826='2090297528'">1510</xsl:when>
				<xsl:when test="$zone826='2090314585' or $zone826='2090300098' or $zone826='2090303253' or $zone826='2090356677'">1511</xsl:when>
				<xsl:when test="$zone826='2090354055' or $zone826='2090358613'">1512</xsl:when>
				<xsl:when test="$zone826='2090328316' or $zone826='2090345600' or $zone826='2090353534' or $zone826='2090348426' or $zone826='2090345084' or $zone826='2090351436' or $zone826='2090347062'">1513</xsl:when>
				<xsl:when test="$zone826='2090357156' or $zone826='2090355503' or $zone826='2090359827' or $zone826='2090362927' or $zone826='2090303166' or $zone826='2090356889' or $zone826='2090354032' or $zone826='2090324462' or $zone826='2090306006' or $zone826='2090351473' or $zone826='2090350821' or $zone826='2090344059' or $zone826='2090311591' or $zone826='2090346139' or $zone826='2090350266'">1514</xsl:when>
				<xsl:when test="$zone826='2090352733' or $zone826='2090358707' or $zone826='2090354868' or $zone826='2090363955' or $zone826='2090319162' or $zone826='2090348481' or $zone826='2090309161' or $zone826='2090326455' or $zone826='2090355707' or $zone826='2090364336' or $zone826='2090328712' or $zone826='2090351074' or $zone826='2090308959' or $zone826='2090327109' or $zone826='2090316770' or $zone826='2090351637' or $zone826='2090360970' or $zone826='2090347501' or $zone826='2090363617' or $zone826='2090358183' or $zone826='2090361160' or $zone826='2090363380' or $zone826='2090320973' or $zone826='2090311670' or $zone826='2090316711' or $zone826='2090311321' or $zone826='2090321606' or $zone826='2090305999' or $zone826='2090314624'">1515</xsl:when>
				<xsl:when test="$zone826='2090359953' or $zone826='2090358482' or $zone826='2090345774' or $zone826='2090350350' or $zone826='2090317298' or $zone826='2090308770' or $zone826='2090308915' or $zone826='2090321653' or $zone826='2090350244' or $zone826='2090360768' or $zone826='2090353079' or $zone826='2090319164' or $zone826='2090303167' or $zone826='2090314253' or $zone826='2090300246' or $zone826='2090321854' or $zone826='2090299893' or $zone826='2090300148' or $zone826='2090308896' or $zone826='2090300306' or $zone826='2090314437' or $zone826='2090297456' or $zone826='2090311376' or $zone826='2090297688'">1516</xsl:when>
				<xsl:when test="$zone826='2090353388' or $zone826='2090361018' or $zone826='2090347811' or $zone826='2090362856' or $zone826='2090345071' or $zone826='2090297582' or $zone826='2090308619' or $zone826='2090350788' or $zone826='2090356757' or $zone826='2090361005' or $zone826='2090364797' or $zone826='2090356978' or $zone826='2090300279' or $zone826='2090349964'">1517</xsl:when>
				<xsl:when test="$zone826='2090354052' or $zone826='2090358224' or $zone826='2090347823' or $zone826='2090346103' or $zone826='2090347491' or $zone826='2090351766' or $zone826='2090353336' or $zone826='2090349797' or $zone826='2090353377' or $zone826='2090362008' or $zone826='2090363784' or $zone826='2090365109' or $zone826='2090311635'">1518</xsl:when>
				<xsl:when test="$zone826='2090346795' or $zone826='2090355706' or $zone826='2090314049' or $zone826='2090321963' or $zone826='2090358033' or $zone826='2090347620' or $zone826='2090362758' or $zone826='2090357033' or $zone826='2090364313' or $zone826='2090350064' or $zone826='2090344047' or $zone826='2090345762' or $zone826='2090361226' or $zone826='2090362607' or $zone826='2090361283' or $zone826='2090362155' or $zone826='2090306574' or $zone826='2090326697' or $zone826='2090358608' or $zone826='2090359524' or $zone826='2090365117'">1519</xsl:when>
				<xsl:when test="$zone826='2090351062' or $zone826='2090353328' or $zone826='2090340629' or $zone826='2090324601' or $zone826='2090319534' or $zone826='2090358471'">1520</xsl:when>
				<xsl:when test="$zone826='2090349074' or $zone826='2090362081' or $zone826='2090359545' or $zone826='2090355760' or $zone826='2090364446' or $zone826='2090350308' or $zone826='2090357119' or $zone826='2090363672' or $zone826='2090358628' or $zone826='2090349584' or $zone826='2090361021' or $zone826='2090354838' or $zone826='2090345988' or $zone826='2090363620' or $zone826='2090354993' or $zone826='2090347405' or $zone826='2090354966' or $zone826='2090363947' or $zone826='2090347502' or $zone826='2090358765'">1521</xsl:when>
				<xsl:when test="$zone826='2090357153' or $zone826='2090364562' or $zone826='2090328277' or $zone826='2090365129' or $zone826='2090350348' or $zone826='2090352728' or $zone826='2090356240' or $zone826='2090357462' or $zone826='2090358622' or $zone826='2090349809' or $zone826='2090363891' or $zone826='2090364442'">1522</xsl:when>
				<xsl:when test="$zone826='2090345712' or $zone826='2090359977' or $zone826='2090354840' or $zone826='2090358618' or $zone826='2090354572' or $zone826='2090345412' or $zone826='2090364352' or $zone826='2090356076' or $zone826='2090357463' or $zone826='2090362733' or $zone826='2090347229' or $zone826='2090354607' or $zone826='2090347439' or $zone826='2090350401'">1523</xsl:when>
				<xsl:when test="$zone826='2090354327' or $zone826='2090356213' or $zone826='2090354603' or $zone826='2090364617' or $zone826='2090309240' or $zone826='2090311957' or $zone826='2090343918' or $zone826='2090362516' or $zone826='2090362873' or $zone826='2090363391' or $zone826='2090299825'">1524</xsl:when>
				<xsl:when test="$zone826='2090349122'">1525</xsl:when>
				<xsl:when test="$zone826='2090311078' or $zone826='2090314357' or $zone826='2090302963'">1526</xsl:when>
				<xsl:when test="$zone826='2090298537' or $zone826='2090343884' or $zone826='2090348471' or $zone826='2090356670' or $zone826='2090352871' or $zone826='2090351204' or $zone826='2090363754' or $zone826='2090346790' or $zone826='2090350167'">1527</xsl:when>
				<xsl:when test="$zone826='2090348679' or $zone826='2090361978' or $zone826='2090357960' or $zone826='2090358168' or $zone826='2090347290' or $zone826='2090359914' or $zone826='2090297622' or $zone826='2090350425' or $zone826='2090362997'">1528</xsl:when>
				<xsl:when test="$zone826='2090297409' or $zone826='2090352754'">1529</xsl:when>
				<xsl:when test="$zone826='2090327281' or $zone826='2090299907' or $zone826='2090306275' or $zone826='2090300079'">1530</xsl:when>
				<xsl:when test="$zone826='2090299994'">1531</xsl:when>
				<xsl:when test="$zone826='2090350837' or $zone826='2090351298' or $zone826='2090352767' or $zone826='2090344053' or $zone826='2090351629' or $zone826='2090358592' or $zone826='2090364846' or $zone826='2090302987' or $zone826='2090347610' or $zone826='2090346073' or $zone826='2090357452' or $zone826='2090348709'">1533</xsl:when>
				<xsl:when test="$zone826='2090351048' or $zone826='2090356967' or $zone826='2090359840' or $zone826='2090351433' or $zone826='2090357970' or $zone826='2090358739' or $zone826='2090321791' or $zone826='2090297430' or $zone826='2090343809' or $zone826='2090306374' or $zone826='2090345719' or $zone826='2090356913'">1534</xsl:when>
				<xsl:when test="$zone826='2090346116' or $zone826='2090358545' or $zone826='2090356200' or $zone826='2090356204' or $zone826='2090353527' or $zone826='2090352780' or $zone826='2090363398' or $zone826='2090311262'">1535</xsl:when>
				<xsl:when test="$zone826='2090345609' or $zone826='2090349972' or $zone826='2090347808' or $zone826='2090309300' or $zone826='2090350165' or $zone826='2090359721'">1536</xsl:when>
				<xsl:when test="$zone826='2090303390' or $zone826='2090321627'">1537</xsl:when>
				<xsl:when test="$zone826='2090303025' or $zone826='2090351468' or $zone826='2090356055' or $zone826='2090306004' or $zone826='2090314140' or $zone826='2090324864'">1538</xsl:when>
				<xsl:when test="$zone826='2090343945' or $zone826='2090359544' or $zone826='2090308952' or $zone826='2090343866'">1539</xsl:when>
				<xsl:when test="$zone826='2090349834' or $zone826='2090350347' or $zone826='2090349622' or $zone826='2090358469' or $zone826='2090297541' or $zone826='2090349960' or $zone826='2090354308' or $zone826='2090362185' or $zone826='2090348670'">1540</xsl:when>
				<xsl:when test="$zone826='2090357048' or $zone826='2090350938' or $zone826='2090363376' or $zone826='2090348656' or $zone826='2090359881' or $zone826='2090352967' or $zone826='2090354595' or $zone826='2090353367' or $zone826='2090358709' or $zone826='2090352361' or $zone826='2090359775'">1541</xsl:when>
				<xsl:when test="$zone826='2090352749' or $zone826='2090345831' or $zone826='2090357322' or $zone826='2090356013' or $zone826='2090319540' or $zone826='2090316907' or $zone826='2090324585'">1542</xsl:when>
				<xsl:when test="$zone826='2090356686' or $zone826='2090348874' or $zone826='2090350138' or $zone826='2090350157' or $zone826='2090364751' or $zone826='2090348729' or $zone826='2090361241' or $zone826='2090351805' or $zone826='2090357197' or $zone826='2090359932'">1543</xsl:when>
				<xsl:when test="$zone826='2090347321' or $zone826='2090351218' or $zone826='2090347476' or $zone826='2090314631' or $zone826='2090358083' or $zone826='2090314411' or $zone826='2090313991'">1544</xsl:when>
				<xsl:when test="$zone826='2090349852' or $zone826='2090363753' or $zone826='2090343721' or $zone826='2090356042' or $zone826='2090353136' or $zone826='2090363364' or $zone826='2090349773' or $zone826='2090351790' or $zone826='2090354269' or $zone826='2090303547' or $zone826='2090324558' or $zone826='2090354346' or $zone826='2090355698' or $zone826='2090361866' or $zone826='2090348528' or $zone826='2090358601' or $zone826='2090345424' or $zone826='2090357334' or $zone826='2090311420' or $zone826='2090346962' or $zone826='2090346840' or $zone826='2090360956' or $zone826='2090354867' or $zone826='2090355708'">1545</xsl:when>
				<xsl:when test="$zone826='2090349838' or $zone826='2090362867' or $zone826='2090352927' or $zone826='2090358214' or $zone826='2090349815' or $zone826='2090355614' or $zone826='2090345629' or $zone826='2090348701' or $zone826='2090354659' or $zone826='2090362032' or $zone826='2090306071' or $zone826='2090354853' or $zone826='2090343936' or $zone826='2090348773' or $zone826='2090355972' or $zone826='2090358524' or $zone826='2090327178' or $zone826='2090311311' or $zone826='2090344858' or $zone826='2090361066' or $zone826='2090343748' or $zone826='2090361119' or $zone826='2090361142' or $zone826='2090357194' or $zone826='2090348860' or $zone826='2090358791' or $zone826='2090354887' or $zone826='2090345500' or $zone826='2090354619' or $zone826='2090363698' or $zone826='2090348933' or $zone826='2090358256' or $zone826='2090350826' or $zone826='2090356041'">1546</xsl:when>
				<xsl:when test="$zone826='2090319126' or $zone826='2090358789' or $zone826='2090355695' or $zone826='2090351419' or $zone826='2090360063' or $zone826='2090359570' or $zone826='2090360811' or $zone826='2090362178' or $zone826='2090363395' or $zone826='2090303331' or $zone826='2090308808' or $zone826='2090303369' or $zone826='2090316764' or $zone826='2090300157' or $zone826='2090311522' or $zone826='2090309132' or $zone826='2090321502' or $zone826='2090326620' or $zone826='2090314446'">1547</xsl:when>
				<xsl:when test="$zone826='2090316572' or $zone826='2090354891' or $zone826='2090297560' or $zone826='2090358423' or $zone826='2090360920' or $zone826='2090352411' or $zone826='2090347485'">1548</xsl:when>
				<xsl:when test="$zone826='2090357002' or $zone826='2090359939' or $zone826='2090356791' or $zone826='2090354851' or $zone826='2090362075' or $zone826='2090357467' or $zone826='2090354320' or $zone826='2090361697' or $zone826='2090317037' or $zone826='2090303573' or $zone826='2090352552' or $zone826='2090350227' or $zone826='2090317168' or $zone826='2090351060'">1549</xsl:when>
				<xsl:when test="$zone826='2090351319' or $zone826='2090361207' or $zone826='2090304496' or $zone826='2090354024' or $zone826='2090300497' or $zone826='2090311768' or $zone826='2090308611' or $zone826='2090358377' or $zone826='2090300433' or $zone826='2090297466' or $zone826='2090322003' or $zone826='2090317318' or $zone826='2090314520' or $zone826='2090297494' or $zone826='2090300120' or $zone826='2090303453' or $zone826='2090321941' or $zone826='2090309157' or $zone826='2090297643' or $zone826='2090306429' or $zone826='2090321918' or $zone826='2090303542' or $zone826='2090308683' or $zone826='2090303433' or $zone826='2090311438' or $zone826='2090311761' or $zone826='2090303556' or $zone826='2090355609' or $zone826='2090355522' or $zone826='2090352571' or $zone826='2090324523' or $zone826='2090303003' or $zone826='2090326977' or $zone826='2090300086'">1550</xsl:when>
				<xsl:when test="$zone826='2090358579' or $zone826='2090348436' or $zone826='2090346040' or $zone826='2090358779' or $zone826='2090362760' or $zone826='2090364814' or $zone826='2090346010' or $zone826='2090349211' or $zone826='2090359770' or $zone826='2090319365' or $zone826='2090350379' or $zone826='2090358246' or $zone826='2090348460' or $zone826='2090358161' or $zone826='2090345644'">1551</xsl:when>
				<xsl:when test="$zone826='2090302251' or $zone826='2090357962' or $zone826='2090361201' or $zone826='2090357127' or $zone826='2090359750' or $zone826='2090311600' or $zone826='2090357999' or $zone826='2090356988' or $zone826='2090348581' or $zone826='2090309303' or $zone826='2090349944' or $zone826='2090354421' or $zone826='2090346049' or $zone826='2090354104' or $zone826='2090344035'">1552</xsl:when>
				<xsl:when test="$zone826='2090359722' or $zone826='2090348958' or $zone826='2090354918' or $zone826='2090360787' or $zone826='2090349169' or $zone826='2090349190' or $zone826='2090300485' or $zone826='2090314067' or $zone826='2090349121' or $zone826='2090351055' or $zone826='2090354093' or $zone826='2090358385'">1553</xsl:when>
				<xsl:when test="$zone826='2090316902' or $zone826='2090356714' or $zone826='2090355604' or $zone826='2090359838' or $zone826='2090311235' or $zone826='2090357408' or $zone826='2090353440' or $zone826='2090358326' or $zone826='2090300408' or $zone826='2090311639' or $zone826='2090309338' or $zone826='2090300105' or $zone826='2090324641' or $zone826='2090300256' or $zone826='2090314114' or $zone826='2090308615' or $zone826='2090303555' or $zone826='2090314467' or $zone826='2090317180' or $zone826='2090302980' or $zone826='2090314449' or $zone826='2090317251' or $zone826='2090300381' or $zone826='2090326777' or $zone826='2090356804' or $zone826='2090360881' or $zone826='2090345727' or $zone826='2090345075' or $zone826='2090351826' or $zone826='2090354099' or $zone826='2090351382' or $zone826='2090347304' or $zone826='2090348485' or $zone826='2090346774' or $zone826='2090348713'">1554</xsl:when>
				<xsl:when test="$zone826='2090348836' or $zone826='2090358457' or $zone826='2090352729' or $zone826='2090365206' or $zone826='2090361158' or $zone826='2090351397' or $zone826='2090356813' or $zone826='2090311665' or $zone826='2090308877' or $zone826='2090311543' or $zone826='2090326745' or $zone826='2090303340' or $zone826='2090319405' or $zone826='2090314558' or $zone826='2090308670' or $zone826='2090311844' or $zone826='2090303175' or $zone826='2090319189' or $zone826='2090327211' or $zone826='2090316899' or $zone826='2090326888' or $zone826='2090361167' or $zone826='2090350345' or $zone826='2090361275' or $zone826='2090358648' or $zone826='2090348802' or $zone826='2090349940' or $zone826='2090348991'">1555</xsl:when>
				<xsl:when test="$zone826='2090357415' or $zone826='2090348431' or $zone826='2090358684' or $zone826='2090359654' or $zone826='2090347273' or $zone826='2090302953' or $zone826='2090308612' or $zone826='2090303106' or $zone826='2090350426' or $zone826='2090348921' or $zone826='2090353331' or $zone826='2090344893'">1556</xsl:when>
				<xsl:when test="$zone826='2090362937' or $zone826='2090359540' or $zone826='2090347459' or $zone826='2090356899' or $zone826='2090358014' or $zone826='2090361653' or $zone826='2090358364' or $zone826='2090351861' or $zone826='2090361918' or $zone826='2090351769' or $zone826='2090355521' or $zone826='2090297460' or $zone826='2090355486' or $zone826='2090299853' or $zone826='2090306251' or $zone826='2090311517' or $zone826='2090327076' or $zone826='2090303163' or $zone826='2090306129' or $zone826='2090345767' or $zone826='2090355583' or $zone826='2090347494'">1557</xsl:when>
				<xsl:when test="$zone826='2090361240' or $zone826='2090347720' or $zone826='2090347442' or $zone826='2090351467' or $zone826='2090357410' or $zone826='2090358088' or $zone826='2090356814' or $zone826='2090358603' or $zone826='2090348693' or $zone826='2090350974' or $zone826='2090355988' or $zone826='2090363410' or $zone826='2090351234' or $zone826='2090299897' or $zone826='2090300206' or $zone826='2090321746' or $zone826='2090306171' or $zone826='2090306465' or $zone826='2090309339' or $zone826='2090311614' or $zone826='2090300278' or $zone826='2090316773' or $zone826='2090302859' or $zone826='2090303095' or $zone826='2090306195' or $zone826='2090306595' or $zone826='2090326637' or $zone826='2090308889' or $zone826='2090358147' or $zone826='2090348396' or $zone826='2090350941' or $zone826='2090311242' or $zone826='2090316699' or $zone826='2090324642' or $zone826='2090316493' or $zone826='2090345109' or $zone826='2090358237' or $zone826='2090357286'">1558</xsl:when>
				<xsl:when test="$zone826='2090351593' or $zone826='2090346779' or $zone826='2090349871' or $zone826='2090359820' or $zone826='2090354657' or $zone826='2090348763' or $zone826='2090311440' or $zone826='2090308790' or $zone826='2090327188' or $zone826='2090314492' or $zone826='2090314586' or $zone826='2090321481' or $zone826='2090302831' or $zone826='2090316965' or $zone826='2090319013' or $zone826='2090314110' or $zone826='2090324466' or $zone826='2090311674' or $zone826='2090319111' or $zone826='2090356219' or $zone826='2090315099' or $zone826='2090357353' or $zone826='2090362930' or $zone826='2090358782' or $zone826='2090353386' or $zone826='2090300052' or $zone826='2090361214' or $zone826='2090357407' or $zone826='2090299876'">1559</xsl:when>
				<xsl:when test="$zone826='2090362934' or $zone826='2090348879' or $zone826='2090349791' or $zone826='2090354969' or $zone826='2090309350' or $zone826='2090327011' or $zone826='2090300274' or $zone826='2090319407' or $zone826='2090300150' or $zone826='2090306294' or $zone826='2090324712' or $zone826='2090308703' or $zone826='2090319482' or $zone826='2090317099' or $zone826='2090347721' or $zone826='2090347801' or $zone826='2090352824' or $zone826='2090364430' or $zone826='2090351463'">1560</xsl:when>
				<xsl:when test="$zone826='2090351600' or $zone826='2090349988' or $zone826='2090348710' or $zone826='2090351827' or $zone826='2090352470' or $zone826='2090349616' or $zone826='2090316772' or $zone826='2090314575' or $zone826='2090324859' or $zone826='2090363686' or $zone826='2090351653' or $zone826='2090347251' or $zone826='2090352366' or $zone826='2090297597' or $zone826='2090300127' or $zone826='2090354985'">1561</xsl:when>
				<xsl:when test="$zone826='2090343913' or $zone826='2090350220' or $zone826='2090364783' or $zone826='2090358051' or $zone826='2090351148' or $zone826='2090317068' or $zone826='2090303145' or $zone826='2090308916' or $zone826='2090309166' or $zone826='2090348657' or $zone826='2090346006' or $zone826='2090346957' or $zone826='2090345880' or $zone826='2090355493' or $zone826='2090361641' or $zone826='2090351162' or $zone826='2090354968' or $zone826='2090355783'">1562</xsl:when>
				<xsl:when test="$zone826='2090365250' or $zone826='2090358772' or $zone826='2090359956' or $zone826='2090348591' or $zone826='2090358632' or $zone826='2090361197' or $zone826='2090363433' or $zone826='2090348800' or $zone826='2090363612' or $zone826='2090353485' or $zone826='2090349232' or $zone826='2090364671' or $zone826='2090347403' or $zone826='2090303588'">1563</xsl:when>
				<xsl:when test="$zone826='2090358738' or $zone826='2090358761' or $zone826='2090308681' or $zone826='2090351807' or $zone826='2090345291' or $zone826='2090350140' or $zone826='2090364711' or $zone826='2090362521' or $zone826='2090349867' or $zone826='2090364810' or $zone826='2090356104' or $zone826='2090343999' or $zone826='2090355596' or $zone826='2090352583' or $zone826='2090361837' or $zone826='2090354414'">1564</xsl:when>
				<xsl:when test="$zone826='2090362750' or $zone826='2090351848' or $zone826='2090353426' or $zone826='2090355502' or $zone826='2090306072' or $zone826='2090316522' or $zone826='2090324649' or $zone826='2090354450' or $zone826='2090349853'">1565</xsl:when>
				<xsl:when test="$zone826='2090356898' or $zone826='2090352562' or $zone826='2090353118' or $zone826='2090354638' or $zone826='2090352806' or $zone826='2090362820' or $zone826='2090365248' or $zone826='2090357416' or $zone826='2090354815' or $zone826='2090348954' or $zone826='2090309346' or $zone826='2090351431' or $zone826='2090356027' or $zone826='2090324499' or $zone826='2090347166' or $zone826='2090354991' or $zone826='2090350841' or $zone826='2090352781'">1566</xsl:when>
				<xsl:when test="$zone826='2090356241' or $zone826='2090360125' or $zone826='2090356123' or $zone826='2090353105' or $zone826='2090352753' or $zone826='2090350975' or $zone826='2090363906'">1567</xsl:when>
				<xsl:when test="$zone826='2090355973' or $zone826='2090327088' or $zone826='2090314425' or $zone826='2090311603' or $zone826='2090314626' or $zone826='2090305983' or $zone826='2090324292' or $zone826='2090313984' or $zone826='2090327316' or $zone826='2090306412' or $zone826='2090308658' or $zone826='2090324682' or $zone826='2090324326' or $zone826='2090305988' or $zone826='2090306354'">1568</xsl:when>
				<xsl:when test="$zone826='2090352928' or $zone826='2090363864' or $zone826='2090345605' or $zone826='2090362829' or $zone826='2090361692' or $zone826='2090353346' or $zone826='2090309073' or $zone826='2090358466' or $zone826='2090363749' or $zone826='2090349216'">1569</xsl:when>
				<xsl:when test="$zone826='2090356771' or $zone826='2090365309' or $zone826='2090356111' or $zone826='2090346033' or $zone826='2090358166' or $zone826='2090351323' or $zone826='2090345848' or $zone826='2090308898' or $zone826='2090309122' or $zone826='2090326837' or $zone826='2090311790' or $zone826='2090308967' or $zone826='2090309258' or $zone826='2090300534' or $zone826='2090314023' or $zone826='2090314440' or $zone826='2090308695' or $zone826='2090311946' or $zone826='2090300328' or $zone826='2090306156' or $zone826='2090303412' or $zone826='2090321967' or $zone826='2090309340' or $zone826='2090359803' or $zone826='2090355587' or $zone826='2090352586' or $zone826='2090364675' or $zone826='2090356998' or $zone826='2090346843' or $zone826='2090327200' or $zone826='2090309066' or $zone826='2090353493'">1570</xsl:when>
				<xsl:when test="$zone826='2090354259' or $zone826='2090357025' or $zone826='2090352422' or $zone826='2090343834' or $zone826='2090345083' or $zone826='2090361035' or $zone826='2090358020' or $zone826='2090353498' or $zone826='2090356000' or $zone826='2090354042' or $zone826='2090306266' or $zone826='2090327347' or $zone826='2090314533' or $zone826='2090324231' or $zone826='2090303563' or $zone826='2090309279' or $zone826='2090319267' or $zone826='2090300349' or $zone826='2090297615' or $zone826='2090327089' or $zone826='2090357971' or $zone826='2090349625'">1571</xsl:when>
				<xsl:when test="$zone826='2090358279' or $zone826='2090354340' or $zone826='2090361929' or $zone826='2090360772' or $zone826='2090311452' or $zone826='2090297435' or $zone826='2090319059' or $zone826='2090308965' or $zone826='2090311819' or $zone826='2090300154' or $zone826='2090319108' or $zone826='2090308785' or $zone826='2090313982' or $zone826='2090300097' or $zone826='2090326617' or $zone826='2090314221' or $zone826='2090309234' or $zone826='2090324721' or $zone826='2090306437' or $zone826='2090324492' or $zone826='2090308663' or $zone826='2090314479' or $zone826='2090359768' or $zone826='2090363855'">1572</xsl:when>
				<xsl:when test="$zone826='2090302958' or $zone826='2090347577' or $zone826='2090309098' or $zone826='2090362531' or $zone826='2090360789' or $zone826='2090356097'">1573</xsl:when>
				<xsl:when test="$zone826='2090357423' or $zone826='2090345949' or $zone826='2090362501' or $zone826='2090357027' or $zone826='2090358115'">1574</xsl:when>
				<xsl:when test="$zone826='2090346055' or $zone826='2090311820' or $zone826='2090357214' or $zone826='2090344876' or $zone826='2090306519' or $zone826='2090354442' or $zone826='2090358254' or $zone826='2090345404' or $zone826='2090350359' or $zone826='2090316554' or $zone826='2090317091' or $zone826='2090300412' or $zone826='2090359532' or $zone826='2090347646' or $zone826='2090351843' or $zone826='2090358506' or $zone826='2090354413' or $zone826='2090359941' or $zone826='2090309051' or $zone826='2090345954' or $zone826='2090354348'">1575</xsl:when>
				<xsl:when test="$zone826='2090361203' or $zone826='2090361972' or $zone826='2090354608' or $zone826='2090354830' or $zone826='2090359640' or $zone826='2090348585' or $zone826='2090357973' or $zone826='2090356752' or $zone826='2090309218' or $zone826='2090317312' or $zone826='2090308691' or $zone826='2090311419' or $zone826='2090354330' or $zone826='2090349938' or $zone826='2090311387'">1576</xsl:when>
				<xsl:when test="$zone826='2090346159' or $zone826='2090311437' or $zone826='2090306094' or $zone826='2090317277' or $zone826='2090308908' or $zone826='2090300235' or $zone826='2090308774' or $zone826='2090303304' or $zone826='2090311679' or $zone826='2090303509' or $zone826='2090358332'">1578</xsl:when>
				<xsl:when test="$zone826='2090326709' or $zone826='2090351462' or $zone826='2090297470' or $zone826='2090309115' or $zone826='2090300030' or $zone826='2090321986' or $zone826='2090300220' or $zone826='2090302947' or $zone826='2090324877' or $zone826='2090324521' or $zone826='2090303156' or $zone826='2090324609'">1579</xsl:when>
				<xsl:when test="$zone826='2090357000' or $zone826='2090358617' or $zone826='2090327151' or $zone826='2090316771' or $zone826='2090319437' or $zone826='2090324629' or $zone826='2090308693' or $zone826='2090300337' or $zone826='2090319549' or $zone826='2090317041' or $zone826='2090300483' or $zone826='2090314601' or $zone826='2090321620' or $zone826='2090303094' or $zone826='2090308618' or $zone826='2090297641' or $zone826='2090300434' or $zone826='2090327071' or $zone826='2090303091' or $zone826='2090309267' or $zone826='2090299880' or $zone826='2090303002' or $zone826='2090319538' or $zone826='2090300233' or $zone826='2090319563' or $zone826='2090306459' or $zone826='2090306446' or $zone826='2090319388' or $zone826='2090297522' or $zone826='2090305977' or $zone826='2090311551' or $zone826='2090314502' or $zone826='2090297524' or $zone826='2090311416'">1580</xsl:when>
				<xsl:when test="$zone826='2090347348' or $zone826='2090358435' or $zone826='2090351887' or $zone826='2090347244' or $zone826='2090313887' or $zone826='2090304860' or $zone826='2090309089' or $zone826='2090352398' or $zone826='2090300491' or $zone826='2090327207' or $zone826='2090300493' or $zone826='2090311537' or $zone826='2090316980' or $zone826='2090309142' or $zone826='2090305917' or $zone826='2090306002' or $zone826='2090364613' or $zone826='2090355001' or $zone826='2090358573'">1581</xsl:when>
				<xsl:when test="$zone826='2090358650' or $zone826='2090343707' or $zone826='2090359772' or $zone826='2090350190' or $zone826='2090354026' or $zone826='2090351186' or $zone826='2090356887' or $zone826='2090314251' or $zone826='2090308971' or $zone826='2090305903' or $zone826='2090308623' or $zone826='2090306540' or $zone826='2090306601' or $zone826='2090347455'">1582</xsl:when>
				<xsl:when test="$zone826='2090361724' or $zone826='2090347650' or $zone826='2090350391' or $zone826='2090308639' or $zone826='2090300058' or $zone826='2090309255' or $zone826='2090297495' or $zone826='2090348847' or $zone826='2090358760' or $zone826='2090360026' or $zone826='2090303277' or $zone826='2090311629' or $zone826='2090311955' or $zone826='2090314034' or $zone826='2090316783' or $zone826='2090306587'">1583</xsl:when>
				<xsl:when test="$zone826='2090303023' or $zone826='2090324341' or $zone826='2090317205' or $zone826='2090311965' or $zone826='2090324687' or $zone826='2090314087' or $zone826='2090329034' or $zone826='2090359725' or $zone826='2090319415' or $zone826='2090311226' or $zone826='2090362011'">1584</xsl:when>
				<xsl:when test="$zone826='2090345838' or $zone826='2090354652' or $zone826='2090354469' or $zone826='2090364669' or $zone826='2090358124' or $zone826='2090352821' or $zone826='2090300329' or $zone826='2090303079' or $zone826='2090311412' or $zone826='2090306506' or $zone826='2090324881' or $zone826='2090316492' or $zone826='2090303616' or $zone826='2090311550' or $zone826='2090327078' or $zone826='2090363005' or $zone826='2090352445' or $zone826='2090347447' or $zone826='2090349577'">1585</xsl:when>
				<xsl:when test="$zone826='2090314583' or $zone826='2090349649' or $zone826='2090359851' or $zone826='2090345255' or $zone826='2090351176' or $zone826='2090327289' or $zone826='2090345966'">1586</xsl:when>
				<xsl:when test="$zone826='2090357284' or $zone826='2090306478' or $zone826='2090319351' or $zone826='2090299990' or $zone826='2090309273' or $zone826='2090299844' or $zone826='2090311236' or $zone826='2090324781' or $zone826='2090359957' or $zone826='2090356116'">1587</xsl:when>
				<xsl:when test="$zone826='2090346936' or $zone826='2090350374' or $zone826='2090358319' or $zone826='2090300355' or $zone826='2090308901' or $zone826='2090324486' or $zone826='2090316620' or $zone826='2090316674' or $zone826='2090306298' or $zone826='2090306135' or $zone826='2090303257' or $zone826='2090319391' or $zone826='2090326987' or $zone826='2090303389' or $zone826='2090306559' or $zone826='2090309227' or $zone826='2090316901' or $zone826='2090299865' or $zone826='2090311626' or $zone826='2090303488' or $zone826='2090317187' or $zone826='2090311384' or $zone826='2090316489' or $zone826='2090351666' or $zone826='2090311954' or $zone826='2090300406' or $zone826='2090303324' or $zone826='2090314548' or $zone826='2090361091'">1588</xsl:when>
				<xsl:when test="$zone826='2090347812' or $zone826='2090345343' or $zone826='2090347152' or $zone826='2090347671' or $zone826='2090354454' or $zone826='2090347814' or $zone826='2090300163' or $zone826='2090326781' or $zone826='2090314616' or $zone826='2090317124' or $zone826='2090316696' or $zone826='2090309312' or $zone826='2090309163' or $zone826='2090300072' or $zone826='2090314423' or $zone826='2090314553' or $zone826='2090316687' or $zone826='2090306501' or $zone826='2090300132' or $zone826='2090300184' or $zone826='2090314615' or $zone826='2090321516' or $zone826='2090309219' or $zone826='2090311843' or $zone826='2090300311' or $zone826='2090349593' or $zone826='2090358413'">1589</xsl:when>
				<xsl:when test="$zone826='2090364775' or $zone826='2090297548' or $zone826='2090299833' or $zone826='2090327117' or $zone826='2090350066' or $zone826='2090316662' or $zone826='2090356223' or $zone826='2090311521' or $zone826='2090324371' or $zone826='2090314136' or $zone826='2090322038' or $zone826='2090316798' or $zone826='2090308624' or $zone826='2090319083' or $zone826='2090306530' or $zone826='2090326972' or $zone826='2090306452' or $zone826='2090321816' or $zone826='2090297536' or $zone826='2090309062' or $zone826='2090321716' or $zone826='2090355755' or $zone826='2090347327' or $zone826='2090346107' or $zone826='2090308679' or $zone826='2090311911'">1590</xsl:when>
				<xsl:when test="$zone826='2090350002' or $zone826='2090346013' or $zone826='2090345112' or $zone826='2090360036' or $zone826='2090346932' or $zone826='2090322026' or $zone826='2090303341' or $zone826='2090311343' or $zone826='2090309314'">1591</xsl:when>
				<xsl:when test="$zone826='2090354920' or $zone826='2090343857' or $zone826='2090316725' or $zone826='2090326976' or $zone826='2090311409' or $zone826='2090314380' or $zone826='2090324474' or $zone826='2126543559'">1592</xsl:when>
				<xsl:when test="$zone826='2090356099'">1593</xsl:when>
				<xsl:when test="$zone826='2090308903' or $zone826='2090306016' or $zone826='2090311576' or $zone826='2090306082' or $zone826='2090358447'">1594</xsl:when>
				<xsl:when test="$zone826='2090300125' or $zone826='2090317170' or $zone826='2090303564' or $zone826='2090308752' or $zone826='2090303413' or $zone826='2090317097'">1595</xsl:when>
				<xsl:when test="$zone826='2090308979' or $zone826='2090300160' or $zone826='2090306554' or $zone826='2090308678' or $zone826='2090300397' or $zone826='2090327266' or $zone826='2090309238' or $zone826='2090303572' or $zone826='2090343833'">1596</xsl:when>
				<xsl:when test="$zone826='2090314366' or $zone826='2090311770'">1597</xsl:when>
				<xsl:when test="$zone826='2090357324' or $zone826='2090327296'">1599</xsl:when>
				<xsl:when test="$zone826='2090306468' or $zone826='2090324308' or $zone826='2090316809' or $zone826='2090306463' or $zone826='2090317250' or $zone826='2090324295' or $zone826='2090316545' or $zone826='2090308672' or $zone826='2090308613' or $zone826='2090311309' or $zone826='2090309074' or $zone826='2090319537' or $zone826='2090300151' or $zone826='2090300432' or $zone826='2090300490' or $zone826='2090297664' or $zone826='2090311405' or $zone826='2090297415' or $zone826='2090311395' or $zone826='2090300411' or $zone826='2090316940' or $zone826='2090308964' or $zone826='2090311373' or $zone826='2090300347' or $zone826='2090302823' or $zone826='2090302841' or $zone826='2090306364' or $zone826='2090324562' or $zone826='2090316744' or $zone826='2090316956' or $zone826='2090314122' or $zone826='2090319581' or $zone826='2090309287' or $zone826='2090308810' or $zone826='2090314058' or $zone826='2090314581' or $zone826='2090319097' or $zone826='2090303501' or $zone826='2090297489' or $zone826='2090316986' or $zone826='2090319429' or $zone826='2090303086' or $zone826='2090300516'">1600</xsl:when>
				<xsl:when test="$zone826='2090305935' or $zone826='2090306525' or $zone826='2090308644' or $zone826='2090317008' or $zone826='2090317018' or $zone826='2090303242' or $zone826='2090311407' or $zone826='2090326640'">1601</xsl:when>
				<xsl:when test="$zone826='2090299838' or $zone826='2090316695'">1602</xsl:when>
				<xsl:when test="$zone826='2090321827'">1603</xsl:when>
				<xsl:when test="$zone826='2090300425'">1604</xsl:when>
				<xsl:when test="$zone826='2090311708' or $zone826='2090300273' or $zone826='2090316815' or $zone826='2090319223' or $zone826='2090303430' or $zone826='2090319191' or $zone826='2090308988' or $zone826='2090303241' or $zone826='2090319410' or $zone826='2090297653'">1606</xsl:when>
				<xsl:when test="$zone826='2090299912' or $zone826='2090314594' or $zone826='2090314542'">1607</xsl:when>
				<xsl:when test="$zone826='2090303182' or $zone826='2090309290' or $zone826='2090300167' or $zone826='2090326999' or $zone826='2126543587'">1608</xsl:when>
				<xsl:when test="$zone826='2090318975' or $zone826='2090326713' or $zone826='2090311230'">1609</xsl:when>
				<xsl:when test="$zone826='2090311813' or $zone826='2090321712' or $zone826='2090314078' or $zone826='2090297507' or $zone826='2090327133' or $zone826='2090316895' or $zone826='2090309333' or $zone826='2090319475' or $zone826='2090314409'">1610</xsl:when>
				<xsl:when test="$zone826='2090316765' or $zone826='2090314131'">1611</xsl:when>
				<xsl:when test="$zone826='2090297438' or $zone826='2090326787' or $zone826='2090306260'">1612</xsl:when>
				<xsl:when test="$zone826='2090306153' or $zone826='2090327160' or $zone826='2090299850' or $zone826='2090300350' or $zone826='2090297658' or $zone826='2090311817' or $zone826='2090300025' or $zone826='2090300156' or $zone826='2090311941'">1613</xsl:when>
				<xsl:when test="$zone826='2090297639' or $zone826='2090317054' or $zone826='2090321842' or $zone826='2090318971' or $zone826='2090314089' or $zone826='2090306368' or $zone826='2090303191'">1614</xsl:when>
				<xsl:when test="$zone826='2090324766' or $zone826='2090300186' or $zone826='2090303157' or $zone826='2090316997'">1615</xsl:when>
				<xsl:when test="$zone826='2126543537' or $zone826='2090316968' or $zone826='2090319012' or $zone826='2090306433' or $zone826='2090322062' or $zone826='2090306193' or $zone826='2090324685' or $zone826='2090311575' or $zone826='2090314625'">1616</xsl:when>
				<xsl:when test="$zone826='2090297583' or $zone826='2090326818' or $zone826='2090300196' or $zone826='2090311414' or $zone826='2090314404' or $zone826='2090309124' or $zone826='2090306594' or $zone826='2090327235' or $zone826='2090311907' or $zone826='2090309119' or $zone826='2090297595'">1617</xsl:when>
				<xsl:when test="$zone826='2090311758' or $zone826='2090327346' or $zone826='2090314458' or $zone826='2090297566' or $zone826='2090317149' or $zone826='2090326920'">1618</xsl:when>
				<xsl:when test="$zone826='2090300342'">1619</xsl:when>
				<xsl:when test="$zone826='2090316682' or $zone826='2090308767' or $zone826='2090297525' or $zone826='2090297585' or $zone826='2090316494' or $zone826='2090324580' or $zone826='2090316548' or $zone826='2090297487' or $zone826='2090311681' or $zone826='2090314534'">1620</xsl:when>
				<xsl:when test="$zone826='2090311757' or $zone826='2090306408' or $zone826='2090300026'">1621</xsl:when>
				<xsl:when test="$zone826='2090300170' or $zone826='2090319066'">1622</xsl:when>
				<xsl:when test="$zone826='2090321637'">1623</xsl:when>
				<xsl:when test="$zone826='2090324332' or $zone826='2090324888'">1625</xsl:when>
				<xsl:when test="$zone826='2090300264'">1629</xsl:when>
				<xsl:when test="$zone826='2090300498' or $zone826='2090303544' or $zone826='2090314197' or $zone826='2090311942'">1630</xsl:when>
				<xsl:when test="$zone826='2090324469'">1633</xsl:when>
				<xsl:when test="$zone826='2090354074'">1641</xsl:when>
				<xsl:when test="$zone826='2090319087' or $zone826='2090321498'">1648</xsl:when>
				<xsl:when test="$zone826='2090316653'">1650</xsl:when>
				<xsl:when test="$zone826='2090321465' or $zone826='2090308628'">1651</xsl:when>
				<xsl:when test="$zone826='2090308665'">1653</xsl:when>
				<xsl:when test="$zone826='2090309345'">1659</xsl:when>
				<xsl:when test="$zone826='2090314245' or $zone826='2090316692' or $zone826='2090297458'">1664</xsl:when>
				<xsl:when test="$zone826='2090311841'">1666</xsl:when>
				<xsl:when test="$zone826='2090302993'">1669</xsl:when>
				<xsl:when test="$zone826='2090306492'">1673</xsl:when>
				<xsl:when test="$zone826='2090306293'">1674</xsl:when>
				<xsl:when test="$zone826='2090300020'">1680</xsl:when>
				<xsl:when test="$zone826='2090303537'">1684</xsl:when>
				<xsl:when test="$zone826='2090311703'">1688</xsl:when>
				<xsl:otherwise>
					<!-- tmee 1.35 1.36 dateIssued/nonMSS vs dateCreated/MSS -->
					<xsl:choose>
						<xsl:when test="marc:datafield[@tag=260]">
							<xsl:for-each select="marc:datafield[@tag=260]/marc:subfield[@code='b' or @code='c' or @code='g']">
								<xsl:choose>
									<xsl:when test="@code='c'">
										<xsl:choose>
											<xsl:when test="$leader6='d' or $leader6='f' or $leader6='p' or $leader6='t'">
												<xsl:call-template name="chopPunctuation">
													<xsl:with-param name="chopString" select="."/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="translate(.,'.?abcdefghijklmnopqrstuvwxyz]','')"/>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="$leader6='d' or $leader6='f' or $leader6='p' or $leader6='t'">
											<xsl:call-template name="chopPunctuation">
												<xsl:with-param name="chopString" select="."/>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:when test="@code='g'">
										<xsl:if test="$leader6='d' or $leader6='f' or $leader6='p' or $leader6='t'">
											<xsl:value-of select="."/>
										</xsl:if>
										<xsl:if test="not($leader6='d' or $leader6='f' or $leader6='p' or $leader6='t')">
											<xsl:value-of select="."/>
										</xsl:if>
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="marc:datafield[@tag=214]/marc:subfield[@code='d']">
							<xsl:value-of select="marc:datafield[@tag=214]/marc:subfield[@code='d']"/>
						</xsl:when>
					</xsl:choose>
					
				</xsl:otherwise>
			</xsl:choose>
			<xsl:for-each select="marc:datafield[@tag=046]/marc:subfield[@code='m']">
				<date type="valid" from="{.}">
					<xsl:value-of select="."/>
				</date>
			</xsl:for-each>
			<xsl:for-each select="marc:datafield[@tag=046]/marc:subfield[@code='n']">
				<date type="valid" to="{.}">
					<xsl:value-of select="."/>
				</date>
			</xsl:for-each>
			<xsl:for-each select="marc:datafield[@tag=046]/marc:subfield[@code='j']">
				<date type="modified">
					<xsl:value-of select="."/>
				</date>
			</xsl:for-each>
			
			<!-- tmee 1.52 -->
			
			<xsl:for-each select="marc:datafield[@tag=046]/marc:subfield[@code='c']">
				<date type="created" from="{.}">
					<xsl:value-of select="."/>
				</date>
			</xsl:for-each>
			<xsl:for-each select="marc:datafield[@tag=046]/marc:subfield[@code='e']">
				<date type="created" to="{.}">
					<xsl:value-of select="."/>
				</date>
			</xsl:for-each>
			
			<xsl:for-each select="marc:datafield[@tag=046]/marc:subfield[@code='k']">
				<date type="created" from="{.}">
					<xsl:value-of select="."/>
				</date>
			</xsl:for-each>
			<xsl:for-each select="marc:datafield[@tag=046]/marc:subfield[@code='l']">
				<date type="created" to="{.}">
					<xsl:value-of select="."/>
				</date>
			</xsl:for-each>
			
			<xsl:variable name="dataField260c">
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString" select="marc:datafield[@tag=260]/marc:subfield[@code='c'][1]"/>
				</xsl:call-template>
			</xsl:variable>
			
			
			<!-- tmee 1.35 and 1.36 and 1.84-->
			<xsl:if test="($controlField008-6='e' or $controlField008-6='p' or $controlField008-6='r' or $controlField008-6='s' or $controlField008-6='t') and ($leader6='d' or $leader6='f' or $leader6='p' or $leader6='t')">
				<xsl:if test="$controlField008-7-10 and ($controlField008-7-10 != $dataField260c)">
					<date type="created">
						<xsl:value-of select="$controlField008-7-10"/>
					</date>
				</xsl:if>
			</xsl:if>
			<xsl:if test="$controlField008-6='c' or $controlField008-6='d' or $controlField008-6='i' or $controlField008-6='k' or $controlField008-6='m' or $controlField008-6='u'">
				<date type="marc">
					<xsl:attribute name="to">
						<xsl:choose>
							<xsl:when test="//marc:controlfield[@tag=001]='ocm27954405e '">
								<xsl:text>1670</xsl:text>
							</xsl:when>
							<xsl:when test="//marc:controlfield[@tag=001]='ocm99888822e '">
								<xsl:text>1690</xsl:text>
							</xsl:when>
							<xsl:when test="//marc:controlfield[@tag=001]='ocm27647912e '">
								<xsl:text>1680</xsl:text>
							</xsl:when>
							<xsl:when test="//marc:controlfield[@tag=001]='ocm27903504e '">
								<xsl:text>1640</xsl:text>
							</xsl:when>
							<xsl:when test="//marc:controlfield[@tag=001]='ocm99882523e '">
								<xsl:text>1689</xsl:text>
							</xsl:when>
							<xsl:when test="//marc:controlfield[@tag=001]='ocm27648311e '">
								<xsl:text>1680</xsl:text>
							</xsl:when>
							<xsl:when test="//marc:controlfield[@tag=001]='ocm99882531e '">
								<xsl:text>1737</xsl:text>
							</xsl:when>
							<xsl:when test="//marc:controlfield[@tag=001]='ocm27698320e '">
								<xsl:text>1654</xsl:text>
							</xsl:when>
							<xsl:when test="//marc:controlfield[@tag=001]='ocn226317594e '">
								<xsl:text>1800</xsl:text>
							</xsl:when>
							<xsl:when test="//marc:controlfield[@tag=001]='ocm99882525e '">
								<xsl:text>1691</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="$controlField008-11-14">
									<xsl:value-of select="$controlField008-11-14"/>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="//marc:controlfield[@tag=001]='ocm27954405e '">
							<xsl:text>1670</xsl:text>
						</xsl:when>
						<xsl:when test="//marc:controlfield[@tag=001]='ocm99888822e '">
							<xsl:text>1690</xsl:text>
						</xsl:when>
						<xsl:when test="//marc:controlfield[@tag=001]='ocm27647912e '">
							<xsl:text>1680</xsl:text>
						</xsl:when>
						<xsl:when test="//marc:controlfield[@tag=001]='ocm27903504e '">
							<xsl:text>1640</xsl:text>
						</xsl:when>
						<xsl:when test="//marc:controlfield[@tag=001]='ocm99882523e '">
							<xsl:text>1689</xsl:text>
						</xsl:when>
						<xsl:when test="//marc:controlfield[@tag=001]='ocm27648311e '">
							<xsl:text>1680</xsl:text>
						</xsl:when>
						<xsl:when test="//marc:controlfield[@tag=001]='ocm99882531e '">
							<xsl:text>1737</xsl:text>
						</xsl:when>
						<xsl:when test="//marc:controlfield[@tag=001]='ocm27698320e '">
							<xsl:text>1654</xsl:text>
						</xsl:when>
						<xsl:when test="//marc:controlfield[@tag=001]='ocn226317594e '">
							<xsl:text>1800</xsl:text>
						</xsl:when>
						<xsl:when test="//marc:controlfield[@tag=001]='ocm99882525e '">
							<xsl:text>1691</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="$controlField008-11-14">
								<xsl:value-of select="$controlField008-11-14"/>
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</date>
			</xsl:if>
			
			<xsl:if test="$controlField008-6='c' or $controlField008-6='d' or $controlField008-6='i' or $controlField008-6='k' or $controlField008-6='m' or $controlField008-6='u'">
				<xsl:if test="$controlField008-7-10">
					<date type="marc" from="{$controlField008-7-10}">
						<xsl:value-of select="$controlField008-7-10"/>
					</date>
				</xsl:if>
			</xsl:if>
			
			<xsl:if test="$controlField008-6='q'">
				<xsl:if test="$controlField008-11-14">
					<date type="marc" to="{$controlField008-11-14}">
						<xsl:value-of select="$controlField008-11-14"/>
					</date>
				</xsl:if>
			</xsl:if>
			<xsl:if test="$controlField008-6='q'">
				<xsl:if test="$controlField008-7-10">
					<date type="marc" from="{$controlField008-7-10}">
						<xsl:value-of select="$controlField008-7-10"/>
					</date>
				</xsl:if>
			</xsl:if>
		
			<xsl:for-each select="marc:datafield[@tag=033][@ind1=0 or @ind1=1]/marc:subfield[@code='a']">
				<date type="captured" when-iso="iso8601">
					<xsl:value-of select="."/>
				</date>
			</xsl:for-each>
			<xsl:for-each select="marc:datafield[@tag=033][@ind1=2]/marc:subfield[@code='a'][1]">
				<date type="captured" from-iso="iso8601" from="{.}">
					<xsl:value-of select="."/>
				</date>
			</xsl:for-each>
			<xsl:for-each select="marc:datafield[@tag=033][@ind1=2]/marc:subfield[@code='a'][2]">
				<date type="captured" to-iso="iso8601" to="{.}">
					<xsl:value-of select="."/>
				</date>
			</xsl:for-each>
		</xsl:variable>
		
		<!-- ***************************************************************************** -->
		<fileDesc>
			<!-- titleSTMT -->
			<titleStmt>
				<xsl:for-each select="marc:datafield[@tag='245'] | marc:datafield[@tag='200']">
					<xsl:call-template name="createTitleAnalyticInfoFrom245"/>
				</xsl:for-each>
			</titleStmt>
			<!-- editionStmt -->
			<xsl:if test="marc:datafield[@tag=250]/marc:subfield[@code='a']">
				<editionStmt>
					<xsl:for-each select="marc:datafield[@tag=250]/marc:subfield[@code='a']">
						<edition>
							<xsl:value-of select="."/>
						</edition>
					</xsl:for-each>
				</editionStmt>
			</xsl:if>
			<!-- publicationStmt -->
			<publicationStmt>
				<authority>ISTEX</authority>
				<publisher>ProQuest</publisher>
				<availability>
					<licence><p>©<xsl:value-of select="$copyright"/> ProQuest, all rights reserved.</p></licence>
				</availability>
				<date type="published" when="{$date}">
					<xsl:attribute name="when">
						<xsl:value-of select="normalize-space(translate($date,'MDXCIVLabcdefghijklmnopqrstuvwxyz []',''))"/>
					</xsl:attribute>
					<xsl:value-of select="normalize-space(translate($date,'MDXCIVLabcdefghijklmnopqrstuvwxyz []',''))"/>
				</date>
			</publicationStmt>
			<!-- notesStmt -->
			<notesStmt>
				<note type="content-type" source="other" scheme="https://content-type.data.istex.fr/ark:/67375/XTP-7474895G-0">other</note>
				<note type="publication-type" scheme="https://publication-type.data.istex.fr/ark:/67375/JMC-NTSGR1R0-Z">database</note>
				<xsl:if test="substring($controlField008,26,1)='d'">
					<note type="globe" source="globe" scheme="#marcgt">globe</note>
				</xsl:if>
				<xsl:if test="marc:controlfield[@tag='007'][substring(text(),1,1)='a'][substring(text(),2,1)='r']">
					<note type="remote-sensing-image" source="remote-sensing image" scheme="#marcgt">remote-sensing image</note>
				</xsl:if>
				<xsl:if test="$typeOf008='MP'">
					<xsl:variable name="controlField008-25" select="substring($controlField008,26,1)"/>
					<xsl:choose>
						<xsl:when test="$controlField008-25='a' or $controlField008-25='b' or $controlField008-25='c' or marc:controlfield[@tag=007][substring(text(),1,1)='a'][substring(text(),2,1)='j']">
							<note type="map" source="map" scheme="#marcgt">map</note>
						</xsl:when>
						<xsl:when test="$controlField008-25='e' or marc:controlfield[@tag=007][substring(text(),1,1)='a'][substring(text(),2,1)='d']">
							<note type="atlas" source="atlas" scheme="#marcgt">atlas</note>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="$typeOf008='SE'">
					<xsl:variable name="controlField008-21" select="substring($controlField008,22,1)"/>
					<xsl:choose>
						<xsl:when test="$controlField008-21='d'">
							<note type="database" source="database" scheme="#marcgt">database</note>
						</xsl:when>
						<xsl:when test="$controlField008-21='l'">
							<note type="loose-leaf" source="loose-leaf" scheme="#marcgt">loose-leaf</note>
						</xsl:when>
						<xsl:when test="$controlField008-21='m'">
							<note type="series" source="series" scheme="#marcgt">series</note>
						</xsl:when>
						<xsl:when test="$controlField008-21='n'">
							<note type="newspaper" source="newspaper" scheme="#marcgt">newspaper</note>
						</xsl:when>
						<xsl:when test="$controlField008-21='p'">
							<note type="periodical" source="periodical" scheme="#marcgt">periodical</note>
						</xsl:when>
						<xsl:when test="$controlField008-21='w'">
							<note type="web-site" source="web site" scheme="#marcgt">web site</note>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="$typeOf008='BK' or $typeOf008='SE'">
					<xsl:variable name="controlField008-24" select="substring($controlField008,25,4)"/>
					<xsl:choose>
						<xsl:when test="contains($controlField008-24,'a')">
							<note type="abstract" source="abstract or summary" scheme="#marcgt">abstract or summary</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'b')">
							<note type="bibliography" source="bibliography" scheme="#marcgt">bibliography</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'c')">
							<note type="catalog" source="catalog" scheme="#marcgt">catalog</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'d')">
							<note type="dictionary" source="dictionary" scheme="#marcgt">dictionary</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'e')">
							<note type="encyclopedia" source="encyclopedia" scheme="#marcgt">encyclopedia</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'f')">
							<note type="handbook" source="handbook" scheme="#marcgt">handbook</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'g')">
							<note type="legal-article" source="legal article" scheme="#marcgt">legal article</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'i')">
							<note type="index" source="index" scheme="#marcgt">index</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'k')">
							<note type="discography" source="discography" scheme="#marcgt">discography</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'l')">
							<note type="legislation" source="legislation" scheme="#marcgt">legislation</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'m')">
							<note type="theses" source="theses" scheme="#marcgt">theses</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'n')">
							<note type="survey-of-literature" source="survey of literature" scheme="#marcgt">survey of literature</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'o')">
							<note type="review" source="review" scheme="#marcgt">review</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'p')">
							<note type="programmed-text" source="programmed text" scheme="#marcgt">programmed text</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'q')">
							<note type="filmography" source="filmography" scheme="#marcgt">filmography</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'r')">
							<note type="directory" source="directory" scheme="#marcgt">directory</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'s')">
							<note type="statistics" source="statistics" scheme="#marcgt">statistics</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'t')">
							<note type="technical-report" source="technical report" scheme="#marcgt">technical report</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'v')">
							<note type="legal-case" source="legal case and case notes" scheme="#marcgt">legal case and case notes</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'w')">
							<note type="law-report" source="law report or digest" scheme="#marcgt">law report or digest</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-24,'z')">
							<note type="treaty" source="treaty" scheme="#marcgt">treaty</note>
						</xsl:when>
					</xsl:choose>
					<xsl:variable name="controlField008-29" select="substring($controlField008,30,1)"/>
					<xsl:choose>
						<xsl:when test="$controlField008-29='1'">
							<note type="conference-publication" source="conference publication" scheme="#marcgt">conference publication</note>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="$typeOf008='CF'">
					<xsl:variable name="controlField008-26" select="substring($controlField008,27,1)"/>
					<xsl:choose>
						<xsl:when test="$controlField008-26='a'">
							<note type="numeric-data" source="numeric data" scheme="#marcgt">numeric data</note>
						</xsl:when>
						<xsl:when test="$controlField008-26='e'">
							<note type="database" source="database" scheme="#marcgt">database</note>
						</xsl:when>
						<xsl:when test="$controlField008-26='f'">
							<note type="font" source="font" scheme="#marcgt">font</note>
						</xsl:when>
						<xsl:when test="$controlField008-26='g'">
							<note type="game" source="game" scheme="#marcgt">game</note>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="$typeOf008='BK'">
					<xsl:if test="substring($controlField008,25,1)='j'">
						<note type="patent" source="patent" scheme="#marcgt">patent</note>
					</xsl:if>
					<xsl:if test="substring($controlField008,25,1)='2'">
						<note type="offprint" source="offprint" scheme="#marcgt">offprint</note>
					</xsl:if>
					<xsl:if test="substring($controlField008,31,1)='1'">
						<note type="festschrift" source="festschrift" scheme="#marcgt">festschrift</note>
					</xsl:if>
					<xsl:variable name="controlField008-34" select="substring($controlField008,35,1)"/>
					<xsl:if test="$controlField008-34='a' or $controlField008-34='b' or $controlField008-34='c' or $controlField008-34='d'">
						<note type="biography" source="biography" scheme="#marcgt">biography</note>
					</xsl:if>
					<xsl:variable name="controlField008-33" select="substring($controlField008,34,1)"/>
					<xsl:choose>
						<xsl:when test="$controlField008-33='e'">
							<note type="essay" source="essay" scheme="#marcgt">essay</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='d'">
							<note type="drama" source="drama" scheme="#marcgt">drama</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='c'">
							<note type="comic-strip" source="comic strip" scheme="#marcgt">comic strip</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='l'">
							<note type="fiction" source="fiction" scheme="#marcgt">fiction</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='h'">
							<note type="humor" source="humor, satire" scheme="#marcgt">humor, satire</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='i'">
							<note type="letter" source="letter" scheme="#marcgt">letter</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='f'">
							<note type="novel" source="novel" scheme="#marcgt">novel</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='j'">
							<note type="short-story" source="short story" scheme="#marcgt">short story</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='s'">
							<note type="speech" source="speech" scheme="#marcgt">speech</note>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="$typeOf008='MU'">
					<xsl:variable name="controlField008-30-31" select="substring($controlField008,31,2)"/>
					<xsl:if test="contains($controlField008-30-31,'b')">
						<note type="biography" source="biography" scheme="#marcgt">biography</note>
					</xsl:if>
					<xsl:if test="contains($controlField008-30-31,'c')">
						<note type="conference-publication" source="conference publication" scheme="#marcgt">conference publication</note>
					</xsl:if>
					<xsl:if test="contains($controlField008-30-31,'d')">
						<note type="drama" source="drama" scheme="#marcgt">drama</note>
					</xsl:if>
					<xsl:if test="contains($controlField008-30-31,'e')">
						<note type="essay" source="essay" scheme="#marcgt">essay</note>
					</xsl:if>
					<xsl:if test="contains($controlField008-30-31,'f')">
						<note type="fiction" source="fiction" scheme="#marcgt">fiction</note>
					</xsl:if>
					<xsl:if test="contains($controlField008-30-31,'o')">
						<note type="folktale" source="folktale" scheme="#marcgt">folktale</note>
					</xsl:if>
					<xsl:if test="contains($controlField008-30-31,'h')">
						<note type="history" source="history" scheme="#marcgt">history</note>
					</xsl:if>
					<xsl:if test="contains($controlField008-30-31,'k')">
						<note type="humor" source="humor, satire" scheme="#marcgt">humor, satire</note>
					</xsl:if>
					<xsl:if test="contains($controlField008-30-31,'m')">
						<note type="memoir" source="memoir" scheme="#marcgt">memoir</note>
					</xsl:if>
					<xsl:if test="contains($controlField008-30-31,'p')">
						<note type="poetry" source="poetry" scheme="#marcgt">poetry</note>
					</xsl:if>
					<xsl:if test="contains($controlField008-30-31,'r')">
						<note type="rehearsal" source="rehearsal" scheme="#marcgt">rehearsal</note>
					</xsl:if>
					<xsl:if test="contains($controlField008-30-31,'g')">
						<note type="reporting" source="reporting" scheme="#marcgt">reporting</note>
					</xsl:if>
					<xsl:if test="contains($controlField008-30-31,'s')">
						<note type="sound" source="sound" scheme="#marcgt">sound</note>
					</xsl:if>
					<xsl:if test="contains($controlField008-30-31,'l')">
						<note type="speech" source="speech" scheme="#marcgt">speech</note>
					</xsl:if>
				</xsl:if>
				<xsl:if test="$typeOf008='VM'">
					<xsl:variable name="controlField008-33" select="substring($controlField008,34,1)"/>
					<xsl:choose>
						<xsl:when test="$controlField008-33='a'">
							<note type="art-original" source="art original" scheme="#marcgt">art original</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='b'">
							<note type="kit" source="kit" scheme="#marcgt">kit</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='c'">
							<note type="art-reproduction" source="art reproduction" scheme="#marcgt">art reproduction</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='d'">
							<note type="diorama" source="diorama" scheme="#marcgt">diorama</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='f'">
							<note type="filmstrip" source="filmstrip" scheme="#marcgt">filmstrip</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='g'">
							<note type="legal-article" source="legal article" scheme="#marcgt">legal article</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='i'">
							<note type="picture" source="picture" scheme="#marcgt">picture</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='k'">
							<note type="graphic" source="graphic" scheme="#marcgt">graphic</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='l'">
							<note type="technical-drawing" source="technical drawing" scheme="#marcgt">technical drawing</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='m'">
							<note type="motion-picture" source="motion picture" scheme="#marcgt">motion picture</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='n'">
							<note type="chart" source="chart" scheme="#marcgt">chart</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='o'">
							<note type="flash-card" source="flash card" scheme="#marcgt">flash card</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='p'">
							<note type="microscope-slide" source="microscope slide" scheme="#marcgt">microscope slide</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='q' or marc:controlfield[@tag=007][substring(text(),1,1)='a'][substring(text(),2,1)='q']">
							<note type="model" source="model" scheme="#marcgt">model</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='r'">
							<note type="realia" source="realia" scheme="#marcgt">realia</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='s'">
							<note type="slide" source="slide" scheme="#marcgt">slide</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='t'">
							<note type="transparency" source="transparency" scheme="#marcgt">transparency</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='v'">
							<note type="videorecording" source="videorecording" scheme="#marcgt">videorecording</note>
						</xsl:when>
						<xsl:when test="$controlField008-33='w'">
							<note type="toy" source="toy" scheme="#marcgt">toy</note>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				
				<!-- 111$n, 711$n 1.103 -->	
				<xsl:if test="$typeOf008='BK'">
					<xsl:variable name="controlField008-28" select="substring($controlField008,29,1)"/>
					<xsl:choose>
						<xsl:when test="contains($controlField008-28,'a')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'c')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'f')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'m')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'i')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'l')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'m')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'o')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'s')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'u')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'z')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'|')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="$typeOf008='CF'">
					<xsl:variable name="controlField008-28" select="substring($controlField008,29,1)"/>
					<xsl:choose>
						<xsl:when test="contains($controlField008-28,'a')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'c')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'f')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'m')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'i')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'l')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'m')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'o')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'s')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'u')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'z')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'|')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="$typeOf008='CR'">
					<xsl:variable name="controlField008-28" select="substring($controlField008,29,1)"/>
					<xsl:choose>
						<xsl:when test="contains($controlField008-28,'a')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'c')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'f')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'m')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'i')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'l')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'m')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'o')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'s')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'u')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'z')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'|')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="$typeOf008='MP'">
					<xsl:variable name="controlField008-28" select="substring($controlField008,29,1)"/>
					<xsl:choose>
						<xsl:when test="contains($controlField008-28,'a')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'c')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'f')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'m')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'i')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'l')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'m')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'o')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'s')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'u')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'z')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'|')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				<xsl:if test="$typeOf008='VM'">
					<xsl:variable name="controlField008-28" select="substring($controlField008,29,1)"/>
					<xsl:choose>
						<xsl:when test="contains($controlField008-28,'a')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'c')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'f')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'m')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'i')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'l')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'m')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'o')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'s')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'u')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'z')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
						<xsl:when test="contains($controlField008-28,'|')">
							<note type="government-publication" source="government publication" scheme="#marcgt">government publication</note>
						</xsl:when>
					</xsl:choose>
				</xsl:if>
				
				<!-- 245c 362az 502-585 5XX-->
				<xsl:for-each select="marc:datafield[@tag=245]">
					<xsl:call-template name="createNoteFrom245c"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=362]">
					<xsl:call-template name="createNoteFrom362"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=500]">
					<xsl:call-template name="createNoteFrom500"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=502]">
					<xsl:call-template name="createNoteFrom502"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=504]">
					<xsl:call-template name="createNoteFrom504"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=508]">
					<xsl:call-template name="createNoteFrom508"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=511]">
					<xsl:call-template name="createNoteFrom511"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=515]">
					<xsl:call-template name="createNoteFrom515"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=518]">
					<xsl:call-template name="createNoteFrom518"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=524]">
					<xsl:call-template name="createNoteFrom524"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=530]">
					<xsl:call-template name="createNoteFrom530"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=533]">
					<xsl:call-template name="createNoteFrom533"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=535]">
					<xsl:call-template name="createNoteFrom535"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=536]">
					<xsl:call-template name="createNoteFrom536"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=538]">
					<xsl:call-template name="createNoteFrom538"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=541]">
					<xsl:call-template name="createNoteFrom541"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=545]">
					<xsl:call-template name="createNoteFrom545"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=546]">
					<xsl:call-template name="createNoteFrom546"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=561]">
					<xsl:call-template name="createNoteFrom561"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=562]">
					<xsl:call-template name="createNoteFrom562"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=581]">
					<xsl:call-template name="createNoteFrom581"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=583]">
					<xsl:call-template name="createNoteFrom583"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=585]">
					<xsl:call-template name="createNoteFrom585"/>
				</xsl:for-each>
				
				<xsl:for-each select="marc:datafield[@tag=501 or @tag=507 or @tag=513 or @tag=514 or @tag=516 or @tag=522 or @tag=525 or @tag=526 or @tag=544 or @tag=547 or @tag=550 or @tag=552 or @tag=555 or @tag=556 or @tag=565 or @tag=567 or @tag=580 or @tag=584 or @tag=586]">
					<xsl:call-template name="createNoteFrom5XX"/>
				</xsl:for-each>
			</notesStmt>
			<!-- sourceDesc -->
			<sourceDesc>
				<biblStruct>
					<analytic>
						<!-- title -->
						<xsl:for-each select="marc:datafield[@tag='245'] |marc:datafield[@tag='200']">
							<xsl:call-template name="createTitleAnalyticInfoFrom245"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='210']">
							<xsl:call-template name="createTitleInfoFrom210"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='246']">
							<xsl:call-template name="createTitleInfoFrom246"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='240']">
							<xsl:call-template name="createTitleInfoFrom240"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='740']">
							<xsl:call-template name="createTitleInfoFrom740"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='130']">
							<xsl:call-template name="createTitleInfoFrom130"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='730']">
							<xsl:call-template name="createTitleInfoFrom730"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='242']">
							<title level="a" type="translated">
								<!--09/01/04 Added subfield $y-->
								<xsl:for-each select="marc:subfield[@code='y']">
									<xsl:attribute name="xml:lang">
										<xsl:value-of select="text()"/>
									</xsl:attribute>
								</xsl:for-each>
								
								<!-- AQ1.27 tmee/dlf -->
								<xsl:variable name="title">
									<xsl:call-template name="chopPunctuation">
										<xsl:with-param name="chopString">
											<xsl:call-template name="subfieldSelect">
												<!-- 1/04 removed $h, b -->
												<xsl:with-param name="codes">a</xsl:with-param>
											</xsl:call-template>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:variable name="titleChop">
									<xsl:call-template name="chopPunctuation">
										<xsl:with-param name="chopString">
											<xsl:value-of select="$title"/>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="@ind2&gt;0">
										<xsl:value-of select="substring($titleChop,1,@ind2)"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="substring($titleChop,@ind2+1)"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$titleChop"/>
									</xsl:otherwise>
								</xsl:choose>
							</title>
							<!-- 1/04 fix -->
							<xsl:call-template name="subtitle"/>
						</xsl:for-each>
					
		<!-- name -->
		<xsl:for-each select="marc:datafield[@tag='100']">
			<xsl:call-template name="createNameFrom100"/>
		</xsl:for-each>

		<xsl:for-each select="marc:datafield[@tag='110']">
			<xsl:call-template name="createNameFrom110"/>
		</xsl:for-each>

		<xsl:for-each select="marc:datafield[@tag='111']">
			<xsl:call-template name="createNameFrom111"/>
		</xsl:for-each>

		<xsl:for-each select="marc:datafield[@tag='700']">
			<xsl:call-template name="createNameFrom700"/>
		</xsl:for-each>
						
		<xsl:for-each select="marc:datafield[@tag='702']">
			<xsl:call-template name="createNameFrom700"/>
		</xsl:for-each>				

		<xsl:for-each select="marc:datafield[@tag='710']">
			<xsl:call-template name="createNameFrom710"/>
		</xsl:for-each>

		<xsl:for-each select="marc:datafield[@tag='711']">
			<xsl:call-template name="createNameFrom711"/>
		</xsl:for-each>

		<xsl:for-each select="marc:datafield[@tag='720']">
			<xsl:call-template name="createNameFrom720"/>
		</xsl:for-each>
					
					<!-- septembre 2015 - ajout identifiant utilisé par API web -->
					<xsl:if test="string-length($idistex) &gt; 0 ">
						<idno>
							<xsl:attribute name="type">istex</xsl:attribute>
							<xsl:value-of select="$idistex"/>
						</idno>
					</xsl:if>
					<!-- mars 2017 - ajout identifiant ark utilisé par API web -->
					<xsl:if test="string-length($arkistex) &gt; 0 ">
						<idno>
							<xsl:attribute name="type">ark</xsl:attribute>
							<xsl:value-of select="$arkistex"/>
						</idno>
					</xsl:if>
						<xsl:for-each select="marc:controlfield[@tag=001]">
							<idno type="itemNumber">
								<xsl:value-of select="normalize-space(.)"/>
							</idno>
						</xsl:for-each>
						<xsl:for-each select="marc:controlfield[@tag=003]">
							<idno type="sudocURI">
								<xsl:value-of select="normalize-space(.)"/>
							</idno>
						</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag='020']">
						<xsl:if test="marc:subfield[@code='a']">
							<idno type="isbn">
								<xsl:value-of select="marc:subfield[@code='a']"/>
							</idno>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag='020']">
						<xsl:if test="marc:subfield[@code='z']">
							<idno type="isbn" invalid="yes">
								<xsl:value-of select="marc:subfield[@code='z']"/>
							</idno>
						</xsl:if>
					</xsl:for-each>
					
					<xsl:for-each select="marc:datafield[@tag='024'][@ind1='0']">
						<xsl:if test="marc:subfield[@code='a']">
							<idno type="isrc">
								<xsl:value-of select="marc:subfield[@code='a']"/>
							</idno>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag='024'][@ind1='2']">
						<xsl:if test="marc:subfield[@code='a']">
							<idno type="ismn">
								<xsl:value-of select="marc:subfield[@code='a']"/>
							</idno>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag='024'][@ind1='4']">
						<idno type="sici">
							<xsl:call-template name="subfieldSelect">
								<xsl:with-param name="codes">ab</xsl:with-param>
							</xsl:call-template>
						</idno>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag='024'][@ind1='8']">
						<idno>
							<xsl:value-of select="marc:subfield[@code='a']"/>
						</idno>
					</xsl:for-each>
					
					<xsl:for-each select="marc:datafield[@tag='022'][marc:subfield[@code='a']]">
						<xsl:if test="marc:subfield[@code='a']">
							<idno type="issn">
								<xsl:value-of select="marc:subfield[@code='a']"/>
							</idno>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag='022'][marc:subfield[@code='z']]">
						<xsl:if test="marc:subfield[@code='z']">
							<idno type="issn" invalid="yes">
								<xsl:value-of select="marc:subfield[@code='z']"/>
							</idno>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag='022'][marc:subfield[@code='y']]">
						<xsl:if test="marc:subfield[@code='y']">
							<idno type="issn" invalid="yes">
								<xsl:value-of select="marc:subfield[@code='y']"/>
							</idno>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag='022'][marc:subfield[@code='l']]">
						<xsl:if test="marc:subfield[@code='l']">
							<idno type="issn-l">
								<xsl:value-of select="marc:subfield[@code='l']"/>
							</idno>
						</xsl:if>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag='022'][marc:subfield[@code='m']]">
						<xsl:if test="marc:subfield[@code='m']">
							<idno type="issn-l" invalid="yes">
								<xsl:value-of select="marc:subfield[@code='m']"/>
							</idno>
						</xsl:if>
					</xsl:for-each>
					
					<xsl:for-each select="marc:datafield[@tag='010'][marc:subfield[@code='a']]">
						<idno type="lccn">
							<xsl:value-of select="normalize-space(marc:subfield[@code='a'])"/>
						</idno>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag='010'][marc:subfield[@code='z']]">
						<idno type="lccn" invalid="yes">
							<xsl:value-of select="normalize-space(marc:subfield[@code='z'])"/>
						</idno>
					</xsl:for-each>
					
					<xsl:for-each select="marc:datafield[@tag='028']">
						<idno>
							<xsl:attribute name="type">
								<xsl:choose>
									<xsl:when test="@ind1='0'">issue number</xsl:when>
									<xsl:when test="@ind1='1'">matrix number</xsl:when>
									<xsl:when test="@ind1='2'">music plate</xsl:when>
									<xsl:when test="@ind1='3'">music publisher</xsl:when>
									<xsl:when test="@ind1='4'">videorecording identifier</xsl:when>
								</xsl:choose>
							</xsl:attribute>
							<xsl:call-template name="subfieldSelect">
								<xsl:with-param name="codes">
									<xsl:choose>
										<xsl:when test="@ind1='0'">ba</xsl:when>
										<xsl:otherwise>ab</xsl:otherwise>
									</xsl:choose>
								</xsl:with-param>
							</xsl:call-template>
						</idno>
					</xsl:for-each>
					
					<xsl:for-each select="marc:datafield[@tag='035'][marc:subfield[@code='a'][contains(text(), '(OCoLC)')]]">
						<idno type="oclc">
							<xsl:value-of select="normalize-space(substring-after(marc:subfield[@code='a'], '(OCoLC)'))"/>
						</idno>
					</xsl:for-each>
					
					
					<!-- 3.5 1.95 20140421 -->
					<xsl:for-each select="marc:datafield[@tag='035'][marc:subfield[@code='a'][contains(text(), '(WlCaITV)')]]">
						<idno type="WlCaITV">
							<xsl:value-of select="normalize-space(substring-after(marc:subfield[@code='a'], '(WlCaITV)'))"/>
						</idno>
					</xsl:for-each>
					
					<xsl:for-each select="marc:datafield[@tag='037']">
						<idno type="stockNumber">
							<xsl:if test="marc:subfield[@code='c']">
								<xsl:attribute name="source">
									<xsl:call-template name="subfieldSelect">
										<xsl:with-param name="codes">c</xsl:with-param>
									</xsl:call-template>
								</xsl:attribute>
							</xsl:if>
							<xsl:call-template name="subfieldSelect">
								<xsl:with-param name="codes">ab</xsl:with-param>
							</xsl:call-template>
						</idno>
					</xsl:for-each>
					
					<!-- 1.51 tmee 20100129-->
					<xsl:for-each select="marc:datafield[@tag='856'][marc:subfield[@code='u']]">
						<xsl:if test="starts-with(marc:subfield[@code='u'],'urn:hdl') or starts-with(marc:subfield[@code='u'],'hdl') or starts-with(marc:subfield[@code='u'],'http://hdl.loc.gov') ">
							<idno>
								<xsl:attribute name="type">
									<xsl:if test="starts-with(marc:subfield[@code='u'],'urn:doi') or starts-with(marc:subfield[@code='u'],'doi')">doi</xsl:if>
									<xsl:if test="starts-with(marc:subfield[@code='u'],'urn:hdl') or starts-with(marc:subfield[@code='u'],'hdl') or starts-with(marc:subfield[@code='u'],'http://hdl.loc.gov')">hdl</xsl:if>
								</xsl:attribute>
								<xsl:value-of select="concat('hdl:',substring-after(marc:subfield[@code='u'],'http://hdl.loc.gov/'))"/>
							</idno>
						</xsl:if>
						<xsl:if test="starts-with(marc:subfield[@code='u'],'urn:hdl') or starts-with(marc:subfield[@code='u'],'hdl')">
							<idno type="hdl">
								<xsl:if test="marc:subfield[@code='y' or @code='3' or @code='z']">
									<xsl:attribute name="source">
										<xsl:call-template name="subfieldSelect">
											<xsl:with-param name="codes">y3z</xsl:with-param>
										</xsl:call-template>
									</xsl:attribute>
								</xsl:if>
								<xsl:value-of select="concat('hdl:',substring-after(marc:subfield[@code='u'],'http://hdl.loc.gov/'))"/>
							</idno>
						</xsl:if>
						<xsl:if test="contains(marc:subfield[@code='u'],'openurl')">
							<idno type="openURL">
								<xsl:value-of select="normalize-space(marc:subfield[@code='u'])"/>
							</idno>
						</xsl:if>
					</xsl:for-each>
					
					<xsl:for-each select="marc:datafield[@tag=024][@ind1=1]">
						<idno type="upc">
							<xsl:value-of select="marc:subfield[@code='a']"/>
						</idno>
					</xsl:for-each>
				</analytic>
				
				<!-- monogr -->
					<monogr>
						<xsl:for-each select="marc:datafield[@tag='245'] |marc:datafield[@tag='200']">
							<xsl:call-template name="createTitleMonogrInfoFrom245"/>
						</xsl:for-each>
						
						<!-- 856, 020, 024, 022, 028, 010, 035, 037 -->
						<xsl:for-each select="marc:datafield[@tag='020']">
							<xsl:if test="marc:subfield[@code='a']">
								<idno type="isbn">
									<xsl:value-of select="marc:subfield[@code='a']"/>
								</idno>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="marc:datafield[@tag='020']">
							<xsl:if test="marc:subfield[@code='z']">
								<idno type="isbn" invalid="yes">
									<xsl:value-of select="marc:subfield[@code='z']"/>
								</idno>
							</xsl:if>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='024'][@ind1='0']">
							<xsl:if test="marc:subfield[@code='a']">
								<idno type="isrc">
									<xsl:value-of select="marc:subfield[@code='a']"/>
								</idno>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="marc:datafield[@tag='024'][@ind1='2']">
							<xsl:if test="marc:subfield[@code='a']">
								<idno type="ismn">
									<xsl:value-of select="marc:subfield[@code='a']"/>
								</idno>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="marc:datafield[@tag='024'][@ind1='4']">
							<idno type="sici">
								<xsl:call-template name="subfieldSelect">
									<xsl:with-param name="codes">ab</xsl:with-param>
								</xsl:call-template>
							</idno>
						</xsl:for-each>
						<xsl:for-each select="marc:datafield[@tag='024'][@ind1='8']">
							<idno>
								<xsl:value-of select="marc:subfield[@code='a']"/>
							</idno>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='022'][marc:subfield[@code='a']]">
							<xsl:if test="marc:subfield[@code='a']">
								<idno type="issn">
									<xsl:value-of select="marc:subfield[@code='a']"/>
								</idno>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="marc:datafield[@tag='022'][marc:subfield[@code='z']]">
							<xsl:if test="marc:subfield[@code='z']">
								<idno type="issn" invalid="yes">
									<xsl:value-of select="marc:subfield[@code='z']"/>
								</idno>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="marc:datafield[@tag='022'][marc:subfield[@code='y']]">
							<xsl:if test="marc:subfield[@code='y']">
								<idno type="issn" invalid="yes">
									<xsl:value-of select="marc:subfield[@code='y']"/>
								</idno>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="marc:datafield[@tag='022'][marc:subfield[@code='l']]">
							<xsl:if test="marc:subfield[@code='l']">
								<idno type="issn-l">
									<xsl:value-of select="marc:subfield[@code='l']"/>
								</idno>
							</xsl:if>
						</xsl:for-each>
						<xsl:for-each select="marc:datafield[@tag='022'][marc:subfield[@code='m']]">
							<xsl:if test="marc:subfield[@code='m']">
								<idno type="issn-l" invalid="yes">
									<xsl:value-of select="marc:subfield[@code='m']"/>
								</idno>
							</xsl:if>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='010'][marc:subfield[@code='a']]">
							<idno type="lccn">
								<xsl:value-of select="normalize-space(marc:subfield[@code='a'])"/>
							</idno>
						</xsl:for-each>
						<xsl:for-each select="marc:datafield[@tag='010'][marc:subfield[@code='z']]">
							<idno type="lccn" invalid="yes">
								<xsl:value-of select="normalize-space(marc:subfield[@code='z'])"/>
							</idno>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='028']">
							<idno>
								<xsl:attribute name="type">
									<xsl:choose>
										<xsl:when test="@ind1='0'">issueNumber</xsl:when>
										<xsl:when test="@ind1='1'">matrixNumber</xsl:when>
										<xsl:when test="@ind1='2'">musicPlate</xsl:when>
										<xsl:when test="@ind1='3'">musicPublisher</xsl:when>
										<xsl:when test="@ind1='4'">videorecordingIdentifier</xsl:when>
									</xsl:choose>
								</xsl:attribute>
								<xsl:call-template name="subfieldSelect">
									<xsl:with-param name="codes">
										<xsl:choose>
											<xsl:when test="@ind1='0'">ba</xsl:when>
											<xsl:otherwise>ab</xsl:otherwise>
										</xsl:choose>
									</xsl:with-param>
								</xsl:call-template>
							</idno>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='035'][marc:subfield[@code='a'][contains(text(), '(OCoLC)')]]">
							<idno type="oclc">
								<xsl:value-of select="normalize-space(substring-after(marc:subfield[@code='a'], '(OCoLC)'))"/>
							</idno>
						</xsl:for-each>
						
						<xsl:if test="contains(marc:datafield[@tag='856'][1]/marc:subfield[@code='u'],'https://search.proquest.com/docview/')">
							<idno type="BookID">
							<xsl:value-of select="substring-after(marc:datafield[@tag='856'][1]/marc:subfield[@code='u'],'https://search.proquest.com/docview/')"/>
							</idno>
						</xsl:if>
						
						<!-- 3.5 1.95 20140421 -->
						<xsl:for-each select="marc:datafield[@tag='035'][marc:subfield[@code='a'][contains(text(), '(WlCaITV)')]]">
							<idno type="WlCaITV">
								<xsl:value-of select="normalize-space(substring-after(marc:subfield[@code='a'], '(WlCaITV)'))"/>
							</idno>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='037']">
							<idno type="stockNumber">
								<xsl:if test="marc:subfield[@code='c']">
									<xsl:attribute name="source">
										<xsl:call-template name="subfieldSelect">
											<xsl:with-param name="codes">c</xsl:with-param>
										</xsl:call-template>
									</xsl:attribute>
								</xsl:if>
								<xsl:call-template name="subfieldSelect">
									<xsl:with-param name="codes">ab</xsl:with-param>
								</xsl:call-template>
							</idno>
						</xsl:for-each>
						
						<!-- 1.51 tmee 20100129-->
						<xsl:for-each select="marc:datafield[@tag='856'][marc:subfield[@code='u']]">
							<xsl:if test="starts-with(marc:subfield[@code='u'],'urn:hdl') or starts-with(marc:subfield[@code='u'],'hdl') or starts-with(marc:subfield[@code='u'],'http://hdl.loc.gov') ">
								<idno>
									<xsl:attribute name="type">
										<xsl:if test="starts-with(marc:subfield[@code='u'],'urn:doi') or starts-with(marc:subfield[@code='u'],'doi')">doi</xsl:if>
										<xsl:if test="starts-with(marc:subfield[@code='u'],'urn:hdl') or starts-with(marc:subfield[@code='u'],'hdl') or starts-with(marc:subfield[@code='u'],'http://hdl.loc.gov')">hdl</xsl:if>
									</xsl:attribute>
									<xsl:value-of select="concat('hdl:',substring-after(marc:subfield[@code='u'],'http://hdl.loc.gov/'))"/>
								</idno>
							</xsl:if>
							<xsl:if test="starts-with(marc:subfield[@code='u'],'urn:hdl') or starts-with(marc:subfield[@code='u'],'hdl')">
								<idno type="hdl">
									<xsl:if test="marc:subfield[@code='y' or @code='3' or @code='z']">
										<xsl:attribute name="source">
											<xsl:call-template name="subfieldSelect">
												<xsl:with-param name="codes">y3z</xsl:with-param>
											</xsl:call-template>
										</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="concat('hdl:',substring-after(marc:subfield[@code='u'],'http://hdl.loc.gov/'))"/>
								</idno>
							</xsl:if>
							<xsl:if test="contains(marc:subfield[@code='u'],'openurl')">
								<idno type="openURL">
									<xsl:value-of select="normalize-space(marc:subfield[@code='u'])"/>
								</idno>
							</xsl:if>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag=024][@ind1=1]">
							<idno type="upc">
								<xsl:value-of select="marc:subfield[@code='a']"/>
							</idno>
						</xsl:for-each>
						<!-- name -->
						<xsl:for-each select="marc:datafield[@tag='100']">
							<xsl:call-template name="createNameFrom100"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='110']">
							<xsl:call-template name="createNameFrom110"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='111']">
							<xsl:call-template name="createNameFrom111"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='700']">
							<xsl:call-template name="createNameFrom700"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='701']">
							<xsl:call-template name="createNameFrom701"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='702']">
							<xsl:call-template name="createNameFrom702"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='710']">
							<xsl:call-template name="createNameFrom710"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='711']">
							<xsl:call-template name="createNameFrom711"/>
						</xsl:for-each>
						
						<xsl:for-each select="marc:datafield[@tag='720']">
							<xsl:call-template name="createNameFrom720"/>
						</xsl:for-each>
						<!-- originInfo 250 and 260 -->
						<imprint>
							<publisher>
								<xsl:text>Proquest</xsl:text>
							</publisher>
							<xsl:for-each select="marc:datafield[(@tag=260 or @tag=250) and marc:subfield[@code='a' or code='b' or @code='c' or code='g']]">
								<xsl:call-template name="z2xx880"/>
							</xsl:for-each>
							<!-- tmee 1.35 1.36 dateIssued/nonMSS vs dateCreated/MSS -->
							<xsl:for-each select="marc:datafield[@tag=260]/marc:subfield[@code='b' or @code='c' or @code='g']">
								<xsl:choose>
									<xsl:when test="@code='b'">
										<publisher>
											<xsl:call-template name="chopPunctuation">
												<xsl:with-param name="chopString" select="."/>
												<xsl:with-param name="punctuation">
													<xsl:text>:,;/ </xsl:text>
												</xsl:with-param>
											</xsl:call-template>
										</publisher>
									</xsl:when>
								</xsl:choose>
							</xsl:for-each>
							<xsl:variable name="MARCpublicationCode" select="normalize-space(substring($controlField008,16,3))"/>
							<xsl:if test="translate($MARCpublicationCode,'|','')">
								<pubPlace>
									<xsl:value-of select="$MARCpublicationCode"/>
								</pubPlace>
							</xsl:if>
							<xsl:for-each select="marc:datafield[@tag=044]/marc:subfield[@code='c']">
								<pubPlace>
									<xsl:value-of select="."/>
								</pubPlace>
							</xsl:for-each>
							<xsl:if test="marc:datafield[@tag=620]">
							<pubPlace>
								<xsl:value-of select="concat(marc:datafield[@tag=620][1]/marc:subfield[@code='d'],', ',marc:datafield[@tag=620]/marc:subfield[@code='a'])"/>
							</pubPlace>
							</xsl:if>
							<xsl:for-each select="marc:datafield[@tag=260]/marc:subfield[@code='a']">
								<pubPlace>
									<xsl:call-template name="chopPunctuationFront">
										<xsl:with-param name="chopString">
											<xsl:call-template name="chopPunctuation">
												<xsl:with-param name="chopString" select="."/>
											</xsl:call-template>
										</xsl:with-param>
									</xsl:call-template>
								</pubPlace>
							</xsl:for-each>
							<!-- date -->
							<date type="published" when="{$date}">
								<xsl:attribute name="when">
									<xsl:value-of select="normalize-space(translate($date,'MDXCIVLabcdefghijklmnopqrstuvwxyz []',''))"/>
								</xsl:attribute>
								<xsl:value-of select="normalize-space(translate($date,'MDXCIVLabcdefghijklmnopqrstuvwxyz []',''))"/>
							</date>
							<xsl:for-each select="marc:datafield[@tag=300]">
								<biblScope unit="edition">
									<xsl:if test="marc:subfield[@code='f']">
										<xsl:attribute name="unit">
											<xsl:call-template name="subfieldSelect">
												<xsl:with-param name="codes">f</xsl:with-param>
											</xsl:call-template>
										</xsl:attribute>
									</xsl:if>
									<xsl:call-template name="subfieldSelect">
										<xsl:with-param name="codes">abce3g</xsl:with-param>
									</xsl:call-template>
								</biblScope>
							</xsl:for-each>
						</imprint>
					</monogr>
				
					<!-- series -->
					<xsl:for-each select="marc:datafield[@tag=440]">
						<series>
							<title type="main" level="s">
									<xsl:call-template name="chopPunctuation">
										<xsl:with-param name="chopString">
											<xsl:call-template name="subfieldSelect">
												<xsl:with-param name="codes">av</xsl:with-param>
											</xsl:call-template>
										</xsl:with-param>
									</xsl:call-template>
								</title>
						</series>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag=811]">
						<series>
							<title type="main" level="s">
								<xsl:call-template name="chopPunctuation">
									<xsl:with-param name="chopString">
										<xsl:call-template name="specialSubfieldSelect">
											<xsl:with-param name="anyCodes">tfklsv</xsl:with-param>
											<xsl:with-param name="axis">t</xsl:with-param>
											<xsl:with-param name="afterCodes">g</xsl:with-param>
										</xsl:call-template>
									</xsl:with-param>
								</xsl:call-template>
							</title>
						</series>
					</xsl:for-each>
					
					
					<xsl:for-each select="marc:datafield[@tag=810]">
						<series>
							<title type="main" level="s">
								<xsl:call-template name="chopPunctuation">
									<xsl:with-param name="chopString">
										<xsl:call-template name="specialSubfieldSelect">
											<xsl:with-param name="anyCodes">tfklmorsv</xsl:with-param>
											<xsl:with-param name="axis">t</xsl:with-param>
											<xsl:with-param name="afterCodes">dg</xsl:with-param>
										</xsl:call-template>
									</xsl:with-param>
								</xsl:call-template>
							</title>
							<editor>
								<persName>
									<xsl:for-each select="marc:subfield[@code='a']">
										<forename type="first">
											<xsl:value-of select="."/>
										</forename>
									</xsl:for-each>
									<xsl:for-each select="marc:subfield[@code='b']">
										<surname>
											<xsl:value-of select="."/>
										</surname>
									</xsl:for-each>
								</persName>
							</editor>
						</series>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag=317][1]">
						<series>
							<title type="main" level="s">
								<xsl:call-template name="chopPunctuation">
									<xsl:with-param name="chopString">
										<xsl:call-template name="specialSubfieldSelect">
											<xsl:with-param name="anyCodes">a</xsl:with-param>
										</xsl:call-template>
									</xsl:with-param>
								</xsl:call-template>
							</title>
						</series>
					</xsl:for-each>
				</biblStruct>
			</sourceDesc>
		</fileDesc>
		<!-- versionning -->
		<xsl:call-template name="insertVersion"/>
		<!-- profileDesc -->
		<profileDesc>
			<!-- creation -->
			<xsl:if test="($controlField008-6='e' or $controlField008-6='p' or $controlField008-6='r' or $controlField008-6='s' or $controlField008-6='t') and not($leader6='d' or $leader6='f' or $leader6='p' or $leader6='t')">
				<creation>
					<date>
						<xsl:value-of select="normalize-space(translate($date,'MDXCIVLabcdefghijklmnopqrstuvwxyz []',''))"/>
					</date>
				</creation>
			</xsl:if>
			
			<!-- abstract -->
			<xsl:for-each select="marc:datafield[@tag=520]">
				<xsl:call-template name="createAbstractFrom520"/>
			</xsl:for-each>
			
			<!--subject-->
			<xsl:for-each select="marc:datafield[@tag=034]">
				<xsl:call-template name="createSubGeoFrom034"/>
			</xsl:for-each>
			
			<xsl:for-each select="marc:datafield[@tag=043]">
				<xsl:call-template name="createSubGeoFrom043"/>
			</xsl:for-each>
			
			<xsl:for-each select="marc:datafield[@tag=045]">
				<xsl:call-template name="createSubTemFrom045"/>
			</xsl:for-each>
			
			<xsl:for-each select="marc:datafield[@tag=255]">
				<xsl:call-template name="createSubGeoFrom255"/>
			</xsl:for-each>
			
			<!-- tags 610 -611 -630 delete -->
			<xsl:for-each select="marc:datafield[@tag=600]">
				<xsl:call-template name="createSubNameFrom600"/>
			</xsl:for-each>
			
			<xsl:for-each select="marc:datafield[@tag=648]">
				<xsl:call-template name="createSubChronFrom648"/>
			</xsl:for-each>
			
			<xsl:for-each select="marc:datafield[@tag=650]">
				<xsl:call-template name="createSubTopFrom650"/>
			</xsl:for-each>
			
			<xsl:for-each select="marc:datafield[@tag=651]">
				<xsl:call-template name="createSubGeoFrom651"/>
			</xsl:for-each>
			
			<xsl:for-each select="marc:datafield[@tag=653]">
				<xsl:call-template name="createSubFrom653"/>
			</xsl:for-each>
			
			<xsl:for-each select="marc:datafield[@tag=656]">
				<xsl:call-template name="createSubFrom656"/>
			</xsl:for-each>
			
			<!-- createClassificationFrom 0XX-->
			<xsl:for-each select="marc:datafield[@tag='050']">
				<xsl:call-template name="createClassificationFrom050"/>
			</xsl:for-each>
			<xsl:for-each select="marc:datafield[@tag='060']">
				<xsl:call-template name="createClassificationFrom060"/>
			</xsl:for-each>
			<xsl:for-each select="marc:datafield[@tag='080']">
				<xsl:call-template name="createClassificationFrom080"/>
			</xsl:for-each>
			<xsl:for-each select="marc:datafield[@tag='082']">
				<xsl:call-template name="createClassificationFrom082"/>
			</xsl:for-each>
			<xsl:for-each select="marc:datafield[@tag='084']">
				<xsl:call-template name="createClassificationFrom084"/>
			</xsl:for-each>
			<xsl:for-each select="marc:datafield[@tag='086']">
				<xsl:call-template name="createClassificationFrom086"/>
			</xsl:for-each>
			<xsl:for-each select="marc:datafield[@tag=606]">
				<textClass>
					<classCode scheme="#rameau">
						<xsl:value-of select="marc:subfield[@code='3']"/>
					</classCode>
					<keywords scheme="#rameau">
						<term>
							<xsl:value-of select="marc:subfield[@code='a']"/>
						</term>
					</keywords>
				</textClass>
			</xsl:for-each>
			<xsl:for-each select="marc:datafield[@tag=608]">
				<textClass>
					<classCode scheme="#rameau">
						<xsl:value-of select="marc:subfield[@code='3']"/>
					</classCode>
					<keywords scheme="#rameau">
						<term>
							<xsl:value-of select="marc:subfield[@code='a']"/>
						</term>
					</keywords>
				</textClass>
			</xsl:for-each>
			
			<!-- language -->
			<langUsage>
				<language>
					<xsl:attribute name="ident">
						<xsl:choose>
							<xsl:when test="$codeLangMarc='g d'">en</xsl:when>
							<xsl:when test="$codeLangMarc='ng '">en</xsl:when>
							<xsl:when test="$codeLangMarc='e d'">en</xsl:when>
							<xsl:when test="$codeLangMarc='0 0'">en</xsl:when>
							<xsl:when test="$codeLangMarc='s  '">en</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$codeLangMarc"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</language>
			</langUsage>
		</profileDesc>
		<!-- traceability -->
		<revisionDesc>
			<change when="{$releasedate}" who="#istex" xml:id="pub2tei">formatting</change>
		</revisionDesc>
	</xsl:template>
	
	<!-- affiliation -->
	<xsl:template name="affiliation">
		<xsl:for-each select="marc:subfield[@code='u']">
			<affiliation>
				<xsl:value-of select="."/>
			</affiliation>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template name="relatedSubject">
		<xsl:for-each select="marc:subfield[@code='j']">
			<textClass>
				<keywords ana="temporal">
					<xsl:call-template name="chopPunctuation">
						<xsl:with-param name="chopString" select="."/>
					</xsl:call-template>
				</keywords>
			</textClass>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="relatedIdentifierISSN">
		<xsl:for-each select="marc:subfield[@code='x']">
			<idno type="ISSN">
				<xsl:value-of select="."/>
			</idno>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="relatedIdentifierLocal">
		<xsl:for-each select="marc:subfield[@code='w']">
			<idno type="local">
				<xsl:value-of select="."/>
			</idno>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="relatedIdentifier">
		<xsl:for-each select="marc:subfield[@code='o']">
			<idno type="related">
				<xsl:value-of select="."/>
			</idno>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="subjectGeographicZ">
		<term ana="geographic">
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString" select="."/>
			</xsl:call-template>
		</term>
	</xsl:template>
	<xsl:template name="subjectTemporalY">
		<term ana="temporal">
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString" select="."/>
			</xsl:call-template>
		</term>
	</xsl:template>
	<xsl:template name="subjectTopic">
		<term ana="head">
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString" select="."/>
			</xsl:call-template>
		</term>
	</xsl:template>
	<!-- 3.2 change tmee 6xx $v genre -->
	<xsl:template name="subjectGenre">
		<term ana="genre">
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString" select="."/>
			</xsl:call-template>
		</term>
	</xsl:template>

	<xsl:template name="nameABCDN">
		<xsl:for-each select="marc:subfield[@code='a']">
			<name>
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString" select="."/>
				</xsl:call-template>
			</name>
		</xsl:for-each>
		<xsl:for-each select="marc:subfield[@code='b']">
			<name>
				<xsl:value-of select="."/>
			</name>
		</xsl:for-each>
		<xsl:if test="marc:subfield[@code='c'] or marc:subfield[@code='d'] or marc:subfield[@code='n']">
			<name>
				<xsl:call-template name="subfieldSelect">
					<xsl:with-param name="codes">cdn</xsl:with-param>
				</xsl:call-template>
			</name>
		</xsl:if>
	</xsl:template>
	<xsl:template name="nameABCDQ">
		<xsl:variable name="splitName">
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString">
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">aq</xsl:with-param>
					</xsl:call-template>
				</xsl:with-param>
				<xsl:with-param name="punctuation">
					<xsl:text>:,;/ </xsl:text>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="marc:subfield[@code='d']">
				<surname>
					<xsl:value-of select="concat(marc:subfield[1][@code='c'],' ',marc:subfield[@code='a']) "/>
				</surname>
			</xsl:when>
			<xsl:when test="contains($splitName,',')">
				<forename type="first">
					<xsl:value-of select="substring-after($splitName,', ')"/>
				</forename>
				<surname>
					<xsl:value-of select="substring-before($splitName,',')"/>
				</surname>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="marc:subfield[@code='b']">
					<forename type="first">
						<xsl:value-of select="marc:subfield[@code='b']"/>
					</forename>
				</xsl:if>
				<surname>
					<xsl:value-of select="normalize-space($splitName)"/>
				</surname>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:call-template name="nameDate"/>
	</xsl:template>
	<xsl:template name="nameACDEQ">
		<surname>
			<xsl:call-template name="subfieldSelect">
				<xsl:with-param name="codes">acdeq</xsl:with-param>
			</xsl:call-template>
		</surname>
	</xsl:template>
	
	<!--1.104 20141104-->
	<xsl:template name="nameACDENQ">
		<surname>
			<xsl:call-template name="subfieldSelect">
				<xsl:with-param name="codes">acdenq</xsl:with-param>
			</xsl:call-template>
		</surname>
	</xsl:template>
	
	
	
	<xsl:template name="constituentOrRelatedType">
		<xsl:if test="@ind2='2'">
			<xsl:attribute name="type">constituent</xsl:attribute>
		</xsl:if>
	</xsl:template>
	<xsl:template name="relatedTitle">
		<xsl:for-each select="marc:subfield[@code='t']">
			<titleInfo>
				<title>
					<xsl:call-template name="chopPunctuation">
						<xsl:with-param name="chopString">
							<xsl:value-of select="."/>
						</xsl:with-param>
					</xsl:call-template>
				</title>
			</titleInfo>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="relatedTitle76X-78X">
		<xsl:for-each select="marc:subfield[@code='t']">
			<title level="a" type="alt">
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString">
						<xsl:value-of select="."/>
					</xsl:with-param>
				</xsl:call-template>
			</title>
		</xsl:for-each>
		<xsl:for-each select="marc:subfield[@code='p']">
			<title level="a" type="alt">
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString">
						<xsl:value-of select="."/>
					</xsl:with-param>
				</xsl:call-template>
			</title>
		</xsl:for-each>
		<xsl:for-each select="marc:subfield[@code='s']">
			<title level="a" type="alt">
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString">
						<xsl:value-of select="."/>
					</xsl:with-param>
				</xsl:call-template>
			</title>
		</xsl:for-each>
	</xsl:template>

	<!-- tmee 1.40 -->
	<xsl:template name="relatedLanguage">
		<xsl:for-each select="marc:subfield[@code='e']">
			<xsl:call-template name="getLanguage">
				<xsl:with-param name="langString">
					<xsl:value-of select="."/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="nameDate">
		<xsl:for-each select="marc:subfield[@code='d']">
			<xsl:variable name="splitDate">
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString" select="."/>
				</xsl:call-template>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="contains($splitDate,'-')">
					<date type="birth">
						<xsl:value-of select="substring-before($splitDate,'-')"/>
					</date>
					<date type="death">
						<xsl:value-of select="substring-after($splitDate,'-')"/>
					</date>
				</xsl:when>
				<xsl:otherwise>
					<date>
						<xsl:value-of select="$splitDate"/>
					</date>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="subjectAuthority">
		<xsl:if test="@ind2!='4' or @ind2!=' ' or @ind2!='8' or @ind2!=9">
			<xsl:attribute name="scheme">
				<xsl:choose>
					<xsl:when test="@ind2='0'">#LCSH</xsl:when>
					<xsl:when test="@ind2='1'">#LCSHA</xsl:when>
					<xsl:when test="@ind2='2'">#MESH</xsl:when>
					<!-- 1/04 fix -->
					<xsl:when test="@ind2='3'">#NAL</xsl:when>
					<xsl:when test="@ind2='5'">#CSH</xsl:when>
					<xsl:when test="@ind2='6'">#RVM</xsl:when>
					<xsl:when test="@ind2='7'">
						<xsl:text>#</xsl:text>
						<xsl:value-of select="marc:subfield[@code='2']"/>
					</xsl:when>
				</xsl:choose>
			</xsl:attribute>
		</xsl:if>
	</xsl:template>
	<xsl:template name="subjectAnyOrder">
		<xsl:for-each select="marc:subfield[@code='v' or @code='x' or @code='y' or @code='z']">
			<xsl:choose>
				<xsl:when test="@code='v'">
					<xsl:call-template name="subjectGenre"/>
				</xsl:when>
				<xsl:when test="@code='x'">
					<xsl:call-template name="subjectTopic"/>
				</xsl:when>
				<xsl:when test="@code='y'">
					<xsl:call-template name="subjectTemporalY"/>
				</xsl:when>
				<xsl:when test="@code='z'">
					<xsl:call-template name="subjectGeographicZ"/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="specialSubfieldSelect">
		<xsl:param name="anyCodes"/>
		<xsl:param name="axis"/>
		<xsl:param name="beforeCodes"/>
		<xsl:param name="afterCodes"/>
		<xsl:variable name="str">
			<xsl:for-each select="marc:subfield">
				<xsl:if test="contains($anyCodes, @code) or (contains($beforeCodes,@code) and following-sibling::marc:subfield[@code=$axis])      or (contains($afterCodes,@code) and preceding-sibling::marc:subfield[@code=$axis])">
					<xsl:value-of select="text()"/>
					<xsl:text> </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
	</xsl:template>
	
	<xsl:template match="marc:datafield[@tag=656]">
		<textClass>
			<keywords ana="occupation">
				<term>
					<xsl:call-template name="chopPunctuation">
						<xsl:with-param name="chopString">
							<xsl:value-of select="marc:subfield[@code='a']"/>
						</xsl:with-param>
					</xsl:call-template>
				</term>
			</keywords>
		</textClass>
	</xsl:template>
	
	<xsl:template name="source">
		<xsl:if test="marc:subfield[@code='i']">
			<xsl:attribute name="source">
				<xsl:value-of select="marc:subfield[@code='i']"/>
			</xsl:attribute>
		</xsl:if>
		<xsl:if test="marc:subfield[@code='3']">
			<xsl:attribute name="source">
				<xsl:value-of select="marc:subfield[@code='3']"/>
			</xsl:attribute>
		</xsl:if>
	</xsl:template>

	<xsl:template name="subtitle">
		<xsl:if test="marc:subfield[@code='b']">
			<title level="a" type="sub">
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString">
						<xsl:value-of select="marc:subfield[@code='b']"/>
						<!--<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">b</xsl:with-param>									
						</xsl:call-template>-->
					</xsl:with-param>
				</xsl:call-template>
			</title>
		</xsl:if>
	</xsl:template>
	<xsl:template name="script">
		<xsl:param name="scriptCode"/>
		<xsl:attribute name="type">
			<xsl:choose>
				<!-- ISO 15924	and CJK is a local code	20101123-->
				<xsl:when test="$scriptCode='(3'">Arab</xsl:when>
				<xsl:when test="$scriptCode='(4'">Arab</xsl:when>
				<xsl:when test="$scriptCode='(B'">Latn</xsl:when>
				<xsl:when test="$scriptCode='!E'">Latn</xsl:when>
				<xsl:when test="$scriptCode='$1'">CJK</xsl:when>
				<xsl:when test="$scriptCode='(N'">Cyrl</xsl:when>
				<xsl:when test="$scriptCode='(Q'">Cyrl</xsl:when>
				<xsl:when test="$scriptCode='(2'">Hebr</xsl:when>
				<xsl:when test="$scriptCode='(S'">Grek</xsl:when>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>
	
	<!-- PART -->
	<xsl:template name="parsePart">
		<xsl:variable name="level1">
			<xsl:choose>
				<xsl:when test="contains(text(),':')">
					<!-- 1:2 -->
					<xsl:value-of select="substring-before(text(),':')"/>
				</xsl:when>
				<xsl:when test="not(contains(text(),':'))">
					<!-- 1 or 1<3 -->
					<xsl:if test="contains(text(),'&lt;')">
						<!-- 1<3 -->
						<xsl:value-of select="substring-before(text(),'&lt;')"/>
					</xsl:if>
					<xsl:if test="not(contains(text(),'&lt;'))">
						<!-- 1 -->
						<xsl:value-of select="text()"/>
					</xsl:if>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="sici2">
			<xsl:choose>
				<xsl:when test="starts-with(substring-after(text(),$level1),':')">
					<xsl:value-of select="substring(substring-after(text(),$level1),2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="substring-after(text(),$level1)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="level2">
			<xsl:choose>
				<xsl:when test="contains($sici2,':')">
					<!--  2:3<4  -->
					<xsl:value-of select="substring-before($sici2,':')"/>
				</xsl:when>
				<xsl:when test="contains($sici2,'&lt;')">
					<!-- 1: 2<4 -->
					<xsl:value-of select="substring-before($sici2,'&lt;')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$sici2"/>
					<!-- 1:2 -->
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="sici3">
			<xsl:choose>
				<xsl:when test="starts-with(substring-after($sici2,$level2),':')">
					<xsl:value-of select="substring(substring-after($sici2,$level2),2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="substring-after($sici2,$level2)"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="level3">
			<xsl:choose>
				<xsl:when test="contains($sici3,'&lt;')">
					<!-- 2<4 -->
					<xsl:value-of select="substring-before($sici3,'&lt;')"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$sici3"/>
					<!-- 3 -->
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="page">
			<xsl:if test="contains(text(),'&lt;')">
				<xsl:value-of select="substring-after(text(),'&lt;')"/>
			</xsl:if>
		</xsl:variable>
		<xsl:if test="$level1">
			<biblScope unit="volume">
				<xsl:value-of select="$level1"/>
			</biblScope>
		</xsl:if>
		<xsl:if test="$level2">
			<biblScope unit="volume">
				<xsl:value-of select="$level2"/>
			</biblScope>
		</xsl:if>
		<xsl:if test="$level3">
			<biblScope unit="volume">
				<xsl:value-of select="$level3"/>
			</biblScope>
		</xsl:if>
		<xsl:if test="$page">
			<biblScope unit="page" from="{$page}">
				<xsl:value-of select="$page"/>
			</biblScope>
		</xsl:if>
	</xsl:template>
	<xsl:template name="getLanguage">
		<xsl:param name="langString"/>
		<xsl:param name="controlField008-35-37"/>
		<xsl:variable name="length" select="string-length($langString)"/>
		<xsl:choose>
			<xsl:when test="$length=0"/>
			<xsl:when test="$controlField008-35-37=substring($langString,1,3)">
				<xsl:call-template name="getLanguage">
					<xsl:with-param name="langString" select="substring($langString,4,$length)"/>
					<xsl:with-param name="controlField008-35-37" select="$controlField008-35-37"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<langUsage>
					<language>
						<xsl:attribute name="ident">
							<xsl:value-of select="substring($langString,1,3)"/>
						</xsl:attribute>
					</language>
				</langUsage>
				<xsl:call-template name="getLanguage">
					<xsl:with-param name="langString" select="substring($langString,4,$length)"/>
					<xsl:with-param name="controlField008-35-37" select="$controlField008-35-37"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="isoLanguage">
		<xsl:param name="currentLanguage"/>
		<xsl:param name="usedLanguages"/>
		<xsl:param name="remainingLanguages"/>
		<xsl:choose>
			<xsl:when test="string-length($currentLanguage)=0"/>
			<xsl:when test="//marc:controlfield[@tag=001]='ocm12245787e '">
				<langUsage>
					<language ident="en"/>
					<language ident="la"/>
				</langUsage>
			</xsl:when>
			<xsl:when test="not(contains($usedLanguages, $currentLanguage))">
				<xsl:if test="@code='a'">
					<langUsage>
						<language>
							<xsl:attribute name="ident">
								<xsl:choose>
									<xsl:when test="$currentLanguage='rel'"></xsl:when>
									<xsl:when test="$currentLanguage='at'">la</xsl:when>
									<xsl:when test="$currentLanguage=' la'">la</xsl:when>
									<xsl:when test="$currentLanguage='frm'">fr</xsl:when>
									<xsl:when test="$currentLanguage='frn'">fr</xsl:when>
									<xsl:when test="$currentLanguage='end'">en</xsl:when>
									<xsl:when test="$currentLanguage='eth'">amh</xsl:when>
									<xsl:when test="$currentLanguage='gae'">gd</xsl:when>
									<xsl:when test="$currentLanguage='g d'">en</xsl:when>
									<xsl:when test="$currentLanguage='grk'">el</xsl:when>
									<xsl:when test="$currentLanguage=' h '"></xsl:when>
									<xsl:when test="$currentLanguage='iri'">ga</xsl:when>
									<xsl:when test="$currentLanguage='pah'">fa</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$currentLanguage"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</language>
					</langUsage>
				</xsl:if>
				<xsl:call-template name="isoLanguage">
					<xsl:with-param name="currentLanguage">
						<xsl:value-of select="substring($remainingLanguages,1,3)"/>
					</xsl:with-param>
					<xsl:with-param name="usedLanguages">
						<xsl:value-of select="concat($usedLanguages,$currentLanguage)"/>
					</xsl:with-param>
					<xsl:with-param name="remainingLanguages">
						<xsl:value-of select="substring($remainingLanguages,4,string-length($remainingLanguages))"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="isoLanguage">
					<xsl:with-param name="currentLanguage">
						<xsl:value-of select="substring($remainingLanguages,1,3)"/>
					</xsl:with-param>
					<xsl:with-param name="usedLanguages">
						<xsl:value-of select="concat($usedLanguages,$currentLanguage)"/>
					</xsl:with-param>
					<xsl:with-param name="remainingLanguages">
						<xsl:value-of select="substring($remainingLanguages,4,string-length($remainingLanguages))"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="chopBrackets">
		<xsl:param name="chopString"/>
		<xsl:variable name="string">
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString" select="$chopString"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:if test="substring($string, 1,1)='['">
			<xsl:value-of select="substring($string,2, string-length($string)-2)"/>
		</xsl:if>
		<xsl:if test="substring($string, 1,1)!='['">
			<xsl:value-of select="$string"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="rfcLanguages">
		<xsl:param name="nodeNum"/>
		<xsl:param name="usedLanguages"/>
		<xsl:param name="controlField008-35-37"/>
		<xsl:variable name="currentLanguage" select="."/>
		<xsl:choose>
			<xsl:when test="not($currentLanguage)"/>
			<xsl:when test="$currentLanguage!=$controlField008-35-37 and $currentLanguage!='rfc3066'">
				<xsl:if test="not(contains($usedLanguages,$currentLanguage))">
					<langUsage>
						<language ident="{$currentLanguage}"/>
					</langUsage>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>

	<!-- tmee added 20100106 for 045$b BC and CE date range info -->
	<xsl:template name="dates045b">
		<xsl:param name="str"/>
		<xsl:variable name="first-char" select="substring($str,1,1)"/>
		<xsl:choose>
			<xsl:when test="$first-char ='c'">
				<xsl:value-of select="concat ('-', substring($str, 2))"/>
			</xsl:when>
			<xsl:when test="$first-char ='d'">
				<xsl:value-of select="substring($str, 2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$str"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="scriptCode">
		<xsl:variable name="sf06" select="normalize-space(child::marc:subfield[@code='6'])"/>
		<xsl:variable name="sf06a" select="substring($sf06, 1, 3)"/>
		<xsl:variable name="sf06b" select="substring($sf06, 5, 2)"/>
		<xsl:variable name="sf06c" select="substring($sf06, 7)"/>
		<xsl:variable name="scriptCode" select="substring($sf06, 8, 2)"/>
		<xsl:if test="//marc:datafield/marc:subfield[@code='6']">
			<xsl:attribute name="type">
				<xsl:choose>
					<xsl:when test="$scriptCode=''">Latn</xsl:when>
					<xsl:when test="$scriptCode='(3'">Arab</xsl:when>
					<xsl:when test="$scriptCode='(4'">Arab</xsl:when>
					<xsl:when test="$scriptCode='(B'">Latn</xsl:when>
					<xsl:when test="$scriptCode='!E'">Latn</xsl:when>
					<xsl:when test="$scriptCode='$1'">CJK</xsl:when>
					<xsl:when test="$scriptCode='(N'">Cyrl</xsl:when>
					<xsl:when test="$scriptCode='(Q'">Cyrl</xsl:when>
					<xsl:when test="$scriptCode='(2'">Hebr</xsl:when>
					<xsl:when test="$scriptCode='(S'">Grek</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:attribute>
		</xsl:if>
	</xsl:template>

	<!-- tmee 20100927 for 880s & corresponding fields  20101123 scriptCode -->


	<xsl:template name="z2xx880">
		<!-- Evaluating the 260 field -->
		<xsl:variable name="x260">
			<xsl:choose>
				<xsl:when test="@tag='260' and marc:subfield[@code='6']">
					<xsl:variable name="sf06260" select="normalize-space(child::marc:subfield[@code='6'])"/>
					<xsl:variable name="sf06260a" select="substring($sf06260, 1, 3)"/>
					<xsl:variable name="sf06260b" select="substring($sf06260, 5, 2)"/>
					<xsl:variable name="sf06260c" select="substring($sf06260, 7)"/>
					<xsl:value-of select="$sf06260b"/>
				</xsl:when>
				<xsl:when test="@tag='250' and ../marc:datafield[@tag='260']/marc:subfield[@code='6']">
					<xsl:variable name="sf06260" select="normalize-space(../marc:datafield[@tag='260']/marc:subfield[@code='6'])"/>
					<xsl:variable name="sf06260a" select="substring($sf06260, 1, 3)"/>
					<xsl:variable name="sf06260b" select="substring($sf06260, 5, 2)"/>
					<xsl:variable name="sf06260c" select="substring($sf06260, 7)"/>
					<xsl:value-of select="$sf06260b"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>            

		<xsl:variable name="x250">
			<xsl:choose>
				<xsl:when test="@tag='250' and marc:subfield[@code='6']">
					<xsl:variable name="sf06250" select="normalize-space(../marc:datafield[@tag='250']/marc:subfield[@code='6'])"/>
					<xsl:variable name="sf06250a" select="substring($sf06250, 1, 3)"/>
					<xsl:variable name="sf06250b" select="substring($sf06250, 5, 2)"/>
					<xsl:variable name="sf06250c" select="substring($sf06250, 7)"/>
					<xsl:value-of select="$sf06250b"/>
				</xsl:when>
				<xsl:when test="@tag='260' and ../marc:datafield[@tag='250']/marc:subfield[@code='6']">
					<xsl:variable name="sf06250" select="normalize-space(../marc:datafield[@tag='250']/marc:subfield[@code='6'])"/>
					<xsl:variable name="sf06250a" select="substring($sf06250, 1, 3)"/>
					<xsl:variable name="sf06250b" select="substring($sf06250, 5, 2)"/>
					<xsl:variable name="sf06250c" select="substring($sf06250, 7)"/>
					<xsl:value-of select="$sf06250b"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:if test="//marc:datafield/marc:subfield[@code='6']"> </xsl:if>
	</xsl:template>

	<xsl:template name="z3xx880">
		<!-- Evaluating the 300 field -->
		<xsl:variable name="x300">
			<xsl:choose>
				<xsl:when test="@tag='300' and marc:subfield[@code='6']">
					<xsl:variable name="sf06300" select="normalize-space(child::marc:subfield[@code='6'])"/>
					<xsl:variable name="sf06300a" select="substring($sf06300, 1, 3)"/>
					<xsl:variable name="sf06300b" select="substring($sf06300, 5, 2)"/>
					<xsl:variable name="sf06300c" select="substring($sf06300, 7)"/>
					<xsl:value-of select="$sf06300b"/>
				</xsl:when>
				<xsl:when test="@tag='351' and ../marc:datafield[@tag='300']/marc:subfield[@code='6']">
					<xsl:variable name="sf06300" select="normalize-space(../marc:datafield[@tag='300']/marc:subfield[@code='6'])"/>
					<xsl:variable name="sf06300a" select="substring($sf06300, 1, 3)"/>
					<xsl:variable name="sf06300b" select="substring($sf06300, 5, 2)"/>
					<xsl:variable name="sf06300c" select="substring($sf06300, 7)"/>
					<xsl:value-of select="$sf06300b"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="x351">
			<xsl:choose>
				<xsl:when test="@tag='351' and marc:subfield[@code='6']">
					<xsl:variable name="sf06351" select="normalize-space(../marc:datafield[@tag='351']/marc:subfield[@code='6'])"/>
					<xsl:variable name="sf06351a" select="substring($sf06351, 1, 3)"/>
					<xsl:variable name="sf06351b" select="substring($sf06351, 5, 2)"/>
					<xsl:variable name="sf06351c" select="substring($sf06351, 7)"/>
					<xsl:value-of select="$sf06351b"/>
				</xsl:when>
				<xsl:when test="@tag='300' and ../marc:datafield[@tag='351']/marc:subfield[@code='6']">
					<xsl:variable name="sf06351" select="normalize-space(../marc:datafield[@tag='351']/marc:subfield[@code='6'])"/>
					<xsl:variable name="sf06351a" select="substring($sf06351, 1, 3)"/>
					<xsl:variable name="sf06351b" select="substring($sf06351, 5, 2)"/>
					<xsl:variable name="sf06351c" select="substring($sf06351, 7)"/>
					<xsl:value-of select="$sf06351b"/>
				</xsl:when>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="x337">
			<xsl:if test="@tag='337' and marc:subfield[@code='6']">
				<xsl:variable name="sf06337" select="normalize-space(child::marc:subfield[@code='6'])"/>
				<xsl:variable name="sf06337a" select="substring($sf06337, 1, 3)"/>
				<xsl:variable name="sf06337b" select="substring($sf06337, 5, 2)"/>
				<xsl:variable name="sf06337c" select="substring($sf06337, 7)"/>
				<xsl:value-of select="$sf06337b"/>
			</xsl:if>
		</xsl:variable>
		<xsl:variable name="x338">
			<xsl:if test="@tag='338' and marc:subfield[@code='6']">
				<xsl:variable name="sf06338" select="normalize-space(child::marc:subfield[@code='6'])"/>
				<xsl:variable name="sf06338a" select="substring($sf06338, 1, 3)"/>
				<xsl:variable name="sf06338b" select="substring($sf06338, 5, 2)"/>
				<xsl:variable name="sf06338c" select="substring($sf06338, 7)"/>
				<xsl:value-of select="$sf06338b"/>
			</xsl:if>
		</xsl:variable>
		<xsl:if test="//marc:datafield/marc:subfield[@code='6']"> </xsl:if>
	</xsl:template>
	
	<xsl:template match="marc:datafield" mode="trans880">
		<xsl:variable name="dataField880" select="//marc:datafield"/>
		<xsl:variable name="sf06" select="normalize-space(marc:subfield[@code='6'])"/>
		<xsl:variable name="sf06a" select="substring($sf06, 1, 3)"/>
		<xsl:variable name="sf06b" select="substring($sf06, 4)"/>
		<xsl:choose>

			<!--tranforms 880 equiv-->

			<xsl:when test="$sf06a='047'">
				<xsl:call-template name="createGenreFrom047"/>
			</xsl:when>
			<xsl:when test="$sf06a='336'">
				<xsl:call-template name="createGenreFrom336"/>
			</xsl:when>
			<xsl:when test="$sf06a='655'">
				<xsl:call-template name="createGenreFrom655"/>
			</xsl:when>

			<xsl:when test="$sf06a='050'">
				<xsl:call-template name="createClassificationFrom050"/>
			</xsl:when>
			<xsl:when test="$sf06a='060'">
				<xsl:call-template name="createClassificationFrom060"/>
			</xsl:when>
			<xsl:when test="$sf06a='080'">
				<xsl:call-template name="createClassificationFrom080"/>
			</xsl:when>
			<xsl:when test="$sf06a='082'">
				<xsl:call-template name="createClassificationFrom082"/>
			</xsl:when>
			<xsl:when test="$sf06a='084'">
				<xsl:call-template name="createClassificationFrom080"/>
			</xsl:when>
			<xsl:when test="$sf06a='086'">
				<xsl:call-template name="createClassificationFrom082"/>
			</xsl:when>
			<xsl:when test="$sf06a='100'">
				<xsl:call-template name="createNameFrom100"/>
			</xsl:when>
			<xsl:when test="$sf06a='110'">
				<xsl:call-template name="createNameFrom110"/>
			</xsl:when>
			<xsl:when test="$sf06a='111'">
				<xsl:call-template name="createNameFrom110"/>
			</xsl:when>
			<xsl:when test="$sf06a='700'">
				<xsl:call-template name="createNameFrom700"/>
			</xsl:when>
			<xsl:when test="$sf06a='710'">
				<xsl:call-template name="createNameFrom710"/>
			</xsl:when>
			<xsl:when test="$sf06a='711'">
				<xsl:call-template name="createNameFrom710"/>
			</xsl:when>
			<xsl:when test="$sf06a='210'">
				<xsl:call-template name="createTitleInfoFrom210"/>
			</xsl:when>
			<xsl:when test="$sf06a='245'">
				<xsl:call-template name="createTitleAnalyticInfoFrom245"/>
				<xsl:call-template name="createNoteFrom245c"/>
				<xsl:if test="marc:subfield[@code='b']">
					<xsl:call-template name="createTitleUniform"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$sf06a='246'">
				<xsl:call-template name="createTitleInfoFrom246"/>
			</xsl:when>
			<xsl:when test="$sf06a='240'">
				<xsl:call-template name="createTitleInfoFrom240"/>
			</xsl:when>
			<xsl:when test="$sf06a='740'">
				<xsl:call-template name="createTitleInfoFrom740"/>
			</xsl:when>

			<xsl:when test="$sf06a='130'">
				<xsl:call-template name="createTitleInfoFrom130"/>
			</xsl:when>
			<xsl:when test="$sf06a='730'">
				<xsl:call-template name="createTitleInfoFrom730"/>
			</xsl:when>
			<xsl:when test="$sf06a='520'">
				<xsl:call-template name="createAbstractFrom520"/>
			</xsl:when>
			<!-- note 245 362 etc	-->
			<xsl:when test="$sf06a='245'">
				<xsl:call-template name="createNoteFrom245c"/>
			</xsl:when>
			<xsl:when test="$sf06a='362'">
				<xsl:call-template name="createNoteFrom362"/>
			</xsl:when>
			<xsl:when test="$sf06a='502'">
				<xsl:call-template name="createNoteFrom502"/>
			</xsl:when>
			<xsl:when test="$sf06a='504'">
				<xsl:call-template name="createNoteFrom504"/>
			</xsl:when>
			<xsl:when test="$sf06a='508'">
				<xsl:call-template name="createNoteFrom508"/>
			</xsl:when>
			<xsl:when test="$sf06a='511'">
				<xsl:call-template name="createNoteFrom511"/>
			</xsl:when>
			<xsl:when test="$sf06a='515'">
				<xsl:call-template name="createNoteFrom515"/>
			</xsl:when>
			<xsl:when test="$sf06a='518'">
				<xsl:call-template name="createNoteFrom518"/>
			</xsl:when>
			<xsl:when test="$sf06a='524'">
				<xsl:call-template name="createNoteFrom524"/>
			</xsl:when>
			<xsl:when test="$sf06a='530'">
				<xsl:call-template name="createNoteFrom530"/>
			</xsl:when>
			<xsl:when test="$sf06a='533'">
				<xsl:call-template name="createNoteFrom533"/>
			</xsl:when>
			<xsl:when test="$sf06a='535'">
				<xsl:call-template name="createNoteFrom535"/>
			</xsl:when>
			<xsl:when test="$sf06a='536'">
				<xsl:call-template name="createNoteFrom536"/>
			</xsl:when>
			<xsl:when test="$sf06a='538'">
				<xsl:call-template name="createNoteFrom538"/>
			</xsl:when>
			<xsl:when test="$sf06a='541'">
				<xsl:call-template name="createNoteFrom541"/>
			</xsl:when>
			<xsl:when test="$sf06a='545'">
				<xsl:call-template name="createNoteFrom545"/>
			</xsl:when>
			<xsl:when test="$sf06a='546'">
				<xsl:call-template name="createNoteFrom546"/>
			</xsl:when>
			<xsl:when test="$sf06a='561'">
				<xsl:call-template name="createNoteFrom561"/>
			</xsl:when>
			<xsl:when test="$sf06a='562'">
				<xsl:call-template name="createNoteFrom562"/>
			</xsl:when>
			<xsl:when test="$sf06a='581'">
				<xsl:call-template name="createNoteFrom581"/>
			</xsl:when>
			<xsl:when test="$sf06a='583'">
				<xsl:call-template name="createNoteFrom583"/>
			</xsl:when>
			<xsl:when test="$sf06a='585'">
				<xsl:call-template name="createNoteFrom585"/>
			</xsl:when>

			<!--	note 5XX	-->
			<xsl:when test="$sf06a='501'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='507'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='513'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='514'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='516'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='522'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='525'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='526'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='544'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='552'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='555'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='556'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='565'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='567'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='580'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='584'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>
			<xsl:when test="$sf06a='586'">
				<xsl:call-template name="createNoteFrom5XX"/>
			</xsl:when>

			<!--  subject 034 043 045 255 656 662 752 	-->
			<xsl:when test="$sf06a='034'">
				<xsl:call-template name="createSubGeoFrom034"/>
			</xsl:when>
			<xsl:when test="$sf06a='043'">
				<xsl:call-template name="createSubGeoFrom043"/>
			</xsl:when>
			<xsl:when test="$sf06a='045'">
				<xsl:call-template name="createSubTemFrom045"/>
			</xsl:when>
			<xsl:when test="$sf06a='255'">
				<xsl:call-template name="createSubGeoFrom255"/>
			</xsl:when>
			<!-- tags 610 -611 -630 delete -->
			<xsl:when test="$sf06a='600'">
				<xsl:call-template name="createSubNameFrom600"/>
			</xsl:when>
			<xsl:when test="$sf06a='648'">
				<xsl:call-template name="createSubChronFrom648"/>
			</xsl:when>
			<xsl:when test="$sf06a='650'">
				<xsl:call-template name="createSubTopFrom650"/>
			</xsl:when>
			<xsl:when test="$sf06a='651'">
				<xsl:call-template name="createSubGeoFrom651"/>
			</xsl:when>
			<xsl:when test="$sf06a='653'">
				<xsl:call-template name="createSubFrom653"/>
			</xsl:when>
			<xsl:when test="$sf06a='656'">
				<xsl:call-template name="createSubFrom656"/>
			</xsl:when>

			<xsl:when test="$sf06a='490'">
				<xsl:call-template name="createRelatedItemFrom490"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- titleInfo 130 730 245 246 240 740 210 -->

	<!-- 130 tmee 1.101 20140806-->
	<xsl:template name="createTitleInfoFrom130">
		<title level="a" type="main">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield">
					<xsl:if test="(contains('s',@code))">
						<xsl:value-of select="text()"/>
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:if test="(contains('adfklmors',@code) and (not(../marc:subfield[@code='n' or @code='p']) or (following-sibling::marc:subfield[@code='n' or @code='p'])))">
						<xsl:value-of select="text()"/>
						<xsl:text> </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString">
					<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
				</xsl:with-param>
			</xsl:call-template>
		</title>
	</xsl:template>
	<xsl:template name="createTitleInfoFrom730">
		<title level="a" type="main">
				<xsl:variable name="str">
					<xsl:for-each select="marc:subfield">
						<xsl:if test="(contains('s',@code))">
							<xsl:value-of select="text()"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:if test="(contains('adfklmors',@code) and (not(../marc:subfield[@code='n' or @code='p']) or (following-sibling::marc:subfield[@code='n' or @code='p'])))">
							<xsl:value-of select="text()"/>
							<xsl:text> </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString">
						<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
					</xsl:with-param>
				</xsl:call-template>
			</title>
	</xsl:template>

	<xsl:template name="createTitleInfoFrom210">
		<title level="a" type="alt">
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString">
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">a</xsl:with-param>
					</xsl:call-template>
				</xsl:with-param>
			</xsl:call-template>
		</title>
	</xsl:template>
	<!-- 1.79 -->
	<xsl:template name="createTitleAnalyticInfoFrom245">
			<xsl:variable name="title">
				<xsl:choose>
					<xsl:when test="marc:subfield[@code='b']">
						<xsl:call-template name="specialSubfieldSelect">
							<xsl:with-param name="axis">b</xsl:with-param>
							<xsl:with-param name="beforeCodes">afgks</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abnfgks</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="titleChop">
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString">
						<xsl:value-of select="$title"/>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:variable>
		<title level="a" type="main">
			<xsl:attribute name="xml:lang">
				<xsl:choose>
					<xsl:when test="$codeLangMarc='g d'">en</xsl:when>
					<xsl:when test="$codeLangMarc='ng '">en</xsl:when>
					<xsl:when test="$codeLangMarc='e d'">en</xsl:when>
					<xsl:when test="$codeLangMarc='0 0'">en</xsl:when>
					<xsl:when test="$codeLangMarc='s  '">en</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$codeLangMarc"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:value-of select="translate($titleChop,'(,),[,],/,&#34;','')"/>
			<xsl:if test="marc:subfield[@code='b']">
				<xsl:text> : </xsl:text>
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString">
						<xsl:call-template name="specialSubfieldSelect">
							<xsl:with-param name="axis">b</xsl:with-param>
							<xsl:with-param name="anyCodes">b</xsl:with-param>
							<xsl:with-param name="afterCodes">afgks</xsl:with-param>
						</xsl:call-template>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</title>
	</xsl:template>
	<xsl:template name="createTitleMonogrInfoFrom245">
		<xsl:variable name="title">
			<xsl:choose>
				<xsl:when test="marc:subfield[@code='b']">
					<xsl:call-template name="specialSubfieldSelect">
						<xsl:with-param name="axis">b</xsl:with-param>
						<xsl:with-param name="beforeCodes">afgks</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">abnfgks</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="titleChop">
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString">
					<xsl:value-of select="$title"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<title level="m" type="main" xml:lang="{$codeLangMarc}">
			<xsl:value-of select="translate($titleChop,'(,),[,],/,&#34;','')"/>
			<xsl:if test="marc:subfield[@code='b']">
				<xsl:text> : </xsl:text>
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString">
						<xsl:call-template name="specialSubfieldSelect">
							<xsl:with-param name="axis">b</xsl:with-param>
							<xsl:with-param name="anyCodes">b</xsl:with-param>
							<xsl:with-param name="afterCodes">afgks</xsl:with-param>
						</xsl:call-template>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:if>
		</title>
	</xsl:template>
	<xsl:template name="createTitleUniform">
		<xsl:variable name="title">
			<xsl:choose>
				<xsl:when test="marc:subfield[@code='b']">
					<xsl:call-template name="specialSubfieldSelect">
						<xsl:with-param name="axis">b</xsl:with-param>
						<xsl:with-param name="beforeCodes">afgks</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">abnfgks</xsl:with-param>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="titleChop">
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString">
					<xsl:value-of select="$title"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:if test="marc:subfield[@code='b']">
			<title level="a" type="alt">
				<xsl:value-of select="translate($titleChop,'(,),[,],/,&#34;','')"/>
			</title>
			<title level="a" type="sub">
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString">
						<xsl:call-template name="specialSubfieldSelect">
							<xsl:with-param name="axis">b</xsl:with-param>
							<xsl:with-param name="anyCodes">b</xsl:with-param>
							<xsl:with-param name="afterCodes">afgks</xsl:with-param>
						</xsl:call-template>
					</xsl:with-param>
				</xsl:call-template>
			</title>
		</xsl:if>
	</xsl:template>
	<xsl:template name="createTitleInfoFrom246">
		<title level="a" type="alt">
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString">
					<xsl:call-template name="subfieldSelect">
						<!-- 1/04 removed $h, $b -->
						<xsl:with-param name="codes">afi</xsl:with-param>
					</xsl:call-template>
				</xsl:with-param>
			</xsl:call-template>
		</title>
			<xsl:call-template name="subtitle"/>
	</xsl:template>

	<!-- 240 nameTitleGroup-->
	<!-- 1.102 -->

	<xsl:template name="createTitleInfoFrom240">
		<title level="a" type="main">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield">
					<xsl:if test="(contains('adfklmors',@code) and (not(../marc:subfield[@code='n' or @code='p']) or (following-sibling::marc:subfield[@code='n' or @code='p'])))">
						<xsl:value-of select="text()"/>
						<xsl:text> </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</xsl:variable>
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString">
					<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
				</xsl:with-param>
			</xsl:call-template>
		</title>
	</xsl:template>

	<xsl:template name="createTitleInfoFrom740">
		<title level="a" type="main">
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString">
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">ah</xsl:with-param>
					</xsl:call-template>
				</xsl:with-param>
			</xsl:call-template>
		</title>
	</xsl:template>

	<!-- name 100 110 111 1.93      -->

	<xsl:template name="createNameFrom100">
		<xsl:if test="@ind1='0' or @ind1='1'">
			<author>
				<persName>
					<xsl:call-template name="nameABCDQ"/>
					<roleName type="text">author</roleName>
				</persName>
				<xsl:call-template name="affiliation"/>
			</author>
		</xsl:if>
		<!-- 1.99 240 fix 20140804 -->
		<xsl:if test="@ind1='3'">
			<author>
				<persName>
					<xsl:call-template name="nameABCDQ"/>
					<roleName type="text">author</roleName>
				</persName>
				<xsl:call-template name="affiliation"/>
			</author>
		</xsl:if>
	</xsl:template>

	<xsl:template name="createNameFrom110">
		<author>
			<xsl:call-template name="nameABCDN"/>
		</author>
	</xsl:template>


	<!-- 111 1.104 20141104 -->

	<xsl:template name="createNameFrom111">
		<name type="conference">
			<xsl:call-template name="nameACDENQ"/>
			<roleName type="text">author</roleName>
		</name>
	</xsl:template>



	<!-- name 700 702 710 711 720 -->

	<xsl:template name="createNameFrom700">
		<xsl:choose>
			<xsl:when test="marc:subfield[@code='a']='Catholic Church. Congregatio indicis' or marc:subfield[@code='a']='Purgatorium divi Patricii' or marc:subfield[@code='a']='Confessionale [in italiano]'">
				<author>
					<orgName>
						<xsl:value-of select="marc:subfield[@code='a']"/>
					</orgName>
				</author>
			</xsl:when>
		<xsl:otherwise>
			<author>
				<persName>
					<xsl:call-template name="nameABCDQ"/>
					<roleName type="text">author</roleName>
				</persName>
				<xsl:if test="marc:subfield[@code='f'] !=''">
					<date><xsl:value-of select="marc:subfield[@code='f']"/></date>
				</xsl:if>
				<xsl:call-template name="affiliation"/>
			</author>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="createNameFrom701">
		<author>
			<persName>
				<xsl:call-template name="nameABCDQ"/>
				<roleName type="text">author</roleName>
			</persName>
			<xsl:if test="marc:subfield[@code='f'] !=''">
				<date><xsl:value-of select="marc:subfield[@code='f']"/></date>
			</xsl:if>
			<xsl:call-template name="affiliation"/>
		</author>
	</xsl:template>
	
	<xsl:template name="createNameFrom702">
		<author>
			<persName>
				<xsl:call-template name="nameABCDQ"/>
				<roleName type="text">author</roleName>
			</persName>
			<xsl:if test="marc:subfield[@code='f'] !=''">
				<date><xsl:value-of select="marc:subfield[@code='f']"/></date>
			</xsl:if>
			<xsl:call-template name="affiliation"/>
		</author>
	</xsl:template>
	
	<xsl:template name="createNameFrom710">
		<name type="org">
			<xsl:call-template name="nameABCDN"/>
			<roleName type="text">author</roleName>
		</name>
	</xsl:template>

<!-- 111 1.104 20141104 -->
	<xsl:template name="createNameFrom711">
		<name type="conference">
			<xsl:call-template name="nameACDENQ"/>
			<roleName type="text">author</roleName>
		</name>
	</xsl:template>
	
	
	<xsl:template name="createNameFrom720">
		<!-- 1.91 FLVC correction: the original if test will fail because of xpath: the current node (from the for-each above) is already the 720 datafield -->
		<!-- <xsl:if test="marc:datafield[@tag='720'][not(marc:subfield[@code='t'])]"> -->
		<xsl:if test="not(marc:subfield[@code='t'])">
			<author>
				<persName>
					<xsl:value-of select="marc:subfield[@code='a']"/>
				</persName>
				<roleName type="text">author</roleName>
			</author>
		</xsl:if>
	</xsl:template>

	<!-- genre 047 336 655	-->

	<xsl:template name="createGenreFrom047">
		<note>
			<xsl:attribute name="type">
				<xsl:value-of select="marc:subfield[@code='2']"/>
			</xsl:attribute>
			<!-- Template checks for altRepGroup - 880 $6 -->
			<xsl:call-template name="subfieldSelect">
				<xsl:with-param name="codes">abcdef</xsl:with-param>
				<xsl:with-param name="delimeter">-</xsl:with-param>
			</xsl:call-template>
		</note>
	</xsl:template>

	<xsl:template name="createGenreFrom336">
		<note>
			<xsl:attribute name="type">
				<xsl:value-of select="marc:subfield[@code='2']"/>
			</xsl:attribute>
			<!-- Template checks for altRepGroup - 880 $6 -->
			<xsl:call-template name="subfieldSelect">
				<xsl:with-param name="codes">a</xsl:with-param>
				<xsl:with-param name="delimeter">-</xsl:with-param>
			</xsl:call-template>
		</note>

	</xsl:template>

	<xsl:template name="createGenreFrom655">
		<note>
			<xsl:choose>
				<xsl:when test="marc:subfield[@code='2'][string-length()&gt; 0]">
			<xsl:attribute name="type">
				<xsl:value-of select="marc:subfield[@code='2']"/>
			</xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="type">other</xsl:attribute>
					<xsl:attribute name="source">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">abvxyz</xsl:with-param>
							<xsl:with-param name="delimeter">-</xsl:with-param>
						</xsl:call-template>
					</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<!-- Template checks for altRepGroup - 880 $6 -->
			<xsl:call-template name="subfieldSelect">
				<xsl:with-param name="codes">abvxyz</xsl:with-param>
				<xsl:with-param name="delimeter">-</xsl:with-param>
			</xsl:call-template>
		</note>
	</xsl:template>


	<!-- abstract 520 -->

	<xsl:template name="createAbstractFrom520">
		<abstract>
			<xsl:attribute name="ana">
				<xsl:choose>
					<xsl:when test="@ind1=' '">Summary</xsl:when>
					<xsl:when test="@ind1='0'">Subject</xsl:when>
					<xsl:when test="@ind1='1'">Review</xsl:when>
					<xsl:when test="@ind1='2'">Scope and content</xsl:when>
					<xsl:when test="@ind1='3'">Abstract</xsl:when>
					<xsl:when test="@ind1='4'">Content advice</xsl:when>
				</xsl:choose>
			</xsl:attribute>
			<p>
				<xsl:call-template name="subfieldSelect">
					<xsl:with-param name="codes">ab</xsl:with-param>
				</xsl:call-template>
			</p>
		</abstract>
	</xsl:template>

	<!-- note 245c thru 585 -->


	<!-- 1.100 245c 20140804 -->
	<xsl:template name="createNoteFrom245c">
		<xsl:if test="marc:subfield[@code='c']">
				<note type="statement of responsibility">
					<xsl:call-template name="scriptCode"/>
					<xsl:call-template name="subfieldSelect">
						<xsl:with-param name="codes">c</xsl:with-param>
					</xsl:call-template>
				</note>
		</xsl:if>

	</xsl:template>

	<xsl:template name="createNoteFrom362">
		<note type="date/sequential designation">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom500">
		<note>
			<xsl:value-of select="normalize-space(marc:subfield[1][@code='a'])"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom502">
		<note type="thesis">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom504">
		<note type="bibliography">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom508">
		<note type="creation/production credits">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='u' and @code!='3' and @code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom511">
		<note type="performers">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom515">
		<note type="numbering">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom518">
		<note type="venue">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='3' and @code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom524">
		<note type="preferred citation">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom530">
		<note type="additional physical form">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='u' and @code!='3' and @code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom533">
		<note type="reproduction">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="normalize-space(substring($str,1,string-length($str)-1))"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom535">
		<note type="original location">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom536">
		<note type="funding">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom538">
		<note type="system details">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom541">
		<note type="acquisition">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom545">
		<note type="biographical/historical">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom546">
		<note type="language">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom561">
		<note type="ownership">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom562">
		<note type="version identification">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom581">
		<note type="publications">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom583">
		<note type="action">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom585">
		<note type="exhibitions">
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<xsl:template name="createNoteFrom5XX">
		<note>
			<xsl:variable name="str">
				<xsl:for-each select="marc:subfield[@code!='6' and @code!='8']">
					<xsl:value-of select="."/>
					<xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:variable>
			<xsl:value-of select="substring($str,1,string-length($str)-1)"/>
		</note>
	</xsl:template>

	<!-- subject Geo 034 043 045 255 656 662 752 -->

	<xsl:template name="createSubGeoFrom034">
		<xsl:if test="marc:datafield[@tag=034][marc:subfield[@code='d' or @code='e' or @code='f' or @code='g']]">
			<textClass>
				<keywords ana="cartographics">
					<term>
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">defg</xsl:with-param>
						</xsl:call-template>
					</term>
				</keywords>
			</textClass>
		</xsl:if>
	</xsl:template>

	<xsl:template name="createSubGeoFrom043">
		<textClass>
			<keywords ana="geographicCode">
				<xsl:for-each select="marc:subfield[@code='a' or @code='b' or @code='c']">
					<term>
						<xsl:value-of select="self::marc:subfield"/>
					</term>
				</xsl:for-each>
			</keywords>
		</textClass>
	</xsl:template>

	<xsl:template name="createSubGeoFrom255">
		<textClass>
			<keywords ana="cartographics">
				<xsl:for-each select="marc:subfield[@code='a' or @code='b' or @code='c']">
					<xsl:if test="@code='a'">
						<term>
							<xsl:value-of select="."/>
						</term>
					</xsl:if>
					<xsl:if test="@code='b'">
						<term>
							<xsl:value-of select="."/>
						</term>
					</xsl:if>
					<xsl:if test="@code='c'">
						<term>
							<xsl:value-of select="."/>
						</term>
					</xsl:if>
				</xsl:for-each>
			</keywords>
		</textClass>
	</xsl:template>

	<!-- tags 610 -611 -630 delete -->
	<xsl:template name="createSubNameFrom600">
		<textClass>
			<keywords>
				<xsl:call-template name="subjectAuthority"/>
				<xsl:call-template name="termsOfAddress"/>
				<term type="name">
					<xsl:call-template name="chopPunctuation">
						<xsl:with-param name="chopString">
							<xsl:call-template name="subfieldSelect">
								<xsl:with-param name="codes">aq</xsl:with-param>
							</xsl:call-template>
						</xsl:with-param>
					</xsl:call-template>
				</term>
				<xsl:if test="marc:subfield[@code='d']">
					<term ana="date">
						<xsl:call-template name="nameDate"/>
					</term>
				</xsl:if>
				<xsl:call-template name="subjectAnyOrder"/>
			</keywords>
		</textClass>
	</xsl:template>
	<xsl:template name="createSubChronFrom648">
		<textClass>
			<keywords ana="temporal">
				<term>
					<xsl:call-template name="chopPunctuation">
						<xsl:with-param name="chopString">
							<xsl:call-template name="subfieldSelect">
								<xsl:with-param name="codes">abcd</xsl:with-param>
							</xsl:call-template>
						</xsl:with-param>
					</xsl:call-template>
				</term>
			</keywords>
		</textClass>
	</xsl:template>

	<xsl:template name="createSubTopFrom650">
		<textClass>
			<keywords ana="subject">
				<term>
					<xsl:call-template name="chopPunctuation">
						<xsl:with-param name="chopString">
							<xsl:call-template name="subfieldSelect">
								<xsl:with-param name="codes">abcd</xsl:with-param>
							</xsl:call-template>
						</xsl:with-param>
					</xsl:call-template>
				</term>
				<term>
					<xsl:call-template name="chopPunctuation">
						<xsl:with-param name="chopString">
							<xsl:call-template name="subfieldSelect">
								<xsl:with-param name="codes">xvy</xsl:with-param>
							</xsl:call-template>
						</xsl:with-param>
					</xsl:call-template>
				</term>
			</keywords>
		</textClass>
	</xsl:template>

	<xsl:template name="createSubGeoFrom651">
		<textClass>
			<keywords ana="geographic">
			<xsl:for-each select="marc:subfield[@code='a']">
				<term ana="geographic">
					<xsl:call-template name="chopPunctuation">
						<xsl:with-param name="chopString" select="."/>
					</xsl:call-template>
				</term>
			</xsl:for-each>
				<xsl:call-template name="subjectAnyOrder"/>
			</keywords>
		</textClass>
	</xsl:template>

	<xsl:template name="createSubFrom653">

		<xsl:if test="@ind2=' '">
			<textClass>
				<keywords>
					<term>
						<xsl:value-of select="."/>
					</term>
				</keywords>
			</textClass>
		</xsl:if>
		<xsl:if test="@ind2='0'">
			<textClass>
				<keywords>
					<term>
						<xsl:value-of select="."/>
					</term>
				</keywords>
			</textClass>
		</xsl:if>
<!-- tmee 1.93 20140130 delete-->
		<xsl:if test="@ind2='4'">
			<textClass>
				<keywords ana="temporal">
					<term>
						<xsl:value-of select="."/>
					</term>
				</keywords>
			</textClass>
		</xsl:if>
		<xsl:if test="@ind2='5'">
			<textClass>
				<keywords ana="geographic">
					<term>
					<xsl:value-of select="."/>
					</term>
				</keywords>
			</textClass>
		</xsl:if>
	</xsl:template>

	<xsl:template name="createSubFrom656">
		<textClass>
			<keywords ana="occupation">
				<term>
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString">
						<xsl:value-of select="marc:subfield[@code='a']"/>
					</xsl:with-param>
				</xsl:call-template>
				</term>
			</keywords>
		</textClass>
	</xsl:template>

	<xsl:template name="createSubTemFrom045">
		<xsl:if test="//marc:datafield[@tag=045 and @ind1='2'][marc:subfield[@code='b' or @code='c']]">
			<textClass>
				<keywords ana="temporal">
					<term>
						<xsl:call-template name="dates045b">
							<xsl:with-param name="str" select="marc:subfield[@code='b' or @code='c'][1]"/>
						</xsl:call-template>
					</term>
					<term>
					<xsl:call-template name="dates045b">
						<xsl:with-param name="str" select="marc:subfield[@code='b' or @code='c'][2]"/>
					</xsl:call-template>
					</term>
				</keywords>
			</textClass>
		</xsl:if>
	</xsl:template>

	<!-- classification 050 060 080 082 084 086 606-->

	<xsl:template name="createClassificationFrom050">
		<xsl:for-each select="marc:subfield[@code='b']">
			<textClass>
				<classCode scheme="#lcc">
					<xsl:if test="../marc:subfield[@code='3']">
						<xsl:attribute name="source">
							<xsl:value-of select="../marc:subfield[@code='3']"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:value-of select="preceding-sibling::marc:subfield[@code='a'][1]"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="text()"/>
				</classCode>
			</textClass>
		</xsl:for-each>
		<xsl:for-each select="marc:subfield[@code='a'][not(following-sibling::marc:subfield[@code='b'])]">
			<textClass>
				<classCode scheme="lcc">
				<xsl:if test="../marc:subfield[@code='3']">
					<xsl:attribute name="source">
						<xsl:value-of select="../marc:subfield[@code='3']"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:value-of select="text()"/>
				</classCode>
			</textClass>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="createClassificationFrom060">
		<textClass>
			<classCode scheme="#nlm">
			<xsl:call-template name="subfieldSelect">
				<xsl:with-param name="codes">ab</xsl:with-param>
			</xsl:call-template>
			</classCode>
		</textClass>
	</xsl:template>
	<xsl:template name="createClassificationFrom080">
		<textClass>
			<classCode scheme="#udc">
			<xsl:call-template name="subfieldSelect">
				<xsl:with-param name="codes">abx</xsl:with-param>
			</xsl:call-template>
			</classCode>
		</textClass>
	</xsl:template>
	<xsl:template name="createClassificationFrom082">
		<textClass>
			<classCode scheme="#ddc">
			<xsl:call-template name="subfieldSelect">
				<xsl:with-param name="codes">ab</xsl:with-param>
			</xsl:call-template>
			</classCode>
		</textClass>
	</xsl:template>
	<xsl:template name="createClassificationFrom084">
		<textClass>
			<classCode scheme="#{marc:subfield[@code='2']}">
				<xsl:call-template name="subfieldSelect">
					<xsl:with-param name="codes">ab</xsl:with-param>
				</xsl:call-template>
			</classCode>
		</textClass>
	</xsl:template>
	<xsl:template name="createClassificationFrom086">
		<xsl:for-each select="marc:datafield[@tag=086][@ind1=0]">
			<textClass>
				<classCode scheme="#sudocs">
					<xsl:value-of select="marc:subfield[@code='a']"/>
				</classCode>
			</textClass>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=086][@ind1=1]">
			<textClass>
				<classCode scheme="candoc">
					<xsl:value-of select="marc:subfield[@code='a']"/>
				</classCode>
			</textClass>
		</xsl:for-each>
		<xsl:for-each select="marc:datafield[@tag=086][@ind1!=1 and @ind1!=0]">
			<textClass>
				<classCode scheme="#{marc:subfield[@code='2']}">
					<xsl:value-of select="marc:subfield[@code='a']"/>
				</classCode>
			</textClass>
		</xsl:for-each>
	</xsl:template>

	<!-- identifier 020 024 022 028 010 037 UNDO Nov 23 2010 RG SM-->

	<!-- createRelatedItemFrom490 <xsl:for-each select="marc:datafield[@tag=490][@ind1=0]"> -->

	<xsl:template name="createRelatedItemFrom490">
		<series>
			<title level="s" type="main">
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">av</xsl:with-param>
						</xsl:call-template>
					</xsl:with-param>
				</xsl:call-template>
			</title>
		</series>
	</xsl:template>

	<!-- 880 global copy template -->
	<xsl:template match="* | @*" mode="global_copy">
		<xsl:copy>
			<xsl:apply-templates select="* | @* | text()" mode="global_copy"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template name="subfieldSelect">
		<xsl:param name="codes">abcdefghijklmnopqrstuvwxyz</xsl:param>
		<xsl:param name="delimeter">
			<xsl:text> </xsl:text>
		</xsl:param>
		<xsl:variable name="str">
			<xsl:for-each select="marc:subfield">
				<xsl:if test="contains($codes, @code)">
					<xsl:value-of select="text()"/>
					<xsl:value-of select="$delimeter"/>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="normalize-space(substring($str,1,string-length($str)-string-length($delimeter)))"/>
	</xsl:template>
	
	<xsl:template name="buildSpaces">
		<xsl:param name="spaces"/>
		<xsl:param name="char">
			<xsl:text> </xsl:text>
		</xsl:param>
		<xsl:if test="$spaces&gt;0">
			<xsl:value-of select="$char"/>
			<xsl:call-template name="buildSpaces">
				<xsl:with-param name="spaces" select="$spaces - 1"/>
				<xsl:with-param name="char" select="$char"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="chopPunctuation">
		<xsl:param name="chopString"/>
		<xsl:param name="punctuation">
			<xsl:text>.:,;/ </xsl:text>
		</xsl:param>
		<xsl:variable name="length" select="string-length($chopString)"/>
		<xsl:choose>
			<xsl:when test="$length=0"/>
			<xsl:when test="contains($punctuation, substring($chopString,$length,1))">
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString" select="substring($chopString,1,$length - 1)"/>
					<xsl:with-param name="punctuation" select="$punctuation"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="not($chopString)"/>
			<xsl:otherwise>
				<xsl:value-of select="normalize-space(translate($chopString,'\',''))"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="chopPunctuationFront">
		<xsl:param name="chopString"/>
		<xsl:variable name="length" select="string-length($chopString)"/>
		<xsl:choose>
			<xsl:when test="$length=0"/>
			<xsl:when test="contains('.:,;/[ ', substring($chopString,1,1))">
				<xsl:call-template name="chopPunctuationFront">
					<xsl:with-param name="chopString" select="substring($chopString,2,$length - 1)"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="not($chopString)"/>
			<xsl:otherwise>
				<xsl:value-of select="$chopString"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="chopPunctuationBack">
		<xsl:param name="chopString"/>
		<xsl:param name="punctuation">
			<xsl:text>.:,;/] </xsl:text>
		</xsl:param>
		<xsl:variable name="length" select="string-length($chopString)"/>
		<xsl:choose>
			<xsl:when test="$length=0"/>
			<xsl:when test="contains($punctuation, substring($chopString,$length,1))">
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString" select="substring($chopString,1,$length - 1)"/>
					<xsl:with-param name="punctuation" select="$punctuation"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="not($chopString)"/>
			<xsl:otherwise>
				<xsl:value-of select="$chopString"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- nate added 12/14/2007 for lccn.loc.gov: url encode ampersand, etc. -->
	<xsl:template name="url-encode">
		<xsl:param name="str"/>
		<xsl:if test="$str">
			<xsl:variable name="first-char" select="substring($str,1,1)"/>
			<xsl:choose>
				<xsl:when test="contains($safe,$first-char)">
					<xsl:value-of select="$first-char"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="codepoint">
						<xsl:choose>
							<xsl:when test="contains($ascii,$first-char)">
								<xsl:value-of select="string-length(substring-before($ascii,$first-char)) + 32"/>
							</xsl:when>
							<xsl:when test="contains($latin1,$first-char)">
								<xsl:value-of select="string-length(substring-before($latin1,$first-char)) + 160"/>
								<!-- was 160 -->
							</xsl:when>
							<xsl:otherwise>
								<xsl:message terminate="no">Warning: string contains a character
									that is out of range! Substituting "?".</xsl:message>
								<xsl:text>63</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:variable name="hex-digit1" select="substring($hex,floor($codepoint div 16) + 1,1)"/>
					<xsl:variable name="hex-digit2" select="substring($hex,$codepoint mod 16 + 1,1)"/>
					<!-- <xsl:value-of select="concat('%',$hex-digit2)"/> -->
					<xsl:value-of select="concat('%',$hex-digit1,$hex-digit2)"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="string-length($str) &gt; 1">
				<xsl:call-template name="url-encode">
					<xsl:with-param name="str" select="substring($str,2)"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template name="termsOfAddress">
		<xsl:if test="marc:subfield[@code='b' or @code='c']">
			<term type="termsOfAddress">
				<xsl:call-template name="chopPunctuation">
					<xsl:with-param name="chopString">
						<xsl:call-template name="subfieldSelect">
							<xsl:with-param name="codes">bc</xsl:with-param>
						</xsl:call-template>
					</xsl:with-param>
				</xsl:call-template>
			</term>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>