INSERT INTO [HD].[dbo].[TargetGroup] ([TargetName],[TargetCode])
SELECT [Nazwa],[Kod]
FROM [HD].[dbo].[Targets]

INSERT INTO [HD].[dbo].[TargetGroup]
VALUES ('Podgrupa', 'Podgrupa');

INSERT INTO [HD].[dbo].[TargetGroup]
VALUES ('Total Individuals', 'Total Individuals');