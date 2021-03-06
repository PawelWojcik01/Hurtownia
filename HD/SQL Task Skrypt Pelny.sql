/*
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





/*
-----------------------------------------------------

*/



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

/*








*/


DECLARE kursorChannel CURSOR FOR
SELECT [HD].[dbo].[KategorieT].[Program], [HD].[dbo].[KategorieT].[Kategoria], [HD].[dbo].[Grupy_mediowe].[Grupa]

  FROM [HD].[dbo].[KategorieT], [HD].[dbo].[Grupy_mediowe]
where [HD].[dbo].[KategorieT].[Program] = [HD].[dbo].[Grupy_mediowe].[Program]

  DECLARE @Licznik_ID INTEGER, @NAZWA VARCHAR(50), @KATEGORIA VARCHAR(50), @GRUPA VARCHAR(50)
  SET @Licznik_ID = 1
  OPEN kursorChannel
FETCH NEXT FROM kursorChannel INTO @NAZWA, @KATEGORIA, @GRUPA
WHILE @@FETCH_STATUS = 0 
   BEGIN 

	  INSERT INTO [HD].[dbo].[Channel] (Channel_ID, Nazwa, Kategoria, Grupa)
		VALUES (@Licznik_ID, @NAZWA, @KATEGORIA, @GRUPA)
		;
		SET @Licznik_ID = @Licznik_ID + 1
		
      FETCH NEXT FROM kursorChannel INTO @NAZWA, @KATEGORIA, @GRUPA 
	  
   END 
CLOSE kursorChannel 
DEALLOCATE kursorChannel


