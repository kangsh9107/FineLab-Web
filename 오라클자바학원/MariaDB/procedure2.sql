delimiter $$
create procedure GetEmployee(in iempid int)
begin
	select id, employee_id, first_name, last_name
	from employees
	where id = iempid;
end $$
delimiter ;

call GetEmployee(2);