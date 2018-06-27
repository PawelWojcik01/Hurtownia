USE [HD]
GO

IF OBJECT_ID('[dbo].[Kategorie]', 'U') IS NOT NULL
DROP TABLE [dbo].[Kategorie];
GO
/********************************************************************/
USE [HD]
GO

IF OBJECT_ID('[dbo].[Grupy_mediowe]', 'U') IS NOT NULL
DROP TABLE [dbo].[Grupy_mediowe];
GO

/********************************************************************/
USE [HD]
GO

IF OBJECT_ID('[dbo].[Targets]', 'U') IS NOT NULL
DROP TABLE [dbo].[Targets];
GO

/********************************************************************/
USE [HD]
GO

IF OBJECT_ID('[dbo].[DaneT]', 'U') IS NOT NULL
DROP TABLE [dbo].[DaneT];
GO

/********************************************************************/

IF OBJECT_ID('[HD].[dbo].[CalendarDate]', 'U') IS NOT NULL 
  DROP TABLE [HD].[dbo].[CalendarDate]; 

CREATE TABLE [HD].[dbo].[CalendarDate](
	[Date] datetime NULL,
	)

/********************************************************************/

USE [HD]
GO

ALTER TABLE [dbo].[Fakty] DROP CONSTRAINT [FK_Fakty_TargetGroup]
GO

ALTER TABLE [dbo].[Fakty] DROP CONSTRAINT [FK_Fakty_Programs]
GO

ALTER TABLE [dbo].[Fakty] DROP CONSTRAINT [FK_Fakty_MediaCalendar]
GO

ALTER TABLE [dbo].[Fakty] DROP CONSTRAINT [FK_Fakty_Calendar]
GO


IF OBJECT_ID('[dbo].[Fakty]', 'U') IS NOT NULL
DROP TABLE [dbo].[Fakty];
GO



/********************************************************************/
USE [HD]
GO

IF OBJECT_ID('[dbo].[TargetGroup]', 'U') IS NOT NULL
DROP TABLE [dbo].[TargetGroup];
GO

/********************************************************************/
USE [HD]
GO

IF OBJECT_ID('[dbo].[Calendar]', 'U') IS NOT NULL
DROP TABLE [dbo].[Calendar];
GO



/********************************************************************/
USE [HD]
GO

IF OBJECT_ID('[dbo].[MediaCalendar]', 'U') IS NOT NULL
DROP TABLE [dbo].[MediaCalendar];
GO

/********************************************************************/

USE [HD]
GO

ALTER TABLE [dbo].[Programs] DROP CONSTRAINT [FK_Programs_Channel]
GO

IF OBJECT_ID('[dbo].[Programs]', 'U') IS NOT NULL
DROP TABLE [dbo].[Programs];
GO

/********************************************************************/

USE [HD]
GO

ALTER TABLE [dbo].[Channel] DROP CONSTRAINT [FK_Channel_MediaGroup]
GO

ALTER TABLE [dbo].[Channel] DROP CONSTRAINT [FK_Channel_Category]
GO

IF OBJECT_ID('[dbo].[Channel]', 'U') IS NOT NULL
DROP TABLE [dbo].[Channel];
GO





/********************************************************************/
USE [HD]
GO

IF OBJECT_ID('[dbo].[MediaGroup]', 'U') IS NOT NULL
DROP TABLE [dbo].[MediaGroup];
GO

/********************************************************************/

USE [HD]
GO

IF OBJECT_ID('[dbo].[Category]', 'U') IS NOT NULL
DROP TABLE [dbo].[Category];
GO

