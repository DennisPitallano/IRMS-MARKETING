using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: December 2011
    /// Company: iServe
    /// Class Description: Style Class Model
    /// </summary>
    [TableName("STYLES")]
    public  class ItemStyle 
    {
        [MapField("RECORD_NO"), PrimaryKey , NonUpdatable]
        public long RecordNo { get; set; }
        [MapField("STYLE_NUMBER")]
        public string StyleNumber { get; set; }
        [MapField("DESCRIPTION")]
        public string Description { get; set; }
        [MapField("IS_APPROVE")]
        public string IsApprove { get; set; }
        [MapField("BRAND_CODE")]
        public string Brand { get; set; }
        [MapField("COST_PRICE")]
        public virtual decimal CostPrice { get; set; }
        [MapField("SRP")]
        public virtual decimal SRP { get; set; }
        [MapField("FABRIC")]
        public string Fabric { get; set; }
        [MapField("FITTING")]
        public string Fitting { get; set; }
        [MapField("SUB_FITTING")]
        public string SubFitting { get; set; }
        [MapField("AP_TYPE")]
        public string AP_type { get; set; }
        [MapField("IS_GENERIC")]
        public bool IsGeneric { get; set; }
        [MapField("IS_ACTIVE")]
        public bool IsActive { get; set; }

//        1. List Management                  85%
//2. Price Check                         85%
//3. MarkDown                            30%
//4. Monthly SOI                         75%
//5. CDI(Customer Delivery Index)        50%
//6. User Account Management    25%
    }
}
