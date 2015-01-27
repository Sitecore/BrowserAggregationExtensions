﻿using Sitecore.Analytics.Aggregation.Data.Model;
using Sitecore.ExperienceAnalytics.Aggregation.Dimensions;
using Sitecore.ExperienceAnalytics.Core.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sitecore.AggregationExtensions.Aggregation.Dimensions
{
    public class ByBrowserMajor : VisitDimensionBase
    {
        public ByBrowserMajor(Guid dimensionId)
            : base(dimensionId)
        {
        }

        protected override bool HasDimensionKey(IVisitAggregationContext context)
        {
            return true;
            // return !string.IsNullOrEmpty(context.Visit.Browser.BrowserMajorName);
        }

        protected override string GetKey(IVisitAggregationContext context)
        {
            string browserMajor = "[BLANK]";

            if (context.Visit.Browser != null && !string.IsNullOrEmpty(context.Visit.Browser.BrowserMajorName))
            {
                browserMajor = context.Visit.Browser.BrowserMajorName;
            }

            return StringExtensions.ToCanonical(string.Concat(browserMajor));
        }
    }
}