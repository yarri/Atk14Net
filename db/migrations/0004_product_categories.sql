CREATE SEQUENCE seq_product_categories;
CREATE TABLE product_categories(
	id INT PRIMARY KEY DEFAULT NEXTVAL('seq_product_categories'),
	product_id INT NOT NULL,
	category_id INT NOT NULL,
	ranking INT DEFAULT 1000 NOT NULL,
	CONSTRAINT fk_productcategories_products FOREIGN KEY (product_id) REFERENCES products ON DELETE CASCADE,
	CONSTRAINT fk_productcategories_categories FOREIGN KEY (category_id) REFERENCES categories ON DELETE CASCADE,
	CONSTRAINT unq_productcategories_productid_categoryid UNIQUE (product_id,category_id)
);
