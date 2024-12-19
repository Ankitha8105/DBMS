--1.Insert Data

INSERT INTO Department VALUES(1,'CSE','Banglore');
INSERT INTO Department VALUES(2,'CSE','Banglore'),
							 (3,'IOT','MUMBAI'),
							 (4,'CIVIL','HYDRABAD');

INSERT INTO Employees  VALUES('POOJA',40000,2),
							 ('ANKITHA',60000,1),
							 ('DISHA',45000,4),
							 ('VIJJU',40000,3),
							 ('PUSHPA',40000,3);

SELECT * FROM Employees;
SELECT * FROM Department;

--2.Update Data 

UPDATE Employees
SET Salary = 65000
WHERE EmployeeID = 3;

SELECT * FROM Employees;

-- 3.Delete Data
DELETE FROM Employees WHERE EmployeeID = 5;

-- 4.Select Data
SELECT * 
FROM Employees
WHERE Salary > 40000;