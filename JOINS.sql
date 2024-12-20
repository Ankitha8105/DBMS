SELECT * FROM Countries;

SELECT * FROM CovidStatistics;

SELECT * FROM VaccinationData;
--1. To find out the death percentage locally and globally

	select c.CountryID ,(sum(cs.Deaths)/sum(cs.ConfirmedCases))*100 as LocalPercent
	from Countries as c join CovidStatistics as cs
	on c.CountryID = cs.CountryID
	where c.CountryID = 2
	group by c.CountryID;

	SELECT (sum(Deaths)/sum(ConfirmedCases))*100 as GolbalPercent
	FROM CovidStatistics;

--2.To find out the infected population percentage locally and globally

	SELECT c.CountryID,( c.Population / SUM(cs.ConfirmedCases)) * 100 AS LocalPercent
	FROM Countries as c join CovidStatistics as cs
	on c.CountryID = cs.CountryID
	WHERE c.CountryID = 2
	GROUP BY c.CountryID,c.Population;

	SELECT c.CountryID,( c.Population / SUM(cs.ConfirmedCases)) * 100 AS GobalPercent
	FROM Countries as c join CovidStatistics as cs
	on c.CountryID = cs.CountryID
	WHERE c.CountryID != 2
	GROUP BY c.CountryID,c.Population;

--3.To find out the countries with the highest infection rates
	SELECT TOP 1 c.CountryID, c.CountryName, (CAST(cs.ConfirmedCases AS FLOAT) / c.Population) * 100 AS InfectionRate
	FROM Countries AS c JOIN  CovidStatistics AS cs
    ON c.CountryID = cs.CountryID
	WHERE cs.ConfirmedCases > 0 AND c.Population > 0  
	ORDER BY InfectionRate DESC;

--4. To find out the countries and continents with the highest death counts
	SELECT TOP 1 c.CountryName,c.Continent,(SUM(cs.Deaths)*1.0/SUM(cs.ConfirmedCases))*100 AS DeathCount
	FROM Countries AS c JOIN CovidStatistics AS cs
	ON c.CountryID = cs.CountryID
	GROUP BY c.CountryName,c.Continent
	ORDER BY DeathCount DESC;

--5. Average number of deaths by day (Continents and Countries)
	SELECT SUM(cs.Deaths)/COUNT(cs.Deaths) AS AvgDeaths
	FROM Countries AS c JOIN CovidStatistics AS cs
	ON c.CountryID = cs.CountryID
	GROUP BY DAY(cs.Date);

--6.Average of cases divided by the number of population of each country (TOP 10)
	SELECT TOP 10 c.CountryName,(SUM(c.Population)/SUM(cs.ConfirmedCases))*100 AS AvgCases
	FROM CovidStatistics AS cs JOIN Countries AS c
	ON c.CountryID = cs.CountryID
	GROUP BY c.CountryName;

--7.Considering the highest value of total cases, which countries have the highest rate of infection in relation to population?
	SELECT TOP 1 c.CountryName, c.Population, cs.ConfirmedCases, (CAST(cs.ConfirmedCases AS FLOAT) / c.Population) * 100 AS InfectionRate
	FROM Countries AS c JOIN CovidStatistics AS cs ON c.CountryID = cs.CountryID
	ORDER BY InfectionRate DESC;

--8. To find out the population vs the number of people vaccinated
	SELECT c.Population,vd.FirstDose
	FROM Countries AS c JOIN VaccinationData AS vd
	ON c.CountryID = VD.CountryID

--9.To find out percentage of people who took both the doses
	SELECT (SUM(c.Population)/SUM(vd.FirstDose))*100 + (SUM(c.Population)/SUM(vd.SecondDose))*100 AS DosePercent
	FROM VaccinationData AS vd JOIN Countries AS c
	ON c.CountryID = vd.CountryID
	GROUP BY c.CountryID;

--10.Find the countries with the highest number of confirmed COVID cases (grouped by continent), where the total number of confirmed cases is greater than 200000.
	SELECT TOP 1 c.Continent,MAX(cs.ConfirmedCases)
	FROM Countries AS c JOIN CovidStatistics AS cs
	ON c.CountryID = cs.CountryID
	GROUP BY c.Continent
	HAVING SUM(cs.ConfirmedCases) > 500000;
