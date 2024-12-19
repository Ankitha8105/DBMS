--1.Create a Table
CREATE TABLE Employees(
	ID INT IDENTITY(1,1),
	Name VARCHAR(15),
	Salary DECIMAL(10,2)
	);

CREATE TABLE Department(
	DeptID INT,
	DeptName VARCHAR(10),
	Loc VARCHAR(25)
	);

--2. Alter a Table

ALTER TABLE Employees
ADD DeptID INT ;

ALTER TABLE Employees
ALTER COLUMN DeptID INT NOT NULL;

ALTER TABLE Employees
ADD CONSTRAINT EmployeePK PRIMARY KEY(ID);

ALTER TABLE Department
ALTER COLUMN DeptID INT NOT NULL;

ALTER TABLE Department
ADD CONSTRAINT DepartmentPK PRIMARY KEY(DeptID);

ALTER TABLE Employees
ADD CONSTRAINT EmployeesFK FOREIGN KEY(DeptID) REFERENCES Department(DeptID);

-- 3.Drop a Table
DROP TABLE Table_1;

--4.Rename a Column
EXEC sp_rename 'Employees.ID', 'EmployeeID', 'COLUMN';
