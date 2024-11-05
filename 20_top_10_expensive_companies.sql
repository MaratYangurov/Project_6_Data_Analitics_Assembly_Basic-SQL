/* 
������ �20. �������, � ������� ������������ ��������� ����:

�������� ��������-����������;
����� ������;
�������� ��������, ������� ������;
����� ����������, ��������� � ��������� ��������;
����, ������� ����������, �� ������� ��� ����� ������� ��������� ����� ��������� � �������� ����������, ���������� �� ���������� ������ �����.
�� ����������� �� ������, � ������� ����� ������� ����� ����. �� ����������� �� ��������, ���� ��������������� � ��� ����� ����� ����,

��������� ������������ �� ����� ������ �� ������� ��������, � ����� �� �������� ��������� �������� � ������������������ �������. ��������� ��������� ������� ������� ��������.
*/

SELECT
    acquirer.name AS acquiring_company_name,
    ac.price_amount AS deal_amount,
    acquired.name AS acquired_company_name,
    acquired.funding_total AS invested_amount,
    ROUND(ac.price_amount / acquired.funding_total) AS multiple
FROM acquisition AS ac
INNER JOIN company AS acquirer ON ac.acquiring_company_id = acquirer.id
INNER JOIN company AS acquired ON ac.acquired_company_id = acquired.id
WHERE
    ac.price_amount > 0 
    AND acquired.funding_total > 0
ORDER BY ac.price_amount DESC, acquired.name ASC
LIMIT 10;