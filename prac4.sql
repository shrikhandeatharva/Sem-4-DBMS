DROP TABLE IF EXISTS Sailors;
DROP TABLE IF EXISTS Boats;
DROP TABLE IF EXISTS Reserves;

CREATE TABLE Sailors (SID number(5),sname varchar2(10),rating number(1.1),age number(3));
CREATE TABLE Boats (BID number(5),bname varchar2(10),color varchar2(10));
CREATE TABLE Reserves (SID number(5),BID number(5),day DATE);

INSERT INTO Sailors VALUES (1,'Amar',4.9,41),(2,'Vinay',4.7,34),(3,'Rohit',4.5,35),(4,'Sachin',4.8,49);
INSERT INTO Boats VALUES (1007,'Boat1','Green'),(1018,'Boat2','Red'),(1045,'Boat3','Blue'),(1010,'Boat4','Green'),(1035,'Boat5','Red');
INSERT INTO Reserves VALUES (1,1007,'7-July-2022'),(4,1010,'5-November-2022'),(2,1045,'30-April-2022'),(1,1018,'24-April-2022'),(3,1035,'14-March-2022');

SELECT * FROM Sailors;
SELECT * FROM Boats;
SELECT * FROM Reserves;

--Query1  find sailor's id who have reserved red boats or green boats
SELECT s.SID
FROM Sailors s 
WHERE s.SID IN (SELECT r.SID FROM Reserves r,Boats b WHERE b.color='Red' and b.BID=r.BID 
UNION
SELECT r.SID FROM Reserves r,Boats b WHERE b.color='Green' and b.BID=r.BID);

--Query2  find sailor names who have reserved both red and green boats
SELECT s.sname 
FROM Sailors s 
WHERE s.SID IN (SELECT r.SID FROM Reserves r,Boats b WHERE b.color='Red' and b.BID=r.BID 
INTERSECT 
SELECT r.SID FROM Reserves r,Boats b WHERE b.color='Green' and b.BID=r.BID);


--Query3  find sailor names who have reserved red but not green boats
SELECT s.sname 
FROM Sailors s 
WHERE s.SID IN (SELECT r.SID FROM Reserves r,Boats b WHERE b.color='Red' and b.BID=r.BID 
EXCEPT 
SELECT r.SID FROM Reserves r,Boats b WHERE b.color='Green' and b.BID=r.BID);