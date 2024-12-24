--1.Write a query to demonstrate the use of TRY...CATCH blocks for handling exceptions.

	BEGIN TRY
		SELECT 1/0 AS Result;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrMsg
	END CATCH;

--2.Create a table for logging errors and write a query to insert error details when an exception occurs
	
	CREATE TABLE LogErr(Error_Num INT,ErrorLine INT,ErrorMsg VARCHAR(30),
						ErrProcedure VARCHAR(120),ErrDate DATE DEFAULT GETDATE());

	BEGIN TRY
		SELECT Salary/0 AS Res
		FROM Employees;
	END TRY
	BEGIN CATCH
		INSERT INTO LogErr(Error_Num,ErrorLine,ErrorMsg,ErrProcedure) VALUES(ERROR_NUMBER(),ERROR_LINE(),ERROR_MESSAGE(),ERROR_PROCEDURE())
	END CATCH;

--3.How to re-throw an error in SQL Server

	BEGIN TRY
		SELECT 1/0 AS Res;
	END TRY
	BEGIN CATCH
		PRINT 'Error caught. Re-throwing...';
		THROW;
	END CATCH;

--4.How to use THROW to raise custom errors
	
	BEGIN TRY
		THROW 50001,'Custom Error',1;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrMsg,ERROR_NUMBER() AS ErrNum;
	END CATCH;