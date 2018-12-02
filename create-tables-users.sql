-- TiX tables

ALTER DATABASE CHARACTER SET utf8;

CREATE TABLE user (
	id integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
	username varchar(255) NOT NULL UNIQUE,
	salt varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	enabled boolean NOT NULL,
	role varchar(255) NOT NULL,
	recoveryToken varchar(255),
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL,
	measures_count int NOT NULL DEFAULT 0
) DEFAULT CHARSET=utf8;

CREATE TABLE provider (
	id integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE location (
	id integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name varchar(255) NOT NULL,
	publickey text NOT NULL,
	enabled boolean NOT NULL,
	user_id integer NOT NULL REFERENCES user(id),
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE location_provider (
	id integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
	location_id integer NOT NULL REFERENCES location(id),
	provider_id integer NOT NULL REFERENCES provider(id)
) DEFAULT CHARSET=utf8;

CREATE TABLE masks (
	prefix integer NOT NULL,
	bits bigint
);

INSERT INTO masks (prefix) VALUES ( 0), ( 1), ( 2), ( 3), ( 4), ( 5), ( 6), ( 7), ( 8), ( 9),
                                  (10), (11), (12), (13), (14), (15), (16), (17), (18), (19),
                                  (20), (21), (22), (23), (24), (25), (26), (27), (28), (29),
                                  (30), (31), (32);

UPDATE masks SET bits = pow(2, 32) - pow(2, 32 - prefix);
