CREATE DATABASE ORG; 

SHOW DATABASES; 

USE ORG; 
 
CREATE TABLE Worker ( 
 WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
 FIRST_NAME CHAR(25), 
 LAST_NAME CHAR(25), 
 SALARY INT, 
 JOINING_DATE DATETIME, 
 DEPARTMENT CHAR(25) 
);

 
INSERT INTO Worker  
 (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
  (1, 'Monika', 'Arora', 100000, '21-02-20 09:00:00', 'HR'), 
  (2, 'Niharika', 'Verma', 80000, '21-06-11 09:00:00', 'Admin'), 
  (3, 'Vishal', 'Singhal', 300000, '21-02-20 09:00:00', 'HR'), 
  (4, 'Amitabh', 'Singh', 500000, '21-02-20 09:00:00', 'Admin'), 
  (5, 'Vivek', 'Bhati', 500000, '21-06-11 09:00:00', 'Admin'), 
  (6, 'Vipul', 'Diwan', 200000, '21-06-11 09:00:00', 'Account'), 
  (7, 'Satish', 'Kumar', 75000, '21-01-20 09:00:00', 'Account'), 
  (8, 'Geetika', 'Chauhan', 90000, '21-04-11 09:00:00', 'Admin'); 
  
  select * from Worker;
 
CREATE TABLE Bonus ( 
 WORKER_REF_ID INT, 
 BONUS_AMOUNT INT, 
 BONUS_DATE DATETIME, 
 FOREIGN KEY (WORKER_REF_ID) 
  REFERENCES Worker(WORKER_ID) 
        ON DELETE CASCADE 
); 
 
INSERT INTO Bonus  
 (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES 
  (1, 5000, '23-02-20'), 
  (2, 3000, '23-06-11'), 
  (3, 4000, '23-02-20'), 
  (1, 4500, '23-02-20'), 
  (2, 3500, '23-06-11'); 
  
  select * from Bonus;
  
CREATE TABLE Title ( 
 WORKER_REF_ID INT, 
 WORKER_TITLE CHAR(25), 
 AFFECTED_FROM DATETIME, 
 FOREIGN KEY (WORKER_REF_ID) 
        REFERENCES Worker(WORKER_ID) 
        ON DELETE CASCADE 
);  
 
 
INSERT INTO Title  
 (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES 
 (1, 'Manager', '2023-02-20 00:00:00'), 
 (2, 'Executive', '2023-06-11 00:00:00'), 
 (8, 'Executive', '2023-06-11 00:00:00'), 
 (5, 'Manager', '2023-06-11 00:00:00'), 
 (4, 'Asst. Manager', '2023-06-11 00:00:00'), 
 (7, 'Executive', '2023-06-11 00:00:00'), 
 (6, 'Lead', '2023-06-11 00:00:00'), 
 (3, 'Lead', '2023-06-11 00:00:00'); 
 
 select * from Title;
 
 
-- Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>
Select FIRST_NAME AS WORKER_NAME from Worker; 


-- Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case. 
Select upper(FIRST_NAME) from Worker; 


-- Write an SQL query to fetch unique values of DEPARTMENT from the Worker table. 
Select distinct DEPARTMENT from Worker; 


-- Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table. 
Select substring(FIRST_NAME,1,3) from Worker; 


-- Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table. 
Select INSTR(FIRST_NAME, BINARY'a') from Worker where FIRST_NAME = 'Amitabh'; 


-- Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side. 
Select RTRIM(FIRST_NAME) from Worker; 


-- Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side. 
Select LTRIM(DEPARTMENT) from Worker; 


-- Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length. 
Select distinct length(DEPARTMENT) from Worker;


-- Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’. 
Select REPLACE(FIRST_NAME,'a','A') from Worker; 


-- Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME.
Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'FULL_NAME' from Worker; 


-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending. 
Select * from Worker order by FIRST_NAME asc; 


-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. 
Select * from Worker order by FIRST_NAME asc,DEPARTMENT desc; 


-- Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table. 
Select * from Worker where FIRST_NAME in ('Vipul','Satish'); 


-- Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table. 
Select * from Worker where FIRST_NAME not in ('Vipul','Satish');

 
-- Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”. 
Select * from Worker where DEPARTMENT like 'Admin%'; 


-- Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’. 
Select * from Worker where FIRST_NAME like '%a%'; 


-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’. 
Select * from Worker where FIRST_NAME like '%a'; 


-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
Select * from Worker where FIRST_NAME like '_____h'; 


-- Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000. 
Select * from Worker where SALARY between 100000 and 500000; 


-- Write an SQL query to print details of the Workers who joined in Feb 2021. 
Select * from Worker where year(JOINING_DATE) = 2021 and month(JOINING_DATE) = 2; 


--  Write an SQL query to fetch the count of employees working in the department ‘Admin’. 
SELECT COUNT(*) FROM worker WHERE DEPARTMENT = 'Admin'; 


-- Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000. 
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary 
FROM worker  
WHERE WORKER_ID IN  
(SELECT WORKER_ID FROM worker  
WHERE Salary BETWEEN 50000 AND 100000); 


-- Write an SQL query to fetch the number of workers for each department in descending order. 
SELECT DEPARTMENT, count(WORKER_ID) as No_Of_Workers  
FROM worker  
GROUP BY DEPARTMENT  
ORDER BY No_Of_Workers DESC; 


-- Write an SQL query to print details of the Workers who are also Managers. 
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE 
FROM Worker W 
INNER JOIN Title T 
ON W.WORKER_ID = T.WORKER_REF_ID 
AND T.WORKER_TITLE in ('Manager'); 


-- Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*) 
FROM Title 
GROUP BY WORKER_TITLE, AFFECTED_FROM 
HAVING COUNT(*) > 1; 


-- Write an SQL query to show only odd rows from a table. 
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0; 


-- Write an SQL query to show only even rows from a table. 
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0; 


-- Write a SQL query to create a new table using existing table without data.
CREATE TABLE WorkerClone LIKE Worker; 


-- Write an SQL query to show the current date. 
SELECT CURDATE(); 


-- Write SQL query to the current date and time: 
SELECT NOW();



-- Write an SQL query to show the top (say 10) records of a table. 
SELECT * FROM Worker ORDER BY Salary DESC LIMIT 10; 


-- Write an SQL query to determine the minimum  salary from a table.  
SELECT Salary FROM Worker ORDER BY Salary DESC LIMIT 7,1; 


-- Write an SQL query to determine the 5th highest salary without using the TOP or limit method. 
select Salary from (select Salary , dense_rank() over (order by Salary desc ) as position from Worker )
as ranked_salaries where position=5;


-- Write an SQL query to fetch the list of employees with the same salary. 

Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary  
from Worker W, Worker W1  
where W.Salary = W1.Salary  
and W.WORKER_ID != W1.WORKER_ID; 


--  Write an SQL query to show the second-highest salary from a table. 
Select max(Salary) from Worker  
where Salary not in (Select max(Salary) from Worker); 


-- Write an SQL query to show one row twice in the results from a table. 

select FIRST_NAME, DEPARTMENT from worker W where W.DEPARTMENT='HR'  
union all  
select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR'; 


-- Write an SQL query to fetch the first 50% of records from a table. 

SELECT * 
FROM WORKER 
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker); 


-- Write an SQL query to fetch the departments that have less than five people in them. 
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Worker 
GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5; 


-- Write an SQL query to show all departments along with the number of people in there.  
SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM Worker 
GROUP BY DEPARTMENT; 


-- Write an SQL query to show the last record from a table. 
Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker); 


-- Write an SQL query to fetch the first row of a table. 
Select * from Worker where WORKER_ID = (SELECT min(WORKER_ID) from Worker); 


-- Write an SQL query to fetch the last five records from a table. 
SELECT * FROM Worker order by WORKER_ID desc limit 5;


-- Write an SQL query to print the names of employees having the highest salary in each department. 

SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as 
TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew  
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT  
and TempNew.TotalSalary=t.Salary; 


-- Write an SQL query to fetch three max salaries from a table. 

SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct 
Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc; 


-- Write an SQL query to fetch three min salaries from a table. 
SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct 
Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc; 


-- Write an SQL query to fetch departments along with the total salaries paid for each of them. 
SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT; 


-- Write an SQL query to fetch the names of workers who earn the highest salary. 
SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from 
Worker); 