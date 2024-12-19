--1.Find the Length of a String

	SELECT LEN(Name)
	FROM Employees;

--2.Convert to Lowercase

	SELECT LOWER(DeptName)
	FROM Department;

--3.Extract a Substring
	SELECT SUBSTRING(Name,1,3)
	FROM Employees;

--4.Replace Substring
	SELECT REPLACE('HELLOWORLD','WORLD','DISHA');

-- 5.Concatenate Strings
	SELECT CONCAT(DeptName,' ',Loc)
	FROM Department;

--6.Trim Leading and Trailing Spaces
	SELECT LTRIM('    HELLO'),RTRIM('WORLD     ');

--7.Find Position of Substring
	SELECT CHARINDEX('A' , Name)
	FROM Employees;

--8.Extract Rightmost Characters
	SELECT RIGHT(Name,2)
	FROM Employees;

--9.Reverse a String
	SELECT REVERSE(Name)
	FROM Employees;

--10. Find Substring
	SELECT PATINDEX(Name,'A')
	FROM Employees;
