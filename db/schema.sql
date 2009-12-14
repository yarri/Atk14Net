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

CREATE SEQUENCE seq_books;
CREATE TABLE books(
	id INT PRIMARY KEY DEFAULT NEXTVAL('seq_books'),
	title VARCHAR(255),
	code VARCHAR(255),
	shelfmark VARCHAR(255)
);
INSERT INTO books(title,code,shelfmark) VALUES('Encyclopaedia Britannica','AE5.E363','B2.1411');
INSERT INTO books(title,code,shelfmark) VALUES('The Encyclopaedia Britannica: the twelfth edition.','AE5.E363','B2.1412');
INSERT INTO books(title,code,shelfmark) VALUES('The Encyclopaedia Britannica: the thirteenth edition.','AE5.E363','B2.1413');
INSERT INTO books(title,code,shelfmark) VALUES('The New Encyclopaedia Britannica','AE5.E363','B2.1415');
INSERT INTO books(title,code,shelfmark) VALUES('Grote Winkler Prins encyclopaedie','AE19.G88','B2.1383');
INSERT INTO books(title,code,shelfmark) VALUES('Brockhaus, die Enzyklopadie : in vierundzwanzig Banden','AE27.G672','B2.1395');
INSERT INTO books(title,code,shelfmark) VALUES('Enciclopedia italiana di scienze, lettere ed arti','AE35.E5','B2.1482');
INSERT INTO books(title,code,shelfmark) VALUES('Bonniers Lexikon','AE45.B622','B2.1488');
INSERT INTO books(title,code,shelfmark) VALUES('The Penguin dictionary of proper names','AG5','B2.1506BB');
INSERT INTO books(title,code,shelfmark) VALUES('The Guinness book of answers','AG6.G83','B2.1490A');
INSERT INTO books(title,code,shelfmark) VALUES('Guinness world records','AG243.G87','B2.1490');
INSERT INTO books(title,code,shelfmark) VALUES('The Athenaeum subject index to periodicals.','AI3.A68','B1.1074');
INSERT INTO books(title,code,shelfmark) VALUES('The subject index to periodicals.','AI3.A72','B1.1074');
INSERT INTO books(title,code,shelfmark) VALUES('Titles in series','AI3.B3','B1.200');
INSERT INTO books(title,code,shelfmark) VALUES('An author index to selected British "little magazines," 1930-1939','AI3.B56','B1.989');
INSERT INTO books(title,code,shelfmark) VALUES('British humanities index','AI3.B7','B1.1074');
INSERT INTO books(title,code,shelfmark) VALUES('Essay and general literature index','AI3.E752','B1.1095');
INSERT INTO books(title,code,shelfmark) VALUES('Humanities index','AI3.H85','B1.991');
INSERT INTO books(title,code,shelfmark) VALUES('Index to Commonwealth little magazines','AI3.I48','B1.988');
INSERT INTO books(title,code,shelfmark) VALUES('An index to periodical literature. (To 1882)','AI3.P7','B1.1066');
INSERT INTO books(title,code,shelfmark) VALUES('Nineteenth century readers'' guide to periodical literature, 1890-1899','AI3.R496','B1.1070');
INSERT INTO books(title,code,shelfmark) VALUES('Index to the periodicals of...','AI3.R5','B1.1072');
INSERT INTO books(title,code,shelfmark) VALUES('Cumulative author index for Poole''s index to periodical literature, 1802-1906','AI3.W3','B1.1067');
INSERT INTO books(title,code,shelfmark) VALUES('The Wellesley index to Victorian periodicals, 1824-1900','AI3.W45','B1.1068');
INSERT INTO books(title,code,shelfmark) VALUES('Times index','AI21.T46','B1.1287');
INSERT INTO books(title,code,shelfmark) VALUES('The directory of museums & living displays','AM1.H78','B2.7A');
INSERT INTO books(title,code,shelfmark) VALUES('World museum publications','AM1.W67','B2.8A');
INSERT INTO books(title,code,shelfmark) VALUES('The Cambridge guide to the museums of Britain and Ireland','AM41.H79','B2.7B');
INSERT INTO books(title,code,shelfmark) VALUES('A.S.K. Hollis...','AS118','B2.714');
INSERT INTO books(title,code,shelfmark) VALUES('Centres, bureaux & research institutes.','AS118.C39.3','B2.978');
INSERT INTO books(title,code,shelfmark) VALUES('Councils, committees & boards','AS118.C68','B2.975');
INSERT INTO books(title,code,shelfmark) VALUES('Directory of British associations & associations in Ireland.','AS118.D56','B2.977');
INSERT INTO books(title,code,shelfmark) VALUES('The British Academy directory','AS122','B2.15');
INSERT INTO books(title,code,shelfmark) VALUES('Bibliographie analytique des biographies collectives ...1789-1985','AS162.B6','B3.524');
INSERT INTO books(title,code,shelfmark) VALUES('The world of learning','AS2.W6','B2.110');
INSERT INTO books(title,code,shelfmark) VALUES('Encyclopedia of associations.','AS22.E5','B2.96');
INSERT INTO books(title,code,shelfmark) VALUES('Research centers directory.','AS25.D5','B2.94');
INSERT INTO books(title,code,shelfmark) VALUES('Encyclopedia of associations. International organizations','AS8.E53','B2.97');
INSERT INTO books(title,code,shelfmark) VALUES('Buttress''s World guide to abbreviations of organizations.','AS8.P58','B2.693');
INSERT INTO books(title,code,shelfmark) VALUES('International encyclopedia of abbreviations and acronyms of organizations','AS8.W46','B2.688');
INSERT INTO books(title,code,shelfmark) VALUES('The international foundation directory 2003.','AS911.A2','B2.679B');
INSERT INTO books(title,code,shelfmark) VALUES('Directory of grant-making trusts.','AS911.A2','B2.678');
INSERT INTO books(title,code,shelfmark) VALUES('Hinduja Foundation encyclopaedia of Nobel laureates 1901-1987','AS911.H56','B3.56');
INSERT INTO books(title,code,shelfmark) VALUES('Whitaker''s obituary almanack.','AY754','B3.19');
INSERT INTO books(title,code,shelfmark) VALUES('Whitaker''s almanack','AY754.W5','B2.1390');
INSERT INTO books(title,code,shelfmark) VALUES('International dictionary of graphic symbols','AZ108.A76','B2.1498');
INSERT INTO books(title,code,shelfmark) VALUES('Directory of American philosophers.','B935.D5','B3.969');
INSERT INTO books(title,code,shelfmark) VALUES('Internationales Abkurzungsverzeichnis fur Theologie...','BR95.5','S394B1.1211IATG3');
INSERT INTO books(title,code,shelfmark) VALUES('The Catholic directory of England and Wales.','BX1491.A1','B2.816');
INSERT INTO books(title,code,shelfmark) VALUES('The Catholic directory for Scotland.','BX1497.A3','B2.816A');
INSERT INTO books(title,code,shelfmark) VALUES('Irish Catholic directory for ...','BX1503.A3','B2.816B');
INSERT INTO books(title,code,shelfmark) VALUES('Obit Book of the English Benedictines from 1600 to 1912','BX3016.S6','B3.176');
INSERT INTO books(title,code,shelfmark) VALUES('Obituary notices of the English Dominicans from 1555 to 1952','BX3550.','E5B3.178');
INSERT INTO books(title,code,shelfmark) VALUES('The Book of saints','BX4655','B2.1496');
INSERT INTO books(title,code,shelfmark) VALUES('Series episcoporum ecclesiae catholicae','BX4666.G3','B2.1489');
INSERT INTO books(title,code,shelfmark) VALUES('The seminary priests : a dictionary of the secular clergy...1558-1850','BX4676.A52','B3.175');
INSERT INTO books(title,code,shelfmark) VALUES('English and Welsh priests, 1558-1800 : a working list','BX4676.E54','B3.174');
INSERT INTO books(title,code,shelfmark) VALUES('English and Welsh priests, 1801-1914 : a working list','BX4676.E54','B3.174A');
INSERT INTO books(title,code,shelfmark) VALUES('Biographies of English Catholics in the eighteenth century','BX4676.K5','B3.173');
INSERT INTO books(title,code,shelfmark) VALUES('Les eveques et les archeveques de France depuis 1682 jusqu''...1801','BX4682.J43','B3.530');
INSERT INTO books(title,code,shelfmark) VALUES('Biografisch lexicon voor de geschiedenis van het Nederlandse protestantisme','BX4846.B56','B3.756');
INSERT INTO books(title,code,shelfmark) VALUES('The Church of England year book','BX5015.C45','B2.806c');
INSERT INTO books(title,code,shelfmark) VALUES('Crockford''s clerical directory.','BX5031.C8','B2.806');
INSERT INTO books(title,code,shelfmark) VALUES('Index ecclesiasticus','BX5031.F7','B3.161');
INSERT INTO books(title,code,shelfmark) VALUES('The Oxford Diocesan year book.','BX5107.O808','B2.806D');
INSERT INTO books(title,code,shelfmark) VALUES('Scottish Episcopal clergy, 1689-2000','BX5390.S36','B3.175A');
INSERT INTO books(title,code,shelfmark) VALUES('Church of Ireland directory','BX5440.A3','B2.817');
INSERT INTO books(title,code,shelfmark) VALUES('The Baptist Union directory for ...','BX6276.A1','B2.809');
INSERT INTO books(title,code,shelfmark) VALUES('Garlick''s Methodist registry, 1983','BX8213.G23','B2.812');
INSERT INTO books(title,code,shelfmark) VALUES('The minutes of the annual conference ... / the Methodist Church.','BX8350.M4','B2.811');
INSERT INTO books(title,code,shelfmark) VALUES('Annuario pontificio per l''anno ...','BX845.A75','B2.815');
INSERT INTO books(title,code,shelfmark) VALUES('The Oxford dictionary of popes','BX955.2.K45','B3.170');
INSERT INTO books(title,code,shelfmark) VALUES('The Church of Scotland year-book...','BX9076','B2.813');
INSERT INTO books(title,code,shelfmark) VALUES('The United Reformed Church year book.','BX9890.U25','B2.810');
INSERT INTO books(title,code,shelfmark) VALUES('British archives : a guide to archive resources in the United Kingdom','CD1040.F67','B2.12');
INSERT INTO books(title,code,shelfmark) VALUES('A hand-book of mottoes : borne by the nobility, gentry, cities, public companies','CR75.G7','B2.681');
INSERT INTO books(title,code,shelfmark) VALUES('Titles and forms of address : a guide to correct use.','CR3890.T56','B2.699');
INSERT INTO books(title,code,shelfmark) VALUES('Debrett''s correct form.','CR3891.M65','B2.700');
INSERT INTO books(title,code,shelfmark) VALUES('The Royalty, peerage and nobility of the world','CS404.R68','B3.31');
INSERT INTO books(title,code,shelfmark) VALUES('The titled nobility of Europe','CS404.R8','B3.30');

