using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: December 2011
    /// Company: iServe
    /// Class Description: Product Class Model
    /// </summary>
    [TableName("PRODUCTS")]
    public class Product
    {
        [MapField("RECORD_NO"), PrimaryKey, NonUpdatable]
        public virtual long RecordNo { get; set; }

        [MapField("STYLE_NO")]
        public virtual string StyleNumber { get; set; }

        [MapField("DESCRIPTION")]
        public virtual string Description { get; set; }

        [MapField("ITEM_CODE")]
        public virtual string ItemCode { get; set; }

        [MapField("SKU_BARCODE")]
        public virtual string SKUBarcode { get; set; }

        [MapField("DATE_RECORDED")]
        public virtual DateTime DateCreated { get; set; }

        [MapField("IS_ACTIVE")]
        public virtual string IsActive { get; set; }

        [MapField("COLOR")]
        public virtual string Color { get; set; }

        [MapField("SIZE")]
        public virtual string Size { get; set; }

        [MapField("BRAND")]
        public virtual string Brand { get; set; }

        [MapField("AP_TYPE")]
        public virtual string AP_TYPE { get; set; }

        [MapField("SRP")]
        public virtual decimal SRP { get; set; }
    }
}
