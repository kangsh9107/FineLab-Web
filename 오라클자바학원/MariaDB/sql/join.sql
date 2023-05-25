## inner join
select e.employee_id,
	e.first_name,
	e.last_name,
	e.birth_date,
	d.name
from employees e
join departments d on e.dept_id = d.id;

## outer join
select e.employee_id,
	e.first_name,
	e.last_name,
	e.birth_date,
	d.name
from employees e
right join departments d on e.dept_id = d.id;