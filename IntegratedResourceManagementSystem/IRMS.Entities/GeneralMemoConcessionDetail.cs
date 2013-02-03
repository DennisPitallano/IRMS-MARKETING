using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.Entities
{
    [TableName("GenMemoDtl")]
    public class GeneralMemoConcessionDetail
    {
        [MapField("ID"),PrimaryKey ,NonUpdatable]
        public int RecordNumber {get;set;}
        [MapField("GenMemoID")]
        public int GeneralMemoID {get;set;}
        [MapField("MemoNo")]
        public string MemoNumber {get;set;}
        [MapField("StyleNo")]
        public string StyleNumber {get;set;}
        [MapField("BrandName")]
        public string BrandName {get;set;}
        [MapField("StyleDesc")]
        public string StyleDescription {get;set;}
        [MapField("MDPrice")]
        public int MDPrice {get;set;}
        [MapField("CurrPrice")]
        public decimal CurrentPrice {get;set;}
        [MapField("Price1")]
        public decimal Price1 {get;set;}
        [MapField("Price2")]
        public decimal Price2 {get;set;}
        [MapField("Price3")]
        public decimal Price3 {get;set;}
        [MapField("Price4")]
        public decimal Price4 {get;set;}
        [MapField("Price5")]
        public decimal Price5 {get;set;}
        [MapField("Price6")]
        public decimal Price6 {get;set;}
        [MapField("Price7")]
        public decimal Price7 {get;set;}
        [MapField("Price8")]
        public  decimal Price8 {get;set;}
        [MapField("Price9")]
        public decimal Price9 {get;set;}
        [MapField("Price10")]
        public decimal Price10 {get;set;}
        [MapField("ynCreated")]
        public bool ynCreated {get;set;}
        [MapField("ynFurther")]
        public bool ynFurther { get; set; }
    }
}
