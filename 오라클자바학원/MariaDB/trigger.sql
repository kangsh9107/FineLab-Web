delimiter //
create trigger tr_validate_users
before insert on users
for each row
begin
	if new.email = '' then 
		set @msg = '이메일은 필수입력입니다';
	end if;
	if new.password = '' then
		set @msg = '비번은 필수입력입니다';
	end if;
end //
delimiter ;

desc users;
select * from users;

set @msg = '';
insert into users
(first_name, last_name, email, password, tel)
values ('자', '사', '', '1234', '01012345678');
select @msg;