--1.Create a stored procedure named GetEmployeeDetails that retrieves all records from an Employees table. Execute the stored procedure

	CREATE PROCEDURE sp_GetEmployeeDetails
	AS
	BEGIN
		SELECT EmployeeID,Name,Salary,DeptID FROM Employees
	END;

	EXECUTE sp_GetEmployeeDetails;

--2.Stored Procedure with Input Parameters

	CREATE PROCEDURE sp_GetEmployeeById @EmployeeID as int
	AS
	BEGIN
		SELECT EmployeeID,Name,Salary,DeptID FROM Employees WHERE EmployeeID=@EmployeeID
	END;

	EXECUTE sp_GetEmployeeById 2;

--3.Stored Procedure with Output Parameters

	CREATE PROCEDURE sp_GetTotalEmployees 
	@EmployeeCount int output
	AS
	BEGIN
		SELECT @EmployeeCount = COUNT(EmployeeID) FROM Employees 
	END;

	Declare @EmployeeTotal int
	Execute sp_GetTotalEmployees  @EmployeeTotal output
	Print @EmployeeTotal

--4.Stored Procedure with Multiple Parameters

	CREATE PROCEDURE sp_InsertNewEmployee
	@Name VARCHAR(10),
	@Salary FLOAT
	AS
	BEGIN
		SELECT EmployeeID,Name,Salary,DeptID FROM Employees WHERE Name = @Name AND Salary = @Salary
	END;

	EXECUTE sp_InsertNewEmployee @Name='Pooja',@Salary=100.9;

--5.Stored Procedure with Conditional Logic

	CREATE PROCEDURE sp_updateDeptID
	@EmployeeID INT
	AS
	BEGIN
		UPDATE Employees
		SET DeptID = 6
		WHERE EmployeeID = @EmployeeID
	END;

	EXECUTE sp_updateDeptID 2;

select * from Employee_Audit_Test;
execute sp_help;
select * from sys.messages