IF OBJECT_ID('[HD].[dbo].[CalendarDate]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[CalendarDate]; 

CREATE TABLE [HD].[dbo].[CalendarDate](
	[Date] datetime NULL,
	)

DECLARE kursor CURSOR FOR
SELECT DISTINCT [Date], [Start time] 
    FROM [HD].[dbo].[DaneT]
  DECLARE @datetime datetime
  DECLARE @date VARCHAR(50)
  DECLARE @time VARCHAR(50)
  DECLARE @tempHour INTEGER

  OPEN kursor 
FETCH NEXT FROM kursor INTO @date, @time
WHILE @@FETCH_STATUS = 0 
   BEGIN 
      
	  SET @tempHour = CONVERT(INTEGER, LEFT(@time,2))

	  IF @tempHour > 23
	  begin
	 
		SET @datetime = CONVERT(datetime,RIGHT(@date,4)+ '-' + SUBSTRING(@date,4,2) + '-' +LEFT(@date,2)+ ' ' +convert(varchar, @tempHour-24)+ ':' + SUBSTRING(@time,4,2)+ ':' + RIGHT(@time,2), 120) 
		SET @datetime = DATEADD(day,1,@datetime);
	  end

	  ELSE 
	  SET @datetime = CONVERT(datetime,RIGHT(@date,4)+ '-' + SUBSTRING(@date,4,2) + '-' +LEFT(@date,2)+ ' ' +LEFT(@time,2)+ ':' + SUBSTRING(@time,4,2)+ ':' + RIGHT(@time,2), 120) ;

	  
	  INSERT INTO [HD].[dbo].[CalendarDate] ([Date])
		VALUES (@datetime)
		;
		
      FETCH NEXT FROM kursor INTO @date, @time
	  
   END 
CLOSE kursor 
DEALLOCATE kursor






