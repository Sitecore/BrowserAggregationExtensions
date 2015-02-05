
/****** Object:  Table [dbo].[BrowserMajor]    Script Date: 8/29/2014 5:46:04 AM ******/
DROP TABLE [dbo].[BrowserMajor]
GO

/****** Object:  Table [dbo].[BrowserMajor]    Script Date: 8/29/2014 5:46:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BrowserMajor](
	[BrowserMajorId] [int] NOT NULL,
	[BrowserMajorName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BrowserMajor] PRIMARY KEY CLUSTERED 
(
	[BrowserMajorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING ON
GO

