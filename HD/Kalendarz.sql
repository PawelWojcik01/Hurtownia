IF OBJECT_ID('[HD].[dbo].[Kalendarz]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[Kalendarz]; 

CREATE TABLE [HD].[dbo].[Kalendarz](
	[Kalendarz_ID] [bigint] NOT NULL,
	[Data] [date] NOT NULL,
	[Data_Rok] [varchar](4) NOT NULL,
	[Data_Miesiac] [varchar](2) NOT NULL,
	[Data_Dzien] [varchar](2) NOT NULL,
	[Start_time] [time](0) NOT NULL,
	[Start_time_med] [varchar](50) NOT NULL,
	[Duration] [time](0) NOT NULL

	
 CONSTRAINT [PK_Kalendarz] PRIMARY KEY CLUSTERED 
(
	[Kalendarz_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/* 
------------------------------------------------------------------------------------------------
*/
DECLARE kursorFirst CURSOR FOR

SELECT DISTINCT [HD].[dbo].[DaneT].[Description],[HD].[dbo].[DaneT].[2nd Description], [HD].[dbo].[DaneT].[Date], [HD].[dbo].[DaneT].[Start time], [HD].[dbo].[DaneT].[Duration]
  FROM [HD].[dbo].[DaneT]

  DECLARE @lICZNIK_KALENDARZ INTEGER, @DATE date, @START_TIME VARCHAR(50), @DURATION VARCHAR(50), @Date_Var VARCHAR(50), @V1 VARCHAR(50), @V2 VARCHAR(50),
  @DURATION_DATE time(0), @START_TIME_DATE time(0), @HOUR_TOMEDIA VARCHAR(50), @ROK VARCHAR(4), @MIESIAC VARCHAR(2), @DZIEN VARCHAR(2) 

  declare @lewa varchar(50),  @prawa varchar(50), @temp integer


  SET @lICZNIK_KALENDARZ = 1

  OPEN kursorFirst 
FETCH NEXT FROM kursorFirst INTO @V1, @V2, @Date_Var, @START_TIME, @DURATION
WHILE @@FETCH_STATUS = 0 
   BEGIN 

   SET @DURATION_DATE = CONVERT(time(0), @DURATION, 108)

		SET @lewa = left(@START_TIME,2); 
		SET @prawa = right(@START_TIME,6); 
		SET @DATE = CONVERT(date, @Date_Var, 105)

		set @temp = CONVERT(INT, @lewa)
		if @temp > 23
			begin
				set @temp = @temp - 24
				set @lewa = CONVERT(varchar(50), @temp)
				set @lewa = @lewa + @prawa
				set @START_TIME_DATE = convert(time(0), @lewa, 108)
				set @DATE = DATEADD(day, 1, @DATE)
			end
		else
		  begin
		    set @START_TIME_DATE = convert(time(0), @START_TIME, 108)
		  end


SET @ROK = left(@DATE,4); 
SET @prawa = right(@DATE,5);
SET @MIESIAC = left(@prawa, 2);
SET @DZIEN = right(@DATE, 2);


	  INSERT INTO [HD].[dbo].[Kalendarz] (Kalendarz_ID, Data, Data_Rok, Data_Miesiac, Data_Dzien, Start_time, Start_time_med, Duration)
		VALUES (@lICZNIK_KALENDARZ, @DATE, @ROK, @MIESIAC, @DZIEN, @START_TIME_DATE, @START_TIME, @DURATION_DATE)
		;
		SET @lICZNIK_KALENDARZ = @lICZNIK_KALENDARZ + 1
		
      FETCH NEXT FROM kursorFirst INTO @V1, @V2, @Date_Var, @START_TIME, @DURATION
	  
   END 
CLOSE kursorFirst 
DEALLOCATE kursorFirst

/* 
-----------------------------------------------------------------------------------------------
*/



 