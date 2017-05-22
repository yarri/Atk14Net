CREATE SEQUENCE seq_users;
CREATE TABLE users(
	id INT PRIMARY KEY DEFAULT NEXTVAL('seq_users'),
	login VARCHAR(255) NOT NULL UNIQUE,
	password VARCHAR(255),
	name VARCHAR(255),
	email VARCHAR(255),
	created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
