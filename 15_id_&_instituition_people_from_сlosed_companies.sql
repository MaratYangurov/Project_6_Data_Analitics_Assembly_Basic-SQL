/* «апрос є15. —писок id-номеров и учебным заведением, которое окончил сотрудник, работавших в закрытых компани€х, дл€ которых первый раунд финансировани€ оказалс€ последним. */


SELECT
	DISTINCT p.id,
	ed.instituition
FROM company AS co
INNER JOIN funding_round AS fr ON fr.company_id = co.id
INNER JOIN people AS p ON p.company_id = co.id
INNER JOIN education AS ed ON ed.person_id = p.id
WHERE 
	fr.is_first_round = 1 
	AND fr.is_last_round = 1
	AND co.status = 'closed';