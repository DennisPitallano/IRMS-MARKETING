using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.ObjectModel;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class CustomerInfoAccessor : AccessorBase<CustomerInfoAccessor.DB, CustomerInfoAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM CUSTINFO")]
        public abstract List<CustomerInfo> CustomerInfomation();
    }

    //public abstract class CustomerContractAccessor : AccessorBase<CustomerContractAccessor.DB, CustomerContractAccessor>
    //{
    //    public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

    //    [SqlQuery("SELECT * FROM CUSTCONTRACT")]
    //    public abstract List<CustomerContract> CustomerContract();
    //}

    public abstract class CustomerReferenceLinkAccessor : AccessorBase<CustomerReferenceLinkAccessor.DB, CustomerReferenceLinkAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM CUSTOMER_REF_TBL")]
        public abstract List<CustomerReferenceLink> customerReferenceLink();
    }
    public abstract class CustomerListHandlerAccessor : AccessorBase<CustomerListHandlerAccessor.DB, CustomerListHandlerAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery(@"SELECT 
F.ACCT_CODE, A.ACCT_NAME,
F.BRANCH_CODE, G.BRANCH_NAME, 
F.BRAND_CODE, B.BRAND_DESCRIPTION,
C.CUSTCODE, C.COMPNAME, 
C.AGNO, D.GROUPNAME AS AREANAME, 
C.SAGNO, E.GROUPNAME AS SUBAREANAME, 
C.CONTRACTDATE 
from ACCOUNT_TBL A, BRANDS B, CUSTINFO C, GRPAREA D, GRPSUBAREA E, CUSTOMER_REF_TBL F, BRANCH_TBL G
where 
F.CUSTCODE = C.CUSTCODE and 
A.ACCT_CODE = F.ACCT_CODE and 
(F.ACCT_CODE = G.ACCT_CODE and F.BRANCH_CODE = G.BRANCH_CODE) and 
B.BRAND_CODE = F.BRAND_CODE and 
D.AGNO = C.AGNO and 
C.SAGNO = E.SAGNO
order by custcode")]
        public abstract List<CustomerListHandler> AllCustomerList();
    }
}