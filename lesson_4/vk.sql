DROP DATABASE IF EXISTS vk;

CREATE DATABASE vk;

USE vk;

DROP TABLE IF EXISTS users;

CREATE TABLE users(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(50),
	lastname VARCHAR(50) COMMENT 'Фамилия',
	email VARCHAR(120) UNIQUE,
	password_hash VARCHAR(100),
	phone BIGINT UNSIGNED UNIQUE,

	INDEX users_firstname_lastname_idx (firstname, lastname)

);

DROP TABLE IF EXISTS hometown;

CREATE TABLE hometown(
	id SERIAL,
	name VARCHAR(255)

);

DROP TABLE IF EXISTS media_types;

CREATE TABLE media_types(
	id SERIAL,
	name VARCHAR(255),
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);


DROP TABLE IF EXISTS media;

CREATE TABLE media(
	id SERIAL,
	media_type_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	filename VARCHAR(255),
	`size` INT,
	metadata JSON,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

	FOREIGN KEY(user_id) REFERENCES users(id),
	FOREIGN KEY(media_type_id) REFERENCES media_types(id)
);

DROP TABLE IF EXISTS profile_photo;

CREATE TABLE profile_photo(
	id SERIAL,
	media_id BIGINT UNSIGNED NOT NULL,

	FOREIGN KEY(media_id) REFERENCES media(id)

);

DROP TABLE IF EXISTS profiles;

CREATE TABLE profiles(
	user_id BIGINT UNSIGNED NOT NULL,
	gender CHAR(1),
	birthday DATE,
	photo_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	hometown_id BIGINT UNSIGNED NOT NULL,
	is_active TINYINT(1) NOT NULL DEFAULT '1',
	FOREIGN KEY (photo_id) REFERENCES profile_photo(id),
	FOREIGN KEY (hometown_id) REFERENCES hometown(id)
);

ALTER TABLE profiles ADD CONSTRAINT fk_user_id
FOREIGN KEY (user_id) REFERENCES users(id)
ON UPDATE CASCADE
ON DELETE RESTRICT;


DROP TABLE IF EXISTS messages;

CREATE TABLE messages(
	id SERIAL, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),

	FOREIGN KEY (from_user_id) REFERENCES users(id),
	FOREIGN KEY (to_user_id) REFERENCES users(id)

);


DROP TABLE IF EXISTS friends_requests;

CREATE TABLE friends_requests(
	initiator_user_id BIGINT UNSIGNED NOT NULL,
	target_user_id BIGINT UNSIGNED NOT NULL,
	`status` ENUM('requested', 'approved', 'declined', 'unfriended'),
	requested_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

	PRIMARY KEY (initiator_user_id, target_user_id),
	FOREIGN KEY (initiator_user_id) REFERENCES users(id),
	FOREIGN KEY (target_user_id) REFERENCES users(id)
);

ALTER TABLE friends_requests
ADD CHECK (initiator_user_id <> target_user_id);


DROP TABLE IF EXISTS communities;

CREATE TABLE communities(
	id SERIAL,
	name VARCHAR(150),
	admin_user_id BIGINT UNSIGNED NOT NULL,

	INDEX communities_name_idx(name),
	FOREIGN KEY(admin_user_id) REFERENCES users(id)
);


DROP TABLE IF EXISTS user_communities;

CREATE TABLE user_communities(
	user_id BIGINT UNSIGNED NOT NULL,
	community_id BIGINT UNSIGNED NOT NULL,

	PRIMARY KEY (user_id, community_id),
	FOREIGN KEY(user_id) REFERENCES users(id),
	FOREIGN KEY(community_id) REFERENCES communities(id)
);


DROP TABLE IF EXISTS likes;

CREATE TABLE likes(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),

	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_id) REFERENCES media(id)
);


DROP TABLE IF EXISTS photo_albums;

CREATE TABLE photo_albums(
	id SERIAL,
	name VARCHAR(100),
	user_id BIGINT UNSIGNED NOT NULL,

	FOREIGN KEY (user_id) REFERENCES users(id),
	PRIMARY KEY (id)
);


DROP TABLE IF EXISTS photos;

CREATE TABLE photos(
	id SERIAL,
	album_id BIGINT UNSIGNED NOT NULL,
	media_id BIGINT UNSIGNED NOT NULL,

	FOREIGN KEY (album_id) REFERENCES photo_albums(id),
	FOREIGN KEY (media_id) REFERENCES media(id)
);

DROP TABLE IF EXISTS news;

