## 신규 회원 등록시 비밀번호 암호화
delimiter //
create trigger tr_passwod_sha
	before insert on users
	for each row
begin
	set new.password = sha2(new.password, 256);
end //
delimiter ;



## 
select * from original_table;

create table dup_table(
	select distinct *
	from original_table
	group by value
	having count(value) > 1
);

select * from dup_table;

delete from original_table
where value in (select value from dup_table);

select * from original_table;

insert into original_table
select * from dup_table;

drop table dup_table;

select * from original_table;



## DB 가져오기
create database isfdb2;
use isfdb2;

select count(*) from authors;

## isfdb 조회 (maraidb는 우선 다 조회한 다음 5개를 잘라서 보여주는 것.)
explain
select t.title_id ID,
		t.title_title Title,
		a.author_legalname Name
from titles t, authors a, canonical_author ca
where ca.author_id = a.author_id
and ca.title_id = t.title_id
limit 5;

## rows examined 10000를 하면 10000건만 조회하고 그 중 5개 잘라서 보여준다.
select t.title_id ID,
		t.title_title Title,
		a.author_legalname Name
from titles t, authors a, canonical_author ca
where ca.author_id = a.author_id
and ca.title_id = t.title_id
limit 5 rows examined 10000;

## inner join vs left join
select author_canonical, email_address
from authors a
	join emails e on a.author_id = e.author_id;

select author_canonical, email_address
from authors a
	left join emails e on a.author_id = e.author_id;

## cross join : count(awards) * count(award_types) 수만큼 나온다.
## 모든 절을 조합하기 때문에 테스트에 사용
select * from awards; ## 상을 받은 정보
select * from award_types; ## 상의 종류

select a.award_id, a.award_title, a.award_author,
	   awt.award_type_name
from awards a
cross join award_types awt on a.award_type_id = awt.award_type_id
limit 10;



