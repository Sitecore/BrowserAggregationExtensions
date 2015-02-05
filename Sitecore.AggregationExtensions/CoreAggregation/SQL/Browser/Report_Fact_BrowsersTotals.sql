DECLARE @SiteName varchar(50);
DECLARE @StartDate datetime;
DECLARE @EndDate datetime;

SET @SiteName = 'symna'
SET @StartDate = '2014-09-01 00:00:00'
SET @EndDate = '2014-09-30 23:59:59'


SELECT 
	[Fact_Browsers].[SiteNameId],
	[Fact_Browsers].[BrowserMajorId],
	[Fact_Browsers].[BrowserMinorId],
	[SiteNames].[SiteName],
	[BrowserMajor].[BrowserMajorName],
	[BrowserMinor].[BrowserMinorName],
	Sum([Fact_Browsers].[Visits]) as [TotalVisits],
	Sum([Fact_Browsers].[Value]) as [TotalValue]

FROM [Fact_Browsers]
INNER JOIN [BrowserMajor] ON [Fact_Browsers].[BrowserMajorId] = [BrowserMajor].[BrowserMajorId]
INNER JOIN [BrowserMinor] ON [Fact_Browsers].[BrowserMajorId] = [BrowserMinor].[BrowserMajorId] AND [Fact_Browsers].[BrowserMinorid] = [BrowserMinor].[BrowserMinorId]
INNER JOIN [SiteNames] ON [Fact_Browsers].[SiteNameId] = [SiteNames].[SiteNameId]

WHERE
    @SiteName = @SiteName
    AND [Date] BETWEEN @StartDate AND @EndDate


group by 
	[Fact_Browsers].[BrowserMajorId],
	[Fact_Browsers].[BrowserMinorId],
	[Fact_Browsers].[SiteNameId],
	[BrowserMajor].[BrowserMajorName],
	[BrowserMinor].[BrowserMinorName],
	[SiteNames].[SiteName]
order by 
	[TotalValue] desc