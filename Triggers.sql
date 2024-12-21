select * from Employees;

CREATE TABLE Employee_Audit_Test(
ID int IDENTITY,
Audit_Action text);

--1.Create an AFTER INSERT Trigger
	CREATE TRIGGER Trigger_ForInsert
	ON Employees
	AFTER INSERT
	AS
	BEGIN
		DECLARE @ID INT;
		SELECT @ID = EmployeeID FROM inserted;

		INSERT INTO Employee_Audit_Test
		VALUES ('New Employee with ID = ' + CAST(@ID AS VARCHAR(10)) + 
				' is added at ' + CAST(GETDATE() AS VARCHAR(22)));
	END;

--2.INSTEAD OF DELETE Trigger

	CREATE TRIGGER Trigger_ForDelete
	ON Employees
	INSTEAD  OF DELETE
	AS
	BEGIN 
		DECLARE @ID INT;
		SELECT @ID = EmployeeID FROM deleted;

		INSERT INTO Employee_Audit_Test
		VALUES('New Employee with ID = ' + CAST(@ID AS VARCHAR(10)) + 
				' is added at ' + CAST(GETDATE() AS VARCHAR(22)))
	END;

--3.Access Virtual Tables

	CREATE TRIGGER Trigger_ForUpdte
	ON Employees
	INSTEAD OF UPDATE
	AS
	BEGIN
		SELECT * FROM inserted;
		SELECT * FROM deleted;
	END;

--4.Prevent Schema Changes (DDL Trigger)
	CREATE TRIGGER Trigger_PreventDrop
	ON EMPLOYEE
	AFTER DROP_TABLE
	AS
	BEGIN
		RAISERROR ('Dropping tables is not allowed in this database.', 16, 1);
		ROLLBACK;
	END;

--5.Disable Trigger
	DISABLE TRIGGER Trigger_ForInsert ON Employees;

--6.Enable Trigger
	ENABLE TRIGGER Trigger_ForInsert ON Employees;

--7.Drop a Trigger
	DROP TRIGGER Trigger_ForInsert;