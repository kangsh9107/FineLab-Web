## 과제 1번
CREATE DATABASE oraclejava;
USE oraclejava;

CREATE TABLE users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(40),
	last_name VARCHAR(40),
	email VARCHAR(100),
	PASSWORD VARCHAR(100),
	tel VARCHAR(20)
);

DESC users;

## 과제 2번
USE oraclejava;

CREATE TABLE user_roles (
	user_roles_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT NOT NULL,
	role_code VARCHAR(50) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES users (user_id)
);

DESC user_roles;

SELECT * FROM departments;
SELECT * FROM employees;





## 부서아이디가 1인 사원의 이름과 성
SELECT first_name, last_name
FROM employees
WHERE dept_id = 1;

## 생일이 2002-02-02인 사원의 이름과 성
SELECT first_name, last_name
FROM employees
WHERE birth_date = '2002-02-02'
ORDER BY last_name, first_name;

## 가장 젊은 사원순으로 사원의 이름과 성
SELECT birth_date, first_name, last_name
FROM employees
ORDER BY birth_date DESC, last_name, first_name;

## '이승엽'의 성을 '김'으로 변경
UPDATE employees
SET last_name = '김'
WHERE id = 2;

## '아이브'의 부서를 '인사부'에서 '총무부'로 변경
UPDATE employees
SET dept_id = 6
WHERE id = 3;

## 모든 사번에 500000을 더하여 수정하여라.
## ex) 35347 -> 535347
UPDATE employees
SET employee_id = employee_id + 500000;

DELETE FROM employees WHERE id = 5;

## '영업부' 부서를 삭제하시오.
## FK로 참조하는 테이블을 삭제하거나 수정하려면 다른 방법이 필요.
## DELETE FROM departments WHERE id = 2;





## 뷰
CREATE VIEW employee_list1 AS
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY last_name, first_name;

SELECT * FROM employee_list1;
SHOW TABLES;

CREATE VIEW employee_list2 AS
SELECT e.employee_id AS id,
       e.last_name AS 이름,
		 e.first_name AS 성,
		 d.name AS 부서명
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.id
ORDER BY d.name, e.last_name, e.first_name;

DROP VIEW employee_list2;
SELECT * FROM employee_list2;







