--1.Total Salary by Each Employee

SELECT SUM(Salary) as TotalSum
FROM Employees;

--2.Count of Number of Departments
SELECT COUNT(*) 
FROM Department

--3.Find MIN and MAX salary of a Employees
SELECT MAX(Salary) as MaxSal,MIN(Salary) as MinSal
FROM Employees;

--4.Find Aggragate of string
SELECT STRING_AGG(Name, '-') AS AggregatedNames
FROM Employees;

--5.Find Average salary
SELECT AVG(Salary)
FROM Employees;