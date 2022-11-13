use OrganizationDB;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 100000, 14-02-20, 'HR');
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(002, 'Niharika', 'Verma', 80000, 14-06-11 , 'Admin');
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(003, 'Vishal', 'Singhal', 300000, 14-02-20, 'HR');
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(004, 'Amitabh', 'Singh', 500000, 14-02-20 , 'Admin');
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(005, 'Vivek', 'Bhati', 500000, 14-06-11 , 'Admin');
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(006, 'Vipul', 'Diwan', 200000, 14-06-11, 'Account');
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(007, 'Satish', 'Kumar', 75000, 14-01-20, 'Account');
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(008, 'Geetika', 'Chauhan', 90000, 14-04-11, 'Admin');


select*from Worker;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT Int,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, 16-02-20);
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(002, 3000, 16-06-11);
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(003, 4000, 16-02-20);
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 4500, 16-02-20);
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(002, 3500, 16-06-11);

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
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

 --Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
 Select FIRST_NAME AS WORKER_NAME from Worker;

 --Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
 Select upper(FIRST_NAME) from Worker;

 --Write an SQL query to print the first three characters of  FIRST_NAME from Worker table
 Select substring(FIRST_NAME,1,3) from Worker;

 --Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
 Select INSTR(FIRST_NAME, BINARY'a') from Worker where FIRST_NAME = 'Amitabh';

 --Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side
 Select RTRIM(FIRST_NAME) from Worker;

 --Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side
 Select LTRIM(DEPARTMENT) from Worker;

 -- Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length
 Select distinct length(DEPARTMENT) from Worker;

 --Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’
 Select REPLACE(FIRST_NAME,'a','A') from Worker;

 --Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them
 Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from Worker;


 -- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending
Select * from Worker order by FIRST_NAME asc;

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending
Select * from Worker order by FIRST_NAME asc,DEPARTMENT desc;


--Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table

Select * from Worker where FIRST_NAME in ('Vipul','Satish');

--Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.

Select * from Worker where FIRST_NAME not in ('Vipul','Satish');

--Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”

Select * from Worker where DEPARTMENT like 'Admin%';

--Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’
Select * from Worker where FIRST_NAME like '%a%';


--Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
Select * from Worker where FIRST_NAME like '%a';

--Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets
Select * from Worker where FIRST_NAME like '_____h';

--Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
Select * from Worker where SALARY between 100000 and 500000;

--Write an SQL query to print details of the Workers who have joined in Feb’2014.
Select * from Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;

--Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(*) FROM worker WHERE DEPARTMENT = 'Admin';

--Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);

--Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM worker 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC;

--Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

--Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

--Write an SQL query to show only odd rows from a table.

SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;

--Write an SQL query to show only even rows from a table
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;

--Write an SQL query to clone a new table from another table

SELECT * INTO WorkerClone FROM Worker;

--Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone);

--Write an SQL query to show records from one table that another table does not have.

SELECT * FROM Worker
MINUS
SELECT * FROM Title;

--Write an SQL query to show the current date and time.
SELECT CURDATE();

--Write an SQL query to show the top n (say 10) records of a table.
SELECT TOP 10 * FROM Worker ORDER BY Salary DESC;

--Write an SQL query to determine the nth (say n=5) highest salary from a table.

SELECT TOP 1 Salary
FROM (
 SELECT DISTINCT TOP 3 Salary
 FROM Worker 
 ORDER BY Salary DESC
 )
ORDER BY Salary ASC;

--Write an SQL query to determine the 5th highest salary without using TOP or limit method.

SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );

 --Write an SQL query to fetch the list of employees with the same salary
 Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;

--Write an SQL query to show the second highest salary from a table.

Select max(Salary) from Worker 
where Salary not in (Select max(Salary) from Worker);

--Write an SQL query to show one row twice in results from a table.
select FIRST_NAME, DEPARTMENT from worker W where W.DEPARTMENT='HR' 
union all 
select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR';

-- Write an SQL query to fetch intersecting records of two tables.
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone);

--Write an SQL query to fetch the first 50% records from a table.
SELECT *
FROM WORKER
WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);

--Write an SQL query to fetch the departments that have less than five people in it.
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;

--Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT;

-- Write an SQL query to show the last record from a table.
Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker);

--Write an SQL query to fetch the first row of a table.
Select * from Worker where WORKER_ID = (SELECT min(WORKER_ID) from Worker);

--Write an SQL query to fetch the last five records from a table.
SELECT * FROM Worker WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM Worker W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5;


--Write an SQL query to print the name of employees having the highest salary in each department.

SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;

 --Write an SQL query to fetch three max salaries from a table.
 SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;


 --Write an SQL query to fetch three min salaries from a table.
 SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc;

 --Write an SQL query to fetch nth max salaries from a table.

 SELECT distinct Salary from worker a WHERE n >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;

 --Write an SQL query to fetch departments along with the total salaries paid for each of them
 SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT;

 --Write an SQL query to fetch the names of workers who earn the highest salary
 SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker);