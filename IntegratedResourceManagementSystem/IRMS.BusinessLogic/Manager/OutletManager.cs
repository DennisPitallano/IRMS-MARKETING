using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;
using System.Data;


namespace IRMS.BusinessLogic.Manager
{
    public class OutletManager
    {
        #region OutletClassAccessor
        OutletClassAccessor OutletAccessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return OutletClassAccessor.CreateInstance(); }
        }
        #endregion

        #region OutletReferenceLinkAccessor
        OutletReferenceLinkAccessor OutletLinkAccessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return OutletReferenceLinkAccessor.CreateInstance(); }
        }
        #endregion

        #region CompanyAccessor
        CompanyAccessor CompAccessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return CompanyAccessor.CreateInstance(); }
        }
        #endregion

        #region CommissionListAccessor
        CommissionListAccessor CommissionAccessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return CommissionListAccessor.CreateInstance(); }
        }
        #endregion

        #region CommissionRateAccessor
        CommissionRateAccessor CommRateAccessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return CommissionRateAccessor.CreateInstance(); }
        }
        #endregion


        private OutletReferenceLink outletRefLink = new OutletReferenceLink();
        private OutletClass outlet = new OutletClass();
        private CompanyClass company = new CompanyClass();

        private BranchClass branch = new BranchClass();
        private AccountClass account = new AccountClass();
        private Brand brand = new Brand();

        private DataTable dt = new DataTable();

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

        public string OutletName
        {
            get
            {
                string outletName = string.Empty;
                outletName = account.AccountName + "-" + branch.BranchName + "-" + brand.BrandDescription;
                return outletName;
            }
        }
        public string OutletCode
        {
            get
            {
                return outletRefLink.CustomerCode;
            }
        }


        public OutletClass Outlet
        {
            get { return outlet; }
        }
        public CompanyClass Company
        {
            get { return company; }
        }





        private string GenerateOutletCode()
        {
            string sResult = string.Empty;
            using (DbManager db = new DbManager())
            {

                db.SetSpCommand("Get_OutletSequence", db.Parameter("@GUID_NUMBER", "TEST")).ExecuteNonQuery();
                long lData = Convert.ToInt32(db.Parameter("@RETURN_VALUE").Value);

                DateTime ServerDate = Convert.ToDateTime(db.SetCommand("select getdate() as CurrentDate").ExecuteScalar());
                sResult = string.Format("O{0}-{1:00000}", ServerDate.Year.ToString().Substring(2, 2), lData);
            }
            return sResult;
        }
        public string CollectionAddress
        {
            get { return outletRefLink.CollectionAddress; }
            set
            {
                outletRefLink.CollectionAddress = value;
            }
        }
        public string DepartmentCode
        {
            get { return outletRefLink.DepartmentCode; }
            set
            {
                outletRefLink.DepartmentCode = value;
            }
        }


        public bool FindOutlet(string outletCode)
        {
            bool bResult = false;
            try
            {
                outlet = OutletAccessor.GetOutletByOutletCode(outletCode);
                outletRefLink = OutletLinkAccessor.OutletReference(outletCode);
                if (outlet != null)
                {
                    bResult = true;
                }
            }
            catch (Exception except)
            {
            }

            return bResult;
        }
        public void Save(OutletClass _outlet)
        {
            using (DbManager db = new DbManager())
            {
                try
                {
                    _outlet.AddressOne = branch.AddressOne;
                    _outlet.AddressTwo = branch.AddressTwo;
                    _outlet.ArrangementType = "CONCESSION";
                    _outlet.ContactPerson = branch.ContactPerson;
                    _outlet.DesignationPost = branch.PositionDescription;
                    _outlet.ShippingAddress = branch.ShippingAddress;
                    _outlet.TelephoneNo = branch.TelephoneNumber;
                    _outlet.FaxNo = branch.FaxNumber;
                    _outlet.TIN_No = branch.TIN;

                    if (!string.IsNullOrEmpty(_outlet.CustomerCode))
                    {
                        SaveOutletReferenceLink(_outlet.CustomerCode, false);
                        OutletAccessor.Query.Update(db, _outlet);
                    }
                    else
                    {
                        //this.outletRefLink.CustomerCode = GenerateOutletCode();
                        SaveOutletReferenceLink(GenerateOutletCode(), true);
                        _outlet.CustomerCode = outletRefLink.CustomerCode;
                        OutletAccessor.Query.Insert(db, _outlet);
                    }
                }
                catch (Exception except)
                {
                    throw new System.ArgumentException(except.Message);
                }
            }
        }
        public void Update()
        {
            using (DbManager db = new DbManager())
            {
                try
                {
                    OutletAccessor.Query.Update(db, outlet);
                    SaveOutletReferenceLink(outlet.CustomerCode, false);
                }
                catch (Exception except)
                {
                    throw new System.ArgumentException(except.Message);
                }
            }
        }
        private void SaveOutletReferenceLink(string OutletCode, bool IsNew)
        {

            if (IsNew == true)
            {
                outletRefLink.AccountCode = account.AccountCode;
                outletRefLink.BranchCode = branch.BranchCode;
                outletRefLink.BrandCode = brand.BrandCode;
            }
            outletRefLink.CustomerCode = OutletCode;


            using (DbManager db = new DbManager())
            {
                try
                {

                    if (IsNew == true)
                    {
                        OutletLinkAccessor.Query.Insert(db, outletRefLink);
                    }
                    else
                    {
                        OutletLinkAccessor.Query.Update(db, outletRefLink);
                    }
                }
                catch (Exception except)
                {
                    throw new System.ArgumentException(except.Message);
                }
            }


        }
        public void SaveContract(CustomerCommissionRateListAccessor commissionList, CustomerPayableListAccessor payableList)
        {
            using (DbManager db = new DbManager())
            {
                try
                {
                    db.Command.CommandText = string.Format(@"delete from CUSTOMER_COMMISSION_TBL where 
CUSTCODE = '{0}'", outletRefLink.CustomerCode);
                    db.ExecuteNonQuery();

                    foreach (CustomerCommissionRate commrate in commissionList.AllCommission)
                    {
                        if (string.IsNullOrEmpty(commrate.CustomerCode))
                            commrate.CustomerCode = outletRefLink.CustomerCode;

                        db.Command.CommandText = string.Format(@"insert into CUSTOMER_COMMISSION_TBL 
    values('{0}','{1}','{2}',{3})",
                                  commrate.CustomerCode,
                                  commrate.SalesType,
                                  commrate.FieldType,
                                  commrate.FieldValue);

                        db.ExecuteNonQuery();
                    }

                    db.Command.CommandText = string.Format(@"delete from CUSTOMER_PAYABLE_TBL where 
CUSTCODE = '{0}'", outletRefLink.CustomerCode);
                    db.ExecuteNonQuery();

                    foreach (CustomerPayableClass payable in payableList.AllPayables)
                    {
                        if (string.IsNullOrEmpty(payable.CustomerCode))
                            payable.CustomerCode = outletRefLink.CustomerCode;

                        db.Command.CommandText = string.Format(@"insert into CUSTOMER_PAYABLE_TBL 
    values('{0}','{1}',{2})",
                                  payable.CustomerCode,
                                  payable.PayableCode,
                                  payable.PayableAmount);

                        db.ExecuteNonQuery();
                    }
                }
                catch (Exception except)
                {
                    throw new System.ArgumentException(except.Message);
                }
            }
        }
        public void Delete(OutletClass outlet)
        {
            using (DbManager db = new DbManager())
            {
                OutletAccessor.Query.Delete(db, outlet);
            }
        }

        public List<CommissionListClass> AllCommissionList()
        {
            return CommissionAccessor.AllCommission();
        }
        public List<CommissionListClass> CommissionSalesType()
        {
            return CommissionAccessor.GetSalesType();
        }
        public List<CommissionListClass> CommissionFieldsType()
        {
            return CommissionAccessor.GetFieldsType();
        }
        public List<CommissionRateClass> AllCommisssionRates()
        {
            return CommRateAccessor.AllCommissionRates();
        }
        public List<CompanyClass> AllCompany()
        {
            return this.CompAccessor.AllCompany();
        }

        public OutletReferenceLink GetOutletLinkReference(string OutletCode)
        {
            return OutletLinkAccessor.OutletReference(OutletCode);
        }
    }

}
