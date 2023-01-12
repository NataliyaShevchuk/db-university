--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.`id` AS `studenti`,
        `degrees`.`name` As `nome_corso`
FROM `students`
INNER JOIN `degrees`
ON `students`.`id`=`degrees`.`id`
WHERE `degrees`.`name` LIKE "%Economia%";

--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT `degrees`.`name` AS `Corso_di_laurea`,
		`departments`.`name` AS `dipartimento`
FROM `degrees`
INNER JOIN `departments`
		ON `degrees`.`id` = `departments`.`id`
WHERE `departments`.`name` LIKE "%Neuroscienze%"
		AND `degrees`.`level` = "magistrale";

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `courses`.`name` AS `Name`,
		`teachers`.`name` AS `Teacher_Name`,
        `teachers`.`surname` AS `Teacher_Surname`
FROM `course_teacher`
INNER JOIN `courses`
		On `courses`. `id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
		On `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`id` = 44;

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students`.`surname` AS `Cognome`,
		`students`.`name` AS `Nome`,
        `degrees`.`name` AS `Corso`,
        `departments`.`name` AS `Dipartimento`,
        `students`.`enrolment_date` AS `data_iscrizione`
FROM `students`
INNER JOIN `degrees`
	ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN `departments`
		ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `surname`, `students`.`name` ASC

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees`.`name` AS `Degrees_name`,
		`courses`.`name` AS `Courses_name`,
        `teachers`.`name` AS `Teachers_Name`,
        `teachers`.`surname` AS `Teachers_Surname`
FROM `degrees`
LEFT JOIN `courses`
		ON `courses`.`id` = `degrees`.`id`
LEFT JOIN `teachers`
		ON `teachers`.`id` = `courses`.`id`;

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT 
		`teachers`.`id` AS `Teachers_id`,
		`teachers`.`name` AS `Teachers_Name`,
		`teachers`.`surname` AS `Teachers_Surname`,
        `departments`.`name` AS `Department`
FROM `course_teacher`
INNER JOIN `teachers`
		ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
		ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `degrees`
		ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `departments`
		ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` LIKE "%Matematica";

--7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

