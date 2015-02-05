ALTER TABLE [dbo].[BrowserMinor] DROP CONSTRAINT [FK_BrowserMajor]
GO

/****** Object:  Table [dbo].[BrowserMinor]    Script Date: 8/29/2014 5:47:21 AM ******/
DROP TABLE [dbo].[BrowserMinor]
GO

/****** Object:  Table [dbo].[BrowserMinor]    Script Date: 8/29/2014 5:47:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BrowserMinor](
	[BrowserMajorId] [int] NOT NULL,
	[BrowserMinorId] [int] NOT NULL,
	[BrowserMinorName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BrowserMinor] PRIMARY KEY CLUSTERED 
(
	[BrowserMajorId] ASC,
	[BrowserMinorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[BrowserMinor]  WITH CHECK ADD  CONSTRAINT [FK_BrowserMajor] FOREIGN KEY([BrowserMajorId])
REFERENCES [dbo].[BrowserMajor] ([BrowserMajorId])
GO

ALTER TABLE [dbo].[BrowserMinor] CHECK CONSTRAINT [FK_BrowserMajor]
GO

