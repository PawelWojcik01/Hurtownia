IF OBJECT_ID('[HD].[dbo].[DaneT2]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[DaneT2]; 


SELECT *INTO [HD].[dbo].[DaneT2] FROM [HD].[dbo].[DaneT]
UNPIVOT (a FOR [Grupa] IN([Total Individuals],[Podgrupa],[A16-49],[M16-49],[A4-15],[A4-9])) up
PIVOT (MAX(a) FOR [Variable Target] IN([AMR],[AMR %],[SHR %],[RCH %],[RCH])) as p

