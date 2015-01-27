Sitecore Experience Analytics Browser Aggregation Extensions
Release 1
David Morrison
2015-01-27
Twitter: @dmo_sc

This module adds new dashboard reports to Sitecore 8.0 Engagement Analytics that segment visits and engagement value by the visit browser major and minor versions.

The browser major version is typically the software application name, Chrome, InternetExplorer, etc. The browser minor version is typically the actual version number like IE-11.0, Chrome-44.0, etc.

There is a Browser full version dashboard that by default will show the same results as the browser minor version. It is included for specific configurations to allow more precision for the browser version attribute than the Minor version. 

Installation Instructions

1. Install SitecoreTDS.AggregationExtensions.update package
/sitecore/admin/updateinstallationwizard.aspx

2. Go to the Launch Pad and open the Marketing Control Panel

3. Open up the following three items and change the workflow state on each to "Deploy"
/marketing control panel/experience analytics/dimensions/visits/by browser major/all
/marketing control panel/experience analytics/dimensions/visits/by minor minor/all
/marketing control panel/experience analytics/dimensions/visits/by browser version/all

4. Publish the site just in case

5. Wait 10 minutes and then create some test sessions with a couple different browsers in private mode.

6. Wait another 20 minutes, assuming your session timeout is 20 minutes, and check the Engagement Analytics dashboards to see if there is any results.
No seriously. There is a default Experience Analytics setting that offsets the processing of the segment for 30 minutes after the segment is deployed. If you create test visits too early they will not show up and you have to wait at least 30 minutes. The setting is below if you want to change it. 

7. Contact me with any feedback or installation troubles on twitter @dmo_sc

Appendix A: Segment Deployment Offset 

&lt;setting name="ExperienceAnalytics.Aggregation.SegmentDeployDateOffsetPadding" value="00:30:00" /&gt;
In file 
\website\App_Config\Include\ExperienceAnalytics\Sitecore.ExperienceAnalytics.Aggregation.config

