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


--Que1
SELECT ename FROM Emp_company WHERE salary IN (SELECT MAX(salary) FROM Emp_company); 

--Que2
SELECT e1.ename 
FROM Emp_company e1 
WHERE e1.salary IN (SELECT MAX(e2.salary) FROM Emp_company e2 GROUP BY e2.cname);

--Que3
SELECT cname,AVG(salary) FROM Emp_company WHERE cname!='ACC' GROUP BY cname;

--Que4
SELECT cname,AVG(salary)
FROM Emp_company 
WHERE ename IN (SELECT ename FROM employee WHERE city='Delhi') 
GROUP BY cname;

--Que5
SELECT e1.cname 
FROM Emp_company e1 
WHERE e1.cname=(SELECT cname FROM Emp_company WHERE salary=(SELECT MAX(salary) FROM Emp_company));

--Que6
SELECT COUNT(ename) FROM employee WHERE city='Bombay';

--Que7
SELECT e1.ename,e1.city 
FROM employee e1,Emp_company e2 
WHERE e2.salary IN (SELECT MAX(salary) FROM Emp_company WHERE cname='TATA') and e2.ename=e1.ename;