using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;
using BLToolkit.Aspects;

//This CustomerInfoManager will be used for OUTLET MANAGEMENT
//to separate it from NON-OUTLET CUSTOMERS

namespace IRMS.BusinessLogic.Manager
{

    public class CustomerInfoManager
    {
        #region CustomerInfoAccessor
        CustomerInfoAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return CustomerInfoAccessor.CreateInstance(); }
        }
        #endregion
        /// <summary>
        /// RBC
        /// </summary>
        public List<CustomerInfo> GetAllCustomer()
        {
            return Accessor.CustomerInfomation();
        }
        [Cache(MaxCacheTime = 500, IsWeak = false)]
        public virtual CustomerInfo GetCustomerByKey(long id)
        {
            return Accessor.Query.SelectByKey<CustomerInfo>(id) ?? new CustomerInfo();
        }

        #region CustomerReferenceLinkAccessor
        CustomerReferenceLinkAccessor CustomerLinkAccessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return CustomerReferenceLinkAccessor.CreateInstance(); }
        }
        #endregion

        private CustomerReferenceLink customerRefLink = new CustomerReferenceLink();
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
        public string OutletCode
        {
            get 
            {
                return GenerateOutletCode();
            }
        }
        private string GenerateOutletCode()
        {
            string sResult = string.Empty;
            using (DbManager db = new DbManager())
            {

                db.SetSpCommand("Get_OutletSequence", db.Parameter("@GUID_NUMBER", "TEST")).ExecuteNonQuery();
                long lData = Convert.ToInt32(db.Parameter("@RETURN_VALUE").Value);

                DateTime ServerDate = Convert.ToDateTime(db.SetCommand("select getdate() as CurrentDate").ExecuteScalar());
                sResult = string.Format("O{0}-{1:00000}",ServerDate.Year.ToString().Substring(2,2),lData);
            }
            return sResult;
        }
        public string CollectionAddress
        {
            get { return customerRefLink.CollectionAddress; }
            set { customerRefLink.CollectionAddress = value; }
        }


        public void Save(CustomerInfo customerInfo)
        {
            using (DbManager db = new DbManager())
            {
                try
                {
                    if (!string.IsNullOrEmpty(customerInfo.CustomerCode))
                    {
                        SaveCustomerReferenceLink(customerInfo.CustomerCode, false);
                        Accessor.Query.Update(db, customerInfo);
                    }
                    else
                    {
                        customerInfo.CustomerCode = GenerateOutletCode();
                        SaveCustomerReferenceLink(customerInfo.CustomerCode, true);
                        Accessor.Query.Insert(db, customerInfo);
                    }
                }
                catch (Exception except)
                {
                    throw new System.ArgumentException(except.Message);
                }
            }
        }
        private void SaveCustomerReferenceLink(string CustomerCode,bool IsNew)
        {
            customerRefLink.AccountCode = account.AccountCode;
            customerRefLink.BranchCode = branch.BranchCode;
            customerRefLink.BrandCode = brand.BrandCode;
            customerRefLink.CustomerCode = CustomerCode;

            using (DbManager db = new DbManager())
            {
                try
                {
                    if (IsNew == true)
                    {
                        CustomerLinkAccessor.Query.Insert(db, customerRefLink);                        
                    }
                    else
                    {
                       CustomerLinkAccessor.Query.Update(db, customerRefLink); 
                    }
                }
                catch (Exception except)
                {
                    throw new System.ArgumentException(except.Message);
                }
            }
            

        }
        public void Delete(CustomerInfo customerInfo)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, customerInfo);
            }
        }
    }

    //public class CustomerContractManager
    //{
    //    #region Accessor
    //    CustomerContractAccessor Accessor
    //    {
    //        [System.Diagnostics.DebuggerStepThrough]
    //        get { return CustomerContractAccessor.CreateInstance(); }
    //    }
    //    #endregion

    //    private BranchClass branch = new BranchClass();
    //    private AccountClass account = new AccountClass();

    //    private Brand brand = new Brand();
    //    public Brand BrandObject
    //    {
    //        set { brand = value; }
    //    }


    //   /* public void Save(CustomerContract customerInfo)
    //    {
    //        customerInfo.AccountCode = account.AccountCode;
    //        customerInfo.BranchCode = branch.BranchCode;
    //        customerInfo.BrandCode = brand.BrandCode;

    //        //TEMPORARY DATE AND USER SAVING
    //        ContractTerm.DateCreated = DateTime.Now;
    //        ContractTerm.CreatedBy = "SYSTEM";
    //        ContractTerm.ModifiedBy = "SYSTEM";
    //        ContractTerm.DateModified = DateTime.Now;
    //        //TEMPORARY DATE AND USER SAVING

    //        using (DbManager db = new DbManager())
    //        {
    //            try
    //            {
    //                if (ContractTerm.RecordNo != 0)
    //                {
    //                    Accessor.Query.Update(db, ContractTerm);
    //                }
    //                else
    //                {
    //                    Accessor.Query.Insert(db, ContractTerm);
    //                }
    //            }
    //            catch (Exception except)
    //            {
    //                throw new System.ArgumentException(except.Message);
    //            }
    //        }
    //    }
    //    public void Delete(CustomerContract ContractTerm)
    //    {
    //        using (DbManager db = new DbManager())
    //        {
    //            Accessor.Query.Delete(db, ContractTerm);
    //        }
    //    }*/
    //}

    public class CustomerGroupManager
    {
        #region CustomerGroupAccessor
        CustomerGroupAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return CustomerGroupAccessor.CreateInstance(); }
        }
        #endregion 

        public List<CustomerGroupClass> AllCustomerGroup()
        {
            return Accessor.AllCustomerGroup();
        }

        public List<CustomerGroupClass> CustomerGroupByGroupID(string GroupID)
        {
            return Accessor.CustomerGroupByCustomerGroupID(GroupID);
        }
            
    }

    public class CustomerTypeManager
    {
        #region CustomerTypeAccessor
        CustomerTypeAccessor customerTypeAccessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return CustomerTypeAccessor.CreateInstance(); }
        }
        #endregion

        public List<CustomerTypeClass> AllCustomerType()
        {
            return customerTypeAccessor.AllCustomerType();
        }

        public List<CustomerTypeClass> CustomerTypeByID(string customerTypeID)
        {
            return customerTypeAccessor.CustomerTypeByID(customerTypeID);
        }

    }

}