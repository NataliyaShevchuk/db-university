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



--4. Contare quanti corsi di laurea ci sono per ogni dipartimento