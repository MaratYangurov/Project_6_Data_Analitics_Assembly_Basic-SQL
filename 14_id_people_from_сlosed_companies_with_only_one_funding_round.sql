/* ������ �14. ������ id-������� �����������, ������� �������� � �������� ���������, ��� ������� ������ ����� �������������� �������� ���������. */

SELECT
	DISTINCT p.id
FROM company AS co
INNER JOIN funding_round AS fr ON fr.company_id = co.id
INNER JOIN people AS p ON p.company_id = co.id
WHERE 
	fr.is_first_round = 1 
	AND fr.is_last_round = 1
	AND co.status = 'closed';