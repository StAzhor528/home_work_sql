USE shop;

DELIMITER //
DROP TRIGGER IF EXISTS products_name_discription//
CREATE TRIGGER products_name_discription BEFORE INSERT ON products
FOR EACH ROW 
BEGIN 
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ошибка! Отсутствует наименование и описание!';
	END IF;
END//

