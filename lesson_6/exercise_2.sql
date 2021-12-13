USE vk;

SELECT COUNT(*) FROM likes WHERE media_id IN (
	SELECT id FROM media WHERE user_id IN (
		SELECT user_id FROM profiles 
		WHERE FLOOR((TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25) < 10));

