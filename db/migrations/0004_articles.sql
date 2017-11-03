CREATE SEQUENCE seq_articles;
CREATE TABLE articles(
	id INT PRIMARY KEY DEFAULT NEXTVAL('seq_articles'),
	title VARCHAR(255),
	teaser TEXT,
	body TEXT,
	author VARCHAR(255),
	published_at TIMESTAMP NOT NULL DEFAULT NOW(),
	created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
