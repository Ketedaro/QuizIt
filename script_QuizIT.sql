
--
-- QuizIT
-- Copyright � 2017 Victor CHEN, Andy HUANG, Kilian CHOLLET, Lucas MASSON
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
	password VARCHAR(100) NOT NULL,
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
('Le d�barquement de Normandie', 'http://i.imgur.com/iJ40f3D.png', 'Connaissez-vous tout du d�barquement en Normadie ?'),
('Les scientifiques', 'http://i.imgur.com/gNRic7j.png', '�tes-vous un adepte des Sciences ?'),
('Les f�lins', 'http://i.imgur.com/bgi0he6.png', '�tes-vous ind�tronable sur les f�lins ?'),
('Les �tats-Unis', 'http://i.imgur.com/q9D4MrO.png', 'Connaissez-vous tout du pays de l\'oncle Sam ?'),
('Les ordinateurs', 'http://i.imgur.com/jXHodw7.png', 'Connaissez-vous l\'histoire de l\'ordinateur ?'),
('Culture du monde', 'http://i.imgur.com/A0UmzxK.png', 'Connaissez-vous le reste du monde ?'),
('Le monde en 2016', 'http://i.imgur.com/9Ymc9ka.png', 'Avez-vous tout retenu des actualit�s en 2016 ?'),
('La Coupe du monde de football', 'http://i.imgur.com/4PCAmOy.png', 'Avez-vous suivi toutes les Coupes du monde de football ?'),
('Chanson fran�aise', 'http://i.imgur.com/6pVdhSE.png', 'BARRACUDA ?'),
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
('MCQ', 'Le d�barquement de Normandie', 'O� �taient tourn�es les sc�nes de d�barquement du film "Il faut sauver le soldat Ryan" ?', null, '1', true), -- 1
('MCQ', 'Le d�barquement de Normandie', 'O� se trouvait le mar�chal Rommel, responsable de la Normandie, le 6 juin 1944 ?', null, '1', true), -- 2
('MCQ', 'Le d�barquement de Normandie', 'Sur combien de plages se concentr�s les combats du 6 juin 1944 ?', null, '1', true), -- 3
('MCQ', 'Le d�barquement de Normandie', 'Quel personnage �tait un ardent d�fenseur du projet de d�barquement en Normandie ?', null, '1', true), -- 4
('MCQ', 'Les scientifiques', 'Quelle plan�te Urbain Le Verrier a-t-il d�couvert par des calculs math�matiques ?', null, '1', true), -- 5
('MCQ', 'Les scientifiques', 'Sur quelle(s) �le(s) Darwin a-t-il d�velopp� sa th�orie sur l\'�volution des esp�ces ?', null, '1', true), -- 6
('MCQ', 'Les scientifiques', 'Quel scientifique a donn� son nom � l\'unit� d\'intensit� du courant �lectrique ?', null, '1', true), -- 7
('MCQ', 'Les scientifiques', 'Par quel nom Nikola Tesla a-t-il baptis� l\'invention de la premi�re voiture �lectrique ?', null, '1', true), -- 8
('MCQ', 'Les f�lins', 'De quelle mani�re voient le chat ? Choisissez la bonne r�ponse.', null, '1', true), -- 9
('MCQ', 'Les f�lins', '� quelle distance un chat peut-il sentir un autre chat ?', null, '1', true), -- 10
('MCQ', 'Les f�lins', 'Quel f�lin est le seul � vivre en groupe ?', null, '1', true), -- 11
('MCQ', 'Les f�lins', 'Quel contient les f�lins n\'ont-ils pas colonis� naturellement ?', null, '1', true), -- 12
('MCQ', 'Les �tats-Unis', 'Quel �tat est le dernier � avoir joint les �tats-Unis ?', null, '1', true), -- 13
('MCQ', 'Les �tats-Unis', 'Combien de m�dailles d\'or Jesse Owens a-t-il remport� devant Hitler ?', null, '1', true), -- 14
('MCQ', 'Les �tats-Unis', 'Au total, combien d\'Am�ricains ont march� sur la Lune ?', null, '1', true), -- 15
('MCQ', 'Les �tats-Unis', 'Combien d\'�tats comptent les �tats-Unis ?', null, '1', true), -- 16
('MCQ', 'Les ordinateurs', 'Combien mesurait la premi�re disquette (en diam�tre) ?', null, '1', true), -- 17
('MCQ', 'Les ordinateurs', 'Quelle capacit� avaient les premi�res disquettes ?', null, '1', true), -- 18
('MCQ', 'Les ordinateurs', 'En quelle ann�e le premier site web a �t� mis en ligne ?', null, '1', true), -- 19
('MCQ', 'Les ordinateurs', 'Quel est le navigateur qui a popularis� l\'utilisation des images dans un site web ?', null, '1', true), -- 20
('MCQ', 'Culture du monde', 'Un animal rare est un des symboles de la Nouvelle-Z�lande, lequel ?', null, '1', true), -- 21
('MCQ', 'Culture du monde', 'Un des symboles de la France est le coq, mais il l\'est �galement ... (Compl�tez)', null, '1', true), -- 22
('MCQ', 'Culture du monde', 'Si, dans un pays europ�en vous entendez (�tonnamment en langue fran�aise)', null, '1', true), -- 23
('MCQ', 'Culture du monde', 'De quel pays le castor � large queue plate est-il embl�matique ?', null, '1', true), -- 24
('MCQ', 'Le monde en 2016', 'Quel film a remport� l\'Oscar du meilleur film en 2016 ?', null, '1', true), -- 25
('MCQ', 'Le monde en 2016', 'En quel mois a eu lieu l\'ouragan Matthew qui a tu� pr�s de 1000 personnes en Ha�ti ?', null, '1', true), -- 26
('MCQ', 'Le monde en 2016', 'Quel prix Bob Dylan, chanteur et po�te, a-t-il re�u en 2016 ?', null, '1', true), -- 27
('MCQ', 'Le monde en 2016', 'Quel cycliste a remport� le Tour de France en 2016 ?', null, '1', true), -- 28
('MCQ', 'La Coupe du monde de football', 'Quel pays a remport� deux fois d\'affil� la Coupe du monde ?', null, '1', true), -- 29
('MCQ', 'La Coupe du monde de football', 'Quel pays d�tient du record de d�faites en finale de Coupe du monde ?', null, '1', true), -- 30
('MCQ', 'La Coupe du monde de football', 'Quel footballeur a champion du monde � trois reprises ?', null, '1', true), -- 31
('MCQ', 'La Coupe du monde de football', 'De quelle nationalit� �tait le footballeur qui a marqu� le premier but de la premi�re �dition de la Coupe du monde ?', null, '1', true), -- 32
('BlindTest', 'Chanson fran�aise', 'Qui est l\'artiste ?', 'quelquun_ma_dit.mp3', '1', true), -- 33
('BlindTest', 'Chanson fran�aise', 'Quel est le titre de cette chanson compos�e par L�o Ferr� ?', 'leo_ferre_affiche_rouge.mp3', '2', true), -- 34
('BlindTest', 'Chanson fran�aise', 'Compl�tez les paroles "Je bois toutes les nuits mais..." de Serge Lama - Je suis malade', 'leo_ferre_affiche_rouge.mp3', '2', true), -- 35
('BlindTest', 'Chanson fran�aise', 'En quelle ann�e cet album a �t� le plus vendu ?', 'christophe_mae_on_trace_la_route.mp3', '2', true), -- 36
('BlindTest', 'Pop et Electro', 'Qui est l\'artiste ?', 'this_is_what_you_came_for.mp3', '1', true), -- 37
('BlindTest', 'Pop et Electro', 'Quel est le titre de cette chanson compos�e par Ed Sheeran ?', 'shape_of_you.mp3', '2', true), -- 38
('BlindTest', 'Pop et Electro', 'Compl�tez les paroles "Ooh, it\'s something magical..." Justin Timberlake - Can\'t Stop The Feeling', 'cant_stop_the_feeling.mp3', '2', true), -- 39
('BlindTest', 'Pop et Electro', 'Quel est le titre de cette chanson ?', 'two_feets_go_fuck_yourself.mp3', '2', true), -- 40
('BlindTest', 'House', 'Qui est l\'artiste ?', 'no_promises.mp3', '1', true), -- 41
('BlindTest', 'House', 'Quel est le titre de cette chanson compos�e par Justin Caruso ?', 'talk_about_me.mp3', '2', true), -- 42
('BlindTest', 'House', 'Compl�tez les paroles "It\'s been a long day..." Wiz Khalifa - See you again', 'see_you_again.mp3', '2', true), -- 43
('BlindTest', 'House', 'Quel est le titre de cette chanson ?', 'symphony.mp3', '2', true), -- 44
('MCQ', 'Le d�barquement de Normandie', 'De quelle ville fran�aise la population a �t� �limin�e par les troupes SS ?', null, '1', true), -- 45
('MCQ', 'Les scientifiques', '� la suite du projet Manhattan, quel surnom Robert Oppenheimer a-t-il obtenu ?', null, '1', true), -- 46
('MCQ', 'Les f�lins', 'Combien de kg de viande mange un tigre adulte annuellement ?', null, '1', true), -- 47
('MCQ', 'Les �tats-Unis', 'Combien de personnes volent au-dessus des �tats-Unis � chaque instant ?', null, '1', true), -- 48
('MCQ', 'Les ordinateurs', 'Qu\'est-ce que Ray Tomlinson a cr�� ? ?', null, '1', true), -- 49
('MCQ', 'Culture du monde', 'Quel est le nom du quartier populaire geek � Tokyo ?', null, '1', true), -- 50
('MCQ', 'Le monde en 2016', 'Quelle mission spatiale a �t� mise fin en 2016 ?', null, '1', true), -- 51
('MCQ', 'La Coupe du monde de football', 'Quel pays a remport� la premi�re Coupe du monde ?', null, '1', true), -- 52
('BlindTest', 'Chanson fran�aise', 'Devinez le groupe de musique', 'noir_desir_le_vent_nous_portera.mp3', '1', true), -- 53
('BlindTest', 'Pop et Electro', 'Qui est l\'artiste ?', 'zara_larsson_aint_my_fault.mp3', '1', true), -- 54
('BlindTest', 'House', 'En quelle ann�e est sortie cette composition ?', 'calvin_harris_my_way.mp3', '1', true); -- 55

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
	typeAnswer VARCHAR(15) NOT NULL, -- Type de r�ponse
	answerContent VARCHAR(255), -- R�ponse
	desc_answer VARCHAR(255), -- Description de la r�ponse
	isTrue BOOLEAN, -- R�ponse juste ou non
	CONSTRAINT PK_ANSWERS PRIMARY KEY (id_answer),
	FOREIGN KEY (id_quest) REFERENCES questions (id_quest)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- answers content
