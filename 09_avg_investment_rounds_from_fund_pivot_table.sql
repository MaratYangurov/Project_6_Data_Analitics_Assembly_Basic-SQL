/* Запрос №9. Среднее количество инвестиционных раундов, Для каждой из назначенных категорий фондов. Значение округлено до ближайшего целого числа. Результат отсортирован по возрастанию среднего. */

SELECT
	*,
	CASE 
		WHEN invested_companies > 100 THEN 'high_activity'
		WHEN invested_companies >= 20 AND invested_companies < 100 THEN 'middle_activity'
		WHEN invested_companies < 20 THEN 'low_activity'
	END AS activity_category,
	ROUND(AVG(investment_rounds)) AS avg_investment_rounds
FROM fund;
GROUP BY activity_category
ORDER BY avg_investment_rounds ASC;