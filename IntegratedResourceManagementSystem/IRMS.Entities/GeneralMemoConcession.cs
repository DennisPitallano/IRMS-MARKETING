using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.Entities
{
    [TableName("GenMemo")]
   public class GeneralMemoConcession
    {
        [MapField("ID"),PrimaryKey ,NonUpdatable]
        public int RecordNumber {get;set;}
        [MapField("MemoNo")]
        public string MemoNumber {get;set;}
        [MapField("MemoDate")]
        public DateTime MemoDate {get;set;}
        [MapField("Header")]
        public string Header {get;set;}
        [MapField("Intro")]
        public string Intro {get;set;}
        [MapField("BrandName")]
        public string BrandName {get;set;}
        [MapField("GrpNo")]
        public int GroupNumber {get;set;}
        [MapField("PriceType")]
        public string PriceType {get;set;}
        [MapField("FromDate")]
        public DateTime FromDate {get;set;}
        [MapField("ToDate")]
        public DateTime ToDate {get;set;}
        [MapField("Message")]
        public string Message {get;set;}
        [MapField("Footer")]
        public string Footer {get;set;}
        [MapField("Status")]
        public string Status {get;set;}
        [MapField("Remark")]
        public string Remark {get;set;}
        [MapField("ynFurther")]
        public bool ynFurther { get; set; }
    }
}
