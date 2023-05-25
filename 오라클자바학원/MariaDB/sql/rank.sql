## 윈도우 함수 (분석함수)
## row_number, rank, dense_rank
select * from invoice;

select unit_price,
	row_number() over(order by unit_price desc) rn,
	rank() over(order by unit_price desc) ra,
	dense_rank() over(order by unit_price desc) dr,
	ntile(4) over(order by unit_price desc) nt ## 4개 그룹으로 분리. ex) 10개면 3/3/2/2
from invoice;