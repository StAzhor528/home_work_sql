USE shop;

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	id SERIAL,
	created_at DATETIME DEFAULT NOW(),
	name_tbl VARCHAR(255) NOT NULL,
	id_primary_key BIGINT NOT NULL,
	name VARCHAR(255)
) ENGINE=Archive;

DELIMITER //
DROP TRIGGER IF EXISTS add_logs_users//
CREATE TRIGGER add_logs_users AFTER INSERT ON users
FOR EACH ROW
BEGIN 
	INSERT logs(name_tbl, id_primary_key, name)
	VALUES ('users', NEW.id, NEW.name);
END //

DROP TRIGGER IF EXISTS add_logs_catalogs//
CREATE TRIGGER add_logs_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN 
	INSERT logs(name_tbl, id_primary_key, name)
	VALUES ('catalogs', NEW.id, NEW.name);
END //

DROP TRIGGER IF EXISTS add_logs_products//
CREATE TRIGGER add_logs_products AFTER INSERT ON products
FOR EACH ROW
BEGIN 
	INSERT logs(name_tbl, id_primary_key, name)
	VALUES ('products', NEW.id, NEW.name);
END //

INSERT users (name)
VALUES ('Ivan');
INSERT catalogs (name)
VALUES ('!!!');
INSERT products (name)
VALUES ('1234');

SELECT * FROM logs;
SELECT * FROM users;
SELECT * FROM catalogs;
SELECT * FROM products;