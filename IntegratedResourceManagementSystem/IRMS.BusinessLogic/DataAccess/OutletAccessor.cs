using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.ObjectModel;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class OutletClassAccessor : AccessorBase<OutletClassAccessor.DB, OutletClassAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM CUSTINFO WHERE ARRANGETYPE = @CustomerType")]
        public abstract List<OutletClass> AllOutlet();

        [SqlQuery("SELECT * FROM CUSTINFO WHERE CUSTCODE = @OutletCode")]
        public abstract OutletClass GetOutletByOutletCode(string OutletCode);
    }

    //public abstract class OutletContractAccessor : AccessorBase<OutletContractAccessor.DB, OutletContractAccessor>
    //{
    //    public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

    //    [SqlQuery("SELECT * FROM CUSTCONTRACT where CustNo = @OutletCode")]
    //    public abstract List<OutletContract> OutletContract(string OutletCode);
    //}

    public abstract class OutletReferenceLinkAccessor : AccessorBase<OutletReferenceLinkAccessor.DB, OutletReferenceLinkAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }
        [SqlQuery("SELECT * FROM CUSTOMER_REF_TBL where CUSTCODE= @OutletCode")]
        public abstract OutletReferenceLink OutletReference(string OutletCode);
    }


    //USED
    public abstract class CommissionListAccessor : AccessorBase<CommissionListAccessor.DB, CommissionListAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM COMMISSION_LIST_TBL")]
        public abstract List<CommissionListClass> AllCommission();

        [SqlQuery("SELECT * FROM COMMISSION_LIST_TBL WHERE FIELD_TYPE = 'REGULAR'")]
        public abstract List<CommissionListClass> GetSalesType();

        [SqlQuery("SELECT * FROM COMMISSION_LIST_TBL WHERE SALES_TYPE = 'CASH'")]
        public abstract List<CommissionListClass> GetFieldsType();
    }
    //USED
    public abstract class CommissionRateAccessor : AccessorBase<CommissionRateAccessor.DB, CommissionRateAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM COMMISSION_RATE_TBL")]
        public abstract List<CommissionRateClass> AllCommissionRates();
    }





    public abstract class CustomerCommissionAccessor : AccessorBase<CustomerCommissionAccessor.DB, CustomerCommissionAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM CUSTOMER_COMMISSION_TBL where CUST_CODE = @CustomerCode")]
        public abstract List<CustomerCommissionRate> CustomerCommission(string CustomerCode);
    }

}