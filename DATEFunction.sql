--1.Current Date and Time
	SELECT GETDATE();
	
--2.Extract Year from a Date
	SELECT YEAR('2020-03-03');

--3.Find the Difference Between Two Dates
	SELECT DATEDIFF(DAY,'2001-12-19','2024-12-19');

--4.Get the Day of the Week
	SELECT DATENAME(WEEKDAY,'2024-12-19');

--5.Add Days to a Date
	SELECT DATEADD(DAY,2,'2024-12-19');