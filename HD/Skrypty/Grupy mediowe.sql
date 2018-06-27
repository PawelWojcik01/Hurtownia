DELETE FROM [HD].[dbo].[Kategorie]
WHERE Kategoria = '`'

IF OBJECT_ID('[HD].[dbo].[kat]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[kat]; 

CREATE TABLE [HD].[dbo].[kat] (
Program VARCHAR(50),
Grupa VARCHAR(50));


DECLARE kursor CURSOR FOR
SELECT Program, Grupa
  FROM [HD].[dbo].[Grupy_mediowe]
  DECLARE @LICZNIK VARCHAR(50), @PROGRAM VARCHAR(50)
  DECLARE @GRUPA2 VARCHAR(50)
  OPEN kursor 
FETCH NEXT FROM kursor INTO @LICZNIK, @PROGRAM
WHILE @@FETCH_STATUS = 0 
   BEGIN 
	  IF @LICZNIK IS NULL
	  SET @GRUPA2 = substring(@PROGRAM, 1, charindex(' Group', @PROGRAM, 1))
	  ;

	  ELSE 
	  
	  INSERT INTO [HD].[dbo].[kat] (Program, Grupa)
		VALUES (@PROGRAM, @GRUPA2)
		;
		
      FETCH NEXT FROM kursor INTO @LICZNIK, @PROGRAM 
	  
   END 
CLOSE kursor 
DEALLOCATE kursor

IF OBJECT_ID('[HD].[dbo].[Grupy_mediowe]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[Grupy_mediowe]; 

CREATE TABLE [HD].[dbo].[Grupy_mediowe] (
Program VARCHAR(50),
Grupa VARCHAR(50));

INSERT INTO [HD].[dbo].[Grupy_mediowe]
SELECT * FROM [HD].[dbo].[kat]

IF OBJECT_ID('[HD].[dbo].[kat]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[kat]; 


  INSERT INTO [MediaGroup] (MediaGroupName)
SELECT distinct [Grupa]
FROM [Grupy_mediowe]


INSERT INTO [MediaGroup] (MediaGroupName)
VALUES ('UNKNOWN')




DECLARE kursorKategorie CURSOR FOR
SELECT distinct [Kategoria]
  FROM [HD].[dbo].[Kategorie]
  DECLARE @Kategoria VARCHAR(50)
  OPEN kursorKategorie 
FETCH NEXT FROM kursorKategorie INTO @Kategoria
WHILE @@FETCH_STATUS = 0 
   BEGIN 
	  SET @Kategoria = substring(@Kategoria, 1, charindex(' category', @Kategoria, 1))
	  INSERT INTO [HD].[dbo].[Category] (CategoryName)
		VALUES (@Kategoria)

      FETCH NEXT FROM kursorKategorie INTO @Kategoria
   END 
CLOSE kursorKategorie 
DEALLOCATE kursorKategorie




CREATE TABLE [HD].[dbo].[kat] (
Program VARCHAR(50),
Kategoria VARCHAR(50));





DECLARE kursorKategorie2 CURSOR FOR
SELECT [Program], [Kategoria]
  FROM [HD].[dbo].[Kategorie]
  DECLARE @Kategoria2 VARCHAR(50), @Program2 VARCHAR(50)
  DECLARE @Licznik2 int = 0;
  OPEN kursorKategorie2 
FETCH NEXT FROM kursorKategorie2 INTO @Program2, @Kategoria2
WHILE @@FETCH_STATUS = 0 
   BEGIN 
	  SET @Licznik2 = charindex(' [', @Program2, 1)

	  IF @Licznik2 > 0 
   	  SET @Program2 = substring(@Program2, 1, charindex(' [', @Program2, 1))
	  SET @Kategoria2 = substring(@Kategoria2, 1, charindex(' category', @Kategoria2, 1))
	  INSERT INTO [HD].[dbo].[kat] (Program, Kategoria)
		VALUES (@Program2, @Kategoria2)

		;
      FETCH NEXT FROM kursorKategorie2 INTO @Program2, @Kategoria2
   END 
CLOSE kursorKategorie2 
DEALLOCATE kursorKategorie2






IF OBJECT_ID('[HD].[dbo].[Kategorie]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[Kategorie]; 

CREATE TABLE [HD].[dbo].[Kategorie] (
Program VARCHAR(50),
Kategoria VARCHAR(50));



  INSERT INTO [Kategorie] ([Program], [Kategoria])
SELECT *
FROM [kat]


IF OBJECT_ID('[HD].[dbo].[kat]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[kat]; 



  INSERT INTO [Channel] ([ChannelName], [CategoryID], [MediaGroupID])
SELECT [Kategorie].[Program], [Category].[CategoryID], [MediaGroup].[MediaGroupID]
FROM ((([Kategorie]
LEFT JOIN [Category] ON [Category].[CategoryName] = [Kategorie].[Kategoria])
LEFT JOIN [Grupy_mediowe] ON [Grupy_mediowe].[Program] = [Kategorie].[Program])
LEFT JOIN [MediaGroup] ON [MediaGroup].[MediaGroupName] = [Grupy_mediowe].[Grupa])



UPDATE [Channel]
SET [MediaGroupID] = 20
WHERE [MediaGroupID] IS NULL


INSERT INTO [HD].[dbo].[TargetGroup] ([TargetName],[TargetCode])
SELECT [Nazwa],[Kod]
FROM [HD].[dbo].[Targets]

INSERT INTO [HD].[dbo].[TargetGroup]
VALUES ('Podgrupa', 'Podgrupa');

INSERT INTO [HD].[dbo].[TargetGroup]
VALUES ('Total Individuals', 'Total Individuals');



IF OBJECT_ID('[HD].[dbo].[Grupy_mediowe]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[Grupy_mediowe]; 

IF OBJECT_ID('[HD].[dbo].[Kategorie]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[Kategorie]; 

IF OBJECT_ID('[HD].[dbo].[Targets]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[Targets]; 



