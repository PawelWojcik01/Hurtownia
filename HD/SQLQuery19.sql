/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [HD].[dbo].[KategorieT].[Program], [HD].[dbo].[KategorieT].[Kategoria], [HD].[dbo].[Grupy_mediowe].[Grupa]

  FROM [HD].[dbo].[KategorieT], [HD].[dbo].[Grupy_mediowe]
where [HD].[dbo].[KategorieT].[Program] = [HD].[dbo].[Grupy_mediowe].[Program]