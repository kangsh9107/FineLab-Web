## 아이유보다 생일이 빠른 사람
select *
from employees
where birth_date < any (
						select birth_date
						from employees e
						where first_name = '이유'
						and last_name = '아'
);



select * from employees;
insert into employees (employee_id, first_name, last_name, birth_date, dept_id)
values (520032, '나라', '장', '2000-12-31', 6),
(520033, '착맨', '침', '1993-07-07', 6);
insert into employees (employee_id, first_name, last_name, birth_date, dept_id)
values (520035, '이유', '아', '2002-02-02', 5); ## 생일 같은 아이유가 2명일 때