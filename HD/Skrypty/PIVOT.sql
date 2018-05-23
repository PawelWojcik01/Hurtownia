
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Date]
      ,[Channel]
      ,[Description]
      ,[2nd Description]
      ,[Start time]
      ,[Duration]
      ,[Variable Target]
      ,[Total Individuals]
      ,[Podgrupa]
      ,[A16-49]
      ,[M16-49]
      ,[A4-15]
      ,[A4-9]
  FROM [HD].[dbo].[DaneT]




SELECT [Variable Target],  
    [first pivoted column] AS <column name>,  
    [second pivoted column] AS <column name>,  
    ...  
    [last pivoted column] AS <column name>  
FROM  
    (<SELECT query that produces the data>)   
    AS <alias for the source query>  
PIVOT  
(  
    <aggregation function>(<column being aggregated>)  
FOR   
[<column that contains the values that will become column headers>]   
    IN ( [first pivoted column], [second pivoted column],  
    ... [last pivoted column])  
) AS <alias for the pivot table>  
<optional ORDER BY clause>;  



IF OBJECT_ID('[HD].[dbo].[DanePiv]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[DanePiv]; 

CREATE TABLE [HD].[dbo].[DanePiv] (
    [Variable Target] varchar(50),
    [Total Individuals] varchar(50),
    [Podgrupa] varchar(50),
    [A16-49] varchar(50),
    [M16-49] varchar(50),
    [A4-15] varchar(50),
    [A4-9] varchar(50),
  )

INSERT INTO  [HD].[dbo].[DanePiv] ([Variable Target], [Total Individuals], [Podgrupa], [A16-49], [M16-49], [A4-15], [A4-9])
SELECT [Variable Target], [Total Individuals], [Podgrupa], [A16-49], [M16-49], [A4-15], [A4-9]
FROM [HD].[DBO].[DaneT]



/*

888888888888888888888888888888888888888888888888888888


*/


SELECT name, [AMR]
FROM
  ( SELECT [Variable Target]
              , name
			  , value

  FROM [HD].[dbo].[DanePiv]

          UNPIVOT 
		  (
		  value FOR name IN
            (
				[Total Individuals], [Podgrupa], [A16-49], [M16-49], [A4-15], [A4-9]
			)
         ) unpiv  
) src
   PIVOT (
        	VAR(
			   value
		   )
        FOR [Variable Target] IN
           (
		       [AMR]
		   )
         ) piv

/*

888888888888888888888888888888888888888888888888888888


*/
select name, Red
from
(
  select color, name, value
  from [hd].[dbo].[yourtable]
  unpivot
  (
    value for name in (Paul, John, Tim, Eric)
  ) unpiv
) src
pivot
(
  sum(value)
  for color in ([Red], [Green], [Blue])
) piv





IF OBJECT_ID('[hd].[dbo].yourTable', 'U') IS NOT NULL 
  DROP TABLE [hd].[dbo].yourTable; 

CREATE TABLE [hd].[dbo].yourTable([color] varchar(5), [Paul] int, [John] int, [Tim] int, [Eric] int);

INSERT INTO [hd].[dbo].[yourTable]
    ([color], [Paul], [John], [Tim], [Eric])
VALUES
    ('Red', 1, 5, 1, 3),
    ('Green', 8, 4, 3, 5),
    ('Blue', 2, 2, 9, 1);


	select * from [hd].[dbo].yourTable