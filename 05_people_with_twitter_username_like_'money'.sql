/* ������ �5. ��� ���������� � ����� �� �� people, � ������� �������� ��������� � �������� �������� ��������� 'money', � ������� ���������� �� 'K'. */

SELECT *
FROM people
WHERE network_username LIKE '%money%'
	AND last_name LIKE 'K%';