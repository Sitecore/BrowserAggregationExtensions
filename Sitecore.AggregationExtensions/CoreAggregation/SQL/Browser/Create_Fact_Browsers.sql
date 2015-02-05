ALTER TABLE [dbo].[Fact_Browsers] DROP CONSTRAINT [FK_Fact_Browsers_SiteNames]
GO

ALTER TABLE [dbo].[Fact_Browsers] DROP CONSTRAINT [FK_Fact_Browsers_BrowserMinor]
GO

ALTER TABLE [dbo].[Fact_Browsers] DROP CONSTRAINT [FK_Fact_Browsers_BrowserMajor]
GO

/****** Object:  Table [dbo].[Fact_Browsers]    Script Date: 8/29/2014 5:45:10 AM ******/
DROP TABLE [dbo].[Fact_Browsers]
GO

/****** Object:  Table [dbo].[Fact_Browsers]    Script Date: 8/29/2014 5:45:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fact_Browsers](
	[Date] [smalldatetime] NOT NULL,
	[BrowserMajorId] [int] NOT NULL,
	[BrowserMinorId] [int] NOT NULL,
	[SiteNameId] [int] NOT NULL,
	[Checksum] [int] NOT NULL,
	[Visits] [bigint] NOT NULL,
	[Value] [bigint] NOT NULL,
 CONSTRAINT [PK_Fact_Browsers] PRIMARY KEY CLUSTERED 
(
	[Date] ASC,
	[BrowserMajorId] ASC,
	[BrowserMinorId] ASC,
	[SiteNameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Fact_Browsers]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Browsers_BrowserMajor] FOREIGN KEY([BrowserMajorId])
REFERENCES [dbo].[BrowserMajor] ([BrowserMajorId])
GO

ALTER TABLE [dbo].[Fact_Browsers] NOCHECK CONSTRAINT [FK_Fact_Browsers_BrowserMajor]
GO

ALTER TABLE [dbo].[Fact_Browsers]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Browsers_BrowserMinor] FOREIGN KEY([BrowserMajorId], [BrowserMinorId])
REFERENCES [dbo].[BrowserMinor] ([BrowserMajorId], [BrowserMinorId])
GO

ALTER TABLE [dbo].[Fact_Browsers] NOCHECK CONSTRAINT [FK_Fact_Browsers_BrowserMinor]
GO

ALTER TABLE [dbo].[Fact_Browsers]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Browsers_SiteNames] FOREIGN KEY([SiteNameId])
REFERENCES [dbo].[SiteNames] ([SiteNameId])
GO

ALTER TABLE [dbo].[Fact_Browsers] NOCHECK CONSTRAINT [FK_Fact_Browsers_SiteNames]
GO

