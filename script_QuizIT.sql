--
-- QuizIT
-- Copyright © 2017 Victor CHEN, Andy HUANG, Kilian CHOLLET, Lucas MASSON
--

SET FEEDBACK OFF

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
	id_submitter VARCHAR(20) NOT NULL,
	validation BOOLEAN DEFAULT NULL,
	CONSTRAINT PK_QUESTIONS PRIMARY KEY (id_quest),
	CONSTRAINT FK_SUBMITTER FOREIGN KEY (id_submitter) REFERENCES users (id_user)
);

--
-- Content questions
--

INSERT INTO questions (typeQuest, topicQuest, questContent, mp3_link, login_submitter, validation) VALUES
('MCQ', 'Culture générale', 'Dans quelle langue est écrite cette question ?', null, '1',  true),
('BlindTest', 'Géographie', 'Paris est-elle la capitale de la France?', null, '1', false);

-- --------------------------------------------------------

--
-- Table answers
--

CREATE TABLE answers (
	id_answer INTEGER NOT NULL AUTO_INCREMENT,
	id_quest INTEGER NOT NULL,
	typeAnswer VARCHAR(15) NOT NULL,
	answerContent VARCHAR(75) NOT NULL,
	id_submitter VARCHAR(20) NOT NULL,
	validation BOOLEAN DEFAULT NULL,
	isTrue BOOLEAN DEFAULT NULL,
	CONSTRAINT PK_ANSWERS PRIMARY KEY (id_answer),
	CONSTRAINT FK_ANSWER FOREIGN KEY (id_quest) REFERENCES questions (id)
);

--
-- answers content
--

INSERT INTO answers (id_quest, typeAnswer, answerContent, idsubmitter, validation, isTrue) VALUES
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
SET FEEDBACK ON