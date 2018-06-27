DECLARE @i varchar(200)
UPDATE [HD].[dbo].[DaneT] with (TABLOCKX)
SET @i = [Date] = CASE WHEN [Date] = '' THEN @i ELSE [Date] END OPTION (MAXDOP 1);

UPDATE [HD].[dbo].[DaneT] with (TABLOCKX)
SET @i = [Channel] = CASE WHEN [Channel] = '' THEN @i ELSE [Channel] END OPTION (MAXDOP 1);

UPDATE [HD].[dbo].[DaneT] with (TABLOCKX)
SET @i = [Description] = CASE WHEN [Description] = '' THEN @i ELSE [Description] END OPTION (MAXDOP 1);

UPDATE [HD].[dbo].[DaneT] with (TABLOCKX)
SET @i = [2nd Description] = CASE WHEN [2nd Description] = '' THEN @i ELSE [2nd Description] END OPTION (MAXDOP 1);

UPDATE [HD].[dbo].[DaneT] with (TABLOCKX)
SET @i = [Start time] = CASE WHEN [Start time] = '' THEN @i ELSE [Start time] END OPTION (MAXDOP 1);

UPDATE [HD].[dbo].[DaneT] with (TABLOCKX)
SET @i = [Duration] = CASE WHEN [Duration] = '' THEN @i ELSE [Duration] END OPTION (MAXDOP 1);