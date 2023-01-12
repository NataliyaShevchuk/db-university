-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT *
FROM `students` 
WHERE YEAR(`date_of_birth`)="1990";


-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT * 
FROM `courses`
WHERE `cfu` > 10;


-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT * 
FROM `students`
WHERE YEAR(`date_of_birth`)<="1993";

-- oppure
    SELECT * 
    FROM `students`
    WHERE (YEAR(CURRENT_DATE)) - (YEAR(`date_of_birth`)) > 30;

    --oppure con Timestampdiff
    SELECT *, TIMESTAMPDIFF(YEAR, `date_of_birth`, NOW())
    FROM `students`
    WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, NOW()) > 30;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT * 
FROM `courses`
WHERE (`period`="I semestre") AND (`year`=1);

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

SELECT * 
FROM `exams`
WHERE `hour`>="14:00:00" AND DATE(`date`)="2020-06-20";


-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT * 
FROM `degrees`
WHERE `name` LIKE "Corso di Laurea Magistrale%";

-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT(`id`) 
FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT COUNT(*) 
FROM `teachers`
WHERE `phone` IS NULL;


--oppure
    SELECT * 
    FROM `teachers`
    WHERE `phone` IS NULL;


--GROUP BY: ESEMPIO

SELECT YEAR(`date_of_birth`), COUNT(`date_of_birth`) 
FROM `students`
GROUP BY YEAR(`date_of_birth`);

--esempio con voto:

SELECT `exam_id`, AVG(`vote`) as `voto`
FROM `exam_student`
GROUP BY `exam_id`;

-- INNER JOIN:

SELECT `students`.`name` as `first_name`,
	    `students`.`surname` as `last_name`,
        `degrees`.`name` as `degree_name`
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`;
---

SELECT * 
FROM `degrees`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
WHERE `degrees`.`name` = "Corso di Laurea in Informatica";

--RIGHT JOIN: 

SELECT * 
FROM `social_links`
RIGHT JOIN `movies`
ON `social_links`.`movie_id` = `movies`.`id`;

-- Selezionare le informazioni sul corso con id = 144, con tutti i relativi appelli d’esame
SELECT * 
FROM `courses`
INNER JOIN `exams`
ON `courses`.`id` = `exams`.`course_id`
WHERE `courses`.`id` = 144;


--Selezionare a quale dipartimento appartiene il Corso di Laurea in Diritto
-- dell'Economia (Dipartimento di Scienze politiche, giuridiche e studi internazionali)
SELECT `degrees`.*, `departments`.`name` AS `Dipartimento`
FROM `degrees`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees`.`name` = "Corso di Laurea in Diritto dell'Economia";



--# Selezionare tutti gli appelli d'esame del Corso di Laurea Magistrale in Fisica del primo anno

SELECT `degrees`.`name` as `Corso di laurea`,
		`courses`.`name` as `Corso`,
        `courses`.`year` as `Anno`,
        `exams`.*
FROM `degrees`  --scegliamo le colonne della tabella degrees
INNER JOIN `courses`--mi unisci tutti i dati di quella tabella 
    ON `courses`.`degree_id` = `degrees`.`id` --risultato: ottengo la colonna degree_id della colonna courses e  colonna id della tab degrees
INNER JOIN `exams` --ora che abbiamo preso quei dati, recuperiamo l'id della tab esami e corsi 
    ON `exams`.`course_id` = `courses`.`id`
WHERE `degrees`.`name` = "Corso di Laurea Magistrale in Fisica" --ed ora filtriamo i dati per nome laurea e anno di frequentazione 
    AND `courses`.`year` = 1;
--#AND `courses`.`period` = "I semestre";





--# Selezionare tutti i docenti che insegnano nel Corso di Laurea in Lettere

SELECT `degrees`.`name` AS `corso_laurea`,
		`courses`.`name` AS `insegnamento`,
        `teachers`.`name` AS `nome_insegnante`,
        `teachers`.`surname` AS `cognome_insegnante`
FROM `degrees`
INNER JOIN `courses`
	ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `course_teacher`
	ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers`
	ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Lettere"
ORDER BY `cognome_insegnante`;


--# Selezionare il voto medio di superamento d'esame per ogni corso, con anche i dati
--# del corso di laurea associato, ordinati per media voto decrescente
SELECT `courses`.`id`, `courses`.`name`,
		AVG(`exam_student`.`vote`) as `avg_vote`
FROM `exam_student`
INNER JOIN `exams`
	ON `exam_student`.`exam_id` = `exams`.`id`
INNER JOIN `courses`
	ON `exams`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
	ON `courses`.`degree_id` = `degrees`.`id`
WHERE `exam_student`.`vote` >= 18
GROUP BY `courses`.`id`
ORDER BY `avg_vote` DESC;