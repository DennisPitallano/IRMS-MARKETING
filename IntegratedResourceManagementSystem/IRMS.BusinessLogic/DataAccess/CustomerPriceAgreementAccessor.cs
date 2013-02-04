using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.ObjectModel;

namespace IRMS.BusinessLogic.DataAccess
{

    public abstract class CustomerPriceAgreementAccessor : AccessorBase<CustomerPriceAgreementAccessor.DB, CustomerPriceAgreementAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery(@"SELECT * FROM PRICE_AGREEMENT_TBL where ACCT_CODE = @AccountCode
and BRANCH_CODE = @BranchCode and BRAND_CODE = @BrandCode")]
        public abstract List<CustomerPriceAgreement> PriceAgreementBySelection(string AccountCode, 
            string BranchCode, string BrandCode);
    }
}
