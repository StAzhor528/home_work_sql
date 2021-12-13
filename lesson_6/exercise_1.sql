USE vk;

/* ��� ������� ���� ������������ 1.
 * ����������� ������� ������� ����� id ������������ � ����������� ��� ��������� ������������ 1.*/
SELECT SUM(`count`) AS sum_messages, friend FROM (
	SELECT COUNT(to_user_id) AS `count`, to_user_id AS friend 
	FROM messages WHERE from_user_id = 1 GROUP BY to_user_id
	UNION ALL
	SELECT COUNT(from_user_id), from_user_id 
	FROM messages WHERE to_user_id = 1 GROUP BY from_user_id 
	) t
GROUP BY friend
ORDER BY sum_messages DESC
LIMIT 1;