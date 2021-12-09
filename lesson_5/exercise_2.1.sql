USE shop;

SELECT FLOOR(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25)) AS miidle_age FROM users;