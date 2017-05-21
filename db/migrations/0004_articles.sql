CREATE SEQUENCE seq_articles;
CREATE TABLE articles(
	id INT PRIMARY KEY DEFAULT NEXTVAL('seq_articles'),
	title VARCHAR(255),
	teaser TEXT,
	body TEXT,
	published_at TIMESTAMP NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
