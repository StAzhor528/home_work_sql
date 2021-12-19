USE vk;

SELECT gender, count(*) count_of_likes
FROM likes l JOIN profiles p ON l.user_id = p.user_id 
GROUP BY gender
ORDER BY count_of_likes DESC 
LIMIT 1;