USE vk;

SELECT COUNT(*) FROM (
	SELECT l.media_id, m.user_id, p.birthday
	FROM likes l JOIN media m JOIN profiles p ON l.media_id = m.id AND m.user_id = p.user_id
	WHERE FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25) < 10) t;