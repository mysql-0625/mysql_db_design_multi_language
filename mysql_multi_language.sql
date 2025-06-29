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
        
-- Insert data translasi        
INSERT INTO categories_translation (category_id, language, name, description)
VALUES ("ELECTRONICS", "in_ID", "Elektronik", "Ini deskripsi elektronik"),
		("ELECTRONICS", "en_US", "Electronics", "This is an electronics description"),
		("ELECTRONICS", "zh_CN", "电子产品", "这是一个关于电子产品的描述"),
        ("FOOD", "in_ID", "Makanan", "Ini deskripsi makanan"),
		("FOOD", "en_US", "Food", "This is a food description"),
		("FOOD", "zh_CN", "食品 ", "这是一个关于食品的描述"),
        ("GADGET", "in_ID", "Gawai", "Ini deskripsi gawai"),
		("GADGET", "en_US", "Gadget", "This is a gadget description"),
		("GADGET", "zh_CN", "小工具", "这是一个关于小工具的描述");
        
-- Select semua category semua translasi        
SELECT * FROM categories
JOIN categories_translation ct on categories.id = ct.category_id;   

-- Select semua category berdasarkan bahasa indonesia       
SELECT * FROM categories
JOIN categories_translation ct on categories.id = ct.category_id
WHERE ct.language = "in_ID" ORDER BY position;  

-- Select semua category berdasarkan bahasa english       
SELECT * FROM categories
JOIN categories_translation ct on categories.id = ct.category_id
WHERE ct.language = "en_US" ORDER BY position;   

-- Select semua category berdasarkan bahasa china       
SELECT * FROM categories
JOIN categories_translation ct on categories.id = ct.category_id
WHERE ct.language = "zh_CN" ORDER BY position; 

     
        








