--
-- QuizIT
-- Copyright © 2017 Victor CHEN, Andy HUANG, Kilian CHOLLET, Lucas MASSON
--

SET NAMES 'utf8' COLLATE 'utf8_general_ci';

--
-- Database : QuizIT
--

-- --------------------------------------------------------

--
-- Table users
--

CREATE TABLE users (
	id_user INTEGER NOT NULL AUTO_INCREMENT,	
	login VARCHAR(20) NOT NULL UNIQUE,
	password VARCHAR(40) NOT NULL,
	email VARCHAR(100),
	score INTEGER DEFAULT 0,
	isAdmin BOOLEAN DEFAULT FALSE,
	CONSTRAINT PK_USERS PRIMARY KEY (id_user)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Content users
--

INSERT INTO users (login, password, email, isAdmin) VALUES
('Xaizo', 'xaizo', 'xaizo@xaizo.fr', true),
('Ketedaro', 'kete', 'kete@kete.fr', true),
('Yoshiiix', 'yos', 'yos@yos.fr', false),
('H0tmilk', 'hot', 'hot@hot.fr', true);

-- --------------------------------------------------------

--
-- Table questions // Composition descendante
--

CREATE TABLE questions (
	id_quest INTEGER NOT NULL AUTO_INCREMENT,
	typeQuest VARCHAR(10) NOT NULL,
	topicQuest VARCHAR(50) NOT NULL,
	questContent VARCHAR(255) NOT NULL,
	mp3_link VARCHAR(255),
	id_submitter INTEGER NOT NULL,
	validation BOOLEAN DEFAULT 0,
	CONSTRAINT PK_QUESTIONS PRIMARY KEY (id_quest),
	FOREIGN KEY (id_submitter) REFERENCES users (id_user)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Content questions
--

INSERT INTO questions (typeQuest, topicQuest, questContent, mp3_link, id_submitter, validation) VALUES
('MCQ', 'Le débarquement de Normandie', 'Où étaient tournées les scènes de débarquement du film "Il faut sauver le soldat Ryan" ?', null, '1', true), -- 1
('MCQ', 'Le débarquement de Normandie', 'Où se trouvait le maréchal Rommel, responsable de la Normandie, le 6 juin 1944 ?', null, '1', true), -- 2
('MCQ', 'Le débarquement de Normandie', 'Sur combien de plages se concentrés les combats du 6 juin 1944 ?', null, '1', true), -- 3
('MCQ', 'Le débarquement de Normandie', 'Quel personnage était un ardent défenseur du projet de débarquement en Normandie ?', null, '1', true), -- 4
('MCQ', 'Les scientifiques', 'Quelle planète Urbain Le Verrier a-t-il découvert par des calculs mathématiques ?', null, '1', true), -- 5
('MCQ', 'Les scientifiques', 'Sur quelle(s) île(s) Darwin a-t-il développé sa théorie sur l’évolution des espèces ?', null, '1', true), -- 6
('MCQ', 'Les scientifiques', 'Quel scientifique a donné son nom à l’unité d’intensité du courant électrique ?', null, '1', true), -- 7
('MCQ', 'Les scientifiques', 'Par quel nom Nikola Tesla a-t-il baptisé l\'invention de la première voiture électrique ?', null, '1', true), -- 8
('MCQ', 'Les félins', 'De quelle manière voient le chat ? Choisissez la bonne réponse.', null, '1', true), -- 9
('MCQ', 'Les félins', 'À quelle distance un chat peut-il sentir un autre chat ?', null, '1', true), -- 10
('MCQ', 'Les félins', 'Quel félin est le seul à vivre en groupe ?', null, '1', true), -- 11
('MCQ', 'Les félins', 'Quel contient les félins n\'ont-ils pas colonisé naturellement ?', null, '1', true), -- 12
('MCQ', 'Les États-Unis', 'Quel État est le dernier à avoir joint les États-Unis ?', null, '1', true), -- 13
('MCQ', 'Les États-Unis', 'Combien de médailles d\'or Jesse Owens a-t-il remporté devant Hitler ?', null, '1', true), -- 14
('MCQ', 'Les États-Unis', 'Au total, combien d\'Américains ont marché sur la Lune ?', null, '1', true), -- 15
('MCQ', 'Les États-Unis', 'Combien d\'États comptent les États-Unis ?', null, '1', true), -- 16
('MCQ', 'Les ordinateurs', 'Combien mesurait la première disquette (en diamètre) ?', null, '1', true), -- 17
('MCQ', 'Les ordinateurs', 'Quelle capacité avaient les premières disquettes ?', null, '1', true), -- 18
('MCQ', 'Les ordinateurs', 'En quelle année le premier site web a été mis en ligne ?', null, '1', true), -- 19
('MCQ', 'Les ordinateurs', 'Quel est le navigateur qui a popularisé l\'utilisation des images dans un site web ?', null, '1', true), -- 20
('MCQ', 'Culture du monde', 'Un animal rare est un des symboles de la Nouvelle-Zélande, lequel ?', null, '1', true), -- 21
('MCQ', 'Culture du monde', 'Un des symboles de la France est le coq, mais il l\'est également ... (Complétez)', null, '1', true), -- 22
('MCQ', 'Culture du monde', 'Si, dans un pays européen vous entendez (étonnamment en langue française)', null, '1', true), -- 23
('MCQ', 'Culture du monde', 'De quel pays le castor à large queue plate est-il emblématique ?', null, '1', true), -- 24
('MCQ', 'Le monde en 2016', 'Quel film a remporté l’Oscar du meilleur film en 2016 ?', null, '1', true), -- 25
('MCQ', 'Le monde en 2016', 'En quel mois a eu lieu l\'ouragan Matthew qui a tué près de 1000 personnes en Haïti ?', null, '1', true), -- 26
('MCQ', 'Le monde en 2016', 'Quel prix Bob Dylan, chanteur et poète, a-t-il reçu en 2016 ?', null, '1', true), -- 27
('MCQ', 'Le monde en 2016', 'Quel cycliste a remporté le Tour de France en 2016 ?', null, '1', true), -- 28
('MCQ', 'La Coupe du monde de football', 'Quel pays a remporté deux fois d\'affilé la Coupe du monde ?', null, '1', true), -- 29
('MCQ', 'La Coupe du monde de football', 'Quel pays détient du record de défaites en finale de Coupe du monde ?', null, '1', true), -- 30
('MCQ', 'La Coupe du monde de football', 'Quel footballeur a champion du monde à trois reprises ?', null, '1', true), -- 31
('MCQ', 'La Coupe du monde de football', 'De quelle nationalité était le footballeur qui a marqué le premier but de la première édition de la Coupe du monde ?', null, '1', true), -- 32
('Blindtest', 'Chanson française', 'Qui est l\'artiste ?', 'quelquun_ma_dit.mp3', '1', true), -- 33
('Blindtest', 'Chanson française', 'Quel est le titre de cette chanson composée par Léo Ferré ?', 'leo_ferre_affiche_rouge.mp3', '2', true), -- 34
('Blindtest', 'Chanson française', 'Complétez les paroles "Je bois toutes les nuits mais..." de Serge Lama - Je suis malade', 'leo_ferre_affiche_rouge.mp3', '2', true), -- 35
('Blindtest', 'Chanson française', 'En quelle année cet album a été le plus vendu ?', 'christophe_mae_on_trace_la_route.mp3', '2', true), -- 36
('Blindtest', 'Pop / Electro', 'Qui est l\'artiste ?', 'calvin_harris_this_is_what_you_came_for.mp3', '1', true), -- 37
('Blindtest', 'Pop / Electro', 'Quel est le titre de cette chanson composée par Ed Sheeran ?', 'shape_of_you.mp3', '2', true), -- 38
('Blindtest', 'Pop / Electro', 'Complétez les paroles "Ooh, it\'s something magical..." Justin Timberlake - Can\'t Stop The Feeling !', 'cant_stop_the_feeling.mp3', '2', true), -- 39
('Blindtest', 'Pop / Electro', 'Quel est le titre de cette chanson ?', 'two_feets_go_fuck_yourself.mp3', '2', true), -- 40
('Blindtest', 'House', 'Qui est l\'artiste ?', 'no_promises.mp3', '1', true), -- 41
('Blindtest', 'House', 'Quel est le titre de cette chanson composée par Justin Caruso ?', 'talk_about_me.mp3', '2', true), -- 42
('Blindtest', 'House', 'Complétez les paroles "It\'s been a long day..." Wiz Khalifa - See you again', 'see_you_again.mp3', '2', true), -- 43
('Blindtest', 'House', 'Quel est le titre de cette chanson ?', 'symphony.mp3', '2', true); -- 44


--
-- Data Test
--

/* SELECT * FROM questions WHERE typeQuest = 'MCQ'
ORDER BY RAND()
LIMIT 1; */

-- --------------------------------------------------------

--
-- Table answers
--

CREATE TABLE answers (
	id_answer INTEGER NOT NULL AUTO_INCREMENT,
	id_quest INTEGER NOT NULL,
	typeAnswer VARCHAR(15) NOT NULL, -- Type de réponse
	answerContent VARCHAR(255) NOT NULL, -- Réponse
	desc_answer VARCHAR(255), -- Description de la réponse
	isTrue BOOLEAN, -- Réponse juste ou non
	CONSTRAINT PK_ANSWERS PRIMARY KEY (id_answer),
	FOREIGN KEY (id_quest) REFERENCES questions (id_quest)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- answers content
--

INSERT INTO answers (id_quest, typeAnswer, answerContent, desc_answer, isTrue) VALUES
('1', 'MCQ', 'France', '', false),
('1', 'MCQ', 'Irlande', 'Les scènes de débarquement du film Il faut sauver le soldat Ryan ont été tournées en Irlande. La plupart des figurants étaient des réservistes de l’armée allemande.', true),
('1', 'MCQ', 'Allemagne', '', false),
('1', 'MCQ', 'Angleterre', '', false),
('2', 'MCQ', 'Pologne', '', false),
('2', 'MCQ', 'Allemagne', 'Et le 6 juin 1944, jour de l’invasion, Rommel fêtait l’anniversaire de sa femme en Allemagne. Il est rentré précipitamment à son poste de commandement à La Roche-Guyon.', true),
('2', 'MCQ', 'France', '', false),
('2', 'MCQ', 'Italie', '', false),
('3', 'MCQ', '5', 'Les combats se sont concentrés sur 5 plages : d’ouest en est, Utah et Omaha (armée américaine), Gold (armée britannique), Juno (armée canadienne) et Sword (armées britannique et française).', true),
('3', 'MCQ', '8', '', false),
('3', 'MCQ', '10', '', false),
('3', 'MCQ', '12', '', false),
('4', 'MCQ', 'Charles de Gaulle', '', false),
('4', 'MCQ', 'Winston Churchill', '', false),
('4', 'MCQ', 'Franklin Delano Roosevelt', 'Ce sont les Américains qui étaient partisans d’une attaque par la Manche, la voie la plus courte pour atteindre le cœur de l’Allemagne.', true),
('4', 'MCQ', 'Joseph Staline', '', false),
('5', 'MCQ', 'Neptune', 'En 1846, l’astronome français Urbain Le Verrier a prédit mathématiquement l’existence et la position de Neptune à partir de la trajectoire et des caractéristiques d’Uranus. Deux ans de calculs ont été nécessaires pour arriver à cette conclusion.', true),
('5', 'MCQ', 'Saturne', '', false),
('5', 'MCQ', 'Pluton', '', false),
('5', 'MCQ', 'Uranus', '', false),
('6', 'MCQ', 'Madagascar', '', false),
('6', 'MCQ', 'Îles Galápagos', 'C’est aux îles Galápagos, à l’ouest de l’Équateur, que Charles Darwin a récolté les nombreux échantillons qui lui permettront d’élaborer sa théorie sur l’évolution des espèces.', true),
('6', 'MCQ', 'Île Maurice', '', false),
('6', 'MCQ', 'Îles aux Cocos', '', false),
('7', 'MCQ', 'James Watt', '', false),
('7', 'MCQ', 'André Marie Ampère', 'Le physicien français André Marie Ampère, né en 1775, a réalisé d’importantes découvertes dans le domaine de l’électromagnétisme. On a donnée son nom à l’unité internationale de l’intensité du courant électrique : l’ampère.', true),
('7', 'MCQ', 'Dmitri Ivanovitch Mendeleïev', '', false),
('7', 'MCQ', 'Michael Faraday', '', false),
('8', 'MCQ', 'Chimie', '', false),
('8', 'MCQ', 'Optique', 'En optique, on doit au physicien, mathématicien et astronome anglais Isaac Newton une théorie de la couleur selon laquelle un prisme décompose la lumière blanche en un spectre visible. Et on lui doit aussi le télescope à réflexion.', true),
('8', 'MCQ', 'Biologie', '', false),
('8', 'MCQ', 'Médecine', '', false),
('9', 'MCQ', 'Le chat voit flou de loin et mal de près', 'Le chat voit flou de loin et mal de près. Sa vision la plus précise se situe entre 10 et 80 cm (4 et 32 po).', true),
('9', 'MCQ', 'Le chat voit mal de loin et flou de près', '', false),
('9', 'MCQ', 'Le chat voit à la fois flou de loin et de près', '', false),
('9', 'MCQ', 'Le chat voit à la fois mal de loin et de près', '', false),
('10', 'MCQ', '50 mètres', '', false),
('10', 'MCQ', '100 mètres', 'Le chat a un odorat si fin qui peut détecter la présence d’un autre chat à 100 m (325 pi) de distance. Il utilise pour cela son nez, mais aussi son organe de Jacobson, situé à l’avant du palais.', true),
('10', 'MCQ', '250 mètres', '', false),
('10', 'MCQ', '500 mètres', '', false),
('11', 'MCQ', 'Le tigre', '', false),
('11', 'MCQ', 'Le lion', 'Les lions sont les seuls félins à vivre en groupe. Ils évoluent généralement dans un clan composé de 1 à 3 mâles (dont un seul alpha), de 5 à 10 femelles et de leurs petits.', true),
('11', 'MCQ', 'La panthère', '', false),
('11', 'MCQ', 'Le puma', '', false),
('12', 'MCQ', 'Europe', '', false),
('12', 'MCQ', 'Amérique', '', false),
('12', 'MCQ', 'Antarctique', 'Les félins ont colonisé tous les continents, sauf l’Antarctique et l’Australie. Ce sont les humains qui ont introduit les félins en Australie.', true),
('12', 'MCQ', 'Asie', '', false),
('13', 'MCQ', 'Alaska', '', false),
('13', 'MCQ', 'Hawaï', 'Le 21 août 1959, Hawaï a été le dernier État à joindre les États-Unis.', true),
('13', 'MCQ', 'Arizona', '', false),
('13', 'MCQ', 'Nouveau-Mexique', '', false),
('14', 'MCQ', '2', '', false),
('14', 'MCQ', '3', '', false),
('14', 'MCQ', '4', 'Durant les Jeux olympiques d’été de 1936 à Berlin, Jesse Owens, le premier athlète afro-américain de renommée internationale, a remporté 4 médailles d’or sous les yeux d’Adolf Hitler.', true),
('14', 'MCQ', '5', '', false),
('15', 'MCQ', '6', '', false),
('15', 'MCQ', '8', '', false),
('15', 'MCQ', '10', '', false),
('15', 'MCQ', '12', 'Dans le cadre du programme Apollo (1969 à 1972), douze astronautes américains ont marché sur la Lune.', true),
('16', 'MCQ', '48', '', false),
('16', 'MCQ', '50', 'Les États-Unis sont composés de 50 États auxquels s’ajoutent le District de Columbia (comprenant la capitale Washington) et 5 territoires dépendants.', true),
('16', 'MCQ', '52', '', false),
('16', 'MCQ', '56', '', false),
('17', 'MCQ', '100 mm', '', false),
('17', 'MCQ', '200 mm', 'Les premières disquettes, mises au point à la fin des années 1960, mesuraient 200 mm (8 po) de diamètre.', true),
('17', 'MCQ', '300 mm', '', false),
('17', 'MCQ', '400 mm', '', false),
('18', 'MCQ', '200 ko', '', false),
('18', 'MCQ', '400 ko', 'En 1981, Sony présentait les premières disquettes de 3,5 po. Elles avaient une capacité de 400 ko. Ensuite vinrent les disquettes 3,5 po de 720 ko (double-density), puis celles de 1,44 Mo (high-density).', true),
('18', 'MCQ', '800 ko', '', false),
('18', 'MCQ', '1 mo', '', false),
('19', 'MCQ', '1983', '', false),
('19', 'MCQ', '1989', 'Le premier site web a été mis en ligne par le CERN, le Conseil européen pour la recherche nucléaire, en mars 1989.', true),
('19', 'MCQ', '1991', '', false),
('19', 'MCQ', '1995', '', false),
('20', 'MCQ', 'Netscape Navigator', '', false),
('20', 'MCQ', 'Mosaic', 'Le navigateur Mosaic, développé en 1993, est considéré comme le navigateur qui a popularisé Internet en affichant non seulement du texte, mais aussi des images.', true),
('20', 'MCQ', 'Nexus', '', false),
('20', 'MCQ', 'ViolaWWW', '', false),
('21', 'MCQ', 'Le weka', '', false),
('21', 'MCQ', 'Le kakariki', '', false),
('21', 'MCQ', 'Le kiwi', 'Le kiwi est un oiseau inoffensif et originaire de la Nouvelle-Zélande. Seulement trouvable dans ce pays, il en est le symbole de ce pays et de la nature.', true),
('21', 'MCQ', 'Le kea', '', false),
('22', 'MCQ', 'Aux Pays-Bas', '', false),
('22', 'MCQ', 'En Allemagne', '', false),
('22', 'MCQ', 'En Belgique francophone', 'Il fait référence à la chute de l\'Empire romain et l\'avènement de la Gaule.', true),
('22', 'MCQ', 'En Irlande', '', false),
('23', 'MCQ', 'Aux Pays-Bas', 'C\'est la devise royale, toujours en langue française, (celle de la maison d\'Orange-Nassau, depuis Guillaume le Taciturne en 1544).', true),
('23', 'MCQ', 'En Autriche', '', false),
('23', 'MCQ', 'En Norvège', '', false),
('23', 'MCQ', 'En Suisse', '', false),
('24', 'MCQ', 'Argentine', '', false),
('24', 'MCQ', 'Luxembourg', '', false),
('24', 'MCQ', 'Canada', 'Le castor à large queue plate est l\'emblème du Canada. Il figure même sur les pièces de 5 cents et sur un timbre canadien au moins.', true),
('24', 'MCQ', 'Chili', '', false),
('25', 'MCQ', 'The Revenant', '', false),
('25', 'MCQ', 'Spotlight', 'Spotlight, le long-métrage consacré à l’enquête journalistique du Boston Globe sur un scandale sexuel impliquant l’Église catholique, a créé la surprise en remportant la statuette du meilleur film au détriment du favori, The Revenant.', true),
('25', 'MCQ', 'Ex machina', '', false),
('25', 'MCQ', 'Mad Max', '', false),
('26', 'MCQ', 'Février', '', false),
('26', 'MCQ', 'Juin', '', false),
('26', 'MCQ', 'Août', '', false),
('26', 'MCQ', 'Octobre', 'Matthew, un ouragan de catégorie 5, a causé la mort de près de 1000 personnes en Haïti, en plus de faire des dizaines de milliards de dollars de dommage dans les Antilles jusqu’à la Floride.', true),
('27', 'MCQ', 'Golden Globe de la meilleure chanson originale', '', false),
('27', 'MCQ', 'Prix Pulitzer : Citation spéciale', '', false),
('27', 'MCQ', 'Prix Nobel de littérature', 'L’Académie suédoise a remis le prix Nobel de littérature au chanteur et poète Bob Dylan « pour avoir créé dans le cadre de la grande tradition de la musique américaine de nouveaux modes d’expression poétique ».', true),
('27', 'MCQ', 'Grammy Award de la meilleure prestation vocale rock masculine', '', false),
('28', 'MCQ', 'Christopher Froome', 'En 2016, Christopher Froome remporte son troisième Tour de France après ceux de 2013 et de 2015.', true),
('28', 'MCQ', 'Romain Bardet', '', false),
('28', 'MCQ', 'Nairo Quintana', '', false),
('28', 'MCQ', 'Adam Yates', '', false),
('29', 'MCQ', 'France', '', false),
('29', 'MCQ', 'Brésil', 'Le Brésil a chacun gagné deux Coupes du monde consécutives : en 1958 et 1962.', true),
('29', 'MCQ', 'Allemagne', '', false),
('29', 'MCQ', 'Angleterre', '', false),
('30', 'MCQ', 'Brésil', '', false),
('30', 'MCQ', 'Argentine', '', false),
('30', 'MCQ', 'Pays-Bas', 'Les Pays-Bas ont participé à trois finales : 1974, 1978 et 2010. Ils ont perdu à chaque occasion. Ils détiennent ainsi le record du plus grand nombre de défaites en finales sans jamais avoir remporté la Coupe du monde de football.', true),
('30', 'MCQ', 'Suède', '', false),
('31', 'MCQ', 'Ronaldo (Ronaldo Luis Nazário de Lima)', '', false),
('31', 'MCQ', 'Pelé', 'Edson Arantes do Nascimento, dit Pelé, est le seul footballeur à avoir été champion du monde à trois reprises : en 1958, 1962 et 1970.', true),
('31', 'MCQ', 'Zinedine Zidane', '', false),
('31', 'MCQ', 'Diego Maradona', '', false),
('32', 'MCQ', 'Brésilien', '', false),
('32', 'MCQ', 'Français', 'Le 13 juillet 1930, le Français Lucien Laurent marque le premier but de la première édition de la Coupe du monde de football.', true),
('32', 'MCQ', 'Argentin', '', false),
('32', 'MCQ', 'Américain', '', false),
('33', 'Blindtest', 'Jenifer', '', false),
('33', 'Blindtest', 'Carla Bruni', '"Quelqu\'un m\'a dit" est le premier album de la chanteuse franco-italienne et mannequin Carla Bruni. Produit et arrangé par Louis Bertignac, il est sorti en 2002.', true),
('33', 'Blindtest', 'Tal', '', false),
('33', 'Blindtest', 'Amel Bent', '', false),
('34', 'Blindtest', 'Avec le temps', '', false),
('34', 'Blindtest', 'Vingt ans', '', false),
('34', 'Blindtest', 'Jolie Môme', '', false),
('34', 'Blindtest', 'L\'affiche rouge', 'Cette composition sous le titre L\'Affiche rouge par Léo Ferré en 1959 est l\'adaptation du poème de Louis Aragon "Strophes pour se souvenir".', true),
('35', 'Blindtest', '... tous les whiskies', 'Je suis malade est à la fois un album de Serge Lama, sorti en 1973, et l\'une des chansons les plus célèbres de cet album.', true),
('35', 'Blindtest', '... toutes les bières', '', false),
('35', 'Blindtest', '... tous les vins', '', false),
('35', 'Blindtest', '... tous les sodas', '', false),
('36', 'Blindtest', '2008', '', false),
('36', 'Blindtest', '2009', '', false),
('36', 'Blindtest', '2010', 'L\'album "On trace la route" de Christophe Maé sorti le 22 mars 2010 a totalisé 546 575 exemplaires de vendus', true),
('36', 'Blindtest', '2011', '', false),
('37', 'Blindtest', 'Calvin Harris', 'C\'est un bg', true),
('37', 'Blindtest', 'Justin Bieber', '', false),
('37', 'Blindtest', 'Charlie Puth', '', false),
('37', 'Blindtest', 'Shawn Mendes', '', false),
('38', 'Blindtest', 'Galway girl', '', false),
('38', 'Blindtest', 'Shape of you', 'I\'m in love with the shape of you !', true),
('38', 'Blindtest', 'Thinking out loud', '', false),
('38', 'Blindtest', 'Perfect', '', false),
('39', 'Blindtest', 'So just dance, dance, dance, come on', '', false),
('39', 'Blindtest', 'Don\'t need no reason, don\'t need control', '', false),
('39', 'Blindtest', 'It goes electric, wavy when I turn it on', '', false),
('39', 'Blindtest', 'It\'s in the air, it\'s in my blood, it\'s rushing on', 'You can\'t stop my feelings for you', true),
('40', 'Blindtest', 'Go Fuck Yourself', 'Yeah go on', true),
('40', 'Blindtest', 'The bass is too loud', '', false),
('40', 'Blindtest', 'Oh my god', '', false),
('40', 'Blindtest', 'Shit on', '', false),
('41', 'Blindtest', 'Ellie Goulding', '', false),
('41', 'Blindtest', 'Clean Bandit', '', false),
('41', 'Blindtest', 'Cheat Codes', 'Don\'t use them !', true),
('41', 'Blindtest', 'Hello', '', false),
('42', 'Blindtest', 'Talk about me', 'Do not talk about me', true),
('42', 'Blindtest', 'Closer', '', false),
('42', 'Blindtest', 'Love somebody', '', false),
('42', 'Blindtest', 'Satellite', '', false),
('43', 'Blindtest', 'Without you my friend', '', true),
('43', 'Blindtest', 'With you my friend', '', false),
('43', 'Blindtest', 'Well you didn\'t die', '', false),
('43', 'Blindtest', 'I didn\'t eat burger', '', false),
('44', 'Blindtest', 'Symphony', 'I just want to be in your symphony', true),
('44', 'Blindtest', 'Opera', '', false),
('44', 'Blindtest', 'Theatre', '', false),
('44', 'Blindtest', 'Hey man', '', false);




-- --------------------------------------------------------

--
-- TESTS
--

COMMIT;