/********************************************************************/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MediaGroup](
	[MediaGroupID] [int] NOT NULL IDENTITY(1,1),
	[MediaGroupName] [varchar](50) NULL,
 CONSTRAINT [PK_MediaGroup] PRIMARY KEY CLUSTERED 
(
	[MediaGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/********************************************************************/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL IDENTITY(1,1),
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/********************************************************************/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Channel](
	[ChannelID] [int] NOT NULL IDENTITY(1,1),
	[ChannelName] [varchar](50) NULL,
	[CategoryID] [int] NULL,
	[MediaGroupID] [int] NULL,
 CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED 
(
	[ChannelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Channel]  WITH CHECK ADD  CONSTRAINT [FK_Channel_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO

ALTER TABLE [dbo].[Channel] CHECK CONSTRAINT [FK_Channel_Category]
GO

ALTER TABLE [dbo].[Channel]  WITH CHECK ADD  CONSTRAINT [FK_Channel_MediaGroup] FOREIGN KEY([MediaGroupID])
REFERENCES [dbo].[MediaGroup] ([MediaGroupID])
GO

ALTER TABLE [dbo].[Channel] CHECK CONSTRAINT [FK_Channel_MediaGroup]
GO

/********************************************************************/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Programs](
	[ProgramID] [int] NOT NULL IDENTITY(1,1),
	[StartTime] [datetime] NULL,
	[StartHour] [int] NULL,
	[MediaStartHour] [int] NULL,
	[StartMinute] [int] NULL,
	[StartSecond] [int] NULL,
	[Duration] [int] NULL,
	[Description] [varchar](200) NULL,
	[2ndDescription] [varchar](200) NULL,
	[ChannelID] [int] NULL,
 CONSTRAINT [PK_Programs] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Programs]  WITH CHECK ADD  CONSTRAINT [FK_Programs_Channel] FOREIGN KEY([ChannelID])
REFERENCES [dbo].[Channel] ([ChannelID])
GO

ALTER TABLE [dbo].[Programs] CHECK CONSTRAINT [FK_Programs_Channel]
GO


/********************************************************************/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TargetGroup](
	[TargetGroupID] [int] NOT NULL IDENTITY(1,1),
	[TargetName] [varchar](50) NULL,
	[TargetCode] [varchar](50) NULL,
 CONSTRAINT [PK_TargetGroup] PRIMARY KEY CLUSTERED 
(
	[TargetGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO






/********************************************************************/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Calendar](
	[CalendarID] [int] NOT NULL IDENTITY(1,1),
	[Date] [datetime] NULL,
	[Day] [int] NULL,
	[WeekDay] [int] NULL,
	[WeekDayName] [varchar](50) NULL,
	[Year] [int] NULL,
	[Quarter] [int] NULL,
	[Month] [int] NULL,
	[WeekYear] [int] NULL,
	[DayYear] [int] NULL,
	[MonthName] [varchar](20) NULL,
 CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED 
(
	[CalendarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/********************************************************************/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[MediaCalendar](
	[MediaCalendarID] [int] NOT NULL IDENTITY(1,1),
	[Date] [datetime] NULL,
	[Day] [int] NULL,
	[WeekDay] [int] NULL,
	[WeekDayName] [varchar](50) NULL,
	[Year] [int] NULL,
	[Quarter] [int] NULL,
	[Month] [int] NULL,
	[WeekYear] [int] NULL,
	[DayYear] [int] NULL,
	[MonthName] [varchar](20) NULL,
 CONSTRAINT [PK_MediaCalendar] PRIMARY KEY CLUSTERED 
(
	[MediaCalendarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/********************************************************************/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fakty](
	[FaktID] [int] NOT NULL IDENTITY(1,1),
	[AMR] [float] NULL,
	[AMR %] decimal(10,3) NULL,
	[SHR %] decimal(10,3) NULL,
	[RCH %] decimal(10,3) NULL,
	[RCH] [float] NULL,
	[TargetGroupID] [int] NULL,
	[ProgramID] [int] NULL,
	[CalendarID] [int] NULL,
	[MediaCalendarID] [int] NULL,
 CONSTRAINT [PK_Fakty] PRIMARY KEY CLUSTERED 
(
	[FaktID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Fakty]  WITH CHECK ADD  CONSTRAINT [FK_Fakty_Calendar] FOREIGN KEY([CalendarID])
REFERENCES [dbo].[Calendar] ([CalendarID])
GO

ALTER TABLE [dbo].[Fakty] CHECK CONSTRAINT [FK_Fakty_Calendar]
GO

ALTER TABLE [dbo].[Fakty]  WITH CHECK ADD  CONSTRAINT [FK_Fakty_MediaCalendar] FOREIGN KEY([MediaCalendarID])
REFERENCES [dbo].[MediaCalendar] ([MediaCalendarID])
GO

ALTER TABLE [dbo].[Fakty] CHECK CONSTRAINT [FK_Fakty_MediaCalendar]
GO

ALTER TABLE [dbo].[Fakty]  WITH CHECK ADD  CONSTRAINT [FK_Fakty_Programs] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[Programs] ([ProgramID])
GO

ALTER TABLE [dbo].[Fakty] CHECK CONSTRAINT [FK_Fakty_Programs]
GO

ALTER TABLE [dbo].[Fakty]  WITH CHECK ADD  CONSTRAINT [FK_Fakty_TargetGroup] FOREIGN KEY([TargetGroupID])
REFERENCES [dbo].[TargetGroup] ([TargetGroupID])
GO

ALTER TABLE [dbo].[Fakty] CHECK CONSTRAINT [FK_Fakty_TargetGroup]
GO





/********************************************************************/


CREATE TABLE [Kategorie] (
    [Program] nvarchar(255),
    [Kategoria] nvarchar(255)
)




/********************************************************************/

CREATE TABLE [Grupy_mediowe] (
    [Program] float(24),
    [Grupa] nvarchar(255)
)



/********************************************************************/

CREATE TABLE [Targets] (
    [Nazwa] varchar(50),
    [Kod] varchar(50)
)


/********************************************************************/


CREATE TABLE [DaneT] (
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
