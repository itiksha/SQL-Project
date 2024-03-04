-- Create Table
CREATE TABLE itiksha_mittal.StudentScores (
    StudentName VARCHAR(50),
    Week1Score INT,
    Week2Score INT,
    Week3Score INT
);

-- Insert some sample data
INSERT INTO itiksha_mittal.StudentScores (StudentName, Week1Score, Week2Score, Week3Score)
VALUES 
    ('Alice', 80, 85, 90),
    ('Bob', 75, 70, 80),
    ('Charlie', 90, 88, 92);

-- return a table
select * from itiksha_mittal.StudentScores;

-- Unpivot the columns
SELECT StudentName, WeekNumber, Score
FROM (
    SELECT StudentName, Week1Score, Week2Score, Week3Score
    FROM itiksha_mittal.StudentScores
) AS s
UNPIVOT (
    Score FOR WeekNumber IN (Week1Score, Week2Score, Week3Score)
) AS unpvt;
  
-- test it

Select StudentName, WeekNumber, Score 
from (
select StudentName, Week1Score, Week2Score, Week3Score 
from itiksha_mittal.StudentScores) as s 
unpivot (Score FOR WeekNumber IN (Week1Score, Week2Score, Week3Score) ) AS unpvt; 

-- we are not Defining WeekNumber, Score

-- example 
CREATE TABLE itiksha_mittal.monthly_sales(empid INT, jan INT, feb INT, mar INT, april INT);

INSERT INTO itiksha_mittal.monthly_sales VALUES
    (1,  100, 200, 300, 100),
    (2,  100, 300, 150, 200),
    (3,  200, 400, 100, 50);

-- UNPIVOT example
SELECT * FROM itiksha_mittal.monthly_sales
    UNPIVOT(sales FOR month IN (jan, feb, mar, april)) as unpvt_data
    ORDER BY empid;

-- Use Case Statement to Pivot the Data

Select 'jan' as Month, sum(jan) as Total from [itiksha_mittal].[monthly_sales]
union
Select 'feb' as Month, sum(feb) as Total from [itiksha_mittal].[monthly_sales] 
union
Select 'mar' as Month, sum(mar) as Total from [itiksha_mittal].[monthly_sales]
union
Select 'april' as Month, sum(april) as Total from [itiksha_mittal].[monthly_sales] 

-- Let's see if we keep different aliases for each column then it return what's on the first line # Try it and test it
Select 'jan' as Jan, sum(jan) as Total from [itiksha_mittal].[monthly_sales]
union
Select 'feb' as Feb, sum(feb) as Total from [itiksha_mittal].[monthly_sales] 
union
Select 'mar' as Mar, sum(mar) as Total from [itiksha_mittal].[monthly_sales]
union
Select 'april' as Apr, sum(april) as Total from [itiksha_mittal].[monthly_sales] 


-- Let's try changing column name and 1st column values
Select 'one' as Jan, sum(jan) as Total from [itiksha_mittal].[monthly_sales]
union
Select 'two' as Feb, sum(feb) as Total from [itiksha_mittal].[monthly_sales] 
union
Select 'three' as Mar, sum(mar) as Total from [itiksha_mittal].[monthly_sales]
union
Select 'four' as Apr, sum(april) as Total from [itiksha_mittal].[monthly_sales] 