/* Запрос №11. Имена, фамилии и всех сотрудников стартапов, а так же название учебного заведения, которое окончил сотрудник (если эта информация известна). */

﻿SELECT p.first_name,
       p.last_name,
       ed.instituition
FROM people AS p
LEFT JOIN education AS ed ON p.id = ed.person_id;