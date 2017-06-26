--
-- QuizIT
-- Copyright © 2017 Victor CHEN, Andy HUANG, Kilian CHOLLET, Lucas MASSON
--


SET NAMES 'utf8' COLLATE 'utf8_general_ci';
DROP TABLE users, answers, questions, topic CASCADE;

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
	password VARCHAR(100) NOT NULL,
	email VARCHAR(100),
	score INTEGER DEFAULT 0,
	isAdmin BOOLEAN DEFAULT FALSE,
	CONSTRAINT PK_USERS PRIMARY KEY (id_user)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Content users
--

/*
user:password to connect to an QuizIt Account

Admin:admin
Andy:andy
Kilian:kilian
Victor:victor
Lucas:lucas

Only admin has admin privilege and can accept the questions requests
*/

INSERT INTO users (login, password, email, isAdmin) VALUES
('Admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin@etu.parisdescartes.fr', true),
('Andy', '6177321eac992341d1ad0823a07e76bfc4ee6909db120e377ea303fdc216756c', 'andy@etu.parisdescartes.fr', false),
('Victor', '99bde068af2d49ed7fc8b8fa79abe13a6059e0db320bb73459fd96624bb4b33f', 'victor@etu.parisdescartes.fr', false),
('Lucas', '7cadab457ad8d811f134612436daaa5e5914b20dc2502865f714035b0f267680', 'lucas@etu.parisdescartes.fr', false),
('Kilian', '3f00822ab3409980878cf50d4d501352597d77ead2fd288c5b9d958ec4d4ef91', 'kilian@etu.parisdescartes.fr', false);

-- Top 20 Score

/*
	SELECT login FROM users
	ORDER BY score DESC
	LIMIT 20
*/

-- --------------------------------------------------------

--
-- Table topic
--

