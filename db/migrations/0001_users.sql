-- file db/migrations/0001_users.sql
CREATE SEQUENCE seq_users;
CREATE TABLE users(
	id INT PRIMARY KEY DEFAULT NEXTVAL('seq_users'),
	login VARCHAR(255) NOT NULL UNIQUE,
	password VARCHAR(255),
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	is_admin CHAR(1) NOT NULL DEFAULT 'N' CHECK(is_admin IN ('Y','N')),
	created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

