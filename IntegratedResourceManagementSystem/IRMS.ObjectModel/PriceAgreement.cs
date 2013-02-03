using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Mapping;
using BLToolkit.DataAccess;

namespace IRMS.ObjectModel
{
    [TableName("PRICE_AGREEMENT_TBL")]
    public class CustomerPriceAgreement
    {
        [MapField("RECORD_NO"), PrimaryKey, NonUpdatable]
        public long RecordNo { get; set; }

        [MapField("ACCT_CODE")]
        public string AccountCode { get; set; }

        [MapField("BRANCH_CODE")]
        public string BranchCode { get; set; }

        [MapField("BRAND_CODE")]
        public string BrandCode { get; set; }

        [MapField("PRICE_REG")]
        public string PriceGroupRegular { get; set; }

        [MapField("PRICE_MARKDOWN")]
        public string PriceGroupMarkdown { get; set; }

        [MapField("AREA_GROUP")]
        public string AreaGroupCode { get; set; }

        [MapField("SUB_AREA_GROUP")]
        public string SubAreaGroupCode { get; set; }

        [MapField("AREA_COORDINATOR")]
        public string CoordinatorName { get; set; }

        [MapField("DATE_CREATED")]
        public DateTime DateCreated { get; set; }

        [MapField("CREATED_BY")]
        public string CreatedBy { get; set; }

        [MapField("DATE_MODIFIED")]
        public DateTime DateModified { get; set; }

        [MapField("MODIFIED_BY")]
        public string ModifiedBy { get; set; }
    }
}
