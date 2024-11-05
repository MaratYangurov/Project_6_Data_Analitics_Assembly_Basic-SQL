/* Запрос №10. Топ-10 самых активных стран-инвесторов. Для каждой страны считается минимальное, максимальное и среднее число компаний, в которые инвестировали фонды этой страны, основанные с 2010 по 2012 год включительно. Исключены страны с фондами, у которых отсутствуют компании, получившие инвестиции. Результат отсортирован по среднему количеству компаний в порядке убывания. Затем сортировка по коду страны в лексикографическом порядке. */

SELECT 
	country_code,
	MIN(invested_companies) AS min_invested_companies,
	MAX(invested_companies) AS max_invested_companies,
	AVG(invested_companies) AS avg_invested_companies
FROM fund
WHERE EXTRACT('year' FROM created_at) BETWEEN 2010 AND 2012
	AND invested_companies != 0
ORDER BY avg_invested_companies DESC, country_code ASC
LIMIT 10;


/*
SELECT 
    f.country_code,
    MIN(f.invested_companies) AS min_invested_companies,
    MAX(f.invested_companies) AS max_invested_companies,
    ROUND(AVG(f.invested_companies), 2) AS avg_invested_companies
FROM fund f
INNER JOIN investment i ON f.id = i.fund_id
INNER JOIN company c ON i.company_id = c.id
WHERE EXTRACT(YEAR FROM f.founded_at) BETWEEN 2010 AND 2012
GROUP BY f.country_code
HAVING MIN(f.invested_companies) > 0
ORDER BY avg_invested_companies DESC, f.country_code ASC
LIMIT 10;
*/