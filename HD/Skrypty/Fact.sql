INSERT INTO [HD].[dbo].[Fakty] ([AMR], [AMR %], [SHR %], [RCH %], [RCH], [TargetGroupID], [ProgramID], [CalendarID], [MediaCalendarID])
SELECT 
[AMR],
[AMR %],
[SHR %],
[RCH %],
[RCH],
[TargetGroupID],
[ProgramID],
[CalendarID],
[MediaCalendarID]
     
  FROM (((([HD].[dbo].[DaneT2]
  INNER JOIN [HD].[dbo].[TargetGroup] ON [HD].[dbo].[DaneT2].[Grupa] = [HD].[dbo].[TargetGroup].[TargetCode])
  INNER JOIN [HD].[dbo].[Programs] ON [HD].[dbo].[DaneT2].[Description] = [HD].[dbo].[Programs].[Description] AND 
									[HD].[dbo].[DaneT2].[2nd Description] = [HD].[dbo].[Programs].[2ndDescription] AND
									[HD].[dbo].[Programs].[StartTime] = 
									CONVERT(datetime, RIGHT([HD].[dbo].[DaneT2].[Date],4)+ '-' + SUBSTRING([HD].[dbo].[DaneT2].[Date],4,2) + '-' +LEFT([HD].[dbo].[DaneT2].[Date],2)+ ' ' + LEFT([HD].[dbo].[DaneT2].[Start time],2) + ':' + SUBSTRING([HD].[dbo].[DaneT2].[Start time],4,2)+ ':' + RIGHT([HD].[dbo].[DaneT2].[Start time],2), 120)
									)
						INNER JOIN [HD].[dbo].[Calendar] ON [HD].[dbo].[Programs].[StartTime] = [HD].[dbo].[Calendar].[Date]
						)		
						INNER JOIN [HD].[dbo].[MediaCalendar] ON [HD].[dbo].[Programs].[StartTime] = [HD].[dbo].[MediaCalendar].[Date]
						)	



									where convert(integer, left([HD].[dbo].[DaneT2].[Start time],2)) < 24
									order by [CalendarID] asc



/* ----------------------------------------------------------------------- */
INSERT INTO [HD].[dbo].[Fakty] ([AMR], [AMR %], [SHR %], [RCH %], [RCH], [TargetGroupID], [ProgramID], [CalendarID], [MediaCalendarID])
SELECT 
	
[AMR],
[AMR %],
[SHR %],
[RCH %],
[RCH],
[TargetGroupID],
[ProgramID],
[CalendarID],
[MediaCalendarID]

     
  FROM (((([HD].[dbo].[DaneT2]
  INNER JOIN [HD].[dbo].[TargetGroup] ON [HD].[dbo].[DaneT2].[Grupa] = [HD].[dbo].[TargetGroup].[TargetCode])
  INNER JOIN [HD].[dbo].[Programs] ON [HD].[dbo].[DaneT2].[Description] = [HD].[dbo].[Programs].[Description] AND 
									[HD].[dbo].[DaneT2].[2nd Description] = [HD].[dbo].[Programs].[2ndDescription] AND
									[HD].[dbo].[Programs].[StartTime] = 
									DATEADD(day,1,CONVERT(datetime, RIGHT([HD].[dbo].[DaneT2].[Date],4)+ '-' + SUBSTRING([HD].[dbo].[DaneT2].[Date],4,2) + '-' +LEFT([HD].[dbo].[DaneT2].[Date],2)+ ' ' + convert(varchar, CONVERT(INTEGER, LEFT([HD].[dbo].[DaneT2].[Start time],2))-24) + ':' + SUBSTRING([HD].[dbo].[DaneT2].[Start time],4,2)+ ':' + RIGHT([HD].[dbo].[DaneT2].[Start time],2), 120))
									)
									INNER JOIN [HD].[dbo].[Calendar] ON [HD].[dbo].[Programs].[StartTime] = [HD].[dbo].[Calendar].[Date]
									)
									INNER JOIN [HD].[dbo].[MediaCalendar] ON CONVERT(datetime, RIGHT([HD].[dbo].[DaneT2].[Date],4)+ '-' + SUBSTRING([HD].[dbo].[DaneT2].[Date],4,2) + '-' +LEFT([HD].[dbo].[DaneT2].[Date],2)+ ' ' + convert(varchar, CONVERT(INTEGER, LEFT([HD].[dbo].[DaneT2].[Start time],2))-24) + ':' + SUBSTRING([HD].[dbo].[DaneT2].[Start time],4,2)+ ':' + RIGHT([HD].[dbo].[DaneT2].[Start time],2), 120) = [HD].[dbo].[MediaCalendar].[Date]
									)

									where convert(integer, left([HD].[dbo].[DaneT2].[Start time],2)) > 23 
									order by [ProgramID] asc


/* ---------------------------------------------------------------------------------------------------- */


IF OBJECT_ID('[HD].[dbo].[CalendarDate]', 'U') IS NOT NULL
DROP TABLE [HD].[dbo].[CalendarDate];

IF OBJECT_ID('[HD].[dbo].[DaneT]', 'U') IS NOT NULL
DROP TABLE [HD].[dbo].[DaneT];

IF OBJECT_ID('[HD].[dbo].[DaneT2]', 'U') IS NOT NULL
DROP TABLE [HD].[dbo].[DaneT2];

IF OBJECT_ID('[HD].[dbo].[Grupy_mediowe]', 'U') IS NOT NULL
DROP TABLE [HD].[dbo].[Grupy_mediowe];

IF OBJECT_ID('[HD].[dbo].[Kategorie]', 'U') IS NOT NULL
DROP TABLE [HD].[dbo].[Kategorie];

IF OBJECT_ID('[HD].[dbo].[Targets]', 'U') IS NOT NULL
DROP TABLE [HD].[dbo].[Targets];
