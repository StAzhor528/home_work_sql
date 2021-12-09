USE shop; 

SELECT * FROM users WHERE SUBSTRING(birthday_at, 7, 7) IN (5, 8);