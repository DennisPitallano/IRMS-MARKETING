using System;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    [TableName("CUSTOMER_TBL")]
    public class Customer
    {
        [MapField("RECORD_NO"), PrimaryKey, NonUpdatable]
        public long RecordNo { get; set; }

        [MapField("ACCT_CODE")]
        public string AccountCode { get; set; }

        [MapField("BRANCH_CODE")]
        public string BranchCode { get; set; }

        [MapField("BRAND_CODE")]
        public string BrandCode { get; set; }

        [MapField("CUST_GROUP_CODE")]
        public string GroupCode { get; set; }

        [MapField("DATE_START")]
        public DateTime DateStart { get; set; }

        [MapField("COMPANY_CODE")]
        public string CompanyCode { get; set; }

        [MapField("ARRANGEMENT_CODE")]
        public string ArrangementCode { get; set; }

        [MapField("CREDIT_LIMIT")]
        public float CreditLimit { get; set; }

        [MapField("TERMS")]
        public string Terms { get; set; }

        [MapField("DATE_CREATED")]
        public DateTime DateCreated { get; set; }

        [MapField("CREATED_BY")]
        public string CreatedBy { get; set; }

        [MapField("DATE_MODIFIED")]
        public DateTime DateModified { get; set; }

        [MapField("MODIFIED_BY")]
        public string ModifiedBy { get; set; }

    }

    public class CustomerHandler
    {
        [MapField("RECORD_NO"), PrimaryKey, NonUpdatable]
        public long RecordNo { get; set; }

        [MapField("ACCT_CODE")]
        public string AccountCode { get; set; }

        [MapField("ACCT_NAME")]
        public string AccountName { get; set; }

        [MapField("BRANCH_CODE")]
        public string BranchCode { get; set; }

        [MapField("BRANCH_NAME")]
        public string BranchName { get; set; }

        [MapField("BRAND_CODE")]
        public string BrandCode { get; set; }

        [MapField("CUSTOMER_NAME")]
        public string CustomerName { get; set; }

        [MapField("BRAND_DESCRIPTION")]
        public string BrandName { get; set; }

        [MapField("CUST_GROUP_CODE")]
        public string GroupCode { get; set; }

        [MapField("DATE_START")]
        public DateTime DateStart { get; set; }

        [MapField("COMPANY_CODE")]
        public string CompanyCode { get; set; }

        [MapField("ARRANGEMENT_CODE")]
        public string ArrangementCode { get; set; }

        [MapField("CREDIT_LIMIT")]
        public float CreditLimit { get; set; }

        [MapField("TERMS")]
        public string Terms { get; set; }

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
