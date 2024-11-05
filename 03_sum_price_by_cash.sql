/* Запрос №3. 
Общая сумму сделок по покупке одних компаний другими в долларах. 
Отобраны сделки за период с 2011 по 2013 год (включительно), 
а так же расчёт в которых осуществлялся только за наличные. */

SELECT SUM(price_amount)
FROM acquisition
WHERE term_code = 'cash' 
	AND EXTRACT('year' FROM acquired_at) BETWEEN 2011 AND 2013;