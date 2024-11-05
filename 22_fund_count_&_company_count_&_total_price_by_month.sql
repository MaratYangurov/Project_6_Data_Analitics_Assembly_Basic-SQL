/* 
������ �22. ������� �������, ��������� ��:

����� ������, � ������� ��������� ������;
���������� ���������� �������� ������ �� ���, ������� ������������� � ���� ������;
���������� ��������, ��������� �� ���� �����;
����� ����� ������ �� �������� � ���� ������.
������ �������� �� ������ � 2010 �� 2013 ���, ����� ��������� �������������� ������, � ������������� �� ������ ������.
*/

SELECT
    EXTRACT(MONTH FROM fr.funded_at) AS month_number,
    COUNT(DISTINCT f.name) AS unique_us_funds,
    COUNT(DISTINCT ac.acquired_company_id) AS companies_acquired,
    SUM(ac.price_amount) AS total_acquisition_amount
FROM funding_round AS fr
INNER JOIN investment AS i ON fr.id = i.funding_round_id
INNER JOIN fund AS f ON f.id = i.fund_id
LEFT JOIN acquisition AS ac ON EXTRACT(MONTH FROM ac.acquired_at) = EXTRACT(MONTH FROM fr.funded_at)
WHERE 
    EXTRACT(YEAR FROM fr.funded_at) BETWEEN 2010 AND 2013
    AND f.country_code = 'USA'
GROUP BY month_number
ORDER BY month_number;