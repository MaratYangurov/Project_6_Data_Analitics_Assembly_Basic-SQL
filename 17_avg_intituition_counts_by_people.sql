/* Запрос №17. Среднее число учебных заведений (всех, не только уникальных), которые окончили сотрудники разных компаний. */


SELECT 
    co.id AS company_id,
    AVG(institution_count) AS avg_institutions_per_employee
FROM (
    SELECT 
        p.company_id,
        COUNT(ed.instituition) AS institution_count
    FROM people AS p
    INNER JOIN education AS ed ON ed.person_id = p.id
    GROUP BY p.id, p.company_id
) AS employee_education_counts
INNER JOIN company AS co ON co.id = employee_education_counts.company_id
GROUP BY co.id;