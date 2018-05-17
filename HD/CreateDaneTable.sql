USE [HD]
GO

/****** Object:  Table [dbo].[Dane]    Script Date: 16.05.2018 14:47:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Dane](
	[Dane_ID] [bigint] NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[Start_time] [varchar](50) NOT NULL,
	[Duration] [varchar](50) NOT NULL,
	[Channel_ID] [bigint] NOT NULL,
	[Description_ID] [bigint] NOT NULL,
	[Grupa] [varchar](50) NOT NULL,
	[AMR] [varchar](50) NOT NULL,
	[AMR%] [varchar](50) NOT NULL,
	[SHR%] [varchar](50) NOT NULL,
	[RCH%] [varchar](50) NOT NULL,
	[RCH] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dane] PRIMARY KEY CLUSTERED 
(
	[Dane_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Dane]  WITH NOCHECK ADD  CONSTRAINT [FK_Dane_Channel] FOREIGN KEY([Channel_ID])
REFERENCES [dbo].[Channel] ([Channel_ID])
GO

ALTER TABLE [dbo].[Dane] CHECK CONSTRAINT [FK_Dane_Channel]
GO

ALTER TABLE [dbo].[Dane]  WITH NOCHECK ADD  CONSTRAINT [FK_Dane_Description] FOREIGN KEY([Description_ID])
REFERENCES [dbo].[Description] ([Description_ID])
GO

ALTER TABLE [dbo].[Dane] CHECK CONSTRAINT [FK_Dane_Description]
GO


