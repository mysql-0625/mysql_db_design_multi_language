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










