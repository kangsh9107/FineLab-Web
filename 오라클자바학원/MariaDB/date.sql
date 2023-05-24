select curdate();
select curtime();
select now();
select sysdate();

## 올해 크리스마스까지 몇일 남았는지
select datediff('2023-12-25', now());

## 오늘 자정까지 몇시간 몇분 몇초가 남았는지
select timediff('23:59:59', curtime());