<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" 
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:m="http://www.w3.org/1998/Math/MathML" 
    xmlns:ce="http://www.elsevier.com/xml/common/dtd"
    xmlns:els1="http://www.elsevier.com/xml/ja/dtd"    
    xmlns:els2="http://www.elsevier.com/xml/cja/dtd"
    xmlns:s1="http://www.elsevier.com/xml/si/dtd"
    xmlns:sb="http://www.elsevier.com/xml/common/struct-bib/dtd"
    xmlns:sa="http://www.elsevier.com/xml/common/struct-aff/dtd"
    exclude-result-prefixes="xsi m els1 els2 s1 sb ce xlink">
    <xsl:output encoding="UTF-8" method="xml"/>
    
    <!-- titres ebooks DE GRUYTER collection 2017 -->
    <xsl:variable name="codeDOI">
        <xsl:value-of select="/book/book-meta/book-id[@pub-id-type='doi']"/>
    </xsl:variable>
    <xsl:variable name="titleDG">
        <xsl:choose>
            <xsl:when test="$codeDOI='10.1515/9783110295665'">Abu Kamil : Algèbre et analyse diophantienne. Édition, traduction, commentaire historique et mathématique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783034609937'">Adrian Frutiger - caractères : L'oeuvre complète</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111330518'">Amiens, capitale provinciale : Étude sur la société urbaine au 17e siècle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9781501502385'">Angles et Grandeur : D'Euclide à Kamal al-Din al-Farisi</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110874723'">Anthropologie du conscrit français, d'après les comptes numériques et sommaires du recrutement de l'armée (1819-1826) : Présentation cartographique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110355949'">Aperçu grammatical du faisceau dialectal arabe andalou : Perspectives synchroniques, diachroniques et panchroniques</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110217162'">Apollonius de Perge, Coniques - Tome 2.1: Livres II et III. Commentaire historique et mathématique, édition et traduction du texte arabe</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110217230'">Apollonius de Perge, Coniques : Tome 2.3 : Livres II-IV: Édition et traduction du texte grec</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110217322'">Apollonius de Perge, Coniques: Tome 4: Livres VI et VII. Commentaire historique et mathématique, édition et traduction du texte arabe</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110217179'">Apollonius de Perge, Coniques. - Tome 2.2: Livre IV. Commentaire historique et mathématique, édition et traduction du texte arabe</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110212167'">Apollonius de Perge, Coniques. Tome 1.1: Livre I. Commentaire historique et mathématique, édition et traduction du texte arabe. Tome 1.2: Livre I: Édition et traduction du texte grec</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110210736'">Apollonius de Perge, Coniques. Tome 3 : Livre V. Commentaire historique et mathématique, édition et traduction du texte arabe</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110948301'">Aquilon de Bavière: Roman franco-italien en prose (1379-1407) : Volume III: Commentaire</xsl:when>
            <xsl:when test="$codeDOI='10.1007/9783764384524'">Architecture et efficacité énergétique : Principes de conception et de construction</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110924220'">Au-delà du refus: l'espoir : Recherches sur la cohérence narrative de Jr 32-45 (TM)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111330372'">Barcelone</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110869729'">Bayeux aux XVIIe et XVIIIe siècles : Contribution à l'histoire urbaine de la France</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111583778'">Bureaucratie et famine en Chine au 18e siècle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783484971530'">Chanson : Son histoire et sa famille dans les dictionnaires de langue française. Étude lexicale, théorique et historique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111330389'">Clio parmi les hommes : Recueil d'articles</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110935103'">Confidence / Dévoilement de soi dans l'interaction</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110408140'">Constant, Benjamin. Brochures politiques (1819-1821)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110923766'">Constant, Benjamin. Correspondance générale 1774-1792</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110934342'">Constant, Benjamin. Correspondance générale 1793-1794</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110934335'">Constant, Benjamin. Correspondance générale 1795-1799</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110939491'">Constant, Benjamin. Correspondance générale 1800-1802</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110931211'">Constant, Benjamin. Correspondance générale 1803-1805</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110973952'">Constant, Benjamin. Correspondance générale 1806-1807</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110974461'">Constant, Benjamin. Correspondance générale 1808-1809</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110233810'">Constant, Benjamin. Correspondance générale 1810 - 1912</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110293258'">Constant, Benjamin. Correspondance générale 1813-1815</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110309195'">Constant, Benjamin. Correspondance générale 1816-1818</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110459395'">Constant, Benjamin. Correspondance générale 1819-1820</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110932829'">Constant, Benjamin. Écrits de jeunesse (1774-1799)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110940350'">Constant, Benjamin. Écrits littéraires (1800-1813)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110274349'">Constant, Benjamin. Ecrits politiques . Commentaires sur Filangieri</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110924688'">Constant, Benjamin. Journal intime (1811-1816). Carnet. Livres de dépenses</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110929171'">Constant, Benjamin. Journaux intimes (1804-1807) suivis de Affaire de mon père (1811)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783598440786'">Constitutional Documents of France, Corsica and Monaco 1789-1848</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110316025'">Constitutional Documents of Haiti 1790-1860</xsl:when>
            <xsl:when test="$codeDOI='10.11129/detail.9783034615013'">Construire dans l’existant</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110934892'">Contra Christianos : La critique sociale et religieuse du christianisme des origines au concile de Nicée (45-325)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110800654'">Crise du logement et mouvements sociaux urbains : Enquête sur la région parisienne</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783035606935'">De Bâle - Herzog &amp; de Meuron</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111584225'">De l'Atlantique au fleuve Congo, 2 : Une géographie du sous-peuplement. République du Congo. République Gabonaise</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110932812'">De la Justice politique (1798-1800), d'aprés l'Enyuiry Concerning Political Justice de William Godwin</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110307931'">De la Religion, considérée dans sa source, ses formes et ses développements, Tome I</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110336689'">De la Religion, considérée dans sa source, ses formes et ses développements, Tome III</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110923773'">De la Religion, considérée dans sa source, ses formes ses développements, Tome II</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110322361'">Des événements aux objets : La méthode de l'abstraction extensive chez A. N. Whitehead. Préface de Michel Malherbe</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783484971325'">Dictionnaire d'ancien occitan auvergnat : Mauriacois et Sanflorain (1340-1540)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110450194'">Dictionnaire du faisceau dialectal arabe andalou : Perspectives phraséologiques et étymologiques</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110432916'">Dictionnaire étymologique de l’ancien français. Complément bibliographique 2016</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110313482'">Dictionnaire Étymologique Roman (DÉRom) : Genèse, méthodes et résultats</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110453614'">Dictionnaire Étymologique Roman (DÉRom) 2 : Pratique lexicographique et réflexions théoriques</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783484971462'">Dictionnaire historique de l’anthroponymie romane. Vol. I, 2. Bibliographie des sources historiques</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783484971455'">Dictionnaire historique de l’anthroponymie romane. Vol. I,1.Introduction. Cahier des normes rédactionelles. Morphologie. Abréviations et sigles</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110424126'">Dictionnaire historique de l’anthroponymie romane. Vol. III, 1. Les animaux : Première partie. Les mammifères</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110275377'">Dictionnaire onomasiologique de l'ancien gascon (DAG) Fasicule 14</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110928907'">Discours au Tribunat. De la possibilité d'une constitution républicaine dans un grand pays (1799-1803)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110904987'">Dravidien et Kariera : L'alliance de mariage dans l'Inde du Sud, et en Australie</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110945898'">Du latin aux langues romanes II : Nouvelles études de linguistique historique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111584720'">Économie et parenté : Leurs affinités de structure dans le domaine turc et dand le domaine arabe</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111330273'">Économie et société nivernaises au début du XIXe siècle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110880274'">Education et société en Russie dans le second tiers du XIXe siècle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110408348'">Enjeux du jeu de mots : Perspectives linguistiques et littéraires</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110483406'">Entre langues et logos : Une analyse épistémologique de la linguistique benvenistienne</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111544526'">Equations dans les monoides libres</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111535777'">Espaces et réseaux du haut moyen âge</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110322347'">Essais sur les fondements de l'ontologie du procès</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110901306'">Essentialisme : Alexandre d'Aphrodise entre logique, physique et cosmologie</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110801392'">Ethnologie de l'europe du sud-est : Une anthologie</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111342733'">Études de géographie tropicale offertes à Pierre Gourou</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110802931'">Europe des lumières : Recherches sur le 18ème siècle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110227291'">Eutocius d'Ascalon : Commentaire sur le traité des Coniques d'Apollonius de Perge (Livres I-IV)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110810974'">Fellahs tunisiens : L'économie rurale et la vie des campagnes aux 18e et 19e siècles</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110928891'">Florestan. De l'esprit de conquête et de l'usurpation. Réflexions sur les constitutions (1813-1814)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111728476'">Flux et reflux de la traite des nègres entre le Golfe de Bénin et Bahia de Todos os Santos du XVIIe au XIXe siècle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783484970557'">Français du Canada - Français de France VII : Actes du septième Colloque international de Lyon, du 16 au 18 juin 2003</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110231045'">Français du Canada - Français de France VIII : Actes du huitième Colloque international Trèves, du 12 au 15 avril 2007</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9781614516958'">Génération et Substance : Aristote et Averroès entre physique et métaphysique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111330419'">Géographie et géographie humaine dans la litterature arabe des origenes à 1050</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111343273'">Golonpoui : Analyse des conditions de modernisation d'un village du Nord-Cameroun</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111603698'">Grand Commerce et vie urbaine au XVIe siècle. Lyon et ses marchands (environs de 1520–environs de 1580). 1. La primauté du grand commerce et La renaissance urbaine</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111583082'">Grand Commerce et vie urbaine au XVIe siècle. Lyon et ses marchands (environs de 1520–environs de 1580). 2. Conjonctures</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111330648'">Guerre, état et société à la fin du moyen âge : Études sur les armées des rois de France 1337-1494</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110258271'">Guiron le Courtois : Roman arthurien en prose du XIIIe siècle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111677439'">Hérésies et sociétés dans l'Europe pré-industrielle 11e-18e siècles : Communications et débats du Colloque de Royaumont, [27-30 Mai 1962]</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110337884'">Histoire de l'analyse diophantienne classique : D'Abu Kamil à Fermat</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110815610'">Hommes et bêtes : Entretiens sur le racisme; Actes du colloque tenu du 12 au 15 mai 1973 au Centre Culturel International de Cerisy-La-Salle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111540962'">Implications - modalités, logiques polyvalentes, logique combinatoire, ontologie et méréologie de Lesniewski</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111709420'">Institution communale et pouvoir politique : Le cas de Roanne</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110376760'">Jean Marot : Un graveur d'architecture à l'époque de Louis XIV</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110569049'">Jeux modèles et simulations : Critique des jeux urbains</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110462098'">Justes, justice, justification : Harmoniques pauliniennes dans l’évangile de Luc</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111541587'">L'analyse formelle des langues naturelles : (Introduction to the formal analysis of natural languages)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110365443'">L'apologétique dans la pensée de Paul Tillich</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110812930'">L'empire du Monomotapa du XVe au XIXe siècle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111557687'">L'Enseignement français de la Révolution à nos jours</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110342963'">L'étranger intime : Les traductions françaises de l'oeuvre de Paul Celan (1971-2010)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110924466'">L'exemple lexicographique dans les dictionnaires français contemporains : Actes des »Premières Journées allemandes des dictionnaires« (Klingenberg am Main, 25-27 juin 2004)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9781501502798'">L'harmonie des Sirènes du pythagorisme ancien à Platon</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110880281'">L'Histoire psychoanalytique. Une Anthologie : Recueil de textes présentés et commentés</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110409239'">L'historiographie tardo-antique et la transmission des savoirs</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110229547'">L'identité de l'Eglise dans les Actes des apôtres : De la restauration d'Israël à la conquête universelle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111535227'">L'impérialisme français d'avant 1914 : Recueil de textes</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110322026'">La dialectique de l'intuition chez Alfred North Whitehead</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110909265'">La langue française au Manitoba (Canada) : Histoire et évolution lexicométrique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110241006'">La lettre de Julius Africanus à Aristide sur la généalogie du Christ : Analyse de la tradition textuelle, édition, traduction et étude critique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111637174'">La Likouala-Mossaka : Histoire de la pénétration du Haut Congo 1878-1920</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110568684'">La logique du financement public de l'urbanisation</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111342672'">La mise en valeur de l'île de Tabago : 1763-1783</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111342726'">La mission Marchand : 1895-1899</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110322422'">La philosophie spéculative de Whitehead</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110873696'">La poésie populaire traditionelle chantée au Proche-Orient Arabe. I: Les textes : Avec une introduction critique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110811575'">La politique urbaine dans la région lyonnaise, 1945-1972</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111534503'">La politique urbaine dans la région parisienne, 1945-1972</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111608662'">La production des céréales dans la France du XVIIe et du XVIII siècle. Texte</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110569025'">La production des grands ensembles</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111534510'">La rénovation urbaine à Paris : Structure urbaine et logique de classe</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110322323'">La science et le monde moderne</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111331010'">La Splendeur divine : Introduction à l'étude de la mentalité mésopotamienne</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783764378028'">La Suisse - portrait urbain : Vol. 1: Introduction - Vol. 2: Frontières, communes : brève histoire du territoire - Vol. 3: Matériaux</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783484970366'">La traduction de la poésie allemande en français dans la première moitié du XIXe siècle : Réception et interaction poétique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111647371'">La valeur du sol urbain et la propriété foncière : Le marché des terrains à Paris</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110944532'">Latin et langues romanes : Études de linguistique offertes à József Herman à l'occasion de son 80ème anniversaire</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111631066'">Le Berry du Xe siècle au milieu du XIIIe : Étude politique, religieuse, sociale, et économique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110263459'">Le chansonnier français de la Burgerbibliothek de Berne : Analyse et description du manuscrit et édition de 53 unica anonymes</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110823097'">Le charivari : Actes de la table ronde organisée à Paris (25-27 avril 1977) par l'Ecole des Etudes en Sciences Sociales et le Centre National de la Recherche Scientifique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111655178'">Le Congo au temps des grandes compagnies concessionnaires 1898-1930</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110419108'">Le contre-discours coranique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783035607512'">Le Corbusier &amp; Pierre Jeanneret - Restauration de l'Immeuble Clarté, Genève</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783035604016'">Le Corbusier. La Chapelle de Ronchamp</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783035603972'">Le Corbusier. La Villa Savoye</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110829013'">Le couple interdit, entretiens sur le racisme : La dialectique de l'altérité socio-culturelle et la sexualité. Actes du colloque tenu en mai 1977 au centre culturel international de cerisy-la-salle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110415452'">Le défi de l’enracinement napoléonien entre Rhin et Meuse, 1810-1814 : L’opinion publique dans les départements de la Roër, de l’Ourthe, des Forêts et de la Moselle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111729053'">Le développement économique de la Russie tsariste</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110217520'">Le dialecte grec ancien de Chypre : Tome I: Grammaire; Tome II: Répertoire des inscriptions en syllabaire chypro-grec</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783484970465'">Le Flaubert réel</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110873405'">Le manuel des inquisiteurs</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110805208'">Le mythe de la qualité de la vie et la politique urbaine en France : Enquête sur l'idéologie urbaine de l'élite technocratique et politique (1945-1975)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110927894'">Le Paraclet dans le corpus johannique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111582368'">Le paysan Limbu : Sa maison et ses champs</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110290356'">Le Registre d'inquisition de Jacques Fournier (évêque de Pamiers) : 1318 - 1325</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111729060'">Le règlement des dettes successorales dans les coutumes rédigées</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110233438'">Le roman de Renart : Edité d'après le manuscrit 0 (f. fr. 12583)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111330396'">Le Signe zodiacal du Scorpion : Dans les traditions occidentales de l'Antiquitégréco-latine à la Renaissance</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110336481'">Les Arithmétiques de Diophante : Lecture historique et mathématique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110208078'">Les Commentaires de Simplicius et de Jean Philopon à la Physique d'Aristote : Tradition et Innovation</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110301304'">Les connecteurs contenant des prépositions en français : Profils sémantiques et pragmatiques en synchronie et diachronie</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111631073'">Les fortunes françaises au XIXe siècle : Enquête sur la répartition et la composition des capitaux privés à Paris, Lyon, Lille, Bordeaux et Toulouse d'après l'enregistrement des déclarations de succession</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111330525'">Les hommes et la mort en Anjou aux 17e et 18e siècles : Essai de démographie et de psychologie historiques</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110349009'">Les leçons et les énigmes du passé : Une exégèse intra-biblique des psaumes historiques</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110263473'">Les localisateurs dans les constructions existentielles : Approche comparée en espagnol, en français et en italien</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111631134'">Les marchands écrivains : Affaires et humanisme à Florence 1375-1434</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110944884'">Les modalités de perception visuelle et auditive : Différences conceptuelles et répercussions sémantico-syntaxiques en espagnol et en français</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110479645'">Les musiques du français parlé : Essais sur l’accentuation, la métrique, le rythme, le phrasé prosodique et l’intonation du français contemporain</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111330693'">Les ouvriers en grève. Tome 1</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111330679'">Les ouvriers en grève. Tome 2</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111330297'">Les paysans de Languedoc: tome 2, Annexes, sources, graphiques</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111330280'">Les paysans de Languedoc. Tome 1</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110315172'">Les possibilités de jonction : Averroès - Thomas Wylton</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110322408'">Les principes de la connaissance naturelle d'Alfred North Whitehead</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111534527'">Les promoteurs immobiliers : Contribution à l'analyse de la production capitaliste du logement en France</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110322064'">Les rythmes éducatifs dans la philosophie de Whitehead</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111342665'">Les villages de liberté en Afrique noire française : 1887-1910</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111540931'">Logique des propositions et des prédicats, déduction naturelle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110887891'">Logique des propositions et des prédicats, tables de vérité et axiomatisation</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110927450'">Lucien et la tragédie</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110911053'">Mais tu élargiras mon cour : Nouvelle étude structurelle du psaume 119</xsl:when>
            <xsl:when test="$codeDOI='10.11129/detail.9783034615044'">Maisons individuelles</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110978643'">Mal, souffrance et justice de Dieu selon Romains 1-3 : Étude exégétique et théologique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783034609647'">Manuel d aménagement des espaces de conférence et de communication : Conférence. Excellence</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110302608'">Manuel de la philologie de l'édition</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110302219'">Manuel de linguistique française</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110313550'">Manuel de traductologie</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110333138'">Manuel des anthologies, corpus et textes romans</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110313505'">Manuel des langues de spécialité</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110302585'">Manuel des langues romanes</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783034613392'">Matériaux composites souples en architecture, construction et intérieurs</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110274714'">Mélanges de littérature et de politique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110923780'">Mémoires sur les Cent-Jours</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110806342'">Mode de vie et espaces sociaux : Processus d'urbanisation et différenciation sociale dans deux zones urbaines de Marseille</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110436846'">Molière et le théâtre arabe : Réception moliéresque et identités nationales arabes</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111647388'">Monopolville : Analyse des rapports entre l'entreprise, l'État et l'urbain à partir d'une enquête sur la croissance industrielle et urbaine de la région de Dunkerque</xsl:when>
            <xsl:when test="$codeDOI='10.1007/9783764382230'">Natures intermédiaires : Les paysages de Michel Desvigne</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110415490'">Négocier pour exister : Les villes et duchés du nord de l’Empire face à la France 1650-1730</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110807417'">Ni juif ni grec. Entretien sur le racisme : Actes du colloque tenu 16 au 20 juin 1975 au Centre Culturel International de Cerisy - la Salle</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110204322'">Nietzsche - Philosophie de la légèreté</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110234473'">Oeuvres complètes : Principes de politique applicables à tous les gouvernements représentatifs (Texte de 1806)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111342696'">Oracles et ordalies chez les Nzakara</xsl:when>
            <xsl:when test="$codeDOI='10.1524/9783486780291'">Partenaires de raison? : Le couple France-Allemagne et l'unification de l'Europe (1963-1969)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110805192'">Pauvreté économique et pauvreté sociale à Byzance : 4e-7e siècles</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110240825'">Pierre de Jean Olivi - Philosophe et théologien</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783034611855'">Plastiques : en Architecture et Construction</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110231069'">Ponctuation et syntaxe dans la langue française médiévale : Étude d'un corpus de chartes originales écrites à Liège entre 1236 et 1291</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110923797'">Principes de politique et autres écrits (juin 1814-juillet 1815). Liberté de la presse, Responsabilité des ministres, Mémoires de Juliette, Acte additionel etc.</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783034608596'">Quartier Ecoparc / Ecoparc Quarter : Bauart # 2</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111677446'">Ravitaillement et alimentation en Provence aux XIVe et XVe siècles</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110322385'">Regards croisés sur Alfred North Whitehead : Religions, Sciences, Politiques</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110224405'">Rétribution et intercession dans le Deutéronome</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111535791'">Révolution industrielle et sous-développement</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110275605'">Se reposer pour la terre, se reposer pour Dieu : L'année sabbatique en Lv 25,1-7</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110800883'">Sociologie rurale : Recueil de textes</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111348308'">Structure sociale et fortune mobilière et immobilière à Grenoble en 1847</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111348292'">Structures agricoles et développement economique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111675435'">Structures d'une population active de type traditionnel, Grenoble 1848</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110816563'">Structures sociales orientales et occidentales dans l'Espagne musulmane</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110474589'">Studies in Byzantine Sigillography Volume 12</xsl:when>
            <xsl:when test="$codeDOI='10.1007/9783764386757'">Systèmes vivants et paysage : Technologies et matériaux évolutifs pour l architecture du paysage</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110264517'">Talio Esto : Recherches sur les origines de la formule 'oeil pour oeil, dent pour dent' dans les droits du Proche-Orient ancien, et sur son devenir dans le monde gréco-romain</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111330594'">Technologie médiévale et transformations sociales</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110234497'">Textes des 1818 : Lectures à l'Athénée, Cours de politique constitutionnelle, Annales de la session de 1817à 1818, La Minerve française, Affaires W. Regnault et C. Lainé, Élections de 1818Cours à l'Athénée, Cours de politique constitutionnelle, Élections de 1818</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110814156'">Textes pour une psycholinguistique</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110880892'">Théorie économique du système féodal : Pour un modèle de l'économie polonaise 16e - 18e siècles</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110944372'">Traitier de Cyrurgie : Édition de la traduction en ancien français de la Chirurgie d'Abu 'l Qasim Halaf Ibn 'Abbas al-Zahrawi du manuscrit BNF, francais 1318</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110815672'">Un révolutionnaire-diplomate: Christian Rakovski : L'Union soviétique et l'Europe (1922-1941)</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111343235'">Une réforme locale en Chine au XVIe siècle : Hai Rui a Chun'an, 1558-1562</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110816556'">Une ville ouvrière au temps du socialisme utopique : Toulon de 1815 à 1851</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110807387'">Venise au siècle des lumières</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783111714660'">Vin, vigne et vignerons : En lyonnais et beaujolais; [(XVI.-XVIII. siècles)]</xsl:when>
            <xsl:when test="$codeDOI='10.1515/9783110294927'">Voir, croire, savoir : Les épistémologies de la création chez Gustave Flaubert</xsl:when>
        </xsl:choose>
    </xsl:variable>
    
    <!-- Elsevier liste conversion codes titres et verbalisations -->
    <!-- Verbalisation titres series -->
    <xsl:variable name="codeTitleElsevier1">
        <xsl:value-of select="//els1:item-info/els1:jid |//els2:item-info/els2:jid | //item-info/jid"/>
    </xsl:variable>
    <xsl:variable name="codeTitleElsevier">
       <xsl:choose>
           <!--ajouts liste unifiée des titres 2021-->
		     <xsl:when test="$codeTitleElsevier1='AA'">Acta Astronautica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AADE'">Agricultural Administration and Extension</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AAETH'">Applied Animal Ethology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AAGRO'">Acta Agronomica Sinica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AAMJ'">Asia-Australia Marketing Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AANAT'">Annals of Anatomy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AAP'">Accident Analysis and Prevention</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AAS'">Acta Automatica Sinica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AAT'">Acta Anaesthesiologica Taiwanica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AB'">Addictive Behaviors</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACA'">Analytica Chimica Acta</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACALIB'">The Journal of Academic Librarianship</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACCAUD'">Journal of International Accounting, Auditing and Taxation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACCEDU'">Journal of Accounting Education</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACCFOR'">Accounting Forum</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACCINF'">International Journal of Accounting Information Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACCOUN'">International Journal of Accounting</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACJ'">ACC Current Journal Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACM'">Advanced Cement Based Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACMI'">Australian College of Midwives Incorporated Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACMMS'">Annales de Chirurgie de la Main et du Membre superieur</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACN'">Archives of Clinical Neuropsychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACPAIN'">Acute Pain</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACS'">Journal of the American College of Surgeons</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACTBIO'">Acta Biomaterialia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACTHIS'">Acta Histochemica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACTOEC'">Acta Oecologica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACTPHA'">Actualités Pharmaceutiques</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACTPSY'">Acta Psychologica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACTROP'">Acta Tropica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACTSIN'">Acta Metallurgica Sinica (English Letters)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACURO'">Actas Urologicas Espanolas</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACVD'">Archives of Cardiovascular Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ACVDSP'">Archives of Cardiovascular Diseases Supplements</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AD'">Actas Dermo-Sifiliograficas</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ADB'">Advances in Biophysics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ADENGL'">Actas Dermo-Sifiliográficas (English Edition)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ADES'">Advances in Engineering Software</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ADESW'">Advances in Engineering Software and Workstations</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ADFRBM'">Advances in Free Radical Biology &amp; Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ADHOC'">Ad Hoc Networks</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ADIAC'">Advances in Accounting</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ADPO'">Additives for Polymers</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ADR'">Advanced Drug Delivery Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ADVEI'">Advanced Engineering Informatics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ADVENV'">Advances in Environmental Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ADVES'">Advances in Engineering Software (1978)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ADWR'">Advances in Water Resources</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AEA'">Atmospheric Environment</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AEAE'">Archaeology, Ethnology and Anthropology of Eurasia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AEC'">Advanced Energy Conversion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AENJ'">Australasian Emergency Nursing Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AEOLIA'">Aeolian Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AEP'">Annals of Epidemiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AES'">Journal of African Earth Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AESCTE'">Aerospace Science and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AESOLD'">Journal of African Earth Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AEUE'">AEU - International Journal of Electronics and Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AG'">Applied Geochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AGADM'">Agricultural Administration</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AGCHIN'">Agricultural Sciences in China</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AGECON'">Agricultural Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AGECOS'">Agro-Ecosystems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AGEE'">Agriculture, Ecosystems and Environment</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AGG'">Archives of Gerontology and Geriatrics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AGISTU'">Journal of Aging Studies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AGMET'">Agricultural and Forest Meteorology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AGSY'">Agricultural Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AGWAS'">Agricultural Wastes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AGWAT'">Agricultural Water Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AGWE'">Agriculture and Environment</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AICRP'">Annals of the ICRP/ICRP Publication</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AIDD'">Analysis and Intervention In Developmental Disablities</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AIN'">Antimicrobics &amp; Infectious Diseases Newsletter</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AIP'">The Arts in Psychotherapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AIPI'">Annales de l'Institut Pasteur / Immunologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AIPM'">Annales de l'Institut Pasteur / Microbiologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AIPV'">Annales de l'Institut Pasteur / Virologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AIRDES'">Aircraft Design</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AJC'">The American Journal of Cardiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AJG'">Arab Journal of Gastroenterology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AJGP'">The American Journal of Geriatric Pharmacotherapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AJH'">American Journal of Hypertension</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AJHG'">The American Journal of Human Genetics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AJM'">The American Journal of Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AJMS'">The American Journal of Medicine Supplements</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AJOPHT'">American Journal of Ophthalmology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AJORTH'">American Journal of Orthodontics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AJP'">Asian Journal of Psychiatry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AJPA'">The American Journal of Pathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AJS'">The American Journal of Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ALC'">Alcohol</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ALCR'">Advances in Life Course Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ALLER'">Allergologia et Immunopathologia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ALTER'">Alter</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AM'">Acta Materialia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMASCI'">Acta Mathematica Scientia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMBP'">Ambulatory Pediatrics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMBSUR'">Ambulatory Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMC'">Applied Mathematics and Computation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMEEVA'">American Journal of Evaluation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMEPRE'">American Journal of Preventive Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMEPSY'">Annales medico-psychologiques</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMET'">Agricultural Meteorology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMGAST'">The American Journal of Gastroenterology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMGP'">The American Journal of Geriatric Psychiatry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMIA'">Journal of the American Medical Informatics Association</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMIT'">Accounting, Management and Information Technologies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMJ'">Australasian Marketing Journal (AMJ)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AML'">Applied Mathematics Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMM'">Acta Metallurgica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMMOLD'">Acta Metallurgica et Materialia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMNL'">Antimicrobic Newsletter</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMREP'">Advances in Molecular Relaxation Processes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AMRIP'">Advances in Molecular Relaxation and Interaction Processes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANAI'">Annals of Allergy, Asthma &amp; Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANBEHM'">Animal Behaviour Monographs</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANCAAN'">Annales de cardiologie et dangeiologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANE'">Annals of Nuclear Energy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANGIO'">Angiologia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANICOM'">Pratique Médicale et Chirurgicale de l'Animal de Compagnie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANIFEE'">Animal Feed Science and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANIHPB'">Annales de l'Institut Henri Poincare / Probabilites et statistiques</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANIHPC'">Annales de l'Institut Henri Poincare / Analyse non lineaire</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANIREP'">Animal Reproduction Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANL'">Auris Nasus Larynx</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANNCHA'">Annales des Ponts et Chaussées</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANNCHI'">Annales de chirurgie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANNCM'">Annales de Chirurgie de la Main</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANNCSM'">Annales de chimie - Sciences des materiaux</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANNDUR'">Annales durologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANNFAR'">Annales Fran&#231;aises danesthesie et de reanimation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANNGEN'">Annales de genetique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANNOCC'">Annals of Occupational Hygiene</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANNPAL'">Annales de paleontologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANNPLA'">Annales de chirurgie plastique esthetique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANNRMP'">Annales de readaptation et de medecine physique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANPEDI'">Anales de Pediatria</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANR'">Asian Nursing Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANSE'">Annals of Nuclear Science and Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANSENS'">Annales scientifiques de l'Ecole normale superieure</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANTAGE'">International Journal of Antimicrobial Agents</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANTHRO'">LAnthropologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ANXDIS'">Journal of Anxiety Disorders</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AOB'">Archives of Oral Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AODF'">Alpha Omegan</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AORN'">AORN Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AOS'">Accounting, Organizations and Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APAC'">Applied Acoustics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APAL'">Annals of Pure and Applied Logic</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APCATA'">Applied Catalysis A: General</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APCATB'">Applied Catalysis B: Environmental</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APCS'">Acta Physico-Chimica Sinica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APEN'">Applied Energy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APH'">Actualités Pharmaceutiques Hospitalières</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APJTM'">Asian Pacific Journal of Tropical Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APM'">Applied Mathematical Modelling</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APNUM'">Applied Numerical Mathematics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APOR'">Applied Ocean Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APPAP'">Archiv fur Protistenkunde : Protozoen, Algen, Pilze</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APPBEH'">Applied Behavioral Science Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APPDEV'">Journal of Applied Developmental Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APPET'">Appetite</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APPGEO'">Journal of Applied Geophysics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APPLAN'">Applied Animal Behaviour Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APPQUA'">International Journal of Applied Quality Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APPSS'">Applications of Surface Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APPSY'">Applied and Preventive Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APRIM'">Atencion Primaria</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APSJ'">APS Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APSOIL'">Applied Soil Ecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APSUP'">Applied Superconductivity</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APSUSC'">Applied Surface Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APT'">Advanced Powder Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='APUNTS'">Apunts. Medicina de l'Esport</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AQBOT'">Aquatic Botany</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AQTOX'">Aquatic Toxicology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AQUA'">Aquaculture</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AQUE'">Aquacultural Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AQUECH'">Aquatic Ecosystem Health &amp; Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AQULIV'">Aquatic Living Resources</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARABJC'">Arabian Journal of Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARBR'">Archivos de Bronconeumología (English Edition)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARBRES'">Archivos de Bronconeumologia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARCMED'">Archives of Medical Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARCPED'">Archives de pediatrie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARFD'">Annual Review of Fish Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARI'">Applied Radiation and Isotopes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARIE'">Artificial Intelligence in Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARMR'">Applied Research In Mental Retardation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARR'">Ageing Research Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARTERI'">Cl&#237;nica e Investigacion en Arteriosclerosis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARTINT'">Artificial Intelligence</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARTMED'">Artificial Intelligence In Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARTPSY'">Art Psychotherapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ARTRES'">Artery Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AS'">Journal of Aerosol Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ASD'">Arthropod Structure and Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ASIECO'">Journal of Asian Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ASJSUR'">Asian Journal of Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ASOC'">Applied Soft Computing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ASPEN'">Journal of Asia-Pacific Entomology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ASTPHY'">Astroparticle Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ASTQ'">Astronomy Quarterly</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ASTREV'">New Astronomy Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ASTSIN'">Acta Metallurgica Sinica (English Letters)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ASW'">Assessing Writing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ATC'">Anesthesiology Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ATE'">Applied Thermal Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ATH'">Atherosclerosis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ATHSUP'">Atherosclerosis (Supplements) (Component)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ATMEA'">Atmospheric Environment. Part A: General Topics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ATMEB'">Atmospheric Environment. Part B: Urban Atmosphere</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ATMENV'">Atmospheric Environment (1967)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ATMOS'">Atmospheric Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ATP'">Journal of Atmospheric and Solar-Terrestrial Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ATPO'">Journal of Atmospheric and Terrestrial Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ATR'">Annals of Tourism Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ATS'">The Annals of Thoracic Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AUCC'">Australian Critical Care</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AUJMI'">The Australian Journal of Midwifery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AUSEN'">Australian Emergency Nursing Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AUT'">Automatica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AUTCON'">Automation in Construction</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AUTNEU'">Autonomic Neuroscience: Basic and Clinical</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AUTO'">Automatica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AUTREV'">Autoimmunity Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AVB'">Aggression and Violent Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AVR'">Antiviral Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='AVSG'">Annals of Vascular Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BAAE'">Basic and Applied Ecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BACA'">Baillieres Clinical Anaesthesiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BACEM'">Baillieres Clinical Endocrinology and Metabolism</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BACG'">Baillieres Clinical Gastroenterology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BACH'">Baillieres Clinical Haematology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BACOG'">Baillieres Clinical Obstetrics and Gynaecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BACR'">Baillieres Clinical Rheumatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BAE'">Building and Environment</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BAMBED'">Biochemistry and Molecular Biology Education</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBA'">Biochimica et biophysica acta</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBABEN'">Biochimica et biophysica acta, ER. Reviews on bioenergetics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBABIO'">Biochimica et biophysica acta. Bioenergetics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBABP'">Biochimica et biophysica acta. Biophysics including photosynthesis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBABS'">Biochimica et biophysica acta. Specialized section on biophysical subjects</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBACAN'">Biochimica et biophysica acta, CR. Reviews on cancer</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBADIS'">Biochimica et biophysica acta. Molecular basis of disease</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAEBO'">Biochimica et biophysica acta. Enzymology and biological oxidations</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAEE'">Biochimica et biophysica acta, E. Enzymology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAES'">Biochimica et biophysica acta. Specialized section on enzymological subjects</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAEXP'">Biochimica et biophysica acta, N. Gene structure and expression</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAGEN'">Biochimica et biophysica acta. G, General subjects</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAGRM'">Biochimica et Biophysica Acta (BBA) - Gene Regulatory Mechanisms</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBALIP'">Biochimica et biophysica acta. L, Lipids and lipid metabolism</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBALRS'">Biochimica et biophysica acta. Specialized section on lipids and related subjects</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAMCB'">Biochimica and biophysica acta. Molecular and cell biology of lipids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAMCR'">Biochimica et biophysica acta. Molecular cell research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAMEM'">Biochimica et biophysica acta. Biomembranes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAMM'">Biochimica et biophysica acta. Mucoproteins and mucopolysaccharides</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAMUC'">Biochimica et biophysica acta. Specialized section on mucoproteins and mucopolysaccharides</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBANAP'">Biochimica et biophysica acta, N. Nucleic acids and protein synthesis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBANAR'">Biochimica et biophysica acta. Specialized section on nucleic acids and related subjects</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAPAP'">Biochimica et biophysica acta. Specialized section on nucleic acids and related subjects</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAPRO'">Biochimica et biophysica acta. Protein structure and molecular enzymology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAPST'">Biochimica et biophysica acta. Protein structure</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBAREV'">Biochimica et biophysica acta. MR, Reviews on biomembranes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BBR'">Behavioural Brain Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BC'">International Journal of Biochemistry and Cell Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BCP'">Biochemical Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BE'">Biochemical Education</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BEHBIO'">Behavioral Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BEHNB'">Behavioral and Neural Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BEJ'">Biochemical Engineering Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BEPROC'">Behavioural Processes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BES'">Biomedical and Environmental Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BETH'">Behavior Therapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BICELL'">Biology of the Cell</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIHY'">Bioscience Hypotheses</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIO'">BioSystems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOBR'">Biobehavioral reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOC'">Biological Conservation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOCHE'">Biophysical Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOCHI'">Biochimie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOENG'">Biomolecular Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOINO'">Bioinorganic Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOJEC'">Bioelectrochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOM'">Biochemical medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOMAC'">International Journal of Biological Macromolecules</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOMS'">Biomass</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIONIC'">Journal of Bionic Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOOLD'">Bioelectrochemistry and Bioenergetics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOPHA'">Biomedicine &amp; Pharmacotherapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOPSY'">Biological Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOS'">Biosensors and Bioelectronics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOSN'">Biosensors</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOTEC'">Journal of Biotechnology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BIOWAS'">Biological Wastes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BITE'">Bioresource Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BJAB'">The British Journal of Animal Behaviour</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BJCHIR'">The British Journal of Chiropractic</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BJDC'">British Journal of Diseases of the Chest</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BJMSU'">British Journal of Medical and Surgical Urology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BJOG'">British journal of obstetrics and gynaecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BJOGYN'">BJOG: An International Journal of Obstetrics and Gynaecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BJTDC'">British Journal of Tuberculosis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BJTUB'">British Journal of Tuberculosis and Diseases of the Chest</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BLAR'">Bulletin of Latin American Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BM'">Journal of Biomechanics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BMC'">Bioorganic &amp; Medicinal Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BMCL'">Bioorganic &amp; Medicinal Chemistry Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BODYIM'">Body Image</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BON'">Bone</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BONMIN'">Bone and Mineral</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BONSOI'">Joint Bone Spine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BPAJ'">Beitrage zur Pathologie: </xsl:when>
             <xsl:when test="$codeTitleElsevier1='BPJ'">Biophysical Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BPP'">Biochemie und Physiologie der Pflanzen</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BPS'">Biological Psychiatry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRACHY'">Brachytherapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRADEV'">Brain and Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRB'">Brain Research Bulletin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRES'">Brain Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRESC'">Cognitive Brain Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRESD'">Developmental Brain Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRESM'">Molecular Brain Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRESP'">Brain Research Protocols</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRESR'">Brain Research Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRIHJ'">British Homoeopathic Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRIJOS'">British Journal of Oral Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRS'">Brain Stimulation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRT'">Behaviour Research and Therapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BRY'">Biorheology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BSE'">Biochemical Systematics and Ecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BSO'">Drug Discovery Today: BIOSILICO</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BSPC'">Biomedical Signal Processing and Control</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BTEP'">Journal of Behavior Therapy and Experimental Psychiatry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BTT'">Biometric Technology Today</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BUISCI'">Building Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BULSCI'">Bulletin des sciences mathematiques</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BUSHOR'">Business Horizons</xsl:when>
             <xsl:when test="$codeTitleElsevier1='BVETJ'">British Veterinary Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAA'">Chinese Astronomy and Astrophysics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAC'">Computers and Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CACCN'">Confederation of Australian Critical Care Nurses journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CACE'">Computers and Chemical Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAE'">Computers &amp; Education</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAEE'">Computers and Electrical Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAF'">Computers and Fluids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAG'">Computers &amp; Graphics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAGEO'">Computers and Geosciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAIE'">Computers &amp; Industrial Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAIR'">Clinical and Applied Immunology Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CALI'">Revista de Calidad Asistencial</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CALPHA'">Calphad</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAM'">Journal of Computational and Applied Mathematics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAMSS'">Acta Mechanica Solida Sinica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAMWA'">Computers and Mathematics with Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAN'">Cancer Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CANEP'">Cancer Epidemiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CANRAD'">Cancer / Radiotherapie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAOR'">Computers and Operations Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAP'">Current Applied Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAR'">Carbohydrate Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CARBON'">Carbon</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CARP'">Carbohydrate Polymers</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CARRAD'">Cardiovascular Radiation Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CARREV'">Cardiovascular Revascularization Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAS'">Computers and Structures</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CATCOM'">Catalysis Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CATENA'">Catena</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CATTOD'">Catalysis Today</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CAUP'">Computer Audit Update</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBA'">Comparative Biochemistry and Physiology, Part A: Physiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBAC'">Computational Biology and Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBAOLD'">Comparative Biochemistry and Physiology, Part A: Physiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBB'">Comparative Biochemistry and Physiology, Part B: Biochemistry and Molecular Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBBOLD'">Comparative Biochemistry and Physiology, Part B: Biochemistry and Molecular Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBC'">Comparative Biochemistry and Physiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBCOLD'">Comparative Biochemistry and Physiology, Part C: Comparative Pharmacology and Toxicology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBD'">Comparative Biochemistry and Physiology Part D: Genomics and Proteomics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBI'">Chemico-Biological Interactions</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBINTR'">Cell Biology International Reports</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBM'">Computers in Biology and Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBP'">Comparative Biochemistry And Physiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBPC'">Comparative Biochemistry and Physiology, Part C: Comparative Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CBPRA'">Cognitive and Behavioral Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CCA'">Clinica Chimica Acta</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CCC'">Critical Care Clinics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CCL'">Cardiology Clinics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CCLET'">Chinese Chemical Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CCOMP'">Computer Compacts</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CCR'">Coordination Chemistry Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CCS'">City, Culture and Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CCT'">Controlled Clinical Trials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CDP'">Cancer Detection and Prevention</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CECO'">Cement and Concrete Composites</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CEJ'">Chemical Engineering Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CEJBEJ'">The Chemical Engineering Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CEJOLD'">The Chemical Engineering Journal and The Biochemical Engineering Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CELDD'">Cell Differentiation and Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CELDIF'">Cell Differentiation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CELL'">Cell</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CEMCON'">Cement and Concrete Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CENG'">Coastal Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CEP'">Chemical Engineering &amp; Processing: Process Intensification</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CERI'">Ceramics International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CERINT'">Ceramurgia International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CES'">Chemical Engineering Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CEUS'">Computers, Environment and Urban Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CEV'">Clinical Eye and Vision Care</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CFSB'">Computer Fraud &amp; Security</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CGC'">Cancer Genetics and Cytogenetics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CGFR'">Cytokine and Growth Factor Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CGIG'">Chemical Geology: Isotope Geoscience Section</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CGM'">Clinics in Geriatric Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHAOS'">Chaos, Solitons and Fractals: the interdisciplinary journal of Nonlinear Science, and Nonequilibrium and Complex Phenomena</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHB'">Computers in Human Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHBIOL'">Chemistry &amp; Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHEGLO'">Chemosphere - Global Change Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHEHEA'">Chemical Health and Safety</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHEM'">Chemosphere</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHEMER'">Geochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHEMGE'">Chemical Geology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHEMOM'">Chemometrics and Intelligent Laboratory Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHEMPH'">Chemical Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHENEU'">Journal of Chemical Neuroanatomy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHERD'">Chemical Engineering Research and Design</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHIABU'">Child Abuse &amp; Neglect</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHIAST'">Chinese Astronomy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHIECO'">China Economic Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHIMAI'">Chirurgie de la main</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHNAES'">Acta Ecologica Sinica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHNJB'">Chinese Journal of Biotechnology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHNJC'">Chinese Journal of Catalysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHQ'">Cornell Hotel and Restaurant Administration Quarterly</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHROLD'">Journal of Chromatography B: Biomedical Sciences and Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHROMA'">Journal of Chromatography A</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHROMB'">Journal of Chromatography B</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CHRREV'">Chromatographic Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CIB'">Cospar Information Bulletin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CID'">Clinics in Dermatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CIFST'">Canadian Institute of Food Science and Technology Journal / Journal de L'Institut Canadien de Science et Technologie Alimentaire</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CIMID'">Comparative Immunology, Microbiology and Infectious Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CIN'">Clinical Immunology Newsletter</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CIRP'">CIRP Annals - Manufacturing Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CIRPJ'">CIRP Journal of Manufacturing Science and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CIRUGI'">Cirugia espanola</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CIS'">Advances in Colloid and Interface Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CJA'">Chinese Journal of Aeronautics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CJAC'">Chinese Journal of Analytical Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CJCHE'">Chinese Journal of Chemical Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CJCHRM'">Chinese Journal of Chromatography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CJNM'">Chinese Journal of Natural Medicines</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CJTEE'">Chinese Journal of Traumatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CJWB'">Columbia Journal of World Business</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CL'">Computer Languages</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLAE'">Contact Lens and Anterior Eye</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLAY'">Applied Clay Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLB'">Clinical Biochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLBC'">Clinical Breast Cancer</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLCC'">Clinical Colorectal Cancer</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLCHIR'">Clinical Chiropractic</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLCO'">Clinical Cornerstone</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLD'">Clinics in Liver Disease</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLINEM'">Clinics in Endocrinology and Metabolism</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLINEU'">Clinical Neurology and Neurosurgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLINPH'">Clinical Neurophysiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLIPOL'">Climate Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLIPOS'">Clinical Positron Imaging</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLIRES'">Clinical Neuroscience Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLITHE'">Clinical Therapeutics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLLC'">Clinical Lung Cancer</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLMA'">Clinical Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLOLD'">Clinical Lymphoma</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLP'">Clinics in Perinatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLR'">ACOG Clinical Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLS'">Cellular Signalling</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CLSR'">Computer Law &amp; Security Review: The International Journal of Technology Law and Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CMA'">Computer Methods in Applied Mechanics and Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CMCONL'">CMIG Extra: Cases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CME'">Clinics in Chest Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CMIG'">Computerized Medical Imaging and Graphics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CMN'">Clinical Microbiology Newsletter</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CMQ'">Canadian Metallurgical Quarterly</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CMSJ'">Chinese Medical Sciences Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CNF'">Combustion and Flame</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CNSAJ'">CNSA Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CNSNS'">Communications in Nonlinear Science and Numerical Simulation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COBIOT'">Current Opinion in Biotechnology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COCEBI'">Current Opinion in Cell Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COCHBI'">Current Opinion in Chemical Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COCIS'">Current Opinion in Colloid &amp; Interface Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COCOMP'">Computers and Composition</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COEX'">Composites Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COGDEV'">Cognitive Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COGE'">Computers and Geotechnics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COGEDE'">Current Opinion in Genetics &amp; Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COGEL'">International Journal of Coal Geology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COGEPH'">Comparative and General Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COGNIT'">Cognition</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COGSCI'">Cognitive Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COGSYS'">Cognitive Systems Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COIMMU'">Current Opinion in Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COLEGN'">Collegian</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COLSUA'">Colloids and Surfaces A: Physicochemical and Engineering Aspects</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COLSUB'">Colloids and Surfaces B: Biointerfaces</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COLTEC'">Cold Regions Science and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMAFF'">Communist Affairs</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMAID'">Computer Aided Geometric Design</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMBUS'">Composites Business Analyst</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMCHE'">Combinatorial Chemistry - an Online journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMCOM'">Computer Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMGEO'">Computational Geometry: Theory and Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMICR'">Current Opinion in Microbiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMIND'">Computers in Industry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMLAN'">Computer Languages, Systems &amp; Structures</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMM'">Computer Methods and Programs in Biomedicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMMAN'">Composites Manufacturing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMMAT'">Computational Materials Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMNET'">Computer Networks and ISDN Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMNWS'">Computer Networks (1976)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMPAG'">Computers and Electronics in Agriculture</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMPHY'">Computer Physics Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMPNW'">Computer Networks</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMPOS'">Composites</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMRAD'">Computerized Radiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMREN'">Comptes Rendus Physique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMSTA'">Computational Statistics and Data Analysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMSYS'">Computer Integrated Manufacturing Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COMTOM'">Computerized Tomography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CON'">Contraception</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CONCLI'">Contemporary Clinical Trials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CONEUR'">Current Opinion in Neurobiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CONHYD'">Journal of Contaminant Hydrology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CONPRA'">Control Engineering Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CONREC'">Conservation &amp; Recycling</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COPHAR'">Current Opinion in Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COPLBI'">Current Opinion in Plant Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COREL'">Journal of Controlled Release</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CORENS'">Corporate Environmental Strategy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CORFIN'">Journal of Corporate Finance</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CORTEX'">Cortex</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COSE'">Computers &amp; Security</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COSREV'">Computer Science Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COSSMS'">Current Opinion in Solid State &amp; Materials Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COST'">Composite Structures</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COSTBI'">Current Opinion in Structural Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COSUST'">Current Opinion in Environmental Sustainability</xsl:when>
             <xsl:when test="$codeTitleElsevier1='COURSO'">Computers &amp; Urban Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CPART'">China Particuology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CPBM'">Computer Programs in Biomedicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CPETRO'">Petroleum Exploration and Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CPL'">Chemistry and Physics of Lipids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CPLETT'">Chemical Physics Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CPPED'">Current Problems in Pediatrics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CPR'">Clinical Psychology Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CPRE'">China Population, Resources and Environment</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CPREP'">Computer Physics Reports</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CPTL'">Currents in Pharmacy Teaching and Learning</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CRAS2A'">Comptes Rendus Geoscience</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CRAS2B'">Comptes Rendus Mecanique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CRAS2C'">Comptes Rendus Chimie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CRASS1'">Comptes Rendus Mathematique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CRASS3'">Comptes Rendus Biologies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CRCS'">Carnegie-Rochester Conference Series on Public Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CROHNS'">Journal of Crohn’s and Colitis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CROSUP'">Journal of Crohn’s and Colitis Supplements</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CRYENG'">Crystal Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CRYS'">Journal of Crystal Growth</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CS'">Corrosion Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CSE'">Computing Systems in Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CSI'">Computer Standards &amp; Interfaces</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CSM'">Clinics in Sports Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CSR'">Continental Shelf Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CSTAN'">Computers and Standards</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CSTE'">Composites Science and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CTCP'">Complementary Therapies in Clinical Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CTPS'">Computational and Theoretical Polymer Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CTR'">Cell Transplantation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CTT'">Card Technology Today</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CULHER'">Journal of Cultural Heritage</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CURBIO'">Current Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CURSUR'">Current Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CUTHRE'">Current Therapeutic Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CVDPC'">CVD Prevention and Control</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CVP'">Cardiovascular Pathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CWST'">World Science and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='CYSR'">Children and Youth Services Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DAD'">Drug and Alcohol Dependence</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DAE'">Domestic Animal Endocrinology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DAM'">Discrete Applied Mathematics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DAPRO'">Data Processing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DATAK'">Data &amp; Knowledge Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DCI'">Developmental and Comparative Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DDMEC'">Drug Discovery Today:Disease Mechanisms</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DDMOD'">Drug Discovery Today:Disease Models</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DDSTR'">Drug Discovery Today:Therapeutic Strategies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DDTEC'">Drug Discovery Today:Technologies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DECSUP'">Decision Support Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DENDRO'">Dendrochronologia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DENTAL'">Dental Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DERVEN'">Journal of the European Academy of Dermatology and Venereology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DES'">Desalination</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DESC'">Journal of Dermatological Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DESCS'">Journal of Dermatological Science Supplement</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DET'">Dermatologic Clinics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DEUTSC'">Deutsche Zeitschrift für Akupunktur</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DEVCEL'">Developmental Cell</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DEVEC'">Journal of Development Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DIAB'">Diabetes Research and Clinical Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DIABET'">Diabetes &amp; Metabolism</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DIAMAT'">Diamond &amp; Related Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DIAVIR'">Clinical and Diagnostic Virology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DIFF'">Differentiation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DIFGEO'">Differential Geometry and its Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DIIN'">Digital Investigation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DIRMAR'">Journal of Direct Marketing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DISC'">Discrete Mathematics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DISOPT'">Discrete Optimization</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DISPLA'">Displays</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DLDSUP'">Digestive and Liver Disease Supplements</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DMB'">Diagnostic Microbiology &amp; Infectious Disease</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DN'">International Journal of Developmental Neuroscience</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DNAREP'">DNA Repair</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DRUDIS'">Drug Discovery Today</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DRUPOL'">International Journal of Drug Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DSRA'">Deep Sea Research Part A, Oceanographic Research Papers</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DSRB'">Deep-Sea Research Part B, Oceanographic Literature Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DSRES'">Deep-Sea Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DSRI'">Deep-Sea Research Part I</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DSRII'">Deep-Sea Research Part II</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DSROA'">Deep-Sea Research and Oceanographic Abstracts</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DSROLD'">Deep Sea Research (1953)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DSX'">Diabetes &amp; Metabolic Syndrome: Clinical Research and Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DYNAT'">Dynamics of Atmospheres and Oceans</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DYNCON'">Journal of Economic Dynamics and Control</xsl:when>
             <xsl:when test="$codeTitleElsevier1='DYPI'">Dyes and Pigments</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EA'">Electrochimica Acta</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EAAI'">Engineering Applications of Artificial Intelligence</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EABE'">Engineering Analysis with Boundary Elements</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EARCHI'">Early Childhood Research Quarterly</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EARTH'">Earth-Science Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EATBEH'">Eating Behaviors</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EBHPH'">Evidence-based Healthcare and Public Health</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECE'">Education for Chemical Engineers</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECHU'">Journal of Chiropractic Humanities</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECL'">Endocrinology and Metabolism Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECM'">Energy Conversion and Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECMARS'">Estuarine and Coastal Marine Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECMODE'">Economic Modelling</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECOCOM'">Ecological Complexity</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECOEDU'">Economics of Education Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECOENG'">Ecological Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECOFIN'">North American Journal of Economics and Finance</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECOIND'">Ecological Indicators</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECOINF'">Ecological Informatics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECOLEC'">Ecological Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECOLET'">Economics Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECOMOD'">Ecological Modelling</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECONOM'">Journal of Econometrics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECOSYS'">Economic Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECPE'">Engineering Costs and Production Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ECSN'">Clinical Simulation in Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EDEV'">International Journal of Educational Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EDUCOM'">Education and Computing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EDUREV'">Educational Research Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EEB'">Environmental and Experimental Botany</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EEG'">Electroencephalography and Clinical Neurophysiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EEM'">Electroencephalography and Clinical Neurophysiology/ Electromyography and Motor Control</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EEP'">Electroencephalography and Clinical Neurophysiology/ Evoked Potentials Section</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EER'">European Economic Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EEUS'">EAU-EBU Update Series</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EFA'">Engineering Failure Analysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EFM'">Engineering Fracture Mechanics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EGY'">Energy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EGYPRO'">Energy Procedia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EHB'">Economics &amp; Human Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EHD'">Early Human Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EHRM'">Health Outcomes Research in Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EI'">Environment International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EIMC'">Enfermedades Infecciosas y Microbiologia Cl&#237;nica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EIR'">Environmental Impact Assessment Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EIVR'">Euro III-Vs Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJC'">European Journal of Cancer</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJCB'">European Journal of Cell Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJCCO'">European Journal of Cancer and Clinical Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJCOLD'">European Journal of Cancer (1965)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJCON'">European Journal of Control</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJCSUP'">European Journal of Cancer Supplements</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJINME'">European Journal of Internal Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJMECH'">European Journal of Medicinal Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJMFLU'">European Journal of Mechanics / B Fluids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJMG'">European Journal of Medical Genetics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJMP'">Physica Medica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJMSOL'">European Journal of Mechanics / A Solids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJOP'">European Journal of Protistology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJP'">European Journal of Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJPB'">European Journal of Pharmaceutics and Biopharmaceutics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJPMOL'">European Journal of Pharmacology: Molecular Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJPTOX'">European Journal of Pharmacology: Environmental Toxicology and Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJRADI'">European Journal of Radiography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJREX'">European Journal of Radiology Extra</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJSOBI'">European Journal of Soil Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EJUS'">European Journal of Ultrasound</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ELECOM'">Electrochemistry Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ELECST'">Electrodeposition and Surface Treatments</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ELECTR'">The Electricity Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ELERAP'">Electronic Commerce Research and Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ELSPEC'">Journal of Electron Spectroscopy and Related Phenomena</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ELSTAT'">Journal of Electrostatics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMC'">Emergency Medicine Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCAA'">EMC - Cardiologie-Angéiologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCAAR'">EMC - Anestesia-Reanimación</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCAOL'">EMC - Aparato Locomotor</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCAR'">EMC - Anesthésie-Réanimation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCCG'">EMC - Cirugia general</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCCHI'">EMC - Chirurgie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCCOC'">EMC - Cirugia otorrinolaringológica y cervicofacial</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCCP'">EMC - Cirugia plastica reparadora y estetica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCDC'">EMC - Dermatologie-Cosmétologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCDEN'">EMC - Dentisterie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCEND'">EMC - Endocrinologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCGIN'">EMC - Ginecologia-Obstetricia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCGO'">EMC - Gynécologie-Obstétrique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCH'">EMC - Hématologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCHEP'">EMC - Hépatologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCHG'">EMC - Hépato-Gastroenterologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCKMF'">EMC - Kinesiterapia - Medicina fisica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCKNS'">EMC - Kinésithérapie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCMED'">EMC - Médecine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCMI'">EMC - Maladies Infectieuses</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCN'">EMC - Neurologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCNEP'">EMC - Néphrologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCODO'">EMC - Odontologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCOP'">EMC - Ophtalmologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCORL'">EMC - Oto-rhino-laryngologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCORR'">EMC - Otorrinolaringologia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCPED'">EMC - Pédiatrie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCPIA'">EMC - Pediatria</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCPN'">EMC - Pneumologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCPOL'">EMC - Podologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCPS'">EMC - Psychiatrie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCRAD'">EMC - Radiologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCRHO'">EMC - Rhumatologie-Orthopédie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCSTO'">EMC - Stomatologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCTM'">Tratado de Medicina</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCTP'">EMC - Toxicologie-Pathologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCTQ'">EMC - Tecnicas quirurgicas - Aparato digestivo</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMCVET'">EMC - Vétérinaire</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMEMAR'">Emerging Markets Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMJ'">European Management Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMOSPA'">Emotion, Space and Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMPFIN'">Journal of Empirical Finance</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMREV'">Electron Microscopy Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EMT'">Enzyme and Microbial Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENAGR'">Energy in Agriculture</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENB'">Energy &amp; Buildings</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENCONV'">Energy Conversion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENDE'">Endeavour</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENDM'">Electronic Notes in Discrete Mathematics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENDONU'">Endocrinologia y Nutricion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENEECO'">Energy Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENEFIN'">Journal of Energy Finance and Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENFCLI'">Enfermeria Clinica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENFI'">Enfermeria Intensiva</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENGAN'">Engineering Analysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENGEO'">Engineering Geology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENGMI'">Engineering Management International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENGTEC'">Journal of Engineering and Technology Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENPEC'">Engineering and Process Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENPO'">Environmental Pollution</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENS'">Evolution and Human Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENSO'">Environmental Modelling and Software</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENSOLD'">Ethology and Sociobiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENTCOM'">Entertainment Computing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENTCS'">Electronic Notes in Theoretical Computer Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENVIPO'">Environmental Pollution (1970)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENVIST'">Environmentalist</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENVPOL'">Environmental Policy and Law</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENVSCI'">Environmental Science and Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ENVTOX'">Environmental Toxicology and Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EOR'">European Journal of Operational Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EPAEB'">Environmental Pollution. Series A, Ecological and Biological</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EPBCP'">Environmental Pollution. Series B, Chemical and Physical</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EPIDEM'">Epidemics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EPIRES'">Epilepsy Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EPJ'">European Polymer Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EPP'">Evaluation and Program Planning</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EPSL'">Earth and Planetary Science Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EPSR'">Electric Power Systems Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ERAP'">Revue Européenne de Psychologie Appliquée</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ERGON'">International Journal of Industrial Ergonomics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ESAS'">SAS Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ESD'">Energy for Sustainable Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ESF'">Earth Science Frontiers</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ESP'">English for Specific Purposes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ESPJ'">The ESP Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ESWA'">Expert Systems With Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ETF'">Experimental Thermal and Fluid Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ETHENV'">Ethics and the Environment</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ETP'">Experimental and Toxicologic Pathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ETPGER'">Experimentelle Pathologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ETPOLD'">Experimental pathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EUJIM'">European Journal of Integrative Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EUMINE'">Euromicro Newsletter</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EURAGR'">European Journal of Agronomy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EURAS'">Journal of Eurasian Studies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EURGER'">European Geriatric Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EURJVS'">European Journal of Vascular Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EURO'">European Journal of Obstetrics and Gynecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EUROLD'">European Journal of Obstetrics &amp; Gynecology and Reproductive Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EURPSY'">European Psychiatry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EURR'">European Journal of Radiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EURSUP'">European Urology Supplements</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EURURO'">European Urology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EUUS'">EAU Update Series</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EVEDIP'">Evaluation in Education. International Progess</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EVEDU'">Evaluation in Education</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EVOPSY'">Levolution psychiatrique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EVPR'">Evaluation Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EXERGY'">Exergy : an international journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EXG'">Experimental Gerontology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EXMATH'">Expositiones Mathematicae</xsl:when>
             <xsl:when test="$codeTitleElsevier1='EXPHEM'">Experimental Hematology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FARMAC'">Il Farmaco</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FAS'">Foot and Ankle Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FBP'">Food and Bioproducts Processing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FBR'">Fungal Biology Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FCL'">Foot and Ankle Clinics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FCT'">Food and Chemical Toxicology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FCTOX'">Food and Cosmetics Toxicology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FEBS'">FEBS Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FEMSEC'">FEMS Microbiology Ecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FEMSIM'">FEMS Immunology and Medical Microbiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FEMSLE'">FEMS Microbiology Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FEMSRE'">FEMS Microbiology Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FEMSYR'">FEMS Yeast Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FERBIO'">Journal of Fermentation and Bioengineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FI'">Journal of the Franklin Institute</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FIBPRO'">Fibrinolysis &amp; Proteolysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FIBST'">Fibre Science and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FIELD'">Field Crops Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FIINAN'">Filtration Industry Analyst</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FINANA'">International Review of Financial Analysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FINEC'">Journal of Financial Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FINEL'">Finite Elements in Analysis &amp; Design</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FINMAR'">Journal of Financial Markets</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FINSER'">Financial Services Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FISE'">Filtration and Separation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FISH'">Fisheries Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FISJ'">Fire Safety Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FITOTE'">Fitoterapia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FJHS'">Fooyin Journal of Health Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FLDMYC'">Field Mycology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FLORA'">Flora</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FLUDYN'">Fluid Dynamics Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FLUID'">Fluid Phase Equilibria</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FLUOR'">Journal of Fluorine Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FMC'">FMC Formacion Medica Continuada en Atencion Primaria</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FNS'">Fertility and Sterility</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FOCAT'">Focus on Catalysts</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FOCH'">Food Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FOLDES'">Folding and Design</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FOOAGR'">International Food and Agribusiness Management Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FOOD'">International Journal of Food Microbiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FOOHYD'">Food Hydrocolloids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FOP'">Focus on Pigments</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FOPC'">Focus on Polyvinyl Chloride</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FOPOW'">Focus on Powder Coatings</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FORECO'">Forest Ecology and Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FORPOL'">Forest Policy and Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FORSCI'">Forensic Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FOS'">Focus on Surfactants</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FPUROL'">Progrès en Urologie - FMC</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FQAP'">Food Quality and Preference</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FRB'">Free Radical Biology and Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FRIN'">Food Research International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FRL'">Finance Research Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FSI'">Forensic Science International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FSIGEN'">Forensic Science International: Genetics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FSIGSS'">Technological Forecasting &amp; Social Change</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FSISUP'">Trends in Food Science &amp; Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FSS'">Fuzzy Sets and Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FT'">Fisioterapia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FUECEL'">Fuel Cells Bulletin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FUNBIO'">Fungal Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FUNECO'">Fungal Ecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FUPROC'">Fuel Processing Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FUSION'">Fusion Engineering and Design</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FUSPRU'">Fuss &amp; Sprunggelenk</xsl:when>
             <xsl:when test="$codeTitleElsevier1='FUTURE'">Future Generation Computer Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GACETA'">Gaceta Sanitaria</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GAIPOS'">Gait &amp; Posture</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GASSEP'">Gas Separation and Purification</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GASSUR'">Journal of Gastrointestinal Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GASTRO'">Gastroenterologia y Hepatologia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GAT'">Genetic Analysis: Biomolecular Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GCA'">Geochimica et Cosmochimica Acta</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GEANTE'">Gene Analysis Techniques</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GEGE'">Geotextiles and Geomembranes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GENE'">Gene</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GENM'">Gender Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GEOACT'">Geodinamica Acta</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GEOBIO'">Geobios</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GEOD'">Journal of Geodynamics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GEODER'">Geoderma</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GEOEX'">Geoexploration</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GEOF'">Geoforum</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GEOMOR'">Geomorphology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GEOPHY'">Journal of Geometry and Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GEOT'">Geothermics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GEXPLO'">Journal of Geochemical Exploration</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GHP'">General Hospital Psychiatry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GINE'">Clinica e Investigacion en Ginecologia y Obstetricia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GLENVB'">Global Environmental Change B: Environmental Hazards</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GLOBAL'">Global and Planetary Change</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GLOFIN'">Global Finance Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GMB'">Gaceta Medica de Bilbao</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GNR'">Geography and Natural Resources</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GOPURA'">Government Publications Review. Part A</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GOPURB'">Government Publications Review. Part B</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GOPURE'">Government Publications Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GOVINF'">Government Information Quarterly</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GOVPR'">Government Publications Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GPB'">Genomics, Proteomics &amp; Bioinformatics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GPH'">General Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GR'">Gondwana Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GTC'">Gastroenterology Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='GYOBFE'">Gynecologie Obstetrique &amp; Fertilite</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HAB'">Habitat International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HAND'">Hand</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HANTHE'">Journal of Hand Therapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HARALG'">Harmful Algae</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HAZMAT'">Journal of Hazardous Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HCMF'">Healthcare Management Forum</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HE'">International Journal of Hydrogen Energy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HEALUN'">Journal of Heart and Lung Transplantation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HEAP'">Health policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HEAPED'">Health Policy and Education</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HEARES'">Hearing Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HEDP'">High Energy Density Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HEI'">History of European Ideas</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HEP'">Higher Education Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HEPC'">Hepatology Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HEPOLD'">International Hepatology Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HFF'">International Journal of Heat and Fluid Flow</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HIGTEC'">Journal of High Technology Management Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HIM'">Human Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HIPERT'">Hipertension y riesgo vascular</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HISFAM'">The History of the Family</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HKJN'">Hong Kong Journal of Nephrology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HKJOT'">Hong Kong Journal of Occupational Therapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HKPJ'">Hong Kong Physiotherapy Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HLC'">Heart, Lung and Circulation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HM'">International Journal of Hospitality Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HMT'">International Journal of Heat and Mass Transfer</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HOC'">Hematology/Oncology Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HORTI'">Scientia Horticulturae</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HRS'">Heat Recovery Systems and CHP</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HRTHM'">Heart Rhythm</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HUMOV'">Human Movement Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HUMRES'">Human Resource Management Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HYDROD'">Journal of Hydrodynamics, Ser. B</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HYDROL'">Journal of Hydrology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='HYDROM'">Hydrometallurgy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IAC'">Immunology and Allergy Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IB'">Insect Biochemistry and Molecular Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IBR'">International Business Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ICA'">Inorganica Chimica Acta</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ICAREV'">Inorganica Chimica Acta Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ICHMT'">International Communications in Heat and Mass Transfer</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ICL'">International Contact Lens Clinic</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ICN'">Interventional Cardiology Newsletter</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ICS'">International congress series</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IDA'">Intelligent Data Analysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IDC'">Infectious Disease Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IE'">International Journal of Impact Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IENJ'">International Emergency Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IEPOL'">Information Economics and Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IFCOM'">Interfaces in Computing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IIIREV'">III-Vs Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJA'">International Journal of Approximate Reasoning</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJARA'">The International Journal Of Applied Radiation And Isotopes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJB'">International Journal of Medical Informatics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJBIO'">International Journal of Biochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJBOLD'">International Journal of Bio-Medical Computing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJCA'">International Journal of Cardiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJCCLC'">International Journal of Cement Composites and Lightweight Concrete</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJCIP'">International Journal of Critical Infrastructure Protection</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJES'">International Journal of Engineering Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJG'">International Journal of Gynecology and Obstetrics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJGE'">International Journal of Gerontology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJGGC'">International Journal of Greenhouse Gas Control</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJHEH'">International Journal of Hygiene and Environmental Health</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJHTC'">International Journal of High Technology Ceramics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJID'">International Journal of Infectious Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJIR'">International Journal of Intercultural Relations</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJLCJ'">International Journal of Law, Crime and Justice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJLEO'">Optik</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJLP'">International Journal of Law and Psychiatry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJMEA'">International Journal of Materials in Engineering Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJMF'">International Journal of Multiphase Flow</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJMM'">International Journal of Medical Microbiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJNMB'">International Journal of Nuclear Medicine and Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJNP'">International Journal of Neuropharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJOS'">International Journal of Oral Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJOSM'">International Journal of Osteopathic Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJOTN'">International Journal of Orthopaedic and Trauma Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJP'">International Journal of Pharmaceutics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJRAIA'">International Journal of Radiation Applications &amp; Instrumentation. Part A, Applied Radiation &amp; Isotopes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJRAIB'">International Journal of Radiation Applications &amp; Instrumentation. Part B, Nuclear Medicine and Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJRAIC'">International Journal of Radiation Applications &amp; Instrumentation. Part C, Radiation Physics &amp; Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJRAID'">International Journal of Radiation Applications &amp; Instrumentation. Part D, Nuclear Tracks &amp; Radiation Measurements</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJRM'">International Journal of Research in Marketing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJRPC'">International Journal for Radiation Physics and Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJSDEE'">International Journal of Soil Dynamics and Earthquake Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJSRC'">International Journal of Sediment Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJSU'">International Journal of Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJTMDR'">International Journal of Machine Tool Design and Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IJTOUM'">International Journal of Tourism Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ILIBR'">International Library Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IMAGE'">Signal Processing: Image Communication</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IMAVIS'">Image and Vision Computing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IMBIO'">Immunobiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IMCHEM'">Immunochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IME'">International Journal of Insect Morphology and Embryology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IMLET'">Immunology Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IMM'">Industrial Marketing Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IMMBIO'">Immuno-analyse et biologie specialisee</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IMMP'">International Journal of Immunopharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IMMTEC'">Immunotechnology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IMMUNI'">Immunity</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IMPHAR'">Immunopharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IMPLAN'">Implantodontie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IMTO'">Immunology Today</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INBI'">International Biodeterioration &amp; Biodegradation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INC'">Information Sciences - Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INCANU'">Intensive Care Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INCDIS'">Journal of Income Distribution</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INCL'">Inorganic and Nuclear Chemistry Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INDA'">International Dairy Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INDAER'">Journal of Wind Engineering &amp; Industrial Aerodynamics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INDAG'">Indagationes Mathematicae</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INDCRO'">Industrial Crops &amp; Products</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INDMET'">Industrial Metrology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INDOR'">International Journal of Industrial Organization</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INEC'">Journal of International Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INEXT'">Injury Extra</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INFBEH'">Infant Behavior and Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INFDN'">Infectious Diseases Newsletter</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INFFUS'">Information Fusion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INFMAN'">Information &amp; Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INFORG'">Information and Organization</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INFPHY'">Infrared Physics and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INFSEC'">Infosecurity</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INFSOF'">Information and Software Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INFSR'">Information Storage and Retrieval</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INFTOD'">Infosecurity Today</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INHE'">International Health</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INJR'">Indian Journal of Rheumatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INNFOO'">Innovative Food Science and Emerging Technologies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INOCHE'">Inorganic Chemistry Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INOMAT'">International Journal of Inorganic Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INS'">Information Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INSBIO'">Insect Biochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INSU'">Insulin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INSUMA'">Insurance Mathematics and Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INTBD'">International Biodeterioration</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INTCOM'">Interacting with Computers</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INTELL'">Intelligence</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INTFIN'">Journal of International Financial Markets, Institutions &amp; Money</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INTFOR'">International Journal of Forecasting</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INTHIG'">The Internet and Higher Education</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INTIMP'">International Immunopharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INTMAN'">Journal of International Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INTMAR'">Journal of Interactive Marketing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INTMED'">Integrative Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INTPLA'">International Journal of Plasticity</xsl:when>
             <xsl:when test="$codeTitleElsevier1='INTPSY'">International Journal of Psychophysiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IP'">Journal of Insect Physiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IPL'">Information Processing Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IPM'">Information Processing and Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IPVP'">International Journal of Pressure Vessels and Piping</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IRBM'">IRBM</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IRBMNW'">IRBM News</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IRL'">International Review of Law &amp; Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IRPHY'">Infrared Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='IS'">Information Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ISATRA'">ISA Transactions</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ISSEDU'">Issues in Education</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ISTR'">Information Security Technical Report</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ITOR'">International Transactions in Operational Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAAC'">Journal of the American Academy of Child &amp; Adolescent Psychiatry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAAD'">International Journal of Adhesion and Adhesives</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAAGL'">American Association of Gynecologic Laparoscopists</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAAP'">Journal of Analytical and Applied Pyrolysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JABRT'">Advances in Behaviour Research and Therapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAC'">Journal of the American College of Cardiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JACL'">Journal of Clinical Lipidology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JACR'">Journal of the American College of Radiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAD'">Journal of Affective Disorders</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAE'">Journal of Accounting and Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAEC'">Journal of Applied Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAER'">Advances in Enzyme Regulation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAES'">Journal of Asian Earth Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAG'">International Journal of Applied Earth Observations and Geoinformation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAGP'">American Journal of Geriatric Psychiatry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAH'">Journal of Adolescent Health</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAHC'">Journal of Adolescent Health Care</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAICRP'">Annals of the ICRP</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAL'">Journal of Applied Logic</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JALCOM'">Journal of Alloys and Compounds</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JALL'">Journal of Allergy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JALZ'">Alzheimers &amp; Dementia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAM'">Journal of the American Society for Mass Spectrometry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAMM'">Journal of Applied Mathematics and Mechanics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAMS'">Journal of Acupuncture and Meridian Studies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JANA'">Journal of the Association of Nurses in AIDS Care</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JANS'">Journal of the Autonomic Nervous System</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAPG'">Applied Geography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAPWOR'">Japan &amp; The World Economy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAR'">Journal of Atherosclerosis Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JARAP'">Annual Reviews in Control</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JAROLD'">Annual Review in Automatic Programming</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JASR'">Advances in Space Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JATM'">Journal of Air Transport Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JBA'">Biotechnology Advances</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JBB'">Biomass and Bioenergy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JBBM'">Journal of Biochemical and Biophysical Methods</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JBCLA'">Journal of the British Contact Lens Association</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JBEHEC'">The Journal of Behavioral Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JBENG'">Journal of Biomedical Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JBF'">Journal of Banking and Finance</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JBIOSC'">Journal of Bioscience and Bioengineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JBMT'">Biomaterials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JBR'">Journal of Business Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JBSTD'">Journal of Biological Standardization</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JBUR'">Burns</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JBV'">Journal of Business Venturing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCA'">Journal of Clinical Anesthesia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCAD'">Computer-Aided Design</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCAE'">Journal of Contemporary Accounting &amp; Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCANE'">Journal of Cardiothoracic Anesthesia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCANNU'">Journal of Cancer Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCBM'">Construction and Building Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCCASE'">Journal of Cardiology Cases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCD'">Journal of Communication Disorders</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCDIS'">Journal of Chronic Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCE'">Journal of Clinical Epidemiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCF'">Journal of Cystic Fibrosis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCHAS'">Journal of Chemical Health and Safety</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCHB'">HOMO- Journal of Comparative Human Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCICE'">Journal of the Chinese Institute of Chemical Engineers</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCIT'">Cities</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCJ'">Journal of Criminal Justice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCLB'">Clinical Biomechanics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCLM'">Journal of The Less-Common Metals</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCLP'">Journal of Cleaner Production</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCM'">Journal of Chiropractic Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCMA'">Journal of the Chinese Medical Association</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCOMA'">Composites Part A</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCOMB'">Composites Part B</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCOSCI'">Journal of Colloid Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCPS'">Journal of Consumer Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCRP'">Crop Protection</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCRR'">Journal of Cardiothoracic-Renal Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCRS'">Journal of Cataract &amp; Refractive Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCRY'">Cryogenics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCSR'">Journal of Constructional Steel Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCT'">Clinical Imaging</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCTOM'">Journal of Computed Tomography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCUG'">Journal of China University of Geosciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCUMT'">Journal of China University of Mining and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCUPT'">The Journal of China Universities of Posts and Telecommunications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCV'">Journal of Clinical Virology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCVS'">Cardiovascular Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCYT'">Cytotherapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JCZ'">Zoologischer Anzeiger</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JDA'">Journal of Discrete Algorithms</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JDC'">Journal of Diabetes and Its Complications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JDIABC'">Journal of Diabetic Complications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JDS'">Journal of Dental Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JDSR'">Japanese Dental Science Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JDST'">Design Studies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEA'">Journal of Electroanalytical Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEAC'">Journal of Electroanalytical Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEAP'">Journal of English for Academic Purposes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEAS'">Journal of Experimental Animal Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEB'">Journal of Economics and Business</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEBO'">Journal of Economic Behavior and Organization</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEC'">Journal of Electroanalytical Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JECM'">Journal of Experimental &amp; Clinical Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JECS'">Journal of the European Ceramic Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JELS'">Electoral Studies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEM'">Journal of Emergency Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEMBE'">Journal of Experimental Marine Biology and Ecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JENR'">Journal of Environmental Radioactivity</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEP'">Journal of Ethnopharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEPE'">International Journal of Electrical Power and Energy Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEPM'">Journal of Exotic Pet Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEPO'">Energy Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEPS'">European Journal of Purchasing and Supply Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JERG'">Applied Ergonomics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JES'">Journal of Environmental Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JESF'">Journal of Exercise Science &amp; Fitness</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JEST'">Engineering Structures</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFBS'">Journal of Family Business Strategy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFCO'">Food Control</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFCT'">Journal of Fuel Chemistry and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFD'">Journal of Fluency Disorders</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFE'">Journal of Forest Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFEA'">Fuel and Energy Abstracts</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFF'">Journal of Functional Foods</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFMA'">Journal of the Formosan Medical Association</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFMI'">Flow Measurement and Instrumentation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFOE'">Journal of Food Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFPO'">Food Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFRAD'">Journal of The Faculty of Radiologists</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFRBM'">Journal of Free Radicals in Biology &amp; Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFS'">Journal of Financial Stability</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFTEC'">Journal of Fermentation Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFTR'">Futures</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JFUE'">Fuel</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JGEC'">Global Environmental Change</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JGG'">Journal of Genetics and Genomics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JGI'">Journal of Government Information</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JGLR'">Journal of Great Lakes Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JHAP'">Health and Place</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JHE'">Journal of Health Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JHEPAT'">Journal of Hepatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JHER'">Journal of Hydro-environment Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JHRS'">Journal of Heat Recovery Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JIB'">Journal of Inorganic Biochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JIEC'">Journal of Industrial and Engineering Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JIJER'">International Journal of Educational Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JIJF'">International Journal of Fatigue</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JIJR'">International Journal of Refrigeration</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JIM'">Journal of Immunological Methods</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JIMF'">Journal of International Money and Finance</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JINC'">Journal of Inorganic and Nuclear Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JINJ'">Injury</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JIPH'">Journal of Infection and Public Health</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JISRI'">Journal of Iron and Steel Research, International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JJBE'">Medical Engineering and Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JJCC'">Journal of Cardiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JJEK'">Journal of Electromyography and Kinesiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JJIM'">International Journal of Information Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JJO'">Japanese Journal of Ophthalmology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JJOD'">Journal of Dentistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JJPC'">Journal of Process Control</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JJRC'">Journal of Retailing and Consumer Services</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JKSS'">Journal of the Korean Statistical Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JKSUCI'">Journal of King Saud University - Computer and Information Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JKSUS'">Journal of King Saud University - Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JLAP'">The Journal of Logic and Algebraic Programming</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JLI'">Learning and Instruction</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JLP'">The Journal of Logic Programming</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JLPP'">Journal of Loss Prevention in the Process Industries</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JLUP'">Land Use Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMACRO'">Journal of Macroeconomics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMAD'">Materials and Design</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMAM'">Molecular Aspects of Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMBBM'">Journal of the Mechanical Behavior of Biomedical Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMCP'">Mayo Clinic Proceedings</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMCPLA'">Journal of Medical Colleges of PLA</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMDA'">Journal of the American Medical Directors Association</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMDI'">The Journal of Molecular Diagnostics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMECH'">Journal of Mechanisms</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMG'">Journal of Molecular Graphics and Modelling</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMGOLD'">Journal of Molecular Graphics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMHG'">The Journal of Mens Health &amp; Gender</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMIC'">Micron</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMII'">Journal of Microbiology, Immunology and Infection</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMMA'">Museum Management and Curatorship</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMP'">Journal of Manufacturing Processes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMPG'">Marine and Petroleum Geology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMPO'">Marine Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMRES'">Journal of Magnetic Resonance (1969)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMSIP'">International Journal of Mass Spectrometry and Ion Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMSUR'">Journal of Maxillofacial Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMSY'">Journal of Manufacturing Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMU'">Journal of Medical Ultrasound</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMWH'">Journal of Midwifery and Womens Health</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JMWT'">Journal of Mechanical Working Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNB'">The Journal of Nutritional Biochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNC'">Journal for Nature Conservation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNDT'">NDT and E International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNEB'">Journal of Nutrition Education and Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNED'">Journal of Nutrition Education</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNGC'">Journal of Natural Gas Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNGSE'">Journal of Natural Gas Science and Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNI'">Journal of Neuroimmunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNM'">Journal of Nurse-Midwifery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNMU'">Journal of Nanjing Medical University</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNN'">Journal of Neonatal Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNNFM'">Journal of Non-Newtonian Fluid Mechanics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNS'">Journal of the Neurological Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNUCEN'">Journal of Nuclear Energy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNUEN'">Journal of Nuclear Energy (1954)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNUENA'">Journal of Nuclear Energy. Part A. Reactor Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JNUENB'">Journal of nuclear energy. Part B, Reactor technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOAES'">Journal of African Earth Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOCCA'">Journal of Occupational Accidents</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOCD'">Journal of Clinical Densitometry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOCS'">Journal of Computational Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JODS'">Journal of Dairy Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOE'">Journal of Epilepsy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOEN'">Journal of Endodontics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOEP'">Journal of Economic Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOFSO'">Journal of the Forensic Science Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOI'">Journal of Informetrics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOLT'">Optics and Laser Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOM'">Journal of Organometallic Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOMH'">Journal of Men’s Health</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOPO'">Ophthalmic and Physiological Optics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JOSM'">Journal of osteopathic medicine : JOM </xsl:when>
             <xsl:when test="$codeTitleElsevier1='JP'">Journal of Photochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPAA'">Journal of Pure and Applied Algebra</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPAS'">Progress in Aerospace Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPB'">Journal of Photochemistry &amp; Photobiology, B: Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPBM'">Progress in Biophysics and Molecular Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPC'">Journal of Photochemistry &amp; Photobiology, A: Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPCGC'">Progress in Crystal Growth and Characterization of Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPCGCM'">Progress in Crystal Growth and Characterization of Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPCOLD'">Physics and Chemistry of the Earth</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPECS'">Progress in Energy and Combustion Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPGQ'">Political Geography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPLPH'">Journal of Plant Physiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPLR'">Progress in Lipid Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPM'">Journal of Pharmacological and Toxicological Methods</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPMA'">International Journal of Project Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPMET'">Journal of Pharmacological Methods</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPMS'">Progress in Materials Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPN'">Advances in Neuroimmunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPNE'">Progress in Nuclear Energy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPNMRS'">Progress in Nuclear Magnetic Resonance Spectroscopy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPO'">Journal of Policy Modeling</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPOL'">Polymer</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPOR'">Journal of Prosthodontic Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPP'">Journal of Accounting and Public Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPPNP'">Progress in Particle and Nuclear Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPPS'">Progress in Polymer Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPQE'">Progress in Quantum Electronics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPR'">Journal of Photochemistry &amp; Photobiology, C: Photochemistry Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPROT'">Journal of Proteomics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPRR'">Progress in Retinal and Eye Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPS'">Journal of Pain and Symptom Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPSSC'">Progress in Solid State Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPT'">Pharmacology and Therapeutics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JPUROL'">Journal of Pediatric Urology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JQI'">Quaternary International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JQSR'">Quaternary Science Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JQSRT'">Journal of Quantitative Spectroscopy and Radiative Transfer</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JRC'">Journal of Reproduction and Contraception</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JRE'">Journal of Rare Earths</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JRGFR'">Progress in Growth Factor Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JRI'">Journal of Reproductive Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JRPO'">Resources Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSAMS'">Journal of Science and Medicine in Sport</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSAREV'">JSAE Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSCH'">EXPLORE</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSCOBS'">Journal of social and biological structures</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSCS'">Journal of Saudi Chemical Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSEE'">Studies in Educational Evaluation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSHA'">Journal of the Saudi Heart Association</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSMS'">Supramolecular Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSOCBS'">Journal of Social and Biological Structures</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSP'">Journal of School Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSPA'">Space Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSPI'">Journal of Statistical Planning and Inference</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSR'">Journal of Safety Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSS'">The Journal of Systems &amp; Software</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSSC'">Communist and Post-Communist Studies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSTEB'">Journal of Steroid Biochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSUPRA'">Journal of supramolecular chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JSURG'">Journal of Surgical Education</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JTCM'">Journal of Traditional Chinese Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JTEMB'">Journal of Trace Elements in Medicine and Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JTICE'">Journal of the Taiwan Institute of Chemical Engineers</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JTMA'">Tourism Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JTPO'">Telecommunications Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JTRG'">Journal of Transport Geography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JTRI'">Tribology International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JTRP'">Transport Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JTSEIT'">Journal of Transportation Systems Engineering and Information Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JTV'">Journal of Tissue Viability</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JUIP'">Utilities Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JULTR'">Journal of Ultrastructure Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JURMSR'">Journal of Ultrastructure Research and Molecular Structure Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JURO'">The Journal of Urology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JUS'">Journal of Ultrasound</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JUSTB'">Journal of University of Science and Technology Beijing, Mineral, Metallurgy, Material</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JVA'">Vistas in Astronomy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JVAC'">Vaccine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JVAD'">Journal of Vascular Access Devices</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JVAL'">Value in Health</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JVC'">Journal of Veterinary Cardiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JVEB'">Journal of Veterinary Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JVIR'">Journal of Vascular and Interventional Radiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JVS'">Journal of Visceral Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JWM'">Journal of Wilderness Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='JWST'">Water Science and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='KHINF'">Krankenhaus-Hygiene + Infektionsverhütung</xsl:when>
             <xsl:when test="$codeTitleElsevier1='KIM'">Komplementäre und Integrative Medizin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='KINE'">Kinésithérapie, la Revue</xsl:when>
             <xsl:when test="$codeTitleElsevier1='KJMS'">The Kaohsiung Journal of Medical Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='KNOSYS'">Knowledge-Based Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LAA'">Linear Algebra and Its Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LABECO'">Labour Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LABINF'">Laboratory Automation and Information Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LAC'">Language and Communication</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LANCET'">The Lancet</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LAND'">Landscape and Urban Planning</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LANEUR'">The Lancet Neurology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LANINF'">The Lancet Infectious Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LANONC'">Lancet Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LANPLA'">Landscape Planning</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LAPT'">Library Acquisitions: Practice and Theory</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LEAIND'">Learning and Individual Differences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LEAQUA'">The Leadership Quarterly</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LEGMED'">Legal Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LEHEMT'">Letters in Heat and Mass Transfer</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LFS'">Life Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LIBCOL'">Library Collections, Acquisitions and Technical Services</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LIBINF'">Library and Information Science Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LIGMET'">Journal of light metals</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LIMNO'">Limnologica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LINEDU'">Linguistics and Education</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LINGUA'">Lingua</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LIPMED'">Journal of Lipid Mediators and Cell Signalling</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LITHOS'">Lithos</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LIVEST'">Livestock Production Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LIVSCI'">Livestock Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LOCS'">Location Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LR'">Leukemia Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LRP'">Long Range Planning</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LSC'">Language Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LUMIN'">Journal of Luminescence</xsl:when>
             <xsl:when test="$codeTitleElsevier1='LUNG'">Lung Cancer</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MAC'">Materials Chemistry and Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MAD'">Mechanisms of Ageing and Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MAGMA'">Journal of Magnetism and Magnetic Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MAGMBI'">Magnetic Resonance Materials in Physics, Biology &amp; Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MAMBIO'">Mammalian Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MAMT'">Mechanism and Machine Theory</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MANAGE'">Journal of Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MARCHE'">Marine Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MARGEN'">Marine Genomics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MARGO'">Marine Geology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MARMIC'">Marine Micropaleontology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MARMOD'">Marine Models</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MARSYS'">Journal of Marine Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MASPEC'">International Journal of Mass Spectrometry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MAST'">Marine Structures</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MAT'">Maturitas</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MATBEH'">Journal of Mathematical Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MATBIO'">Matrix Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MATCHE'">Materials Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MATCOM'">Mathematics and Computers in Simulation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MATECO'">Journal of Mathematical Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MATPUR'">Journal de mathematiques pures et appliquees</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MATSCI'">Materials Science in Semiconductor Processing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MATSOC'">Mathematical Social Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MATSR'">Materials Science Reports</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MATTOD'">Materials Today</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MBDRR'">Metabolic Bone Disease and Related Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MBS'">Mathematical Biosciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MCE'">Molecular and Cellular Endocrinology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MCM'">Mathematical and Computer Modelling</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MDC'">Medical Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MDO'">Medical Dosimetry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MEASUR'">Measurement</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MECH'">Mechatronics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MECIND'">Mecanique &amp; Industrie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MECMAT'">Mechanics of Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MED'">Medicine - Programa de Formación Medica Continuada acreditado</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MEDCLI'">Medicina Clinica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MEDDRO'">Medecine &amp; Droit</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MEDIEV'">Journal of Medieval History</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MEDIMA'">Medical Image Analysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MEDIN'">Medicina intensiva</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MEDMAL'">Medecine et Maladies Infectieuses</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MEDNUC'">Médecine Nucléaire</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MEE'">Microelectronic Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MEEGID'">Infection, Genetics and Evolution</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MEJ'">Microelectronics Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MEMB'">Membrane Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MEMSCI'">Journal of Membrane Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MENCOM'">Mendeleev Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MERE'">Marine Environmental Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MESC'">Meat Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MET'">Metal Finishing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='META'">Intermetallics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='METALG'">Metallography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='METMAT'">Metamaterials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MHPA'">Mental Health and Physical Activity</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MIB'">Molecular Imaging &amp; Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MICINF'">Microbes and Infection</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MICMAT'">Microporous and Mesoporous Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MICPRO'">Microprocessors and Microsystems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MICRES'">Microbiological Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MICROC'">Microchemical Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MICROM'">Microporous Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MICRON'">Micron (1969)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MICS'">Microprocessors</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MIMA'">Micron And Microscopica Acta</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MIMET'">Journal of Microbiological Methods</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MIMI'">Microprocessing and Microprogramming</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MIMM'">Molecular Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MINE'">Minerals Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MINPRO'">International Journal of Mineral Processing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MINST'">Mining Science and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MITOCH'">Mitochondrion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MJAFI'">Medical Journal Armed Forces India</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MLA'">Medical laser application</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MLAOLD'">Laser-Medizin : eine interdisziplinare Zeitschrift ; Praxis, Klinik, Forschung</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MLBLUE'">Materials Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MOD'">Mechanisms of Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MODGEP'">Gene Expression Patterns</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MOLBIO'">Molecular &amp; Biochemical Parasitology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MOLCAA'">Journal of Molecular Catalysis A: Chemical</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MOLCAB'">Journal of Molecular Catalysis B: Enzymatic</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MOLCEL'">Molecular Cell</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MOLLIQ'">Journal of Molecular Liquids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MOLONC'">Molecular Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MOLSTR'">Journal of Molecular Structure</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MOLTOD'">Molecular Medicine Today</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MONEC'">Journal of Monetary Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MONRHU'">Revue du Rhumatisme Monographies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MPAIC'">Anaesthesia &amp; Intensive Care Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MPB'">Marine Pollution Bulletin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MPDHP'">Diagnostic Histopathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MPFOU'">The Foundation Years</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MPMED'">Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MPORTH'">Orthopaedics and Trauma</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MPPSY'">Psychiatry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MPRP'">Metal Powder Report</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MPS'">Journal of the Mechanics and Physics of Solids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MPSUR'">Surgery (Oxford)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MR'">Microelectronics Reliability</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MRB'">Materials Research Bulletin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MRC'">Mechanics Research Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MRI'">Magnetic Resonance Imaging</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MS'">International Journal of Mechanical Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MSA'">Materials Science &amp; Engineering A</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MSB'">Materials Science &amp; Engineering B</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MSC'">Materials Science &amp; Engineering C</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MSENG'">Materials Science and Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MSR'">Materials Science &amp; Engineering R</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MSTC'">Mining Science and Technology (China)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MTL'">Materials Characterization</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MTM'">International Journal of Machine Tools and Manufacture</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MULFIN'">Journal of Multinational Financial Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MUP'">Medical Update for Psychiatrists</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MUSMAN'">Museum Management and Curatorship</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MUT'">Mutation Research - Fundamental and Molecular Mechanisms of Mutagenesis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MUTAGI'">Mutation Research DNAging</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MUTDNA'">Mutation Research-DNA Repair</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MUTDRR'">Mutation Research DNA Repair Reports</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MUTENV'">Mutation Research/Environmental Mutagenesis and Related Subjects</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MUTGEN'">Mutation Research - Genetic Toxicology and Environmental Mutagenesis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MUTGEX'">Mutation Research/Genetic Toxicology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MUTLET'">Mutation Research Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MUTNOM'">Mutation Research - Mutation Research Genomics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MUTREV'">Mutation Research-Reviews in Mutation Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MUTREX'">Mutation Research/Reviews in Genetic Toxicology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MYC'">Mycoscience</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MYCMED'">Journal de Mycologie Médicale</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MYCOBU'">Bulletin of the British Mycological Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MYCOL'">Mycologist</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MYCRES'">Mycological Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='MYRETR'">Transactions of the British Mycological Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NA'">Nonlinear Analysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NAHS'">Nonlinear Analysis: Hybrid Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NAMREF'">North American Review of Economics and Finance</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NANO'">Nanomedicine: Nanotechnology, Biology and Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NANTOD'">Nano Today</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NATSCI'">Nature Sciences Societe</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NBA'">Neurobiology of Aging</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NBR'">Neuroscience and Biobehavioral Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NBT'">New Biotechnology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NCI'">Neurochemistry International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NCL'">Neurologic Clinics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NCM'">New Carbon Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NCMW'">Nuclear and Chemical Waste Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NDTEST'">Non-Destructive Testing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NDTI'">NDT International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NEASPA'">New Astronomy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NED'">Nuclear Engineering and Design</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NEDF'">Nuclear Engineering and Design. Fusion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NEL'">Journal of Neurolinguistics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NEPHRO'">Néphrologie &amp; Thérapeutique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NESE'">Network Security</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NEUADO'">Neuropsychiatrie de l'enfance et de l'adolescence</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NEUCIR'">Neurocirugia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NEUCLI'">Neurophysiologie Clinique / Clinical Neurophysiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NEUCOM'">Neurocomputing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NEULAB'">Das Neurophysiologie-Labor</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NEUPSY'">European Neuropsychopharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NEURON'">Neuron</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NEUTOX'">NeuroToxicology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NEWAST'">New Astronomy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NIMA'">Nuclear Inst. and Methods in Physics Research, A</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NIMB'">Nuclear Inst. and Methods in Physics Research, B</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NIMPP'">Nuclear Instruments and Methods In Physics Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NIP'">New Ideas in Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NJAS'">NJAS - Wageningen Journal of Life Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NJM'">Netherlands Journal of Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NJSR'">Netherlands Journal of Sea Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NLM'">International Journal of Non-Linear Mechanics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NM'">Nanostructured Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NMB'">Nuclear Medicine and Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NMD'">Neuromuscular Disorders</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NN'">Neural Networks</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NOC'">Journal of Non-Crystalline Solids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NOFERR'">Transactions of Nonferrous Metals Society of China</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NONRWA'">Nonlinear Analysis: Real World Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NP'">Neuropharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NPS'">Neuropsychopharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NRR'">Neural Regeneration Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NS'">International Journal of Nursing Studies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NSC'">Neuroscience</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NSL'">Neuroscience Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NSM'">Journal of Neuroscience Methods</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NSR'">Neuroscience Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NSRSUP'">Neuroscience Research Supplements</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NST'">Nuclear Science and Techniques</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NSY'">Neuropsychologia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NTARM'">Nuclear Tracks and Radiation Measurements (1982)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NTD'">Nuclear Track Detection</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NTR'">Nutrition Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NTRMIT'">Nuclear Tracks And Radiation Measurements (1993)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NTT'">Neurotoxicology and Teratology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NUCINS'">Nuclear Instruments</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NUCTRA'">Nuclear Tracks</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NUIM'">Nuclear Instruments and Methods</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NUMA'">Journal of Nuclear Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NUMECD'">Nutrition, Metabolism and Cardiovascular Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NUPHA'">Nuclear Physics, Section A</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NUPHB'">Nuclear Physics, Section B</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NUPHBP'">Nuclear Physics B (Proceedings Supplements)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NUPHYS'">Nuclear Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NURT'">Neurotherapeutics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NUSTEN'">Nuclear Structural Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NUT'">Nutrition</xsl:when>
             <xsl:when test="$codeTitleElsevier1='NUTCLI'">Nutrition clinique et metabolisme</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OBHP'">Organizational Behavior and Human Performance</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OCEACT'">Oceanologica Acta</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OCEMAN'">Ocean Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OCEMOD'">Ocean Modelling</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OCESM'">Ocean and Shoreline Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OCL'">Orthopedic Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OCMA'">Ocean and Coastal Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OCPOL'">Oil and Chemical Pollution</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ODE'">Organisms Diversity and Evolution</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ODW'">Orthodontic Waves</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OE'">Ocean Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OG'">Organic Geochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OGC'">Obstetrics and Gynecology Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OGRM'">Obstetrics, Gynaecology &amp; Reproductive Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OLEN'">Optics and Lasers in Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OME'">Omega</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ONCH'">Critical Reviews in Oncology / Hematology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ONG'">Obstetrics &amp; Gynecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OO'">Oral Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OOE'">Oral Oncology Extra</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OOS'">Oral Oncology Supplement</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OPEMAN'">Journal of Operations Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OPERES'">Operations Research Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OPETP'">Oil and Petrochemical Pollution</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OPHTHA'">Ophthalmology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OPPATH'">Opportunistic Pathogens</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OPTICS'">Optics Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OPTM'">Optometry - Journal of the American Optometric Association</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OPTMAT'">Optical Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OPTTEC'">Optics Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ORAONC'">European Journal of Cancer. Part B: Oral Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ORBIS'">Orbis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ORCP'">Obesity Research &amp; Clinical Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OREGEO'">Ore Geology Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ORGDYN'">Organizational Dynamics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ORGELE'">Organic Electronics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ORTHTR'">Sports Orthopaedics and Traumatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ORTRES'">Journal of Orthopaedic Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OSN'">Optical Switching and Networking</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OSOMOP'">Oral Surgery, Oral Medicine, Oral Pathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OSTMED'">Osteopathische Medizin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OTC'">Otolaryngologic Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OTCTS'">Operative Techniques in Cardiac &amp; Thoracic Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OTORRI'">Acta Otorrinolaringologica Espanola</xsl:when>
             <xsl:when test="$codeTitleElsevier1='OTSR'">Orthopaedics &amp; Traumatology: Surgery &amp; Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PACFIN'">Pacific-Basin Finance Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PAED'">Paediatrics and Child Health</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PAID'">Personality and Individual Differences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PAIFOR'">Pain Forum</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PAIN'">Pain</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PALAEO'">Palaeogeography, Palaeoclimatology, Palaeoecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PALBO'">Review of Palaeobotany and Palynology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PALEVO'">Comptes Rendus Palevol</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PALWOR'">Palaeoworld</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PAN'">Pancreatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PARA'">International Journal for Parasitology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PARCO'">Parallel Computing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PARINT'">Parasitology International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PARTIC'">Particuology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PARTOD'">Parasitology Today</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PATBIO'">Pathologie Biologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PATCOU'">Patient Counselling and Health Education</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PATPHY'">Pathophysiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PATREC'">Pattern Recognition Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PBA'">Journal of Pharmaceutical and Biomedical Analysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PBB'">Pharmacology, Biochemistry and Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PCD'">Primary Care Diabetes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PCFOL'">Progress in the Chemistry of Fats and Other Lipids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PCGC'">Progress In Crystal Growth And Characterization</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PCL'">The Pediatric Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PCRJ'">Primary Care Respiratory Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PCS'">Journal of Physics and Chemistry of Solids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PCU'">Primary Care Update for Ob/Gyns</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PCUSSR'">Petroleum Chemistry: U.S.S.R</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PDPDT'">Photodiagnosis and Photodynamic Therapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PDST'">Polymer Degradation and Stability</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PEC'">Patient Education and Counseling</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PEDADO'">Journal of Pediatric and Adolescent Gynecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PEDEX'">International Journal of Pediatric Otorhinolaryngology Extra</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PEDN'">Pediatrics &amp; Neonatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PEDOBI'">Pedobiologia - International Journal of Soil Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PEDOT'">International Journal of Pediatric Otorhinolaryngology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PEDPUE'">Journal de pediatrie et de puericulture</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PEDSPH'">Pedosphere</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PEP'">Peptides</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PEPI'">Physics of the Earth and Planetary Interiors</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PERIOP'">Perioperative Medizin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PETROL'">Journal of Petroleum Science and Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PEVA'">Performance Evaluation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PGEOLA'">Proceedings of the Geologists Association</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PGNE'">Polymer Gels and Networks</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PGQ'">Political Geography Quarterly</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHAHEL'">Pharmaceutica Acta Helvetiae</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHASCI'">European Journal of Pharmaceutical Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHB'">Physiology &amp; Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHCHEA'">Physics and Chemistry of the Earth, Part A</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHCHEB'">Physics and Chemistry of the Earth, Part B</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHCHEC'">Physics and Chemistry of the Earth, Part C</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHOGRA'">Photogrammetria</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHOTO'">ISPRS Journal of Photogrammetry and Remote Sensing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHOVOL'">Photovoltaics Bulletin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHPRO'">Physics Procedia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHRECO'">Pharmacological Research Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHSCTE'">Pharmaceutical Science &amp; Technology Today</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYCOM'">Physical Communication</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYLET'">Physics Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYMED'">Phytomedicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYSA'">Physica A: Statistical Mechanics and its Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYSB'">Physica B: Physics of Condensed Matter</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYSBC'">Physica B+C</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYSC'">Physica C: Superconductivity and its applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYSD'">Physica D: Nonlinear Phenomena</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYSE'">Physica E: Low-dimensional Systems and Nanostructures</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYSIC'">Physica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYSIO'">Journal of Physiology - Paris</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYSME'">Physical Mesomechanics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYST'">Physiotherapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYTO'">Phytochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PHYTOL'">Phytochemistry Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PIA'">Pump Industry Analyst</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PIAT'">Journal of Psychiatric Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PIEL'">Piel</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PIM'">The Journal of Product Innovation Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PJOR'">Philips Journal of Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PLA'">Physics Letters A</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PLAADD'">Plastics, Additives and Compounding</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PLAPHY'">Plant Physiology and Biochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PLB'">Physics Letters B</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PLREP'">Physics Reports</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PLREV'">Physics of Life Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PMCJ'">Pervasive and Mobile Computing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PMPH'">Progress in Metal Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PNEC'">Psychoneuroendocrinology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PNEUPS'">Progress in Neuro-Psychopharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PNFA'">Photonics and Nanostructures - Fundamentals and Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PNP'">Progress in Neuropsychopharmacology &amp; Biological Psychiatry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PNSC'">Progress in Natural Science: Materials International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PNU'">Pediatric Neurology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POC'">Progress in Organic Coatings</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POCO'">Polymer Contents</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POCOLD'">Progress in Organic Coatings</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POETIC'">Poetics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POG'">Progresos en Obstetricia y Ginecologia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POLAR'">Polar Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POLECO'">European Journal of Political Economy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POLPHO'">Polymer Photochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POLSCU'">Polymer Science U.S.S.R.</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POLSOC'">Policy and Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POLY'">Polyhedron</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POP'">Primary Care: Clinics in Office Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POSTEC'">Postharvest Biology and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POTE'">Polymer Testing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='POWER'">Journal of Power Sources</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PPC'">Progress in Pediatric Cardiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PPEES'">Perspectives in Plant Ecology, Evolution and Systematics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PPPATH'">Physiological Plant Pathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PR'">Pattern Recognition</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PRAGMA'">Journal of Pragmatics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PRAS'">Journal of Plastic, Reconstructive &amp; Aesthetic Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PRBI'">Process Biochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PRD'">Parkinsonism and Related Disorders</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PRE'">Precision Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PRECAM'">Precambrian Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PRECON'">Prevention and Control</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PREHOS'">Prehospital Emergency Care</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PREM'">Probabilistic Engineering Mechanics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PRETR'">Progress in water%</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PREVET'">Preventive Veterinary Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PRO'">Prostaglandins and Other Lipid Mediators</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROCHE'">Procedia Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROCI'">Proceedings of the Combustion Institute</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROCS'">Procedia Computer Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROECO'">International Journal of Production Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROENG'">Procedia Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROENV'">Procedia Environmental Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROEPS'">Procedia Earth and Planetary Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROGHI'">Progress in Histochemistry and Cytochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROLM'">Prostaglandins, Leukotrienes and Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROMED'">Prostaglandines and Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PRONEU'">Progress in Neurobiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROOCE'">Progress in Oceanography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROOLD'">Prostaglandins</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROPLA'">Progress in Planning</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROSC'">Proceedings of the Symposium on Combustion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROTEC'">Journal of Materials Processing Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROTIS'">Protist</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PROVAC'">Procedia in Vaccinology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PRP'">Pathology - Research and Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PRPS'">Pratiques Psychologiques</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PS'">Progress in Surface Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PSC'">Psychiatric Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PSEP'">Process Safety and Environmental Protection</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PSFR'">Psychologie Française</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PSL'">Plant Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PSLETT'">Plant Science Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PSR'">Journal of Psychosomatic Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PSS'">Planetary and Space Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PSY'">Psychiatry Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PSYM'">Psychosomatics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PSYN'">Psychiatry Research: Neuroimaging</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PSYSPO'">Psychology of Sport &amp; Exercise</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PTBGSP'">Pharmacology and Therapeutics: Part B: General And Systematic Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PTCCPT'">Pharmacology and Therapeutics: Part C: Clinical Pharmacology and Therapeutics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PTCTMI'">Pharmacology and Therapeutics, Part A: Chemotherapy, Toxicology and Metabolic Inhibitors</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PTEC'">Powder Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PTO'">Psychologie du Travail et des Organisations</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PTTT'">Plasma Therapy and Transfusion Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PUBEC'">Journal of Public Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PUBHEF'">Public Health Forum</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PUBMAN'">International Public Management Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PUBREL'">Public Relations Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PUHE'">Public Health</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PURSUP'">Journal of Purchasing and Supply Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXAB'">L'Annee Biologique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXAC'">Annales de l'Institut Pasteur/Actualites</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXAE'">Air &amp; Space Europe</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXAF'">Annales Françaises d'Anesthésie et de Réanimation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXAP'">LAntropologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXAU'">Annales durologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXAZ'">Annales des Sciences Naturelles Zoologie et Biologie Animale</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXBF'">Biofutur</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXCI'">Comptes Rendus de l'Académie des Sciences - Series IIC - Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXCA'">Cryptogamie Algologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXCB'">Cryptogamie Bryologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXCC'">Cryptogamie Mycologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXCF'">Revue Generale des Chemins de Fer</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXCG'">Annales de chirurgie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXCOLD'">Chirurgie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXDI'">Annales de cardiologie et dangeiologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXGE'">Annales de genetique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXHOLD'">Comptes Rendus de l'Academie des Sciences Series IV Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXMOLD'">Comptes Rendus de l'Academie des Sciences Series I Mathematics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXMS'">Annales medico-psychologiques</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXOB'">Option/Bio</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXOLDC'">Comptes Rendus de l'Academie des Sciences Series IIC Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXOLDP'">Comptes Rendus de l'Academie des Sciences Series IIB Mechanics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXPL'">Plasmas &amp; Ions</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXPOLD'">Comptes Rendus de l'Academie des Sciences Series IIB Mechanics Physics Astronomy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXROLD'">Reanimation Urgences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXSM'">Bulletin des sciences mathematiques</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXTOLD'">Comptes Rendus de l'Academie des Sciences Series IIA Earth and Planetary Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXUR'">Medecine de Catastrophe</xsl:when>
             <xsl:when test="$codeTitleElsevier1='PXVOLD'">Comptes Rendus de l'Academie des Sciences Series III Sciences de la Vie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='QUAECO'">Quarterly Review of Economics and Finance</xsl:when>
             <xsl:when test="$codeTitleElsevier1='QUAGEO'">Quaternary Geochronology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='QUAMAN'">Journal of Quality Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RACREG'">Research in Accounting Regulation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RACSOC'">Race and Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RADBOT'">Radiation Botany</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RADION'">Radiotherapy and Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RADPC'">Radiation Physics and Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RARMET'">Rare Metals</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RASD'">Research in Autism Spectrum Disorders</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RBMNEW'">ITBM-RBM News</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RBMO'">Reproductive BioMedicine Online</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RBMRET'">ITBM RBM</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RBTCS'">Robotics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RCE'">Revista clinica espanola</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RCL'">Radiologic Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RCM'">Robotics and Computer Integrated Manufacturing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RDC'">Rheumatic Disease Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REACT'">Reactive and Functional Polymers</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REACTI'">Reactive Polymers</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REASOL'">Reactivity of Solids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REAURG'">Reanimation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REC'">Revista Española de Cardiología (English Edition)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RECESP'">Revista Española de Cardiologia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RECOTE'">Revista Española de Cirugía Ortopédica y Traumatología (English Edition)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RECTRA'">Recherche Transports Securite</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RECYCL'">Resources, Conservation &amp; Recycling</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REF'">Renewable Energy Focus</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REFOCU'">Refocus</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REGEC'">Regional Science and Urban Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REGG'">Revista Espanola de Geriatria y Gerontologia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REGPEP'">Regulatory Peptides</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REGUE'">Regional and Urban Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REHAB'">Annals of Physical and Rehabilitation Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RELENG'">Reliability Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REMN'">Revista Espanola de Medicina Nuclear</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RENC'">Revue delectroencephalographie et de Neurophysiologie Clinique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RENE'">Renewable Energy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REPL'">Reinforced Plastics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RESAEN'">Resources and Energy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RESCIT'">Journal of Nuclear Energy. Parts A/B. Reactor Science and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RESCON'">Resources and Conservation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RESEN'">Resource and Energy Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RESMIC'">Research in Microbiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RESP'">Respiration Physiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RESPNB'">Respiratory Physiology &amp; Neurobiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RESPOL'">Research Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RESREC'">Resource Recovery and Conservation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RESS'">Reliability Engineering and System Safety</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RESSTR'">Research Strategies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RESUS'">Resuscitation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RETAIL'">Journal of Retailing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RETREC'">Research in Transportation Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVAL'">Revue Française d’Allergologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVALL'">Revue Fran&#231;aise dAllergologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVCLI'">Revue fran&#231;aise dallergologie et dimmunologie clinique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVECO'">International Review of Economics and Finance</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVFAL'">Revue Fran&#231;aise dAllergie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVFIN'">Review of Financial Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVFRA'">Revue Fran&#231;aise des Laboratoires</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVMED'">La Revue de medecine interne</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVMIC'">Revue de micropaleontologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVMOL'">Reviews in Molecular Biotechnology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVRAD'">Review of Radical Political Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVRHU'">Revue du rhumatisme</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVTHB'">Revue Fran&#231;aise de Transfusion et dHemobiologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVTIM'">Revue Fran&#231;aise de Transfusion et Immuno-hematologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='REVTRA'">Revue Fran&#231;aise de Transfusion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RFL'">Revue Francophone des Laboratoires</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RGG'">Russian Geology and Geophysics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RH'">Rehabilitacion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RHM'">Reproductive Health Matters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RIBAF'">Research in International Business and Finance</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RIDD'">Research in Developmental Disabilities</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RIGAPP'">Reviews in Gynaecological and Perinatal Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RIGP'">Reviews in Gynaecological Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RIOB'">Research in Organizational Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RLFA'">Revista de Logopedia, Foniatria y Audiologia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RM'">Radiation Measurements</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RMEDC'">Respiratory Medicine CME</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RMEDU'">Respiratory Medicine: COPD Update</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RMEDX'">Respiratory Medicine Extra</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RMHM'">International Journal of Refractory Metals and Hard Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RMME'">Rare Metal Materials and Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RMMS'">International Journal of Rock Mechanics and Mining Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RMMSZZ'">International Journal of Rock Mechanics and Mining Sciences and Geomechanics Abstracts</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RMP'">Reports on Mathematical Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ROB'">International Journal of Radiation Oncology, Biology, Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ROBOT'">Robotics and Autonomous Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RONTGE'">Röntgenpraxis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RPC'">Radiation Physics and Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RPIES'">Reactive Polymers, Ion Exchangers, Sorbents</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RPON'">Reports of Practical Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RPOR'">Reports of Practical Oncology &amp; Radiotherapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RSAP'">Research in Social and Administrative Pharmacy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RSCI'">Rice Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RSE'">Remote Sensing of Environment</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RSER'">Renewable and Sustainable Energy Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RSSM'">Research in Social Stratification and Mobility</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RTE'">Research in Transportation Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RTX'">Reproductive Toxicology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RUMIN'">Small Ruminant Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RUSLIT'">Russian Literature</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RUST'">Journal of Rural Studies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='RX'">Radiologia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SAA'">Spectrochimica Acta Part A: Molecular and Biomolecular Spectroscopy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SAAOLD'">Spectrochimica Acta Part A: Molecular Spectroscopy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SAB'">Spectrochimica Acta Part B: Atomic Spectroscopy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SAFETY'">Safety Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SAJB'">South African Journal of Botany</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SAMES'">Journal of South American Earth Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SAS'">International Journal of Solids and Structures</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SAT'">Journal of Substance Abuse Treatment</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SAUENF'">Sauvegarde de l'Enfance</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SBB'">Soil Biology and Biochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SBMB'">Journal of Steroid Biochemistry and Molecular Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SBSPRO'">Procedia – Social and Behavioral Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCAMAN'">Scandinavian Journal of Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCFEP'">Symposium on Combustion and Flame, and Explosion Phenomena</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCHRES'">Schizophrenia Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCIBR'">Scandinavian international business review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCICO'">Science of Computer Programming</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCIJUS'">Science &amp; Justice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCISPO'">Science &amp; Sports</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCITEC'">Science and Technology of Advanced Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCJMAS'">Scandinavian Journal of Management Studies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCL'">Systems &amp; Control Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCR'">Stem Cell Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCRE'">Screening</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCRMET'">Scripta Metallurgica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SCT'">Surface &amp; Coatings Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SDEE'">Soil Dynamics and Earthquake Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SDENTJ'">The Saudi Dental Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SE'">Solar Energy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SEAESO'">Journal of Southeast Asian Earth Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SEARES'">Journal of Sea Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SEATEC'">Sealing Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SECLAN'">Journal of Second Language Writing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SEDGEO'">Sedimentary Geology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SEMAT'">Solar Energy Materials</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SEMERG'">SEMERGEN - Medicina de Familia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SEP'">Separations Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SEPPUR'">Separation and Purification Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SEPS'">Socio-Economic Planning Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SERIMM'">Serodiagnosis and Immunotherapy in Infectious Disease</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SERREV'">Serials Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SETP'">Systems Engineering - Theory &amp; Practice Online</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SEXOL'">Sexologies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SFNM'">Seminars in Fetal and Neonatal Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SG'">Journal of Structural Geology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SHPMP'">Studies in History and Philosophy of Modern Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SHPS'">Studies in History and Philosophy of Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SHPSC'">Studies in History and Philosophy of Biol &amp; Biomed Sci</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SICOM'">Symposium (International) on Combustion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SIGM'">Seminars in Integrative Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SIGPRO'">Signal Processing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SIMPAT'">Simulation Modelling Practice and Theory</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SIMPRA'">Simulation Practice and Theory</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SISS'">Social Science Information Studies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SJBS'">Saudi Journal of Biological Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SJOPT'">Saudi Journal of Ophthalmology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SJPAIN'">Scandinavian Journal of Pain</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SLEEP'">Sleep Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SM'">Scripta Metallurgica et Materiala</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SMABUL'">Smart Materials Bulletin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SMM'">Scripta Materialia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SMR'">Sport Management Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SN'">Sensors and Actuators</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SNA'">Sensors &amp; Actuators: A. Physical</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SNB'">Sensors &amp; Actuators: B. Chemical</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SO'">Surgical Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SOARD'">Surgery for Obesity and Related Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SOCECO'">Journal of Socio-Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SOCEVO'">Journal of Social and Evolutionary Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SOCSCI'">The Social Science Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SOCTRA'">Sociologie du travail</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SOILTE'">Soil Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SOLCEL'">Solar Cells</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SOLMAT'">Solar Energy Materials and Solar Cells</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SON'">Social Networks</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SOP'">Survey of Ophthalmology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SOSCME'">Social Science and Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SOSI'">Solid State Ionics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SPA'">Stochastic Processes and their Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SPEACT'">Spectrochimica Acta</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SPECOM'">Speech Communication</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SPINEE'">Spine Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SPJ'">Saudi Pharmaceutical Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SPMD'">Seminars in Pain Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SPR'">Journal of Stored Products Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SRAM'">Sexuality, Reproduction and Menopause</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SRHC'">Sexual &amp; Reproductive Healthcare</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SRT'">Space Research Today</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SS'">European Journal of Solid State and Inorganic Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SSC'">Solid State Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SSE'">Solid State Electronics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SSM'">Social Science &amp; Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SSMA'">Social Science and Medicine. Part A Medical Psychology and Medical Sociology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SSMB'">Social Science and Medicine. Part B Medical Anthropology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SSMC'">Social Science and Medicine. Part C Medical Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SSMD'">Social Science and Medicine. Part D Medical Geography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SSME'">Social Science and Medicine. Part E Medical Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SSMF'">Social Science and Medicine. Part F Medical and Social Ethics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SSSCIE'">Solid State Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SSTB'">Spill Science and Technology Bulletin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SSTE'">Spatial and Spatio-temporal Epidemiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='STAMET'">Statistical Methodology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='STAPRO'">Statistics and Probability Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='STE'">Steroids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='STFODE'">Structure</xsl:when>
             <xsl:when test="$codeTitleElsevier1='STILL'">Soil &amp; Tillage Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='STOTEN'">Science of the Total Environment</xsl:when>
             <xsl:when test="$codeTitleElsevier1='STRECO'">Structural Change and Economic Dynamics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='STRINF'">Journal of Strategic Information Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='STRUCS'">Structural Safety</xsl:when>
             <xsl:when test="$codeTitleElsevier1='STUCCO'">Studies in Comparative Communism</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SUBABU'">Journal of Substance Abuse</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SUC'">Surgical Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SUN'">Surgical Neurology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SUPFLU'">The Journal of Supercritical Fluids</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SURGE'">The Surgeon</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SURTEC'">Surface Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SUSC'">Surface Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SUSCL'">Surface Science Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SUSREP'">Surface Science Reports</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SWT'">Solar and Wind Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SYAPM'">Systematic and Applied Microbiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SYNMET'">Synthetic Metals</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SYS'">System</xsl:when>
             <xsl:when test="$codeTitleElsevier1='SYSARC'">Journal of Systems Architecture</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TA'">Trastornos Adictivos </xsl:when>
             <xsl:when test="$codeTitleElsevier1='TAFMEC'">Theoretical and Applied Fracture Mechanics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TAL'">Talanta</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TAR'">Drug Discovery Today:TARGETS</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TATE'">Teaching and Teacher Education</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TB'">Journal of Thermal Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TCA'">Thermochimica Acta</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TCAM'">Topics in Companion Animal Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TCM'">Trends in Cardiovascular Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TCMJ'">Tzu Chi Medical Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TCS'">Theoretical Computer Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TECH'">Technovation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TECHFO'">Technological Forecasting</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TECTIP'">Technical Tips Online</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TECTO'">Tectonophysics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TELE'">Telematics and Informatics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TELN'">Teaching and Learning in Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TEM'">Trends in Endocrinology &amp; Metabolism</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TER'">Journal of Terramechanics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TET'">Tetrahedron</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TETASY'">Tetrahedron: Asymmetry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TETCOM'">Tetrahedron Computer Methodology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TETL'">Tetrahedron Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TFS'">Technological Forecasting &amp; Social Change</xsl:when>
             <xsl:when test="$codeTitleElsevier1='THAREL'">Thalamus and Related Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='THBIO'">Theory in Biosciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='THE'">Theriogenology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='THEKNE'">The Knee</xsl:when>
             <xsl:when test="$codeTitleElsevier1='THEOCH'">Journal of Molecular Structure: THEOCHEM</xsl:when>
             <xsl:when test="$codeTitleElsevier1='THESCI'">International Journal of Thermal Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TIBS'">Trends in Biochemical Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TIBTEC'">Trends in Biotechnology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TICB'">Trends in Cell Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TICS'">Trends in Cognitive Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TIFS'">Trends in Food Science &amp; Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TIGS'">Trends in Genetics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TIMI'">Trends in Microbiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TINS'">Trends in Neurosciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TIPS'">Trends in Pharmacological Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TIS'">Technology in Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TIV'">Toxicology in Vitro</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TJNP'">The Journal for Nurse Practitioners</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TJOG'">Taiwanese Journal of Obstetrics and Gynecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TMAID'">Travel Medicine and Infectious Disease</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TOP'">Topology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TOPOL'">Topology and its Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TOX'">Toxicology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TOXCON'">Toxicon</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TOXLET'">Toxicology Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TPS'">Transplantation Proceedings</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TR'">Thrombosis Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRA'">Transportation Research Part A</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRAC'">Trends in Analytical Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRACLI'">Transfusion clinique et biologique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRAG'">Transportation Research Part A: General</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRAMAN'">International Journal of Transport Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRANSF'">Transfusion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRARES'">Transportation Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRASCI'">Transfusion and Apheresis Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRB'">Transportation Research Part B</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRC'">Transportation Research Part C</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRD'">Transportation Research Part D</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRE'">Transportation Research Part E</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TREE'">Trends in Ecology &amp; Evolution</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TREIMM'">Trends in Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TREPAR'">Trends in Parasitology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRF'">Transportation Research Part F: Psychology and Behaviour</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRIB'">Tribology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRIM'">Transplant Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRMOME'">Trends in Molecular Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRPLSC'">Trends in Plant Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRSL'">Translational Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRSTMH'">Transactions of the Royal Society of Tropical Medicine and Hygiene</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TRUN'">Trait dUnion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TS'">Transfusion Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TSC'">Thinking Skills and Creativity</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TSF'">Thin Solid Films</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TSIST'">Tsinghua Science &amp; Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TTBDIS'">Ticks and Tick-borne Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TUB'">Tubercle</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TUST'">Tunnelling and Underground Space Technology incorporating Trenchless Technology Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='TWST'">Thin-Walled Structures</xsl:when>
             <xsl:when test="$codeTitleElsevier1='UCL'">Urologic Clinics of North America</xsl:when>
             <xsl:when test="$codeTitleElsevier1='UCT'">Update on Cancer Therapeutics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='UFUG'">Urban Forestry &amp; Urban Greening</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ULTRAM'">Ultramicroscopy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ULTRAS'">Ultrasonics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ULTSON'">Ultrasonics - Sonochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='UMB'">Ultrasound in Medicine &amp; Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='URBECO'">Urban Ecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='URBSYS'">Urban Systems</xsl:when>
             <xsl:when test="$codeTitleElsevier1='URBWAT'">Urban Water</xsl:when>
             <xsl:when test="$codeTitleElsevier1='URL'">Urology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='URO'">Urologic Oncology: Seminars and Original Investigations</xsl:when>
             <xsl:when test="$codeTitleElsevier1='USSRCM'">USSR Computational Mathematics and Mathematical Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='VAC'">Vacuum</xsl:when>
             <xsl:when test="$codeTitleElsevier1='VACUN'">Vacunas: investigación y práctica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='VETIMM'">Veterinary Immunology and Immunopathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='VETMIC'">Veterinary Microbiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='VETPAR'">Veterinary Parasitology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='VIBSPE'">Vibrational Spectroscopy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='VIRMET'">Journal of Virological Methods</xsl:when>
             <xsl:when test="$codeTitleElsevier1='VIRUS'">Virus Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='VLSI'">Integration, the VLSI Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='VOLGEO'">Journal of Volcanology and Geothermal Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='VPH'">Vascular Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='VR'">Vision Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='VSP'">Veterinary Clinics of North America: Small Animal Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WAMOT'">Wave Motion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WAPOL'">Water Policy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WD'">World Development</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WEA'">Wear</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WEBSEM'">Journal of Web Semantics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WEM'">Wilderness &amp; Environmental Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WHI'">Womens Health Issues</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WM'">Waste Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WNEU'">World Neurosurgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WOMBI'">Women and Birth</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WOPU'">World Pumps</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WORBUS'">Journal of World Business</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WPI'">World Patent Information</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WR'">Water Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WSIF'">Womens Studies International Forum</xsl:when>
             <xsl:when test="$codeTitleElsevier1='WSIQ'">Womens Studies International Quarterly</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X135'">Research in Virology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X153'">Bulletin du Cancer/Radiotherapie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X157'">RBM-Revue Europeenne de Technologie Biomedicale</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X193'">Clinical Therapeutics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X230'">Revue Generale de Thermique</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X244'">Journal of Molecular Catalysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X258'">Comptes Rendus de l'Academie des Sciences Series IIB Mechanics Physics Chemistry Astronomy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X280'">International Journal of Mass Spectrometry and Ion Processes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X283'">Environmental Software</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X308'">Computer Fraud and Security Bulletin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X309'">Applied Catalysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X310'">Colloids and Surfaces</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X74'">Bulletin de l'Institut Pasteur</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X83'">Research in Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='X85'">Urgences Medicales</xsl:when>
             <xsl:when test="$codeTitleElsevier1='XACRA'">Academic Radiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='XJRN'">Journal of Radiology Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='XYJALA'">Journal of the Association for Laboratory Automation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAAEN'">Accident &amp; Emergency Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAAJCS'">The Austral-Asian Journal of Cardiac and Thoracic Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAAMA'">Advances in Applied Mathematics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YABBI'">Archives of Biochemistry and Biophysics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YABIO'">Analytical Biochemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YACHA'">Applied and Computational Harmonic Analysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YADND'">Atomic Data and Nuclear Data Tables</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YADPA'">Annals of Diagnostic Pathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAEMED'">AeroMedical Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAIMA'">Advances in Mathematics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAJCD'">American Journal of Contact Dermatitis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAJEM'">American Journal of Emergency Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAJKD'">American Journal of Kidney Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAJOG'">American Journal of Obstetrics and Gynecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAJOT'">American Journal of Otolaryngology-Head and Neck Medicine and Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YANAE'">Anaerobe</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YANBE'">Animal Behaviour</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YANBO'">Annals of Botany</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAPHJ'">The Asia Pacific Heart Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAPHY'">Annals of Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAPMR'">Archives of Physical Medicine and Rehabilitation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAPNR'">Applied Nursing Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAPNU'">Archives of Psychiatric Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YAPTCS'">The Asia Pacific Journal of Thoracic and Cardiovascular Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YARTH'">The Journal of Arthroplasty</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YASLE'">Atmospheric Science Letters</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBARE'">The British Accounting Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBBMT'">Biology of Blood and Marrow Transplantation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBBRC'">Biochemical and Biophysical Research Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBCMD'">Blood Cells, Molecules and Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBCON'">Biological Control</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBEAN'">Best Practice &amp; Research Clinical Anaesthesiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBEEM'">Best Practice &amp; Research Clinical Endocrinology &amp; Metabolism</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBEGA'">Best Practice &amp; Research Clinical Gastroenterology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBEHA'">Best Practice &amp; Research Clinical Haematology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBENG'">Biosystems Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBEOG'">Best Practice &amp; Research Clinical Obstetrics &amp; Gynaecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBERH'">Best Practice &amp; Research Clinical Rheumatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBIJL'">Biological Journal of the Linnean Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBIOL'">Biologicals</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBIOO'">Bioorganic Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBJOM'">British Journal of Oral &amp; Maxillofacial Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBJPS'">British Journal of Plastic Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBLRE'">Blood Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBMMB'">Biochemical Medicine and Metabolic Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBMME'">Biochemical and Molecular Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBOJL'">Botanical Journal of the Linnean Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBRBI'">Brain Behavior and Immunity</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBRCG'">Brain and Cognition</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBRLN'">Brain and Language</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBRST'">The Breast</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YBULM'">Bulletin of Mathematical Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCACC'">Current Anaesthesia &amp; Critical Care</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCAOM'">Clinical Acupuncture &amp; Oriental Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCBIR'">Cell Biology International</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCBMR'">Computers and Biomedical Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCCOG'">Consciousness and Cognition</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCDIP'">Current Diagnostic Pathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCECA'">Cell Calcium</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCEIN'">Clinical Effectiveness in Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCEPS'">Contemporary Educational Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCGIP'">CVGIP: Graphical Models and Image Processing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCGRIP'">Computer Graphics and Image Processing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCHEC'">Coronary Health Care</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCIMM'">Cellular Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCIUN'">CVGIP: Image Understanding</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCLAD'">Cladistics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCLIM'">Clinical Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCLIN'">Clinical Immunology and Immunopathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCLNU'">Clinical Nutrition</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCLNUS'">Clinical Nutrition Supplements</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCLON'">Clinical Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCOGP'">Cognitive Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCOMP'">Comprehensive Psychiatry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCPAC'">Critical Perspectives on Accounting</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCPEM'">Clinical Pediatric Emergency Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCRAD'">Clinical Radiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCRAE'">Clinical Radiology Extra</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCRES'">Cretaceous Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCRYO'">Cryobiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCSLA'">Computer Speech &amp; Language</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCTEP'">Clinical Techniques in Equine Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCTIM'">Complementary Therapies in Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCTNM'">Complementary Therapies in Nursing and Midwifery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCTRV'">Cancer Treatment Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCUOE'">Current Paediatrics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCUOG'">Current Obstetrics &amp; Gynaecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCUOR'">Current Orthopaedics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCVIGP'">Computer Vision, Graphics and Image Processing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCVIU'">Computer Vision and Image Understanding</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YCYTO'">Cytokine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YDBIO'">Developmental Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YDLD'">Digestive and Liver Disease</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YDREV'">Developmental Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YDRUP'">Drug Resistance Updates</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YDSPR'">Digital Signal Processing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEBCM'">Evidence-based Cardiovascular Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEBEH'">Epilepsy &amp; Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEBHC'">Evidence-based Healthcare</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEBOG'">Evidence-based Obstetrics &amp; Gynecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEBON'">Evidence-based Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YECLNM'">e-SPEN, the European e-Journal of Clinical Nutrition and Metabolism</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YECSS'">Estuarine, Coastal and Shelf Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEESA'">Ecotoxicology and Environmental Safety</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEJON'">European Journal of Oncology Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEJPN'">European Journal of Paediatric Neurology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEJSO'">European Journal of Surgical Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEJVS'">European Journal of Vascular &amp; Endovascular Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEJVX'">European Journal of Vascular and Endovascular Surgery Extra</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEMYC'">Experimental Mycology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YENFO'">Environmental Forensics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YENRS'">Environmental Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEUJC'">European Journal of Combinatorics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEUJP'">European Journal of Pain</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEUJPS'">European Journal of Pain Supplements</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEXCR'">Experimental Cell Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEXEH'">Explorations in Economic History</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEXER'">Experimental Eye Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEXMP'">Experimental and Molecular Pathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEXNR'">Experimental Neurology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YEXPR'">Experimental Parasitology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YFAAT'">Fundamental and Applied Toxicology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YFFTA'">Finite Fields and Their Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YFGBI'">Fungal Genetics and Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YFIPR'">Fibrinolysis and Proteolysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YFMIC'">Food Microbiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YFOOT'">The Foot</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YFRNE'">Frontiers in Neuroendocrinology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YFSIM'">Fish and Shellfish Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YFSTL'">LWT - Food Science and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YGAME'">Games and Economic Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YGAST'">Gastroenterology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YGCEN'">General and Comparative Endocrinology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YGENO'">Genomics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YGHIR'">Growth Hormone &amp; IGF Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YGMIP'">Graphical Models and Image Processing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YGMOD'">Graphical Models</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YGYNO'">Gynecologic Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YHBEH'">Hormones and Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YHCPR'">Home Care Provider</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YHMAT'">Historia Mathematica</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YHOAV'">Hospital Aviation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YHOMP'">Homeopathy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YHUPA'">Human Pathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YICAR'">Icarus</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YICCN'">Intensive &amp; Critical Care Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YICSE'">IMPACT of Computing in Science and Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIILR'">International Information and Library Review</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIJAR'">The International Journal of Aromatherapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIJHC'">International Journal of Human - Computer Studies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIJNA'">The International Journal of Nautical Archaeology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIJOA'">International Journal of Obstetric Anesthesia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIJODC'">International Journal of Orthodontia and Dentistry for Children</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIJOM'">International Journal of Oral &amp; Maxillofacial Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIJOOS'">International Journal of Orthodontia and Oral Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIJORS'">International Journal of Orthodontia and Oral Surgery (1919)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIJORT'">International Journal of Orthodontia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIJOSR'">International Journal of Orthodontia, Oral Surgery and Radiography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIJSL'">International Journal of the Sociology of Law</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIJTN'">International Journal of Trauma Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIMMS'">International Journal of Man-Machine Studies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YIMMU'">ImmunoMethods</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YINCO'">Information and Computation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YINSI'">Insight - the Journal of the American Society of Ophthalmic Registered Nurses</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJAAR'">Journal of Anthropological Archaeology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJABR'">Journal of Algebra</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJACEP'">Journal of the American College of Emergency Physicians</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJADA'">Journal of the American Dietetic Association</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJADO'">Journal of Adolescence</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJAER'">Journal of Agricultural Engineering Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJAGM'">Journal of Algorithms</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJAMT'">Journal of Air Medical Transport</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJARE'">Journal of Arid Environments</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJARS'">Arthroscopy: The Journal of Arthroscopic and Related Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJASC'">Journal of Archaeological Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJATH'">Journal of Approximation Theory</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJAUT'">Journal of Autoimmunity</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJBIN'">Journal of Biomedical Informatics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJBMT'">Journal of Bodywork &amp; Movement Therapies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCAF'">Journal of Cardiac Failure</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCAN'">Journal of Cardiothoracic and Vascular Anesthesia</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCAT'">Journal of Catalysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCEC'">Journal of Comparative Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCFM'">Journal of Clinical Forensic Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCHT'">The Journal of Chemical Thermodynamics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCIS'">Journal of Colloid And Interface Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCMS'">Journal of Cranio-Maxillo-Facial Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCOM'">Journal of Complexity</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCPA'">Journal of Comparative Pathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCPH'">Journal of Computational Physics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCPT'">Journal of Comparative Pathology and Therapeutics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCRC'">Journal of Critical Care</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCRS'">Journal of Cereal Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCSS'">Journal of Computer and System Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCTA'">Journal of Combinatorial Theory, Series A</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJCTB'">Journal of Combinatorial Theory, Series B</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJDEQ'">Journal of Differential Equations</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJECP'">Journal of Experimental Child Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJEEM'">Journal of Environmental Economics and Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJELC'">Journal of Electrocardiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJEMA'">Journal of Environmental Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJESP'">Journal of Experimental Social Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJETH'">Journal of Economic Theory</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJEVP'">Journal of Environmental Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJEVS'">Journal of Equine Veterinary Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJFAN'">Journal of Functional Analysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJFAS'">The Journal of Foot and Ankle Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJFCA'">Journal of Food Composition and Analysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJFIN'">Journal of Financial Intermediation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJFLM'">Journal of Forensic and Legal Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJFLS'">Journal of Fluids and Structures</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJFMS'">Journal of Feline Medicine and Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJHEC'">Journal of Housing Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJHEP'">Hepatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJHEV'">Journal of Human Evolution</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJHGE'">Journal of Historical Geography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJHIN'">Journal of Hospital Infection</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJHSB'">Journal of Hand Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJHSE'">The Journal of Hand Surgery: European Volume</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJHSU'">Journal of Hand Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJINF'">Journal of Infection</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJIPA'">Journal of Invertebrate Pathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJJIE'">Journal of The Japanese and International Economies</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJLTS'">Liver Transplantation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJMAA'">Journal of Mathematical Analysis and Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJMBI'">Journal of Molecular Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJMCA'">Journal of Microcomputer Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJMCC'">Journal of Molecular and Cellular Cardiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJMLA'">Journal of Memory and Language</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJMPS'">Journal of Mathematical Psychology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJMRA'">Journal of Magnetic Resonance, Series A</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJMRB'">Journal of Magnetic Resonance, Series B</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJMRE'">Journal of Magnetic Resonance</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJMSC'">ICES Journal of Marine Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJMSP'">Journal of Molecular Spectroscopy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJMVA'">Journal of Multivariate Analysis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJNCA'">Journal of Network and Computer Applications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJNTH'">Journal of Number Theory</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJOCA'">Osteoarthritis and Cartilage</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJOCN'">Journal of Clinical Neuroscience</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJOMS'">Journal of Oral and Maxillofacial Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJOON'">Journal of Orthopaedic Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJOOS'">American Journal of Orthodontics and Oral Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJPAI'">Journal of Pain</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJPAN'">Journal of PeriAnesthesia Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJPDC'">Journal of Parallel and Distributed Computing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJPDN'">Journal of Pediatric Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJPHO'">Journal of Phonetics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJPMN'">Pain Management Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJPNU'">Journal of Professional Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJPON'">Journal of Pediatric Oncology Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJPSU'">Journal of Pediatric Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJREN'">Journal of Renal Nutrition</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJRPE'">Journal of Research in Personality</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJSBI'">Journal of Structural Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJSCD'">Journal of Stroke and Cerebrovascular Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJSCO'">Journal of Symbolic Computation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJSRE'">Journal of Surgical Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJSSC'">Journal of Solid State Chemistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJSSH'">Journal- American Society for the Surgery of the Hand</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJSVI'">Journal of Sound and Vibration</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJTBI'">Journal of Theoretical Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJUEC'">Journal of Urban Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJVBE'">Journal of Vocational Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJVCI'">Journal of Visual Communication and Image Representation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJVLC'">Journal of Visual Languages and Computing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YJXRA'">Journal of X-Ray Science and Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YKNAC'">Knowledge Acquisition</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YLICH'">The Lichenologist</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YLMOT'">Learning and Motivation</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMAI'">The Journal of Allergy and Clinical Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMAJ'">Aesthetic Surgery Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMAM'">Air Medical Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMARE'">Management Accounting Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMAS'">Asthma Magazine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMATH'">Manual Therapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMBEN'">Metabolic Engineering</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMCBR'">Molecular Cell Biology Research Communications</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMCD'">Current Problems in Cardiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMCM'">The Case Manager</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMCN'">Current Problems in Cancer</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMCNE'">Molecular and Cellular Neuroscience</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMCPR'">Molecular and Cellular Probes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMCU'">Clinical Update</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMDA'">Disease-a-Month</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMDE'">Dental Abstracts</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMDM'">Current Problems in Dermatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMDR'">Current Problems in Diagnostic Radiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMED'">Journal of Evidence-Based Dental Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMEHY'">Medical Hypotheses</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMEM'">Annals of Emergency Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMEN'">Journal of Emergency Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMETA'">Metabolism</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMETH'">Methods</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMGE'">Gastrointestinal Endoscopy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMGME'">Molecular Genetics and Metabolism</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMGN'">Geriatric Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMHJ'">American Heart Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMHL'">Heart &amp; Lung - The Journal of Acute and Critical Care</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMHN'">Otolaryngology - Head and Neck Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMIC'">AJIC: American Journal of Infection Control</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMIDW'">Midwifery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMJD'">Journal of the American Academy of Dermatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMJE'">Journal of the American Society of Echocardiography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMJW'">Journal of WOCN: Wound, Ostomy and Continence Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMLC'">The Journal of Laboratory and Clinical Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMMD'">Disaster Management &amp; Response</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMMT'">Journal of Manipulative and Physiological Therapeutics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMNC'">Journal of Nuclear Cardiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMNL'">Nurse Leader</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMNO'">Nursing Outlook</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMOB'">American Journal of Obstetrics and Gynecology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMOD'">American Journal of Orthodontics &amp; Dentofacial Orthopedics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMODI'">Molecular Diagnosis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMOE'">Oral Surgery, Oral Medicine, Oral Pathology, Oral Radiology and Endodontology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMPA'">Journal of AAPOS</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMPAT'">Microbial Pathogenesis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMPD'">The Journal of Pediatrics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMPEV'">Molecular Phylogenetics and Evolution</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMPH'">Journal of Pediatric Health Care</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMPN'">Journal of the American Psychiatric Nurses Association</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMPR'">The Journal of Prosthetic Dentistry</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMPS'">Current Problems in Pediatric and Adolescent Health Care</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMSE'">Journal of Shoulder and Elbow Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMSG'">Current Problems in Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMSSP'">Mechanical Systems and Signal Processing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMSY'">Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMTC'">The Journal of Thoracic and Cardiovascular Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMTHE'">Molecular Therapy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMVA'">Journal of Vascular Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMVJ'">Journal of Voice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMVN'">Journal of Vascular Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YMVRE'">Microvascular Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YNBDI'">Neurobiology of Disease</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YNBIN'">Newborn and Infant Nursing Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YNCMN'">Neuroprotocols</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YNDSH'">Nuclear Data Sheets</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YNDSHA'">Nuclear Data Sheets Section A</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YNDSHB'">Nuclear Data Sheets Section B</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YNEDT'">Nurse Education Today</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YNEPR'">Nurse Education in Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YNEUR'">Neurodegeneration</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YNIMG'">NeuroImage</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YNIOX'">Nitric Oxide</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YNLME'">Neurobiology of Learning and Memory</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YNPEP'">Neuropeptides</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YOBHD'">Organizational Behavior and Human Decision Processes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YOFTE'">Optical Fiber Technology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YOTCT'">Operative Techniques in Thoracic and Cardiovascular Surgery: A Comparative Atlas</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YOTGN'">Operative Techniques in General Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YOTNS'">Operative Techniques in Neurosurgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YOTOR'">Operative Techniques in Orthopaedics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YOTOT'">Operative Techniques in Otolaryngology - Head and Neck Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YOTPR'">Operative Techniques in Plastic and Reconstructive Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YOTSM'">Operative Techniques in Sports Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPAOR'">Pathology and Oncology Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPCAD'">Progress in Cardiovascular Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPCSU'">Seminars in Thoracic and Cardiovascular Surgery: Pediatric Cardiac Surgery Annual</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPEST'">Pesticide Biochemistry and Physiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPHRS'">Pharmacological Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPLAC'">Placenta</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPLAS'">Plasmid</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPLEF'">Prostaglandins, Leukotrienes and Essential Fatty Acids (PLEFA)</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPMED'">Preventive Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPMPP'">Physiological and Molecular Plant Pathology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPREP'">Protein Expression and Purification</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPRRV'">Paediatric Respiratory Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPTSP'">Physical Therapy in Sport</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPULP'">Pulmonary Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YPUPT'">Pulmonary Pharmacology &amp; Therapeutics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YQRES'">Quaternary Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YRADI'">Radiography</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YRAPM'">Regional Anesthesia and Pain Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YRECO'">Ricerche Economiche</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YREDY'">Review of Economic Dynamics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YREEC'">Research in Economics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YRELI'">Religion</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YRMED'">Respiratory Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YRTIM'">Real-Time Imaging</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YRTPH'">Regulatory Toxicology and Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YRVSC'">Research in Veterinary Science</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSAEP'">Seminars in Avian and Exotic Pet Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSANE'">Seminars in Anesthesia, Perioperative Medicine and Pain</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSARH'">Seminars in Arthritis and Rheumatism</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSCBI'">Seminars in Cancer Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSCDB'">Seminars in Cell and Developmental Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSCDS'">Seminars in Cerebrovascular Disease and Stroke</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSCEL'">Seminars in Cell Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSEDB'">Seminars in Developmental Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSEIZ'">Seizure: European Journal of Epilepsy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSHEM'">Seminars in Hematology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSINY'">Seminars in Neonatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSMIM'">Seminars in Immunology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSMNS'">Seminars in Neuroscience</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSMRV'">Sleep Medicine Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSMVY'">Seminars in Virology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSNMR'">Solid State Nuclear Magnetic Resonance</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSNUC'">Seminars in Nuclear Medicine</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSODO'">Seminars in Orthodontics</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSONC'">Seminars in Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSONU'">Seminars in Oncology Nursing</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSPEN'">Seminars in Pediatric Neurology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSPER'">Seminars in Perinatology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSPID'">Seminars in Pediatric Infectious Diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSPMI'">Superlattices and Microstructures</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSPSU'">Seminars in Pediatric Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSRAO'">Seminars in Radiation Oncology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSROE'">Seminars in Roentgenology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSSRE'">Social Science Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSTCS'">Seminars in Thoracic and Cardiovascular Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSULT'">Seminars in Ultrasound, CT, and MRI</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSVAS'">Seminars in Vascular Surgery</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YSVMS'">Clinical Techniques in Small Animal Practice</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YTAAP'">Toxicology and Applied Pharmacology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YTGIE'">Techniques in Gastrointestinal Endoscopy</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YTICE'">Tissue and Cell</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YTMRV'">Transfusion Medicine Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YTOXS'">Toxicological Sciences</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YTPBI'">Theoretical Population Biology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YTRAP'">Techniques in Regional Anesthesia and Pain Management</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YTRRE'">Transplantation Reviews</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YTUBE'">Tuberculosis</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YTULD'">Tubercle and Lung Disease</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YTVIR'">Techniques in Vascular and Interventional Radiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YTVJL'">The Veterinary Journal</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YUIMG'">Ultrasonic Imaging</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YVIRO'">Virology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YVLVB'">Journal of Verbal Learning and Verbal Behavior</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YWMRE'">Waste Management &amp; Research</xsl:when>
             <xsl:when test="$codeTitleElsevier1='YZJLS'">Zoological Journal of the Linnean Society</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZBC'">Zentralblatt fur Bakteriologie, Reihe C</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZBHC'">Zentralblatt fur Bakteriologie und Hygiene , Reihe C</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZBMHA'">Zentralblatt fur Bakteriologie, Mikrobiologie und Hygiene / A: Medical Microbiology, Infectious Diseases, Virology, Parasitology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZBMM'">Zentralblatt fur Bakteriologie : medical microbiology, virology, parasitology, infectious diseases</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZBMMA'">Zentralblatt fur Bakteriologie. 1. Abt. Originale. A.</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZBMOLD'">Zentralblatt fur Bakteriologie, Mikrobiologie und Hygiene / A: Medizinische Mikrobiologie, Infektionskrankheiten und Parasitologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZBPIHA'">Zentralblatt fuer Bakteriologie, Parasitenkunde, Infektionskrankheiten und Hygiene. Zweite Naturwissenschaftliche Abteilung: Allgemeine, Landwirtschaftliche und Technische Mikrobiologie</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZBPIHM'">Zentralblatt fuer Bakteriologie, Parasitenkunde, Infektionskrankheiten und Hygiene. Zweite Naturwissenschaftliche Abteilung: Mikrobiologie der Landwirtschaft, der Technologie und des Umweltschutzes</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZEFQ'">Zeitschrift fuer Evidenz, Fortbildung und Qualitaet im Gesundheitswesen</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZEMEDI'">Zeitschrift für Medizinische Physik</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZEO'">Zeolites</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZFPP'">Zeitschrift fur Pflanzenphysiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZGESUN'">Zeitschrift für ärztliche Fortbildung und Qualität im Gesundheitswesen</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZHU'">Zentralblatt fur Hygiene und Umweltmedizin</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZII'">Zeitschrift fur Immunitatsforschung: Immunobiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZIIOLD'">Zeitschrift fur Immunitatsforschung: Immunobiology</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZMLTU'">Zentralblatt fur Mikrobiologie : Landwirtschaft, Technologie, Umweltschutz</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZOOGA'">Der Zoologische Garten</xsl:when>
             <xsl:when test="$codeTitleElsevier1='ZOOL'">Zoology</xsl:when>
           <xsl:otherwise> 
                <xsl:value-of select="$codeTitleElsevier1"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <!-- SAGE -->
    <xsl:variable name="codePublisherID1">
        <xsl:value-of select="normalize-space(article/front/journal-meta/journal-id[@journal-id-type='publisher-id'])"/>
    </xsl:variable>
    <xsl:variable name="SageJournalTitle">
        <xsl:choose>
            <xsl:when test="$codePublisherID1='AAF'">Adoption &amp; fostering</xsl:when>
            <xsl:when test="$codePublisherID1='AAS'">Administration &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='ABS'">American behavioral scientist (Beverly Hills)</xsl:when>
            <xsl:when test="$codePublisherID1='ACD'">Australian journal of career development</xsl:when>
            <xsl:when test="$codePublisherID1='ACH'">Accounting history (Geelong)</xsl:when>
            <xsl:when test="$codePublisherID1='ADB'">Adaptive behavior</xsl:when>
            <xsl:when test="$codePublisherID1='ADH'">Advances in developing human resources</xsl:when>
            <xsl:when test="$codePublisherID1='AED'">Australian journal of education</xsl:when>
            <xsl:when test="$codePublisherID1='AEI'">Assessment for effective intervention</xsl:when>
            <xsl:when test="$codePublisherID1='AEQ'">Adult education (Chapel Hill)</xsl:when>
            <xsl:when test="$codePublisherID1='AER'">American educational research journal</xsl:when>
            <xsl:when test="$codePublisherID1='AES'">Aesthetic surgery journal</xsl:when>
            <xsl:when test="$codePublisherID1='AFF'">Affilia</xsl:when>
            <xsl:when test="$codePublisherID1='AFS'">Armed forces and society</xsl:when>
            <xsl:when test="$codePublisherID1='AHH'">Arts and humanities in higher education</xsl:when>
            <xsl:when test="$codePublisherID1='AJA'">American journal of Alzheimer's disease and other dementias</xsl:when>
            <xsl:when test="$codePublisherID1='AJC'">Asian Journal of Management Cases</xsl:when>
            <xsl:when test="$codePublisherID1='AJE'">The American journal of evaluation</xsl:when>
            <xsl:when test="$codePublisherID1='AJH'">The American journal of hospice &amp; palliative care</xsl:when>
            <xsl:when test="$codePublisherID1='AJL'">American journal of lifestyle medicine</xsl:when>
            <xsl:when test="$codePublisherID1='AJM'">American journal of medical quality</xsl:when>
            <xsl:when test="$codePublisherID1='AJS'">American journal of sports medicine</xsl:when>
            <xsl:when test="$codePublisherID1='ALH'">Active learning in higher education</xsl:when>
            <xsl:when test="$codePublisherID1='ALT'">Alternatives (Amsterdam)</xsl:when>
            <xsl:when test="$codePublisherID1='ANG'">Vascular Diseases</xsl:when>
            <xsl:when test="$codePublisherID1='ANJ'">Australian &amp; New Zealand journal of criminology</xsl:when>
            <xsl:when test="$codePublisherID1='ANM'">Animation (London. Print)</xsl:when>
            <xsl:when test="$codePublisherID1='ANN'">The Annals of the American Academy of Political and Social Science</xsl:when>
            <xsl:when test="$codePublisherID1='ANP'">Australian and New Zealand journal of psychiatry</xsl:when>
            <xsl:when test="$codePublisherID1='ANT'">Anthropological theory</xsl:when>
            <xsl:when test="$codePublisherID1='APA'">Journal of the American Psychoanalytic Association</xsl:when>
            <xsl:when test="$codePublisherID1='APH'">Asia-Pacific journal of public health</xsl:when>
            <xsl:when test="$codePublisherID1='APM'">Applied psychological measurement</xsl:when>
            <xsl:when test="$codePublisherID1='APR'">American politics research</xsl:when>
            <xsl:when test="$codePublisherID1='APY'">Australasian psychiatry</xsl:when>
            <xsl:when test="$codePublisherID1='ARJ'">Action research (London. Print)</xsl:when>
            <xsl:when test="$codePublisherID1='ARP'">American review of public administration</xsl:when>
            <xsl:when test="$codePublisherID1='ASJ'">Acta sociologica (Trykt utg.)</xsl:when>
            <xsl:when test="$codePublisherID1='ASM'">Assessment (Odessa, Fla.)</xsl:when>
            <xsl:when test="$codePublisherID1='ASQ'">Administrative science quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='ASR'">American sociological review</xsl:when>
            <xsl:when test="$codePublisherID1='AUM'">Australian journal of management</xsl:when>
            <xsl:when test="$codePublisherID1='AUT'">Autism (London)</xsl:when>
            <xsl:when test="$codePublisherID1='BAS'">Business &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='BCQ'">Business communication quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='BIR'">Business information review</xsl:when>
            <xsl:when test="$codePublisherID1='BJI'">Journal of infection prevention</xsl:when>
            <xsl:when test="$codePublisherID1='BJP'">British journal of pain</xsl:when>
            <xsl:when test="$codePublisherID1='BJR'">British journalism review</xsl:when>
            <xsl:when test="$codePublisherID1='BMO'">Behavior modification</xsl:when>
            <xsl:when test="$codePublisherID1='BMS'">BMS. Bulletin de méthodologie sociologique</xsl:when>
            <xsl:when test="$codePublisherID1='BOD'">Body &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='BOS'">Bulletin of the atomic scientists</xsl:when>
            <xsl:when test="$codePublisherID1='BRN'">Biological research for nursing</xsl:when>
            <xsl:when test="$codePublisherID1='BSE'">Building services engineering research &amp; technology</xsl:when>
            <xsl:when test="$codePublisherID1='BST'">Bulletin of science, technology &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='BTB'">Biblical theology bulletin</xsl:when>
            <xsl:when test="$codePublisherID1='BUL'">NASSP bulletin</xsl:when>
            <xsl:when test="$codePublisherID1='CAC'">Cooperation and conflict</xsl:when>
            <xsl:when test="$codePublisherID1='CAD'">Crime and delinquency</xsl:when>
            <xsl:when test="$codePublisherID1='CAN'">Infant, child &amp; adolescent nutrition</xsl:when>
            <xsl:when test="$codePublisherID1='CAP'">Culture &amp; psychology</xsl:when>
            <xsl:when test="$codePublisherID1='CAT'">Clinical and applied thrombosis/hemostasis</xsl:when>
            <xsl:when test="$codePublisherID1='CBI'">Currents in biblical research</xsl:when>
            <xsl:when test="$codePublisherID1='CBR'">Compensation and benefits review</xsl:when>
            <xsl:when test="$codePublisherID1='CCJ'">Journal of contemporary criminal justice</xsl:when>
            <xsl:when test="$codePublisherID1='CCM'">International journal of cross cultural management</xsl:when>
            <xsl:when test="$codePublisherID1='CCP'">Clinical child psychology and psychiatry</xsl:when>
            <xsl:when test="$codePublisherID1='CCR'">Cross-cultural research</xsl:when>
            <xsl:when test="$codePublisherID1='CCS'">Clinical case studies</xsl:when>
            <xsl:when test="$codePublisherID1='CDE'">Career development and transition for exceptional individuals</xsl:when>
            <xsl:when test="$codePublisherID1='CDP'">Current directions in psychological science</xsl:when>
            <xsl:when test="$codePublisherID1='CDQ'">Communication disorders quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='CDY'">Cultural dynamics</xsl:when>
            <xsl:when test="$codePublisherID1='CED'">Education Dialogue (Bangalore)</xsl:when>
            <xsl:when test="$codePublisherID1='CEL'">Journal of cellular plastics</xsl:when>
            <xsl:when test="$codePublisherID1='CEP'">Cephalalgia (Oslo)</xsl:when>
            <xsl:when test="$codePublisherID1='CER'">Concurrent engineering, research and applications</xsl:when>
            <xsl:when test="$codePublisherID1='CGJ'">Cultural geographies</xsl:when>
            <xsl:when test="$codePublisherID1='CHC'">Journal of child health care</xsl:when>
            <xsl:when test="$codePublisherID1='CHD'">Childhood (Copenhagen)</xsl:when>
            <xsl:when test="$codePublisherID1='CHI'">Chronic illness</xsl:when>
            <xsl:when test="$codePublisherID1='CHP'">Journal of evidence-based complementary &amp; alternative medicine</xsl:when>
            <xsl:when test="$codePublisherID1='CHR'">China report (New Delhi)</xsl:when>
            <xsl:when test="$codePublisherID1='CIN'">China information</xsl:when>
            <xsl:when test="$codePublisherID1='CIS'">Contributions to Indian sociology</xsl:when>
            <xsl:when test="$codePublisherID1='CJB'">Criminal justice and behavior</xsl:when>
            <xsl:when test="$codePublisherID1='CJO'">Canadian journal of occupational therapy and physiotherapy</xsl:when>
            <xsl:when test="$codePublisherID1='CJP'">Criminal justice policy review</xsl:when>
            <xsl:when test="$codePublisherID1='CJR'">Criminal justice review (Atlanta, Ga.)</xsl:when>
            <xsl:when test="$codePublisherID1='CJS'">Canadian journal of school psychology</xsl:when>
            <xsl:when test="$codePublisherID1='CLA'">Clin-alert</xsl:when>
            <xsl:when test="$codePublisherID1='CLT'">Child language teaching and therapy</xsl:when>
            <xsl:when test="$codePublisherID1='CMC'">Crime, media, culture</xsl:when>
            <xsl:when test="$codePublisherID1='CMP'">Conflict management and peace science</xsl:when>
            <xsl:when test="$codePublisherID1='CMX'">Child maltreatment</xsl:when>
            <xsl:when test="$codePublisherID1='CNC'">Capital &amp; class</xsl:when>
            <xsl:when test="$codePublisherID1='CNR'">Clinical nursing research</xsl:when>
            <xsl:when test="$codePublisherID1='CNU'">European journal of cardiovascular nursing</xsl:when>
            <xsl:when test="$codePublisherID1='COA'">Critique of anthropology</xsl:when>
            <xsl:when test="$codePublisherID1='CON'">Convergence (London)</xsl:when>
            <xsl:when test="$codePublisherID1='CPJ'">Clinical pediatrics</xsl:when>
            <xsl:when test="$codePublisherID1='CPR'">European journal of preventive cardiology</xsl:when>
            <xsl:when test="$codePublisherID1='CPS'">Comparative political studies</xsl:when>
            <xsl:when test="$codePublisherID1='CPT'">Journal of cardiovascular pharmacology and therapeutics</xsl:when>
            <xsl:when test="$codePublisherID1='CQX'">Cornell hospitality quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='CRC'">Journal of Creative Communications</xsl:when>
            <xsl:when test="$codePublisherID1='CRD'">Chronic respiratory disease</xsl:when>
            <xsl:when test="$codePublisherID1='CRE'">Clinical rehabilitation</xsl:when>
            <xsl:when test="$codePublisherID1='CRJ'">Criminology &amp; criminal justice</xsl:when>
            <xsl:when test="$codePublisherID1='CRS'">Critical sociology</xsl:when>
            <xsl:when test="$codePublisherID1='CRW'">Community college review</xsl:when>
            <xsl:when test="$codePublisherID1='CRX'">Communication research</xsl:when>
            <xsl:when test="$codePublisherID1='CSC'">Cultural studies, critical methodologies</xsl:when>
            <xsl:when test="$codePublisherID1='CSI'">Current sociology</xsl:when>
            <xsl:when test="$codePublisherID1='CSP'">CSP. Critical social policy</xsl:when>
            <xsl:when test="$codePublisherID1='CSX'">Contemporary sociology (Washington)</xsl:when>
            <xsl:when test="$codePublisherID1='CTJ'">Clinical trials (London. Print)</xsl:when>
            <xsl:when test="$codePublisherID1='CTR'">Clothing and textiles research journal</xsl:when>
            <xsl:when test="$codePublisherID1='CTX'">Contexts (Berkeley, Calif.)</xsl:when>
            <xsl:when test="$codePublisherID1='CUS'">Cultural sociology</xsl:when>
            <xsl:when test="$codePublisherID1='DAS'">Discourse &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='DCM'">Discourse &amp; communication</xsl:when>
            <xsl:when test="$codePublisherID1='DEM'">Dementia (London)</xsl:when>
            <xsl:when test="$codePublisherID1='DIO'">Diogenes (English ed.)</xsl:when>
            <xsl:when test="$codePublisherID1='DIS'">Discourse studies</xsl:when>
            <xsl:when test="$codePublisherID1='DMS'">Journal of defense modeling and simulation</xsl:when>
            <xsl:when test="$codePublisherID1='DPS'">Journal of disability policy studies</xsl:when>
            <xsl:when test="$codePublisherID1='EAB'">Environment and behavior</xsl:when>
            <xsl:when test="$codePublisherID1='EAQ'">Educational administration quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='EAU'">Environment and urbanization</xsl:when>
            <xsl:when test="$codePublisherID1='EBX'">Journal of emotional and behavioral disorders</xsl:when>
            <xsl:when test="$codePublisherID1='ECL'">Journal of early childhood literacy</xsl:when>
            <xsl:when test="$codePublisherID1='ECR'">Journal of early childhood research</xsl:when>
            <xsl:when test="$codePublisherID1='ECS'">European journal of cultural studies</xsl:when>
            <xsl:when test="$codePublisherID1='EDM'">Journal of cognitive engineering and decision making</xsl:when>
            <xsl:when test="$codePublisherID1='EDQ'">Economic development quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='EDR'">Educational researcher</xsl:when>
            <xsl:when test="$codePublisherID1='EEG'">Clinical EEG and neuroscience</xsl:when>
            <xsl:when test="$codePublisherID1='EEP'">Eastern European politics and societies</xsl:when>
            <xsl:when test="$codePublisherID1='EHP'">Evaluation &amp; the health professions</xsl:when>
            <xsl:when test="$codePublisherID1='EHQ'">European history quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='EID'">Economic and industrial democracy</xsl:when>
            <xsl:when test="$codePublisherID1='EIM'">Engineering in medicine</xsl:when>
            <xsl:when test="$codePublisherID1='EJC'">European journal of communication (London)</xsl:when>
            <xsl:when test="$codePublisherID1='EJD'">European journal of industrial relations</xsl:when>
            <xsl:when test="$codePublisherID1='EJT'">European journal of international relations</xsl:when>
            <xsl:when test="$codePublisherID1='EJW'">European journal of women's studies</xsl:when>
            <xsl:when test="$codePublisherID1='EMA'">Educational management administration &amp; leadership</xsl:when>
            <xsl:when test="$codePublisherID1='EME'">Global journal of emerging market economies</xsl:when>
            <xsl:when test="$codePublisherID1='EMF'">Journal of Emerging Market Finance</xsl:when>
            <xsl:when test="$codePublisherID1='EMR'">Emotion review</xsl:when>
            <xsl:when test="$codePublisherID1='ENG'">Journal of English linguistics</xsl:when>
            <xsl:when test="$codePublisherID1='ENX'">Electronic news (Mahwah, N.J.)</xsl:when>
            <xsl:when test="$codePublisherID1='EPA'">Educational evaluation and policy analysis</xsl:when>
            <xsl:when test="$codePublisherID1='EPE'">European physical education review</xsl:when>
            <xsl:when test="$codePublisherID1='EPM'">Educational and psychological measurement</xsl:when>
            <xsl:when test="$codePublisherID1='EPT'">European journal of political theory</xsl:when>
            <xsl:when test="$codePublisherID1='EPX'">Educational policy (Los Altos, Calif.)</xsl:when>
            <xsl:when test="$codePublisherID1='ERG'">Ergonomics in design</xsl:when>
            <xsl:when test="$codePublisherID1='ERX'">Evaluation review</xsl:when>
            <xsl:when test="$codePublisherID1='ESJ'">Education, citizenship and social justice</xsl:when>
            <xsl:when test="$codePublisherID1='ESP'">Journal of European social policy</xsl:when>
            <xsl:when test="$codePublisherID1='EST'">European journal of social theory</xsl:when>
            <xsl:when test="$codePublisherID1='ETH'">Ethnography (London)</xsl:when>
            <xsl:when test="$codePublisherID1='ETN'">Ethnicities (London)</xsl:when>
            <xsl:when test="$codePublisherID1='EUC'">European journal of criminology</xsl:when>
            <xsl:when test="$codePublisherID1='EUP'">European Union politics</xsl:when>
            <xsl:when test="$codePublisherID1='EUR'">European urban and regional studies</xsl:when>
            <xsl:when test="$codePublisherID1='EUS'">Education and urban society</xsl:when>
            <xsl:when test="$codePublisherID1='EVI'">Evaluation (London. 1995)</xsl:when>
            <xsl:when test="$codePublisherID1='EXT'">Expository times</xsl:when>
            <xsl:when test="$codePublisherID1='FAP'">Feminism &amp; psychology</xsl:when>
            <xsl:when test="$codePublisherID1='FAS'">Foot &amp; ankle specialist</xsl:when>
            <xsl:when test="$codePublisherID1='FBR'">Family business review</xsl:when>
            <xsl:when test="$codePublisherID1='FCX'">Feminist criminology</xsl:when>
            <xsl:when test="$codePublisherID1='FLA'">First language</xsl:when>
            <xsl:when test="$codePublisherID1='FMX'">Field methods.</xsl:when>
            <xsl:when test="$codePublisherID1='FOA'">Focus on autism and other developmental disabilities</xsl:when>
            <xsl:when test="$codePublisherID1='FOI'">Forum italicum</xsl:when>
            <xsl:when test="$codePublisherID1='FRC'">French cultural studies (Chalfont St. Giles)</xsl:when>
            <xsl:when test="$codePublisherID1='FST'">Food science and technology international</xsl:when>
            <xsl:when test="$codePublisherID1='FTH'">Feminist theology</xsl:when>
            <xsl:when test="$codePublisherID1='FTY'">Feminist theory</xsl:when>
            <xsl:when test="$codePublisherID1='GAC'">Games and culture</xsl:when>
            <xsl:when test="$codePublisherID1='GAQ'">Group analysis</xsl:when>
            <xsl:when test="$codePublisherID1='GAS'">Gender &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='GAZ'">The international communication gazette</xsl:when>
            <xsl:when test="$codePublisherID1='GBR'">Global Business Review</xsl:when>
            <xsl:when test="$codePublisherID1='GCQ'">The Gifted child quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='GCT'">Gifted child today magazine</xsl:when>
            <xsl:when test="$codePublisherID1='GEI'">Gifted education international</xsl:when>
            <xsl:when test="$codePublisherID1='GMC'">Global media and communication</xsl:when>
            <xsl:when test="$codePublisherID1='GMT'">General music today</xsl:when>
            <xsl:when test="$codePublisherID1='GOM'">Group &amp; organization management</xsl:when>
            <xsl:when test="$codePublisherID1='GPI'">Group processes &amp; intergroup relations</xsl:when>
            <xsl:when test="$codePublisherID1='GSP'">Global social policy</xsl:when>
            <xsl:when test="$codePublisherID1='GTD'">Gender, Technology and Development</xsl:when>
            <xsl:when test="$codePublisherID1='HAS'">Humanity &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='HEA'">Health (London. 1997)</xsl:when>
            <xsl:when test="$codePublisherID1='HEJ'">Health education journal</xsl:when>
            <xsl:when test="$codePublisherID1='HET'">Human &amp; experimental toxicology</xsl:when>
            <xsl:when test="$codePublisherID1='HFS'">Human factors</xsl:when>
            <xsl:when test="$codePublisherID1='HHC'">Home health care management &amp; practice</xsl:when>
            <xsl:when test="$codePublisherID1='HHS'">History of the human sciences</xsl:when>
            <xsl:when test="$codePublisherID1='HIJ'">The international journal of press/politics</xsl:when>
            <xsl:when test="$codePublisherID1='HIP'">High performance polymers</xsl:when>
            <xsl:when test="$codePublisherID1='HJB'">Hispanic journal of behavioral sciences</xsl:when>
            <xsl:when test="$codePublisherID1='HOL'">Holocene (Sevenoaks)</xsl:when>
            <xsl:when test="$codePublisherID1='HPC'">The international journal of high performance computing applications</xsl:when>
            <xsl:when test="$codePublisherID1='HPP'">Health promotion practice</xsl:when>
            <xsl:when test="$codePublisherID1='HPQ'">Journal of health psychology</xsl:when>
            <xsl:when test="$codePublisherID1='HPY'">History of psychiatry</xsl:when>
            <xsl:when test="$codePublisherID1='HRD'">Human resource development review (Thousand Oaks, Calif.)</xsl:when>
            <xsl:when test="$codePublisherID1='HSB'">Journal of health and social behavior</xsl:when>
            <xsl:when test="$codePublisherID1='HSX'">Homicide studies</xsl:when>
            <xsl:when test="$codePublisherID1='HUM'">Human relations (New York)</xsl:when>
            <xsl:when test="$codePublisherID1='IAB'">International political science abstracts</xsl:when>
            <xsl:when test="$codePublisherID1='IAS'">International area studies review</xsl:when>
            <xsl:when test="$codePublisherID1='IBE'">Indoor + built environment</xsl:when>
            <xsl:when test="$codePublisherID1='ICJ'">International criminal justice review</xsl:when>
            <xsl:when test="$codePublisherID1='ICS'">International journal of cultural studies</xsl:when>
            <xsl:when test="$codePublisherID1='ICT'">Integrative cancer therapies</xsl:when>
            <xsl:when test="$codePublisherID1='IDV'">Information development</xsl:when>
            <xsl:when test="$codePublisherID1='IER'">Indian economic and social history review</xsl:when>
            <xsl:when test="$codePublisherID1='IFL'">IFLA journal</xsl:when>
            <xsl:when test="$codePublisherID1='IHR'">Indian historical review</xsl:when>
            <xsl:when test="$codePublisherID1='IJB'">International journal of bilingualism</xsl:when>
            <xsl:when test="$codePublisherID1='IJD'">International journal of damage mechanics</xsl:when>
            <xsl:when test="$codePublisherID1='IJL'">International journal of lower extremity wounds</xsl:when>
            <xsl:when test="$codePublisherID1='IJM'">International journal of music education</xsl:when>
            <xsl:when test="$codePublisherID1='IJO'">International journal of offender therapy</xsl:when>
            <xsl:when test="$codePublisherID1='IJR'">The international journal of robotics research</xsl:when>
            <xsl:when test="$codePublisherID1='IJS'">International journal of surgical pathology</xsl:when>
            <xsl:when test="$codePublisherID1='IJT'">International journal of toxicology</xsl:when>
            <xsl:when test="$codePublisherID1='IMP'">Improving schools</xsl:when>
            <xsl:when test="$codePublisherID1='INI'">Innate immunity</xsl:when>
            <xsl:when test="$codePublisherID1='INT'">Interpretation (Richmond)</xsl:when>
            <xsl:when test="$codePublisherID1='IOC'">Index on censorship</xsl:when>
            <xsl:when test="$codePublisherID1='IPS'">International political science review</xsl:when>
            <xsl:when test="$codePublisherID1='IRE'">International relations (London)</xsl:when>
            <xsl:when test="$codePublisherID1='IRM'">International Journal of Rural Management</xsl:when>
            <xsl:when test="$codePublisherID1='IRS'">International review for the sociology of sport</xsl:when>
            <xsl:when test="$codePublisherID1='IRV'">International review of victimology</xsl:when>
            <xsl:when test="$codePublisherID1='IRX'">International regional science review</xsl:when>
            <xsl:when test="$codePublisherID1='ISB'">International small business journal</xsl:when>
            <xsl:when test="$codePublisherID1='ISC'">Intervention in school and clinic</xsl:when>
            <xsl:when test="$codePublisherID1='ISP'">International journal of social psychiatry</xsl:when>
            <xsl:when test="$codePublisherID1='ISQ'">International Studies (New Delhi)</xsl:when>
            <xsl:when test="$codePublisherID1='ISS'">International sociology</xsl:when>
            <xsl:when test="$codePublisherID1='ISW'">International social work</xsl:when>
            <xsl:when test="$codePublisherID1='ITQ'">The Irish theological quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='IVI'">Information visualization</xsl:when>
            <xsl:when test="$codePublisherID1='JAB'">The Journal of applied behavioral science</xsl:when>
            <xsl:when test="$codePublisherID1='JAD'">Journal of attention disorders</xsl:when>
            <xsl:when test="$codePublisherID1='JAF'">Journal of accounting, auditing &amp; finance</xsl:when>
            <xsl:when test="$codePublisherID1='JAG'">Journal of applied gerontology</xsl:when>
            <xsl:when test="$codePublisherID1='JAH'">Journal of aging and health</xsl:when>
            <xsl:when test="$codePublisherID1='JAP'">Journal of the American Psychiatric Nurses Association</xsl:when>
            <xsl:when test="$codePublisherID1='JAR'">Journal of adolescent research</xsl:when>
            <xsl:when test="$codePublisherID1='JAS'">Journal of Asian and African studies (Leiden)</xsl:when>
            <xsl:when test="$codePublisherID1='JAX'">Journal of applied social science</xsl:when>
            <xsl:when test="$codePublisherID1='JBA'">Journal of biomaterials applications</xsl:when>
            <xsl:when test="$codePublisherID1='JBC'">Journal of bioactive and compatible polymers</xsl:when>
            <xsl:when test="$codePublisherID1='JBD'">International journal of behavioral development</xsl:when>
            <xsl:when test="$codePublisherID1='JBP'">Journal of black psychology</xsl:when>
            <xsl:when test="$codePublisherID1='JBR'">Journal of biological rhythms</xsl:when>
            <xsl:when test="$codePublisherID1='JBS'">Journal of black studies</xsl:when>
            <xsl:when test="$codePublisherID1='JBX'">Journal of biomolecular screening</xsl:when>
            <xsl:when test="$codePublisherID1='JCA'">Journal of career assessment</xsl:when>
            <xsl:when test="$codePublisherID1='JCC'">Journal of cross-cultural psychology</xsl:when>
            <xsl:when test="$codePublisherID1='JCD'">Journal of career development</xsl:when>
            <xsl:when test="$codePublisherID1='JCE'">Journal of contemporary ethnography</xsl:when>
            <xsl:when test="$codePublisherID1='JCH'">Journal of contemporary history</xsl:when>
            <xsl:when test="$codePublisherID1='JCI'">The Journal of communication inquiry</xsl:when>
            <xsl:when test="$codePublisherID1='JCL'">Journal of Commonwealth literature</xsl:when>
            <xsl:when test="$codePublisherID1='JCM'">Journal of composite materials</xsl:when>
            <xsl:when test="$codePublisherID1='JCN'">Journal of child neurology</xsl:when>
            <xsl:when test="$codePublisherID1='JCR'">Conflict resolution</xsl:when>
            <xsl:when test="$codePublisherID1='JCS'">Journal of classical sociology</xsl:when>
            <xsl:when test="$codePublisherID1='JCX'">Journal of correctional health care</xsl:when>
            <xsl:when test="$codePublisherID1='JDI'">International journal of discrimination and the law</xsl:when>
            <xsl:when test="$codePublisherID1='JDM'">Journal of diagnostic medical sonography</xsl:when>
            <xsl:when test="$codePublisherID1='JDS'">Journal of developing societies</xsl:when>
            <xsl:when test="$codePublisherID1='JEA'">The Journal of early adolescence</xsl:when>
            <xsl:when test="$codePublisherID1='JEB'">Journal of educational and behavioral statistics</xsl:when>
            <xsl:when test="$codePublisherID1='JED'">The Journal of environment &amp; development</xsl:when>
            <xsl:when test="$codePublisherID1='JEG'">Journal for the education of the gifted</xsl:when>
            <xsl:when test="$codePublisherID1='JEI'">Journal of early intervention</xsl:when>
            <xsl:when test="$codePublisherID1='JEN'">Journal of building physics</xsl:when>
            <xsl:when test="$codePublisherID1='JEP'">Journal of elastomers and plastics</xsl:when>
            <xsl:when test="$codePublisherID1='JES'">Journal of european studies</xsl:when>
            <xsl:when test="$codePublisherID1='JFE'">Journal of fire protection engineering</xsl:when>
            <xsl:when test="$codePublisherID1='JFH'">Journal of family history</xsl:when>
            <xsl:when test="$codePublisherID1='JFI'">Journal of family issues</xsl:when>
            <xsl:when test="$codePublisherID1='JFM'">Journal of feline medicine and surgery</xsl:when>
            <xsl:when test="$codePublisherID1='JFN'">Journal of family nursing</xsl:when>
            <xsl:when test="$codePublisherID1='JFS'">Journal of fire sciences</xsl:when>
            <xsl:when test="$codePublisherID1='JGM'">Journal of generic medicines</xsl:when>
            <xsl:when test="$codePublisherID1='JGP'">Journal of geriatric psychiatry and neurology</xsl:when>
            <xsl:when test="$codePublisherID1='JHH'">Journal of Hispanic higher education</xsl:when>
            <xsl:when test="$codePublisherID1='JHI'">Health informatics journal</xsl:when>
            <xsl:when test="$codePublisherID1='JHL'">Journal of human lactation</xsl:when>
            <xsl:when test="$codePublisherID1='JHM'">Journal of health management. (New Delhi. Print)</xsl:when>
            <xsl:when test="$codePublisherID1='JHN'">Journal of holistic nursing</xsl:when>
            <xsl:when test="$codePublisherID1='JHP'">Journal of humanistic psychology</xsl:when>
            <xsl:when test="$codePublisherID1='JHS'">Journal of hand surgery. European volume</xsl:when>
            <xsl:when test="$codePublisherID1='JHT'">Journal of hospitality &amp; tourism research (Washington, D.C. Print)</xsl:when>
            <xsl:when test="$codePublisherID1='JHV'">Journal of Human Values (New Delhi)</xsl:when>
            <xsl:when test="$codePublisherID1='JIA'">Journal of the International Association of Providers of AIDS Care</xsl:when>
            <xsl:when test="$codePublisherID1='JIC'">Journal of intensive care medicine</xsl:when>
            <xsl:when test="$codePublisherID1='JID'">Journal of intellectual disabilities</xsl:when>
            <xsl:when test="$codePublisherID1='JIL'">Journal of the Institution of Locomotive Engineers</xsl:when>
            <xsl:when test="$codePublisherID1='JIM'">Journal of intelligent material systems and structures</xsl:when>
            <xsl:when test="$codePublisherID1='JIR'">Journal of industrial relations</xsl:when>
            <xsl:when test="$codePublisherID1='JIS'">Journal of information science</xsl:when>
            <xsl:when test="$codePublisherID1='JIT'">Journal of industrial textiles</xsl:when>
            <xsl:when test="$codePublisherID1='JIV'">Journal of interpersonal violence</xsl:when>
            <xsl:when test="$codePublisherID1='JLO'">Journal of leadership &amp; organizational studies</xsl:when>
            <xsl:when test="$codePublisherID1='JLS'">Journal of language and social psychology</xsl:when>
            <xsl:when test="$codePublisherID1='JMC'">Journalism &amp; mass communication educator</xsl:when>
            <xsl:when test="$codePublisherID1='JMD'">Journal of marketing education</xsl:when>
            <xsl:when test="$codePublisherID1='JME'">Journal of management education (Newbury Park, Calif.)</xsl:when>
            <xsl:when test="$codePublisherID1='JMH'">American journal of men's health</xsl:when>
            <xsl:when test="$codePublisherID1='JMI'">Journal of management inquiry</xsl:when>
            <xsl:when test="$codePublisherID1='JMK'">Journal of macromarketing</xsl:when>
            <xsl:when test="$codePublisherID1='JMM'">Men and masculinities</xsl:when>
            <xsl:when test="$codePublisherID1='JMO'">Journalism &amp; communication monographs</xsl:when>
            <xsl:when test="$codePublisherID1='JMQ'">Journalism &amp; mass communication quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='JMS'">Journal of Mechanical Engineering Science</xsl:when>
            <xsl:when test="$codePublisherID1='JMT'">Journal of music teacher education</xsl:when>
            <xsl:when test="$codePublisherID1='JNT'">Journal for the study of the New Testament</xsl:when>
            <xsl:when test="$codePublisherID1='JOA'">Journal of advanced academics</xsl:when>
            <xsl:when test="$codePublisherID1='JOB'">Journal of business communication (1973)</xsl:when>
            <xsl:when test="$codePublisherID1='JOC'">Journal of consumer culture</xsl:when>
            <xsl:when test="$codePublisherID1='JOD'">Journal of drug issues</xsl:when>
            <xsl:when test="$codePublisherID1='JOE'">Journal of Entrepreneurship</xsl:when>
            <xsl:when test="$codePublisherID1='JOI'">Journal of infrastructure development</xsl:when>
            <xsl:when test="$codePublisherID1='JOM'">Journal of management</xsl:when>
            <xsl:when test="$codePublisherID1='JOP'">Journal of psychopharmacology (Oxford)</xsl:when>
            <xsl:when test="$codePublisherID1='JOS'">Journal of sociology (South Melbourne. Print)</xsl:when>
            <xsl:when test="$codePublisherID1='JOT'">Journal for the study of the Old Testament</xsl:when>
            <xsl:when test="$codePublisherID1='JOU'">Journalism (London)</xsl:when>
            <xsl:when test="$codePublisherID1='JPA'">Journal of psychoeducational assessment</xsl:when>
            <xsl:when test="$codePublisherID1='JPE'">Journal of planning education and research</xsl:when>
            <xsl:when test="$codePublisherID1='JPF'">Journal of plastic film &amp; sheeting</xsl:when>
            <xsl:when test="$codePublisherID1='JPH'">Journal of planning history</xsl:when>
            <xsl:when test="$codePublisherID1='JPL'">Journal of planning literature</xsl:when>
            <xsl:when test="$codePublisherID1='JPO'">Journal of pediatric oncology nursing</xsl:when>
            <xsl:when test="$codePublisherID1='JPP'">Journal of pharmacy practice</xsl:when>
            <xsl:when test="$codePublisherID1='JPR'">Journal of peace research</xsl:when>
            <xsl:when test="$codePublisherID1='JRC'">Journal of research in crime and delinquency</xsl:when>
            <xsl:when test="$codePublisherID1='JRI'">Journal of research in international education</xsl:when>
            <xsl:when test="$codePublisherID1='JRM'">Journal of research in music education</xsl:when>
            <xsl:when test="$codePublisherID1='JRN'">Journal of research in nursing</xsl:when>
            <xsl:when test="$codePublisherID1='JRP'">Journal of reinforced plastics and composites</xsl:when>
            <xsl:when test="$codePublisherID1='JSA'">Journal of social archaeology</xsl:when>
            <xsl:when test="$codePublisherID1='JSD'">Journal of education for sustainable development</xsl:when>
            <xsl:when test="$codePublisherID1='JSE'">Journal of sports economics</xsl:when>
            <xsl:when test="$codePublisherID1='JSI'">Journal of studies in international education</xsl:when>
            <xsl:when test="$codePublisherID1='JSM'">The journal of sandwich structures &amp; materials</xsl:when>
            <xsl:when test="$codePublisherID1='JSP'">Journal for the study of the pseudepigrapha</xsl:when>
            <xsl:when test="$codePublisherID1='JSR'">Journal of service research</xsl:when>
            <xsl:when test="$codePublisherID1='JSS'">Journal of sport and social issues</xsl:when>
            <xsl:when test="$codePublisherID1='JSW'">Journal of social work</xsl:when>
            <xsl:when test="$codePublisherID1='JTC'">Journal of thermoplastic composite materials</xsl:when>
            <xsl:when test="$codePublisherID1='JTD'">Journal of transformative education</xsl:when>
            <xsl:when test="$codePublisherID1='JTE'">Journal of teacher education</xsl:when>
            <xsl:when test="$codePublisherID1='JTP'">Journal of theoretical politics</xsl:when>
            <xsl:when test="$codePublisherID1='JTR'">Journal of travel research</xsl:when>
            <xsl:when test="$codePublisherID1='JUH'">Journal of urban history</xsl:when>
            <xsl:when test="$codePublisherID1='JVC'">Journal of vibration and control</xsl:when>
            <xsl:when test="$codePublisherID1='JVM'">Journal of vacation marketing</xsl:when>
            <xsl:when test="$codePublisherID1='LAL'">Language and literature (Harlow)</xsl:when>
            <xsl:when test="$codePublisherID1='LAP'">Latin American perspectives</xsl:when>
            <xsl:when test="$codePublisherID1='LAS'">Language and speech</xsl:when>
            <xsl:when test="$codePublisherID1='LCH'">Law, culture and the humanities</xsl:when>
            <xsl:when test="$codePublisherID1='LDQ'">Learning disability quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='LDX'">Journal of learning disabilities</xsl:when>
            <xsl:when test="$codePublisherID1='LEA'">Leadership (London. Print)</xsl:when>
            <xsl:when test="$codePublisherID1='LEC'">Local economy</xsl:when>
            <xsl:when test="$codePublisherID1='LIS'">Journal of librarianship and information science</xsl:when>
            <xsl:when test="$codePublisherID1='LRT'">Lighting research and technology (2001. Print)</xsl:when>
            <xsl:when test="$codePublisherID1='LSJ'">Labor studies journal</xsl:when>
            <xsl:when test="$codePublisherID1='LTJ'">Language testing</xsl:when>
            <xsl:when test="$codePublisherID1='LTR'">Language teaching research</xsl:when>
            <xsl:when test="$codePublisherID1='LUP'">Lupus (Basingstoke)</xsl:when>
            <xsl:when test="$codePublisherID1='MAR'">Margin - the journal of applied economic research</xsl:when>
            <xsl:when test="$codePublisherID1='MCQ'">Management communication quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='MCR'">Medical care research and review</xsl:when>
            <xsl:when test="$codePublisherID1='MCS'">Media, culture &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='MCU'">Journal of material culture</xsl:when>
            <xsl:when test="$codePublisherID1='MCX'">Modern China</xsl:when>
            <xsl:when test="$codePublisherID1='MDM'">Medical decision making</xsl:when>
            <xsl:when test="$codePublisherID1='MEC'">Measurement and evaluation in counseling and development</xsl:when>
            <xsl:when test="$codePublisherID1='MEJ'">Music educators journal</xsl:when>
            <xsl:when test="$codePublisherID1='MHJ'">The Medieval History Journal</xsl:when>
            <xsl:when test="$codePublisherID1='MIE'">Management in education</xsl:when>
            <xsl:when test="$codePublisherID1='MIL'">Millennium</xsl:when>
            <xsl:when test="$codePublisherID1='MLI'">Medical law international</xsl:when>
            <xsl:when test="$codePublisherID1='MLQ'">Management learning</xsl:when>
            <xsl:when test="$codePublisherID1='MLS'">Management and labour studies</xsl:when>
            <xsl:when test="$codePublisherID1='MMD'">Music and medicine</xsl:when>
            <xsl:when test="$codePublisherID1='MMJ'">Journal of medical marketing</xsl:when>
            <xsl:when test="$codePublisherID1='MMR'">Journal of mixed methods research</xsl:when>
            <xsl:when test="$codePublisherID1='MMS'">Mathematics and mechanics of solids</xsl:when>
            <xsl:when test="$codePublisherID1='MSJ'">Multiple sclerosis</xsl:when>
            <xsl:when test="$codePublisherID1='MSS'">Memory studies</xsl:when>
            <xsl:when test="$codePublisherID1='MSX'">Musicae scientiae</xsl:when>
            <xsl:when test="$codePublisherID1='MTQ'">Marketing theory</xsl:when>
            <xsl:when test="$codePublisherID1='MWC'">Media, war &amp; conflict</xsl:when>
            <xsl:when test="$codePublisherID1='NAH'">Nutrition and health (Berkhamstead)</xsl:when>
            <xsl:when test="$codePublisherID1='NCP'">Nutrition in clinical practice</xsl:when>
            <xsl:when test="$codePublisherID1='NEJ'">Nursing ethics</xsl:when>
            <xsl:when test="$codePublisherID1='NER'">National Institute economic review</xsl:when>
            <xsl:when test="$codePublisherID1='NMS'">New media &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='NNR'">Neurorehabilitation and neural repair</xsl:when>
            <xsl:when test="$codePublisherID1='NRO'">The Neuroscientist (Baltimore, Md.)</xsl:when>
            <xsl:when test="$codePublisherID1='NSQ'">Nursing science quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='NVS'">Nonprofit and voluntary sector quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='OAE'">Organization &amp; environment</xsl:when>
            <xsl:when test="$codePublisherID1='OPP'">Journal of oncology pharmacy practice</xsl:when>
            <xsl:when test="$codePublisherID1='ORG'">Organization (London)</xsl:when>
            <xsl:when test="$codePublisherID1='ORM'">Organizational research methods</xsl:when>
            <xsl:when test="$codePublisherID1='OSS'">Organization studies</xsl:when>
            <xsl:when test="$codePublisherID1='PAA'">Pacifica (Brunswick)</xsl:when>
            <xsl:when test="$codePublisherID1='PAD'">Proceedings of the Institution of Mechanical Engineers, Automobile Division</xsl:when>
            <xsl:when test="$codePublisherID1='PAS'">Politics &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='PAU'">Proceedings - Institution of Automobile Engineers; London</xsl:when>
            <xsl:when test="$codePublisherID1='PBI'">Journal of positive behavior interventions</xsl:when>
            <xsl:when test="$codePublisherID1='PCP'">Proceedings of the Institution of Mechanical Engineers Conference Proceedings Volumes 178-184</xsl:when>
            <xsl:when test="$codePublisherID1='PDS'">Psychology and developing societies</xsl:when>
            <xsl:when test="$codePublisherID1='PED'">Global health promotion</xsl:when>
            <xsl:when test="$codePublisherID1='PEN'">JPEN. Journal of parenteral and enteral nutrition</xsl:when>
            <xsl:when test="$codePublisherID1='PFR'">Public finance review</xsl:when>
            <xsl:when test="$codePublisherID1='PIA'">Progress in development studies</xsl:when>
            <xsl:when test="$codePublisherID1='PIB'">Proceedings of the Institution of Mechanical Engineers. Part B: Journal of engineering manufacture</xsl:when>
            <xsl:when test="$codePublisherID1='PIC'">Proceedings of the Institution of Mechanical Engineers. Part C: Journal of mechanical engineering science</xsl:when>
            <xsl:when test="$codePublisherID1='PID'">Proceedings of the Institution of Mechanical Engineers. Part D: Journal of automobile engineering</xsl:when>
            <xsl:when test="$codePublisherID1='PIE'">Proceedings of the Institution of Mechanical Engineers. Part E: Journal of process mechanical engineering</xsl:when>
            <xsl:when test="$codePublisherID1='PIF'">Proceedings of the Institution of Mechanical Engineers. Part F: Journal of rail and rapid transit</xsl:when>
            <xsl:when test="$codePublisherID1='PIG'">Proceedings of the Institution of Mechanical Engineers. Part G: Journal of aerospace engineering</xsl:when>
            <xsl:when test="$codePublisherID1='PIH'">Proceedings of the Institution of Mechanical Engineers. Part H: Journal of engineering in medicine</xsl:when>
            <xsl:when test="$codePublisherID1='PII'">Proceedings of the Institution of Mechanical Engineers. Part I: Journal of systems and control engineering</xsl:when>
            <xsl:when test="$codePublisherID1='PIJ'">Proceedings of the Institution of Mechanical Engineers. Part J: Journal of engineering tribology</xsl:when>
            <xsl:when test="$codePublisherID1='PIK'">Proceedings of the Institution of Mechanical Engineers, Part K: Journal of Multi-body Dynamics</xsl:when>
            <xsl:when test="$codePublisherID1='PIL'">Proceedings of the Institution of Mechanical Engineers, Part L: Journal of Materials: Design and Applications</xsl:when>
            <xsl:when test="$codePublisherID1='PIM'">Proceedings of the Institution of Mechanical Engineers, Part M: Journal of Engineering for the Maritime Environment</xsl:when>
            <xsl:when test="$codePublisherID1='PIN'">Proceedings of the Institution of Mechanical Engineers, Part N: Journal of Nanoengineering and Nanosystems</xsl:when>
            <xsl:when test="$codePublisherID1='PIO'">Proceedings of the Institution of Mechanical Engineers, Part O: Journal of Risk and Reliability</xsl:when>
            <xsl:when test="$codePublisherID1='PIP'">Proceedings of the Institution of Mechanical Engineers, Part P: Journal of Sports Engineering and Technology</xsl:when>
            <xsl:when test="$codePublisherID1='PLT'">Planning theory</xsl:when>
            <xsl:when test="$codePublisherID1='PME'">Proceedings - Institution of Mechanical Engineers</xsl:when>
            <xsl:when test="$codePublisherID1='PMJ'">Palliative medicine</xsl:when>
            <xsl:when test="$codePublisherID1='PNZ'">Political science</xsl:when>
            <xsl:when test="$codePublisherID1='POM'">Psychology of music</xsl:when>
            <xsl:when test="$codePublisherID1='POS'">Philosophy of the social sciences</xsl:when>
            <xsl:when test="$codePublisherID1='PPA'">Public policy and administration</xsl:when>
            <xsl:when test="$codePublisherID1='PPE'">Politics, philosophy &amp; economics</xsl:when>
            <xsl:when test="$codePublisherID1='PPG'">Progress in physical geography</xsl:when>
            <xsl:when test="$codePublisherID1='PPN'">Policy, politics &amp; nursing practice</xsl:when>
            <xsl:when test="$codePublisherID1='PPQ'">Party politics</xsl:when>
            <xsl:when test="$codePublisherID1='PPS'">Perspectives on psychological science</xsl:when>
            <xsl:when test="$codePublisherID1='PQX'">Police quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='PRB'">Probation journal</xsl:when>
            <xsl:when test="$codePublisherID1='PRF'">Perfusion</xsl:when>
            <xsl:when test="$codePublisherID1='PRQ'">Political research quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='PSC'">Philosophy &amp; social criticism</xsl:when>
            <xsl:when test="$codePublisherID1='PSP'">Personality &amp; social psychology bulletin</xsl:when>
            <xsl:when test="$codePublisherID1='PSR'">Personality and social psychology review</xsl:when>
            <xsl:when test="$codePublisherID1='PSS'">Psychological science</xsl:when>
            <xsl:when test="$codePublisherID1='PTX'">Political theory</xsl:when>
            <xsl:when test="$codePublisherID1='PUN'">Punishment &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='PUS'">Public understanding of science</xsl:when>
            <xsl:when test="$codePublisherID1='PVS'">Perspectives in vascular surgery and endovascular therapy</xsl:when>
            <xsl:when test="$codePublisherID1='PWM'">Public works management &amp; policy</xsl:when>
            <xsl:when test="$codePublisherID1='PWQ'">Psychology of Women Quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='QHR'">Qualitative health research</xsl:when>
            <xsl:when test="$codePublisherID1='QIX'">Qualitative inquiry</xsl:when>
            <xsl:when test="$codePublisherID1='QRJ'">Qualitative research</xsl:when>
            <xsl:when test="$codePublisherID1='QSW'">Qualitative social work</xsl:when>
            <xsl:when test="$codePublisherID1='RAC'">Race &amp; class</xsl:when>
            <xsl:when test="$codePublisherID1='RAS'">International review of administrative sciences</xsl:when>
            <xsl:when test="$codePublisherID1='RCB'">Rehabilitation counseling bulletin</xsl:when>
            <xsl:when test="$codePublisherID1='REA'">Research ethics review</xsl:when>
            <xsl:when test="$codePublisherID1='REL'">RELC journal</xsl:when>
            <xsl:when test="$codePublisherID1='RER'">Review of educational research</xsl:when>
            <xsl:when test="$codePublisherID1='REV'">Review of human factors and ergonomics</xsl:when>
            <xsl:when test="$codePublisherID1='RMI'">Review of market integration</xsl:when>
            <xsl:when test="$codePublisherID1='ROA'">Research on aging</xsl:when>
            <xsl:when test="$codePublisherID1='ROP'">Review of public personnel administration</xsl:when>
            <xsl:when test="$codePublisherID1='RRE'">Review of research in education</xsl:when>
            <xsl:when test="$codePublisherID1='RRP'">The Review of radical political economics</xsl:when>
            <xsl:when test="$codePublisherID1='RSH'">Perspectives in public health</xsl:when>
            <xsl:when test="$codePublisherID1='RSM'">Research studies in music education</xsl:when>
            <xsl:when test="$codePublisherID1='RSS'">Rationality and society</xsl:when>
            <xsl:when test="$codePublisherID1='RSW'">Research on social work practice</xsl:when>
            <xsl:when test="$codePublisherID1='RSX'">Reproductive sciences (Thousand Oaks, Calif.)</xsl:when>
            <xsl:when test="$codePublisherID1='SAC'">Space and culture</xsl:when>
            <xsl:when test="$codePublisherID1='SAD'">Journal of South Asian Development</xsl:when>
            <xsl:when test="$codePublisherID1='SAE'">South Asia Economic Journal</xsl:when>
            <xsl:when test="$codePublisherID1='SAG'">Simulation &amp; gaming</xsl:when>
            <xsl:when test="$codePublisherID1='SAR'">South Asia research</xsl:when>
            <xsl:when test="$codePublisherID1='SAS'">South Asia survey</xsl:when>
            <xsl:when test="$codePublisherID1='SAX'">Sexual abuse</xsl:when>
            <xsl:when test="$codePublisherID1='SCE'">Studies in Christian ethics</xsl:when>
            <xsl:when test="$codePublisherID1='SCH'">Social change (New Delhi)</xsl:when>
            <xsl:when test="$codePublisherID1='SCP'">Social Compass</xsl:when>
            <xsl:when test="$codePublisherID1='SCV'">Seminars in cardiothoracic and vascular anesthesia</xsl:when>
            <xsl:when test="$codePublisherID1='SCX'">Science communication</xsl:when>
            <xsl:when test="$codePublisherID1='SDI'">Security dialogue</xsl:when>
            <xsl:when test="$codePublisherID1='SDJ'">Progress in human geography</xsl:when>
            <xsl:when test="$codePublisherID1='SED'">The Journal of special education</xsl:when>
            <xsl:when test="$codePublisherID1='SEX'">Sexualities (London)</xsl:when>
            <xsl:when test="$codePublisherID1='SGR'">International journal of small group research</xsl:when>
            <xsl:when test="$codePublisherID1='SHM'">Structural health monitoring</xsl:when>
            <xsl:when test="$codePublisherID1='SIH'">Studies in History</xsl:when>
            <xsl:when test="$codePublisherID1='SIM'">Transactions of the Society for Computer Simulation</xsl:when>
            <xsl:when test="$codePublisherID1='SIR'">Studies in religion</xsl:when>
            <xsl:when test="$codePublisherID1='SJP'">Scandinavian journal of public health</xsl:when>
            <xsl:when test="$codePublisherID1='SLG'">State &amp; local government review</xsl:when>
            <xsl:when test="$codePublisherID1='SLR'">Second language research</xsl:when>
            <xsl:when test="$codePublisherID1='SLS'">Social &amp; legal studies</xsl:when>
            <xsl:when test="$codePublisherID1='SMJ'">Statistical modelling</xsl:when>
            <xsl:when test="$codePublisherID1='SMM'">Statistical methods in medical research</xsl:when>
            <xsl:when test="$codePublisherID1='SMQ'">Social marketing quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='SMR'">Sociological methods &amp; research</xsl:when>
            <xsl:when test="$codePublisherID1='SMX'">Sociological methodology</xsl:when>
            <xsl:when test="$codePublisherID1='SOC'">Sociology (Oxford. Print)</xsl:when>
            <xsl:when test="$codePublisherID1='SOE'">Sociology of education</xsl:when>
            <xsl:when test="$codePublisherID1='SOQ'">Strategic organization</xsl:when>
            <xsl:when test="$codePublisherID1='SPA'">State politics &amp; policy quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='SPH'">Sports health (Thousand Oaks, CA)</xsl:when>
            <xsl:when test="$codePublisherID1='SPI'">School psychology international</xsl:when>
            <xsl:when test="$codePublisherID1='SPQ'">Social psychology quarterly</xsl:when>
            <xsl:when test="$codePublisherID1='SPR'">Journal of social and personal relationships</xsl:when>
            <xsl:when test="$codePublisherID1='SRI'">Surgical innovation</xsl:when>
            <xsl:when test="$codePublisherID1='SSC'">Social science computer review</xsl:when>
            <xsl:when test="$codePublisherID1='SSI'">Information sur les sciences sociales (Paris)</xsl:when>
            <xsl:when test="$codePublisherID1='SSS'">Social studies of science</xsl:when>
            <xsl:when test="$codePublisherID1='STH'">Science, technology, &amp; human values</xsl:when>
            <xsl:when test="$codePublisherID1='STS'">Science, Technology and Society</xsl:when>
            <xsl:when test="$codePublisherID1='STX'">Sociological theory</xsl:when>
            <xsl:when test="$codePublisherID1='TAB'">Therapeutic advances in musculoskeletal disease</xsl:when>
            <xsl:when test="$codePublisherID1='TAG'">Therapeutic advances in gastroenterology</xsl:when>
            <xsl:when test="$codePublisherID1='TAK'">Therapeutic advances in cardiovascular disease</xsl:when>
            <xsl:when test="$codePublisherID1='TAM'">Therapeutic advances in medical oncology</xsl:when>
            <xsl:when test="$codePublisherID1='TAN'">Therapeutic advances in neurological disorders</xsl:when>
            <xsl:when test="$codePublisherID1='TAP'">Theory &amp; psychology</xsl:when>
            <xsl:when test="$codePublisherID1='TAR'">Therapeutic advances in respiratory disease</xsl:when>
            <xsl:when test="$codePublisherID1='TAS'">Time &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='TAU'">Therapeutic advances in urology</xsl:when>
            <xsl:when test="$codePublisherID1='TCN'">Journal of transcultural nursing</xsl:when>
            <xsl:when test="$codePublisherID1='TCP'">The Counseling psychologist</xsl:when>
            <xsl:when test="$codePublisherID1='TCR'">Theoretical criminology</xsl:when>
            <xsl:when test="$codePublisherID1='TCS'">Theory, culture &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='TDE'">The Diabetes educator</xsl:when>
            <xsl:when test="$codePublisherID1='TEC'">Topics in early childhood special education</xsl:when>
            <xsl:when test="$codePublisherID1='TES'">Teacher education and special education</xsl:when>
            <xsl:when test="$codePublisherID1='TFJ'">The Family journal (Alexandria, Va.)</xsl:when>
            <xsl:when test="$codePublisherID1='THE'">Thesis eleven</xsl:when>
            <xsl:when test="$codePublisherID1='THR'">Tourism and hospitality research</xsl:when>
            <xsl:when test="$codePublisherID1='TIA'">Trends in amplification</xsl:when>
            <xsl:when test="$codePublisherID1='TIH'">Toxicology and industrial health</xsl:when>
            <xsl:when test="$codePublisherID1='TIM'">Transactions of the Institute of Measurement and Control</xsl:when>
            <xsl:when test="$codePublisherID1='TJX'">Theology (Norwich)</xsl:when>
            <xsl:when test="$codePublisherID1='TMT'">Traumatology (Tallahassee, Fla. Print)</xsl:when>
            <xsl:when test="$codePublisherID1='TOP'">Teaching of psychology</xsl:when>
            <xsl:when test="$codePublisherID1='TOU'">Tourist studies</xsl:when>
            <xsl:when test="$codePublisherID1='TPA'">Teaching public administration</xsl:when>
            <xsl:when test="$codePublisherID1='TPJ'">The Prison journal (Philadelphia, Pa.)</xsl:when>
            <xsl:when test="$codePublisherID1='TPS'">Transcultural psychiatry</xsl:when>
            <xsl:when test="$codePublisherID1='TRA'">Trauma (London)</xsl:when>
            <xsl:when test="$codePublisherID1='TRE'">Theory and research in education</xsl:when>
            <xsl:when test="$codePublisherID1='TRJ'">Textile research journal</xsl:when>
            <xsl:when test="$codePublisherID1='TRN'">Transformation (Exeter)</xsl:when>
            <xsl:when test="$codePublisherID1='TRS'">Transfer (Brussels)</xsl:when>
            <xsl:when test="$codePublisherID1='TSO'">Teaching sociology</xsl:when>
            <xsl:when test="$codePublisherID1='TTJ'">Theology today (Princeton, N.J.)</xsl:when>
            <xsl:when test="$codePublisherID1='TVA'">Trauma, violence &amp; abuse</xsl:when>
            <xsl:when test="$codePublisherID1='TVN'">Television &amp; new media</xsl:when>
            <xsl:when test="$codePublisherID1='UAR'">Urban affairs review (Thousand Oaks, Calif.)</xsl:when>
            <xsl:when test="$codePublisherID1='UEX'">Urban education (Beverly Hills, Calif.)</xsl:when>
            <xsl:when test="$codePublisherID1='UIX'">Ultrasonic imaging</xsl:when>
            <xsl:when test="$codePublisherID1='UPD'">Update: Applications of Research in Music Education</xsl:when>
            <xsl:when test="$codePublisherID1='USJ'">Urban studies (Harlow. Print)</xsl:when>
            <xsl:when test="$codePublisherID1='VAW'">Violence against women</xsl:when>
            <xsl:when test="$codePublisherID1='VCJ'">Visual communication</xsl:when>
            <xsl:when test="$codePublisherID1='VCU'">Journal of visual culture</xsl:when>
            <xsl:when test="$codePublisherID1='VES'">Vascular and endovascular surgery</xsl:when>
            <xsl:when test="$codePublisherID1='VIS'">Vision (New Delhi)</xsl:when>
            <xsl:when test="$codePublisherID1='WCX'">Written communication</xsl:when>
            <xsl:when test="$codePublisherID1='WES'">Work, employment and society</xsl:when>
            <xsl:when test="$codePublisherID1='WIH'">War in history</xsl:when>
            <xsl:when test="$codePublisherID1='WJN'">Western journal of nursing research</xsl:when>
            <xsl:when test="$codePublisherID1='WOM'">Word of mouth (San Antonio, Tex.)</xsl:when>
            <xsl:when test="$codePublisherID1='WOX'">Work and occupations</xsl:when>
            <xsl:when test="$codePublisherID1='WPJ'">World policy journal</xsl:when>
            <xsl:when test="$codePublisherID1='YAS'">Youth &amp; society</xsl:when>
            <xsl:when test="$codePublisherID1='YEC'">Young exceptional children</xsl:when>
            <xsl:when test="$codePublisherID1='YJJ'">Youth justice</xsl:when>
            <xsl:when test="$codePublisherID1='YOU'">Young (Stockholm. 1993)</xsl:when>
            <xsl:when test="$codePublisherID1='YVJ'">Youth violence and juvenile justice</xsl:when>
            <xsl:when test="//journal-id[@journal-id-type='isbn']='978-0-85404-169-5'"><title>Nanotechnologies in Food</title></xsl:when>
            <xsl:when test="//journal-id[@journal-id-type='isbn']='978-1-84755-916-6'"><title>Handbook of Culture Media for Food and Water Microbiology (3rd Edition)</title></xsl:when>
        </xsl:choose>
    </xsl:variable>
        
    <!-- SAGE - ajout des issns -->
    <xsl:variable name="repriseISSNCode">
        <xsl:choose>
            <xsl:when test="$codePublisherID1='AAF'">0308-5759</xsl:when>
            <xsl:when test="$codePublisherID1='AAS'">0095-3997</xsl:when>
            <xsl:when test="$codePublisherID1='ABS'">0002-7642</xsl:when>
            <xsl:when test="$codePublisherID1='ACD'">1038-4162</xsl:when>
            <xsl:when test="$codePublisherID1='ACH'">1032-3732</xsl:when>
            <xsl:when test="$codePublisherID1='ADB'">1059-7123</xsl:when>
            <xsl:when test="$codePublisherID1='ADH'">1523-4223</xsl:when>
            <xsl:when test="$codePublisherID1='AED'">0004-9441</xsl:when>
            <xsl:when test="$codePublisherID1='AEI'">1534-5084</xsl:when>
            <xsl:when test="$codePublisherID1='AEQ'">0001-8481</xsl:when>
            <xsl:when test="$codePublisherID1='AER'">0002-8312</xsl:when>
            <xsl:when test="$codePublisherID1='AES'">1090-820X</xsl:when>
            <xsl:when test="$codePublisherID1='AFF'">0886-1099</xsl:when>
            <xsl:when test="$codePublisherID1='AFS'">0095-327X</xsl:when>
            <xsl:when test="$codePublisherID1='AHH'">1474-0222</xsl:when>
            <xsl:when test="$codePublisherID1='AJA'">1533-3175</xsl:when>
            <xsl:when test="$codePublisherID1='AJC'">0972-8201</xsl:when>
            <xsl:when test="$codePublisherID1='AJE'">1098-2140</xsl:when>
            <xsl:when test="$codePublisherID1='AJH'">1049-9091</xsl:when>
            <xsl:when test="$codePublisherID1='AJL'">1559-8276</xsl:when>
            <xsl:when test="$codePublisherID1='AJM'">1062-8606</xsl:when>
            <xsl:when test="$codePublisherID1='AJS'">0363-5465</xsl:when>
            <xsl:when test="$codePublisherID1='ALH'">1469-7874</xsl:when>
            <xsl:when test="$codePublisherID1='ALT'">0304-3754</xsl:when>
            <xsl:when test="$codePublisherID1='ANG'">0506-4287</xsl:when>
            <xsl:when test="$codePublisherID1='ANJ'">0004-8658</xsl:when>
            <xsl:when test="$codePublisherID1='ANM'">1746-8477</xsl:when>
            <xsl:when test="$codePublisherID1='ANN'">0002-7162</xsl:when>
            <xsl:when test="$codePublisherID1='ANP'">0004-8674</xsl:when>
            <xsl:when test="$codePublisherID1='ANT'">1463-4996</xsl:when>
            <xsl:when test="$codePublisherID1='APA'">0003-0651</xsl:when>
            <xsl:when test="$codePublisherID1='APH'">1010-5395</xsl:when>
            <xsl:when test="$codePublisherID1='APM'">0146-6216</xsl:when>
            <xsl:when test="$codePublisherID1='APR'">1532-673X</xsl:when>
            <xsl:when test="$codePublisherID1='APY'">1039-8562</xsl:when>
            <xsl:when test="$codePublisherID1='ARJ'">1476-7503</xsl:when>
            <xsl:when test="$codePublisherID1='ARP'">0275-0740</xsl:when>
            <xsl:when test="$codePublisherID1='ASJ'">0001-6993</xsl:when>
            <xsl:when test="$codePublisherID1='ASM'">1073-1911</xsl:when>
            <xsl:when test="$codePublisherID1='ASQ'">0001-8392</xsl:when>
            <xsl:when test="$codePublisherID1='ASR'">0003-1224</xsl:when>
            <xsl:when test="$codePublisherID1='AUM'">0312-8962</xsl:when>
            <xsl:when test="$codePublisherID1='AUT'">1362-3613</xsl:when>
            <xsl:when test="$codePublisherID1='BAS'">0007-6503</xsl:when>
            <xsl:when test="$codePublisherID1='BCQ'">1080-5699</xsl:when>
            <xsl:when test="$codePublisherID1='BIR'">0266-3821</xsl:when>
            <xsl:when test="$codePublisherID1='BJI'">1757-1774</xsl:when>
            <xsl:when test="$codePublisherID1='BJP'">2049-4637</xsl:when>
            <xsl:when test="$codePublisherID1='BJR'">0956-4748</xsl:when>
            <xsl:when test="$codePublisherID1='BMO'">0145-4455</xsl:when>
            <xsl:when test="$codePublisherID1='BMS'">0759-1063</xsl:when>
            <xsl:when test="$codePublisherID1='BOD'">1357-034X</xsl:when>
            <xsl:when test="$codePublisherID1='BOS'">0096-3402</xsl:when>
            <xsl:when test="$codePublisherID1='BRN'">1099-8004</xsl:when>
            <xsl:when test="$codePublisherID1='BSE'">0143-6244</xsl:when>
            <xsl:when test="$codePublisherID1='BST'">0270-4676</xsl:when>
            <xsl:when test="$codePublisherID1='BTB'">0146-1079</xsl:when>
            <xsl:when test="$codePublisherID1='BUL'">0192-6365</xsl:when>
            <xsl:when test="$codePublisherID1='CAC'">0010-8367</xsl:when>
            <xsl:when test="$codePublisherID1='CAD'">0011-1287</xsl:when>
            <xsl:when test="$codePublisherID1='CAN'">1941-4064</xsl:when>
            <xsl:when test="$codePublisherID1='CAP'">1354-067X</xsl:when>
            <xsl:when test="$codePublisherID1='CAT'">1076-0296</xsl:when>
            <xsl:when test="$codePublisherID1='CBI'">1476-993X</xsl:when>
            <xsl:when test="$codePublisherID1='CBR'">0886-3687</xsl:when>
            <xsl:when test="$codePublisherID1='CCJ'">1043-9862</xsl:when>
            <xsl:when test="$codePublisherID1='CCM'">1470-5958</xsl:when>
            <xsl:when test="$codePublisherID1='CCP'">1359-1045</xsl:when>
            <xsl:when test="$codePublisherID1='CCR'">1069-3971</xsl:when>
            <xsl:when test="$codePublisherID1='CCS'">1534-6501</xsl:when>
            <xsl:when test="$codePublisherID1='CDE'">2165-1434</xsl:when>
            <xsl:when test="$codePublisherID1='CDP'">0963-7214</xsl:when>
            <xsl:when test="$codePublisherID1='CDQ'">1525-7401</xsl:when>
            <xsl:when test="$codePublisherID1='CDY'">0921-3740</xsl:when>
            <xsl:when test="$codePublisherID1='CED'">0973-1849</xsl:when>
            <xsl:when test="$codePublisherID1='CEL'">0021-955X</xsl:when>
            <xsl:when test="$codePublisherID1='CEP'">0333-1024</xsl:when>
            <xsl:when test="$codePublisherID1='CER'">1063-293X</xsl:when>
            <xsl:when test="$codePublisherID1='CGJ'">1474-4740</xsl:when>
            <xsl:when test="$codePublisherID1='CHC'">1367-4935</xsl:when>
            <xsl:when test="$codePublisherID1='CHD'">0907-5682</xsl:when>
            <xsl:when test="$codePublisherID1='CHI'">1742-3953</xsl:when>
            <xsl:when test="$codePublisherID1='CHP'">2156-5872</xsl:when>
            <xsl:when test="$codePublisherID1='CHR'">0009-4455</xsl:when>
            <xsl:when test="$codePublisherID1='CIN'">0920-203X</xsl:when>
            <xsl:when test="$codePublisherID1='CIS'">0069-9667</xsl:when>
            <xsl:when test="$codePublisherID1='CJB'">0093-8548</xsl:when>
            <xsl:when test="$codePublisherID1='CJO'">0315-1034</xsl:when>
            <xsl:when test="$codePublisherID1='CJP'">0887-4034</xsl:when>
            <xsl:when test="$codePublisherID1='CJR'">0734-0168</xsl:when>
            <xsl:when test="$codePublisherID1='CJS'">0829-5735</xsl:when>
            <xsl:when test="$codePublisherID1='CLA'">0069-4770</xsl:when>
            <xsl:when test="$codePublisherID1='CLT'">0265-6590</xsl:when>
            <xsl:when test="$codePublisherID1='CMC'">1741-6590</xsl:when>
            <xsl:when test="$codePublisherID1='CMP'">0738-8942</xsl:when>
            <xsl:when test="$codePublisherID1='CMX'">1077-5595</xsl:when>
            <xsl:when test="$codePublisherID1='CNC'">0309-8168</xsl:when>
            <xsl:when test="$codePublisherID1='CNR'">1054-7738</xsl:when>
            <xsl:when test="$codePublisherID1='CNU'">1474-5151</xsl:when>
            <xsl:when test="$codePublisherID1='COA'">0308-275X</xsl:when>
            <xsl:when test="$codePublisherID1='CON'">1354-8565</xsl:when>
            <xsl:when test="$codePublisherID1='CPJ'">0009-9228</xsl:when>
            <xsl:when test="$codePublisherID1='CPR'">2047-4873</xsl:when>
            <xsl:when test="$codePublisherID1='CPS'">0010-4140</xsl:when>
            <xsl:when test="$codePublisherID1='CPT'">1074-2484</xsl:when>
            <xsl:when test="$codePublisherID1='CQX'">1938-9655</xsl:when>
            <xsl:when test="$codePublisherID1='CRC'">0973-2586</xsl:when>
            <xsl:when test="$codePublisherID1='CRD'">1479-9723</xsl:when>
            <xsl:when test="$codePublisherID1='CRE'">0269-2155</xsl:when>
            <xsl:when test="$codePublisherID1='CRJ'">1748-8958</xsl:when>
            <xsl:when test="$codePublisherID1='CRS'">0896-9205</xsl:when>
            <xsl:when test="$codePublisherID1='CRW'">0091-5521</xsl:when>
            <xsl:when test="$codePublisherID1='CRX'">0093-6502</xsl:when>
            <xsl:when test="$codePublisherID1='CSC'">1532-7086</xsl:when>
            <xsl:when test="$codePublisherID1='CSI'">0011-3921</xsl:when>
            <xsl:when test="$codePublisherID1='CSP'">0261-0183</xsl:when>
            <xsl:when test="$codePublisherID1='CSX'">0094-3061</xsl:when>
            <xsl:when test="$codePublisherID1='CTJ'">1740-7745</xsl:when>
            <xsl:when test="$codePublisherID1='CTR'">0887-302X</xsl:when>
            <xsl:when test="$codePublisherID1='CTX'">1536-5042</xsl:when>
            <xsl:when test="$codePublisherID1='CUS'">1749-9755</xsl:when>
            <xsl:when test="$codePublisherID1='DAS'">0957-9265</xsl:when>
            <xsl:when test="$codePublisherID1='DCM'">1750-4813</xsl:when>
            <xsl:when test="$codePublisherID1='DEM'">1471-3012</xsl:when>
            <xsl:when test="$codePublisherID1='DIO'">0392-1921</xsl:when>
            <xsl:when test="$codePublisherID1='DIS'">1461-4456</xsl:when>
            <xsl:when test="$codePublisherID1='DMS'">1548-5129</xsl:when>
            <xsl:when test="$codePublisherID1='DPS'">1044-2073</xsl:when>
            <xsl:when test="$codePublisherID1='EAB'">0013-9165</xsl:when>
            <xsl:when test="$codePublisherID1='EAQ'">0013-161X</xsl:when>
            <xsl:when test="$codePublisherID1='EAU'">0956-2478</xsl:when>
            <xsl:when test="$codePublisherID1='EBX'">1063-4266</xsl:when>
            <xsl:when test="$codePublisherID1='ECL'">1468-7984</xsl:when>
            <xsl:when test="$codePublisherID1='ECR'">1476-718X</xsl:when>
            <xsl:when test="$codePublisherID1='ECS'">1367-5494</xsl:when>
            <xsl:when test="$codePublisherID1='EDM'">1555-3434</xsl:when>
            <xsl:when test="$codePublisherID1='EDQ'">0891-2424</xsl:when>
            <xsl:when test="$codePublisherID1='EDR'">0013-189X</xsl:when>
            <xsl:when test="$codePublisherID1='EEG'">1550-0594</xsl:when>
            <xsl:when test="$codePublisherID1='EEP'">0888-3254</xsl:when>
            <xsl:when test="$codePublisherID1='EHP'">0163-2787</xsl:when>
            <xsl:when test="$codePublisherID1='EHQ'">0265-6914</xsl:when>
            <xsl:when test="$codePublisherID1='EID'">0143-831X</xsl:when>
            <xsl:when test="$codePublisherID1='EIM'">0046-2039</xsl:when>
            <xsl:when test="$codePublisherID1='EJC'">0267-3231</xsl:when>
            <xsl:when test="$codePublisherID1='EJD'">0959-6801</xsl:when>
            <xsl:when test="$codePublisherID1='EJT'">1354-0661</xsl:when>
            <xsl:when test="$codePublisherID1='EJW'">1350-5068</xsl:when>
            <xsl:when test="$codePublisherID1='EMA'">1741-1432</xsl:when>
            <xsl:when test="$codePublisherID1='EME'">0974-9101</xsl:when>
            <xsl:when test="$codePublisherID1='EMF'">0972-6527</xsl:when>
            <xsl:when test="$codePublisherID1='EMR'">1754-0739</xsl:when>
            <xsl:when test="$codePublisherID1='ENG'">0075-4242</xsl:when>
            <xsl:when test="$codePublisherID1='ENX'">1931-2431</xsl:when>
            <xsl:when test="$codePublisherID1='EPA'">0162-3737</xsl:when>
            <xsl:when test="$codePublisherID1='EPE'">1356-336X</xsl:when>
            <xsl:when test="$codePublisherID1='EPM'">0013-1644</xsl:when>
            <xsl:when test="$codePublisherID1='EPT'">1474-8851</xsl:when>
            <xsl:when test="$codePublisherID1='EPX'">0895-9048</xsl:when>
            <xsl:when test="$codePublisherID1='ERG'">1064-8046</xsl:when>
            <xsl:when test="$codePublisherID1='ERX'">0193-841X</xsl:when>
            <xsl:when test="$codePublisherID1='ESJ'">1746-1979</xsl:when>
            <xsl:when test="$codePublisherID1='ESP'">0958-9287</xsl:when>
            <xsl:when test="$codePublisherID1='EST'">1368-4310</xsl:when>
            <xsl:when test="$codePublisherID1='ETH'">1466-1381</xsl:when>
            <xsl:when test="$codePublisherID1='ETN'">1468-7968</xsl:when>
            <xsl:when test="$codePublisherID1='EUC'">1477-3708</xsl:when>
            <xsl:when test="$codePublisherID1='EUP'">1465-1165</xsl:when>
            <xsl:when test="$codePublisherID1='EUR'">0969-7764</xsl:when>
            <xsl:when test="$codePublisherID1='EUS'">0013-1245</xsl:when>
            <xsl:when test="$codePublisherID1='EVI'">1356-3890</xsl:when>
            <xsl:when test="$codePublisherID1='EXT'">0014-5246</xsl:when>
            <xsl:when test="$codePublisherID1='FAP'">0959-3535</xsl:when>
            <xsl:when test="$codePublisherID1='FAS'">1938-6400</xsl:when>
            <xsl:when test="$codePublisherID1='FBR'">0894-4865</xsl:when>
            <xsl:when test="$codePublisherID1='FCX'">1557-0851</xsl:when>
            <xsl:when test="$codePublisherID1='FLA'">0142-7237</xsl:when>
            <xsl:when test="$codePublisherID1='FMX'">1525-822X</xsl:when>
            <xsl:when test="$codePublisherID1='FOA'">1088-3576</xsl:when>
            <xsl:when test="$codePublisherID1='FOI'">0014-5858</xsl:when>
            <xsl:when test="$codePublisherID1='FRC'">0957-1558</xsl:when>
            <xsl:when test="$codePublisherID1='FST'">1082-0132</xsl:when>
            <xsl:when test="$codePublisherID1='FTH'">0966-7350</xsl:when>
            <xsl:when test="$codePublisherID1='FTY'">1464-7001</xsl:when>
            <xsl:when test="$codePublisherID1='GAC'">1555-4120</xsl:when>
            <xsl:when test="$codePublisherID1='GAQ'">0533-3164</xsl:when>
            <xsl:when test="$codePublisherID1='GAS'">0891-2432</xsl:when>
            <xsl:when test="$codePublisherID1='GAZ'">1748-0485</xsl:when>
            <xsl:when test="$codePublisherID1='GBR'">0972-1509</xsl:when>
            <xsl:when test="$codePublisherID1='GCQ'">0016-9862</xsl:when>
            <xsl:when test="$codePublisherID1='GCT'">1076-2175</xsl:when>
            <xsl:when test="$codePublisherID1='GEI'">0261-4294</xsl:when>
            <xsl:when test="$codePublisherID1='GMC'">1742-7665</xsl:when>
            <xsl:when test="$codePublisherID1='GMT'">1048-3713</xsl:when>
            <xsl:when test="$codePublisherID1='GOM'">1059-6011</xsl:when>
            <xsl:when test="$codePublisherID1='GPI'">1368-4302</xsl:when>
            <xsl:when test="$codePublisherID1='GSP'">1468-0181</xsl:when>
            <xsl:when test="$codePublisherID1='GTD'">0971-8524</xsl:when>
            <xsl:when test="$codePublisherID1='HAS'">0160-5976</xsl:when>
            <xsl:when test="$codePublisherID1='HEA'">1363-4593</xsl:when>
            <xsl:when test="$codePublisherID1='HEJ'">0017-8969</xsl:when>
            <xsl:when test="$codePublisherID1='HET'">0960-3271</xsl:when>
            <xsl:when test="$codePublisherID1='HFS'">0018-7208</xsl:when>
            <xsl:when test="$codePublisherID1='HHC'">1084-8223</xsl:when>
            <xsl:when test="$codePublisherID1='HHS'">0952-6951</xsl:when>
            <xsl:when test="$codePublisherID1='HIJ'">1940-1612</xsl:when>
            <xsl:when test="$codePublisherID1='HIP'">0954-0083</xsl:when>
            <xsl:when test="$codePublisherID1='HJB'">0739-9863</xsl:when>
            <xsl:when test="$codePublisherID1='HOL'">0959-6836</xsl:when>
            <xsl:when test="$codePublisherID1='HPC'">1094-3420</xsl:when>
            <xsl:when test="$codePublisherID1='HPP'">1524-8399</xsl:when>
            <xsl:when test="$codePublisherID1='HPQ'">1359-1053</xsl:when>
            <xsl:when test="$codePublisherID1='HPY'">0957-154X</xsl:when>
            <xsl:when test="$codePublisherID1='HRD'">1534-4843</xsl:when>
            <xsl:when test="$codePublisherID1='HSB'">0022-1465</xsl:when>
            <xsl:when test="$codePublisherID1='HSX'">1088-7679</xsl:when>
            <xsl:when test="$codePublisherID1='HUM'">0018-7267</xsl:when>
            <xsl:when test="$codePublisherID1='IAB'">0020-8345</xsl:when>
            <xsl:when test="$codePublisherID1='IAS'">2233-8659</xsl:when>
            <xsl:when test="$codePublisherID1='IBE'">1420-326X</xsl:when>
            <xsl:when test="$codePublisherID1='ICJ'">1057-5677</xsl:when>
            <xsl:when test="$codePublisherID1='ICS'">1367-8779</xsl:when>
            <xsl:when test="$codePublisherID1='ICT'">1534-7354</xsl:when>
            <xsl:when test="$codePublisherID1='IDV'">0266-6669</xsl:when>
            <xsl:when test="$codePublisherID1='IER'">0019-4646</xsl:when>
            <xsl:when test="$codePublisherID1='IFL'">0340-0352</xsl:when>
            <xsl:when test="$codePublisherID1='IHR'">0376-9836</xsl:when>
            <xsl:when test="$codePublisherID1='IJB'">1367-0069</xsl:when>
            <xsl:when test="$codePublisherID1='IJD'">1056-7895</xsl:when>
            <xsl:when test="$codePublisherID1='IJL'">1534-7346</xsl:when>
            <xsl:when test="$codePublisherID1='IJM'">0255-7614</xsl:when>
            <xsl:when test="$codePublisherID1='IJO'">0020-7497</xsl:when>
            <xsl:when test="$codePublisherID1='IJR'">0278-3649</xsl:when>
            <xsl:when test="$codePublisherID1='IJS'">1066-8969</xsl:when>
            <xsl:when test="$codePublisherID1='IJT'">1091-5818</xsl:when>
            <xsl:when test="$codePublisherID1='IMP'">1365-4802</xsl:when>
            <xsl:when test="$codePublisherID1='INI'">1753-4259</xsl:when>
            <xsl:when test="$codePublisherID1='INT'">0020-9643</xsl:when>
            <xsl:when test="$codePublisherID1='IOC'">0306-4220</xsl:when>
            <xsl:when test="$codePublisherID1='IPS'">0192-5121</xsl:when>
            <xsl:when test="$codePublisherID1='IRE'">0047-1178</xsl:when>
            <xsl:when test="$codePublisherID1='IRM'">0973-0052</xsl:when>
            <xsl:when test="$codePublisherID1='IRS'">1012-6902</xsl:when>
            <xsl:when test="$codePublisherID1='IRV'">0269-7580</xsl:when>
            <xsl:when test="$codePublisherID1='IRX'">0160-0176</xsl:when>
            <xsl:when test="$codePublisherID1='ISB'">0266-2426</xsl:when>
            <xsl:when test="$codePublisherID1='ISC'">1053-4512</xsl:when>
            <xsl:when test="$codePublisherID1='ISP'">0020-7640</xsl:when>
            <xsl:when test="$codePublisherID1='ISQ'">0020-8817</xsl:when>
            <xsl:when test="$codePublisherID1='ISS'">0268-5809</xsl:when>
            <xsl:when test="$codePublisherID1='ISW'">0020-8728</xsl:when>
            <xsl:when test="$codePublisherID1='ITQ'">0021-1400</xsl:when>
            <xsl:when test="$codePublisherID1='IVI'">1473-8716</xsl:when>
            <xsl:when test="$codePublisherID1='JAB'">0021-8863</xsl:when>
            <xsl:when test="$codePublisherID1='JAD'">1087-0547</xsl:when>
            <xsl:when test="$codePublisherID1='JAF'">0148-558X</xsl:when>
            <xsl:when test="$codePublisherID1='JAG'">0733-4648</xsl:when>
            <xsl:when test="$codePublisherID1='JAH'">0898-2643</xsl:when>
            <xsl:when test="$codePublisherID1='JAP'">1078-3903</xsl:when>
            <xsl:when test="$codePublisherID1='JAR'">0743-5584</xsl:when>
            <xsl:when test="$codePublisherID1='JAS'">0021-9096</xsl:when>
            <xsl:when test="$codePublisherID1='JAX'">1936-7244</xsl:when>
            <xsl:when test="$codePublisherID1='JBA'">0885-3282</xsl:when>
            <xsl:when test="$codePublisherID1='JBC'">0883-9115</xsl:when>
            <xsl:when test="$codePublisherID1='JBD'">0165-0254</xsl:when>
            <xsl:when test="$codePublisherID1='JBP'">0095-7984</xsl:when>
            <xsl:when test="$codePublisherID1='JBR'">0748-7304</xsl:when>
            <xsl:when test="$codePublisherID1='JBS'">0021-9347</xsl:when>
            <xsl:when test="$codePublisherID1='JBX'">1087-0571</xsl:when>
            <xsl:when test="$codePublisherID1='JCA'">1069-0727</xsl:when>
            <xsl:when test="$codePublisherID1='JCC'">0022-0221</xsl:when>
            <xsl:when test="$codePublisherID1='JCD'">0894-8453</xsl:when>
            <xsl:when test="$codePublisherID1='JCE'">0891-2416</xsl:when>
            <xsl:when test="$codePublisherID1='JCH'">0022-0094</xsl:when>
            <xsl:when test="$codePublisherID1='JCI'">0196-8599</xsl:when>
            <xsl:when test="$codePublisherID1='JCL'">0021-9894</xsl:when>
            <xsl:when test="$codePublisherID1='JCM'">0021-9983</xsl:when>
            <xsl:when test="$codePublisherID1='JCN'">0883-0738</xsl:when>
            <xsl:when test="$codePublisherID1='JCR'">0731-4086</xsl:when>
            <xsl:when test="$codePublisherID1='JCS'">1468-795X</xsl:when>
            <xsl:when test="$codePublisherID1='JCX'">1078-3458</xsl:when>
            <xsl:when test="$codePublisherID1='JDI'">1358-2291</xsl:when>
            <xsl:when test="$codePublisherID1='JDM'">8756-4793</xsl:when>
            <xsl:when test="$codePublisherID1='JDS'">0169-796X</xsl:when>
            <xsl:when test="$codePublisherID1='JEA'">0272-4316</xsl:when>
            <xsl:when test="$codePublisherID1='JEB'">1076-9986</xsl:when>
            <xsl:when test="$codePublisherID1='JED'">1070-4965</xsl:when>
            <xsl:when test="$codePublisherID1='JEG'">0162-3532</xsl:when>
            <xsl:when test="$codePublisherID1='JEI'">1053-8151</xsl:when>
            <xsl:when test="$codePublisherID1='JEN'">1744-2591</xsl:when>
            <xsl:when test="$codePublisherID1='JEP'">0095-2443</xsl:when>
            <xsl:when test="$codePublisherID1='JES'">0047-2441</xsl:when>
            <xsl:when test="$codePublisherID1='JFE'">1042-3915</xsl:when>
            <xsl:when test="$codePublisherID1='JFH'">0363-1990</xsl:when>
            <xsl:when test="$codePublisherID1='JFI'">0192-513X</xsl:when>
            <xsl:when test="$codePublisherID1='JFM'">1098-612X</xsl:when>
            <xsl:when test="$codePublisherID1='JFN'">1074-8407</xsl:when>
            <xsl:when test="$codePublisherID1='JFS'">0734-9041</xsl:when>
            <xsl:when test="$codePublisherID1='JGM'">1741-1343</xsl:when>
            <xsl:when test="$codePublisherID1='JGP'">0891-9887</xsl:when>
            <xsl:when test="$codePublisherID1='JHH'">1538-1927</xsl:when>
            <xsl:when test="$codePublisherID1='JHI'">1460-4582</xsl:when>
            <xsl:when test="$codePublisherID1='JHL'">0890-3344</xsl:when>
            <xsl:when test="$codePublisherID1='JHM'">0972-0634</xsl:when>
            <xsl:when test="$codePublisherID1='JHN'">0898-0101</xsl:when>
            <xsl:when test="$codePublisherID1='JHP'">0022-1678</xsl:when>
            <xsl:when test="$codePublisherID1='JHS'">1753-1934</xsl:when>
            <xsl:when test="$codePublisherID1='JHT'">1096-3480</xsl:when>
            <xsl:when test="$codePublisherID1='JHV'">0971-6858</xsl:when>
            <xsl:when test="$codePublisherID1='JIA'">2325-9574</xsl:when>
            <xsl:when test="$codePublisherID1='JIC'">0885-0666</xsl:when>
            <xsl:when test="$codePublisherID1='JID'">1744-6295</xsl:when>
            <xsl:when test="$codePublisherID1='JIL'">0534-283X</xsl:when>
            <xsl:when test="$codePublisherID1='JIM'">1045-389X</xsl:when>
            <xsl:when test="$codePublisherID1='JIR'">0022-1856</xsl:when>
            <xsl:when test="$codePublisherID1='JIS'">0165-5515</xsl:when>
            <xsl:when test="$codePublisherID1='JIT'">1528-0837</xsl:when>
            <xsl:when test="$codePublisherID1='JIV'">0886-2605</xsl:when>
            <xsl:when test="$codePublisherID1='JLO'">1548-0518</xsl:when>
            <xsl:when test="$codePublisherID1='JLS'">0261-927X</xsl:when>
            <xsl:when test="$codePublisherID1='JMC'">1077-6958</xsl:when>
            <xsl:when test="$codePublisherID1='JMD'">0273-4753</xsl:when>
            <xsl:when test="$codePublisherID1='JME'">1052-5629</xsl:when>
            <xsl:when test="$codePublisherID1='JMH'">1557-9883</xsl:when>
            <xsl:when test="$codePublisherID1='JMI'">1056-4926</xsl:when>
            <xsl:when test="$codePublisherID1='JMK'">0276-1467</xsl:when>
            <xsl:when test="$codePublisherID1='JMM'">1097-184X</xsl:when>
            <xsl:when test="$codePublisherID1='JMO'">1522-6379</xsl:when>
            <xsl:when test="$codePublisherID1='JMQ'">1077-6990</xsl:when>
            <xsl:when test="$codePublisherID1='JMS'">0022-2542</xsl:when>
            <xsl:when test="$codePublisherID1='JMT'">1057-0837</xsl:when>
            <xsl:when test="$codePublisherID1='JNT'">0142-064X</xsl:when>
            <xsl:when test="$codePublisherID1='JOA'">1932-202X</xsl:when>
            <xsl:when test="$codePublisherID1='JOB'">0021-9436</xsl:when>
            <xsl:when test="$codePublisherID1='JOC'">1469-5405</xsl:when>
            <xsl:when test="$codePublisherID1='JOD'">0022-0426</xsl:when>
            <xsl:when test="$codePublisherID1='JOE'">0971-3557</xsl:when>
            <xsl:when test="$codePublisherID1='JOI'">0974-9306</xsl:when>
            <xsl:when test="$codePublisherID1='JOM'">0149-2063</xsl:when>
            <xsl:when test="$codePublisherID1='JOP'">0269-8811</xsl:when>
            <xsl:when test="$codePublisherID1='JOS'">1440-7833</xsl:when>
            <xsl:when test="$codePublisherID1='JOT'">0309-0892</xsl:when>
            <xsl:when test="$codePublisherID1='JOU'">1464-8849</xsl:when>
            <xsl:when test="$codePublisherID1='JPA'">0734-2829</xsl:when>
            <xsl:when test="$codePublisherID1='JPE'">0739-456X</xsl:when>
            <xsl:when test="$codePublisherID1='JPF'">8756-0879</xsl:when>
            <xsl:when test="$codePublisherID1='JPH'">1538-5132</xsl:when>
            <xsl:when test="$codePublisherID1='JPL'">0885-4122</xsl:when>
            <xsl:when test="$codePublisherID1='JPO'">1043-4542</xsl:when>
            <xsl:when test="$codePublisherID1='JPP'">0897-1900</xsl:when>
            <xsl:when test="$codePublisherID1='JPR'">0022-3433</xsl:when>
            <xsl:when test="$codePublisherID1='JRC'">0022-4278</xsl:when>
            <xsl:when test="$codePublisherID1='JRI'">1475-2409</xsl:when>
            <xsl:when test="$codePublisherID1='JRM'">0022-4294</xsl:when>
            <xsl:when test="$codePublisherID1='JRN'">1744-9871</xsl:when>
            <xsl:when test="$codePublisherID1='JRP'">0731-6844</xsl:when>
            <xsl:when test="$codePublisherID1='JSA'">1469-6053</xsl:when>
            <xsl:when test="$codePublisherID1='JSD'">0973-4082</xsl:when>
            <xsl:when test="$codePublisherID1='JSE'">1527-0025</xsl:when>
            <xsl:when test="$codePublisherID1='JSI'">1028-3153</xsl:when>
            <xsl:when test="$codePublisherID1='JSM'">1099-6362</xsl:when>
            <xsl:when test="$codePublisherID1='JSP'">0951-8207</xsl:when>
            <xsl:when test="$codePublisherID1='JSR'">1094-6705</xsl:when>
            <xsl:when test="$codePublisherID1='JSS'">0193-7235</xsl:when>
            <xsl:when test="$codePublisherID1='JSW'">1468-0173</xsl:when>
            <xsl:when test="$codePublisherID1='JTC'">0892-7057</xsl:when>
            <xsl:when test="$codePublisherID1='JTD'">1541-3446</xsl:when>
            <xsl:when test="$codePublisherID1='JTE'">0022-4871</xsl:when>
            <xsl:when test="$codePublisherID1='JTP'">0951-6298</xsl:when>
            <xsl:when test="$codePublisherID1='JTR'">0047-2875</xsl:when>
            <xsl:when test="$codePublisherID1='JUH'">0096-1442</xsl:when>
            <xsl:when test="$codePublisherID1='JVC'">1077-5463</xsl:when>
            <xsl:when test="$codePublisherID1='JVM'">1356-7667</xsl:when>
            <xsl:when test="$codePublisherID1='LAL'">0963-9470</xsl:when>
            <xsl:when test="$codePublisherID1='LAP'">0094-582X</xsl:when>
            <xsl:when test="$codePublisherID1='LAS'">0023-8309</xsl:when>
            <xsl:when test="$codePublisherID1='LCH'">1743-8721</xsl:when>
            <xsl:when test="$codePublisherID1='LDQ'">0731-9487</xsl:when>
            <xsl:when test="$codePublisherID1='LDX'">0022-2194</xsl:when>
            <xsl:when test="$codePublisherID1='LEA'">1742-7150</xsl:when>
            <xsl:when test="$codePublisherID1='LEC'">0269-0942</xsl:when>
            <xsl:when test="$codePublisherID1='LIS'">0961-0006</xsl:when>
            <xsl:when test="$codePublisherID1='LRT'">1477-1535</xsl:when>
            <xsl:when test="$codePublisherID1='LSJ'">0160-449X</xsl:when>
            <xsl:when test="$codePublisherID1='LTJ'">0265-5322</xsl:when>
            <xsl:when test="$codePublisherID1='LTR'">1362-1688</xsl:when>
            <xsl:when test="$codePublisherID1='LUP'">0961-2033</xsl:when>
            <xsl:when test="$codePublisherID1='MAR'">0973-8010</xsl:when>
            <xsl:when test="$codePublisherID1='MCQ'">0893-3189</xsl:when>
            <xsl:when test="$codePublisherID1='MCR'">1077-5587</xsl:when>
            <xsl:when test="$codePublisherID1='MCS'">0163-4437</xsl:when>
            <xsl:when test="$codePublisherID1='MCU'">1359-1835</xsl:when>
            <xsl:when test="$codePublisherID1='MCX'">0097-7004</xsl:when>
            <xsl:when test="$codePublisherID1='MDM'">0272-989X</xsl:when>
            <xsl:when test="$codePublisherID1='MEC'">0748-1756</xsl:when>
            <xsl:when test="$codePublisherID1='MEJ'">0027-4321</xsl:when>
            <xsl:when test="$codePublisherID1='MHJ'">0971-9458</xsl:when>
            <xsl:when test="$codePublisherID1='MIE'">0892-0206</xsl:when>
            <xsl:when test="$codePublisherID1='MIL'">0305-8298</xsl:when>
            <xsl:when test="$codePublisherID1='MLI'">0968-5332</xsl:when>
            <xsl:when test="$codePublisherID1='MLQ'">1350-5076</xsl:when>
            <xsl:when test="$codePublisherID1='MLS'">0258-042X</xsl:when>
            <xsl:when test="$codePublisherID1='MMD'">1943-8621</xsl:when>
            <xsl:when test="$codePublisherID1='MMJ'">1745-7904</xsl:when>
            <xsl:when test="$codePublisherID1='MMR'">1558-6898</xsl:when>
            <xsl:when test="$codePublisherID1='MMS'">1081-2865</xsl:when>
            <xsl:when test="$codePublisherID1='MSJ'">1352-4585</xsl:when>
            <xsl:when test="$codePublisherID1='MSS'">1750-6980</xsl:when>
            <xsl:when test="$codePublisherID1='MSX'">1029-8649</xsl:when>
            <xsl:when test="$codePublisherID1='MTQ'">1470-5931</xsl:when>
            <xsl:when test="$codePublisherID1='MWC'">1750-6352</xsl:when>
            <xsl:when test="$codePublisherID1='NAH'">0260-1060</xsl:when>
            <xsl:when test="$codePublisherID1='NCP'">0884-5336</xsl:when>
            <xsl:when test="$codePublisherID1='NEJ'">0969-7330</xsl:when>
            <xsl:when test="$codePublisherID1='NER'">0027-9501</xsl:when>
            <xsl:when test="$codePublisherID1='NMS'">1461-4448</xsl:when>
            <xsl:when test="$codePublisherID1='NNR'">1545-9683</xsl:when>
            <xsl:when test="$codePublisherID1='NRO'">1073-8584</xsl:when>
            <xsl:when test="$codePublisherID1='NSQ'">0894-3184</xsl:when>
            <xsl:when test="$codePublisherID1='NVS'">0899-7640</xsl:when>
            <xsl:when test="$codePublisherID1='OAE'">1086-0266</xsl:when>
            <xsl:when test="$codePublisherID1='OPP'">1078-1552</xsl:when>
            <xsl:when test="$codePublisherID1='ORG'">1350-5084</xsl:when>
            <xsl:when test="$codePublisherID1='ORM'">1094-4281</xsl:when>
            <xsl:when test="$codePublisherID1='OSS'">0170-8406</xsl:when>
            <xsl:when test="$codePublisherID1='PAA'">1030-570X</xsl:when>
            <xsl:when test="$codePublisherID1='PAD'">0367-8822</xsl:when>
            <xsl:when test="$codePublisherID1='PAS'">0032-3292</xsl:when>
            <xsl:when test="$codePublisherID1='PAU'">0369-9838</xsl:when>
            <xsl:when test="$codePublisherID1='PBI'">1098-3007</xsl:when>
            <xsl:when test="$codePublisherID1='PCP'">0367-8849</xsl:when>
            <xsl:when test="$codePublisherID1='PDS'">0971-3336</xsl:when>
            <xsl:when test="$codePublisherID1='PED'">1757-9759</xsl:when>
            <xsl:when test="$codePublisherID1='PEN'">0148-6071</xsl:when>
            <xsl:when test="$codePublisherID1='PFR'">1091-1421</xsl:when>
            <xsl:when test="$codePublisherID1='PIA'">1464-9934</xsl:when>
            <xsl:when test="$codePublisherID1='PIB'">0954-4054</xsl:when>
            <xsl:when test="$codePublisherID1='PIC'">0954-4062</xsl:when>
            <xsl:when test="$codePublisherID1='PID'">0954-4070</xsl:when>
            <xsl:when test="$codePublisherID1='PIE'">0954-4089</xsl:when>
            <xsl:when test="$codePublisherID1='PIF'">0954-4097</xsl:when>
            <xsl:when test="$codePublisherID1='PIG'">0954-4100</xsl:when>
            <xsl:when test="$codePublisherID1='PIH'">0954-4119</xsl:when>
            <xsl:when test="$codePublisherID1='PII'">0959-6518</xsl:when>
            <xsl:when test="$codePublisherID1='PIJ'">1350-6501</xsl:when>
            <xsl:when test="$codePublisherID1='PIK'">1464-4193</xsl:when>
            <xsl:when test="$codePublisherID1='PIL'">1464-4207</xsl:when>
            <xsl:when test="$codePublisherID1='PIM'">1475-0902</xsl:when>
            <xsl:when test="$codePublisherID1='PIN'">1740-3499</xsl:when>
            <xsl:when test="$codePublisherID1='PIO'">1748-006X</xsl:when>
            <xsl:when test="$codePublisherID1='PIP'">1754-3371</xsl:when>
            <xsl:when test="$codePublisherID1='PLT'">1473-0952</xsl:when>
            <xsl:when test="$codePublisherID1='PME'">0020-3483</xsl:when>
            <xsl:when test="$codePublisherID1='PMJ'">0269-2163</xsl:when>
            <xsl:when test="$codePublisherID1='PNZ'">0032-3187</xsl:when>
            <xsl:when test="$codePublisherID1='POM'">0305-7356</xsl:when>
            <xsl:when test="$codePublisherID1='POS'">0048-3931</xsl:when>
            <xsl:when test="$codePublisherID1='PPA'">0952-0767</xsl:when>
            <xsl:when test="$codePublisherID1='PPE'">1470-594X</xsl:when>
            <xsl:when test="$codePublisherID1='PPG'">0309-1333</xsl:when>
            <xsl:when test="$codePublisherID1='PPN'">1527-1544</xsl:when>
            <xsl:when test="$codePublisherID1='PPQ'">1354-0688</xsl:when>
            <xsl:when test="$codePublisherID1='PPS'">1745-6916</xsl:when>
            <xsl:when test="$codePublisherID1='PQX'">1098-6111</xsl:when>
            <xsl:when test="$codePublisherID1='PRB'">0264-5505</xsl:when>
            <xsl:when test="$codePublisherID1='PRF'">0267-6591</xsl:when>
            <xsl:when test="$codePublisherID1='PRQ'">1065-9129</xsl:when>
            <xsl:when test="$codePublisherID1='PSC'">0191-4537</xsl:when>
            <xsl:when test="$codePublisherID1='PSP'">0146-1672</xsl:when>
            <xsl:when test="$codePublisherID1='PSR'">1088-8683</xsl:when>
            <xsl:when test="$codePublisherID1='PSS'">0956-7976</xsl:when>
            <xsl:when test="$codePublisherID1='PTX'">0090-5917</xsl:when>
            <xsl:when test="$codePublisherID1='PUN'">1462-4745</xsl:when>
            <xsl:when test="$codePublisherID1='PUS'">0963-6625</xsl:when>
            <xsl:when test="$codePublisherID1='PVS'">1531-0035</xsl:when>
            <xsl:when test="$codePublisherID1='PWM'">1087-724X</xsl:when>
            <xsl:when test="$codePublisherID1='PWQ'">0361-6843</xsl:when>
            <xsl:when test="$codePublisherID1='QHR'">1049-7323</xsl:when>
            <xsl:when test="$codePublisherID1='QIX'">1077-8004</xsl:when>
            <xsl:when test="$codePublisherID1='QRJ'">1468-7941</xsl:when>
            <xsl:when test="$codePublisherID1='QSW'">1473-3250</xsl:when>
            <xsl:when test="$codePublisherID1='RAC'">0306-3968</xsl:when>
            <xsl:when test="$codePublisherID1='RAS'">0020-8523</xsl:when>
            <xsl:when test="$codePublisherID1='RCB'">0034-3552</xsl:when>
            <xsl:when test="$codePublisherID1='REA'">1747-0161</xsl:when>
            <xsl:when test="$codePublisherID1='REL'">0033-6882</xsl:when>
            <xsl:when test="$codePublisherID1='RER'">0034-6543</xsl:when>
            <xsl:when test="$codePublisherID1='REV'">1557-234X</xsl:when>
            <xsl:when test="$codePublisherID1='RMI'">0974-9292</xsl:when>
            <xsl:when test="$codePublisherID1='ROA'">0164-0275</xsl:when>
            <xsl:when test="$codePublisherID1='ROP'">0734-371X</xsl:when>
            <xsl:when test="$codePublisherID1='RRE'">0091-732X</xsl:when>
            <xsl:when test="$codePublisherID1='RRP'">0486-6134</xsl:when>
            <xsl:when test="$codePublisherID1='RSH'">1757-9139</xsl:when>
            <xsl:when test="$codePublisherID1='RSM'">1321-103X</xsl:when>
            <xsl:when test="$codePublisherID1='RSS'">1043-4631</xsl:when>
            <xsl:when test="$codePublisherID1='RSW'">1049-7315</xsl:when>
            <xsl:when test="$codePublisherID1='RSX'">1933-7191</xsl:when>
            <xsl:when test="$codePublisherID1='SAC'">1206-3312</xsl:when>
            <xsl:when test="$codePublisherID1='SAD'">0973-1741</xsl:when>
            <xsl:when test="$codePublisherID1='SAE'">1391-5614</xsl:when>
            <xsl:when test="$codePublisherID1='SAG'">1046-8781</xsl:when>
            <xsl:when test="$codePublisherID1='SAR'">0262-7280</xsl:when>
            <xsl:when test="$codePublisherID1='SAS'">0971-5231</xsl:when>
            <xsl:when test="$codePublisherID1='SAX'">1079-0632</xsl:when>
            <xsl:when test="$codePublisherID1='SCE'">0953-9468</xsl:when>
            <xsl:when test="$codePublisherID1='SCH'">0049-0857</xsl:when>
            <xsl:when test="$codePublisherID1='SCP'">0037-7686</xsl:when>
            <xsl:when test="$codePublisherID1='SCV'">1089-2532</xsl:when>
            <xsl:when test="$codePublisherID1='SCX'">1075-5470</xsl:when>
            <xsl:when test="$codePublisherID1='SDI'">0967-0106</xsl:when>
            <xsl:when test="$codePublisherID1='SDJ'">0309-1325</xsl:when>
            <xsl:when test="$codePublisherID1='SED'">0022-4669</xsl:when>
            <xsl:when test="$codePublisherID1='SEX'">1363-4607</xsl:when>
            <xsl:when test="$codePublisherID1='SGR'">8756-0275</xsl:when>
            <xsl:when test="$codePublisherID1='SHM'">1475-9217</xsl:when>
            <xsl:when test="$codePublisherID1='SIH'">0257-6430</xsl:when>
            <xsl:when test="$codePublisherID1='SIM'">0740-6797</xsl:when>
            <xsl:when test="$codePublisherID1='SIR'">0008-4298</xsl:when>
            <xsl:when test="$codePublisherID1='SJP'">1403-4948</xsl:when>
            <xsl:when test="$codePublisherID1='SLG'">0160-323X</xsl:when>
            <xsl:when test="$codePublisherID1='SLR'">0267-6583</xsl:when>
            <xsl:when test="$codePublisherID1='SLS'">0964-6639</xsl:when>
            <xsl:when test="$codePublisherID1='SMJ'">1471-082X</xsl:when>
            <xsl:when test="$codePublisherID1='SMM'">0962-2802</xsl:when>
            <xsl:when test="$codePublisherID1='SMQ'">1524-5004</xsl:when>
            <xsl:when test="$codePublisherID1='SMR'">0049-1241</xsl:when>
            <xsl:when test="$codePublisherID1='SMX'">0081-1750</xsl:when>
            <xsl:when test="$codePublisherID1='SOC'">0038-0385</xsl:when>
            <xsl:when test="$codePublisherID1='SOE'">0038-0407</xsl:when>
            <xsl:when test="$codePublisherID1='SOQ'">1476-1270</xsl:when>
            <xsl:when test="$codePublisherID1='SPA'">1532-4400</xsl:when>
            <xsl:when test="$codePublisherID1='SPH'">1941-7381</xsl:when>
            <xsl:when test="$codePublisherID1='SPI'">0143-0343</xsl:when>
            <xsl:when test="$codePublisherID1='SPQ'">0190-2725</xsl:when>
            <xsl:when test="$codePublisherID1='SPR'">0265-4075</xsl:when>
            <xsl:when test="$codePublisherID1='SRI'">1553-3506</xsl:when>
            <xsl:when test="$codePublisherID1='SSC'">0894-4393</xsl:when>
            <xsl:when test="$codePublisherID1='SSI'">0539-0184</xsl:when>
            <xsl:when test="$codePublisherID1='SSS'">0306-3127</xsl:when>
            <xsl:when test="$codePublisherID1='STH'">0162-2439</xsl:when>
            <xsl:when test="$codePublisherID1='STS'">0971-7218</xsl:when>
            <xsl:when test="$codePublisherID1='STX'">0735-2751</xsl:when>
            <xsl:when test="$codePublisherID1='TAB'">1759-720X</xsl:when>
            <xsl:when test="$codePublisherID1='TAG'">1756-283X</xsl:when>
            <xsl:when test="$codePublisherID1='TAK'">1753-9447</xsl:when>
            <xsl:when test="$codePublisherID1='TAM'">1758-8340</xsl:when>
            <xsl:when test="$codePublisherID1='TAN'">1756-2856</xsl:when>
            <xsl:when test="$codePublisherID1='TAP'">0959-3543</xsl:when>
            <xsl:when test="$codePublisherID1='TAR'">1753-4658</xsl:when>
            <xsl:when test="$codePublisherID1='TAS'">0961-463X</xsl:when>
            <xsl:when test="$codePublisherID1='TAU'">1756-2872</xsl:when>
            <xsl:when test="$codePublisherID1='TCN'">1043-6596</xsl:when>
            <xsl:when test="$codePublisherID1='TCP'">0011-0000</xsl:when>
            <xsl:when test="$codePublisherID1='TCR'">1362-4806</xsl:when>
            <xsl:when test="$codePublisherID1='TCS'">0263-2764</xsl:when>
            <xsl:when test="$codePublisherID1='TDE'">0145-7217</xsl:when>
            <xsl:when test="$codePublisherID1='TEC'">0271-1214</xsl:when>
            <xsl:when test="$codePublisherID1='TES'">0888-4064</xsl:when>
            <xsl:when test="$codePublisherID1='TFJ'">1066-4807</xsl:when>
            <xsl:when test="$codePublisherID1='THE'">0725-5136</xsl:when>
            <xsl:when test="$codePublisherID1='THR'">1467-3584</xsl:when>
            <xsl:when test="$codePublisherID1='TIA'">1084-7138</xsl:when>
            <xsl:when test="$codePublisherID1='TIH'">0748-2337</xsl:when>
            <xsl:when test="$codePublisherID1='TIM'">0142-3312</xsl:when>
            <xsl:when test="$codePublisherID1='TJX'">0040-571X</xsl:when>
            <xsl:when test="$codePublisherID1='TMT'">1534-7656</xsl:when>
            <xsl:when test="$codePublisherID1='TOP'">0098-6283</xsl:when>
            <xsl:when test="$codePublisherID1='TOU'">1468-7976</xsl:when>
            <xsl:when test="$codePublisherID1='TPA'">0144-7394</xsl:when>
            <xsl:when test="$codePublisherID1='TPJ'">0032-8855</xsl:when>
            <xsl:when test="$codePublisherID1='TPS'">1363-4615</xsl:when>
            <xsl:when test="$codePublisherID1='TRA'">1460-4086</xsl:when>
            <xsl:when test="$codePublisherID1='TRE'">1477-8785</xsl:when>
            <xsl:when test="$codePublisherID1='TRJ'">0040-5175</xsl:when>
            <xsl:when test="$codePublisherID1='TRN'">0265-3788</xsl:when>
            <xsl:when test="$codePublisherID1='TRS'">1024-2589</xsl:when>
            <xsl:when test="$codePublisherID1='TSO'">0092-055X</xsl:when>
            <xsl:when test="$codePublisherID1='TTJ'">0040-5736</xsl:when>
            <xsl:when test="$codePublisherID1='TVA'">1524-8380</xsl:when>
            <xsl:when test="$codePublisherID1='TVN'">1527-4764</xsl:when>
            <xsl:when test="$codePublisherID1='UAR'">1078-0874</xsl:when>
            <xsl:when test="$codePublisherID1='UEX'">0042-0859</xsl:when>
            <xsl:when test="$codePublisherID1='UIX'">0161-7346</xsl:when>
            <xsl:when test="$codePublisherID1='UPD'">8755-1233</xsl:when>
            <xsl:when test="$codePublisherID1='USJ'">0042-0980</xsl:when>
            <xsl:when test="$codePublisherID1='VAW'">1077-8012</xsl:when>
            <xsl:when test="$codePublisherID1='VCJ'">1470-3572</xsl:when>
            <xsl:when test="$codePublisherID1='VCU'">1470-4129</xsl:when>
            <xsl:when test="$codePublisherID1='VES'">1538-5744</xsl:when>
            <xsl:when test="$codePublisherID1='VIS'">0972-2629</xsl:when>
            <xsl:when test="$codePublisherID1='WCX'">0741-0883</xsl:when>
            <xsl:when test="$codePublisherID1='WES'">0950-0170</xsl:when>
            <xsl:when test="$codePublisherID1='WIH'">0968-3445</xsl:when>
            <xsl:when test="$codePublisherID1='WJN'">0193-9459</xsl:when>
            <xsl:when test="$codePublisherID1='WOM'">1048-3950</xsl:when>
            <xsl:when test="$codePublisherID1='WOX'">0730-8884</xsl:when>
            <xsl:when test="$codePublisherID1='WPJ'">0740-2775</xsl:when>
            <xsl:when test="$codePublisherID1='YAS'">0044-118X</xsl:when>
            <xsl:when test="$codePublisherID1='YEC'">1096-2506</xsl:when>
            <xsl:when test="$codePublisherID1='YJJ'">1473-2254</xsl:when>
            <xsl:when test="$codePublisherID1='YOU'">1103-3088</xsl:when>
            <xsl:when test="$codePublisherID1='YVJ'">1541-2040</xsl:when>
            <!-- BMJ -->
            <xsl:when test="//journal-meta/journal-title='Association Medical Journal'">2041-9996</xsl:when>
            <xsl:when test="//journal-meta/journal-title='London journal of medicine'">2041-9988</xsl:when>
            <xsl:when test="//journal-meta/journal-title='BMJ : British Medical Journal'">0959-8138</xsl:when>
            <xsl:when test="//journal-meta/journal-title='The British Edition of the Medical Letter on Drugs and Therapeutics'">0543-2766</xsl:when>
            <xsl:when test="//journal-meta/journal-title='Provincial Medical and Surgical Journal' and //pub-date[@pub-type='ppub']/year='1842' or //pub-date[@pub-type='ppub']/year='1843' or //pub-date[@pub-type='ppub']/year='1844'">2041-9961</xsl:when>
            <xsl:when test="//journal-meta/journal-title='Provincial Medical and Surgical Journal' and //pub-date[@pub-type='ppub']/year='1840' or //pub-date[@pub-type='ppub']/year='1841'">2041-9953</xsl:when>
            <xsl:when test="//journal-meta/journal-title='Provincial Medical and Surgical Journal' and //pub-date[@pub-type='ppub']/year='1845' or //pub-date[@pub-type='ppub']/year='1846' or //pub-date[@pub-type='ppub']/year='1847'or //pub-date[@pub-type='ppub']/year='1848'or //pub-date[@pub-type='ppub']/year='1849'or //pub-date[@pub-type='ppub']/year='1850'or //pub-date[@pub-type='ppub']/year='1851'or //pub-date[@pub-type='ppub']/year='1852'">2041-997X</xsl:when>
        </xsl:choose>
            </xsl:variable>
    <!--SAGE - eissn -->
    <xsl:variable name="REPRISEeISSNCode">
        <xsl:choose>
            <xsl:when test="$codePublisherID1='AAF'">1740-469X</xsl:when>
            <xsl:when test="$codePublisherID1='AAS'">1552-3039</xsl:when>
            <xsl:when test="$codePublisherID1='ABS'">1552-3381</xsl:when>
            <xsl:when test="$codePublisherID1='ACH'">1749-3374</xsl:when>
            <xsl:when test="$codePublisherID1='ADB'">1741-2633</xsl:when>
            <xsl:when test="$codePublisherID1='ADH'">1552-3055</xsl:when>
            <xsl:when test="$codePublisherID1='AED'">2050-5884</xsl:when>
            <xsl:when test="$codePublisherID1='AEI'">1938-7458</xsl:when>
            <xsl:when test="$codePublisherID1='AER'">1935-1011</xsl:when>
            <xsl:when test="$codePublisherID1='AES'">1527-330X</xsl:when>
            <xsl:when test="$codePublisherID1='AFF'">1552-3020</xsl:when>
            <xsl:when test="$codePublisherID1='AFS'">1556-0848</xsl:when>
            <xsl:when test="$codePublisherID1='AHH'">1741-265X</xsl:when>
            <xsl:when test="$codePublisherID1='AJA'">1938-2731</xsl:when>
            <xsl:when test="$codePublisherID1='AJE'">1557-0878</xsl:when>
            <xsl:when test="$codePublisherID1='AJH'">1938-2715</xsl:when>
            <xsl:when test="$codePublisherID1='AJL'">1559-8284</xsl:when>
            <xsl:when test="$codePublisherID1='AJM'">1555-824X</xsl:when>
            <xsl:when test="$codePublisherID1='AJS'">1552-3365</xsl:when>
            <xsl:when test="$codePublisherID1='ALH'">1741-2625</xsl:when>
            <xsl:when test="$codePublisherID1='ANJ'">1837-9273</xsl:when>
            <xsl:when test="$codePublisherID1='ANM'">1746-8485</xsl:when>
                    <xsl:when test="$codePublisherID1='ANN'">1552-3349</xsl:when>
                    <xsl:when test="$codePublisherID1='ANP'">1440-1614</xsl:when>
                    <xsl:when test="$codePublisherID1='ANT'">1741-2641</xsl:when>
                    <xsl:when test="$codePublisherID1='APA'">1941-2460</xsl:when>
                    <xsl:when test="$codePublisherID1='APM'">1552-3497</xsl:when>
                    <xsl:when test="$codePublisherID1='APR'">1552-3373</xsl:when>
                    <xsl:when test="$codePublisherID1='APY'">1440-1665</xsl:when>
                    <xsl:when test="$codePublisherID1='ARJ'">1741-2617</xsl:when>
                    <xsl:when test="$codePublisherID1='ARP'">1552-3357</xsl:when>
                    <xsl:when test="$codePublisherID1='ASJ'">1502-3869</xsl:when>
                    <xsl:when test="$codePublisherID1='ASM'">1552-3489</xsl:when>
                    <xsl:when test="$codePublisherID1='ASQ'">1930-3815</xsl:when>
                    <xsl:when test="$codePublisherID1='ASR'">1939-8271</xsl:when>
                    <xsl:when test="$codePublisherID1='AUM'">1327-2020</xsl:when>
                    <xsl:when test="$codePublisherID1='AUT'">1461-7005</xsl:when>
                    <xsl:when test="$codePublisherID1='BAS'">1552-4205</xsl:when>
                    <xsl:when test="$codePublisherID1='BCQ'">1552-4191</xsl:when>
                    <xsl:when test="$codePublisherID1='BIR'">1741-6450</xsl:when>
                    <xsl:when test="$codePublisherID1='BJI'">1757-1782</xsl:when>
                    <xsl:when test="$codePublisherID1='BJP'">2049-4645</xsl:when>
                    <xsl:when test="$codePublisherID1='BJR'">1741-2668</xsl:when>
                    <xsl:when test="$codePublisherID1='BMO'">1552-4167</xsl:when>
                    <xsl:when test="$codePublisherID1='BMS'">2070-2779</xsl:when>
                    <xsl:when test="$codePublisherID1='BOD'">1460-3632</xsl:when>
                    <xsl:when test="$codePublisherID1='BOS'">1938-3282</xsl:when>
                    <xsl:when test="$codePublisherID1='BRN'">1552-4175</xsl:when>
                    <xsl:when test="$codePublisherID1='BSE'">1477-0849</xsl:when>
                    <xsl:when test="$codePublisherID1='BST'">1552-4183</xsl:when>
                    <xsl:when test="$codePublisherID1='BTB'">1945-7596</xsl:when>
                    <xsl:when test="$codePublisherID1='BUL'">1930-1405</xsl:when>
                    <xsl:when test="$codePublisherID1='CAC'">1460-3691</xsl:when>
                    <xsl:when test="$codePublisherID1='CAD'">1552-387X</xsl:when>
                    <xsl:when test="$codePublisherID1='CAN'">1941-4072</xsl:when>
                    <xsl:when test="$codePublisherID1='CAP'">1461-7056</xsl:when>
                    <xsl:when test="$codePublisherID1='CAT'">1938-2723</xsl:when>
                    <xsl:when test="$codePublisherID1='CBI'">1745-5200</xsl:when>
                    <xsl:when test="$codePublisherID1='CBR'">1552-3837</xsl:when>
                    <xsl:when test="$codePublisherID1='CCJ'">1552-5406</xsl:when>
                    <xsl:when test="$codePublisherID1='CCM'">1741-2838</xsl:when>
                    <xsl:when test="$codePublisherID1='CCP'">1461-7021</xsl:when>
                    <xsl:when test="$codePublisherID1='CCR'">1552-3578</xsl:when>
                    <xsl:when test="$codePublisherID1='CCS'">1552-3802</xsl:when>
                    <xsl:when test="$codePublisherID1='CDE'">2165-1442</xsl:when>
                    <xsl:when test="$codePublisherID1='CDP'">1467-8721</xsl:when>
                    <xsl:when test="$codePublisherID1='CDQ'">1538-4837</xsl:when>
                    <xsl:when test="$codePublisherID1='CDY'">1461-7048</xsl:when>
                    <xsl:when test="$codePublisherID1='CED'">2249-5320</xsl:when>
                    <xsl:when test="$codePublisherID1='CEL'">1530-7999</xsl:when>
                    <xsl:when test="$codePublisherID1='CEP'">1468-2982</xsl:when>
                    <xsl:when test="$codePublisherID1='CER'">1531-2003</xsl:when>
                    <xsl:when test="$codePublisherID1='CGJ'">1477-0881</xsl:when>
                    <xsl:when test="$codePublisherID1='CHC'">1741-2889</xsl:when>
                    <xsl:when test="$codePublisherID1='CHD'">1461-7013</xsl:when>
                    <xsl:when test="$codePublisherID1='CHI'">1745-9206</xsl:when>
                    <xsl:when test="$codePublisherID1='CHP'">2156-5899</xsl:when>
                    <xsl:when test="$codePublisherID1='CHR'">1939-9790</xsl:when>
                    <xsl:when test="$codePublisherID1='CIN'">1741-590X</xsl:when>
                    <xsl:when test="$codePublisherID1='CIS'">1939-9995</xsl:when>
                    <xsl:when test="$codePublisherID1='CJB'">1552-3594</xsl:when>
                    <xsl:when test="$codePublisherID1='CJP'">1552-3586</xsl:when>
                    <xsl:when test="$codePublisherID1='CJR'">1556-3839</xsl:when>
                    <xsl:when test="$codePublisherID1='CLA'">1530-812X</xsl:when>
                    <xsl:when test="$codePublisherID1='CLT'">1477-0865</xsl:when>
                    <xsl:when test="$codePublisherID1='CMC'">1741-6604</xsl:when>
                    <xsl:when test="$codePublisherID1='CMP'">1549-9219</xsl:when>
                    <xsl:when test="$codePublisherID1='CMX'">1552-6119</xsl:when>
                    <xsl:when test="$codePublisherID1='CNC'">2041-0980</xsl:when>
                    <xsl:when test="$codePublisherID1='CNR'">1552-3799</xsl:when>
                    <xsl:when test="$codePublisherID1='CNU'">1873-1953</xsl:when>
                    <xsl:when test="$codePublisherID1='COA'">1460-3721</xsl:when>
                    <xsl:when test="$codePublisherID1='CON'">1748-7382</xsl:when>
                    <xsl:when test="$codePublisherID1='CPJ'">1938-2707</xsl:when>
                    <xsl:when test="$codePublisherID1='CPR'">2047-4881</xsl:when>
                    <xsl:when test="$codePublisherID1='CPS'">1552-3829</xsl:when>
                    <xsl:when test="$codePublisherID1='CPT'">1940-4034</xsl:when>
                    <xsl:when test="$codePublisherID1='CQX'">1938-9663</xsl:when>
                    <xsl:when test="$codePublisherID1='CRC'">0973-2594</xsl:when>
                    <xsl:when test="$codePublisherID1='CRD'">1479-9731</xsl:when>
                    <xsl:when test="$codePublisherID1='CRE'">1477-0873</xsl:when>
                    <xsl:when test="$codePublisherID1='CRJ'">1748-8966</xsl:when>
                    <xsl:when test="$codePublisherID1='CRS'">1569-1632</xsl:when>
                    <xsl:when test="$codePublisherID1='CRW'">1940-2325</xsl:when>
                    <xsl:when test="$codePublisherID1='CRX'">1552-3810</xsl:when>
                    <xsl:when test="$codePublisherID1='CSC'">1552-356X</xsl:when>
                    <xsl:when test="$codePublisherID1='CSI'">1461-7064</xsl:when>
                    <xsl:when test="$codePublisherID1='CSP'">1461-703X</xsl:when>
                    <xsl:when test="$codePublisherID1='CSX'">1939-8638</xsl:when>
                    <xsl:when test="$codePublisherID1='CTJ'">1740-7753</xsl:when>
                    <xsl:when test="$codePublisherID1='CTR'">1940-2473</xsl:when>
                    <xsl:when test="$codePublisherID1='CTX'">1537-6052</xsl:when>
                    <xsl:when test="$codePublisherID1='CUS'">1749-9763</xsl:when>
                    <xsl:when test="$codePublisherID1='DAS'">1460-3624</xsl:when>
                    <xsl:when test="$codePublisherID1='DCM'">1750-4821</xsl:when>
                    <xsl:when test="$codePublisherID1='DEM'">1741-2684</xsl:when>
                    <xsl:when test="$codePublisherID1='DIO'">1467-7695</xsl:when>
                    <xsl:when test="$codePublisherID1='DIS'">1461-7080</xsl:when>
                    <xsl:when test="$codePublisherID1='DMS'">1557-380X</xsl:when>
                    <xsl:when test="$codePublisherID1='DPS'">1538-4802</xsl:when>
                    <xsl:when test="$codePublisherID1='EAB'">1552-390X</xsl:when>
                    <xsl:when test="$codePublisherID1='EAQ'">1552-3519</xsl:when>
                    <xsl:when test="$codePublisherID1='EAU'">1746-0301</xsl:when>
                    <xsl:when test="$codePublisherID1='EBX'">1538-4799</xsl:when>
                    <xsl:when test="$codePublisherID1='ECL'">1741-2919</xsl:when>
                    <xsl:when test="$codePublisherID1='ECR'">1741-2927</xsl:when>
                    <xsl:when test="$codePublisherID1='ECS'">1460-3551</xsl:when>
                    <xsl:when test="$codePublisherID1='EDM'">2169-5032</xsl:when>
                    <xsl:when test="$codePublisherID1='EDQ'">1552-3543</xsl:when>
                    <xsl:when test="$codePublisherID1='EDR'">1935-102X</xsl:when>
                    <xsl:when test="$codePublisherID1='EEG'">2169-5202</xsl:when>
                    <xsl:when test="$codePublisherID1='EEP'">1533-8371</xsl:when>
                    <xsl:when test="$codePublisherID1='EHP'">1552-3918</xsl:when>
                    <xsl:when test="$codePublisherID1='EHQ'">1461-7110</xsl:when>
                    <xsl:when test="$codePublisherID1='EID'">1461-7099</xsl:when>
                    <xsl:when test="$codePublisherID1='EJC'">1460-3705</xsl:when>
                    <xsl:when test="$codePublisherID1='EJD'">1461-7129</xsl:when>
                    <xsl:when test="$codePublisherID1='EJT'">1460-3713</xsl:when>
                    <xsl:when test="$codePublisherID1='EJW'">1461-7420</xsl:when>
                    <xsl:when test="$codePublisherID1='EMA'">1741-1440</xsl:when>
                    <xsl:when test="$codePublisherID1='EME'">0975-2730</xsl:when>
                    <xsl:when test="$codePublisherID1='EMF'">0973-0710</xsl:when>
                    <xsl:when test="$codePublisherID1='EMR'">1754-0747</xsl:when>
                    <xsl:when test="$codePublisherID1='ENG'">1552-5457</xsl:when>
                    <xsl:when test="$codePublisherID1='ENX'">1931-244X</xsl:when>
                    <xsl:when test="$codePublisherID1='EPA'">1935-1062</xsl:when>
                    <xsl:when test="$codePublisherID1='EPE'">1741-2749</xsl:when>
                    <xsl:when test="$codePublisherID1='EPM'">1552-3888</xsl:when>
                    <xsl:when test="$codePublisherID1='EPT'">1741-2730</xsl:when>
                    <xsl:when test="$codePublisherID1='EPX'">1552-3896</xsl:when>
                    <xsl:when test="$codePublisherID1='ERG'">2169-5083</xsl:when>
                    <xsl:when test="$codePublisherID1='ERX'">1552-3926</xsl:when>
                    <xsl:when test="$codePublisherID1='ESJ'">1746-1987</xsl:when>
                    <xsl:when test="$codePublisherID1='ESP'">1461-7269</xsl:when>
                    <xsl:when test="$codePublisherID1='EST'">1461-7137</xsl:when>
                    <xsl:when test="$codePublisherID1='ETH'">1741-2714</xsl:when>
                    <xsl:when test="$codePublisherID1='ETN'">1741-2706</xsl:when>
                    <xsl:when test="$codePublisherID1='EUC'">1741-2609</xsl:when>
                    <xsl:when test="$codePublisherID1='EUP'">1741-2757</xsl:when>
                    <xsl:when test="$codePublisherID1='EUR'">1461-7145</xsl:when>
                    <xsl:when test="$codePublisherID1='EUS'">1552-3535</xsl:when>
                    <xsl:when test="$codePublisherID1='EVI'">1461-7153</xsl:when>
                    <xsl:when test="$codePublisherID1='EXT'">1745-5308</xsl:when>
                    <xsl:when test="$codePublisherID1='FAP'">1461-7161</xsl:when>
                    <xsl:when test="$codePublisherID1='FAS'">1938-7636</xsl:when>
                    <xsl:when test="$codePublisherID1='FBR'">1741-6248</xsl:when>
                    <xsl:when test="$codePublisherID1='FLA'">1740-2344</xsl:when>
                    <xsl:when test="$codePublisherID1='FMX'">1552-3969</xsl:when>
                    <xsl:when test="$codePublisherID1='FOA'">1538-4829</xsl:when>
                    <xsl:when test="$codePublisherID1='FOI'">2168-989X</xsl:when>
                    <xsl:when test="$codePublisherID1='FRC'">1740-2352</xsl:when>
                    <xsl:when test="$codePublisherID1='FST'">1532-1738</xsl:when>
                    <xsl:when test="$codePublisherID1='FTH'">1745-5189</xsl:when>
                    <xsl:when test="$codePublisherID1='FTY'">1741-2773</xsl:when>
                    <xsl:when test="$codePublisherID1='GAC'">1555-4139</xsl:when>
                    <xsl:when test="$codePublisherID1='GAQ'">1461-717X</xsl:when>
                    <xsl:when test="$codePublisherID1='GAS'">1552-3977</xsl:when>
                    <xsl:when test="$codePublisherID1='GAZ'">1748-0493</xsl:when>
                    <xsl:when test="$codePublisherID1='GCQ'">1934-9041</xsl:when>
                    <xsl:when test="$codePublisherID1='GCT'">2162-951X</xsl:when>
                    <xsl:when test="$codePublisherID1='GEI'">2047-9077</xsl:when>
                    <xsl:when test="$codePublisherID1='GMC'">1742-7673</xsl:when>
                    <xsl:when test="$codePublisherID1='GMT'">1931-3756</xsl:when>
                    <xsl:when test="$codePublisherID1='GOM'">1552-3993</xsl:when>
                    <xsl:when test="$codePublisherID1='GPI'">1461-7188</xsl:when>
                    <xsl:when test="$codePublisherID1='GSP'">1741-2803</xsl:when>
                    <xsl:when test="$codePublisherID1='HAS'">2372-9708</xsl:when>
                    <xsl:when test="$codePublisherID1='HEA'">1461-7196</xsl:when>
                    <xsl:when test="$codePublisherID1='HEJ'">1748-8176</xsl:when>
                    <xsl:when test="$codePublisherID1='HET'">1477-0903</xsl:when>
                    <xsl:when test="$codePublisherID1='HFS'">1547-8181</xsl:when>
                    <xsl:when test="$codePublisherID1='HHC'">1552-6739</xsl:when>
                    <xsl:when test="$codePublisherID1='HHS'">1461-720X</xsl:when>
                    <xsl:when test="$codePublisherID1='HIJ'">1940-1620</xsl:when>
                    <xsl:when test="$codePublisherID1='HIP'">1361-6412</xsl:when>
                    <xsl:when test="$codePublisherID1='HJB'">1552-6364</xsl:when>
                    <xsl:when test="$codePublisherID1='HOL'">1477-0911</xsl:when>
                    <xsl:when test="$codePublisherID1='HPC'">1741-2846</xsl:when>
                    <xsl:when test="$codePublisherID1='HPP'">1552-6372</xsl:when>
                    <xsl:when test="$codePublisherID1='HPQ'">1461-7277</xsl:when>
                    <xsl:when test="$codePublisherID1='HPY'">1740-2360</xsl:when>
                    <xsl:when test="$codePublisherID1='HRD'">1552-6712</xsl:when>
                    <xsl:when test="$codePublisherID1='HSB'">2150-6000</xsl:when>
                    <xsl:when test="$codePublisherID1='HSX'">1552-6720</xsl:when>
                    <xsl:when test="$codePublisherID1='HUM'">1741-282X</xsl:when>
                    <xsl:when test="$codePublisherID1='IAB'">1751-9292</xsl:when>
                    <xsl:when test="$codePublisherID1='IAS'">2049-1123</xsl:when>
                    <xsl:when test="$codePublisherID1='IBE'">1423-0070</xsl:when>
                    <xsl:when test="$codePublisherID1='ICJ'">1556-3855</xsl:when>
                    <xsl:when test="$codePublisherID1='ICS'">1460-356X</xsl:when>
                    <xsl:when test="$codePublisherID1='ICT'">1552-695X</xsl:when>
                    <xsl:when test="$codePublisherID1='IDV'">1741-6469</xsl:when>
                    <xsl:when test="$codePublisherID1='IER'">0973-0893</xsl:when>
                    <xsl:when test="$codePublisherID1='IFL'">1745-2651</xsl:when>
                    <xsl:when test="$codePublisherID1='IHR'">0975-5977</xsl:when>
                    <xsl:when test="$codePublisherID1='IJB'">1756-6878</xsl:when>
                    <xsl:when test="$codePublisherID1='IJD'">1530-7921</xsl:when>
                    <xsl:when test="$codePublisherID1='IJL'">1552-6941</xsl:when>
                    <xsl:when test="$codePublisherID1='IJM'">1744-795X</xsl:when>
                    <xsl:when test="$codePublisherID1='IJR'">1741-3176</xsl:when>
                    <xsl:when test="$codePublisherID1='IJS'">1940-2465</xsl:when>
                    <xsl:when test="$codePublisherID1='IJT'">1092-874X</xsl:when>
                    <xsl:when test="$codePublisherID1='IMP'">1475-7583</xsl:when>
                    <xsl:when test="$codePublisherID1='INI'">1753-4267</xsl:when>
                    <xsl:when test="$codePublisherID1='INT'">2159-340X</xsl:when>
                    <xsl:when test="$codePublisherID1='IOC'">1746-6067</xsl:when>
                    <xsl:when test="$codePublisherID1='IPS'">1460-373X</xsl:when>
                    <xsl:when test="$codePublisherID1='IRE'">1741-2862</xsl:when>
                    <xsl:when test="$codePublisherID1='IRS'">1461-7218</xsl:when>
                    <xsl:when test="$codePublisherID1='IRV'">2047-9433</xsl:when>
                    <xsl:when test="$codePublisherID1='IRX'">1552-6925</xsl:when>
                    <xsl:when test="$codePublisherID1='ISB'">1741-2870</xsl:when>
                    <xsl:when test="$codePublisherID1='ISC'">1538-4810</xsl:when>
                    <xsl:when test="$codePublisherID1='ISP'">1741-2854</xsl:when>
                    <xsl:when test="$codePublisherID1='ISQ'">1939-9987</xsl:when>
                    <xsl:when test="$codePublisherID1='ISS'">1461-7242</xsl:when>
                    <xsl:when test="$codePublisherID1='ISW'">1461-7234</xsl:when>
                    <xsl:when test="$codePublisherID1='ITQ'">1752-4989</xsl:when>
                    <xsl:when test="$codePublisherID1='IVI'">1473-8724</xsl:when>
                    <xsl:when test="$codePublisherID1='JAB'">1552-6879</xsl:when>
                    <xsl:when test="$codePublisherID1='JAD'">1557-1246</xsl:when>
                    <xsl:when test="$codePublisherID1='JAF'">2160-4061</xsl:when>
                    <xsl:when test="$codePublisherID1='JAG'">1552-4523</xsl:when>
                    <xsl:when test="$codePublisherID1='JAH'">1552-6887</xsl:when>
                    <xsl:when test="$codePublisherID1='JAP'">1532-5725</xsl:when>
                    <xsl:when test="$codePublisherID1='JAR'">1552-6895</xsl:when>
                    <xsl:when test="$codePublisherID1='JAS'">1745-2538</xsl:when>
                    <xsl:when test="$codePublisherID1='JAX'">1937-0245</xsl:when>
                    <xsl:when test="$codePublisherID1='JBA'">1530-8022</xsl:when>
                    <xsl:when test="$codePublisherID1='JBC'">1530-8030</xsl:when>
                    <xsl:when test="$codePublisherID1='JBD'">1464-0651</xsl:when>
                    <xsl:when test="$codePublisherID1='JBP'">1552-4558</xsl:when>
                    <xsl:when test="$codePublisherID1='JBR'">1552-4531</xsl:when>
                    <xsl:when test="$codePublisherID1='JBS'">1552-4566</xsl:when>
                    <xsl:when test="$codePublisherID1='JBX'">1552-454X</xsl:when>
                    <xsl:when test="$codePublisherID1='JCA'">1552-4590</xsl:when>
                    <xsl:when test="$codePublisherID1='JCC'">1552-5422</xsl:when>
                    <xsl:when test="$codePublisherID1='JCD'">1556-0856</xsl:when>
                    <xsl:when test="$codePublisherID1='JCE'">1552-5414</xsl:when>
                    <xsl:when test="$codePublisherID1='JCH'">1461-7250</xsl:when>
                    <xsl:when test="$codePublisherID1='JCI'">1552-4612</xsl:when>
                    <xsl:when test="$codePublisherID1='JCL'">1741-6442</xsl:when>
                    <xsl:when test="$codePublisherID1='JCM'">1530-793X</xsl:when>
                    <xsl:when test="$codePublisherID1='JCN'">1708-8283</xsl:when>
                    <xsl:when test="$codePublisherID1='JCR'">2328-174X</xsl:when>
                    <xsl:when test="$codePublisherID1='JCS'">1741-2897</xsl:when>
                    <xsl:when test="$codePublisherID1='JCX'">1940-5200</xsl:when>
                    <xsl:when test="$codePublisherID1='JDI'">2047-9468</xsl:when>
                    <xsl:when test="$codePublisherID1='JDM'">1552-5430</xsl:when>
                    <xsl:when test="$codePublisherID1='JDS'">1745-2546</xsl:when>
                    <xsl:when test="$codePublisherID1='JEA'">1552-5449</xsl:when>
                    <xsl:when test="$codePublisherID1='JEB'">1935-1054</xsl:when>
                    <xsl:when test="$codePublisherID1='JED'">1552-5465</xsl:when>
                    <xsl:when test="$codePublisherID1='JEG'">2162-9501</xsl:when>
                    <xsl:when test="$codePublisherID1='JEI'">2154-3992</xsl:when>
                    <xsl:when test="$codePublisherID1='JEN'">1744-2583</xsl:when>
                    <xsl:when test="$codePublisherID1='JEP'">1530-8006</xsl:when>
                    <xsl:when test="$codePublisherID1='JES'">1740-2379</xsl:when>
                    <xsl:when test="$codePublisherID1='JFE'">1532-172X</xsl:when>
                    <xsl:when test="$codePublisherID1='JFH'">1552-5473</xsl:when>
                    <xsl:when test="$codePublisherID1='JFI'">1552-5481</xsl:when>
                    <xsl:when test="$codePublisherID1='JFM'">1532-2750</xsl:when>
                    <xsl:when test="$codePublisherID1='JFN'">1552-549X</xsl:when>
                    <xsl:when test="$codePublisherID1='JFS'">1530-8049</xsl:when>
                    <xsl:when test="$codePublisherID1='JGM'">1741-7090</xsl:when>
                    <xsl:when test="$codePublisherID1='JGP'">1552-5708</xsl:when>
                    <xsl:when test="$codePublisherID1='JHH'">1552-5716</xsl:when>
                    <xsl:when test="$codePublisherID1='JHI'">1741-2811</xsl:when>
                    <xsl:when test="$codePublisherID1='JHL'">1552-5732</xsl:when>
                    <xsl:when test="$codePublisherID1='JHM'">0973-0729</xsl:when>
                    <xsl:when test="$codePublisherID1='JHN'">1552-5724</xsl:when>
                    <xsl:when test="$codePublisherID1='JHP'">1552-650X</xsl:when>
                    <xsl:when test="$codePublisherID1='JHS'">2043-6289</xsl:when>
                    <xsl:when test="$codePublisherID1='JHT'">1557-7554</xsl:when>
                    <xsl:when test="$codePublisherID1='JHV'">0973-0737</xsl:when>
                    <xsl:when test="$codePublisherID1='JIA'">2325-9582</xsl:when>
                    <xsl:when test="$codePublisherID1='JIC'">1525-1489</xsl:when>
                    <xsl:when test="$codePublisherID1='JID'">1744-6309</xsl:when>
                    <xsl:when test="$codePublisherID1='JIM'">1530-8138</xsl:when>
                    <xsl:when test="$codePublisherID1='JIR'">1472-9296</xsl:when>
                    <xsl:when test="$codePublisherID1='JIS'">1741-6485</xsl:when>
                    <xsl:when test="$codePublisherID1='JIT'">1530-8057</xsl:when>
                    <xsl:when test="$codePublisherID1='JIV'">1552-6518</xsl:when>
                    <xsl:when test="$codePublisherID1='JLO'">1939-7089</xsl:when>
                    <xsl:when test="$codePublisherID1='JLS'">1552-6526</xsl:when>
                    <xsl:when test="$codePublisherID1='JMC'">2161-4326</xsl:when>
                    <xsl:when test="$codePublisherID1='JMD'">1552-6550</xsl:when>
                    <xsl:when test="$codePublisherID1='JME'">1552-6658</xsl:when>
                    <xsl:when test="$codePublisherID1='JMH'">1557-9891</xsl:when>
                    <xsl:when test="$codePublisherID1='JMI'">1552-6542</xsl:when>
                    <xsl:when test="$codePublisherID1='JMK'">1552-6534</xsl:when>
                    <xsl:when test="$codePublisherID1='JMM'">1552-6828</xsl:when>
                    <xsl:when test="$codePublisherID1='JMO'">2161-4342</xsl:when>
                    <xsl:when test="$codePublisherID1='JMQ'">2161-430X</xsl:when>
                    <xsl:when test="$codePublisherID1='JMT'">1945-0079</xsl:when>
                    <xsl:when test="$codePublisherID1='JNT'">1745-5294</xsl:when>
                    <xsl:when test="$codePublisherID1='JOA'">2162-9536</xsl:when>
                    <xsl:when test="$codePublisherID1='JOB'">1552-4582</xsl:when>
                    <xsl:when test="$codePublisherID1='JOC'">1741-2900</xsl:when>
                    <xsl:when test="$codePublisherID1='JOD'">1945-1369</xsl:when>
                    <xsl:when test="$codePublisherID1='JOE'">0973-0745</xsl:when>
                    <xsl:when test="$codePublisherID1='JOI'">0975-5969</xsl:when>
                    <xsl:when test="$codePublisherID1='JOM'">1557-1211</xsl:when>
                    <xsl:when test="$codePublisherID1='JOP'">1461-7285</xsl:when>
                    <xsl:when test="$codePublisherID1='JOS'">1741-2978</xsl:when>
                    <xsl:when test="$codePublisherID1='JOT'">1476-6728</xsl:when>
                    <xsl:when test="$codePublisherID1='JOU'">1741-3001</xsl:when>
                    <xsl:when test="$codePublisherID1='JPA'">1557-5144</xsl:when>
                    <xsl:when test="$codePublisherID1='JPE'">1552-6577</xsl:when>
                    <xsl:when test="$codePublisherID1='JPF'">1530-8014</xsl:when>
                    <xsl:when test="$codePublisherID1='JPH'">1552-6585</xsl:when>
                    <xsl:when test="$codePublisherID1='JPL'">1552-6593</xsl:when>
                    <xsl:when test="$codePublisherID1='JPO'">1532-8457</xsl:when>
                    <xsl:when test="$codePublisherID1='JPP'">1531-1937</xsl:when>
                    <xsl:when test="$codePublisherID1='JPR'">1460-3578</xsl:when>
                    <xsl:when test="$codePublisherID1='JRC'">1552-731X</xsl:when>
                    <xsl:when test="$codePublisherID1='JRI'">1741-2943</xsl:when>
                    <xsl:when test="$codePublisherID1='JRN'">1744-988X</xsl:when>
                    <xsl:when test="$codePublisherID1='JRP'">1530-7964</xsl:when>
                    <xsl:when test="$codePublisherID1='JSA'">1741-2951</xsl:when>
                    <xsl:when test="$codePublisherID1='JSD'">0973-4074</xsl:when>
                    <xsl:when test="$codePublisherID1='JSE'">1552-7794</xsl:when>
                    <xsl:when test="$codePublisherID1='JSI'">1552-7808</xsl:when>
                    <xsl:when test="$codePublisherID1='JSM'">1530-7972</xsl:when>
                    <xsl:when test="$codePublisherID1='JSP'">1745-5286</xsl:when>
                    <xsl:when test="$codePublisherID1='JSR'">1552-7379</xsl:when>
                    <xsl:when test="$codePublisherID1='JSS'">1552-7638</xsl:when>
                    <xsl:when test="$codePublisherID1='JSW'">1741-296X</xsl:when>
                    <xsl:when test="$codePublisherID1='JTC'">1530-7980</xsl:when>
                    <xsl:when test="$codePublisherID1='JTD'">1552-7840</xsl:when>
                    <xsl:when test="$codePublisherID1='JTE'">1552-7816</xsl:when>
                    <xsl:when test="$codePublisherID1='JTP'">1460-3667</xsl:when>
                    <xsl:when test="$codePublisherID1='JTR'">1552-6763</xsl:when>
                    <xsl:when test="$codePublisherID1='JUH'">1552-6771</xsl:when>
                    <xsl:when test="$codePublisherID1='JVC'">1741-2986</xsl:when>
                    <xsl:when test="$codePublisherID1='JVM'">1479-1870</xsl:when>
                    <xsl:when test="$codePublisherID1='LAL'">1461-7293</xsl:when>
                    <xsl:when test="$codePublisherID1='LAP'">1552-678X</xsl:when>
                    <xsl:when test="$codePublisherID1='LAS'">1756-6053</xsl:when>
                    <xsl:when test="$codePublisherID1='LCH'">1743-9752</xsl:when>
                    <xsl:when test="$codePublisherID1='LDQ'">2168-376X</xsl:when>
                    <xsl:when test="$codePublisherID1='LDX'">1538-4780</xsl:when>
                    <xsl:when test="$codePublisherID1='LEA'">1742-7169</xsl:when>
                    <xsl:when test="$codePublisherID1='LEC'">1470-9325</xsl:when>
                    <xsl:when test="$codePublisherID1='LIS'">1741-6477</xsl:when>
                    <xsl:when test="$codePublisherID1='LRT'">1477-0938</xsl:when>
                    <xsl:when test="$codePublisherID1='LSJ'">1538-9758</xsl:when>
                    <xsl:when test="$codePublisherID1='LTJ'">1477-0946</xsl:when>
                    <xsl:when test="$codePublisherID1='LTR'">1477-0954</xsl:when>
                    <xsl:when test="$codePublisherID1='LUP'">1477-0962</xsl:when>
                    <xsl:when test="$codePublisherID1='MAR'">0973-8029</xsl:when>
                    <xsl:when test="$codePublisherID1='MCQ'">1552-6798</xsl:when>
                    <xsl:when test="$codePublisherID1='MCR'">1552-6801</xsl:when>
                    <xsl:when test="$codePublisherID1='MCS'">1460-3675</xsl:when>
                    <xsl:when test="$codePublisherID1='MCU'">1460-3586</xsl:when>
                    <xsl:when test="$codePublisherID1='MCX'">1552-6836</xsl:when>
                    <xsl:when test="$codePublisherID1='MDM'">1552-681X</xsl:when>
                    <xsl:when test="$codePublisherID1='MEC'">1947-6302</xsl:when>
                    <xsl:when test="$codePublisherID1='MEJ'">1945-0087</xsl:when>
                    <xsl:when test="$codePublisherID1='MHJ'">0973-0753</xsl:when>
                    <xsl:when test="$codePublisherID1='MIE'">1741-9883</xsl:when>
                    <xsl:when test="$codePublisherID1='MIL'">1477-9021</xsl:when>
                    <xsl:when test="$codePublisherID1='MLI'">2047-9441</xsl:when>
                    <xsl:when test="$codePublisherID1='MLQ'">1461-7307</xsl:when>
                    <xsl:when test="$codePublisherID1='MLS'">2321-0710</xsl:when>
                    <xsl:when test="$codePublisherID1='MMD'">1943-863X</xsl:when>
                    <xsl:when test="$codePublisherID1='MMJ'">1745-7912</xsl:when>
                    <xsl:when test="$codePublisherID1='MMR'">1558-6901</xsl:when>
                    <xsl:when test="$codePublisherID1='MMS'">1741-3028</xsl:when>
                    <xsl:when test="$codePublisherID1='MSJ'">1477-0970</xsl:when>
                    <xsl:when test="$codePublisherID1='MSS'">1750-6999</xsl:when>
                    <xsl:when test="$codePublisherID1='MSX'">2045-4147</xsl:when>
                    <xsl:when test="$codePublisherID1='MTQ'">1741-301X</xsl:when>
                    <xsl:when test="$codePublisherID1='MWC'">1750-6360</xsl:when>
                    <xsl:when test="$codePublisherID1='NAH'">2047-945X</xsl:when>
                    <xsl:when test="$codePublisherID1='NCP'">1941-2452</xsl:when>
                    <xsl:when test="$codePublisherID1='NEJ'">1477-0989</xsl:when>
                    <xsl:when test="$codePublisherID1='NER'">1741-3036</xsl:when>
                    <xsl:when test="$codePublisherID1='NMS'">1461-7315</xsl:when>
                    <xsl:when test="$codePublisherID1='NNR'">1552-6844</xsl:when>
                    <xsl:when test="$codePublisherID1='NRO'">1089-4098</xsl:when>
                    <xsl:when test="$codePublisherID1='NSQ'">1552-7409</xsl:when>
                    <xsl:when test="$codePublisherID1='NVS'">1552-7395</xsl:when>
                    <xsl:when test="$codePublisherID1='OAE'">1552-7417</xsl:when>
                    <xsl:when test="$codePublisherID1='OPP'">1477-092X</xsl:when>
                    <xsl:when test="$codePublisherID1='ORG'">1461-7323</xsl:when>
                    <xsl:when test="$codePublisherID1='ORM'">1552-7425</xsl:when>
                    <xsl:when test="$codePublisherID1='OSS'">1741-3044</xsl:when>
                    <xsl:when test="$codePublisherID1='PAA'">1839-2598</xsl:when>
                    <xsl:when test="$codePublisherID1='PAS'">1552-7514</xsl:when>
                    <xsl:when test="$codePublisherID1='PBI'">1538-4772</xsl:when>
                    <xsl:when test="$codePublisherID1='PDS'">0973-0761</xsl:when>
                    <xsl:when test="$codePublisherID1='PED'">1757-9767</xsl:when>
                    <xsl:when test="$codePublisherID1='PEN'">1941-2444</xsl:when>
                    <xsl:when test="$codePublisherID1='PFR'">1552-7530</xsl:when>
                    <xsl:when test="$codePublisherID1='PIA'">1477-027X</xsl:when>
                    <xsl:when test="$codePublisherID1='PIB'">2041-2975</xsl:when>
                    <xsl:when test="$codePublisherID1='PIC'">2041-2983</xsl:when>
                    <xsl:when test="$codePublisherID1='PID'">2041-2991</xsl:when>
                    <xsl:when test="$codePublisherID1='PIE'">2041-3009</xsl:when>
                    <xsl:when test="$codePublisherID1='PIF'">2041-3017</xsl:when>
                    <xsl:when test="$codePublisherID1='PIG'">2041-3025</xsl:when>
                    <xsl:when test="$codePublisherID1='PIH'">2041-3033</xsl:when>
                    <xsl:when test="$codePublisherID1='PII'">2041-3041</xsl:when>
                    <xsl:when test="$codePublisherID1='PIJ'">2041-305X</xsl:when>
                    <xsl:when test="$codePublisherID1='PIK'">2041-3068</xsl:when>
                    <xsl:when test="$codePublisherID1='PIL'">2041-3076</xsl:when>
                    <xsl:when test="$codePublisherID1='PIM'">2041-3084</xsl:when>
                    <xsl:when test="$codePublisherID1='PIN'">2041-3092</xsl:when>
                    <xsl:when test="$codePublisherID1='PIO'">1748-0078</xsl:when>
                    <xsl:when test="$codePublisherID1='PIP'">1754-338X</xsl:when>
                    <xsl:when test="$codePublisherID1='PLT'">1741-3052</xsl:when>
                    <xsl:when test="$codePublisherID1='PMJ'">1477-030X</xsl:when>
                    <xsl:when test="$codePublisherID1='PNZ'">2041-0611</xsl:when>
                    <xsl:when test="$codePublisherID1='POM'">1741-3087</xsl:when>
                    <xsl:when test="$codePublisherID1='POS'">1552-7441</xsl:when>
                    <xsl:when test="$codePublisherID1='PPA'">1749-4192</xsl:when>
                    <xsl:when test="$codePublisherID1='PPE'">1741-3060</xsl:when>
                    <xsl:when test="$codePublisherID1='PPG'">1477-0296</xsl:when>
                    <xsl:when test="$codePublisherID1='PPN'">1552-7468</xsl:when>
                    <xsl:when test="$codePublisherID1='PPQ'">1460-3683</xsl:when>
                    <xsl:when test="$codePublisherID1='PPS'">1745-6924</xsl:when>
                    <xsl:when test="$codePublisherID1='PQX'">1552-745X</xsl:when>
                    <xsl:when test="$codePublisherID1='PRB'">1741-3079</xsl:when>
                    <xsl:when test="$codePublisherID1='PRF'">1477-111X</xsl:when>
                    <xsl:when test="$codePublisherID1='PRQ'">1938-2758</xsl:when>
                    <xsl:when test="$codePublisherID1='PSC'">1461-734X</xsl:when>
                    <xsl:when test="$codePublisherID1='PSP'">1552-7433</xsl:when>
                    <xsl:when test="$codePublisherID1='PSR'">1532-7957</xsl:when>
                    <xsl:when test="$codePublisherID1='PSS'">1467-9280</xsl:when>
                    <xsl:when test="$codePublisherID1='PTX'">1552-7476</xsl:when>
                    <xsl:when test="$codePublisherID1='PUN'">1741-3095</xsl:when>
                    <xsl:when test="$codePublisherID1='PUS'">1361-6609</xsl:when>
                    <xsl:when test="$codePublisherID1='PVS'">1521-5768</xsl:when>
                    <xsl:when test="$codePublisherID1='PWM'">1552-7549</xsl:when>
                    <xsl:when test="$codePublisherID1='PWQ'">1471-6402</xsl:when>
                    <xsl:when test="$codePublisherID1='QHR'">1552-7557</xsl:when>
                    <xsl:when test="$codePublisherID1='QIX'">1552-7565</xsl:when>
                    <xsl:when test="$codePublisherID1='QRJ'">1741-3109</xsl:when>
                    <xsl:when test="$codePublisherID1='QSW'">1741-3117</xsl:when>
                    <xsl:when test="$codePublisherID1='RAC'">1741-3125</xsl:when>
                    <xsl:when test="$codePublisherID1='RAS'">1461-7226</xsl:when>
                    <xsl:when test="$codePublisherID1='RCB'">1538-4853</xsl:when>
                    <xsl:when test="$codePublisherID1='REA'">2047-6094</xsl:when>
                    <xsl:when test="$codePublisherID1='REL'">1745-526X</xsl:when>
                    <xsl:when test="$codePublisherID1='RER'">1935-1046</xsl:when>
                    <xsl:when test="$codePublisherID1='REV'">2163-3134</xsl:when>
                    <xsl:when test="$codePublisherID1='RMI'">0975-4709</xsl:when>
                    <xsl:when test="$codePublisherID1='ROA'">1552-7573</xsl:when>
                    <xsl:when test="$codePublisherID1='ROP'">1552-759X</xsl:when>
                    <xsl:when test="$codePublisherID1='RRE'">1935-1038</xsl:when>
                    <xsl:when test="$codePublisherID1='RRP'">1552-8502</xsl:when>
                    <xsl:when test="$codePublisherID1='RSH'">1757-9147</xsl:when>
                    <xsl:when test="$codePublisherID1='RSM'">1834-5530</xsl:when>
                    <xsl:when test="$codePublisherID1='RSS'">1461-7358</xsl:when>
                    <xsl:when test="$codePublisherID1='RSW'">1552-7581</xsl:when>
                    <xsl:when test="$codePublisherID1='RSX'">1933-7205</xsl:when>
                    <xsl:when test="$codePublisherID1='SAC'">1552-8308</xsl:when>
                    <xsl:when test="$codePublisherID1='SAD'">0973-1733</xsl:when>
                    <xsl:when test="$codePublisherID1='SAG'">1552-826X</xsl:when>
                    <xsl:when test="$codePublisherID1='SAR'">1741-3141</xsl:when>
                    <xsl:when test="$codePublisherID1='SAS'">0973-0788</xsl:when>
                    <xsl:when test="$codePublisherID1='SAX'">1573-286X</xsl:when>
                    <xsl:when test="$codePublisherID1='SCE'">1745-5235</xsl:when>
                    <xsl:when test="$codePublisherID1='SCH'">0976-3538</xsl:when>
                    <xsl:when test="$codePublisherID1='SCP'">1461-7404</xsl:when>
                    <xsl:when test="$codePublisherID1='SCV'">1940-5596</xsl:when>
                    <xsl:when test="$codePublisherID1='SCX'">1552-8545</xsl:when>
                    <xsl:when test="$codePublisherID1='SDI'">1460-3640</xsl:when>
                    <xsl:when test="$codePublisherID1='SDJ'">1477-0288</xsl:when>
                    <xsl:when test="$codePublisherID1='SED'">1538-4764</xsl:when>
                    <xsl:when test="$codePublisherID1='SEX'">1461-7382</xsl:when>
                    <xsl:when test="$codePublisherID1='SHM'">1741-3168</xsl:when>
                    <xsl:when test="$codePublisherID1='SIH'">0973-080X</xsl:when>
                    <xsl:when test="$codePublisherID1='SIR'">2042-0587</xsl:when>
                    <xsl:when test="$codePublisherID1='SJP'">1651-1905</xsl:when>
                    <xsl:when test="$codePublisherID1='SLG'">1943-3409</xsl:when>
                    <xsl:when test="$codePublisherID1='SLR'">1477-0326</xsl:when>
                    <xsl:when test="$codePublisherID1='SLS'">1461-7390</xsl:when>
                    <xsl:when test="$codePublisherID1='SMJ'">1477-0342</xsl:when>
                    <xsl:when test="$codePublisherID1='SMM'">1477-0334</xsl:when>
                    <xsl:when test="$codePublisherID1='SMQ'">1539-4093</xsl:when>
                    <xsl:when test="$codePublisherID1='SMR'">1552-8294</xsl:when>
                    <xsl:when test="$codePublisherID1='SMX'">1467-9531</xsl:when>
                    <xsl:when test="$codePublisherID1='SOC'">1469-8684</xsl:when>
                    <xsl:when test="$codePublisherID1='SOE'">1939-8573</xsl:when>
                    <xsl:when test="$codePublisherID1='SOQ'">1741-315X</xsl:when>
                    <xsl:when test="$codePublisherID1='SPA'">1946-1607</xsl:when>
                    <xsl:when test="$codePublisherID1='SPH'">1941-0921</xsl:when>
                    <xsl:when test="$codePublisherID1='SPI'">1461-7374</xsl:when>
                    <xsl:when test="$codePublisherID1='SPQ'">1939-8999</xsl:when>
                    <xsl:when test="$codePublisherID1='SPR'">1460-3608</xsl:when>
                    <xsl:when test="$codePublisherID1='SRI'">1553-3514</xsl:when>
                    <xsl:when test="$codePublisherID1='SSC'">1552-8286</xsl:when>
                    <xsl:when test="$codePublisherID1='SSI'">1461-7412</xsl:when>
                    <xsl:when test="$codePublisherID1='SSS'">1460-3659</xsl:when>
                    <xsl:when test="$codePublisherID1='STH'">1552-8251</xsl:when>
                    <xsl:when test="$codePublisherID1='STS'">0973-0796</xsl:when>
                    <xsl:when test="$codePublisherID1='STX'">1467-9558</xsl:when>
                    <xsl:when test="$codePublisherID1='TAB'">1759-7218</xsl:when>
                    <xsl:when test="$codePublisherID1='TAG'">1756-2848</xsl:when>
                    <xsl:when test="$codePublisherID1='TAK'">1753-9455</xsl:when>
                    <xsl:when test="$codePublisherID1='TAM'">1758-8359</xsl:when>
                    <xsl:when test="$codePublisherID1='TAN'">1756-2864</xsl:when>
                    <xsl:when test="$codePublisherID1='TAP'">1461-7447</xsl:when>
                    <xsl:when test="$codePublisherID1='TAR'">1753-4666</xsl:when>
                    <xsl:when test="$codePublisherID1='TAS'">1461-7463</xsl:when>
                    <xsl:when test="$codePublisherID1='TAU'">1756-2880</xsl:when>
                    <xsl:when test="$codePublisherID1='TCN'">1552-7832</xsl:when>
                    <xsl:when test="$codePublisherID1='TCP'">1552-3861</xsl:when>
                    <xsl:when test="$codePublisherID1='TCR'">1461-7439</xsl:when>
                    <xsl:when test="$codePublisherID1='TCS'">1460-3616</xsl:when>
                    <xsl:when test="$codePublisherID1='TDE'">1554-6063</xsl:when>
                    <xsl:when test="$codePublisherID1='TEC'">1538-4845</xsl:when>
                    <xsl:when test="$codePublisherID1='TES'">1944-4931</xsl:when>
                    <xsl:when test="$codePublisherID1='TFJ'">1552-3950</xsl:when>
                    <xsl:when test="$codePublisherID1='THE'">1461-7455</xsl:when>
                    <xsl:when test="$codePublisherID1='THR'">1742-9692</xsl:when>
                    <xsl:when test="$codePublisherID1='TIA'">1940-5588</xsl:when>
                    <xsl:when test="$codePublisherID1='TIH'">1477-0393</xsl:when>
                    <xsl:when test="$codePublisherID1='TIM'">1477-0369</xsl:when>
                    <xsl:when test="$codePublisherID1='TJX'">2044-2696</xsl:when>
                    <xsl:when test="$codePublisherID1='TMT'">1085-9373</xsl:when>
                    <xsl:when test="$codePublisherID1='TOP'">1532-8023</xsl:when>
                    <xsl:when test="$codePublisherID1='TOU'">1741-3206</xsl:when>
                    <xsl:when test="$codePublisherID1='TPA'">2047-8720</xsl:when>
                    <xsl:when test="$codePublisherID1='TPJ'">1552-7522</xsl:when>
                    <xsl:when test="$codePublisherID1='TPS'">1461-7471</xsl:when>
                    <xsl:when test="$codePublisherID1='TRA'">1477-0350</xsl:when>
                    <xsl:when test="$codePublisherID1='TRE'">1741-3192</xsl:when>
                    <xsl:when test="$codePublisherID1='TRJ'">1746-7748</xsl:when>
                    <xsl:when test="$codePublisherID1='TRN'">1759-8931</xsl:when>
                    <xsl:when test="$codePublisherID1='TRS'">1996-7284</xsl:when>
                    <xsl:when test="$codePublisherID1='TSO'">1939-862X</xsl:when>
                    <xsl:when test="$codePublisherID1='TTJ'">2044-2556</xsl:when>
                    <xsl:when test="$codePublisherID1='TVA'">1552-8324</xsl:when>
                    <xsl:when test="$codePublisherID1='TVN'">1552-8316</xsl:when>
                    <xsl:when test="$codePublisherID1='UAR'">1552-8332</xsl:when>
                    <xsl:when test="$codePublisherID1='UEX'">1552-8340</xsl:when>
                    <xsl:when test="$codePublisherID1='UIX'">1096-0910</xsl:when>
                    <xsl:when test="$codePublisherID1='UPD'">1945-0109</xsl:when>
                    <xsl:when test="$codePublisherID1='USJ'">1360-063X</xsl:when>
                    <xsl:when test="$codePublisherID1='VAW'">1552-8448</xsl:when>
                    <xsl:when test="$codePublisherID1='VCJ'">1741-3214</xsl:when>
                    <xsl:when test="$codePublisherID1='VCU'">1741-2994</xsl:when>
                    <xsl:when test="$codePublisherID1='VES'">1938-9116</xsl:when>
                    <xsl:when test="$codePublisherID1='VIS'">2249-5304</xsl:when>
                    <xsl:when test="$codePublisherID1='WCX'">1552-8472</xsl:when>
                    <xsl:when test="$codePublisherID1='WES'">1469-8722</xsl:when>
                    <xsl:when test="$codePublisherID1='WIH'">1477-0385</xsl:when>
                    <xsl:when test="$codePublisherID1='WJN'">1552-8456</xsl:when>
                    <xsl:when test="$codePublisherID1='WOM'">2154-3941</xsl:when>
                    <xsl:when test="$codePublisherID1='WOX'">1552-8464</xsl:when>
                    <xsl:when test="$codePublisherID1='WPJ'">1936-0924</xsl:when>
                    <xsl:when test="$codePublisherID1='YAS'">1552-8499</xsl:when>
                    <xsl:when test="$codePublisherID1='YEC'">2154-400X</xsl:when>
                    <xsl:when test="$codePublisherID1='YJJ'">1747-6283</xsl:when>
                    <xsl:when test="$codePublisherID1='YOU'">1741-3222</xsl:when>
                    <xsl:when test="$codePublisherID1='YVJ'">1556-9330</xsl:when>
                </xsl:choose>
            </xsl:variable>
</xsl:stylesheet>