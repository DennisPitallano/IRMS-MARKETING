using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.Entities
{
    [TableName("Style")]
    public class ProductStyle
    {
        [MapField("StyleID"),PrimaryKey,NonUpdatable]
        public int RecordNumber {get;set;}
        [MapField("StyleNo")]
        public string StyleNumber {get;set;}
        [MapField("BrandName")]
        public string BrandName {get;set;}
        [MapField("BrandName2")]
        public string BrandName2 {get;set;}
        [MapField("StyleDesc")]
        public string StyleDescription {get;set;}
        [MapField("Fabric")]
        public string Fabric {get;set;}
        [MapField("Fit")]
        public string Fit {get;set;}
        [MapField("Supplier")]
        public string Supplier {get;set;}
        [MapField("Cost")]
        public decimal Cost {get;set;}
        [MapField("Quantity")]
        public int Quantity {get;set;}
        [MapField("Remark")]
        public string Remark {get;set;}
        [MapField("CatID")]
        public int CategoryId {get;set;}
        [MapField("GenID")]
        public int GenId {get;set;}
        [MapField("Batch")]
        public int Batch {get;set;}
        [MapField("Master")]
        public int Master {get;set;}
        [MapField("AP_Type")]
        public char APType {get;set;}
        [MapField("username")]
        public string UserName { get; set; }
        [MapField("SubFitting")]
        public string SubFitting { get; set; }
        [MapField("IsGeneric")]
        public bool IsGeneric { get; set; }
        [MapField("IsActive")]
        public bool IsActive { get; set; }
    }
}
