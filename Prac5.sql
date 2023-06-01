DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Emp_Company;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS Manager;
DROP TABLE IF EXISTS Emp_Shift; 

CREATE TABLE Employee(ename varchar2(10),city varchar2(10));
CREATE TABLE Emp_Company(ename varchar2(10),cname varchar2(10),salary number(7,2),jdate date);
CREATE TABLE Company(cname varchar2(10),city varchar2(10));
CREATE TABLE Manager(ename varchar2(10),mname varchar2(10));
CREATE TABLE Emp_Shift(ename varchar2(10),shift varchar2(10));

INSERT INTO Employee values ('Sunil','Madras'),('Vijay','Madras'),('Amar','Delhi'),('Atharva','Delhi'),('Amish','Bombay');
INSERT INTO Emp_Company values ('Sunil','ACC',5000,'01-SEP-2027'),('Vijay','TATA',40000,'01-SEP-2027'),('Amar','Microsoft',6000,'01-SEP-2027'),('Atharva','Google',60000,'01-SEP-2027'),('Amish','TATA',30000 ,'02-SEP-2027');
INSERT INTO Company values('ACC','Madras'),('TATA','Bengaluru'),('Microsoft','Bombay'),('Google','Delhi'),('Microsoft','Bombay');
INSERT INTO Manager values ('Sunil','Sharvari'),('Vijay','Sunil'),('Amar','Mahi'),('Atharva','Rucha'),('Amish','Sam');
INSERT INTO Emp_Shift values('Sunil','A'),('Vijay','A'),('Amar','B'),('Atharva','C'),('Amish','D');

SELECT * FROM Employee;
SELECT * FROM Emp_Company;          
SELECT * FROM Company;
SELECT * FROM Manager;
SELECT * FROM Emp_Shift;


--Que1  list the name of employee having maximum salary
SELECT ename FROM Emp_company WHERE salary IN (SELECT MAX(salary) FROM Emp_company); 

--Que2  list the names of employees having maximum salary in their company 
SELECT e1.ename 
FROM Emp_company e1 
WHERE e1.salary IN (SELECT MAX(e2.salary) FROM Emp_company e2 GROUP BY e2.cname);

--Que3  find the average salary of each company except 'acc'
SELECT cname,AVG(salary) FROM Emp_company WHERE cname!='ACC' GROUP BY cname;

--Que4  find the average salary of company only for those employees living in delhi
SELECT cname,AVG(salary)
FROM Emp_company 
WHERE ename IN (SELECT ename FROM employee WHERE city='Delhi') 
GROUP BY cname;

--Que5  find the name of company having the highest average salary
SELECT e1.cname 
FROM Emp_company e1 
WHERE e1.cname=(SELECT cname FROM Emp_company WHERE salary=(SELECT MAX(salary) FROM Emp_company));

--Que6 list the number of employees living in bombay
SELECT COUNT(ename) FROM employee WHERE city='Bombay';

--Que7  list the name of employees with his living city having mximum salary in company tata
SELECT e1.ename,e1.city 
FROM employee e1,Emp_company e2 
WHERE e2.salary IN (SELECT MAX(salary) FROM Emp_company WHERE cname='TATA') and e2.ename=e1.ename;