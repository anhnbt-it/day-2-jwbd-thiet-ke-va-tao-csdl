-- 
-- [Bài tập] Xác định khoá chính và khoá ngoại của bảng
-- 

CREATE DATABASE banking_db;
USE banking_db;
-- 
-- Cấu trúc bảng cho bảng `customers`
-- 
CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_phone_unique` (`phone`)
);
-- 
-- Cấu trúc bảng cho bảng `accounts`
-- 
CREATE TABLE `accounts` (
  `id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `account_type` tinyint DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
);
-- 
-- Cấu trúc bảng cho bảng `transactions`
-- 
CREATE TABLE `transactions` (
  `id` int unsigned NOT NULL,
  `account_id` int unsigned NOT NULL,
  `amount` double DEFAULT NULL,
  `description` mediumtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `transactions_account_id_foreign` (`account_id`),
  CONSTRAINT `transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
);
