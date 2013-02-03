using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.ObjectModel;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class CustomerGroupAccessor : AccessorBase<CustomerGroupAccessor.DB, CustomerGroupAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM CUSTGROUP")]
        public abstract List<CustomerGroupClass> AllCustomerGroup();

        [SqlQuery("SELECT * FROM CUSTGROUP where CUSTTYPE = @CustomerGroupID")]
        public abstract List<CustomerGroupClass> CustomerGroupByCustomerGroupID(string CustomerGroupID);

    }

    public abstract class CustomerTypeAccessor : AccessorBase<CustomerTypeAccessor.DB, CustomerTypeAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM CUSTOMER_TYPE_TBL")]
        public abstract List<CustomerTypeClass> AllCustomerType();

        [SqlQuery("SELECT * FROM CUSTGROUP where CUST_TYPE_ID = @CustomerTypeID")]
        public abstract List<CustomerTypeClass> CustomerTypeByID(string CustomerTypeID);

    }
}
