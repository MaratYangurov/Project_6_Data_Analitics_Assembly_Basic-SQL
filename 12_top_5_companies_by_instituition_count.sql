/* ������ �12. ���-5 �������� �� ���������� �������������, ������� �������� � ����������. */

SELECT
	c.name,
	COUNT(DISTINCT e.instituition) AS university_count
FROM company AS c
INNER JOIN people AS p ON c.id = p.company_id
INNER JOIN education AS e ON p.id = e.person_id
GROUP BY c.name
ORDER BY university_count DESC
LIMIT 5;
