--1.Write a query to assign ranks to employees, with the same salary getting the same rank.

	SELECT Name,LastName,
		  RANK() OVER(ORDER BY Salary DESC)
	FROM Employees;

--2.How to find the nth highest salary using the RANK() function
	
	WITH RankedSalary AS(
	SELECT Salary,RANK() OVER(ORDER BY Salary DESC) AS Rank
	FROM Employees)

	SELECT Salary
	FROM RankedSalary
	WHERE Rank = 2;
	
--3.Write a query to calculate a 3-day moving average of sales.
	
	SELECT  OrderQty,ProductID,AVG(UnitPrice) OVER(ORDER BY UnitPrice ROWS 2 PRECEDING )
	FROM Sales.SalesOrderDetail;

--4.Show how RANK() and DENSE_RANK() behave differently when there are ties.

	SELECT NAME,LastName,Salary,
	RANK() OVER (ORDER BY Salary DESC) AS RankFun,
	DENSE_RANK() OVER (ORDER BY Salary DESC) AS DenseRank
	FROM Employees;


--5.Write a query to calculate the rank of employees within each department based on their salary.

	SELECT Name,Salary,
	RANK() OVER (PARTITION BY DeptID ORDER BY SALARY DESC) AS Res
	FROM Employees;