-- 
-- [Bài tập] Phân tích và thiết kế CSDL
--
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- 
-- Cấu trúc bảng cho bảng `customers`
-- 
CREATE TABLE `customers` (
	`id` int unsigned NOT NULL,
    `name` varchar(50) NOT NULL,
    `fullname` varchar(50) NOT NULL,
    `phone` varchar(10) NOT NULL,
    `address_id` int unsigned NOT NULL,
	PRIMARY KEY (`id`),
    KEY `customers_address_id_foreign` (`address_id`),
    CONSTRAINT `customers_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
    UNIQUE KEY `customers_phone_unique` (`phone`)
);

-- 
-- Cấu trúc bảng cho bảng `address`
-- 
CREATE TABLE `address` (
	`id` int unsigned NOT NULL,
    `address` varchar(255) NOT NULL,
    `city` varchar(50) NOT NULL,
    `state` varchar(50) NOT NULL,
    `postalCode` varchar(15) NOT NULL,
    `country` varchar(50) NOT NULL,
    `creditLimit` double NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
);

-- 
-- Cấu trúc bảng cho bảng `orders`
-- 
CREATE TABLE `orders` (
	`id` int unsigned NOT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
);