select table_name, is_updatable from information_schema.views;
alter table employee_list1 modify column dept_id int;



select * from employee_list1;

insert into employee_list1
(employee_id, first_name, last_name)
values (33686, '강인', '이');

update employee_list1
set first_name = '민재', last_name = '김'
where employee_id = 33686;

delete from employee_list1
where employee_id = 33686;


