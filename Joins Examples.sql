Create Table itiksha_mittal.Participant (

id int,
first_name varchar (50),
last_name varchar (50)

);

insert into itiksha_mittal.Participant 
   (id, first_name, last_name) 
values
(1,	'Amisha',	'Brown'),
(2,	'Jamaal',	'Sanford'),
(3,	'Hiba',	'Cameron');

select * from itiksha_mittal.Participant;


Create Table itiksha_mittal.jump (

id int,
participant_id int,
contest_id int,
length int

);

insert into itiksha_mittal.jump 

(id, participant_id, contest_id,length) 

values
(1,	1,	1,	667),
(2,	1,	2,	745),
(3,	1,	3,	723),
(4,	2,	1,	736),
(5,	2,	2,	669),
(6,	2,	3,	508),
(7,	3,	1,	664),
(8,	3,	2,	502),
(9,	3,	3,	739)

select * from itiksha_mittal.jump;

-- join on another table 
SELECT
  first_name,
  last_name,
  length
FROM itiksha_mittal.participant
join itiksha_mittal.jump on 
itiksha_mittal.participant.id = itiksha_mittal.jump.id;

-- Let's keep alias name for table
SELECT
  p.first_name,
  p.last_name,
  j.length
FROM itiksha_mittal.participant p
join itiksha_mittal.jump j on
p.id = j.id ;

-- Let's try with Inner join
SELECT
  p.first_name,
  p.last_name,
  j.length
FROM itiksha_mittal.participant p
Inner join itiksha_mittal.jump j on
p.id = j.id ;

-- Inner Join and Join are equivalent and can be used interchangeably. They both return rows that have matching values in both tables based on the specified join condition

-- Let's try with outer join
SELECT
  p.first_name,
  p.last_name,
  j.length
FROM itiksha_mittal.participant p
Outer join itiksha_mittal.jump j on
p.id = j.id ;
-- we can't apply Outer Join in this context

-- Let's try with Left Join
SELECT
  p.first_name,
  p.last_name,
  j.length
FROM itiksha_mittal.participant p
Left join itiksha_mittal.jump j on
p.id = j.id ;
-- If Left join is applied in the query, it will retrieve all values from left table. In the cases there is no match found in the right table, null values will be displayed in those respective rows.

-- Let's try with Right Join
SELECT
  p.first_name,
  p.last_name,
  j.length
FROM itiksha_mittal.participant p
Right Join itiksha_mittal.jump j on
p.id = j.id ;

-- If Right join is applied in the query, it will retrieve all values from Right table. In cases there is no match found in the left table, null values will be displayed in those respective rows. 