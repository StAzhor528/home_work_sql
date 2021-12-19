USE vk;


SELECT name, friend, SUM(`count`) AS count_of_messages
FROM (
	SELECT u.id, concat(firstname, ' ', lastname) AS name, m.to_user_id friend, count(*) AS `count`
	FROM users u 
	JOIN messages m ON u.id = m.from_user_id
	WHERE u.id = 1
	GROUP BY friend
	UNION
	SELECT u.id, concat(firstname, ' ', lastname), m.from_user_id friend, count(*) AS `count`
	FROM users u 
	JOIN messages m ON u.id = m.to_user_id
	WHERE u.id = 1
	GROUP BY friend ) t
GROUP BY friend
ORDER BY count_of_messages DESC
LIMIT 1;

