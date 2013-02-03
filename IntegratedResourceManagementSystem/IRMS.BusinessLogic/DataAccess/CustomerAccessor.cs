using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.ObjectModel;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class CustomerAccessor : AccessorBase<CustomerAccessor.DB, CustomerAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM CUSTOMER_TBL")]
        public abstract List<Customer> Customer();

        [SqlQuery("SELECT * FROM CUSTOMER_TBL where ACCT_CODE = @AccountCode")]
        public abstract List<Customer> CustomerByAccountCode(string AccountCode);
    }

    public abstract class CustomerHandlerAccessor : AccessorBase<CustomerHandlerAccessor.DB, CustomerHandlerAccessor>
    {
        public class DB : DbManager { public DB(): base("IRMSConnectionString"){}}

        [SqlQuery(@"SELECT A.ACCT_CODE, B.ACCT_NAME, A.BRANCH_CODE,
C.BRANCH_NAME, A.BRAND_CODE, D.BRAND_DESCRIPTION, A.CUST_GROUP_CODE,
A.DATE_START, A.COMPANY_CODE, A.ARRANGEMENT_CODE, A.CREDIT_LIMIT,
A.TERMS FROM CUSTOMER_TBL A, ACCOUNT_TBL B, BRANCH_TBL C, BRANDS D 
where A.ACCT_CODE = @AccountCode and A.ACCT_CODE = B.ACCT_CODE 
and A.BRANCH_CODE = @BranchCode and A.BRANCH_CODE = C.BRANCH_CODE and
A.BRAND_CODE = @BrandCode and A.BRAND_CODE = D.BRAND_CODE")]

        public abstract List<CustomerHandler> CustomerBySelection(string AccountCode, string BranchCode, string BrandCode);


        [SqlQuery(@"SELECT A.RECORD_NO, A.ACCT_CODE, B.ACCT_NAME, A.BRANCH_CODE,
C.BRANCH_NAME, A.BRAND_CODE, D.BRAND_DESCRIPTION, 
(B.ACCT_NAME+'-'+C.BRANCH_NAME+'-'+D.BRAND_DESCRIPTION) as CUSTOMER_NAME,
A.CUST_GROUP_CODE,
A.DATE_START, A.COMPANY_CODE, A.ARRANGEMENT_CODE, A.CREDIT_LIMIT,
A.TERMS FROM CUSTOMER_TBL A, ACCOUNT_TBL B, BRANCH_TBL C, BRANDS D 
where A.ACCT_CODE = B.ACCT_CODE and A.BRANCH_CODE = C.BRANCH_CODE and A.BRAND_CODE = D.BRAND_CODE")]

        public abstract List<CustomerHandler> AllCustomer();

    }
}