CREATE TABLE news(
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	body TEXT,
	media_id BIGINT UNSIGNED NOT NULL,
	`comment` TEXT,

	FOREIGN KEY (media_id) REFERENCES media(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);



INSERT INTO users (firstname, lastname, email, phone)
VALUES ('Тимофей', 'Укропов', 'ukrop@bk.ru', '90000000001'),
('Абдул', 'Бухаревич', 'abdurevich@googl.com', '90000000002'),
('Виталий', 'Молочнобегеров', 'molochnik@mail.ru', '90000000003'),
('Валерия', 'Комсосольская', 'komsomolija@bk.ru', '90000000004'),
('Алибаба', 'Русов', '40theef@yandex.ru', '90000000005'),
('Дарья', 'Укулелева', 'dukularja@mail.ru', '90000000006'),
('Залимхан', 'Бурданаглызелимханов', 'slozhnajafamilja@list.ru', '90000000007'),
('Джон', 'Снегов', 'snegovik@yandex.ru', '90000000008'),
('Митрофан', 'Нецензурный', 'matershina@mail.ru', '90000000009'),
('Павел', 'Отморозов', 'batyaloh@mail.ru', '90000000010'),
('Алексей', 'Перенатальный', 'pofene@googl.com', '90000000011'),
('Кандрат', 'Булыжников', 'kruginavode@mail.ru', '90000000012'),
('Карман', 'Угов', 'tupajaobuvj@mail.ru', '90000000013'),
('Иван', 'Кринжа', 'uaaaaaaaaaa@mail.ru', '90000000014'),
('Виталий', 'Сигаретов', 'klinac@googl.com', '90000000015');

INSERT INTO hometown (name)
VALUES ('Москва'), ('Белград'), ('Берлин'), ('Минск'), ('Ереван'),
('Рим'), ('Париж'), ('Мадрид'), ('Лиссабон'), ('Любляна'),
('Подгорица'), ('Донецк'), ('Луганск'), ('Тирасполь'), ('Пекин');

INSERT INTO media_types (name)
VALUES ('AIFF'), ('WAV'), ('XMF'), ('FITS'), ('TIFF'),
('3gp'), ('ANIM'), ('ASF'), ('AVI'), ('CDXL'),
('DVR-MS'), ('IFF'), ('MP4'), ('Matroska'), ('RealMedia');

INSERT INTO media (media_type_id, user_id, body, filename, `size`, metadata)
VALUES ('1', '1', 'Фото1', 'foto1', '1', '{"x": "1", "y": "1"}'),
('2', '2', 'Фото2', 'foto2', '2', '{"x": "2", "y": "2"}'),
('3', '3', 'Фото3', 'foto3', '3', '{"x": "3", "y": "3"}'),
('4', '4', 'Фото4', 'foto4', '4', '{"x": "4", "y": "4"}'),
('5', '5', 'Фото5', 'foto5', '5', '{"x": "5", "y": "5"}'),
('6', '6', 'Фото6', 'foto6', '6', '{"x": "6", "y": "6"}'),
('7', '7', 'Фото7', 'foto7', '7', '{"x": "7", "y": "7"}'),
('8', '8', 'Фото8', 'foto8', '8', '{"x": "8", "y": "8"}'),
('9', '9', 'Фото9', 'foto9', '9', '{"x": "9", "y": "9"}'),
('10', '10', 'Фото10', 'foto10', '10', '{"x": "10", "y": "10"}'),
('11', '11', 'Фото11', 'foto11', '11', '{"x": "11", "y": "11"}'),
('12', '12', 'Фото12', 'foto12', '12', '{"x": "12", "y": "12"}'),
('13', '13', 'Фото13', 'foto13', '13', '{"x": "13", "y": "13"}'),
('14', '14', 'Фото14', 'foto14', '14', '{"x": "14", "y": "14"}'),
('15', '15', 'Фото15', 'foto15', '15', '{"x": "15", "y": "15"}');

INSERT INTO profile_photo (media_id)
VALUES ('1'), ('2'), ('3'), ('4'), ('5'),
('6'), ('7'), ('8'), ('9'), ('10'),
('11'), ('12'), ('13'), ('14'), ('15');

INSERT INTO profiles (user_id, gender, birthday, photo_id, hometown_id)
VALUES ('1', 'm', '1987-01-12', '1', '1'),
('2', 'm', '1995-10-05', '2', '2'),
('3', 'm', '1988-06-19', '3', '3'),
('4', 'f', '2004-06-05', '4', '4'),
('5', 'm', '1999-12-02', '5', '5'),
('6', 'f', '2001-04-25', '6', '6'),
('7', 'm', '1991-09-30', '7', '7'),
('8', 'm', '1992-07-09', '8', '8'),
('9', 'm', '2010-08-14', '9', '9'),
('10', 'm', '1978-11-27', '10', '10'),
('11', 'm', '1985-02-16', '11', '11'),
('12', 'm', '1998-06-23', '12', '12'),
('13', 'm', '1999-01-07', '13', '13'),
('14', 'm', '2002-07-19', '14', '14'),
('15', 'm', '2000-11-05', '15', '15');

INSERT INTO messages (from_user_id, to_user_id, body, created_at)
VALUES ('1', '2', 'Hello world!', NOW()),
('2', '3', 'Hello world!', NOW()),
('3', '4', 'Hello world!', NOW()),
('4', '5', 'Hello world!', NOW()),
('5', '6', 'Hello world!', '2022-01-01 00:00:00'),
('6', '7', 'Hello world!', NOW()),
('7', '8', 'Hello world!', NOW()),
('8', '9', 'Hello world!', NOW()),
('9', '10', 'Hello world!', NOW()),
('10', '11', 'Hello world!', NOW()),
('11', '12', 'Hello world!', '2022-01-01 00:00:00'),
('12', '13', 'Hello world!', NOW()),
('13', '14', 'Hello world!', NOW()),
('14', '15', 'Hello world!', NOW()),
('15', '1', 'Hello world!', NOW());

INSERT INTO friends_requests (initiator_user_id, target_user_id, `status`)
VALUES ('1', '2', 'requested'),
('2', '3', 'declined'),
('3', '4', 'unfriended'),
('4', '5', 'unfriended'),
('5', '6', 'approved'),
('6', '7', 'approved'),
('7', '8', 'declined'),
('8', '9', 'requested'),
('9', '10', 'unfriended'),
('10', '11', 'approved'),
('11', '12', 'declined'),
('12', '13', 'requested'),
('13', '14', 'declined'),
('14', '15', 'approved'),
('15', '1', 'requested');

INSERT INTO communities (name, admin_user_id)
VALUES ('Community1', '1'),
('Community2', '2'),
('Community3', '3'),
('Community4', '4'),
('Community5', '5'),
('Community6', '6'),
('Community7', '7'),
('Community8', '8'),
('Community9', '9'),
('Community10', '10'),
('Community11', '11'),
('Community12', '12'),
('Community13', '13'),
('Community14', '14'),
('Community15', '15');

INSERT INTO user_communities (user_id, community_id)
VALUES ('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('6', '6'),
('7', '7'),
('8', '8'),
('9', '9'),
('10', '10'),
('11', '11'),
('12', '12'),
('13', '13'),
('14', '14'),
('15', '15');

INSERT INTO likes (user_id, media_id)
VALUES ('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('6', '6'),
('7', '7'),
('8', '8'),
('9', '9'),
('10', '10'),
('11', '11'),
('12', '12'),
('13', '13'),
('14', '14'),
('15', '15');

INSERT INTO photo_albums (name, user_id)
VALUES ('Album1', '1'),
('Album2', '2'),
('Album3', '3'),
('Album4', '4'),
('Album5', '5'),
('Album6', '6'),
('Album7', '7'),
('Album8', '8'),
('Album9', '9'),
('Album10', '10'),
('Album11', '11'),
('Album12', '12'),
('Album13', '13'),
('Album14', '14'),
('Album15', '15');

INSERT INTO photos (album_id, media_id)
VALUES ('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('6', '6'),
('7', '7'),
('8', '8'),
('9', '9'),
('10', '10'),
('11', '11'),
('12', '12'),
('13', '13'),
('14', '14'),
('15', '15');

INSERT INTO news (user_id, body, media_id, `comment`)
VALUES ('1', 'Hello world!', '1', 'Super!'),
('2', 'Hello world!', '2', 'Super!'),
('3', 'Hello world!', '3', 'Super!'),
('4', 'Hello world!', '4', 'Super!'),
('5', 'Hello world!', '5', 'Super!'),
('6', 'Hello world!', '6', 'Super!'),
('7', 'Hello world!', '7', 'Super!'),
('8', 'Hello world!', '8', 'Super!'),
('9', 'Hello world!', '9', 'Super!'),
('10', 'Hello world!', '10', 'Super!'),
('11', 'Hello world!', '11', 'Super!'),
('12', 'Hello world!', '12', 'Super!'),
('13', 'Hello world!', '13', 'Super!'),
('14', 'Hello world!', '14', 'Super!'),
('15', 'Hello world!', '15', 'Super!');

	
SELECT * FROM users;
SELECT * FROM hometown;
SELECT * FROM media;
SELECT * FROM media_types;
SELECT * FROM profile_photo;
SELECT * FROM profiles;
SELECT * FROM messages;
SELECT * FROM friends_requests;
SELECT * FROM communities;
SELECT * FROM user_communities;
SELECT * FROM likes;
SELECT * FROM photo_albums;
SELECT * FROM photos;
SELECT * FROM news;


