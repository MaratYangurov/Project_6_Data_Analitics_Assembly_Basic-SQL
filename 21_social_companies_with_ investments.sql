/* ������ �21. ������ �������� �������� �� ��������� 'social', ���������� �������������� � 2010 �� 2013 ��� (������������). � ��� �� ����� ������, � ������� �������� ����� ��������������. ��������� �������� ��� ��������������. */

SELECT
	c.name AS company_name,
	EXTRACT(MONTH FROM  fr.funded_at) AS month_nomber
FROM company AS c
INNER JOIN funding_round AS fr ON fr.company_id = c.id
WHERE
	c.category_code = 'social'
	AND EXTRACT(YEAR FROM fr.funded_at) BETWEEN 2010 AND 2013
	AND fr.raised_amount > 0;