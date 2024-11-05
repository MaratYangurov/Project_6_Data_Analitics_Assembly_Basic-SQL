/* Запрос №5. Вся информация о людях из БД people, у которых названия аккаунтов в твиттере содержат подстроку 'money', а фамилия начинается на 'K'. */

SELECT *
FROM people
WHERE network_username LIKE '%money%'
	AND last_name LIKE 'K%';