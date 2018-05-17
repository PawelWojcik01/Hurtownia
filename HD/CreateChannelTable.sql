USE [HD]
GO

/****** Object:  Table [dbo].[Channel]    Script Date: 16.05.2018 14:45:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Channel](
	[Channel_ID] [bigint] NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[Kategoria] [varchar](50) NOT NULL,
	[Grupa] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED 
(
	[Channel_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


