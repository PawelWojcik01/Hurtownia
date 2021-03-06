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
    [Total Individuals] float(24),
    [Podgrupa] float(24),
    [A16-49] float(24),
    [M16-49] float(24),
    [A4-15] float(24),
    [A4-9] float(24),
	[column13] varchar(50)
  )


DECLARE kursor1 CURSOR FOR
SELECT *
  FROM [HD].[dbo].[DaneT]
  DECLARE @Date VARCHAR(50), @Channel VARCHAR(100), @Description VARCHAR(100), @2ndDescription VARCHAR(100), @StartTime VARCHAR(50), @Duration VARCHAR(50), @VariableTarget VARCHAR(50),
   @TotalIndividuals VARCHAR(50), @Podgrupa VARCHAR(50), @A16_49 VARCHAR(50), @M16_49 VARCHAR(50), @A4_15 VARCHAR(50), @A4_9 VARCHAR(50), @column13 varchar(50)
  DECLARE @DateTemp VARCHAR(50), @ChannelTemp VARCHAR(100), @DescriptionTemp VARCHAR(100), @2ndDescriptionTemp VARCHAR(100), @StartTimeTemp VARCHAR(50), @DurationTemp VARCHAR(50), @VariableTargetTemp VARCHAR(50),
   @TotalIndividualsTemp VARCHAR(50), @PodgrupaTemp VARCHAR(50), @A16_49Temp VARCHAR(50), @M16_49Temp VARCHAR(50), @A4_15Temp VARCHAR(50), @A4_9Temp VARCHAR(50), @column13Temp varchar(50)
   DECLARE @TotalIndividualsTemp1 float(24), @PodgrupaTemp1 float(24), @A16_49Temp1 float(24), @M16_49Temp1 float(24), @A4_15Temp1 float(24), @A4_9Temp1 float(24) 
   DECLARE @SUBSTRING INTEGER
  OPEN kursor1 

FETCH NEXT FROM kursor1 INTO  @Date, @Channel, @Description, @2ndDescription, @StartTime, @Duration, @VariableTarget, @TotalIndividuals, @Podgrupa, @A16_49, @M16_49, @A4_15, @A4_9, @column13
WHILE @@FETCH_STATUS = 0 
   BEGIN 

   /*
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
*/



		SET @SUBSTRING = CHARINDEX('[', @VariableTarget)-2
		IF @SUBSTRING > 0 
	        begin
				SET @VariableTargetTemp  = SUBSTRING(@VariableTargetTemp, 1, @SUBSTRING)
			end
/*

	SET @TotalIndividualsTemp1 = CONVERT(float,REPLACE(@TotalIndividualsTemp,'%',''))
	SET	@PodgrupaTemp1 = CONVERT(float,REPLACE(@PodgrupaTemp,'%',''))
	SET @A16_49Temp1 = CONVERT(float,REPLACE(@A16_49Temp,'%',''))
	SET @M16_49Temp1 = CONVERT(float,REPLACE(@M16_49Temp,'%',''))
	SET @A4_15Temp1 = CONVERT(float,REPLACE(@A4_15Temp,'%',''))
	SET @A4_9Temp1 = CONVERT(float,REPLACE(@A4_9Temp,'%',''))
*/

	
SET @TotalIndividualsTemp1 = CONVERT(float(24), @TotalIndividualsTemp) 
SET @PodgrupaTemp1 = CONVERT(float(24), @PodgrupaTemp) 
SET @A16_49Temp1 = CONVERT(float(24), @A16_49Temp) 
SET @M16_49Temp1 = CONVERT(float(24), @M16_49Temp) 
SET @A4_15Temp1 = CONVERT(float(24), @A4_15Temp) 
SET @A4_9Temp1 = CONVERT(float(24), @A4_9Temp) 

					

	  INSERT INTO [HD].[dbo].[DaneTemp] ([Date], [Channel], [Description], [2nd Description], [Start time], [Duration], [Variable Target], [Total Individuals], [Podgrupa], [A16-49], [M16-49], [A4-15], [A4-9], [column13] )
	  VALUES (@DateTemp, @ChannelTemp, @DescriptionTemp, @2ndDescriptionTemp, @StartTimeTemp, @DurationTemp, @VariableTargetTemp, 
	  @TotalIndividualsTemp1, 
	  @PodgrupaTemp1, 
	  @A16_49Temp1, 
	  @M16_49Temp1, 
	  @A4_15Temp1, 
	  @A4_9Temp1, 
	  @column13Temp)
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
    [Total Individuals] float(24),
    [Podgrupa] float(24),
    [A16-49] float(24),
    [M16-49] float(24),
    [A4-15] float(24),
    [A4-9] float(24)
	)

INSERT INTO [HD].[dbo].[DaneT]([Date], [Channel], [Description], [2nd Description], [Start time], [Duration], [Variable Target], [Total Individuals], [Podgrupa], [A16-49], [M16-49], [A4-15], [A4-9] )
SELECT [Date], [Channel], [Description], [2nd Description], [Start time], [Duration], [Variable Target], [Total Individuals], [Podgrupa], [A16-49], [M16-49], [A4-15], [A4-9]
FROM [HD].[dbo].[DaneTemp]

IF OBJECT_ID('[HD].[dbo].[DaneTemp]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[DaneTemp]; 








