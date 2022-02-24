create database jishu;

use employee
select * from departments;
select * from jobs;
alter table employees add  new_salary int ;
update employees set new_salary=new_salary+1;

declare @count int
set @count=1;
while (@count<41)
begin
update employees set new_salary=@count+1
end



/* Exercise-1 */

1. select * from employees,departments;
2. select hire_date, first_name+' ' +last_name as E_Name  from employees;
3. select first_name+' ' +last_name+ ' , ' +CAST (job_id as varchar) as E_name, first_name Title from employees;
4. select hire_date,first_name+' ' +last_name as E_name, department_id  from employees;
5. select salary,first_name+' ' +last_name as E_name from employees where salary>2000;
6. select CAST(employee_id as varchar)+ ' , ' +first_name+ ' , ' +last_name+ ' , ' +email+ ' , '+CAST(phone_number as varchar)+ ' , ' +CAST(hire_date as varchar)+ ' , '+CAST(job_id as varchar)+ ' , '+CAST(salary as varchar)+' , ' +CAST(manager_id as varchar)+ ' , ' +CAST(department_id as varchar) as THE_OUTPUT from employees;
7. select hire_date as Start_Date ,first_name+' ' +last_name as Name  from employees order by Start_Date asc;
8. select hire_date as Start_Date ,first_name+' ' +last_name as Name  from employees;
9. select first_name+ ' ' +last_name as Name , salary from employees order by salary desc;
10. select first_name , department_id,commission,salary from employees order by salary desc ;
11. select employees.last_name , jobs.job_title, employees.manager_id from employees INNER JOIN jobs ON employees.job_id = jobs.job_id where ISNULL(manager_id,1)=1; 
12. select last_name ,jobs.job_title,salary from employees
	inner join
	jobs 
	ON
	employees.job_id = jobs.job_id	
	where jobs.job_title ='Sales Representative' OR jobs.job_title ='Purchasing Clerk'
	AND
	salary!=2500 and salary!=3500 and salary!=5000; 

	
	select * from emp

/* Exercise-2 */

1. with result as
   (select last_name,ROW_NUMBER () over (order by(select NULL)) as 'rownum' from employees)
   select UPPER (left(last_name,1))+substring(last_name,2,LEN(last_name)) as Output from result where rownum between 2 and 5; /*(using LOWER just for understanding the concept otherwise use UPPER instead of it ) */
									
									/* OR */

  select Upper(left(last_name,1))+SUBSTRING(last_name,2,len(last_name)) as OUTPUT from employees where employee_id between 101 and 104;

						

2. select first_name + '-' + last_name as E_name , Joined_Month = DATENAME(m,hire_date) from employees;

3. alter table employees add new_salary int;
   update employees set new_salary = salary+(salary*10/100) where salary/2 >10000;
   select last_name,salary,case new_salary when ISNULL	(new_salary,1) then new_salary else salary+(salary*11.5/100+1500)end as updated_salary from employees;

4. select left(employees.employee_id,2)+'00'+SUBSTRING(cast(employees.employee_id as varchar),4,LEN(employees.employee_id))+'-E' as OUTPUT, employees.department_id,employees.salary,upper(jobs.job_title) as MANAGER_NAME from employees
   inner join
   jobs
   on
   employees.job_id= jobs.job_id;

5. select upper(left(last_name,1))+SUBSTRING(last_name,2,LEN(last_name)) as Last_Name, len(last_name) as Length from employees where last_name like 'J%' OR last_name like 'A%' OR last_name like 'M%' group by last_name

6. select last_name,right('$$$$$$$$$$$$' + cast(salary as varchar) ,15 ) as SALARY from employees; 
  

7. with result as(select last_name, REVERSE(last_name)as Reverse from employees)
   select last_name, Reverse, case when Reverse=last_name then 'YES' else 'NO'end as Palindrome from result 

8. select upper(left(first_name,1))+SUBSTRING(first_name,2,len(first_name)) as OUTPUT from employees; 

9. select SUBSTRING([street_address],CHARINDEX(' ',[street_address]),CHARINDEX(' ',[street_address],6)) from locations;

10. select left(first_name,1)+last_name+'@systechusa.com' from employees as email_address;

11.select employees.first_name , jobs.job_title from employees 
inner join 
jobs
 on employees.job_id=jobs.job_id
 where jobs.job_title='Trenna';

 select * from employees;




 





   
















/* sample */ 
create table emp
(
name varchar (100));

insert into emp (name) values ('NITIN');
select * from emp;

select name, REVERSE(name)as Reverse from emp
where name=REVERSE(name); 




	






/* SELECT a.id, a.name, a.num, b.date, b.roll
 FROM a
 INNER JOIN b ON a.id=b.id;*/  (INNER JOIN SYNTAX having table a and b with columns id, name, num and date, roll, id)

 alter table employees add new_salary int;
 alter table employees drop new_salary;
 select case new_salary when ISNULL	(new_salary,1) then new_salary else salary+(salary*11.5/100+1500)end as updated_salary
						
						from employees;