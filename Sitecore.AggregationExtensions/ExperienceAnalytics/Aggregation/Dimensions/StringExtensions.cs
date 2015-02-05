using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sitecore.AggregationExtensions.ExperienceAnalytics.Aggregation.Dimensions
{
    public static class StringExtensions
    {
        internal static string ToCanonical(this string key)
        {
            if (Sitecore.StringExtensions.StringExtensions.IsNullOrEmpty(key))
                return key;
            return new string(Enumerable.ToArray<char>(Enumerable.Where<char>((IEnumerable<char>)key, (Func<char, bool>)(character =>
            {
                if (!char.IsLetterOrDigit(character) && !char.IsPunctuation(character))
                    return char.IsWhiteSpace(character);
                return true;
            })))).Trim().ToUpper();
        }

    }
}