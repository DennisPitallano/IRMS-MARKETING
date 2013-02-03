using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Mapping;
using BLToolkit.DataAccess;

namespace IRMS.ObjectModel
{
    [TableName("PULL_OUT_LETTERS")]
    public class PullOutLetter
    {

        [MapField("ID"), PrimaryKey, NonUpdatable]
        public int RecordNumber { get; set; }

        [MapField("PULL_OUT_CODE")]
        public string PullOutCode { get; set; }

        [MapField("CUSTOMER_NO")]
        public long CustomerNumber { get; set; }

        [MapField("COMPANY_NAME")]
        public string CompanyName { get; set; }

        [MapField("ACCT_NAME")]
        public string AccountName { get; set; }

        [MapField("BRANCH_NAME")]
        public string BranchName { get; set; }

        [MapField("BRAND_NAME")]
        public string BrandName { get; set; }

        [MapField("BRAND_CODE")]
        public string BrandCode { get; set; }

        [MapField("BRANCH_DEPT_CODE")]
        public string BranchDepartmentCode { get; set; }

        [MapField("BRAND_DEPT_CODE")]
        public string BrandDepartmentCode { get; set; }

        [MapField("SERIES_NO")]
        public string SeriesNumber { get; set; }

        [MapField("PULLOUT_DATE")]
        public DateTime PulloutDate { get; set; }

        [MapField("FORWARDERS")]
        public string Forwarders { get; set; }

        [MapField("LETTER_STATUS")]
        public string LetterStatus { get; set; }

        [MapField("IS_ACTIVE")]
        public bool IsActive { get; set; }

        [MapField("FOR_SM")]
        public bool ForSM { get; set; }

        [MapField("IS_BACK_LOAD")]
        public bool IsBackLoad { get; set; }

        [MapField("TOTAL_QTY")]
        public int TotalQuantity { get; set; }

        [MapField("TRANSACTION_DATE")]
        public DateTime TransactionDate { get; set; }
    }
}
    