CREATE TABLE topic (
	topicName VARCHAR(50) NOT NULL,
	pictureURL VARCHAR(255),
	descriptionTopic VARCHAR(100) NOT NULL,
	CONSTRAINT PK_TOPIC PRIMARY KEY (topicName)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Content topic
--

INSERT INTO topic (topicName, pictureURL, descriptionTopic) VALUES
('Le débarquement de Normandie', 'http://i.imgur.com/iJ40f3D.png', 'Connaissez-vous tout du débarquement en Normadie ?'),
('Les scientifiques', 'http://i.imgur.com/gNRic7j.png', 'Êtes-vous un adepte des Sciences ?'),
('Les félins', 'http://i.imgur.com/bgi0he6.png', 'Êtes-vous indétronable sur les félins ?'),
('Les États-Unis', 'http://i.imgur.com/q9D4MrO.png', 'Connaissez-vous tout du pays de l\'oncle Sam ?'),
('Les ordinateurs', 'http://i.imgur.com/jXHodw7.png', 'Connaissez-vous l\'histoire de l\'ordinateur ?'),
('Culture du monde', 'http://i.imgur.com/A0UmzxK.png', 'Connaissez-vous le reste du monde ?'),
('Le monde en 2016', 'http://i.imgur.com/9Ymc9ka.png', 'Avez-vous tout retenu des actualités en 2016 ?'),
('La Coupe du monde de football', 'http://i.imgur.com/4PCAmOy.png', 'Avez-vous suivi toutes les Coupes du monde de football ?'),
('Chanson française', 'http://i.imgur.com/6pVdhSE.png', 'BARRACUDA ?'),
('Pop et Electro', 'http://i.imgur.com/cu0sF0A.png', 'DUDUDUDUDU... Connaissez-vous bien le monde musical de l\'Electropop ?'),
('House', 'http://i.imgur.com/HizcRjI.png', 'I <3 HOUSE MUSIC !');

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
	FOREIGN KEY (id_submitter) REFERENCES users (id_user),
	FOREIGN KEY (topicQuest) REFERENCES topic (topicName)
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
('MCQ', 'Les scientifiques', 'Sur quelle(s) île(s) Darwin a-t-il développé sa théorie sur l\'évolution des espèces ?', null, '1', true), -- 6
('MCQ', 'Les scientifiques', 'Quel scientifique a donné son nom à l\'unité d\'intensité du courant électrique ?', null, '1', true), -- 7
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
('MCQ', 'Le monde en 2016', 'Quel film a remporté l\'Oscar du meilleur film en 2016 ?', null, '1', true), -- 25
('MCQ', 'Le monde en 2016', 'En quel mois a eu lieu l\'ouragan Matthew qui a tué près de 1000 personnes en Haïti ?', null, '1', true), -- 26
('MCQ', 'Le monde en 2016', 'Quel prix Bob Dylan, chanteur et poète, a-t-il reçu en 2016 ?', null, '1', true), -- 27
('MCQ', 'Le monde en 2016', 'Quel cycliste a remporté le Tour de France en 2016 ?', null, '1', true), -- 28
('MCQ', 'La Coupe du monde de football', 'Quel pays a remporté deux fois d\'affilé la Coupe du monde ?', null, '1', true), -- 29
('MCQ', 'La Coupe du monde de football', 'Quel pays détient du record de défaites en finale de Coupe du monde ?', null, '1', true), -- 30
('MCQ', 'La Coupe du monde de football', 'Quel footballeur a champion du monde à trois reprises ?', null, '1', true), -- 31
('MCQ', 'La Coupe du monde de football', 'De quelle nationalité était le footballeur qui a marqué le premier but de la première édition de la Coupe du monde ?', null, '1', true), -- 32
('BlindTest', 'Chanson française', 'Qui est l\'artiste ?', 'carla_bruni_quelquun_ma_dit.mp3', '1', true), -- 33
('BlindTest', 'Chanson française', 'Quel est le titre de cette chanson composée par Léo Ferré ?', 'leo_ferre_affiche_rouge.mp3', '2', true), -- 34
('BlindTest', 'Chanson française', 'Complétez les paroles "Je bois toutes les nuits mais..." de Serge Lama - Je suis malade', 'serge_lama_je_suis_malade.mp3', '2', true), -- 35
('BlindTest', 'Chanson française', 'En quelle année cet album a été le plus vendu ?', 'christophe_mae_on_trace_la_route.mp3', '2', true), -- 36
('BlindTest', 'Pop et Electro', 'Qui est l\'artiste ?', 'this_is_what_you_came_for.mp3', '1', true), -- 37
('BlindTest', 'Pop et Electro', 'Quel est le titre de cette chanson composée par Ed Sheeran ?', 'shape_of_you.mp3', '2', true), -- 38
('BlindTest', 'Pop et Electro', 'Complétez les paroles "Ooh, it\'s something magical..." Justin Timberlake - Can\'t Stop The Feeling', 'cant_stop_the_feeling.mp3', '2', true), -- 39
('BlindTest', 'Pop et Electro', 'Quel est le titre de cette chanson ?', 'two_feet_go_fuck_yourself.mp3', '2', true), -- 40
('BlindTest', 'House', 'Qui est l\'artiste ?', 'no_promises.mp3', '1', true), -- 41
('BlindTest', 'House', 'Quel est le titre de cette chanson composée par Justin Caruso ?', 'talk_about_me.mp3', '2', true), -- 42
('BlindTest', 'House', 'Complétez les paroles "It\'s been a long day..." Wiz Khalifa - See you again', 'see_you_again.mp3', '2', true), -- 43
('BlindTest', 'House', 'Quel est le titre de cette chanson ?', 'symphony.mp3', '2', true), -- 44
('MCQ', 'Le débarquement de Normandie', 'De quelle ville française la population a été éliminée par les troupes SS ?', null, '1', true), -- 45
('MCQ', 'Les scientifiques', 'À la suite du projet Manhattan, quel surnom Robert Oppenheimer a-t-il obtenu ?', null, '1', true), -- 46
('MCQ', 'Les félins', 'Combien de kg de viande mange un tigre adulte annuellement ?', null, '1', true), -- 47
('MCQ', 'Les États-Unis', 'Combien de personnes volent au-dessus des États-Unis à chaque instant ?', null, '1', true), -- 48
('MCQ', 'Les ordinateurs', 'Qu\'est-ce que Ray Tomlinson a créé ? ?', null, '1', true), -- 49
('MCQ', 'Culture du monde', 'Quel est le nom du quartier populaire geek à Tokyo ?', null, '1', true), -- 50
('MCQ', 'Le monde en 2016', 'Quelle mission spatiale a été mise fin en 2016 ?', null, '1', true), -- 51
('MCQ', 'La Coupe du monde de football', 'Quel pays a remporté la première Coupe du monde ?', null, '1', true), -- 52
('BlindTest', 'Chanson française', 'Devinez le groupe de musique', 'noir_desir_le_vent_nous_portera.mp3', '1', true), -- 53
('BlindTest', 'Pop et Electro', 'Qui est l\'artiste ?', 'zara_larsson_aint_my_fault.mp3', '1', true), -- 54
('BlindTest', 'House', 'En quelle année est sortie cette composition ?', 'calvin_harris_my_way.mp3', '1', true); -- 55

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
	answerContent VARCHAR(255), -- Réponse
	desc_answer VARCHAR(255), -- Description de la réponse
	isTrue BOOLEAN, -- Réponse juste ou non
	CONSTRAINT PK_ANSWERS PRIMARY KEY (id_answer),
	FOREIGN KEY (id_quest) REFERENCES questions (id_quest)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- answers content
--

INSERT INTO answers (id_quest, typeAnswer, answerContent, desc_answer, isTrue) VALUES
('1', 'SimpleAnswer', 'France', '', false),
('1', 'SimpleAnswer', 'Irlande', 'Les scènes de débarquement du film Il faut sauver le soldat Ryan ont été tournées en Irlande. La plupart des figurants étaient des réservistes de l\'armée allemande.', true),
('1', 'SimpleAnswer', 'Allemagne', '', false),
('1', 'SimpleAnswer', 'Angleterre', '', false),
('2', 'SimpleAnswer', 'Pologne', '', false),
('2', 'SimpleAnswer', 'Allemagne', 'Et le 6 juin 1944, jour de l\'invasion, Rommel fêtait l\'anniversaire de sa femme en Allemagne. Il est rentré précipitamment à son poste de commandement à La Roche-Guyon.', true),
('2', 'SimpleAnswer', 'France', '', false),
('2', 'SimpleAnswer', 'Italie', '', false),
('3', 'SimpleAnswer', '5', 'Les combats se sont concentrés sur 5 plages : d\'ouest en est, Utah et Omaha (armée américaine), Gold (armée britannique), Juno (armée canadienne) et Sword (armées britannique et française).', true),
('3', 'SimpleAnswer', '8', '', false),
('3', 'SimpleAnswer', '10', '', false),
('3', 'SimpleAnswer', '12', '', false),
('4', 'SimpleAnswer', 'Charles de Gaulle', '', false),
('4', 'SimpleAnswer', 'Winston Churchill', '', false),
('4', 'SimpleAnswer', 'Franklin Delano Roosevelt', 'Ce sont les Américains qui étaient partisans d\'une attaque par la Manche, la voie la plus courte pour atteindre le cur de l\'Allemagne.', true),
('4', 'SimpleAnswer', 'Joseph Staline', '', false),
('5', 'SimpleAnswer', 'Neptune', 'En 1846, l\'astronome français Urbain Le Verrier a prédit mathématiquement l\'existence et la position de Neptune à partir de la trajectoire et des caractéristiques d\'Uranus. Deux ans de calculs ont été nécessaires pour arriver à cette conclusion.', true),
('5', 'SimpleAnswer', 'Saturne', '', false),
('5', 'SimpleAnswer', 'Pluton', '', false),
('5', 'SimpleAnswer', 'Uranus', '', false),
('6', 'SimpleAnswer', 'Madagascar', '', false),
('6', 'SimpleAnswer', 'Îles Galápagos', 'C\'est aux îles Galápagos, à l\'ouest de l\'Équateur, que Charles Darwin a récolté les nombreux échantillons qui lui permettront d\'élaborer sa théorie sur l\'évolution des espèces.', true),
('6', 'SimpleAnswer', 'Île Maurice', '', false),
('6', 'SimpleAnswer', 'Îles aux Cocos', '', false),
('7', 'SimpleAnswer', 'James Watt', '', false),
('7', 'SimpleAnswer', 'André Marie Ampère', 'Le physicien français André Marie Ampère, né en 1775, a réalisé d\'importantes découvertes dans le domaine de l\'électromagnétisme. On a donnée son nom à l\'unité internationale de l\'intensité du courant électrique : l\'ampère.', true),
('7', 'SimpleAnswer', 'Dmitri Ivanovitch Mendeleïev', '', false),
('7', 'SimpleAnswer', 'Michael Faraday', '', false),
('8', 'SimpleAnswer', 'Chimie', '', false),
('8', 'SimpleAnswer', 'Optique', 'En optique, on doit au physicien, mathématicien et astronome anglais Isaac Newton une théorie de la couleur selon laquelle un prisme décompose la lumière blanche en un spectre visible. Et on lui doit aussi le télescope à réflexion.', true),
('8', 'SimpleAnswer', 'Biologie', '', false),
('8', 'SimpleAnswer', 'Médecine', '', false),
('9', 'SimpleAnswer', 'Le chat voit flou de loin et mal de près', 'Le chat voit flou de loin et mal de près. Sa vision la plus précise se situe entre 10 et 80 cm (4 et 32 po).', true),
('9', 'SimpleAnswer', 'Le chat voit mal de loin et flou de près', '', false),
('9', 'SimpleAnswer', 'Le chat voit à la fois flou de loin et de près', '', false),
('9', 'SimpleAnswer', 'Le chat voit à la fois mal de loin et de près', '', false),
('10', 'SimpleAnswer', '50 mètres', '', false),
('10', 'SimpleAnswer', '100 mètres', 'Le chat a un odorat si fin qui peut détecter la présence d\'un autre chat à 100 m (325 pi) de distance. Il utilise pour cela son nez, mais aussi son organe de Jacobson, situé à l\'avant du palais.', true),
('10', 'SimpleAnswer', '250 mètres', '', false),
('10', 'SimpleAnswer', '500 mètres', '', false),
('11', 'SimpleAnswer', 'Le tigre', '', false),
('11', 'SimpleAnswer', 'Le lion', 'Les lions sont les seuls félins à vivre en groupe. Ils évoluent généralement dans un clan composé de 1 à 3 mâles (dont un seul alpha), de 5 à 10 femelles et de leurs petits.', true),
('11', 'SimpleAnswer', 'La panthère', '', false),
('11', 'SimpleAnswer', 'Le puma', '', false),
('12', 'SimpleAnswer', 'Europe', '', false),
('12', 'SimpleAnswer', 'Amérique', '', false),
('12', 'SimpleAnswer', 'Antarctique', 'Les félins ont colonisé tous les continents, sauf l\'Antarctique et l\'Australie. Ce sont les humains qui ont introduit les félins en Australie.', true),
('12', 'SimpleAnswer', 'Asie', '', false),
('13', 'SimpleAnswer', 'Alaska', '', false),
('13', 'SimpleAnswer', 'Hawaï', 'Le 21 août 1959, Hawaï a été le dernier État à joindre les États-Unis.', true),
('13', 'SimpleAnswer', 'Arizona', '', false),
('13', 'SimpleAnswer', 'Nouveau-Mexique', '', false),
('14', 'SimpleAnswer', '2', '', false),
('14', 'SimpleAnswer', '3', '', false),
('14', 'SimpleAnswer', '4', 'Durant les Jeux olympiques d\'été de 1936 à Berlin, Jesse Owens, le premier athlète afro-américain de renommée internationale, a remporté 4 médailles d\'or sous les yeux d\'Adolf Hitler.', true),
('14', 'SimpleAnswer', '5', '', false),
('15', 'SimpleAnswer', '6', '', false),
('15', 'SimpleAnswer', '8', '', false),
('15', 'SimpleAnswer', '10', '', false),
('15', 'SimpleAnswer', '12', 'Dans le cadre du programme Apollo (1969 à 1972), douze astronautes américains ont marché sur la Lune.', true),
('16', 'SimpleAnswer', '48', '', false),
('16', 'SimpleAnswer', '50', 'Les États-Unis sont composés de 50 États auxquels s\'ajoutent le District de Columbia (comprenant la capitale Washington) et 5 territoires dépendants.', true),
('16', 'SimpleAnswer', '52', '', false),
('16', 'SimpleAnswer', '56', '', false),
('17', 'SimpleAnswer', '100 mm', '', false),
('17', 'SimpleAnswer', '200 mm', 'Les premières disquettes, mises au point à la fin des années 1960, mesuraient 200 mm (8 po) de diamètre.', true),
('17', 'SimpleAnswer', '300 mm', '', false),
('17', 'SimpleAnswer', '400 mm', '', false),
('18', 'SimpleAnswer', '200 ko', '', false),
('18', 'SimpleAnswer', '400 ko', 'En 1981, Sony présentait les premières disquettes de 3,5 po. Elles avaient une capacité de 400 ko. Ensuite vinrent les disquettes 3,5 po de 720 ko (double-density), puis celles de 1,44 Mo (high-density).', true),
('18', 'SimpleAnswer', '800 ko', '', false),
('18', 'SimpleAnswer', '1 mo', '', false),
('19', 'SimpleAnswer', '1983', '', false),
('19', 'SimpleAnswer', '1989', 'Le premier site web a été mis en ligne par le CERN, le Conseil européen pour la recherche nucléaire, en mars 1989.', true),
('19', 'SimpleAnswer', '1991', '', false),
('19', 'SimpleAnswer', '1995', '', false),
('20', 'SimpleAnswer', 'Netscape Navigator', '', false),
('20', 'SimpleAnswer', 'Mosaic', 'Le navigateur Mosaic, développé en 1993, est considéré comme le navigateur qui a popularisé Internet en affichant non seulement du texte, mais aussi des images.', true),
('20', 'SimpleAnswer', 'Nexus', '', false),
('20', 'SimpleAnswer', 'ViolaWWW', '', false),
('21', 'SimpleAnswer', 'Le weka', '', false),
('21', 'SimpleAnswer', 'Le kakariki', '', false),
('21', 'SimpleAnswer', 'Le kiwi', 'Le kiwi est un oiseau inoffensif et originaire de la Nouvelle-Zélande. Seulement trouvable dans ce pays, il en est le symbole de ce pays et de la nature.', true),
('21', 'SimpleAnswer', 'Le kea', '', false),
('22', 'SimpleAnswer', 'Aux Pays-Bas', '', false),
('22', 'SimpleAnswer', 'En Allemagne', '', false),
('22', 'SimpleAnswer', 'En Belgique francophone', 'Il fait référence à la chute de l\'Empire romain et l\'avènement de la Gaule.', true),
('22', 'SimpleAnswer', 'En Irlande', '', false),
('23', 'SimpleAnswer', 'Aux Pays-Bas', 'C\'est la devise royale, toujours en langue française, (celle de la maison d\'Orange-Nassau, depuis Guillaume le Taciturne en 1544).', true),
('23', 'SimpleAnswer', 'En Autriche', '', false),
('23', 'SimpleAnswer', 'En Norvège', '', false),
('23', 'SimpleAnswer', 'En Suisse', '', false),
('24', 'SimpleAnswer', 'Argentine', '', false),
('24', 'SimpleAnswer', 'Luxembourg', '', false),
('24', 'SimpleAnswer', 'Canada', 'Le castor à large queue plate est l\'emblème du Canada. Il figure même sur les pièces de 5 cents et sur un timbre canadien au moins.', true),
('24', 'SimpleAnswer', 'Chili', '', false),
('25', 'SimpleAnswer', 'The Revenant', '', false),
('25', 'SimpleAnswer', 'Spotlight', 'Spotlight, le long-métrage consacré à l\'enquête journalistique du Boston Globe sur un scandale sexuel impliquant l\'Église catholique, a créé la surprise en remportant la statuette du meilleur film au détriment du favori, The Revenant.', true),
('25', 'SimpleAnswer', 'Ex machina', '', false),
('25', 'SimpleAnswer', 'Mad Max', '', false),
('26', 'SimpleAnswer', 'Février', '', false),
('26', 'SimpleAnswer', 'Juin', '', false),
('26', 'SimpleAnswer', 'Août', '', false),
('26', 'SimpleAnswer', 'Octobre', 'Matthew, un ouragan de catégorie 5, a causé la mort de près de 1000 personnes en Haïti, en plus de faire des dizaines de milliards de dollars de dommage dans les Antilles jusqu\'à la Floride.', true),
('27', 'SimpleAnswer', 'Golden Globe de la meilleure chanson originale', '', false),
('27', 'SimpleAnswer', 'Prix Pulitzer : Citation spéciale', '', false),
('27', 'SimpleAnswer', 'Prix Nobel de littérature', 'L\'Académie suédoise a remis le prix Nobel de littérature au chanteur et poète Bob Dylan « pour avoir créé dans le cadre de la grande tradition de la musique américaine de nouveaux modes d\'expression poétique ».', true),
('27', 'SimpleAnswer', 'Grammy Award de la meilleure prestation vocale rock masculine', '', false),
('28', 'SimpleAnswer', 'Christopher Froome', 'En 2016, Christopher Froome remporte son troisième Tour de France après ceux de 2013 et de 2015.', true),
('28', 'SimpleAnswer', 'Romain Bardet', '', false),
('28', 'SimpleAnswer', 'Nairo Quintana', '', false),
('28', 'SimpleAnswer', 'Adam Yates', '', false),
('29', 'SimpleAnswer', 'France', '', false),
('29', 'SimpleAnswer', 'Brésil', 'Le Brésil a chacun gagné deux Coupes du monde consécutives : en 1958 et 1962.', true),
('29', 'SimpleAnswer', 'Allemagne', '', false),
('29', 'SimpleAnswer', 'Angleterre', '', false),
('30', 'SimpleAnswer', 'Brésil', '', false),
('30', 'SimpleAnswer', 'Argentine', '', false),
('30', 'SimpleAnswer', 'Pays-Bas', 'Les Pays-Bas ont participé à trois finales : 1974, 1978 et 2010. Ils ont perdu à chaque occasion. Ils détiennent ainsi le record du plus grand nombre de défaites en finales sans jamais avoir remporté la Coupe du monde de football.', true),
('30', 'SimpleAnswer', 'Suède', '', false),
('31', 'SimpleAnswer', 'Ronaldo (Ronaldo Luis Nazário de Lima)', '', false),
('31', 'SimpleAnswer', 'Pelé', 'Edson Arantes do Nascimento, dit Pelé, est le seul footballeur à avoir été champion du monde à trois reprises : en 1958, 1962 et 1970.', true),
('31', 'SimpleAnswer', 'Zinedine Zidane', '', false),
('31', 'SimpleAnswer', 'Diego Maradona', '', false),
('32', 'SimpleAnswer', 'Brésilien', '', false),
('32', 'SimpleAnswer', 'Français', 'Le 13 juillet 1930, le Français Lucien Laurent marque le premier but de la première édition de la Coupe du monde de football.', true),
('32', 'SimpleAnswer', 'Argentin', '', false),
('32', 'SimpleAnswer', 'Américain', '', false),
('33', 'SimpleAnswer', 'Jenifer', '', false),
('33', 'SimpleAnswer', 'Carla Bruni', '"Quelqu\'un m\'a dit" est le premier album de la chanteuse franco-italienne et mannequin Carla Bruni. Produit et arrangé par Louis Bertignac, il est sorti en 2002.', true),
('33', 'SimpleAnswer', 'Tal', '', false),
('33', 'SimpleAnswer', 'Amel Bent', '', false),
('34', 'SimpleAnswer', 'Avec le temps', '', false),
('34', 'SimpleAnswer', 'Vingt ans', '', false),
('34', 'SimpleAnswer', 'Jolie Môme', '', false),
('34', 'SimpleAnswer', 'L\'affiche rouge', 'Cette composition sous le titre L\'Affiche rouge par Léo Ferré en 1959 est l\'adaptation du poème de Louis Aragon "Strophes pour se souvenir".', true),
('35', 'SimpleAnswer', '... tous les whiskies', 'Je suis malade est à la fois un album de Serge Lama, sorti en 1973, et l\'une des chansons les plus célèbres de cet album.', true),
('35', 'SimpleAnswer', '... toutes les bières', '', false),
('35', 'SimpleAnswer', '... tous les vins', '', false),
('35', 'SimpleAnswer', '... tous les sodas', '', false),
('36', 'SimpleAnswer', '2008', '', false),
('36', 'SimpleAnswer', '2009', '', false),
('36', 'SimpleAnswer', '2010', 'L\'album "On trace la route" de Christophe Maé sorti le 22 mars 2010 a totalisé 546 575 exemplaires de vendus', true),
('36', 'SimpleAnswer', '2011', '', false),
('37', 'SimpleAnswer', 'Calvin Harris', 'C\'est un bg', true),
('37', 'SimpleAnswer', 'Justin Bieber', '', false),
('37', 'SimpleAnswer', 'Charlie Puth', '', false),
('37', 'SimpleAnswer', 'Shawn Mendes', '', false),
('38', 'SimpleAnswer', 'Galway girl', '', false),
('38', 'SimpleAnswer', 'Shape of you', 'I\'m in love with the shape of you \!', true),
('38', 'SimpleAnswer', 'Thinking out loud', '', false),
('38', 'SimpleAnswer', 'Perfect', '', false),
('39', 'SimpleAnswer', 'So just dance, dance, dance, come on', '', false),
('39', 'SimpleAnswer', 'Don\'t need no reason, don\'t need control', '', false),
('39', 'SimpleAnswer', 'It goes electric, wavy when I turn it on', '', false),
('39', 'SimpleAnswer', 'It\'s in the air, it\'s in my blood, it\'s rushing on', 'You can\'t stop my feelings for you', true),
('40', 'SimpleAnswer', 'Go F Yourself', 'Yeah go on', true),
('40', 'SimpleAnswer', 'The bass is too loud', '', false),
('40', 'SimpleAnswer', 'Oh my god', '', false),
('40', 'SimpleAnswer', 'Shit on', '', false),
('41', 'SimpleAnswer', 'Ellie Goulding', '', false),
('41', 'SimpleAnswer', 'Clean Bandit', '', false),
('41', 'SimpleAnswer', 'Cheat Codes', 'Don\'t use them \!', true),
('41', 'SimpleAnswer', 'Hello', '', false),
('42', 'SimpleAnswer', 'Talk about me', 'Do not talk about me', true),
('42', 'SimpleAnswer', 'Closer', '', false),
('42', 'SimpleAnswer', 'Love somebody', '', false),
('42', 'SimpleAnswer', 'Satellite', '', false),
('43', 'SimpleAnswer', 'Without you my friend', '', true),
('43', 'SimpleAnswer', 'With you my friend', '', false),
('43', 'SimpleAnswer', 'Well you didn\'t die', '', false),
('43', 'SimpleAnswer', 'I didn\'t eat burger', '', false),
('44', 'SimpleAnswer', 'Symphony', 'I just want to be in your symphony', true),
('44', 'SimpleAnswer', 'Opera', '', false),
('44', 'SimpleAnswer', 'Theatre', '', false),
('44', 'SimpleAnswer', 'Hey man', '', false),
('45', 'SimpleAnswer', 'Limoges', '', false),
('45', 'SimpleAnswer', 'Oradour-sur-Glane', 'Pour effrayer la population normande et l\'empêcher de soutenir la résistance, les SS ont tué 642 personnes le 10 juin 1944. Il s\'agit du plus grand massacre de civils commis en France par les armées allemandes.', true),
('45', 'SimpleAnswer', 'Angoulême', '', false),
('45', 'SimpleAnswer', 'Cieux', '', false),
('46', 'SimpleAnswer', '« père de la bombe atomique »', 'Le physicien américain Julius Robert Oppenheimer, né en 1904, a été le directeur scientifique du projet Manhattan (nom de code du projet qui produisit la bombe atomique). C\'est à ce rôle qu\'il doit son surnom de « père de la bombe atomique ».', true),
('46', 'SimpleAnswer', '« enfant de la bombe atomique »', '', false),
('46', 'SimpleAnswer', '« père de la bombe nucléaire »', '', false),
('46', 'SimpleAnswer', '« enfant de la bombe nucléaire »', '', false),
('47', 'SimpleAnswer', '0 à 1100 kg', '', false),
('47', 'SimpleAnswer', '1100 kg à 1800 kg', '', false),
('47', 'SimpleAnswer', '1800 kg à 2500 kg', 'Un tigre adulte a besoin de 1800 à 2500 kg de viande par an. Il mange donc en moyenne de 4 à 6 kg de viande par jour. Toutefois, après avoir dévoré une grosse proie, il peut passer plusieurs jours sans rien manger.', true),
('47', 'SimpleAnswer', '2500 kg à 3000 kg', '', false),
('48', 'SimpleAnswer', '10 000 personnes', '', false),
('48', 'SimpleAnswer', '25 000 personnes', '', false),
('48', 'SimpleAnswer', '45 000 personnes', '', false),
('48', 'SimpleAnswer', '60 0000 personnes', 'Plus de 60 000 personnes voyagent à bord d\'un avion quelque part au-dessus des États-Unis à tout moment de la journée.', true),
('49', 'SimpleAnswer', 'Le courrier électronique', '', true),
('49', 'SimpleAnswer', 'Le protocole HTTP', '', false),
('49', 'SimpleAnswer', 'Le World Wide Web', '', false),
('49', 'SimpleAnswer', 'Le système des noms de domaine', 'Ray Tomlinson, le créateur du courrier électronique, a eu l\'idée de séparer le nom d\'utilisateur et le nom d\'hôte par un caractère qui n\'était utilisé dans aucun nom propre et qui pouvait servir de préfixe aux noms de domaine : le symbole @.', false),
('50', 'SimpleAnswer', 'Shibuya', '', false),
('50', 'SimpleAnswer', 'Shinjuku', '', false),
('50', 'SimpleAnswer', 'Odaiba', '', false),
('50', 'SimpleAnswer', 'Akihabara', 'Akihabara est le quartier électronique de Tokyo. C\'est le lieu privilégié des amateurs de mangas, jeux vidéo et de culture populaire japonaise, très apprécié des jeunes touristes étrangers "geek" ou "otaku".', true),
('51', 'SimpleAnswer', 'Juno', '', false),
('51', 'SimpleAnswer', 'ExoMars', '', false),
('51', 'SimpleAnswer', 'Rosetta', 'Douze ans après son départ pour un long voyage dans le système solaire, la sonde Rosetta s\'est écrasée à la surface de la comète Tchouri, qu\'elle étudiait.', true),
('51', 'SimpleAnswer', 'New Horizons', '', false),
('52', 'SimpleAnswer', 'France', '', false),
('52', 'SimpleAnswer', 'Uruguay', 'C\'est l\'Uruguay, le pays hôte de la première Coupe du monde, qui a remporté le tournoi après une victoire en finale contre l\'Argentine.', true),
('52', 'SimpleAnswer', 'Argentine', '', false),
('52', 'SimpleAnswer', 'États-Unis', '', false),
('53', 'SimpleAnswer', 'Noir Désir', 'Le vent nous portera est une chanson du groupe Noir Désir sortie le 28 août 2001 en single et publiée sur l\'album Des visages des figures le 11 septembre 2001.', true),
('53', 'SimpleAnswer', 'Yannick', '', false),
('53', 'SimpleAnswer', 'Francis Cabrel', '', false),
('53', 'SimpleAnswer', 'Calogero', '', false),
('54', 'SimpleAnswer', 'Rihanna', '', false),
('54', 'SimpleAnswer', 'Zara Larsson', '"Ain\'t My Fault" est une chanson de l\'auteure-compositrice-interprète suédoise Zara Larsson. Elle sort le 2 septembre 2016 en tant que premier single extrait de son deuxième album studio, sous les labels TEN, Epic et Sony.', true),
('54', 'SimpleAnswer', 'Katy Perry', '', false),
('54', 'SimpleAnswer', 'Sia', '', false),
('55', 'SimpleAnswer', '2014', '', false),
('55', 'SimpleAnswer', '2015', '', false),
('55', 'SimpleAnswer', '2016', '"My Way" est une composition de Calvin Harris. Elle est sortie le 16 septembre 2016.', true),
('55', 'SimpleAnswer', '2017', '', false);

COMMIT;
