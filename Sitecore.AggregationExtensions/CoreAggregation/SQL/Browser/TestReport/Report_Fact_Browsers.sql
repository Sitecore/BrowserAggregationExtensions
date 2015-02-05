SELECT [Fact_Browsers].[BrowserMajorId],
	[Fact_Browsers].[BrowserMinorId],
	[Fact_Browsers].[SiteNameId],
	[Fact_Browsers].[Date] as [StartDateTime],
	[Fact_Browsers].[Visits],
	[Fact_Browsers].[Value],
	[Fact_Browsers].[Checksum],
	[BrowserMajor].[BrowserMajorName],
	[BrowserMinor].[BrowserMinorName]

FROM [Fact_Browsers]
INNER JOIN [BrowserMajor] ON [Fact_Browsers].[BrowserMajorId] = [BrowserMajor].[BrowserMajorId]
INNER JOIN [BrowserMinor] ON [Fact_Browsers].[BrowserMajorId] = [BrowserMinor].[BrowserMajorId] AND [Fact_Browsers].[BrowserMinorid] = [BrowserMinor].[BrowserMinorId]
INNER JOIN [SiteNames] ON [Fact_Browsers].[SiteNameId] = [SiteNames].[SiteNameId]