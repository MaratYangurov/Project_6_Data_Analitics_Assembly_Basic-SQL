/* Запрос №8. В таблицу fund добавляет поле с категориями фондов:

Для фондов, которые инвестируют в 100 и более компаний, назначить категорию high_activity.
Для фондов, которые инвестируют в 20 и более компаний до 100, назначить категорию middle_activity.
Если количество инвестируемых компаний фонда не достигает 20, назначить категорию low_activity. */

SELECT
	*,
	CASE 
		WHEN invested_companies > 100 THEN 'high_activity'
		WHEN invested_companies >= 20 AND invested_companies < 100 THEN 'middle_activity'
		WHEN invested_companies < 20 THEN 'low_activity'
	END AS activity_category
FROM fund;