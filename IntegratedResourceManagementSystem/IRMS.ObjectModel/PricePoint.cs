using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Mapping;
using BLToolkit.DataAccess;

namespace IRMS.ObjectModel
{
    [TableName("PRICEPOINT")]
    public class PricePoint
    {
        [MapField("ID"), PrimaryKey, NonUpdatable]
        public int RecordNo { get; set; }

        [MapField("StyleNo")]
        public string StyleNo { get; set; }

        [MapField("BrandName")]
        public string BrandName { get; set; }

        [MapField("PGNo")]
        public int PGNo { get; set; }

        [MapField("Price")]
        public decimal Price { get; set; }

        [MapField("DatePosted")]
        public DateTime Date_Posted { get; set; }

        [MapField("DateApproved")]
        public DateTime Date_Approved { get; set; }

        [MapField("FromDate")]
        public DateTime f_Date { get; set; }

        [MapField("ToDate")]
        public DateTime t_Date { get; set; }

        [MapField("PriceType")]
        public string Price_Type { get; set; }

        [MapField("GrpNo")]
        public int Group_No { get; set; }

        [MapField("GenMemoId")]
        public int Memo_ID { get; set; }

        [MapField("MemoNo")]
        public string Memo_No { get; set; }

        [MapField("ynOutRight")]
        public bool yn_OutRight { get; set; }
    }
}
