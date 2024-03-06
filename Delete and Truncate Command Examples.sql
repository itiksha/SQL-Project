Select * from [itiksha_mittal].[Customer];

-- Delete Command to remove 
DELETE FROM [itiksha_mittal].[Customer]
WHERE [Dept_id] IS NULL OR [Salary] is null;

-- Let's try something else
DELETE FROM [itiksha_mittal].[Customer]
WHERE [Name] = 'Agam' AND  [Salary] = 12000;

-- Let's try something else
DELETE FROM [itiksha_mittal].[Customer]
WHERE [Name] IS 'Agam' AND  [Salary] IS 12000;

-- Let's try something else
DELETE FROM [itiksha_mittal].[Customer]
WHERE [Dept_id] = 1 AND  [Salary] = 12000;
-- will remove Ankit

-- Truncate
TRUNCATE TABLE [itiksha_mittal].[Customer];

-- Delete Command can roll back but Truncate Command can't 
