using Sitecore.Analytics.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sitecore.AggregationExtensions.CoreAggregation.Model.Browser
{
    public class BrowsersKey : Sitecore.Analytics.Aggregation.Data.Model.DictionaryKey 
    {
        public Hash32 BrowserMajorId { get; set; }
        public Hash32 BrowserMinorId { get; set; }
        public Hash32 SiteNameId { get; set; }
        public DateTime Date { get; set; }
        public Hash32 Checksum { get; set; }
        public BrowsersKey() : base()
        {

        }

    }

    public class BrowsersValue : Sitecore.Analytics.Aggregation.Data.Model.DictionaryValue
    {
        public int Value { get; set; }
        public int Visits { get; set; }

        public BrowsersValue() : base()
        {

        }
    }


    public class Browsers : Sitecore.Analytics.Aggregation.Data.Model.Fact<BrowsersKey, BrowsersValue>
    {
        public Browsers()
            : base(Reduce)
        {

        }

        internal static BrowsersValue Reduce(BrowsersValue left, BrowsersValue right)
        {
            BrowsersValue result = new BrowsersValue();

            result.Visits = (left.Visits + right.Visits);
            result.Value = (left.Value + right.Value);

            return result;
        }


    }
}