delimiter //
create function getAge(yr int)
	returns int
begin
	declare age int;
	set age = year(now()) - yr;
	return age;
end //
delimiter ;

select getAge(year(created_at))
from holidays;


