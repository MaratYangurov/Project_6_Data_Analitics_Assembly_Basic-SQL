/* 
Запрос №23. Сводная таблица по странам со средней суммой инвестиций в стартапы, отдельно для каждого года: 2011, 2012 и 2013. Результат отсортирован по среднему значению инвестиций за 2011 год в порядке убывания.
*/

WITH
t_1 AS (
	SELECT 
		c.country_code AS country,
		AVG(fr.raised_amount) AS avg_investment_2011
	FROM company AS c
	INNER JOIN funding_round AS fr ON c.id = fr.company_id
	WHERE 
		EXTRACT(YEAR FROM fr.funded_at) = 2011
		AND fr.raised_amount IS NOT NULL
	GROUP BY c.country_code
),

t_2 AS (
	SELECT 
		c.country_code AS country,
		AVG(fr.raised_amount) AS avg_investment_2012
	FROM company AS c
	INNER JOIN funding_round AS fr ON c.id = fr.company_id
	WHERE 
		EXTRACT(YEAR FROM fr.funded_at) = 2012
		AND fr.raised_amount IS NOT NULL
	GROUP BY c.country_code
),

t_3 AS (
	SELECT 
		c.country_code AS country,
		AVG(fr.raised_amount) AS avg_investment_2013
	FROM company AS c
	INNER JOIN funding_round AS fr ON c.id = fr.company_id
	WHERE 
		EXTRACT(YEAR FROM fr.funded_at) = 2013
		AND fr.raised_amount IS NOT NULL
	GROUP BY c.country_code
)

SELECT 
    t_1.country AS country,
    t_1.avg_investment_2011,
    t_2.avg_investment_2012,
	t_3.avg_investment_2013
FROM t_1
INNER JOIN t_2 ON t_1.country = t_2.country
INNER JOIN t_3 ON t_1.country = t_3.country
ORDER BY t_1.avg_investment_2011 DESC;
