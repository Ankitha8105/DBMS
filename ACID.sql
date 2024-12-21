--1.Atomicity Example Query

	SELECT * FROM Countries;

	BEGIN TRANSACTION
	UPDATE Countries
	SET CountryName = 'SriLanka'
	WHERE CountryID = 1

	INSERT INTO Countries VALUES(9,'India','POPULA','Asia')
	COMMIT;

	SELECT * FROM Countries;

	BEGIN TRANSACTION
	UPDATE Countries
	SET CountryName = 'SriLanka'
	WHERE CountryID = 1

	INSERT INTO Countries VALUES(9,'India',5678,'Asia')
	COMMIT;

--2.Consistency Query Example

	SELECT * FROM CovidStatistics;
	INSERT INTO CovidStatistics VALUES(12,6,'2021-01-19',65400,200000,700000);

--3.Durability Query
	UPDATE VaccinationData
	SET CountryID = 6
	WHERE CountryID=18;

	SELECT * FROM VaccinationData;

--4.Isolation
	BEGIN TRANSACTION;
	UPDATE VaccinationData
	SET FirstDose = FirstDose - 5
	WHERE CountryID = 1;

--Another Query Tab Isolation example  

	BEGIN TRANSACTION;
	UPDATE VaccinationData
	SET FirstDose = FirstDose + 10
	WHERE CountryID = 1;
	COMMIT;
