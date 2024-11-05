/* Запрос №14. Список id-номеров сотрудников, которые работают в закрытых компаниях, для которых первый раунд финансирования оказался последним. */

SELECT
	DISTINCT p.id
FROM company AS co
INNER JOIN funding_round AS fr ON fr.company_id = co.id
INNER JOIN people AS p ON p.company_id = co.id
WHERE 
	fr.is_first_round = 1 
	AND fr.is_last_round = 1
	AND co.status = 'closed';