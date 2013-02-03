using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;
using System.Web.UI.WebControls;

namespace IRMS.BusinessLogic.Manager
{
    public class CustomerManager
    {
        #region Accessor
        CustomerAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return CustomerAccessor.CreateInstance(); }
        }
        CustomerHandlerAccessor HandlerAccessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return CustomerHandlerAccessor.CreateInstance(); }
        }
        #endregion

        private BranchClass branch = new BranchClass();
        private AccountClass account = new AccountClass();
        private Brand brand = new Brand();

        public Brand BrandObject
        {
            set { brand = value; }
        }
        public AccountClass AccountObject
        {
            set { account = value; }
        }
        public BranchClass BranchObject
        {
            set { branch = value; }
        }
        public string CustomerName
        {
            get 
            {
                string customerName = string.Empty;
                customerName = account.AccountName + "-" + branch.BranchName + "-" + brand.BrandDescription;
                return customerName;
            }
        }

        public Customer GetBranchByKey(long id)
        {
            return Accessor.Query.SelectByKey<Customer>(id) ?? new Customer();
        }
        public List<Customer> Customer()
        {
            return Accessor.Customer();
        }
        public List<CustomerHandler> CustomerHandler()
        {
            return this.HandlerAccessor.AllCustomer();
        }

        public void Save(Customer customer)
        {
            customer.AccountCode = account.AccountCode;
            customer.BranchCode = branch.BranchCode;
            customer.BrandCode = brand.BrandCode;

            //TEMPORARY DATE AND USER SAVING
            customer.DateCreated = DateTime.Now;
            customer.CreatedBy = "SYSTEM";
            customer.ModifiedBy = "SYSTEM";
            customer.DateModified = DateTime.Now;
            //TEMPORARY DATE AND USER SAVING
            using (DbManager db = new DbManager())
            {
                try
                {
                    if (customer.RecordNo != 0)
                    {
                        Accessor.Query.Update(db, customer);
                    }
                    else
                    {
                        Accessor.Query.Insert(db, customer);
                    }
                }
                catch (Exception except)
                {
                    throw new System.ArgumentException(except.Message);
                }
            }
        }
        public void Delete(Customer customer)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, customer);
            }
        }
        public List<CustomerHandler> SearchCustomer(string[] search_parameter)
        {
            string[] columns = new string[3];
            columns[0] = "ACCT_NAME";
            columns[1] = "BRANCH_NAME";
            columns[2] = "BRAND_NAME";
            return Accessor.Query.SelectByKeyWords<CustomerHandler>(search_parameter, columns);
        }

        public List<Customer> AllCustomers()
        {
            return Accessor.Query.SelectAll<Customer>();
        }

        /*public List<Customer> SearchCustomer(string[] search_parameter)
        {
            string[] columns = new string[1];
            columns[0] = "CUSTOMER_NAME";
            return Accessor.Query.SelectByKeyWords<Customer>(search_parameter, columns);
        }*/

        public void FilterCustomerByBrandName(SqlDataSource DataSource, string BrandName, string TextSearch)
        {
            string CommandText = string.Empty;
            CommandText = "SELECT [CustNo], [CompName] FROM [CustInfo] where Compname like '%" + TextSearch + "%" + BrandName + "%'";

            DataSource.SelectCommand = CommandText;
            DataSource.DataBind();
        }
    }
}
