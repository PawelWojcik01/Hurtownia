IF OBJECT_ID('[HD].[dbo].[KategorieT]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[KategorieT]; 




CREATE TABLE [HD].[dbo].[KategorieT] (
    [Program] nvarchar(255),
    [Kategoria] nvarchar(255)
)



DECLARE kursorKat CURSOR FOR
SELECT [Program], [Kategoria]
  FROM [HD].[dbo].[Kategorie]
  DECLARE @ProgramTemp VARCHAR(50), @KategoriaTemp VARCHAR(50)

  OPEN kursorKat 
FETCH NEXT FROM kursorKat INTO @ProgramTemp, @KategoriaTemp
WHILE @@FETCH_STATUS = 0 
   BEGIN 
	  IF (@ProgramTemp IS NOT NULL) AND (@KategoriaTemp IS NOT NULL)
	  INSERT INTO [HD].[dbo].[KategorieT] ([Program], [Kategoria])
		VALUES (@ProgramTemp, @KategoriaTemp)
	;
		
      FETCH NEXT FROM kursorKat INTO @ProgramTemp, @KategoriaTemp 
	  
   END 
CLOSE kursorKat 
DEALLOCATE kursorKat

IF OBJECT_ID('[HD].[dbo].[Kategorie]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[Kategorie]; 

CREATE TABLE [HD].[dbo].[Kategorie] (
Program VARCHAR(50),
Kategoria VARCHAR(50));

INSERT INTO [HD].[dbo].[Kategorie]
SELECT * FROM [HD].[dbo].[KategorieT]

IF OBJECT_ID('[HD].[dbo].[KategorieT]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[KategorieT]; 





  
	CREATE TABLE [HD].[dbo].[KategorieT] (
    [Program] nvarchar(255),
    [Kategoria] nvarchar(255)
)

	DECLARE @SUBSTR INTEGER

	DECLARE kursorProgram CURSOR FOR

SELECT [Program], [Kategoria]
  FROM [HD].[dbo].[Kategorie]

  DECLARE @tempProgram VARCHAR(100), @tempProgram2 VARCHAR(100), @tempKategoria VARCHAR(100)

  OPEN kursorProgram 
FETCH NEXT FROM kursorProgram INTO @tempProgram, @tempKategoria
WHILE @@FETCH_STATUS = 0 
   BEGIN 
		SET @SUBSTR = CHARINDEX('[', @tempProgram)-2


	IF @SUBSTR > 0 
	begin
		SET @tempProgram2  = SUBSTRING(@tempProgram, 1, @SUBSTR)
	INSERT INTO [HD].[dbo].[KategorieT] ([Program], [Kategoria])
		VALUES (@tempProgram2, @tempKategoria)
	end
	ELSE 

	INSERT INTO [HD].[dbo].[KategorieT] ([Program], [Kategoria])
		VALUES (@tempProgram, @tempKategoria)
	;

      FETCH NEXT FROM kursorProgram INTO @tempProgram, @tempKategoria
	  
   END 
CLOSE kursorProgram 
DEALLOCATE kursorProgram

CREATE TABLE [dbo].[Channel](
	[Channel_ID] [bigint] NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[Kategoria] [varchar](50) NOT NULL,
	[Grupa] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED 
(
	[Channel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO




DECLARE kursorChannel2 CURSOR FOR
SELECT [HD].[dbo].[KategorieT].[Program], [HD].[dbo].[KategorieT].[Kategoria], [HD].[dbo].[Grupy_mediowe].[Grupa]

  FROM [HD].[dbo].[KategorieT], [HD].[dbo].[Grupy_mediowe]
where [HD].[dbo].[KategorieT].[Program] = [HD].[dbo].[Grupy_mediowe].[Program]

  DECLARE @Licznik_ID INTEGER, @NAZWA VARCHAR(50), @KATEGORIA VARCHAR(50), @GRUPA VARCHAR(50)
  SET @Licznik_ID = 1
  OPEN kursorChannel2
FETCH NEXT FROM kursorChannel2 INTO @NAZWA, @KATEGORIA, @GRUPA
WHILE @@FETCH_STATUS = 0 
   BEGIN 

	  INSERT INTO [HD].[dbo].[Channel] (Channel_ID, Nazwa, Kategoria, Grupa)
		VALUES (@Licznik_ID, @NAZWA, @KATEGORIA, @GRUPA)
		;
		SET @Licznik_ID = @Licznik_ID + 1
		
      FETCH NEXT FROM kursorChannel2 INTO @NAZWA, @KATEGORIA, @GRUPA 
	  
   END 
CLOSE kursorChannel2 
DEALLOCATE kursorChannel2


IF OBJECT_ID('[HD].[dbo].[KategorieT]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[KategorieT]; 

 IF OBJECT_ID('[HD].[dbo].[Kategorie]', 'U') IS NOT NULL 
 DROP TABLE [HD].[dbo].[Kategorie]; 
