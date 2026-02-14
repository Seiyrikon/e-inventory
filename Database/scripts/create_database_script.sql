DROP DATABASE IF EXISTS e_inventory;
CREATE DATABASE e_inventory;

USE e_inventory;

-- DROP USER 'e_inventory_admin'@'localhost';
CREATE USER 'e_inventory_admin'@'localhost' IDENTIFIED BY 'e_inventory_admin';
GRANT ALL PRIVILEGES ON e_inventory.* TO 'e_inventory_admin'@'localhost';

FLUSH PRIVILEGES;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
    user_id VARCHAR(25) PRIMARY KEY NOT NULL,
    username VARCHAR(25) UNIQUE NOT NULL,
    created_by VARCHAR(25) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL,
    modified_by VARCHAR(25) NULL,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL
);

DROP TABLE IF EXISTS account;
CREATE TABLE account (
    user_id VARCHAR(25) NOT NULL,
    email VARCHAR(100) UNIQUE NULL,
    password VARCHAR(255) NULL,
    created_by VARCHAR(25) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL,
    modified_by VARCHAR(25) NULL,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS user_personal_information;
CREATE TABLE user_personal_information (
    user_id VARCHAR(25) NOT NULL,
    first_name VARCHAR(25) NULL,
    middle_name VARCHAR(25) NULL,
    last_name VARCHAR(25) NULL,
    created_by VARCHAR(25) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL,
    modified_by VARCHAR(25) NULL,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS item;
CREATE TABLE item (
    item_id VARCHAR(25) PRIMARY KEY NOT NULL,
    item_name VARCHAR(25) NOT NULL,
    item_content VARCHAR(4000) NULL,
    created_by VARCHAR(25) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL,
    modified_by VARCHAR(25) NULL,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL
);

DROP TABLE IF EXISTS user_item;
CREATE TABLE user_item (
	user_id VARCHAR(25) NOT NULL,
    item_id VARCHAR(25) NOT NULL,
    created_by VARCHAR(25) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL,
    modified_by VARCHAR(25) NULL,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES item(item_id) ON DELETE CASCADE
);