/* ������ �8. � ������� fund ��������� ���� � ����������� ������:

��� ������, ������� ����������� � 100 � ����� ��������, ��������� ��������� high_activity.
��� ������, ������� ����������� � 20 � ����� �������� �� 100, ��������� ��������� middle_activity.
���� ���������� ������������� �������� ����� �� ��������� 20, ��������� ��������� low_activity. */

SELECT
	*,
	CASE 
		WHEN invested_companies > 100 THEN 'high_activity'
		WHEN invested_companies >= 20 AND invested_companies < 100 THEN 'middle_activity'
		WHEN invested_companies < 20 THEN 'low_activity'
	END AS activity_category
FROM fund;