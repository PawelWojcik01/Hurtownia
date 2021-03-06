
INSERT INTO [HD].[dbo].[Programs]
SELECT DISTINCT 

CONVERT(datetime,RIGHT([Date],4)+ '-' + SUBSTRING([Date],4,2) + '-' +LEFT([Date],2)+ ' ' + LEFT([Start time], 2)+ ':' + SUBSTRING([Start time],4,2)+ ':' + RIGHT([Start time],2), 120) AS [StartTime], 
CONVERT(INTEGER, LEFT([Start time], 2)) AS [StartHour],
CONVERT(INTEGER, LEFT([Start time], 2)) AS [StartMediaHour],
CONVERT(INTEGER, SUBSTRING([Start time],4,2)) AS [StartMinute],
CONVERT(INTEGER, SUBSTRING([Start time],7,2)) AS [StartSecond],
datediff(minute, '00:00:00', CONVERT(TIME, [Duration])) as Duration,
[Description], 
[2nd Description], 
[ChannelID]

FROM [HD].[dbo].[DaneT], [HD].[dbo].[Channel]
WHERE [HD].[dbo].[Channel].[ChannelName] = [HD].[dbo].[DaneT].[Channel] AND LEFT([Start time], 2) != '24' AND LEFT([Start time], 2) != '25'


INSERT INTO [HD].[dbo].[Programs]
SELECT DISTINCT 

DATEADD(day,1,CONVERT(datetime,RIGHT([Date],4)+ '-' + SUBSTRING([Date],4,2) + '-' +LEFT([Date],2)+ ' ' + CONVERT(VARCHAR ,(CONVERT(INTEGER, LEFT([Start time], 2))-24))+ ':' + SUBSTRING([Start time],4,2)+ ':' + RIGHT([Start time],2), 120)) AS [StartTime], 
CONVERT(INTEGER, LEFT([Start time], 2)-24) AS [StartHour],
CONVERT(INTEGER, LEFT([Start time], 2)-24) AS [StartMediaHour],
CONVERT(INTEGER, SUBSTRING([Start time],4,2)) AS [StartMinute],
CONVERT(INTEGER, SUBSTRING([Start time],7,2)) AS [StartSecond],
datediff(minute, '00:00:00', CONVERT(TIME, [Duration])) as Duration,
[Description], 
[2nd Description], 
[ChannelID]

FROM [HD].[dbo].[DaneT], [HD].[dbo].[Channel]
WHERE [HD].[dbo].[Channel].[ChannelName] = [HD].[dbo].[DaneT].[Channel] AND (LEFT([Start time], 2) = '24' OR LEFT([Start time], 2) = '25')




