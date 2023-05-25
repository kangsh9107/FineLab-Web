## 프로시져
select * from users;

select sha2('1234', 256); ## 암호화. 되돌리는 로직이 없다.

delimiter //
create procedure password_sha()
begin
	update users
	set password = sha2(password, 256)
	where password is not null;
end //
delimiter ;

call password_sha();

select *
from users
where password = sha2('1234', 256);


