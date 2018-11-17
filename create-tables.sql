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
	updated_at datetime NOT NULL
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

CREATE TABLE measure (
	id integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
	usagePercentage double NOT NULL,
	upUsage double NOT NULL,
	downUsage double NOT NULL,
	upQuality double NOT NULL,
	downQuality double NOT NULL,
	timestamp datetime NOT NULL,
	location_id integer NOT NULL REFERENCES location(id),
	provider_id integer NOT NULL REFERENCES provider(id),
	user_id integer NOT NULL REFERENCES user(id),
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL
) DEFAULT CHARSET=utf8;

CREATE TABLE location_provider (
	id integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
	location_id integer NOT NULL REFERENCES location(id),
	provider_id integer NOT NULL REFERENCES provider(id)
) DEFAULT CHARSET=utf8;
