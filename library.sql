drop schema if exists library;
create schema if not exists library;
use library;

CREATE TABLE `Authors` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `FIO` varchar(40),
  `birth_date` timestamp
);

CREATE TABLE `Books` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(20),
  `genre` varchar(20),
  `publication_date` timestamp
);

CREATE TABLE `Readers` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `FIO` varchar(40),
  `email` varchar(20),
  `registration_date` timestamp
);

CREATE TABLE `Rents` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `reader_id` int unique,
  `book_id` int unique,
  `start_date` timestamp,
  `end_date` timestamp,
  `status` varchar(20)
);

CREATE TABLE `Authors_Books` (
  `Authors_id` int,
  `Books_id` int,
  PRIMARY KEY (`Authors_id`, `Books_id`)
);

ALTER TABLE `Authors_Books` ADD FOREIGN KEY (`Authors_id`) REFERENCES `Authors` (`id`);

ALTER TABLE `Authors_Books` ADD FOREIGN KEY (`Books_id`) REFERENCES `Books` (`id`);

ALTER TABLE `Rents` ADD FOREIGN KEY (`reader_id`) REFERENCES `Readers` (`id`);

ALTER TABLE `Books` ADD FOREIGN KEY (`id`) REFERENCES `Rents` (`book_id`);



select * from Books
order by publication_date;

select * from Books
inner join Authors on Books.id = Authors.id
order by Authors.birth_date;



create user 'librarian'@'localhost'
identified
by '12345';

create user cashier@'localhost'
identified
by '32154';

create user visitor@'localhost'
identified by 'qwerty';

grant insert, update, delete
on library.Books
to librarian@'localhost';

grant insert, update, delete
on library.Authors
to librarian@'localhost';

grant insert, update, delete
on library.Authors_Books
to librarian@'localhost';

grant insert, update, delete
on library.Readers
to cashier@'localhost';

grant insert, update, delete
on library.Rents
to cashier@'localhost';

select * from mysql.db;