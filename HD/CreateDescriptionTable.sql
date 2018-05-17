USE [HD]
GO

/****** Object:  Table [dbo].[Description]    Script Date: 16.05.2018 14:47:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Description](
	[Description_ID] [bigint] NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[SecondDescription_ID] [bigint] NOT NULL,
 CONSTRAINT [PK_Description] PRIMARY KEY CLUSTERED 
(
	[Description_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Description]  WITH NOCHECK ADD  CONSTRAINT [FK_Description_SecondDescription] FOREIGN KEY([SecondDescription_ID])
REFERENCES [dbo].[SecondDescription] ([SecondDescription_ID])
GO

ALTER TABLE [dbo].[Description] CHECK CONSTRAINT [FK_Description_SecondDescription]
GO


