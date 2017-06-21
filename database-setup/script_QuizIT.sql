--
-- QuizIT
-- Copyright © 2017 Victor CHEN, Andy HUANG, Kilian CHOLLET, Lucas MASSON
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
('MCQ', 'Culture generale', 'Dans quelle langue est écrite cette question ?', null, '1', true), -- 1
('BlindTest', 'Geographie', 'Paris est-elle la capitale de la France ?', null, '1', false) -- 2
('MCQ', 'Le débarquement de Normandie', 'Où étaient tournées les scènes de débarquement du film "Il faut sauver le soldat Ryan" ?', null, '1', true) -- 3
('MCQ', 'Le débarquement de Normandie', 'Où se trouvait le maréchal Rommel, responsable de la Normandie, le 6 juin 1944 ?', null, '1', true) -- 4
('MCQ', 'Le débarquement de Normandie', 'Sur combien de plages se concentrés les combats du 6 juin 1944 ?', null, '1', true) -- 5
('MCQ', 'Le débarquement de Normandie', 'Quel personnage était un ardent défenseur du projet de débarquement en Normandie ?', null, '1', true) -- 6
('MCQ', 'Les scientifiques', 'Quelle planète Urbain Le Verrier a-t-il découvert par des calculs mathématiques ?', null, '1', true) -- 7
('MCQ', 'Les scientifiques', 'Sur quelle(s) île(s) Darwin a-t-il développé sa théorie sur l’évolution des espèces ?', null, '1', true) -- 8
('MCQ', 'Les scientifiques', 'Quel scientifique a donné son nom à l’unité d’intensité du courant électrique ?', null, '1', true) -- 9
('MCQ', 'Les scientifiques', 'Par quel nom Nikola Tesla a-t-il baptisé l"'"invention de la première voiture électrique ?', null, '1', true) -- 10
('MCQ', 'Les félins', 'De quelle manière voient le chat ? Choisissez la bonne réponse.', null, '1', true) -- 11
('MCQ', 'Les félins', 'À quelle distance un chat peut-il sentir un autre chat ?', null, '1', true) -- 12
('MCQ', 'Les félins', 'Quel félin est le seul à vivre en groupe ?', null, '1', true) -- 13
('MCQ', 'Les félins', 'Quel contient les félins n"'"ont-ils pas colonisé naturellement ?', null, '1', true) -- 14
('MCQ', 'Les États-Unis', 'Quel État eset le dernier à avoir joint les États-Unis ?', null, '1', true) -- 15
('MCQ', 'Les États-Unis', 'Combien de médailles d"'"or Jesse Owens a-t-il remporté devant Hitler ?', null, '1', true) -- 16
('MCQ', 'Les États-Unis', 'Au total, combien d"'"Américains ont marché sur la Lune ?', null, '1', true) -- 17
('MCQ', 'Les États-Unis', 'Combien d"'"États comptent les États-Unis ?', null, '1', true) -- 18
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
('1', 'MCQ', 'Français', '1', true, true),
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
