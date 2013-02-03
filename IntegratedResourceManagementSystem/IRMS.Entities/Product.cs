using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.Entities
{
    [TableName("Product")]
    public class IRMSProduct
    {
        [MapField("ProdNo"),PrimaryKey ,NonUpdatable]
        public virtual int ProductNumber {get;set;}
        [MapField("SKU")]
        public virtual string SKU {get;set;}
        [MapField("StyleNo")]
        public virtual string StyleNumber {get;set;}
        [MapField("BrandName")]
        public virtual string BrandName {get;set;}
        [MapField("StyleDesc")]
        public virtual string StyleDescription {get;set;}
        [MapField("StyleColor")]
        public virtual string StyleColor {get;set;}
        [MapField("StyleSize")]
        public virtual string StyleSize {get;set;}
        [MapField("Price")]
        public virtual decimal Price {get;set;}
        [MapField("CatID")]
        public virtual int CategoryId {get;set;}
        [MapField("DateImport")]
        public virtual  DateTime DateImported {get;set;}
        [MapField("Batch")]
        public virtual int Batch {get;set;}
        [MapField("Master")]
        public virtual  int Master {get;set;}
        [MapField("ItemCode")]
        public virtual string ItemCode {get;set;}
        [MapField("ItemGroup")]
        public virtual string ItemGroup {get;set;}
        [MapField("AP_Type")]
        public virtual char APType { get; set; }
    }
}
