SHOW DATABASES;

CREATE DATABASE mysql_multi_language;

USE mysql_multi_language;

SHOW TABLES;

-- Create table categories utama yang tidak akan ditranslasi
CREATE TABLE categories(
	id VARCHAR(100),
    position INT,
    PRIMARY KEY (id)
);

DESC categories;

INSERT INTO categories (id, position)
	VALUES ("ELECTRONICS", 1),
			("FOOD", 2),
			("GADGET", 3);
            
SELECT * FROM categories ORDER BY position;

-- Create table categories_translation untuk simpan translasi tiap language
CREATE TABLE categories_translation(
	category_id VARCHAR(100) NOT NULL,
    language VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    PRIMARY KEY (category_id, language)
);

DESC categories_translation;

-- relasi kedua table
ALTER TABLE categories_translation
	ADD CONSTRAINT fk_categories_translation
		FOREIGN KEY (category_id) REFERENCES categories(id);








