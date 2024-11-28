drop schema if exists hotel;
create schema if not exists hotel;
use hotel;
CREATE TABLE `bill` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `book_id` int NOT NULL unique,
  `emp_id` int NOT NULL,
  `client_id` int NOT NULL,
  `price_total` int DEFAULT null
);

CREATE TABLE `booking` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL unique,
  `book_start` timestamp NOT NULL,
  `book_end` timestamp NOT NULL,
  `book_status` varchar(20) DEFAULT 'Начало'
);

CREATE TABLE `clients` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) DEFAULT null,
  `last_name` varchar(20) NOT NULL,
  `e_mail` varchar(30) DEFAULT null,
  `phone_number` varchar(15) NOT NULL,
  `document_id` varchar(20) NOT NULL
);

CREATE TABLE `employees` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) DEFAULT null,
  `last_name` varchar(20) NOT NULL
);

CREATE TABLE `job_history` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `emp_id` int NOT NULL unique,
  `occupation` varchar(20) NOT NULL,
  `salary` int NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp DEFAULT null
);

CREATE TABLE `rooms` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `room_number` varchar(10) NOT NULL,
  `class` varchar(20) NOT NULL,
  `price_per_day` int NOT NULL,
  `available` tinyint(1) DEFAULT '1'
);

ALTER TABLE `bill` ADD FOREIGN KEY (`book_id`) REFERENCES `booking` (`id`);

ALTER TABLE `bill` ADD FOREIGN KEY (`emp_id`) REFERENCES `employees` (`id`);

ALTER TABLE `bill` ADD FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

ALTER TABLE `booking` ADD FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

ALTER TABLE `job_history` ADD FOREIGN KEY (`emp_id`) REFERENCES `employees` (`id`);
