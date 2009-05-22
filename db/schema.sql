CREATE SEQUENCE seq_sessions;
CREATE TABLE sessions(
        id INT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('seq_sessions'),
        security VARCHAR(32) NOT NULL CHECK (security ~ '^[a-zA-Z0-9]{32}$'),
        --
        remote_addr VARCHAR(255) DEFAULT '' NOT NULL,
        --
        created TIMESTAMP DEFAULT NOW() NOT NULL,
        last_access TIMESTAMP DEFAULT NOW() NOT NULL
);
CREATE INDEX in_sessions_lastaccess ON sessions (last_access);

CREATE SEQUENCE seq_session_values;
CREATE TABLE session_values(
        id INT NOT NULL PRIMARY KEY DEFAULT NEXTVAL('seq_session_values'),
        session_id INT NOT NULL,
        session_name VARCHAR(64) NOT NULL CHECK(LENGTH(session_name)>0),
        --
        key VARCHAR(128) NOT NULL CHECK(LENGTH(key)>0),
        value TEXT DEFAULT '' NOT NULL,
        expiration TIMESTAMP DEFAULT NULL,
        --
        CONSTRAINT unq_sessionvalues UNIQUE(session_id,session_name,key),
        CONSTRAINT fk_sessionvalues_sessions FOREIGN KEY (session_id) REFERENCES sessions(id) ON DELETE CASCADE
);
CREATE INDEX in_sessionvalues_sessionid ON session_values(session_id);
CREATE INDEX in_sessionvalues_expiration ON session_values(expiration);

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

CREATE SEQUENCE seq_categories;
CREATE TABLE categories(
	id INT PRIMARY KEY DEFAULT NEXTVAL('seq_categories'),
	parent_category_id INT,
	ranking INT DEFAULT 1000 NOT NULL,
	title_cs VARCHAR(255),
	title_en VARCHAR(255),
	info_cs TEXT,
	info_en TEXT
);

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
