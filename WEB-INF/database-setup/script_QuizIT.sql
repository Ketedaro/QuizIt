--
-- QuizIT
-- Copyright � 2017 Victor CHEN, Andy HUANG, Kilian CHOLLET, Lucas MASSON
--

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
	score INTEGER DEFAULT NULL,
	isAdmin BOOLEAN DEFAULT NULL,
	CONSTRAINT PK_USERS PRIMARY KEY (id_user)
);

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
	validation BOOLEAN DEFAULT NULL,
	CONSTRAINT PK_QUESTIONS PRIMARY KEY (id_quest),
	FOREIGN KEY (id_submitter) REFERENCES users (id_user)
);

--
-- Content questions
--

INSERT INTO questions (typeQuest, topicQuest, questContent, mp3_link, id_submitter, validation) VALUES
('MCQ', 'Culture generale', 'Dans quelle langue est �crite cette question ?', null, '1', true), -- 1
('BlindTest', 'Geographie', 'Paris est-elle la capitale de la France ?', null, '1', false) -- 2
('MCQ', 'Le d�barquement de Normandie', 'O� �taient tourn�es les sc�nes de d�barquement du film "Il faut sauver le soldat Ryan" ?', null, '1', true) -- 3
('MCQ', 'Le d�barquement de Normandie', 'O� se trouvait le mar�chal Rommel, responsable de la Normandie, le 6 juin 1944 ?', null, '1', true) -- 4
('MCQ', 'Le d�barquement de Normandie', 'Sur combien de plages se concentr�s les combats du 6 juin 1944 ?', null, '1', true) -- 5
('MCQ', 'Le d�barquement de Normandie', 'Quel personnage �tait un ardent d�fenseur du projet de d�barquement en Normandie ?', null, '1', true) -- 6
('MCQ', 'Les scientifiques', 'Quelle plan�te Urbain Le Verrier a-t-il d�couvert par des calculs math�matiques ?', null, '1', true) -- 7
('MCQ', 'Les scientifiques', 'Sur quelle(s) �le(s) Darwin a-t-il d�velopp� sa th�orie sur l��volution des esp�ces ?', null, '1', true) -- 8
('MCQ', 'Les scientifiques', 'Quel scientifique a donn� son nom � l�unit� d�intensit� du courant �lectrique ?', null, '1', true) -- 9
('MCQ', 'Les scientifiques', 'Par quel nom Nikola Tesla a-t-il baptis� l"'"invention de la premi�re voiture �lectrique ?', null, '1', true) -- 10
('MCQ', 'Les f�lins', 'De quelle mani�re voient le chat ? Choisissez la bonne r�ponse.', null, '1', true) -- 11
('MCQ', 'Les f�lins', '� quelle distance un chat peut-il sentir un autre chat ?', null, '1', true) -- 12
('MCQ', 'Les f�lins', 'Quel f�lin est le seul � vivre en groupe ?', null, '1', true) -- 13
('MCQ', 'Les f�lins', 'Quel contient les f�lins n"'"ont-ils pas colonis� naturellement ?', null, '1', true) -- 14
('MCQ', 'Les �tats-Unis', 'Quel �tat eset le dernier � avoir joint les �tats-Unis ?', null, '1', true) -- 15
('MCQ', 'Les �tats-Unis', 'Combien de m�dailles d"'"or Jesse Owens a-t-il remport� devant Hitler ?', null, '1', true) -- 16
('MCQ', 'Les �tats-Unis', 'Au total, combien d"'"Am�ricains ont march� sur la Lune ?', null, '1', true) -- 17
('MCQ', 'Les �tats-Unis', 'Combien d"'"�tats comptent les �tats-Unis ?', null, '1', true) -- 18
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true) -- 19
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true) -- 20
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true) -- 21
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true) -- 22
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true) -- 23
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true) -- 24
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true) -- 25
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true) -- 26
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true) -- 27
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true) -- 28
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true) -- 29
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true) -- 30
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true) -- 31
('MCQ', 'Geographie', 'Paris est-elle la capitale de la France "?"', null, '1', true); -- 32

--
-- Data Test
--

SELECT * FROM questions WHERE typeQuest = 'MCQ'
ORDER BY RAND()
LIMIT 1;

-- --------------------------------------------------------

--
-- Table answers
--

CREATE TABLE answers (
	id_answer INTEGER NOT NULL AUTO_INCREMENT,
	id_quest INTEGER NOT NULL,
	typeAnswer VARCHAR(15) NOT NULL,
	answerContent VARCHAR(75) NOT NULL,
	id_submitter INTEGER NOT NULL,
	validation BOOLEAN DEFAULT NULL,
	isTrue BOOLEAN DEFAULT NULL,
	CONSTRAINT PK_ANSWERS PRIMARY KEY (id_answer),
	FOREIGN KEY (id_quest) REFERENCES questions (id_quest)
);

--
-- answers content
--

INSERT INTO answers (id_quest, typeAnswer, answerContent, id_submitter, validation, isTrue) VALUES
('1', 'MCQ', 'Fran�ais', '1', true, true),
('1', 'MCQ', 'Anglais', '1', true, false),
('1', 'MCQ', 'Chinois', '1', true, false),
('1', 'MCQ', 'Russe', '1', true, false),
('2', 'BlindTest', 'Vrai', '1', false, true),
('2', 'BlindTest', 'Faux', '1', false, false);

-- --------------------------------------------------------

--
-- TESTS
--

SELECT * FROM questions ORDER BY id;
SELECT * FROM answers ORDER BY id;


COMMIT;