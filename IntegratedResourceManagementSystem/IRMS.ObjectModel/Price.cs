using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Mapping;
using BLToolkit.DataAccess;

namespace IRMS.ObjectModel
{
    [TableName("PRICE")]
    public class Price
    {
        [MapField("ID"), PrimaryKey, NonUpdatable]
        public int RecordNo { get; set; }

        [MapField("StyleNo")]
        public string StyleNo { get; set; }

        [MapField("BrandName")]
        public string BrandName { get; set; }

        [MapField("BrandName2")]
        public string BrandName_2 { get; set; }

        [MapField("StyleDesc")]
        public string StyleDesc { get; set; }

        [MapField("DatePosted")]
        public DateTime Date_Posted { get; set; }

        [MapField("Price1")]
        public decimal Price_1 { get; set; }

        [MapField("Price2")]
        public decimal Price_2 { get; set; }

        [MapField("Price3")]
        public decimal Price_3 { get; set; }

        [MapField("Price4")]
        public decimal Price_4 { get; set; }

        [MapField("Price5")]
        public decimal Price_5 { get; set; }

        [MapField("Price6")]
        public decimal Price_6 { get; set; }

        [MapField("Price7")]
        public decimal Price_7 { get; set; }

        [MapField("Price8")]
        public decimal Price_8 { get; set; }

        [MapField("Price9")]
        public decimal Price_9 { get; set; }

        [MapField("Price10")]
        public decimal Price_10 { get; set; }

        [MapField("Price11")]
        public decimal Price_11 { get; set; }

        [MapField("Price12")]
        public decimal Price_12 { get; set; }

        [MapField("Price13")]
        public decimal Price_13 { get; set; }

        [MapField("Price14")]
        public decimal Price_14 { get; set; }

        [MapField("Price15")]
        public decimal Price_15 { get; set; }

        [MapField("Price16")]
        public decimal Price_16 { get; set; }

        [MapField("Price17")]
        public decimal Price_17 { get; set; }

        [MapField("Price18")]
        public decimal Price_18 { get; set; }

        [MapField("Price19")]
        public decimal Price_19 { get; set; }

        [MapField("Price20")]
        public decimal Price_20 { get; set; }
    }
}
