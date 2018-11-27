-- TiX tables

ALTER DATABASE CHARACTER SET utf8;

CREATE TABLE measure (
	id integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
	usagePercentage double NOT NULL,
	upUsage double NOT NULL,
	downUsage double NOT NULL,
	upQuality double NOT NULL,
	downQuality double NOT NULL,
	timestamp datetime NOT NULL,
	location_id integer NOT NULL,
	provider_id integer NOT NULL,
	user_id integer NOT NULL,
	created_at datetime NOT NULL,
	updated_at datetime NOT NULL
) DEFAULT CHARSET=utf8;
