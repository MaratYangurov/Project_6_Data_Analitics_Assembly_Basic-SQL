/*
Запрос №2. 
Количество привлечённых средств для новостных компаний США.
Данные из таблицы company. 
Результат отсортирован по убыванию значений в поле funding_total.
/*

SELECT funding_total
FROM company
WHERE country_code = 'USA' AND category_code = 'news'
ORDER BY funding_total DESC;