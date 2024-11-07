drop schema if exists hotel;
create schema if not exists hotel;
use hotel;

create table rooms(
id int primary key,
class varchar(20),
price int
);

create table clients(
id int primary key auto_increment,
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20)
);

create table booking(
id int primary key auto_increment,
room_id int,
client_id int,
foreign key (room_id) references rooms(id),
foreign key (client_id) references clients(id)
);

create table employees(
id int primary key auto_increment,
first_name varchar(20),
middle_name varchar(20),
last_name varchar(20)
);

create table job_history(
id int primary key auto_increment,
emp_id int,
occupation varchar(20),
start_date date,
end_date date,
foreign key (emp_id) references employees(id)
);

create table bill(
id int primary key auto_increment,
book_id int,
emp_id int,
foreign key (book_id) references booking(id),
foreign key (emp_id) references employees(id)
);