USE vk;

/*Данный запрос выдаст таблицу в которой будет пол который поставил 
 * болшее количество лайков и колличество лайков.*/
SELECT gender, COUNT(gender) AS `max_likes` FROM profiles, likes 
WHERE profiles.user_id = likes.user_id 
GROUP BY gender ORDER BY `max_likes` DESC LIMIT 1;

