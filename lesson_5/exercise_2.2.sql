USE shop;

SELECT COUNT(*),
DAYOFWEEK(DATE_ADD(birthday_at, INTERVAL (YEAR(NOW()) - YEAR(birthday_at)) YEAR)) AS dow
FROM users GROUP BY dow;



