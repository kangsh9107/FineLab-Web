## 사원번호, 이름, 성, 근무하는 사무실 정보(사무실 코드, 도시, 전화번호, 주소)를 출력
select * from employees;
select * from offices;

select e.employeeNumber, e.lastName, e.firstName,
	   o.officeCode, o.city, o.phone, o.addressLine1, o.addressLine2
from employees e
	join offices o on e.officeCode = o.officeCode;

## 주문일자, 주문금액을 출력
select * from orders;
select * from orderdetails;

select o1.orderDate, o2.priceEach
from orders o1
	join orderdetails o2 on o1.orderNumber = o2.orderNumber;

## 일별 매출 합계를 출력
select o1.orderDate, sum(o2.quantityOrdered * o2.priceEach) '매출'
from orders o1
	join orderdetails o2 on o1.orderNumber = o2.orderNumber
group by o1.orderDate
order by o1.orderDate;

## 월별 매출 합계를 출력
select left(o1.orderDate, 7) '년월', sum(o2.quantityOrdered * o2.priceEach) '매출'
from orders o1
	join orderdetails o2 on o1.orderNumber = o2.orderNumber
group by left(o1.orderDate, 7)
order by o1.orderDate;

## 년도별 매출 합계를 출력
select left(o1.orderDate, 4) '년', sum(o2.quantityOrdered * o2.priceEach) '매출'
from orders o1
	join orderdetails o2 on o1.orderNumber = o2.orderNumber
group by left(o1.orderDate, 4)
order by o1.orderDate;

## 고객별 가장 마지막으로 주문한 주문일자 출력
select * from orders;

select customerNumber '고객번호', max(orderDate) '마지막 주문일자'
from orders
group by customerNumber
order by customerNumber;

## 고객별 가장 마지막으로 주문한 주문일자와
## 2023-05-24 기준으로 주문일자가 몇일이 지났는지 출력
select customerNumber '고객번호', max(orderDate) '마지막 주문일자', datediff('2023-05-24', orderDate) '2023-05-24 기준으로 주문일자가 몇일이 지났는지'
from orders
group by customerNumber
order by customerNumber;




