using Sitecore.Analytics.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sitecore.AggregationExtensions.CoreAggregation.Model.Browser
{
    public class BrowserMinorKey : Sitecore.Analytics.Aggregation.Data.Model.DictionaryKey
    {
        public Hash32 BrowserMajorId { get; protected set; }
        public Hash32 BrowserMinorId { get; protected set; }

        public BrowserMinorKey(Hash32 major, Hash32 minor)
            : base()
        {
            BrowserMajorId = major;
            BrowserMinorId = minor;
        }
    }

    public class BrowserMinorValue : Sitecore.Analytics.Aggregation.Data.Model.DictionaryValue
    {
        public string BrowserMinorName { get; protected set; }

        public BrowserMinorValue(string value)
            : base()
        {
            BrowserMinorName = value;
        }
    }

    public class BrowserMinor : Sitecore.Analytics.Aggregation.Data.Model.Dimension<BrowserMinorKey, BrowserMinorValue>
    {
        public Hash32 Add(Hash32 browserMajorId, string browserMinorName)
        {
            string browserMinor1 = browserMinorName ?? "[unknown]";
            Hash32 browserMinorId = Hash32.Compute(browserMinor1);
            base.Add(new BrowserMinorKey(browserMajorId, browserMinorId), new BrowserMinorValue(browserMinor1));
            return browserMinorId;
        }
    }
}