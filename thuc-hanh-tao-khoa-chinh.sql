USE jwbd_db;
DROP TABLE `users`;
--
-- Cấu trúc bảng cho bảng `users`
--
CREATE TABLE `users` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
);
--
-- Thêm cột cho bảng `users`
--
ALTER TABLE `users`
	ADD COLUMN `created_at` TIMESTAMP NULL DEFAULT NULL,
    ADD COLUMN `updated_at` TIMESTAMP NULL DEFAULT NULL;
--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
	ADD UNIQUE KEY `users_email_unique` (`email`);
--
-- Cấu trúc bảng cho bảng `roles`
--
CREATE TABLE `roles` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` ENUM('administrator','editor','author','contributor','subscriber') NOT NULL DEFAULT 'subscriber',
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
);
--
-- Cấu trúc bảng cho bảng `role_user`
--
CREATE TABLE `role_user` (
	 `id` INT UNSIGNED NOT NULL,
     `user_id` INT UNSIGNED NOT NULL,
     `role_id` INT UNSIGNED NOT NULL
);
-- 
-- Thêm cột cho bảng `role_user`
-- 
ALTER TABLE `role_user`
	ADD COLUMN `created_at` TIMESTAMP NULL DEFAULT NULL,
    ADD COLUMN `updated_at` TIMESTAMP NULL DEFAULT NULL;
-- 
-- AUTO_INCREMENT cho bảng `role_user`
-- 
ALTER TABLE `role_user`
	MODIFY `id` INT UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Chỉ mục cho bảng `role_user`
--
ALTER TABLE `role_user`
	ADD PRIMARY KEY (`id`),
	ADD KEY `role_user_user_id_foreign` (`user_id`),
    ADD KEY `role_user_role_id_foreign` (`role_id`);
--
-- Các ràng buộc cho bảng `role_user`
--
ALTER TABLE `role_user`
	ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
    ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
    
-- 
-- Cấu trúc cho bảng `posts`
--
CREATE TABLE `posts` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `title` VARCHAR(255) UNIQUE,
    `slug` VARCHAR(255) UNIQUE,
    `description` MEDIUMTEXT NOT NULL,
    `content` TEXT NOT NULL,
    `thumbnail` VARCHAR(255) NOT NULL,
    `views` INT UNSIGNED DEFAULT '0',
    `status` ENUM('published', 'draft', 'pending') DEFAULT 'published',
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);