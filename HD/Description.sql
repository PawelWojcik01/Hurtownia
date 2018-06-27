IF OBJECT_ID('[HD].[dbo].[DescriptionT]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[DescriptionT]; 


CREATE TABLE [HD].[dbo].[DescriptionT](
	[Description_ID] [bigint] NOT NULL,
	[Nazwa] [varchar](100) NOT NULL,
	[NazwaSecond] [varchar](100)NOT NULL,
 CONSTRAINT [PK_Description] PRIMARY KEY CLUSTERED 
(
	[Description_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


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