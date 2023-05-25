## 제어 흐름 함수 (if, case)
select if (100 > 200, '참', '거짓');
select ifnull(null, '널입니다');
select nullif(100, 100); ## 두 값이 같으면 null, 다르면 값1

select case 2
	when 1 then '이'
	when 2 then '얼'
	when 3 then '싼'
	else '모름'
	end;
	
## 집계 함수에 case when 사용하기

## 영국(United Kingdom)의 주문건수만 출력하여라
select * from invoice;

select country as '국가', count(invoice_no) as '주문건수'
from invoice
where country = 'United Kingdom'
group by country;

## 프랑스(France)의 주문건수만 출력하여라
select country as '국가', count(invoice_no) as '주문건수'
from invoice
where country = 'France'
group by country;

select sum(case when country = 'United Kingdom' then 1 else 0 end) uk_cnt,
		sum(case when country = 'France' then 1 else 0 end) f_cnt
from invoice; ## 성능 개선

## 가장 많이 판매된 2개 상품 조회
select stock_code
from (
	  select *, row_number() over(order by qty desc) rnk
	  from (
			select stock_code, sum(quantity) qty
			from invoice
			group by 1
		) a
	 ) a
where rnk between 1 and 2; ## 성능 개선

## 제품번호 (84077, 85123A)
## 위 제품 번호를 모두 구입한 고객의 id를 출력
SELECT customer_id
FROM invoice
WHERE stock_code IN (
					 select stock_code
					 from (
						   select *, row_number() over(order by qty desc) rnk
						   from (
								 select stock_code, sum(quantity) qty
								 from invoice
								 group by 1
								) a
						  ) a
					 where rnk between 1 and 2)
GROUP BY customer_id
HAVING COUNT(DISTINCT stock_code) = 2;

SELECT customer_id
FROM invoice
WHERE stock_code IN (
  SELECT stock_code
  FROM (
    SELECT stock_code, SUM(quantity) AS qty
    FROM invoice
    GROUP BY stock_code
    ORDER BY qty DESC
    LIMIT 2
  ) subquery
)
GROUP BY customer_id
HAVING COUNT(DISTINCT stock_code) = 2;









