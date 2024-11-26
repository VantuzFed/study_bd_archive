drop database if exists gas_station;
create database if not exists gas_station;
use gas_station;

create table fuel(
    fuel_type varchar(20) not null primary key,
    fuel_amount float,
    price int not null
);

create table fuel_pump(
	id int not null primary key,
    occupation_status bool
);

create table regular_customer(
	id int not null primary key auto_increment,
	first_name varchar(20),
	last_name varchar(20)
);

create table job(
	id varchar(12) not null primary key,
    title varchar(30),
    salary int
);

create table employee(
	id int not null primary key auto_increment,
	first_name varchar(20),
	last_name varchar(20),
    job_id varchar(12),
    foreign key (job_id) references job(id)
);

create table bill(
	id int not null primary key auto_increment,
    customer_id int,
    pump_id int,
    fuel_type varchar(20),
    fuel_consumed float,
    emp_id int,
    order_date datetime,
    foreign key (customer_id) references regular_customer(id),
    foreign key (pump_id) references fuel_pump(id),
    foreign key (fuel_type) references fuel(fuel_type),
    foreign key (emp_id) references employee(id)
);

create view agr_view as
select *
from bill
where fuel_consumed > (select AVG(fuel_consumed) from bill);

create view bill_price as
select bill.id, bill.fuel_type, fuel.price, bill.fuel_consumed, bill.order_date
from bill, fuel
where bill.fuel_type = fuel.fuel_type;