-- 
-- [Bài tập] Phân tích và thiết kế CSDL
--

CREATE DATABASE ecommerce_db;
USE ecommerce_db;

--
-- Table structure for table `customers`
--
CREATE TABLE `customers` (
  `customerNumber` int unsigned NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `contactLastName` varchar(50) NOT NULL,
  `contactFirstName` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `salesRepEmployeeNumber` int unsigned DEFAULT NULL,
  `creditLimit` decimal(10,2) DEFAULT NULL
);

--
-- Table structure for table `employees`
--
CREATE TABLE `employees` (
  `employeeNumber` int unsigned NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int unsigned DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL
);

--
-- Table structure for table `offices`
--
CREATE TABLE `offices` (
  `officeCode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `postalCode` varchar(15) NOT NULL,
  `territory` varchar(10) NOT NULL
);

--
-- Table structure for table `orderdetails`
--
CREATE TABLE `orderdetails` (
  `orderNumber` int unsigned NOT NULL,
  `productCode` varchar(15) NOT NULL,
  `quantityOrdered` int DEFAULT NULL,
  `priceEach` decimal(10,2) DEFAULT NULL,
  `orderLineNumber` smallint DEFAULT NULL
);

--
-- Table structure for table `orders`
--
CREATE TABLE `orders` (
  `orderNumber` int unsigned NOT NULL,
  `customerNumber` int unsigned NOT NULL,
  `orderDate` date NOT NULL,
  `requiredDate` date NOT NULL,
  `shippedDate` date DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `comments` text
);

--
-- Table structure for table `payments`
--
CREATE TABLE `payments` (
  `customerNumber` int unsigned NOT NULL,
  `checkNumber` varchar(50) NOT NULL,
  `paymentDate` date NOT NULL,
  `amount` decimal(10,2) NOT NULL
);

--
-- Table structure for table `productlines`
--
CREATE TABLE `productlines` (
  `productLine` varchar(50) NOT NULL,
  `textDescription` text,
  `htmlDescription` mediumtext,
  `image` mediumblob
);

--
-- Table structure for table `products`
--
CREATE TABLE `products` (
  `productCode` varchar(15) NOT NULL,
  `productLine` varchar(50) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productScale` varchar(10) NOT NULL,
  `productVendor` varchar(50) NOT NULL,
  `productDescription` text NOT NULL,
  `quantityInStock` smallint NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `MSRP` decimal(10,2) NOT NULL
);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerNumber`),
  ADD KEY `customers_salesRepEmployeeNumber_fk` (`salesRepEmployeeNumber`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`);

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employeeNumber`),
  ADD KEY `employees_reportsTo_fk` (`reportsTo`),
  ADD KEY `employees_officeCode_fk` (`officeCode`),
  ADD UNIQUE KEY `employees_email_unique` (`email`);

--
-- Chỉ mục cho bảng `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`officeCode`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderNumber`,`productCode`),
  ADD KEY `orderdetails_productCode_fk` (`productCode`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderNumber`),
  ADD KEY `orders_customerNumber_fk` (`customerNumber`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`customerNumber`,`checkNumber`),
  ADD KEY `payments_customerNumber_fk` (`customerNumber`);

--
-- Chỉ mục cho bảng `productlines`
--
ALTER TABLE `productlines`
  ADD PRIMARY KEY (`productLine`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productCode`),
  ADD KEY `products_productLine_fk` (`productLine`);

--
-- Các ràng buộc cho bảng `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_salesRepEmployeeNumber_fk` FOREIGN KEY (`salesRepEmployeeNumber`) REFERENCES `employees` (`employeeNumber`);

--
-- Các ràng buộc cho bảng `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_reportsTo_fk` FOREIGN KEY (`reportsTo`) REFERENCES `employees` (`employeeNumber`),
  ADD CONSTRAINT `employees_officeCode_fk` FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`);

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_orderNumber_fk` FOREIGN KEY (`orderNumber`) REFERENCES `orders` (`orderNumber`),
  ADD CONSTRAINT `orderdetails_productCode_fk` FOREIGN KEY (`productCode`) REFERENCES `products` (`productCode`);
  
--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customerNumber_fk` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`);
  
--
-- Các ràng buộc cho bảng `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_customerNumber_fk` FOREIGN KEY (`customerNumber`) REFERENCES `customers` (`customerNumber`);
  
--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_productLine_fk` FOREIGN KEY (`productLine`) REFERENCES `productlines` (`productLine`);