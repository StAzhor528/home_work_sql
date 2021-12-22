START TRANSACTION;

DROP VIEW IF EXISTS shop.user_1;

CREATE VIEW shop.user_1 AS SELECT * FROM shop.users WHERE id = 1;
INSERT INTO sample.users (name, birthday_at, created_at, updated_at) 
	SELECT name, birthday_at, created_at, updated_at FROM shop.user_1;
DELETE FROM shop.users WHERE id = 1;

COMMIT;

