DELIMITER //
DROP PROCEDURE IF EXISTS hello//
CREATE PROCEDURE hello()
BEGIN 
	IF(TIME(NOW()) >= '06:00' AND TIME(NOW()) < '12:00') THEN 
		SELECT 'Доброе утро!';
	ELSEIF(TIME(NOW()) >= '12:00' AND TIME(NOW()) < '18:00') THEN 
		SELECT 'Добрый день!';
	ELSEIF(TIME(NOW()) >= '18:00' AND TIME(NOW()) < '23:59') THEN 
		SELECT 'Добрый вечер!';
	ELSEIF(TIME(NOW()) >= '00:00' AND TIME(NOW()) < '06:00') THEN 
		SELECT 'Доброй ночи!';
	END IF;
END//

CALL hello()//