--1.How do you create a simple view from a table to show specific columns with a filter condition
	CREATE VIEW CountriesByVaccinDataView AS
	SELECT c.CountryID,c.CountryName,vd.Date,vd.VaccineType
	FROM Countries AS c JOIN VaccinationData AS vd
	ON c.CountryID = vd.CountryID

--2.Alter The View From The View Table
	UPDATE CountriesByVaccinDataView
	SET CountryName = 'INDIA'
	WHERE CountryID = 1;

--3.use aggregate functions (such as COUNT, SUM, AVG) within a view to calculate Total Deaths
	CREATE VIEW TotalDeathView AS
	SELECT C.CountryName , SUM(CS.Deaths) AS TotalDeaths
	FROM Countries AS C JOIN CovidStatistics AS CS
	ON C.CountryID = CS.CountryID
	GROUP BY C.CountryName;

--4.How do you drop a view from the database
	DROP VIEW CountriesByVaccinDataView;

--5.How can you create a view that combines data from multiple tables using complex joins
	CREATE VIEW LeftJionView AS
	SELECT CS.Date,C.CountryName,CS.ConfirmedCases,CS.Recovered
	FROM Countries AS C LEFT JOIN CovidStatistics AS  CS
	ON C.CountryID = CS.CountryID;

--6.Display View Table
	SELECT * FROM LeftJionView;
	SELECT * FROM TotalDeathView;
	