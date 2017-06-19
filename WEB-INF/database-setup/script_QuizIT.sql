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
-- users' table
--

CREATE TABLE `users` (
	`id` VARCHAR(20),	
	`login` VARCHAR(40) NOT NULL,
	`password` VARCHAR(40) NOT NULL,
	`email` VARCHAR(100),
	`score` INTEGER DEFAULT NULL,
	CONSTRAINT PK_PROPRIETAIRES PRIMARY KEY (`id`)
);

-- --------------------------------------------------------

--
-- questions' table
--

CREATE TABLE `questions` (
	`id` INTEGER NOT NULL AUTO_INCREMENT, 
	`typeQuest` VARCHAR(15) NOT NULL,
	`questName` VARCHAR(255) NOT NULL,
	`topicQuest` VARCHAR(50) NOT NULL,
	`q_submitter` VARCHAR(20) DEFAULT 'admin',
	`validation` NUMERIC(1,0) DEFAULT NULL,
	CONSTRAINT PK_QUESTIONS PRIMARY KEY (`id`),
	CONSTRAINT FK_SUBMITTER FOREIGN KEY (`q_submitter`) REFERENCES `users` (`login`)
);

--
-- `questions` content
--

INSERT INTO `questions` (`id`, `typeQuest`, `questName`, `topicQuest`, `validation`) VALUES
(NULL, 'MCQ', 'Dans quelle langue est écrite cette question ?', 'Culture générale', '1'),
(NULL, 'ToF', 'Paris est-elle la capitale de la France?', 'Géographie', '1');

-- --------------------------------------------------------

--
-- answers' table
--

CREATE TABLE `answers` (
	`id` INTEGER NOT NULL AUTO_INCREMENT,
	`typeAnswer` VARCHAR(15) NOT NULL,
	`answerName` VARCHAR(75) NOT NULL,
	`a_submitter` VARCHAR(255) DEFAULT 'admin',
	`validation` NUMERIC(1,0) DEFAULT NULL,
	`goodAnswer` NUMERIC(1,0) DEFAULT NULL,
	`idQuest` INTEGER NOT NULL,
	CONSTRAINT FK_QUESTION FOREIGN KEY (`idQuest`) REFERENCES `questions` (`id`)
);

--
-- `answers` content
--

INSERT INTO `answers` (`id`, `typeAnswer`, `answerName`, `validation`, `goodAnswer`, `idQuest`) VALUES
(NULL, 'MCQ', 'Français', '1', '1'),
(NULL, 'MCQ', 'Anglais', '0', '1'),
(NULL, 'MCQ', 'Chinois', '0', '1'),
(NULL, 'MCQ', 'Russe', '0', '1'),
(NULL, 'ToF', 'Vrai', '1', '2'),
(NULL, 'ToF', 'Faux', '0', '2');

-- --------------------------------------------------------

--
-- TESTS
--

SELECT * FROM `questions` ORDER BY `id`;
SELECT * FROM `answers` ORDER BY `id`;


COMMIT;
SET FEEDBACK ON