using Sitecore.AggregationExtensions.CoreAggregation.Model.Browser;
using Sitecore.Analytics.Aggregation.Data.Model.Dimensions;
using Sitecore.Analytics.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sitecore.AggregationExtensions.CoreAggregation.Pipelines.Browser
{
    public class BrowsersProcessor : Sitecore.Analytics.Aggregation.Pipeline.AggregationProcessor
    {
        protected override void OnProcess(Sitecore.Analytics.Aggregation.Pipeline.AggregationPipelineArgs args)
        {
            Sitecore.Diagnostics.Assert.ArgumentNotNull((object)args, "args");
      
            Browsers fact = args.GetFact<Browsers>();
            BrowserMajor dimension1 = args.GetDimension<BrowserMajor>();
            BrowserMinor dimension2 = args.GetDimension<BrowserMinor>();
            SiteNames dimension3 = args.GetDimension<SiteNames>();

            var visit = args.Context.Visit;
            var browserData = visit.Browser;
            int value = visit.Value;
            
            Hash32 hash32_1 = dimension1.Add(browserData.BrowserMajorName ?? "[Unknown]");
            Hash32 hash32_2 = dimension2.Add(hash32_1, browserData.BrowserMinorName ?? "[Unknown]");
            Hash32 hash32_3 = dimension3.Add(visit.SiteName ?? "[Unknown]");
            
            args.GetFact<Browsers>().Emit(
                new BrowsersKey()
                {
                    Date = args.DateTimeStrategy.Translate(visit.StartDateTime),
                    BrowserMajorId = hash32_1,
                    BrowserMinorId = hash32_2,
                    SiteNameId = hash32_3,
                    Checksum = Hash32.Compute((object)hash32_1, (object)hash32_2, (object)hash32_3)
                }, 
                new BrowsersValue()
                {
                    Value = value,
                    Visits = 1
                });

        }
    }
}