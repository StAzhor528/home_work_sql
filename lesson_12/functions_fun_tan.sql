USE fun_tan;

/*Функции: 
 *1. Приветствие пользователя в зависимости от времени суток.*/
DELIMITER //
DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello()
RETURNS TEXT DETERMINISTIC
BEGIN 
	IF(TIME(NOW()) >= '06:00' AND TIME(NOW()) < '12:00') THEN 
		RETURN 'Доброе утро!';
	ELSEIF(TIME(NOW()) >= '12:00' AND TIME(NOW()) < '18:00') THEN 
		RETURN 'Добрый день!';
	ELSEIF(TIME(NOW()) >= '18:00' AND TIME(NOW()) < '23:59') THEN 
		RETURN 'Добрый вечер!';
	ELSEIF(TIME(NOW()) >= '00:00' AND TIME(NOW()) < '06:00') THEN 
		RETURN 'Доброй ночи!';
	END IF;
END//
DELIMITER ;

/*2. Ррасчет суммы одного заказа. Аргументом является номер заказа.*/
DELIMITER //
DROP FUNCTION IF EXISTS order_price//
CREATE FUNCTION order_price(num INT)
RETURNS INT DETERMINISTIC
BEGIN 
	DECLARE sum_order INT;
	SELECT sum(p.price* op.total) INTO sum_order
	FROM orders_products op 
	JOIN products p 
	ON op.product_id = p.id and op.order_id = num;
	RETURN sum_order;
END//
DELIMITER ;

/*3. Расчет суммы заказов за определенный месяц. Аргументом является номер месяца.*/
DELIMITER //
DROP FUNCTION IF EXISTS month_price_total//
CREATE FUNCTION month_price_total(num INT)
RETURNS BIGINT DETERMINISTIC
BEGIN 
	DECLARE sum_order BIGINT;
		SELECT SUM(p.price) INTO sum_order
		FROM orders_for_filldb off 
		JOIN orders_products op 
		JOIN products p 
		ON off.id = op.order_id AND op.product_id = p.id AND month(off.updated_at) = num
		GROUP BY month(off.updated_at);
	RETURN sum_order;
END//
DELIMITER ;