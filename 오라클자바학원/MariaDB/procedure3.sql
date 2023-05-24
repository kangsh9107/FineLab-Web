delimiter $$
create procedure GetEmployeeCount(out empcount int)
begin
	select count(*) into empcount from employees;
end $$
delimiter ;

call GetEmployeeCount(@empcount);
select @empcount;

call GetEmployeeCount(@temp);
select @temp;


delimiter $$
create procedure InoutTest(inout temp2 int)
begin
	set temp2 = temp2 + 1;
end $$
delimiter ;

set @temp2 = 10;
select @temp2;
call InoutTest(@temp2);
select @temp2;