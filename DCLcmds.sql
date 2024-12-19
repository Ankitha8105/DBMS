CREATE LOGIN DishaUser WITH PASSWORD = 'Disha@123';
CREATE USER DishaUser FOR LOGIN DishaUser

-- 1.Grant Permissions

GRANT SELECT 
ON Employees
TO DishaUser;

-- 2.Revoke Permissions

REVOKE SELECT
ON Employees
FROM DishaUser