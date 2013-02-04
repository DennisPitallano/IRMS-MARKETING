using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using BLToolkit.Mapping;
using BLToolkit.DataAccess;

namespace IRMS.ObjectModel
{
    [TableName("GRPPRICE")]
    public class PriceGroup
    {
        [MapField("PGNo"),PrimaryKey,NonUpdatable ]
        public int PGNo { get; set; }

        [MapField("GroupName")]
        public string GroupName { get; set; }

        [MapField("GroupField")]
        public string GroupField { get; set; }

        [MapField("PriceID")]
        public int PriceID { get; set; }

        [MapField("Discount")]
        public float Discount { get; set; }

        [MapField("ynConcession")]
        public bool Concession { get; set; }

        [MapField("ynOutright")]
        public bool Outright { get; set; }
    }

    [TableName("GRPPRICEADDVALUE")]
    public class PriceGroupAddValue
    {
        [MapField("PGNo"), PrimaryKey, NonUpdatable]
        public int PGNo { get; set; }

        [MapField("ADD_TOPRICE_VALUE")]
        public float AddToPriceValue { get; set; }
    }
}
