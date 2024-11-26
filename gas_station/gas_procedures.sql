use gas_station;
drop procedure if exists SALES_COUNT;
drop procedure if exists FUEL_BOUGHT;

delimiter $$
create procedure SALES_COUNT()
begin
select count(id) as 'Количество продаж' from bill;
end $$
delimiter ;

delimiter %%
create procedure FUEL_BOUGHT(fuel_types varchar(20))
begin
select round(sum(fuel_consumed),6) as 'Проданное топливо в литрах' from bill
where fuel_type = fuel_types;
end %%
delimiter ;
