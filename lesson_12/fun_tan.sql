DROP DATABASE IF EXISTS fun_tan;

CREATE DATABASE fun_tan;

USE fun_tan; 

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
	id SERIAL COMMENT 'Порядковый номер типа медии',
	name ENUM('Video', 'Photo', 'Audio', 'Text'),
	created_at DATETIME DEFAULT NOW() COMMENT 'Дата и время создания',
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время последнего обновления'
);

DROP TABLE IF EXISTS media;
CREATE TABLE media(
	id SERIAL COMMENT 'Порядковый номер медии',
	media_type_id BIGINT UNSIGNED NOT NULL COMMENT 'Порядковый номер типа медии',
	body TEXT COMMENT 'Текстовое описание',
	filename VARCHAR(255) COMMENT 'Имя файла',
	`size` BIGINT COMMENT 'Размер',
	metadata JSON COMMENT 'JSON данные',
	created_at DATETIME DEFAULT NOW() COMMENT 'Дата и время создания',
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время последнего обновления',
	FOREIGN KEY(media_type_id) REFERENCES media_types(id)
);

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Порядковый номер каталога',
  name VARCHAR(255) COMMENT 'Название раздела',
  media_id BIGINT UNSIGNED COMMENT 'Медиафайл привязаный к каталогу',
  FOREIGN KEY(media_id) REFERENCES media(id) ON DELETE CASCADE
) COMMENT = 'Разделы интернет-магазина';

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL COMMENT 'Порядковый номер покупателя',
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT NOW() COMMENT 'Дата и время создания',
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время последнего обновления',
  media_id BIGINT UNSIGNED COMMENT 'Медиафайл привязаный к пользователю',
  FOREIGN KEY(media_id) REFERENCES media(id) ON DELETE CASCADE
) COMMENT = 'Покупатели';

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL COMMENT 'Порядковый номер товарной позиции',
  name VARCHAR(255) COMMENT 'Название',
  description TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id BIGINT UNSIGNED COMMENT 'Порядковый номер каталога',
  created_at DATETIME DEFAULT NOW() COMMENT 'Дата и время создания',
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время последнего обновления',
  media_id BIGINT UNSIGNED COMMENT 'Медиафайл привязаный к продукту',
  FOREIGN KEY(media_id) REFERENCES media(id) ON DELETE CASCADE,
  FOREIGN KEY(catalog_id) REFERENCES catalogs(id) ON DELETE CASCADE
) COMMENT = 'Товарные позиции';

DROP TABLE IF EXISTS orders_for_filldb;
CREATE TABLE orders_for_filldb (
  id SERIAL COMMENT 'Порядковый номер заказа',
  user_id BIGINT UNSIGNED COMMENT 'Порядковый номер покупателя',
  created_at DATETIME DEFAULT NOW() COMMENT 'Дата и время создания',
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время последнего обновления',
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) COMMENT = 'Заказы';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id SERIAL COMMENT 'Порядковый номер состава заказа',
  order_id BIGINT UNSIGNED COMMENT 'Порядковый номер заказа',
  product_id BIGINT UNSIGNED COMMENT 'Порядковый номер товарной позиции',
  total BIGINT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  created_at DATETIME DEFAULT NOW() COMMENT 'Дата и время создания',
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время последнего обновления',
  FOREIGN KEY(order_id) REFERENCES orders_for_filldb(id) ON DELETE CASCADE,
  FOREIGN KEY(product_id) REFERENCES products(id) ON DELETE CASCADE
) COMMENT = 'Состав заказа';


DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id SERIAL COMMENT 'Порядковый номер скидки',
  user_id BIGINT UNSIGNED COMMENT 'Порядковый номер покупателя',
  product_id BIGINT UNSIGNED COMMENT 'Порядковый номер товарной позиции',
  discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0% до 10.0%',
  started_at DATETIME NULL COMMENT 'Дата и время начала действия скидки',
  finished_at DATETIME NULL COMMENT 'Дата и время окончания действия скидки',
  created_at DATETIME DEFAULT NOW() COMMENT 'Дата и время создания',
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время последнего обновления',
  FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE, 
  FOREIGN KEY(product_id) REFERENCES products(id) ON DELETE CASCADE
) COMMENT = 'Скидки';

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id SERIAL COMMENT 'Порядковый номер склада',
  name VARCHAR(255) COMMENT 'Название',
  created_at DATETIME DEFAULT NOW() COMMENT 'Дата и время создания',
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время последнего обновления',
  media_id BIGINT UNSIGNED COMMENT 'Медиафайл привязаный к пользователю',
  FOREIGN KEY(media_id) REFERENCES media(id) ON DELETE CASCADE
) COMMENT = 'Склады';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL COMMENT 'Порядковый номер запаса товарной позиции на складе',
  storehouses_id BIGINT UNSIGNED COMMENT 'Порядковый номер склада',
  product_id BIGINT UNSIGNED COMMENT 'Порядковый номер товарной позиции',
  value BIGINT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT NOW() COMMENT 'Дата и время создания',
  updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата и время последнего обновления',
  FOREIGN KEY(storehouses_id) REFERENCES storehouses(id) ON DELETE CASCADE,
  FOREIGN KEY(product_id) REFERENCES products(id) ON DELETE CASCADE
) COMMENT = 'Запасы на складе';

