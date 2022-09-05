<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns="http://www.tei-c.org/ns/1.0"
	xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:marc="http://www.loc.gov/MARC21/slim"  xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="#all">
	<xsl:output encoding="UTF-8" indent="yes" method="xml"/>
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
		<xsl:choose>
			<xsl:when test="//marc:collection">
				<xsl:for-each select="//marc:collection/marc:record">
					<TEI xmlns:ns1="https://xml-schema.delivery.istex.fr/formats/ns1.xsd">
						<xsl:attribute name="xsi:noNamespaceSchemaLocation">
							<xsl:text>https://xml-schema.delivery.istex.fr/formats/tei-istex.xsd</xsl:text>
						</xsl:attribute>
						<teiHeader>
								<xsl:call-template name="marcRecord"/>
						</teiHeader>
						<text>
							<body>
								<xsl:choose>
									<xsl:when test="string-length($rawfulltextpath) &gt; 0">
										<p><xsl:value-of select="unparsed-text($rawfulltextpath, 'UTF-8')"/></p>
									</xsl:when>
									<xsl:otherwise>
										<p></p>
									</xsl:otherwise>
								</xsl:choose>
							</body>
						</text>
					</TEI>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
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
			</xsl:otherwise>
		</xsl:choose>
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
					<xsl:with-param name="chopString" select="marc:datafield[@tag=260]/marc:subfield[@code='c']"/>
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
						<xsl:value-of select="normalize-space($date)"/>
					</xsl:attribute>
					<xsl:value-of select="normalize-space($date)"/>
				</date>
			</publicationStmt>
			<!-- notesStmt -->
			<notesStmt>
				<note type="content-type" source="other" scheme="https://content-type.data.istex.fr/ark:/67375/XTP-CGT4WMJM-6">chapter</note>
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
							<pubPlace>
								<xsl:value-of select="concat(marc:datafield[@tag=620]/marc:subfield[@code='d'],', ',marc:datafield[@tag=620]/marc:subfield[@code='a'])"/>
							</pubPlace>
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
									<xsl:value-of select="normalize-space($date)"/>
								</xsl:attribute>
								<xsl:value-of select="normalize-space($date)"/>
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
					<xsl:for-each select="marc:datafield[@tag='830']">
						<series>
							<title level="s" type="main">
								<xsl:call-template name="chopPunctuation">
									<xsl:with-param name="chopString">
										<xsl:call-template name="subfieldSelect">
											<xsl:with-param name="codes">adfgklmorsv</xsl:with-param>
										</xsl:call-template>
									</xsl:with-param>
								</xsl:call-template>
							</title>
						</series>
					</xsl:for-each>
					<xsl:for-each select="marc:datafield[@tag=800]">
						<series>
							<title type="main" level="s">
								<xsl:call-template name="chopPunctuation">
									<xsl:with-param name="chopString">
										<xsl:call-template name="specialSubfieldSelect">
											<xsl:with-param name="anyCodes">tfklmorsv</xsl:with-param>
											<xsl:with-param name="axis">t</xsl:with-param>
											<xsl:with-param name="afterCodes">g</xsl:with-param>
										</xsl:call-template>
									</xsl:with-param>
								</xsl:call-template>
							</title>
							<editor>
								<persName>
									<xsl:call-template name="chopPunctuation">
										<xsl:with-param name="chopString">
											<xsl:call-template name="specialSubfieldSelect">
												<xsl:with-param name="anyCodes">aq</xsl:with-param>
												<xsl:with-param name="axis">t</xsl:with-param>
												<xsl:with-param name="beforeCodes">g</xsl:with-param>
											</xsl:call-template>
										</xsl:with-param>
									</xsl:call-template>
								</persName>
							</editor>
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
						<xsl:value-of select="normalize-space($date)"/>
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
			
			<!-- language -->
			<langUsage>
				<language>
				<xsl:attribute name="ident">
					<xsl:value-of select="normalize-space($codeLangMarc)"/>
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
	<!-- role -->
	<xsl:template name="role">
		<xsl:for-each select="marc:subfield[@code='e']">
			<roleName type="text">
				<xsl:value-of select="."/>
			</roleName>
		</xsl:for-each>
		<xsl:for-each select="marc:subfield[@code='4']">
			<roleName type="text">
				<xsl:value-of select="."/>
			</roleName>
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
					<xsl:value-of select="$splitName"/>
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
		<xsl:if test="@ind2=2">
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
		<xsl:if test="@ind2!=4">
			<xsl:if test="@ind2!=' '">
				<xsl:if test="@ind2!=8">
					<xsl:if test="@ind2!=9">
						<xsl:attribute name="scheme">
							<xsl:choose>
								<xsl:when test="@ind2=0">#LCSH</xsl:when>
								<xsl:when test="@ind2=1">#LCSHA</xsl:when>
								<xsl:when test="@ind2=2">#MESH</xsl:when>
								<!-- 1/04 fix -->
								<xsl:when test="@ind2=3">#NAL</xsl:when>
								<xsl:when test="@ind2=5">#CSH</xsl:when>
								<xsl:when test="@ind2=6">#RVM</xsl:when>
								<xsl:when test="@ind2=7">
									<xsl:text>#</xsl:text>
									<xsl:value-of select="marc:subfield[@code='2']"/>
								</xsl:when>
							</xsl:choose>
						</xsl:attribute>
					</xsl:if>
				</xsl:if>
			</xsl:if>
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
		<title level="a" type="main" xml:lang="{$codeLangMarc}">
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
			<xsl:for-each select="marc:subfield[@code='i']">
				<xsl:attribute name="source">
					<xsl:value-of select="text()"/>
				</xsl:attribute>
			</xsl:for-each>
		<title level="a" type="alt">
			<xsl:call-template name="chopPunctuation">
				<xsl:with-param name="chopString">
					<xsl:call-template name="subfieldSelect">
						<!-- 1/04 removed $h, $b -->
						<xsl:with-param name="codes">af</xsl:with-param>
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
					<xsl:call-template name="role"/>
				</persName>
				<xsl:call-template name="affiliation"/>
			</author>
		</xsl:if>
		<!-- 1.99 240 fix 20140804 -->
		<xsl:if test="@ind1='3'">
			<author>
				<persName>
					<xsl:call-template name="nameABCDQ"/>
					<xsl:call-template name="role"/>
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
			<xsl:call-template name="role"/>
		</name>
	</xsl:template>



	<!-- name 700 710 711 720 -->

	<xsl:template name="createNameFrom700">
		<xsl:if test="@ind1='1' or @ind2='1'">
			<author>
				<persName>
					<xsl:call-template name="nameABCDQ"/>
					<xsl:call-template name="role"/>
				</persName>
				<xsl:if test="marc:subfield[@code='f'] !=''">
					<date><xsl:value-of select="marc:subfield[@code='f']"/></date>
				</xsl:if>
				<xsl:call-template name="affiliation"/>
			</author>
		</xsl:if>
		<xsl:if test="@ind1='3'">
			<author>
				<persName>
					<xsl:call-template name="nameABCDQ"/>
					<xsl:call-template name="role"/>
				</persName>
				<xsl:call-template name="affiliation"/>
			</author>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="createNameFrom710">
		<name type="org">
			<xsl:call-template name="nameABCDN"/>
			<xsl:call-template name="role"/>
		</name>
	</xsl:template>

<!-- 111 1.104 20141104 -->
	<xsl:template name="createNameFrom711">
		<name type="conference">
			<xsl:call-template name="nameACDENQ"/>
			<xsl:call-template name="role"/>
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
				<xsl:call-template name="role"/>
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
			<xsl:value-of select="normalize-space(marc:subfield[@code='a'])"/>
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
								<xsl:with-param name="codes">x</xsl:with-param>
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
		<xsl:if test="@ind2=4">
			<textClass>
				<keywords ana="temporal">
					<term>
						<xsl:value-of select="."/>
					</term>
				</keywords>
			</textClass>
		</xsl:if>
		<xsl:if test="@ind2=5">
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

	<!-- classification 050 060 080 082 084 086 -->

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