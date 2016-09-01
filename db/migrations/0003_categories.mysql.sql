CREATE TABLE categories(
	id INT PRIMARY KEY AUTO_INCREMENT,
	parent_category_id INT,
	ranking INT DEFAULT 1000 NOT NULL,
	title_cs VARCHAR(255),
	title_en VARCHAR(255),
	info_cs TEXT,
	info_en TEXT
);
