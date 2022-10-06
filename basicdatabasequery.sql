--Show only 2 members whose points are more than 1000.
select top 2 * from database_assignment.dbo.customers  where points > 1000;

--Find the customers whose age is in 1980 to 1990 or points less than 1000.
select * from database_assignment.dbo.customers where Points <1000 or DateofBirth BETWEEN '01-01-1980' and '01-01-1990';

--Order the customers by points in ascending and descending order.
select * from database_assignment.dbo.customers order by points ASC
select * from database_assignment.dbo.customers order by points DESC 

--Find the customer whose name contains 'burgh' using like and regexp.
select * from database_assignment.dbo.customers where LastName like '%burgh';
select * from database_assignment.dbo.customers where LastName REGEXP 'burgh';

--Find the customer who does not have phone number.
select * from database_assignment.dbo.customers where Phone is NULL;

--Change the 'Date of Birth' column name into 'dob'.
alter table database_assignment.dbo.customers rename DateofBirth to dob date

--Find the max point holder customer.
SELECT * from database_assignment.dbo.customers where points in (select MAX(Points) from database_assignment.dbo.customers);

/*Execute a query for the following scenario.
If customers have points less than 1000, they are bronze member.
If customers have points more than 1000 and less than 2000, they are silver member.
If customers have points more than 2000 and less than 3000, they are gold member.
If customers have points more than 3000, they are platinum member.*/

SELECT FirstName, LastName, DateofBirth ,Phone ,Address ,City ,State ,Points,
CASE
    WHEN Points < 1000 THEN 'Bronze Member'
    WHEN Points > 1000 and Points < 2000 THEN 'Silver Member'
    WHEN Points > 2000 and Points < 3000 THEN 'Gold Member'
    ELSE  'Platinum Member'
END as Membership
FROM database_assignment.dbo.customers