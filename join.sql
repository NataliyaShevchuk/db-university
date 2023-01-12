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

SELECT * 
FROM `course_teacher`
INNER JOIN `courses`
		On `courses`. `id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
		On `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`name` LIKE "Fulvio"
		AND `course_id` = `courses`.`name`

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome



--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti



--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)



--7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami