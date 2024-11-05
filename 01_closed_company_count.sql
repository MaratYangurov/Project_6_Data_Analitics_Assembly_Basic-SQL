-- Запрос №1. Количество компаний, которые закрылись.
SELECT COUNT(*)
FROM company
WHERE status = 'closed';