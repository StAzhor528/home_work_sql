DROP DATABASE IF EXISTS avio;

CREATE DATABASE avio;

USE avio;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(255),
	`to`VARCHAR(255)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	`label` VARCHAR(255),
	`name`VARCHAR(255)
);

INSERT INTO flights (`from`, `to`)
VALUES ('Moscow', 'Omsk'),
('Novgorod', 'Kazan'),
('Irkutsk', 'Moscow'),
('Omsk', 'Irkutsk'),
('Moscow', 'Kazan');

INSERT INTO cities (`label`, `name`)
VALUES ('Moscow', 'Москва'),
('Novgorod', 'Новгород'),
('Irkutsk', 'Иркутск'),
('Omsk', 'Омск'),
('Kazan', 'Казань');


SELECT id, (SELECT name FROM cities WHERE label = `from`), 
(SELECT name FROM cities WHERE label = `to`) FROM flights;
