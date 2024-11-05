/* Запрос №13. Список названий закрытых компаний, для которых первый раунд финансирования оказался последним. */

SELECT
	co.name
FROM company AS co
INNER JOIN funding_round AS fr ON fr.company_id = co.id
WHERE 
	fr.is_first_round = 1 
	AND fr.is_last_round = 1
	AND co.status = 'closed';