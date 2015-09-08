CREATE DATABASE site_analytics;
USE site_analytics;

CREATE TABLE site_domain (
	site_domain_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	domain VARCHAR(700) CHARACTER SET ascii NOT NULL,
	PRIMARY KEY(site_domain_id),
	UNIQUE KEY domain (domain)
);

CREATE TABLE page (
	page_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	site_domain_id INT UNSIGNED NOT NULL,
	path VARCHAR(5000) CHARACTER SET utf8 NOT NULL,
	PRIMARY KEY (page_id),
	UNIQUE INDEX site_path (site_domain_id, path(250))
);

CREATE TABLE session (
	session_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	identifier VARCHAR(40) CHARACTER SET ascii,
	ip BIGINT UNSIGNED NOT NULL,
	user_agent VARCHAR(1000) CHARACTER SET utf8 NOT NULL,
	PRIMARY KEY (session_id),
	UNIQUE KEY identifier (identifier)
);

CREATE TABLE page_load (
	page_load_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	session_id INT UNSIGNED NOT NULL,
	page_id INT UNSIGNED NOT NULL,
	date DATE NOT NULL,
	date_time DATETIME NOT NULL,
	PRIMARY KEY (page_load_id),
	KEY session (session_id),
	KEY page (page_id)
);

CREATE TABLE screen_load (
	screen_load_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	page_load_id INT UNSIGNED NOT NULL,
	date DATE NOT NULL,
	date_time DATETIME NOT NULL,
	path VARCHAR(5000) CHARACTER SET utf8 NOT NULL,
	PRIMARY KEY(screen_load_id),
	KEY date_path (date, path(50)),
	KEY page_load (page_load_id),
	KEY path_date (path(50), date)
);
