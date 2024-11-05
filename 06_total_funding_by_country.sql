/* Запрос №6. Отобразить для каждой страны общую сумму привлечённых инвестиций, которые получили компании, зарегистрированные в этой стране. Результат отсортирован по убыванию суммы. */

SELECT
	country_code,
	SUM(funding_total) 
FROM company
GROUP BY country_code
ORDER BY SUM(funding_total) DESC;