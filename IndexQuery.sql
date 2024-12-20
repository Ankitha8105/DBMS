--1.create a simple index on a single column 
	CREATE INDEX IX_Countries
	ON Countries(Population ASC);

	CREATE NONCLUSTERED INDEX IX_ClusterIndex
	ON Countries(Continent ASC);

--2. create a composite index (multi-column index) on multiple columns

	CREATE CLUSTERED INDEX IX_Covid_StateWise
	ON covid_vaccine_statewise(State DESC,First_Dose_Administered DESC);

--3.Drop a simple index on a single column 
	DROP INDEX covid_vaccine_statewise.IX_Covid_StateWise;

--4.create a unique index to ensure that no duplicate values exist in a column
	CREATE UNIQUE INDEX IX_Employee_Name
	ON Employees(Name DESC);

--5. create a filtered index to improve performance on specific rows of data
	
	CREATE UNIQUE CLUSTERED INDEX IX_StateWise_Testing 
	ON StateWiseTestingDetails(TotalSamples DESC);

--6.check the existing indexes on a table in SQL Server
	EXECUTE sp_helpindex Employees;
