

/*----------------------------------------------------------ADVANCE SQL PROJECT 1-------------------------------------------------------------------*/


/*----------------------------------------------------------RAJ JADHAV AUG BATCH--------------------------------------------------------------------*/


/*----------------------------------------------------------HR DATABASE EXERCISE--------------------------------------------------------------------*/


USE hr;



/*-------Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name" -------*/

select first_name as "First Name", last_name as "Last Name"
FROM Employees;

/*------- Write a query to get unique department ID from employee table-------*/
select distinct department_id
from employees;

/*-------- Write a query to get all employee details from the employee table order by first name, descending--------*/

select * 
from employees
order by first_name desc;

/*---------Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary)----------*/

 
select concat(first_name,' ',last_name) as "names", salary, (0.15*salary) as PF
from employees;

/*---------- Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary--------*/

select employee_id, concat(first_name,' ' ,last_name) as "Names", salary
from employees
order by salary;

/*-----------Write a query to get the total salaries payable to employees----------*/

select sum(salary) as "total salary"
from employees;

/*-----------Write a query to get the maximum and minimum salary from employees table---------*/

select max(salary), min(salary)
from employees;

/*----------- Write a query to get the average salary and number of employees in the employees table---------*/

select avg(salary), count(employee_id)
from employees;

/*------------ Write a query to get the number of employees working with the company------------*/

select count(employee_id) 
from employees;

/*------------- Write a query to get the number of jobs available in the employees table------------*/

select count(distinct(job_id))
from employees;

/*---------- Write a query get all first name from employees table in upper case--------*/

select upper(first_name)
from employees;

/*---------- Write a query to get the first 3 characters of first name from employees table--------*/

select first_name,
left(first_name, 3)
from employees;

/*---------- Write a query to get first name from employees table after removing white spaces from both side---------*/

select trim(first_name)
from employees;

/*----------- Write a query to get the length of the employee names (first_name, last_name) from employees table----------*/

SELECT first_name, last_name, CONCAT(first_name,' ',last_name) , LENGTH(CONCAT(first_name,last_name))
FROM employees; 

/*----------- Write a query to check if the first_name fields of the employees table contains numbers-----------*/

select first_name
from employees
where first_name like '(0-9)';

/*Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000*/

select concat(first_name,' ',last_name) as "name", salary
from employees
where salary<10000 or salary>15000;

/*---- Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order----*/

select first_name, last_name, department_id
from employees
where department_id in (30, 100)
order by department_id;

/*-----Write a query to display the name (first_name, last_name) and salary for all employees
 whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100-----*/
 
 select first_name, last_name, salary, department_id
 from employees
 where salary not between 10000 and 15000 and department_id in (30, 100);
 
 /*----- Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987-----*/
 
 select first_name, last_name, hire_date
 from employees
 where year(hire_date)='1987';
 
 /*----- Write a query to display the first_name of all employees who have both "b" and "c" in their first name-----*/
 
 select first_name
 from employees
 where first_name  like'%b%'
 and first_name  like '%c%';
 
 /*-----Write a query to display the last name, job, and salary for all employees 
 whose job is that of a Programmer or a Shipping Clerk, and 
 whose salary is not equal to $4,500, $10,000, or $15,000-----*/
 
 select last_name, job_id, salary
 from employees
 where job_id in('it_prof', 'sh_clerk')
 and salary not in (4500, 10000, 15000);
 
 /*-----Write a query to display the last name of employees whose names have exactly 6 characters-----*/
 select last_name
 from employees
 where length(last_name)=6;
 
 /*----- Write a query to display the last name of employees having 'e' as the third character-----*/
 
 select last_name
 from employees
 where last_name like '__e%';

 
 /*
 Write a query to get the job_id and related employee's id Partial output of the query :  
job_id        Employees ID 
AC_ACCOUNT      206 
AC_MGR          205 
AD_ASST         200 
AD_PRES         100 
AD_VP           101 ,102 
FI_ACCOUNT      110 ,113 ,111 ,109 ,112
*/

select job_id, group_concat(employee_id separator ',')
from employees
group by job_id;

