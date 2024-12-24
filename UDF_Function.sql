--1.Create a scalar user-defined function named GetFullName that takes two input parameters: FirstName and LastName. The function should return the full name
	
	CREATE FUNCTION udf_GetFullName(@Name VARCHAR(7),@LastName VARCHAR(9))
	RETURNS VARCHAR(30)
	AS
	BEGIN
		RETURN @Name+' '+@LastName
	END;

	SELECT dbo.udf_GetFullName('Pooja','Donwadi')

--2.Create a scalar function to calculate the Commission
	
	CREATE FUNCTION udf_commfun(@Salary FLOAT,@CommPercent FLOAT)
	RETURNS FLOAT
	AS
	BEGIN
		RETURN @Salary - (@Salary * @CommPercent/100)
	END;

	SELECT dbo.udf_commfun(40000.8,12.2) ;
		
--3.Create an inline table-valued function to get employees earning above a threshold.

	CREATE FUNCTION GetHighSalaryEmployees(@ThresholdValue DECIMAL(10,2))
	RETURNS TABLE
	AS
	RETURN
		(SELECT EmployeeId, Name,  Salary FROM Employees WHERE Salary > @ThresholdValue);

	SELECT * FROM dbo.GetHighSalaryEmployees(2039.4);

--4.Multi-Statement Table-Valued Function
	CREATE FUNCTION GetEmployeesByDepartment(@DeptID INT)
	RETURNS @Employeestable TABLE (EmployeeID INT,Name VARCHAR(15),Salary FLOAT)
	AS
	BEGIN
		INSERT INTO @Employeestable
		SELECT EmployeeID,Name,Salary FROM Employees WHERE DeptID = @DeptID;
		RETURN
	END;

	SELECT * FROM dbo.GetEmployeesByDepartment(3);
