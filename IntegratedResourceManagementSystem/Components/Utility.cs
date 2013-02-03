using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IRMS.Components
{
    public static  class Utility
    {
        public static int ParseInt(string StringToParse)
        {
            return int.Parse(StringToParse);
        }

        public static double ParseDouble(string StringToParse)
        {
            return double.Parse(StringToParse);
        }

    }
}
