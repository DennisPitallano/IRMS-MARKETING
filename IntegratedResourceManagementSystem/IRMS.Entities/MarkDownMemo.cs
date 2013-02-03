using System;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.Entities
{
    [TableName("MDMemo")]
    public class MarkDownMemo
    {
        [MapField("ID"), PrimaryKey, NonUpdatable]
        public int RecordNo { get; set; }

        [MapField("MemoNo")]
        public string MemoNumber { get; set; }

        [MapField("MemoDate")]
        public DateTime MemoDate { get; set; }

        [MapField("MemoType")]
        public string MemoType { get; set; }

        [MapField("Header")]
        public string Header { get; set; }

        [MapField("Intro")]
        public string Intro { get; set; }

        [MapField("CustNo")]
        public int CustomerNumber { get; set; }

        [MapField("RemInvDate")]
        public DateTime RemInvdate { get; set; }

        [MapField("GenMemoNo")]
        public string GeneralMemoNumber { get; set; }

        [MapField("Message")]
        public string Message { get; set; }

        [MapField("Footer")]
        public string Footer { get; set; }

        [MapField("tmpid")]
        public int TempId { get; set; }
        [MapField("BrandName")]
        public string BrandName {get;set;}
        [MapField("ToDate")]
         public DateTime ToDate{get;set;}
       [MapField("FromDate")]
        public DateTime FromDate {get;set;}
       [MapField("Status")]
       public string Status { get; set; }
        [MapField("ynFurther")]
       public bool ynFurther { get; set; }
    }
}
