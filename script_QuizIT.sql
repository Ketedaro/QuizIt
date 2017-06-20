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
('MCQ', 'Le d�barquement de Normandie', 'O� �taient tourn�es les sc�nes de d�barquement du film "Il faut sauver le soldat Ryan" ?', null, '1', true), -- 1
('MCQ', 'Le d�barquement de Normandie', 'O� se trouvait le mar�chal Rommel, responsable de la Normandie, le 6 juin 1944 ?', null, '1', true), -- 2
('MCQ', 'Le d�barquement de Normandie', 'Sur combien de plages se concentr�s les combats du 6 juin 1944 ?', null, '1', true), -- 3
('MCQ', 'Le d�barquement de Normandie', 'Quel personnage �tait un ardent d�fenseur du projet de d�barquement en Normandie ?', null, '1', true), -- 4
('MCQ', 'Les scientifiques', 'Quelle plan�te Urbain Le Verrier a-t-il d�couvert par des calculs math�matiques ?', null, '1', true), -- 5
('MCQ', 'Les scientifiques', 'Sur quelle(s) �le(s) Darwin a-t-il d�velopp� sa th�orie sur l��volution des esp�ces ?', null, '1', true), -- 6
('MCQ', 'Les scientifiques', 'Quel scientifique a donn� son nom � l�unit� d�intensit� du courant �lectrique ?', null, '1', true), -- 7
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
('MCQ', 'Le monde en 2016', 'Quel film a remport� l�Oscar du meilleur film en 2016 ?', null, '1', true), -- 25
('MCQ', 'Le monde en 2016', 'En quel mois a eu lieu l\'ouragan Matthew qui a tu� pr�s de 1000 personnes en Ha�ti ?', null, '1', true), -- 26
('MCQ', 'Le monde en 2016', 'Quel prix Bob Dylan, chanteur et po�te, a-t-il re�u en 2016 ?', null, '1', true), -- 27
('MCQ', 'Le monde en 2016', 'Quel cycliste a remport� le Tour de France en 2016 ?', null, '1', true), -- 28
('MCQ', 'La Coupe du monde de football', 'Quel pays a remport� deux fois d\'affil� la Coupe du monde ?', null, '1', true), -- 29
('MCQ', 'La Coupe du monde de football', 'Quel pays d�tient du record de d�faites en finale de Coupe du monde ?', null, '1', true), -- 30
('MCQ', 'La Coupe du monde de football', 'Quel footballeur a champion du monde � trois reprises ?', null, '1', true), -- 31
('MCQ', 'La Coupe du monde de football', 'De quelle nationalit� �tait le footballeur qui a marqu� le premier but de la premi�re �dition de la Coupe du monde ?', null, '1', true), -- 32
('Blindtest', 'Chanson fran�aise', 'Qui est l\'artiste ?', 'quelquun_ma_dit.mp3', '1', true), -- 33
('Blindtest', 'Chanson fran�aise', 'Quel est le titre de cette chanson compos�e par L�o Ferr� ?', 'leo_ferre_affiche_rouge.mp3', '2', true), -- 34
('Blindtest', 'Chanson fran�aise', 'Compl�tez les paroles "Je bois toutes les nuits mais..." de Serge Lama - Je suis malade', 'leo_ferre_affiche_rouge.mp3', '2', true), -- 35
('Blindtest', 'Chanson fran�aise', 'En quelle ann�e cet album a �t� le plus vendu ?', 'christophe_mae_on_trace_la_route.mp3', '2', true), -- 36
('Blindtest', 'Pop / Electro', 'Qui est l\'artiste ?', 'calvin_harris_this_is_what_you_came_for.mp3', '1', true), -- 37
('Blindtest', 'Pop / Electro', 'Quel est le titre de cette chanson compos�e par Ed Sheeran ?', 'shape_of_you.mp3', '2', true), -- 38
('Blindtest', 'Pop / Electro', 'Compl�tez les paroles "Ooh, it\'s something magical..." Justin Timberlake - Can\'t Stop The Feeling !', 'cant_stop_the_feeling.mp3', '2', true), -- 39
('Blindtest', 'Pop / Electro', 'Quel est le titre de cette chanson ?', 'two_feets_go_fuck_yourself.mp3', '2', true), -- 40
('Blindtest', 'House', 'Qui est l\'artiste ?', 'no_promises.mp3', '1', true), -- 41
('Blindtest', 'House', 'Quel est le titre de cette chanson compos�e par Justin Caruso ?', 'talk_about_me.mp3', '2', true), -- 42
('Blindtest', 'House', 'Compl�tez les paroles "It\'s been a long day..." Wiz Khalifa - See you again', 'see_you_again.mp3', '2', true), -- 43
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
	typeAnswer VARCHAR(15) NOT NULL, -- Type de r�ponse
	answerContent VARCHAR(255) NOT NULL, -- R�ponse
	desc_answer VARCHAR(255), -- Description de la r�ponse
	isTrue BOOLEAN, -- R�ponse juste ou non
	CONSTRAINT PK_ANSWERS PRIMARY KEY (id_answer),
	FOREIGN KEY (id_quest) REFERENCES questions (id_quest)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- answers content
