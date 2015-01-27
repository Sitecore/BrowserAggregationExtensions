using Sitecore.Analytics.Aggregation.Data.Model;
using Sitecore.ExperienceAnalytics.Aggregation.Dimensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sitecore.AggregationExtensions.Aggregation.Dimensions
{
    public class ByBrowserMajorMinor : VisitDimensionBase
    {
        public ByBrowserMajorMinor(Guid dimensionId)
            : base(dimensionId)
        {
        }

        protected override bool HasDimensionKey(IVisitAggregationContext context)
        {
            return true;
            // return !Sitecore.StringExtensions.StringExtensions.IsNullOrEmpty(context.Visit.Browser.BrowserMajorName);
        }

        protected override string GetKey(IVisitAggregationContext context)
        {
            string browserMajor = "[BLANK]", browserMinor = "[BLANK]";

            if (context.Visit.Browser != null && !string.IsNullOrEmpty(context.Visit.Browser.BrowserMajorName))
            {
                browserMajor = context.Visit.Browser.BrowserMajorName;
            }
            if (context.Visit.Browser != null && !string.IsNullOrEmpty(context.Visit.Browser.BrowserMinorName))
            {
                browserMinor = context.Visit.Browser.BrowserMinorName;
            }

            return StringExtensions.ToCanonical(string.Concat(browserMajor, "-", browserMinor));
        }

        protected override ExperienceAnalytics.Aggregation.Data.Schema.SegmentMetricsValue GetValue(IVisitAggregationContext context)
        {
            return base.GetValue(context);
        }
    }
}