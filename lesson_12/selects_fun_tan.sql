USE fun_tan;

/*Скрипты характерных выборок:
 *1. Средний возраст пользователей.*/
SELECT FLOOR(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25)) AS miidle_age 
FROM users; 

/*2. Колличество медиафайлов в каждом каталоге.*/
SELECT c.name, COUNT(*) AS media_files
FROM catalogs c JOIN products p JOIN media m 
ON c.id = p.catalog_id AND (c.media_id = m.id OR p.media_id = m.id)
GROUP BY c.name 
ORDER BY media_files DESC;

/*3. Список пользователей, которые совершили хотябы один заказ. В данном запросе можно 
 *посмотреть когда был сделан последний заказ и общее колличество заказов каждого пользователя.*/
SELECT u.id, u.name, off.updated_at, COUNT(*) AS orders 
FROM orders_for_filldb off JOIN users u 
ON off.user_id = u.id 
GROUP BY off.user_id 
ORDER BY orders;