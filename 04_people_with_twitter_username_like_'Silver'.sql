/*Запрос №4. Имена, фамилии и названия аккаунтов людей в твиттере, у которых названия аккаунтов начинаются на 'Silver'.*/

SELECT	
	first_name,
	last_name,
	network_username 
FROM people
WHERE network_username LIKE 'Silver%';