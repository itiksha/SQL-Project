select *  from [itiksha_mittal].[Price];


--let's see max price

select MAX(Price) as max_price 
from [itiksha_mittal].[Price];

-- let's see min price

select min(Price) as min_price
from [itiksha_mittal].[Price];

-- Let's remove question mark sign from the Price column
UPDATE [itiksha_mittal].[Price]
SET Price = REPLACE(Price, '?', '')
WHERE CHARINDEX('?', Price) > 0;

-- Remove % Sign from Rate Column
update [itiksha_mittal].[Price]
SET Rate = REPLACE(Rate, '%', '')


-- Let's remove no space with space 
update [itiksha_mittal].[Price]
SET Price = REPLACE(Price, '', ' ');

-- Let's do same Price column as it was before
update [itiksha_mittal].[Price]
set Price = REPLACE(Price, ' ', '');

-- What I can do with Settlement Date
select *, MAX(settlement_Date) as SD from [itiksha_mittal].[Price]
GROUP BY settlement_Date;

-- Let's calculate Yield to Maturity
SELECT settlement_Date, Maturity_Date, Price, Rate,
    ((100 + ((rate / 100) * DATEDIFF(day, settlement_Date, Maturity_Date))) / Price) - 1 AS yield_to_maturity
FROM [itiksha_mittal].[Price];

-- change type of Rate
Alter TABLE [itiksha_mittal].[Price]
Alter Column Rate int;

ALTER TABLE [itiksha_mittal].[Price]
ALTER COLUMN Rate DECIMAL(10, 2);


-- Analysing Price Volatility
SELECT settlement_Date, Price
FROM [itiksha_mittal].[Price]
ORDER BY settlement_Date;

-- Let's add Price 
select sum(Price) from [itiksha_mittal].[Price];

-- Let's change data type of column
Alter table [itiksha_mittal].[Price]
alter column Price numeric(10,2);

-- Update the column to set non-numeric values to NULL
UPDATE [itiksha_mittal].[Price]
SET Price = NULL
WHERE ISNUMERIC(Price) = 0;

-- Perform the conversion
ALTER TABLE [itiksha_mittal].[Price]
ALTER COLUMN Price varchar(30);

ALTER TABLE [itiksha_mittal].[Price]
ALTER COLUMN Price Numeric(10,2);

-- Let's see Meta Information

Select * from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Price';

-- Check info
EXEC sp_help '[itiksha_mittal].[Price]';
-- same query we can get using alt + F1

--Remove comma from Price Column
update [itiksha_mittal].[Price]
set Price = REPLACE(Price, ',', '');