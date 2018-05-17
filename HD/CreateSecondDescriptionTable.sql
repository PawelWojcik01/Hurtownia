USE [HD]
GO

/****** Object:  Table [dbo].[SecondDescription]    Script Date: 16.05.2018 14:47:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SecondDescription](
	[SecondDescription_ID] [bigint] NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SecondDescription] PRIMARY KEY CLUSTERED 
(
	[SecondDescription_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


