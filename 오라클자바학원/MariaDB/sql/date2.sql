## 백만분의 1초 (소수점 6자리까지 나온다)
create table times (
	id int not null auto_increment,
	dt datetime(6),
	primary key(id)
);

insert into times (dt)
values (now()), (now(6));

select * from times;



## timestamp
create table dtts (
	id int not null auto_increment,
	name varchar(25),
	dt datetime(6) not null default current_timestamp(6),
	ts timestamp(3) not null default current_timestamp(3),
	primary key(id)
);

insert into dtts (name)
values ('aaa'), ('bbb'), ('ccc'), ('ddd');

select * from dtts;




