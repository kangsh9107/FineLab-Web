create table customers (
	id int primary key auto_increment,
	name varchar(20) not null,
	notebook varchar(20) not null,
	grade varchar(20) default null
);

insert into customers (name, notebook)
values
('홍길동1', '애플 맥북'),
('홍길동2', 'LG 그램'),
('홍길동3', '삼성 갤럭시북'),
('홍길동4', '레노버 싱크패드'),
('홍길동5', '에이수스 젠북'),
('홍길동6', 'MSI 노트북'),
('홍길동7', '애플 맥북'),
('홍길동8', 'LG 그램'),
('홍길동9', '삼성 갤럭시북'),
('홍길동10', '레노버 싱크패드'),
('홍길동11', '에이수스 젠북'),
('홍길동12', 'MSI 노트북');

select * from customers;

delimiter //
create procedure gradeProc()
begin
	declare userId int;
	declare userNotebook varchar(20);
	declare userGrade varchar(20);
	declare endOfRow boolean default false;

	declare userCursor cursor for
		select id, notebook from customers;
	
	declare continue handler
		for not found set endOfRow = true;
	
	open userCursor;
	
	grade_loop: loop
		fetch userCursor into userId, userNotebook;
	
		if endOfRow then
			leave grade_loop;
		end if;
		
		case userNotebook
			when '애플 맥북' then set userGrade = '완전 가능';
			when 'LG 그램' then set userGrade = '가능(울트라PC, 울트라기어 불가능)';
			when '삼성 갤럭시북' then set userGrade = '불가능';
			when '레노버 싱크패드' then set userGrade = '저리가~ 훠이~';
			when '에이수스 젠북' then set userGrade = '풉';
			when 'MSI 노트북' then set userGrade = '예? 뭐요?';
			else set userGrade = '노트북을 구입해주세요';
		end case;
	
		update customers
		set grade = userGrade
		where id = userId;
	end loop grade_loop;
	
	close userCursor;
end //
delimiter ;

call gradeProc();

select * from customers;







