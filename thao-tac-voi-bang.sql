-- Tao CSDL
CREATE DATABASE jwbd_db;
-- Chon CSDL 
use jwbd_db;
-- Tao bang 
CREATE TABLE `contacts` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(30) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
);
--  Them cot moi
ALTER TABLE `contacts` 
	ADD `email` varchar(50) NOT NULL
		AFTER `contact_id`;
-- Thay doi kieu gia tri cua cot
ALTER TABLE `contacts`
	MODIFY `last_name` varchar(50) NULL;
-- Xoa cot 
ALTER TABLE `contacts`
	DROP COLUMN `email`;
-- Xoa cot 
ALTER TABLE `contacts`
	DROP COLUMN `first_name`;
-- Sua ten cot
ALTER TABLE `contacts`
	CHANGE COLUMN `last_name` `full_name`
    varchar(100) NOT NULL;
-- Tao bang 
CREATE TABLE `suppliers` (
	`supplier_id` int NOT NULL AUTO_INCREMENT,
    `supplier_name` varchar(50) NOT NULL,
    `account_rep` varchar(30) NOT NULL DEFAULT 'TBD',
    PRIMARY KEY (`supplier_id`)
);
-- Xoa bang 
DROP TABLE `suppliers`;
-- Sua ten bang 
ALTER TABLE `contacts`
	RENAME TO `persons`;