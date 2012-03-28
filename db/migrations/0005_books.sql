CREATE SEQUENCE seq_books;
CREATE TABLE books(
	id INT PRIMARY KEY DEFAULT NEXTVAL('seq_books'),
	title VARCHAR(255),
	code VARCHAR(255),
	shelfmark VARCHAR(255),
	author VARCHAR(255)
);
