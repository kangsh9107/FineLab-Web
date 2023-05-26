## json구조 select
create table locations (
	id int not null auto_increment,
	name varchar(100) not null,
	latitude decimal(9,6) not null,
	longitude decimal(9,6) not null,
	attr json,
	primary key(id)
);

insert into locations
(name, latitude, longitude, attr)
values
('이마트구로점', 38.0021628, 126.725566,
'{"details":{"name":"마트", "url":"http://www.emart.com"}, "comment":"가지마라!"}');

select * from locations;

select name, latitude, longitude,
		json_value(attr, '$.details.name') name,
		json_value(attr, '$.comment') comment
from locations;







