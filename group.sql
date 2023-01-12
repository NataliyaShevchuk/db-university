--1. Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(`enrolment_date`) AS `Anno_d_iscrizione`,
		COUNT(`id`) AS `iscritti`
FROM `students`
GROUP BY `Anno_d_iscrizione`;


--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(`id`) AS `insegnanti`,
		`office_address` AS `edificio`
FROM `teachers`
GROUP BY `edificio`


--3. Calcolare la media dei voti di ogni appello d'esame

SELECT AVG(`vote`) AS `voto_medio`,
	`exam_id` AS `appello`
FROM `exam_student`
GROUP BY `appello`;

--4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(`id`) AS `Corsi_di_laurea`,
	`department_id` AS `Dipartimento`
FROM `degrees`
GROUP BY `department_id`;