--

INSERT INTO answers (id_quest, typeAnswer, answerContent, desc_answer, isTrue) VALUES
('1', 'MCQ', 'France', '', false),
('1', 'MCQ', 'Irlande', 'Les sc�nes de d�barquement du film Il faut sauver le soldat Ryan ont �t� tourn�es en Irlande. La plupart des figurants �taient des r�servistes de l�arm�e allemande.', true),
('1', 'MCQ', 'Allemagne', '', false),
('1', 'MCQ', 'Angleterre', '', false),
('2', 'MCQ', 'Pologne', '', false),
('2', 'MCQ', 'Allemagne', 'Et le 6 juin 1944, jour de l�invasion, Rommel f�tait l�anniversaire de sa femme en Allemagne. Il est rentr� pr�cipitamment � son poste de commandement � La Roche-Guyon.', true),
('2', 'MCQ', 'France', '', false),
('2', 'MCQ', 'Italie', '', false),
('3', 'MCQ', '5', 'Les combats se sont concentr�s sur 5 plages : d�ouest en est, Utah et Omaha (arm�e am�ricaine), Gold (arm�e britannique), Juno (arm�e canadienne) et Sword (arm�es britannique et fran�aise).', true),
('3', 'MCQ', '8', '', false),
('3', 'MCQ', '10', '', false),
('3', 'MCQ', '12', '', false),
('4', 'MCQ', 'Charles de Gaulle', '', false),
('4', 'MCQ', 'Winston Churchill', '', false),
('4', 'MCQ', 'Franklin Delano Roosevelt', 'Ce sont les Am�ricains qui �taient partisans d�une attaque par la Manche, la voie la plus courte pour atteindre le c�ur de l�Allemagne.', true),
('4', 'MCQ', 'Joseph Staline', '', false),
('5', 'MCQ', 'Neptune', 'En 1846, l�astronome fran�ais Urbain Le Verrier a pr�dit math�matiquement l�existence et la position de Neptune � partir de la trajectoire et des caract�ristiques d�Uranus. Deux ans de calculs ont �t� n�cessaires pour arriver � cette conclusion.', true),
('5', 'MCQ', 'Saturne', '', false),
('5', 'MCQ', 'Pluton', '', false),
('5', 'MCQ', 'Uranus', '', false),
('6', 'MCQ', 'Madagascar', '', false),
('6', 'MCQ', '�les Gal�pagos', 'C�est aux �les Gal�pagos, � l�ouest de l��quateur, que Charles Darwin a r�colt� les nombreux �chantillons qui lui permettront d��laborer sa th�orie sur l��volution des esp�ces.', true),
('6', 'MCQ', '�le Maurice', '', false),
('6', 'MCQ', '�les aux Cocos', '', false),
('7', 'MCQ', 'James Watt', '', false),
('7', 'MCQ', 'Andr� Marie Amp�re', 'Le physicien fran�ais Andr� Marie Amp�re, n� en 1775, a r�alis� d�importantes d�couvertes dans le domaine de l��lectromagn�tisme. On a donn�e son nom � l�unit� internationale de l�intensit� du courant �lectrique : l�amp�re.', true),
('7', 'MCQ', 'Dmitri Ivanovitch Mendele�ev', '', false),
('7', 'MCQ', 'Michael Faraday', '', false),
('8', 'MCQ', 'Chimie', '', false),
('8', 'MCQ', 'Optique', 'En optique, on doit au physicien, math�maticien et astronome anglais Isaac Newton une th�orie de la couleur selon laquelle un prisme d�compose la lumi�re blanche en un spectre visible. Et on lui doit aussi le t�lescope � r�flexion.', true),
('8', 'MCQ', 'Biologie', '', false),
('8', 'MCQ', 'M�decine', '', false),
('9', 'MCQ', 'Le chat voit flou de loin et mal de pr�s', 'Le chat voit flou de loin et mal de pr�s. Sa vision la plus pr�cise se situe entre 10 et 80 cm (4 et 32 po).', true),
('9', 'MCQ', 'Le chat voit mal de loin et flou de pr�s', '', false),
('9', 'MCQ', 'Le chat voit � la fois flou de loin et de pr�s', '', false),
('9', 'MCQ', 'Le chat voit � la fois mal de loin et de pr�s', '', false),
('10', 'MCQ', '50 m�tres', '', false),
('10', 'MCQ', '100 m�tres', 'Le chat a un odorat si fin qui peut d�tecter la pr�sence d�un autre chat � 100 m (325 pi) de distance. Il utilise pour cela son nez, mais aussi son organe de Jacobson, situ� � l�avant du palais.', true),
('10', 'MCQ', '250 m�tres', '', false),
('10', 'MCQ', '500 m�tres', '', false),
('11', 'MCQ', 'Le tigre', '', false),
('11', 'MCQ', 'Le lion', 'Les lions sont les seuls f�lins � vivre en groupe. Ils �voluent g�n�ralement dans un clan compos� de 1 � 3 m�les (dont un seul alpha), de 5 � 10 femelles et de leurs petits.', true),
('11', 'MCQ', 'La panth�re', '', false),
('11', 'MCQ', 'Le puma', '', false),
('12', 'MCQ', 'Europe', '', false),
('12', 'MCQ', 'Am�rique', '', false),
('12', 'MCQ', 'Antarctique', 'Les f�lins ont colonis� tous les continents, sauf l�Antarctique et l�Australie. Ce sont les humains qui ont introduit les f�lins en Australie.', true),
('12', 'MCQ', 'Asie', '', false),
('13', 'MCQ', 'Alaska', '', false),
('13', 'MCQ', 'Hawa�', 'Le 21 ao�t 1959, Hawa� a �t� le dernier �tat � joindre les �tats-Unis.', true),
('13', 'MCQ', 'Arizona', '', false),
('13', 'MCQ', 'Nouveau-Mexique', '', false),
('14', 'MCQ', '2', '', false),
('14', 'MCQ', '3', '', false),
('14', 'MCQ', '4', 'Durant les Jeux olympiques d��t� de 1936 � Berlin, Jesse Owens, le premier athl�te afro-am�ricain de renomm�e internationale, a remport� 4 m�dailles d�or sous les yeux d�Adolf Hitler.', true),
('14', 'MCQ', '5', '', false),
('15', 'MCQ', '6', '', false),
('15', 'MCQ', '8', '', false),
('15', 'MCQ', '10', '', false),
('15', 'MCQ', '12', 'Dans le cadre du programme Apollo (1969 � 1972), douze astronautes am�ricains ont march� sur la Lune.', true),
('16', 'MCQ', '48', '', false),
('16', 'MCQ', '50', 'Les �tats-Unis sont compos�s de 50 �tats auxquels s�ajoutent le District de Columbia (comprenant la capitale Washington) et 5 territoires d�pendants.', true),
('16', 'MCQ', '52', '', false),
('16', 'MCQ', '56', '', false),
('17', 'MCQ', '100 mm', '', false),
('17', 'MCQ', '200 mm', 'Les premi�res disquettes, mises au point � la fin des ann�es 1960, mesuraient 200 mm (8 po) de diam�tre.', true),
('17', 'MCQ', '300 mm', '', false),
('17', 'MCQ', '400 mm', '', false),
('18', 'MCQ', '200 ko', '', false),
('18', 'MCQ', '400 ko', 'En 1981, Sony pr�sentait les premi�res disquettes de 3,5 po. Elles avaient une capacit� de 400 ko. Ensuite vinrent les disquettes 3,5 po de 720 ko (double-density), puis celles de 1,44 Mo (high-density).', true),
('18', 'MCQ', '800 ko', '', false),
('18', 'MCQ', '1 mo', '', false),
('19', 'MCQ', '1983', '', false),
('19', 'MCQ', '1989', 'Le premier site web a �t� mis en ligne par le CERN, le Conseil europ�en pour la recherche nucl�aire, en mars 1989.', true),
('19', 'MCQ', '1991', '', false),
('19', 'MCQ', '1995', '', false),
('20', 'MCQ', 'Netscape Navigator', '', false),
('20', 'MCQ', 'Mosaic', 'Le navigateur Mosaic, d�velopp� en 1993, est consid�r� comme le navigateur qui a popularis� Internet en affichant non seulement du texte, mais aussi des images.', true),
('20', 'MCQ', 'Nexus', '', false),
('20', 'MCQ', 'ViolaWWW', '', false),
('21', 'MCQ', 'Le weka', '', false),
('21', 'MCQ', 'Le kakariki', '', false),
('21', 'MCQ', 'Le kiwi', 'Le kiwi est un oiseau inoffensif et originaire de la Nouvelle-Z�lande. Seulement trouvable dans ce pays, il en est le symbole de ce pays et de la nature.', true),
('21', 'MCQ', 'Le kea', '', false),
('22', 'MCQ', 'Aux Pays-Bas', '', false),
('22', 'MCQ', 'En Allemagne', '', false),
('22', 'MCQ', 'En Belgique francophone', 'Il fait r�f�rence � la chute de l\'Empire romain et l\'av�nement de la Gaule.', true),
('22', 'MCQ', 'En Irlande', '', false),
('23', 'MCQ', 'Aux Pays-Bas', 'C\'est la devise royale, toujours en langue fran�aise, (celle de la maison d\'Orange-Nassau, depuis Guillaume le Taciturne en 1544).', true),
('23', 'MCQ', 'En Autriche', '', false),
('23', 'MCQ', 'En Norv�ge', '', false),
('23', 'MCQ', 'En Suisse', '', false),
('24', 'MCQ', 'Argentine', '', false),
('24', 'MCQ', 'Luxembourg', '', false),
('24', 'MCQ', 'Canada', 'Le castor � large queue plate est l\'embl�me du Canada. Il figure m�me sur les pi�ces de 5 cents et sur un timbre canadien au moins.', true),
('24', 'MCQ', 'Chili', '', false),
('25', 'MCQ', 'The Revenant', '', false),
('25', 'MCQ', 'Spotlight', 'Spotlight, le long-m�trage consacr� � l�enqu�te journalistique du Boston Globe sur un scandale sexuel impliquant l��glise catholique, a cr�� la surprise en remportant la statuette du meilleur film au d�triment du favori, The Revenant.', true),
('25', 'MCQ', 'Ex machina', '', false),
('25', 'MCQ', 'Mad Max', '', false),
('26', 'MCQ', 'F�vrier', '', false),
('26', 'MCQ', 'Juin', '', false),
('26', 'MCQ', 'Ao�t', '', false),
('26', 'MCQ', 'Octobre', 'Matthew, un ouragan de cat�gorie 5, a caus� la mort de pr�s de 1000 personnes en Ha�ti, en plus de faire des dizaines de milliards de dollars de dommage dans les Antilles jusqu�� la Floride.', true),
('27', 'MCQ', 'Golden Globe de la meilleure chanson originale', '', false),
('27', 'MCQ', 'Prix Pulitzer : Citation sp�ciale', '', false),
('27', 'MCQ', 'Prix Nobel de litt�rature', 'L�Acad�mie su�doise a remis le prix Nobel de litt�rature au chanteur et po�te Bob Dylan � pour avoir cr�� dans le cadre de la grande tradition de la musique am�ricaine de nouveaux modes d�expression po�tique �.', true),
('27', 'MCQ', 'Grammy Award de la meilleure prestation vocale rock masculine', '', false),
('28', 'MCQ', 'Christopher Froome', 'En 2016, Christopher Froome remporte son troisi�me Tour de France apr�s ceux de 2013 et de 2015.', true),
('28', 'MCQ', 'Romain Bardet', '', false),
('28', 'MCQ', 'Nairo Quintana', '', false),
('28', 'MCQ', 'Adam Yates', '', false),
('29', 'MCQ', 'France', '', false),
('29', 'MCQ', 'Br�sil', 'Le Br�sil a chacun gagn� deux Coupes du monde cons�cutives : en 1958 et 1962.', true),
('29', 'MCQ', 'Allemagne', '', false),
('29', 'MCQ', 'Angleterre', '', false),
('30', 'MCQ', 'Br�sil', '', false),
('30', 'MCQ', 'Argentine', '', false),
('30', 'MCQ', 'Pays-Bas', 'Les Pays-Bas ont particip� � trois finales : 1974, 1978 et 2010. Ils ont perdu � chaque occasion. Ils d�tiennent ainsi le record du plus grand nombre de d�faites en finales sans jamais avoir remport� la Coupe du monde de football.', true),
('30', 'MCQ', 'Su�de', '', false),
('31', 'MCQ', 'Ronaldo (Ronaldo Luis Naz�rio de Lima)', '', false),
('31', 'MCQ', 'Pel�', 'Edson Arantes do Nascimento, dit Pel�, est le seul footballeur � avoir �t� champion du monde � trois reprises : en 1958, 1962 et 1970.', true),
('31', 'MCQ', 'Zinedine Zidane', '', false),
('31', 'MCQ', 'Diego Maradona', '', false),
('32', 'MCQ', 'Br�silien', '', false),
('32', 'MCQ', 'Fran�ais', 'Le 13 juillet 1930, le Fran�ais Lucien Laurent marque le premier but de la premi�re �dition de la Coupe du monde de football.', true),
('32', 'MCQ', 'Argentin', '', false),
('32', 'MCQ', 'Am�ricain', '', false),
('33', 'Blindtest', 'Jenifer', '', false),
('33', 'Blindtest', 'Carla Bruni', '"Quelqu\'un m\'a dit" est le premier album de la chanteuse franco-italienne et mannequin Carla Bruni. Produit et arrang� par Louis Bertignac, il est sorti en 2002.', true),
('33', 'Blindtest', 'Tal', '', false),
('33', 'Blindtest', 'Amel Bent', '', false),
('34', 'Blindtest', 'Avec le temps', '', false),
('34', 'Blindtest', 'Vingt ans', '', false),
('34', 'Blindtest', 'Jolie M�me', '', false),
('34', 'Blindtest', 'L\'affiche rouge', 'Cette composition sous le titre L\'Affiche rouge par L�o Ferr� en 1959 est l\'adaptation du po�me de Louis Aragon "Strophes pour se souvenir".', true),
('35', 'Blindtest', '... tous les whiskies', 'Je suis malade est � la fois un album de Serge Lama, sorti en 1973, et l\'une des chansons les plus c�l�bres de cet album.', true),
('35', 'Blindtest', '... toutes les bi�res', '', false),
('35', 'Blindtest', '... tous les vins', '', false),
('35', 'Blindtest', '... tous les sodas', '', false),
('36', 'Blindtest', '2008', '', false),
('36', 'Blindtest', '2009', '', false),
('36', 'Blindtest', '2010', 'L\'album "On trace la route" de Christophe Ma� sorti le 22 mars 2010 a totalis� 546 575 exemplaires de vendus', true),
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