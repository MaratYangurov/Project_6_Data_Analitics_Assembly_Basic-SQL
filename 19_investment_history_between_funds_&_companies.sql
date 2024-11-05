/* 
«апрос є19. —водна€ таблица из полей:
name_of_fund Ч название фонда;
name_of_company Ч название компании;
amount Ч сумма инвестиций, которую привлекла компани€ в раунде. ¬ таблицу войдут данные о компани€х, в истории которых было больше шести важных этапов, а раунды финансировани€ проходили с 2012 по 2013 год включительно. 
*/

SELECT
	f.name AS name_of_fund,
	c.name AS name_of_company,
	fr.raised_amount AS amount
FROM funding_round AS fr
INNER JOIN company AS c ON c.id = fr.company_id
INNER JOIN investment AS i ON i.funding_round_id = fr.id
INNER JOIN fund AS f ON f.id = i.fund_id
WHERE 
	c.milestones > 6
	AND EXTRACT(YEAR FROM fr.funded_at) BETWEEN 2012 AND 2013;
