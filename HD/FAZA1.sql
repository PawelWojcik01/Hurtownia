IF OBJECT_ID('[HD].[dbo].[kat]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[kat]; 

CREATE TABLE [HD].[dbo].[kat] (
program VARCHAR(50),
kanal VARCHAR(50));

DECLARE kursor CURSOR FOR
SELECT [F1]
      ,[TVP Group (12)]
  FROM [HD].[dbo].[Grupy_mediowe]
  DECLARE @F1 VARCHAR(50), @TV VARCHAR(50)
  DECLARE @GRUPA VARCHAR(50)
  SET @GRUPA = 'TVP Group (12)'
  OPEN kursor 
FETCH NEXT FROM kursor INTO @F1, @TV
WHILE @@FETCH_STATUS = 0 
   BEGIN 
	  IF @F1 IS NULL
	  SET @GRUPA = @TV;
	  ELSE 

	  INSERT INTO [HD].[dbo].[kat] (program, kanal)
		VALUES (@TV, @GRUPA);
      FETCH NEXT FROM kursor INTO @F1, @TV 
	  
   END 
CLOSE kursor 
DEALLOCATE kursor

SELECT * FROM [HD].[dbo].[kat]