IF OBJECT_ID('[HD].[dbo].[KategorieT]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[KategorieT]; 

 IF OBJECT_ID('[HD].[dbo].[Kategorie]', 'U') IS NOT NULL 
 DROP TABLE [HD].[dbo].[Kategorie]; 











*/

/*

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

  */

  /*










  */
/*


IF OBJECT_ID('[HD].[dbo].[DaneTemp]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[DaneTemp]; 

CREATE TABLE [HD].[dbo].[DaneTemp] (
	[Date] varchar(50),
    [Channel] varchar(100),
    [Description] varchar(100),
    [2nd Description] varchar(100),
    [Start time] varchar(50),
    [Duration] varchar(50),
    [Variable Target] varchar(50),
    [Total Individuals] varchar(50),
    [Podgrupa] varchar(50),
    [A16-49] varchar(50),
    [M16-49] varchar(50),
    [A4-15] varchar(50),
    [A4-9] varchar(50),
	[column13] varchar(50)
  )


DECLARE kursor1 CURSOR FOR
SELECT *
  FROM [HD].[dbo].[DaneT]
  DECLARE @Date VARCHAR(50), @Channel VARCHAR(100), @Description VARCHAR(100), @2ndDescription VARCHAR(100), @StartTime VARCHAR(50), @Duration VARCHAR(50), @VariableTarget VARCHAR(50),
   @TotalIndividuals VARCHAR(50), @Podgrupa VARCHAR(50), @A16_49 VARCHAR(50), @M16_49 VARCHAR(50), @A4_15 VARCHAR(50), @A4_9 VARCHAR(50), @column13 varchar(50)
  DECLARE @DateTemp VARCHAR(50), @ChannelTemp VARCHAR(100), @DescriptionTemp VARCHAR(100), @2ndDescriptionTemp VARCHAR(100), @StartTimeTemp VARCHAR(50), @DurationTemp VARCHAR(50), @VariableTargetTemp VARCHAR(50),
   @TotalIndividualsTemp VARCHAR(50), @PodgrupaTemp VARCHAR(50), @A16_49Temp VARCHAR(50), @M16_49Temp VARCHAR(50), @A4_15Temp VARCHAR(50), @A4_9Temp VARCHAR(50), @column13Temp varchar(50)

  OPEN kursor1 

FETCH NEXT FROM kursor1 INTO  @Date, @Channel, @Description, @2ndDescription, @StartTime, @Duration, @VariableTarget, @TotalIndividuals, @Podgrupa, @A16_49, @M16_49, @A4_15, @A4_9, @column13
WHILE @@FETCH_STATUS = 0 
   BEGIN 
	  IF @Date = ''
	    SET @Date = @DateTemp;
	  ELSE 
		SET @DateTemp = @Date;

	IF @Channel = ''
	    SET @Channel = @ChannelTemp;
	  ELSE 
		SET @ChannelTemp = @Channel;

	IF @Description = ''
	    SET @Description = @DescriptionTemp;
	  ELSE 
		SET @DescriptionTemp = @Description;

	IF @2ndDescription = ''
	    SET @2ndDescription = @2ndDescriptionTemp;
	  ELSE 
		SET @2ndDescriptionTemp = @2ndDescription;

	IF @StartTime = ''
	    SET @StartTime = @StartTimeTemp;
	  ELSE 
		SET @StartTimeTemp = @StartTime;

	IF @Duration = ''
	    SET @Duration = @DurationTemp;
	  ELSE 
		SET @DurationTemp = @Duration;

	IF @VariableTarget = ''
	    SET @VariableTarget = @VariableTargetTemp;
	  ELSE 
		SET @VariableTargetTemp = @VariableTarget;

	IF @TotalIndividuals = ''
	    SET @TotalIndividuals = @TotalIndividualsTemp;
	  ELSE 
		SET @TotalIndividualsTemp = @TotalIndividuals;

	IF @Podgrupa = ''
	    SET @Podgrupa = @PodgrupaTemp;
	  ELSE 
		SET @PodgrupaTemp = @Podgrupa;

	IF @A16_49 = ''
	    SET @A16_49 = @A16_49Temp;
	  ELSE 
		SET @A16_49Temp = @A16_49;

	IF @M16_49 = ''
	    SET @M16_49 = @M16_49Temp;
	  ELSE 
		SET @M16_49Temp = @M16_49;

	IF @A4_15 = ''
	    SET @A4_15 = @A4_15Temp;
	  ELSE 
		SET @A4_15Temp = @A4_15;

	IF @A4_9 = ''
	    SET @A4_9 = @A4_9Temp;
	  ELSE 
		SET @A4_9Temp = @A4_9;

	IF @column13 = ''
	    SET @column13 = @column13Temp;
	  ELSE 
		SET @column13Temp = @column13;

	  INSERT INTO [HD].[dbo].[DaneTemp] ([Date], [Channel], [Description], [2nd Description], [Start time], [Duration], [Variable Target], [Total Individuals], [Podgrupa], [A16-49], [M16-49], [A4-15], [A4-9], [column13] )
	  VALUES (@DateTemp, @ChannelTemp, @DescriptionTemp, @2ndDescriptionTemp, @StartTimeTemp, @DurationTemp, @VariableTargetTemp, @TotalIndividualsTemp, @PodgrupaTemp, @A16_49Temp, @M16_49Temp, @A4_15Temp, @A4_9Temp, @column13Temp)
      FETCH NEXT FROM kursor1 INTO @Date, @Channel, @Description, @2ndDescription, @StartTime, @Duration, @VariableTarget, @TotalIndividuals, @Podgrupa, @A16_49, @M16_49, @A4_15, @A4_9, @column13
	  
   END 
CLOSE kursor1 
DEALLOCATE kursor1





IF OBJECT_ID('[HD].[dbo].[DaneT]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[DaneT]; 

CREATE TABLE [HD].[dbo].[DaneT] (
	[Date] varchar(50),
    [Channel] varchar(100),
    [Description] varchar(100),
    [2nd Description] varchar(100),
    [Start time] varchar(50),
    [Duration] varchar(50),
    [Variable Target] varchar(50),
    [Total Individuals] varchar(50),
    [Podgrupa] varchar(50),
    [A16-49] varchar(50),
    [M16-49] varchar(50),
    [A4-15] varchar(50),
    [A4-9] varchar(50)
	)

INSERT INTO [HD].[dbo].[DaneT]([Date], [Channel], [Description], [2nd Description], [Start time], [Duration], [Variable Target], [Total Individuals], [Podgrupa], [A16-49], [M16-49], [A4-15], [A4-9] )
SELECT [Date], [Channel], [Description], [2nd Description], [Start time], [Duration], [Variable Target], [Total Individuals], [Podgrupa], [A16-49], [M16-49], [A4-15], [A4-9]
FROM [HD].[dbo].[DaneTemp]

IF OBJECT_ID('[HD].[dbo].[DaneTemp]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[DaneTemp]; 

*/


USE [HD]
GO

/****** Object:  Table [dbo].[SecondDescription]    Script Date: 16.05.2018 14:47:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
/*
CREATE TABLE [dbo].[SecondDescription](
	[SecondDescription_ID] [bigint] NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SecondDescription] PRIMARY KEY CLUSTERED 
(
	[SecondDescription_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

*/



USE [HD]
GO

/****** Object:  Table [dbo].[Description]    Script Date: 16.05.2018 14:47:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
/*
CREATE TABLE [HD].[dbo].[Description](
	[Description_ID] [bigint] NOT NULL,
	[Nazwa] [varchar](100) NOT NULL,
	[NazwaSecond] [varchar](100)NOT NULL,
 CONSTRAINT [PK_Description] PRIMARY KEY CLUSTERED 
(
	[Description_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


*/





USE [HD]
GO

/****** Object:  Table [dbo].[Channel]    Script Date: 16.05.2018 14:45:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
/*
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


*/



USE [HD]
GO

/****** Object:  Table [dbo].[Dane]    Script Date: 16.05.2018 14:47:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Dane](
	[Dane_ID] [bigint] NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[Start_time] [varchar](50) NOT NULL,
	[Duration] [varchar](50) NOT NULL,
	[Channel_ID] [bigint] NOT NULL,
	[Description_ID] [bigint] NOT NULL,
	[Grupa] [varchar](50) NOT NULL,
	[AMR] [varchar](50) NOT NULL,
	[AMR%] [varchar](50) NOT NULL,
	[SHR%] [varchar](50) NOT NULL,
	[RCH%] [varchar](50) NOT NULL,
	[RCH] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dane] PRIMARY KEY CLUSTERED 
(
	[Dane_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Dane]  WITH NOCHECK ADD  CONSTRAINT [FK_Dane_Channel] FOREIGN KEY([Channel_ID])
REFERENCES [dbo].[Channel] ([Channel_ID])
GO

ALTER TABLE [dbo].[Dane] CHECK CONSTRAINT [FK_Dane_Channel]
GO

ALTER TABLE [dbo].[Dane]  WITH NOCHECK ADD  CONSTRAINT [FK_Dane_Description] FOREIGN KEY([Description_ID])
REFERENCES [dbo].[Description] ([Description_ID])
GO

ALTER TABLE [dbo].[Dane] CHECK CONSTRAINT [FK_Dane_Description]
GO


/*

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
UZUPEŁNIENIE SECOND DESCRIPTION
*/



/*

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
UZUPEŁNIENIE DESCRIPTION
*/
/*
DECLARE kursorFirst CURSOR FOR

SELECT DISTINCT [HD].[dbo].[DaneT].[Description],[HD].[dbo].[DaneT].[2nd Description]
  FROM [HD].[dbo].[DaneT]

  DECLARE @NazwaSecond VARCHAR(100), @Licznik_ID2 INTEGER, @NDesc VARCHAR(100)
  SET @Licznik_ID2 = 1

  OPEN kursorFirst 
FETCH NEXT FROM kursorFirst INTO @NDesc, @NazwaSecond
WHILE @@FETCH_STATUS = 0 
   BEGIN 
	  INSERT INTO [HD].[dbo].[Description] (Description_ID, Nazwa, NazwaSecond)
		VALUES (@Licznik_ID2, @NDesc, @NazwaSecond)
		;
		SET @Licznik_ID2 = @Licznik_ID2 + 1
		
      FETCH NEXT FROM kursorFirst INTO @NDesc, @NazwaSecond
	  
   END 
CLOSE kursorFirst 
DEALLOCATE kursorFirst
*/

/*

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
UZUPEŁNIENIE CHANNEL
*/
