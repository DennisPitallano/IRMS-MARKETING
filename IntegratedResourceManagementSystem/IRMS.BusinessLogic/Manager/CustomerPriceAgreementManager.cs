using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.Manager
{
    public class CustomerPriceAgreementManager
    {
        #region Accessor
        CustomerPriceAgreementAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return CustomerPriceAgreementAccessor.CreateInstance(); }
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

        public List<CustomerPriceAgreement> PriceAgreement()
        {
            return Accessor.PriceAgreementBySelection(account.AccountCode,
                branch.BranchCode, brand.BrandCode);
        }
        public void Save(CustomerPriceAgreement PriceAgreement)
        {
            PriceAgreement.AccountCode = account.AccountCode;
            PriceAgreement.BranchCode = branch.BranchCode;
            PriceAgreement.BrandCode = brand.BrandCode;

            //TEMPORARY DATE AND USER SAVING
            PriceAgreement.DateCreated = DateTime.Now;
            PriceAgreement.CreatedBy = "SYSTEM";
            PriceAgreement.ModifiedBy = "SYSTEM";
            PriceAgreement.DateModified = DateTime.Now;
            //TEMPORARY DATE AND USER SAVING

            using (DbManager db = new DbManager())
            {
                try
                {
                    if (PriceAgreement.RecordNo != 0)
                    {
                        Accessor.Query.Update(db, PriceAgreement);
                    }
                    else
                    {
                        Accessor.Query.Insert(db, PriceAgreement);
                    }
                }
                catch (Exception except)
                {
                    throw new System.ArgumentException(except.Message);
                }
            }
        }
        public void Delete(CustomerPriceAgreement PriceAgreement)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, PriceAgreement);
            }
        }
    }
}