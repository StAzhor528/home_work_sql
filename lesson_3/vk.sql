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


	
	
	
	
