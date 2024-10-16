create database views;
use views;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Insert some sample data
INSERT INTO employees VALUES
(1, 'John', 'Doe', 'IT', 75000),
(2, 'Jane', 'Smith', 'HR', 65000),
(3, 'Mike', 'Johnson', 'IT', 80000),
(4, 'Emily', 'Brown', 'Finance', 70000);

create view it_employee as
select id,first_name,last_name,salary 
from employees
where department= 'IT';

select * from it_employee;

show create view it_employee;

CREATE TABLE mv_it_employees (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

DELIMITER //
CREATE PROCEDURE refresh_mv_it_employees()
BEGIN
   INSERT INTO mv_it_employees
   select id,first_name,last_name,department,salary
   from employees
   where department='IT';
END 
//

-- CALL refresh_mv_it_employees();
create event refresh_mv_it_employees_daily
on schedule every 1 day
starts current_date + interval 1 day
do
   call refresh_mv_it_employees();


call refresh_mv_it_employees();
select * from mv_it_employees;
