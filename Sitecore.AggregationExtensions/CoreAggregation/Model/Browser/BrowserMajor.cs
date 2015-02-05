using Sitecore.Analytics.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sitecore.AggregationExtensions.CoreAggregation.Model.Browser
{
    public class BrowserMajorKey : Sitecore.Analytics.Aggregation.Data.Model.DictionaryKey
    {
        public Hash32 BrowserMajorId { get; protected set; }

        public BrowserMajorKey(Hash32 key) : base()
        {
            BrowserMajorId = key;
        }
    }

    public class BrowserMajorValue : Sitecore.Analytics.Aggregation.Data.Model.DictionaryValue
    {
        public string BrowserMajorName { get; protected set; }

        public BrowserMajorValue(string value) : base()
        {
            BrowserMajorName = value;
        }
    }

    public class BrowserMajor : Sitecore.Analytics.Aggregation.Data.Model.Dimension<BrowserMajorKey, BrowserMajorValue>
    {
        public Hash32 Add(string browserMajor)
        {
            string browserMajor1 = browserMajor ?? "[unknown]";
            Hash32 browserMajorId = Hash32.Compute(browserMajor1);
            base.Add(new BrowserMajorKey(browserMajorId), new BrowserMajorValue(browserMajor1));
            return browserMajorId;
        }
    }

}