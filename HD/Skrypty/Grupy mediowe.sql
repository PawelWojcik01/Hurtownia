
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
	  SET @GRUPA2 = @PROGRAM
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