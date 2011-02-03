CREATE SEQUENCE seq_products;
CREATE TABLE products(
	id INT PRIMARY KEY DEFAULT NEXTVAL('seq_products'),
	catalog_number VARCHAR(255),
	title_cs VARCHAR(255),
	title_en VARCHAR(255),
	short_info_cs TEXT,
	short_info_en TEXT,
	long_info_cs TEXT,
	long_info_en TEXT,
	action_info_cs VARCHAR(255),
	action_info_en VARCHAR(255),
	price NUMERIC(12,4) NOT NULL,
	old_price NUMERIC(12,4),
	visible CHAR(1) NOT NULL DEFAULT 'Y' CHECK(visible IN ('Y','N')),
	deleted CHAR(1) NOT NULL DEFAULT 'N' CHECK(deleted IN ('Y','N')),
	created_at TIMESTAMP NOT NULL DEFAULT NOW()
);
