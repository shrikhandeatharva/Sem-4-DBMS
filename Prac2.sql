DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee(ename varchar2(10),city varchar2(10));
INSERT INTO Employee VALUES ('Sunil','Madras'),('Vijay','Madras'),('Amar','Pune'),('Atharva','Bengaluru');
SELECT * FROM Employee;
DROP TABLE IF EXISTS Emp_Company;
CREATE TABLE Emp_Company(ename varchar2(10),cname varchar2(10),salary number(7,2),jdate date);
INSERT INTO Emp_Company VALUES ('Sunil','ACC',5000,'01-SEP-2027'),('Vijay','ACC',40000,'01-SEP-2027'),('Amar','Microsoft',6000,'01-SEP-2027'),('Atharva','Google',60000,'01-SEP-2027');
SELECT * FROM Emp_Company;          
DROP TABLE IF EXISTS Company;
CREATE TABLE Company(cname varchar2(10),city varchar2(10));
INSERT INTO Company VALUES('ACC','Madras'),('TATA','Bengaluru'),('Microsoft','Pune'),('Google','Bengaluru');
SELECT * FROM Company;
DROP TABLE IF EXISTS Manager;
CREATE TABLE Manager(ename varchar2(10),mname varchar2(10));
INSERT INTO Manager VALUES ('Sunil','Sharvari'),('Vijay','Sunil'),('Amar','Mahi'),('Atharva','Rucha');
SELECT * FROM Manager;
DROP TABLE IF EXISTS Emp_Shift;
CREATE TABLE Emp_Shift(ename varchar2(10),shift varchar2(10));
INSERT INTO Emp_Shift VALUES('Sunil','A'),('Vijay','A'),('Amar','B'),('Atharva','C');
SELECT * FROM Emp_Shift; 

-- decrease the salary of vijay by 100 if sunil and vijay are living in city madras 
UPDATE Emp_Company 
SET salary = salary - 100
WHERE ename = 'Vijay' and 
EXISTS(SELECT ename FROM Employee 
WHERE ename = 'Vijay' AND city = 'Madras' AND city IN
(SELECT city FROM Employee
 WHERE ename = 'Sunil'));
 SELECT * FROM Emp_Company;

--all emplyees of acc having salary greater ehan 8000 are shifted to tata
UPDATE Emp_Company 
 SET cname = 'TATA' 
 WHERE salary > 8000 and cname = 'ACC';
 SELECT * FROM Emp_Company;

--decreasing the salary of employee vijay by 100 and increase the salary of employee sunil by 100
 UPDATE Emp_Company 
 SET salary = salary - 100
 WHERE ename = 'Vijay';
 UPDATE Emp_Company 
 SET salary = salary + 100
 WHERE ename = 'Sunil';
 SELECT * FROM Emp_Company;

--delete the rows of emp_company having salary greater than 8000
DELETE FROM Emp_Company 
WHERE salary > 8000;
SELECT * FROM Emp_Company;