--

INSERT INTO answers (id_quest, typeAnswer, answerContent, desc_answer, isTrue) VALUES
('1', 'SimpleAnswer', 'France', '', false),
('1', 'SimpleAnswer', 'Irlande', 'Les sc�nes de d�barquement du film Il faut sauver le soldat Ryan ont �t� tourn�es en Irlande. La plupart des figurants �taient des r�servistes de l\'arm�e allemande.', true),
('1', 'SimpleAnswer', 'Allemagne', '', false),
('1', 'SimpleAnswer', 'Angleterre', '', false),
('2', 'SimpleAnswer', 'Pologne', '', false),
('2', 'SimpleAnswer', 'Allemagne', 'Et le 6 juin 1944, jour de l\'invasion, Rommel f�tait l\'anniversaire de sa femme en Allemagne. Il est rentr� pr�cipitamment � son poste de commandement � La Roche-Guyon.', true),
('2', 'SimpleAnswer', 'France', '', false),
('2', 'SimpleAnswer', 'Italie', '', false),
('3', 'SimpleAnswer', '5', 'Les combats se sont concentr�s sur 5 plages : d\'ouest en est, Utah et Omaha (arm�e am�ricaine), Gold (arm�e britannique), Juno (arm�e canadienne) et Sword (arm�es britannique et fran�aise).', true),
('3', 'SimpleAnswer', '8', '', false),
('3', 'SimpleAnswer', '10', '', false),
('3', 'SimpleAnswer', '12', '', false),
('4', 'SimpleAnswer', 'Charles de Gaulle', '', false),
('4', 'SimpleAnswer', 'Winston Churchill', '', false),
('4', 'SimpleAnswer', 'Franklin Delano Roosevelt', 'Ce sont les Am�ricains qui �taient partisans d\'une attaque par la Manche, la voie la plus courte pour atteindre le c�ur de l\'Allemagne.', true),
('4', 'SimpleAnswer', 'Joseph Staline', '', false),
('5', 'SimpleAnswer', 'Neptune', 'En 1846, l\'astronome fran�ais Urbain Le Verrier a pr�dit math�matiquement l\'existence et la position de Neptune � partir de la trajectoire et des caract�ristiques d\'Uranus. Deux ans de calculs ont �t� n�cessaires pour arriver � cette conclusion.', true),
('5', 'SimpleAnswer', 'Saturne', '', false),
('5', 'SimpleAnswer', 'Pluton', '', false),
('5', 'SimpleAnswer', 'Uranus', '', false),
('6', 'SimpleAnswer', 'Madagascar', '', false),
('6', 'SimpleAnswer', '�les Gal�pagos', 'C\'est aux �les Gal�pagos, � l\'ouest de l\'�quateur, que Charles Darwin a r�colt� les nombreux �chantillons qui lui permettront d\'�laborer sa th�orie sur l\'�volution des esp�ces.', true),
('6', 'SimpleAnswer', '�le Maurice', '', false),
('6', 'SimpleAnswer', '�les aux Cocos', '', false),
('7', 'SimpleAnswer', 'James Watt', '', false),
('7', 'SimpleAnswer', 'Andr� Marie Amp�re', 'Le physicien fran�ais Andr� Marie Amp�re, n� en 1775, a r�alis� d\'importantes d�couvertes dans le domaine de l\'�lectromagn�tisme. On a donn�e son nom � l\'unit� internationale de l\'intensit� du courant �lectrique : l\'amp�re.', true),
('7', 'SimpleAnswer', 'Dmitri Ivanovitch Mendele�ev', '', false),
('7', 'SimpleAnswer', 'Michael Faraday', '', false),
('8', 'SimpleAnswer', 'Chimie', '', false),
('8', 'SimpleAnswer', 'Optique', 'En optique, on doit au physicien, math�maticien et astronome anglais Isaac Newton une th�orie de la couleur selon laquelle un prisme d�compose la lumi�re blanche en un spectre visible. Et on lui doit aussi le t�lescope � r�flexion.', true),
('8', 'SimpleAnswer', 'Biologie', '', false),
('8', 'SimpleAnswer', 'M�decine', '', false),
('9', 'SimpleAnswer', 'Le chat voit flou de loin et mal de pr�s', 'Le chat voit flou de loin et mal de pr�s. Sa vision la plus pr�cise se situe entre 10 et 80 cm (4 et 32 po).', true),
('9', 'SimpleAnswer', 'Le chat voit mal de loin et flou de pr�s', '', false),
('9', 'SimpleAnswer', 'Le chat voit � la fois flou de loin et de pr�s', '', false),
('9', 'SimpleAnswer', 'Le chat voit � la fois mal de loin et de pr�s', '', false),
('10', 'SimpleAnswer', '50 m�tres', '', false),
('10', 'SimpleAnswer', '100 m�tres', 'Le chat a un odorat si fin qui peut d�tecter la pr�sence d\'un autre chat � 100 m (325 pi) de distance. Il utilise pour cela son nez, mais aussi son organe de Jacobson, situ� � l\'avant du palais.', true),
('10', 'SimpleAnswer', '250 m�tres', '', false),
('10', 'SimpleAnswer', '500 m�tres', '', false),
('11', 'SimpleAnswer', 'Le tigre', '', false),
('11', 'SimpleAnswer', 'Le lion', 'Les lions sont les seuls f�lins � vivre en groupe. Ils �voluent g�n�ralement dans un clan compos� de 1 � 3 m�les (dont un seul alpha), de 5 � 10 femelles et de leurs petits.', true),
('11', 'SimpleAnswer', 'La panth�re', '', false),
('11', 'SimpleAnswer', 'Le puma', '', false),
('12', 'SimpleAnswer', 'Europe', '', false),
('12', 'SimpleAnswer', 'Am�rique', '', false),
('12', 'SimpleAnswer', 'Antarctique', 'Les f�lins ont colonis� tous les continents, sauf l\'Antarctique et l\'Australie. Ce sont les humains qui ont introduit les f�lins en Australie.', true),
('12', 'SimpleAnswer', 'Asie', '', false),
('13', 'SimpleAnswer', 'Alaska', '', false),
('13', 'SimpleAnswer', 'Hawa�', 'Le 21 ao�t 1959, Hawa� a �t� le dernier �tat � joindre les �tats-Unis.', true),
('13', 'SimpleAnswer', 'Arizona', '', false),
('13', 'SimpleAnswer', 'Nouveau-Mexique', '', false),
('14', 'SimpleAnswer', '2', '', false),
('14', 'SimpleAnswer', '3', '', false),
('14', 'SimpleAnswer', '4', 'Durant les Jeux olympiques d\'�t� de 1936 � Berlin, Jesse Owens, le premier athl�te afro-am�ricain de renomm�e internationale, a remport� 4 m�dailles d\'or sous les yeux d\'Adolf Hitler.', true),
('14', 'SimpleAnswer', '5', '', false),
('15', 'SimpleAnswer', '6', '', false),
('15', 'SimpleAnswer', '8', '', false),
('15', 'SimpleAnswer', '10', '', false),
('15', 'SimpleAnswer', '12', 'Dans le cadre du programme Apollo (1969 � 1972), douze astronautes am�ricains ont march� sur la Lune.', true),
('16', 'SimpleAnswer', '48', '', false),
('16', 'SimpleAnswer', '50', 'Les �tats-Unis sont compos�s de 50 �tats auxquels s\'ajoutent le District de Columbia (comprenant la capitale Washington) et 5 territoires d�pendants.', true),
('16', 'SimpleAnswer', '52', '', false),
('16', 'SimpleAnswer', '56', '', false),
('17', 'SimpleAnswer', '100 mm', '', false),
('17', 'SimpleAnswer', '200 mm', 'Les premi�res disquettes, mises au point � la fin des ann�es 1960, mesuraient 200 mm (8 po) de diam�tre.', true),
('17', 'SimpleAnswer', '300 mm', '', false),
('17', 'SimpleAnswer', '400 mm', '', false),
('18', 'SimpleAnswer', '200 ko', '', false),
('18', 'SimpleAnswer', '400 ko', 'En 1981, Sony pr�sentait les premi�res disquettes de 3,5 po. Elles avaient une capacit� de 400 ko. Ensuite vinrent les disquettes 3,5 po de 720 ko (double-density), puis celles de 1,44 Mo (high-density).', true),
('18', 'SimpleAnswer', '800 ko', '', false),
('18', 'SimpleAnswer', '1 mo', '', false),
('19', 'SimpleAnswer', '1983', '', false),
('19', 'SimpleAnswer', '1989', 'Le premier site web a �t� mis en ligne par le CERN, le Conseil europ�en pour la recherche nucl�aire, en mars 1989.', true),
('19', 'SimpleAnswer', '1991', '', false),
('19', 'SimpleAnswer', '1995', '', false),
('20', 'SimpleAnswer', 'Netscape Navigator', '', false),
('20', 'SimpleAnswer', 'Mosaic', 'Le navigateur Mosaic, d�velopp� en 1993, est consid�r� comme le navigateur qui a popularis� Internet en affichant non seulement du texte, mais aussi des images.', true),
('20', 'SimpleAnswer', 'Nexus', '', false),
('20', 'SimpleAnswer', 'ViolaWWW', '', false),
('21', 'SimpleAnswer', 'Le weka', '', false),
('21', 'SimpleAnswer', 'Le kakariki', '', false),
('21', 'SimpleAnswer', 'Le kiwi', 'Le kiwi est un oiseau inoffensif et originaire de la Nouvelle-Z�lande. Seulement trouvable dans ce pays, il en est le symbole de ce pays et de la nature.', true),
('21', 'SimpleAnswer', 'Le kea', '', false),
('22', 'SimpleAnswer', 'Aux Pays-Bas', '', false),
('22', 'SimpleAnswer', 'En Allemagne', '', false),
('22', 'SimpleAnswer', 'En Belgique francophone', 'Il fait r�f�rence � la chute de l\'Empire romain et l\'av�nement de la Gaule.', true),
('22', 'SimpleAnswer', 'En Irlande', '', false),
('23', 'SimpleAnswer', 'Aux Pays-Bas', 'C\'est la devise royale, toujours en langue fran�aise, (celle de la maison d\'Orange-Nassau, depuis Guillaume le Taciturne en 1544).', true),
('23', 'SimpleAnswer', 'En Autriche', '', false),
('23', 'SimpleAnswer', 'En Norv�ge', '', false),
('23', 'SimpleAnswer', 'En Suisse', '', false),
('24', 'SimpleAnswer', 'Argentine', '', false),
('24', 'SimpleAnswer', 'Luxembourg', '', false),
('24', 'SimpleAnswer', 'Canada', 'Le castor � large queue plate est l\'embl�me du Canada. Il figure m�me sur les pi�ces de 5 cents et sur un timbre canadien au moins.', true),
('24', 'SimpleAnswer', 'Chili', '', false),
('25', 'SimpleAnswer', 'The Revenant', '', false),
('25', 'SimpleAnswer', 'Spotlight', 'Spotlight, le long-m�trage consacr� � l\'enqu�te journalistique du Boston Globe sur un scandale sexuel impliquant l\'�glise catholique, a cr�� la surprise en remportant la statuette du meilleur film au d�triment du favori, The Revenant.', true),
('25', 'SimpleAnswer', 'Ex machina', '', false),
('25', 'SimpleAnswer', 'Mad Max', '', false),
('26', 'SimpleAnswer', 'F�vrier', '', false),
('26', 'SimpleAnswer', 'Juin', '', false),
('26', 'SimpleAnswer', 'Ao�t', '', false),
('26', 'SimpleAnswer', 'Octobre', 'Matthew, un ouragan de cat�gorie 5, a caus� la mort de pr�s de 1000 personnes en Ha�ti, en plus de faire des dizaines de milliards de dollars de dommage dans les Antilles jusqu\'� la Floride.', true),
('27', 'SimpleAnswer', 'Golden Globe de la meilleure chanson originale', '', false),
('27', 'SimpleAnswer', 'Prix Pulitzer : Citation sp�ciale', '', false),
('27', 'SimpleAnswer', 'Prix Nobel de litt�rature', 'L\'Acad�mie su�doise a remis le prix Nobel de litt�rature au chanteur et po�te Bob Dylan � pour avoir cr�� dans le cadre de la grande tradition de la musique am�ricaine de nouveaux modes d\'expression po�tique �.', true),
('27', 'SimpleAnswer', 'Grammy Award de la meilleure prestation vocale rock masculine', '', false),
('28', 'SimpleAnswer', 'Christopher Froome', 'En 2016, Christopher Froome remporte son troisi�me Tour de France apr�s ceux de 2013 et de 2015.', true),
('28', 'SimpleAnswer', 'Romain Bardet', '', false),
('28', 'SimpleAnswer', 'Nairo Quintana', '', false),
('28', 'SimpleAnswer', 'Adam Yates', '', false),
('29', 'SimpleAnswer', 'France', '', false),
('29', 'SimpleAnswer', 'Br�sil', 'Le Br�sil a chacun gagn� deux Coupes du monde cons�cutives : en 1958 et 1962.', true),
('29', 'SimpleAnswer', 'Allemagne', '', false),
('29', 'SimpleAnswer', 'Angleterre', '', false),
('30', 'SimpleAnswer', 'Br�sil', '', false),
('30', 'SimpleAnswer', 'Argentine', '', false),
('30', 'SimpleAnswer', 'Pays-Bas', 'Les Pays-Bas ont particip� � trois finales : 1974, 1978 et 2010. Ils ont perdu � chaque occasion. Ils d�tiennent ainsi le record du plus grand nombre de d�faites en finales sans jamais avoir remport� la Coupe du monde de football.', true),
('30', 'SimpleAnswer', 'Su�de', '', false),
('31', 'SimpleAnswer', 'Ronaldo (Ronaldo Luis Naz�rio de Lima)', '', false),
('31', 'SimpleAnswer', 'Pel�', 'Edson Arantes do Nascimento, dit Pel�, est le seul footballeur � avoir �t� champion du monde � trois reprises : en 1958, 1962 et 1970.', true),
('31', 'SimpleAnswer', 'Zinedine Zidane', '', false),
('31', 'SimpleAnswer', 'Diego Maradona', '', false),
('32', 'SimpleAnswer', 'Br�silien', '', false),
('32', 'SimpleAnswer', 'Fran�ais', 'Le 13 juillet 1930, le Fran�ais Lucien Laurent marque le premier but de la premi�re �dition de la Coupe du monde de football.', true),
('32', 'SimpleAnswer', 'Argentin', '', false),
('32', 'SimpleAnswer', 'Am�ricain', '', false),
('33', 'SimpleAnswer', 'Jenifer', '', false),
('33', 'SimpleAnswer', 'Carla Bruni', '"Quelqu\'un m\'a dit" est le premier album de la chanteuse franco-italienne et mannequin Carla Bruni. Produit et arrang� par Louis Bertignac, il est sorti en 2002.', true),
('33', 'SimpleAnswer', 'Tal', '', false),
('33', 'SimpleAnswer', 'Amel Bent', '', false),
('34', 'SimpleAnswer', 'Avec le temps', '', false),
('34', 'SimpleAnswer', 'Vingt ans', '', false),
('34', 'SimpleAnswer', 'Jolie M�me', '', false),
('34', 'SimpleAnswer', 'L\'affiche rouge', 'Cette composition sous le titre L\'Affiche rouge par L�o Ferr� en 1959 est l\'adaptation du po�me de Louis Aragon "Strophes pour se souvenir".', true),
('35', 'SimpleAnswer', '... tous les whiskies', 'Je suis malade est � la fois un album de Serge Lama, sorti en 1973, et l\'une des chansons les plus c�l�bres de cet album.', true),
('35', 'SimpleAnswer', '... toutes les bi�res', '', false),
('35', 'SimpleAnswer', '... tous les vins', '', false),
('35', 'SimpleAnswer', '... tous les sodas', '', false),
('36', 'SimpleAnswer', '2008', '', false),
('36', 'SimpleAnswer', '2009', '', false),
('36', 'SimpleAnswer', '2010', 'L\'album "On trace la route" de Christophe Ma� sorti le 22 mars 2010 a totalis� 546 575 exemplaires de vendus', true),
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
('45', 'SimpleAnswer', 'Oradour-sur-Glane', 'Pour effrayer la population normande et l\'emp�cher de soutenir la r�sistance, les SS ont tu� 642 personnes le 10 juin 1944. Il s\'agit du plus grand massacre de civils commis en France par les arm�es allemandes.', true),
('45', 'SimpleAnswer', 'Angoul�me', '', false),
('45', 'SimpleAnswer', 'Cieux', '', false),
('46', 'SimpleAnswer', '� p�re de la bombe atomique �', 'Le physicien am�ricain Julius Robert Oppenheimer, n� en 1904, a �t� le directeur scientifique du projet Manhattan (nom de code du projet qui produisit la bombe atomique). C\'est � ce r�le qu\'il doit son surnom de � p�re de la bombe atomique �.', true),
('46', 'SimpleAnswer', '� enfant de la bombe atomique �', '', false),
('46', 'SimpleAnswer', '� p�re de la bombe nucl�aire �', '', false),
('46', 'SimpleAnswer', '� enfant de la bombe nucl�aire �', '', false),
('47', 'SimpleAnswer', '0 � 1100 kg', '', false),
('47', 'SimpleAnswer', '1100 kg � 1800 kg', '', false),
('47', 'SimpleAnswer', '1800 kg � 2500 kg', 'Un tigre adulte a besoin de 1800 � 2500 kg de viande par an. Il mange donc en moyenne de 4 � 6 kg de viande par jour. Toutefois, apr�s avoir d�vor� une grosse proie, il peut passer plusieurs jours sans rien manger.', true),
('47', 'SimpleAnswer', '2500 kg � 3000 kg', '', false),
('48', 'SimpleAnswer', '10 000 personnes', '', false),
('48', 'SimpleAnswer', '25 000 personnes', '', false),
('48', 'SimpleAnswer', '45 000 personnes', '', false),
('48', 'SimpleAnswer', '60 0000 personnes', 'Plus de 60 000 personnes voyagent � bord d\'un avion quelque part au-dessus des �tats-Unis � tout moment de la journ�e.', true),
('49', 'SimpleAnswer', 'Le courrier �lectronique', '', true),
('49', 'SimpleAnswer', 'Le protocole HTTP', '', false),
('49', 'SimpleAnswer', 'Le World Wide Web', '', false),
('49', 'SimpleAnswer', 'Le syst�me des noms de domaine', 'Ray Tomlinson, le cr�ateur du courrier �lectronique, a eu l\'id�e de s�parer le nom d\'utilisateur et le nom d\'h�te par un caract�re qui n\'�tait utilis� dans aucun nom propre et qui pouvait servir de pr�fixe aux noms de domaine : le symbole @.', false),
('50', 'SimpleAnswer', 'Shibuya', '', false),
('50', 'SimpleAnswer', 'Shinjuku', '', false),
('50', 'SimpleAnswer', 'Odaiba', '', false),
('50', 'SimpleAnswer', 'Akihabara', 'Akihabara est le quartier �lectronique de Tokyo. C\'est le lieu privil�gi� des amateurs de mangas, jeux vid�o et de culture populaire japonaise, tr�s appr�ci� des jeunes touristes �trangers "geek" ou "otaku".', true),
('51', 'SimpleAnswer', 'Juno', '', false),
('51', 'SimpleAnswer', 'ExoMars', '', false),
('51', 'SimpleAnswer', 'Rosetta', 'Douze ans apr�s son d�part pour un long voyage dans le syst�me solaire, la sonde Rosetta s\'est �cras�e � la surface de la com�te Tchouri, qu\'elle �tudiait.', true),
('51', 'SimpleAnswer', 'New Horizons', '', false),
('52', 'SimpleAnswer', 'France', '', false),
('52', 'SimpleAnswer', 'Uruguay', 'C\'est l\'Uruguay, le pays h�te de la premi�re Coupe du monde, qui a remport� le tournoi apr�s une victoire en finale contre l\'Argentine.', true),
('52', 'SimpleAnswer', 'Argentine', '', false),
('52', 'SimpleAnswer', '�tats-Unis', '', false),
('53', 'SimpleAnswer', 'Noir D�sir', 'Le vent nous portera est une chanson du groupe Noir D�sir sortie le 28 ao�t 2001 en single et publi�e sur l\'album Des visages des figures le 11 septembre 2001.', true),
('53', 'SimpleAnswer', 'Yannick', '', false),
('53', 'SimpleAnswer', 'Francis Cabrel', '', false),
('53', 'SimpleAnswer', 'Calogero', '', false),
('54', 'SimpleAnswer', 'Rihanna', '', false),
('54', 'SimpleAnswer', 'Zara Larsson', '"Ain\'t My Fault" est une chanson de l\'auteure-compositrice-interpr�te su�doise Zara Larsson. Elle sort le 2 septembre 2016 en tant que premier single extrait de son deuxi�me album studio, sous les labels TEN, Epic et Sony.', true),
('54', 'SimpleAnswer', 'Katy Perry', '', false),
('54', 'SimpleAnswer', 'Sia', '', false),
('55', 'SimpleAnswer', '2014', '', false),
('55', 'SimpleAnswer', '2015', '', false),
('55', 'SimpleAnswer', '2016', '"My Way" est une composition de Calvin Harris. Elle est sortie le 16 septembre 2016.', true),
('55', 'SimpleAnswer', '2017', '', false);

COMMIT;