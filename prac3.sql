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

INSERT INTO Employee values ('Sunil','Madras'),('Vijay','Madras'),('Amar','Bombay'),('Atharva','Delhi');
INSERT INTO Emp_Company values ('Sunil','ACC',5000,'01-SEP-2027'),('Vijay','TATA',40000,'01-SEP-2027'),('Amar','Microsoft',6000,'01-SEP-2027'),('Atharva','Google',60000,'01-SEP-2027');
INSERT INTO Company values('ACC','Madras'),('TATA','Bengaluru'),('Microsoft','Delhi'),('Google','Delhi');
INSERT INTO Manager values ('Sunil','Sharvari'),('Vijay','Sunil'),('Amar','Mahi'),('Atharva','Rucha');
INSERT INTO Emp_Shift values('Sunil','A'),('Vijay','A'),('Amar','B'),('Atharva','C');

SELECT * FROM Employee;
SELECT * FROM Emp_Company;          
SELECT * FROM Company;
SELECT * FROM Manager;
SELECT * FROM Emp_Shift;

SELECT e.ename,e.city FROM Employee e WHERE e.ename IN(SELECT ec.ename FROM Emp_Company ec WHERE ec.cname = "ACC");

SELECT e.ename FROM Employee e WHERE e.city='Bombay' and EXISTS (SELECT c.city FROM Company c WHERE c.city='Delhi');


SELECT e.ename FROM Employee e WHERE e.city IN (SELECT e1.city FROM Employee e1 WHERE e1.ename='Sunil'); 

SELECT e2.ename
FROM Employee e1 , Employee e2
WHERE e1.ename = 'Sunil' and 
e2.city = e1.city; 