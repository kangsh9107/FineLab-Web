drop table invoice;

create table invoice (
	id int primary key auto_increment,
	invoice_no int not null,
	stock_code varchar(20) not null,
	description varchar(100) null,
	quantity int not null,
	unit_price double not null,
	customer_id int not null,
	country varchar(50) null,
	invoice_date date not null
);



load data infile 'c:/temp/dataset3.csv'
into table invoice
fields terminated by ';'
	optionally enclosed by '"'
lines terminated by '\n'
ignore 1 lines
(invoice_no, stock_code, description, quantity, unit_price, customer_id, country, invoice_date);

desc invoice;
select count(*), invoice_date from invoice group by invoice_date;



## 실습
select invoice_no as '주문번호',
		stock_code as '제품코드',
		description as '제품설명'
from invoice;

## quantity 5 ~ 10
select quantity
from invoice
where quantity between 5 and 10;

## country가 United Kingdom, France인 것
select count(*)
from invoice
where country not in ('United Kingodm', 'France');

## description에 LUNCH가 포함되어 있는 것
select *
from invoice
where description like '%LUNCH%';

## 중복제거
select distinct invoice_no
from invoice;

## 구매 국가별 평균 구매 단가
select country as '국가', round(avg(unit_price), 2) as '평균 구매 단가'
from invoice
group by country
order by avg(unit_price) desc, country;

## 주문 국가, 주문 번호별 평균 구매 단가
select country as '주문 국가', invoice_no as '주문 번호', round(avg(unit_price), 2) as '평균 구매 단가'
from invoice
group by country, invoice_no
order by country, avg(unit_price) desc;

select country as '주문 국가', invoice_no as '주문 번호', round(avg(unit_price), 2) as '평균 구매 단가'
from invoice
group by country, invoice_no
with rollup; ## 중간 합계 또는 총합

## 국가별, 상품별 구매자 수 및 매출액을 구한다.
select country as '국가', stock_code as '상품코드', count(customer_id) as '구매자 수', sum(quantity * unit_price) as '매출액'
from invoice
group by country, stock_code;

select country as '국가', stock_code as '상품코드', count(customer_id) as '구매자 수', sum(quantity * unit_price) as '매출액'
from invoice
group by 1, 2
order by 3 desc, 4 desc;

## 가장 많이 판매된 2개 상품 조회 (판매 상품 수 기준)
select stock_code as '상품명', sum(quantity) as '판매량'
from invoice
group by stock_code
order by sum(quantity) desc
limit 2;
