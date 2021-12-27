USE shop;

DELIMITER //
DROP PROCEDURE IF EXISTS million_insert//
CREATE PROCEDURE million_insert (IN num INT)
BEGIN
	DECLARE i INT DEFAULT 0;
	IF (num > 0) THEN
		WHILE i < num DO
		INSERT users (name) VALUES ('IVAN');
		SET i = i + 1;
		END WHILE;
	ELSE
		SELECT '«начение добовл€емых записей меньше нул€ или ноль!';
	END IF;
END//

SELECT * FROM users;

CALL million_insert(1000);