/*----- Write a query to update the portion of the phone_number in the employees table,
 within the phone number the substring '124' will be replaced by '999'-----*/
 
 update employees
 set phone_number = replace(phone_number, '124', '999');
select *
from employees
where phone_number LIKE '%999%';
 
 /*----- Write a query to get the details of the employees where the length of the first name greater than or equal to 8-----*/
 
select * 
from employees
where LENGTH(first_name) >= 8;

/*----- Write a query to append '@example.com' to email field-----*/

select email
from employees;
update employees
set email=concat(email, '@example.com');

/*----- Write a query to extract the last 4 character of phone-----*/

select right(phone_number, 4) as 'Phone No.' from employees; 

/*----- Write a query to get the last word of the street address-----*/

 
 select location_id, street_address, substring_index(street_address, " ", -1) as 'Last--word-of-street_address' 
 FROM locations;
 
 /*-----Write a query to get the locations that have minimum street length-----*/
 
select * from locations
where length(street_address) <= (select  MIN(LENGTH(street_address)) 
from locations);

/*-----Write a query to display the first word from those job titles which contains more than one words-----*/

select job_title, substr(job_title,1, instr(job_title, ' '))
from jobs;

/*-----Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position-----*/


select first_name, last_name, LENGTH(first_name)
from employees 
where instr(last_name,'C') > 2;

/*-----Write a query that displays the first name and the length of the first name for all employees 
whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. 
Sort the results by the employees' first names-----*/

 select first_name as "Name",
length(first_name)  as "Length"
from employees
where first_name like 'J%'
or first_name like 'M%'
or first_name like 'A%'
order by first_name ;

/*----- Write a query to display the first name and salary for all employees. 
Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY-----*/

select first_name,
lpad(salary, 10, '$') as salary
from employees;

/*-----Write a query to display the first eight characters of the employees' first names and indicates 
the amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary-----*/

select left(first_name, 8) as first_name,repeat('$', floor(salary/1000)) as 'SALARY($)', salary
from employees
order by salary desc;

/*----- Write a query to display the employees with their code, first name, last name and hire date 
who hired either on seventh day of any month or seventh month in any year-----*/

select employee_id, first_name, last_name, hire_date
from employees
where day(hire_date) = 7
or month(hire_date) = 7; 



/*----------------------------------------------------Northwind Database Exercises-----------------------------------------------------------------*/


USE northwind;



/*-----Write a query to get Product name and quantity/unit-----*/

select ProductName, QuantityPerUnit 
from Products;

/*-----Write a query to get current Product list (Product ID and name)-----*/

select ProductID, ProductName
from Products
where Discontinued = "0"
order by ProductName;

/*-----Write a query to get discontinued Product list (Product ID and name)-----*/

select ProductID, ProductName
from Products
where Discontinued = 1 
order by ProductName;

/*-----Write a query to get most expense and least expensive Product list (name and unit price)-----*/

select ProductName, UnitPrice 
from Products 
order by UnitPrice desc;

/*-----Write a query to get Product list (id, name, unit price) where current products cost less than $20-----*/

select ProductID, ProductName, UnitPrice
from Products
where (((UnitPrice)<20) and ((Discontinued)=0))
order by UnitPrice desc;

/*----- Write a query to get Product list (id, name, unit price) where products cost between $15 and $25-----*/

select ProductID, ProductName, UnitPrice
from Products
where ((UnitPrice)>=15 and (UnitPrice)<=25);

/*----- Write a query to get Product list (name, unit price) of above average price-----*/

select ProductName, UnitPrice
from Products
where UnitPrice > (select avg(UnitPrice) from products);

/*-----Write a query to get Product list (name, unit price) of ten most expensive products----*/ 

select ProductID, ProductName, UnitPrice
from products
order by UnitPrice desc
limit 10;

/*----- Write a query to count current and discontinued products-----*/

select
(case when Discontinued=0
Then 'Current_Products_Count'
else
'Discontinued_Products_Count'
End) as 'current & discontinued products',
Count(ProductName) as 'Products_Count'
from Products group by Discontinued;  

/*-----Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order-----*/

SELECT ProductName, UnitsOnOrder, UnitsInStock
FROM Products
WHERE ((UnitsInStock)<UnitsOnOrder); 




 
 













 

 



