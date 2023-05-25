delimiter //
create procedure GetAllEmployees()
begin
	select id, employee_id, first_name, last_name
	from employees;
end //
delimiter ;

call GetAllEmployees();