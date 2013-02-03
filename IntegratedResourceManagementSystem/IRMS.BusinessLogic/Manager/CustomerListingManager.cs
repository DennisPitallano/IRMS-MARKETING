using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.Manager
{

    public class CustomerListingManager
    {
        private List<CustomerListHandler> customList = new List<CustomerListHandler>();
        #region OutletClassAccessor
        CustomerListHandlerAccessor CustomerListAccessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return CustomerListHandlerAccessor.CreateInstance(); }
        }
        #endregion

        public List<CustomerListHandler> AllCustomerList()
        {
            customList.Clear();
            customList = CustomerListAccessor.AllCustomerList();
            return customList;
        }
        public List<CustomerListHandler> CustomerList
        {
            get { return customList; }
        }
    }
}
