/* Запрос №7. Таблица, в которой содержится дата проведения раунда, а также min и max значения суммы инвестиций, привлечённых в эту дату. Исключены записи, в которых минимальное значение суммы инвестиций равно нулю или равно максимальному значению. */

SELECT 
	funded_at,
	MIN(raised_amount),
	MAX(raised_amount)
FROM funding_round
GROUP BY funded_at
HAVING MIN(raised_amount) != 0
	AND MIN(raised_amount) < MAX(raised_amount);