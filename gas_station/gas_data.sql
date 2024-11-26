use gas_station;
insert into fuel values('92',1200.6,45),('95',1300.4,50),('95-ultra',900.8,55),('100',600.3,65),('diesel',400.7,48);
insert into job values('cashier','Кассир',27599), ('st_worker','Заправщик',21000), ('cleaner','Уборщик',17600), ('security','Охранник',7247);
insert into fuel_pump values(1,0),(2,1),(3,0);
insert into regular_customer (first_name,last_name) values('Ильин','Градостроительный'),('Игорь','Степначековский'),('Айдар','Катков');
insert into employee (first_name,last_name,job_id) values('Любослав','Авдеев','security'),('Светлана','Бобыльчук','cashier'),('Галина','Отменяева','cashier'),('Олег','Вставченко','st_worker'),('Гульшат','Арахметов','cleaner');
insert into bill (customer_id,pump_id,fuel_type,fuel_consumed,emp_id,order_date) values(1,3,'95-ultra',10.2,2,'2024-01-04 12:33:00'),(2,3,'95',15.4,2,'2024-02-01 13:13:00'),(3,1,'100',16.6,3,'2024-01-14 14:33:00'),
(null,2,'92',13.3,3,'2024-01-14 15:53:00'),
(null,3,'diesel',12.1,2,'2024-01-14 14:23:00'),
(null,1,'95',19.3,3,'2024-01-14 15:33:00');

insert into bill (customer_id,pump_id,fuel_type,fuel_consumed,emp_id,order_date) values(null,2,'100',12.5,3,'2024-01-04 16:53:00');

select * from bill
inner join regular_customer on customer_id = regular_customer.id;