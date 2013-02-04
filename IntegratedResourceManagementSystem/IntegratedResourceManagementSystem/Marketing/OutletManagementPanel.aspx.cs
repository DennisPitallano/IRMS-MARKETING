using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using System.Data;


namespace IntegratedResourceManagementSystem.Christine
{
    public partial class OutletManagementPanel : System.Web.UI.Page
    {
        private OutletManager OM = new OutletManager();
        private GroupAreaManager GAM = new GroupAreaManager();
        private SubGroupAreaManager SGAM = new SubGroupAreaManager();
        private PriceGroupManager PGM = new PriceGroupManager();

        private AccountsManager AM = new AccountsManager();
        private BranchManager BM = new BranchManager();
        private BrandManager BrM = new BrandManager();

        private BranchClass branch = new BranchClass();
        private AccountClass account = new AccountClass();
        private Brand brand = new Brand();

        private DataTable dt = new DataTable("Commission Table");

        private CustomerCommissionRateListAccessor commRateListAccessor = new CustomerCommissionRateListAccessor();
        private CustomerPayableListAccessor customerPayableListAccessor = new CustomerPayableListAccessor();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ResetContents();
                if (Request["processID"] == "new")
                {
                    pnltext.Visible = false;
                    return;
                }

                if (Request["processID"] == "update")
                {
                    pnlcombo.Visible = false;

                    if (OM.FindOutlet(Request["outletID"]))
                    {
                        txtAccountName.Text = Request["account"];
                        txtBranchName.Text = Request["branch"];
                        txtBrandName.Text = Request["brand"];
                        txtCustomerCode.Text = OM.Outlet.CustomerCode;
                        txtOutletName.Text = OM.Outlet.CompanyName;
                        txtDateStart.Text = OM.Outlet.ContractDate.ToString("MM/dd/yyyy");
                        dlUnderCompany.SelectedValue = OM.Outlet.CompanyNo.ToString();
                        dlPriceGroupReg.SelectedValue = OM.Outlet.PriceGroupNo.ToString();
                        dlPriceGroupMDown.SelectedValue = OM.Outlet.PriceGroupMarkdownNo.ToString();
                        dlAreaGroup.SelectedValue = OM.Outlet.AreaGroupNo.ToString();
                        dlAreaGroup_SelectedIndexChanged(null, null);
                        dlSubAreaGroup.SelectedValue = OM.Outlet.SubAreaGroupNo.ToString();
                        txtAreaCoordinator.Text = OM.Outlet.AgentName;

                        txtCreditLimit.Text = OM.Outlet.CreditLimit.ToString();
                        txtCollectionAddress.Text = OM.Outlet.BillingAddress;
                        txtTerms.Text = OM.Outlet.Terms;
                        txtDepartmentCode.Text = OM.DepartmentCode;

                        commRateListAccessor.FindCommissionListByCustomerCode(OM.Outlet.CustomerCode);
                        BindableObjects();
                        customerPayableListAccessor.FindPayableListByCustomerCode(OM.Outlet.CustomerCode);

                        txtUtilitiesFee.Text = GetPayablesValue("P001");
                        txtStockRoomFee.Text = GetPayablesValue("P002");
                        txtAmountInsured.Text = GetPayablesValue("P003");
                        txtAdditional.Text = GetPayablesValue("P004");

                        if (OM.Outlet.LiquidationStatus == 0)
                            rdioLiquidationStatus.SelectedValue = "0";
                        else
                            rdioLiquidationStatus.SelectedValue = "1";

                        btnSave.Text = "UPDATE";
                        btnClear.Visible = false;
                    }
                }
            }



            //CreateDataTable();
        }
        private void CreateDataTable()
        {
            dt.Columns.Add("charge_type", typeof(string));
            dt.Columns.Add("field_type", typeof(string));
            dt.Columns.Add("field_value", typeof(float));
        }

        private void LoadAllAccounts()
        {
            dlAccounts.Items.Clear();
            dlAccounts.Items.Add(new ListItem("", ""));
            foreach (AccountClass account in AM.Accounts())
            {
                dlAccounts.Items.Add(new ListItem(account.AccountName, account.AccountCode));
            }
            LoadBranchByAccountCode(dlAccounts.SelectedValue);
        }
        private void LoadAllBrands()
        {
            dlBrand.Items.Clear();
            dlBrand.Items.Add(new ListItem("", ""));
            foreach (Brand brand in BrM.Brands())
            {
                dlBrand.Items.Add(new ListItem(brand.BrandDescription, brand.BrandCode));
            }
        }
        private void LoadGroupArea()
        {
            this.dlAreaGroup.Items.Clear();
            dlAreaGroup.Items.Add(new ListItem("", ""));

            foreach (GroupAreaClass groupArea in GAM.GroupArea())
            {
                dlAreaGroup.Items.Add(new ListItem(groupArea.GroupName.ToUpper(), groupArea.AreaGroupNo.ToString()));
            }

            dlSubAreaGroup.Items.Clear();
            dlSubAreaGroup.Items.Add(new ListItem("", ""));

        }
        private void LoadSubGroupArea(int SubGroupNo)
        {
            dlSubAreaGroup.Items.Clear();
            dlSubAreaGroup.Items.Add(new ListItem("", ""));

            foreach (SubGroupAreaClass subGroupArea in SGAM.SubGroupArea(SubGroupNo))
            {
                dlSubAreaGroup.Items.Add(new ListItem(subGroupArea.GroupName.ToUpper(), subGroupArea.SubAreaGroupNo.ToString()));
            }
        }
        private void LoadBranchByAccountCode(string AccountCode)
        {
            dlBranch.Items.Clear();
            if (!string.IsNullOrEmpty(AccountCode))
            {
                string[] x = new string[1];
                x[0] = AccountCode;

                foreach (BranchClass branch in BM.SearchBranchByAccountCode(x))
                {
                    dlBranch.Items.Add(new ListItem(branch.BranchName, branch.BranchCode));
                }
            }
        }


        private void LoadCommission()
        {
            dlChargeType.Items.Clear();
            dlChargeType.Items.Add(new ListItem(""));

            foreach (CommissionListClass comm in OM.CommissionSalesType())
            {
                dlChargeType.Items.Add(new ListItem(comm.SalesType));
            }

            dlFieldType.Items.Clear();
            dlFieldType.Items.Add(new ListItem(""));

            foreach (CommissionListClass commx in OM.CommissionFieldsType())
            {
                dlFieldType.Items.Add(new ListItem(commx.FieldType));
            }

            dlRateValue.Items.Clear();
            dlRateValue.Items.Add(new ListItem(""));

            foreach (CommissionRateClass rate in OM.AllCommisssionRates())
            {
                dlRateValue.Items.Add(new ListItem(rate.RateDescription, rate.RateValue.ToString()));
            }

        }
        private void LoadPriceGroup()
        {
            dlPriceGroupReg.Items.Clear();
            dlPriceGroupReg.Items.Add("");

            foreach (PriceGroup pgroup in PGM.PriceGroupRegular())
            {
                dlPriceGroupReg.Items.Add(new ListItem(pgroup.GroupName.ToUpper(), pgroup.PriceID.ToString()));
            }

            dlPriceGroupMDown.Items.Clear();
            dlPriceGroupMDown.Items.Add("");

            foreach (PriceGroup pgroupx in PGM.PriceGroupMarkdown())
            {
                dlPriceGroupMDown.Items.Add(new ListItem(pgroupx.GroupName.ToUpper(), pgroupx.PriceID.ToString()));
            }
        }
        private void LoadCompany()
        {
            dlUnderCompany.Items.Clear();
            dlUnderCompany.Items.Add("");

            foreach (CompanyClass company in OM.AllCompany())
            {
                dlUnderCompany.Items.Add(new ListItem(company.CompanyName.ToUpper(), company.CompanyNumber.ToString()));
            }
        }

        private void GetCustomerName()
        {
            GetObjectsFromDropList();
            txtOutletName.Text = OM.OutletName;
        }
        private void GetObjectsFromDropList()
        {
            if (dlAccounts.SelectedIndex > 0)
            {
                AccountClass accountSelect = new AccountClass();
                accountSelect = AM.GetAccountByAccountCode(dlAccounts.SelectedValue);
                account = accountSelect;
                //CIM.AccountObject = accountSelect;
                OM.AccountObject = accountSelect;
            }

            if (dlBranch.SelectedIndex > -1)
            {
                BranchClass branchSelect = new BranchClass();
                branchSelect = BM.GetBranchByBranchCode(dlBranch.SelectedValue);
                branch = branchSelect;
                //CIM.BranchObject = branchSelect;
                OM.BranchObject = branchSelect;
            }

            if (dlBrand.SelectedIndex > 0)
            {
                Brand brandlocal = new Brand();

                brandlocal = BrM.GetBrandByBrandCode(dlBrand.SelectedValue);
                brand = brandlocal;
                //CIM.BrandObject = brandlocal;
                OM.BrandObject = brandlocal;
            }
        }
        private void GetCommissionRatesGrid()
        {
            CustomerCommissionRate commclass;
            foreach (GridViewRow grow in gvCommissionRates.Rows)
            {
                commclass = new CustomerCommissionRate();
                commclass.SalesType = grow.Cells[2].Text;
                commclass.FieldType = grow.Cells[3].Text;
                commclass.FieldValue = (float)Convert.ToDecimal(grow.Cells[4].Text);
                commRateListAccessor.AddCommission(commclass);
            }
        }
        private void GetPayablesValue()
        {
            customerPayableListAccessor.AllPayables.Clear();
            customerPayableListAccessor.AddPayable(new CustomerPayableClass
            {
                PayableCode = "P001",
                PayableAmount = (float)Convert.ToDecimal(this.txtUtilitiesFee.Text)
            });
            customerPayableListAccessor.AddPayable(new CustomerPayableClass
            {
                PayableCode = "P002",
                PayableAmount = (float)Convert.ToDecimal(txtStockRoomFee.Text)
            });
            customerPayableListAccessor.AddPayable(new CustomerPayableClass
            {
                PayableCode = "P003",
                PayableAmount = (float)Convert.ToDecimal(this.txtAmountInsured.Text)
            });
            customerPayableListAccessor.AddPayable(new CustomerPayableClass
            {
                PayableCode = "P004",
                PayableAmount = (float)Convert.ToDecimal(this.txtAdditional.Text)
            });
        }
        private string GetPayablesValue(string PayableCode)
        {
            CustomerPayableClass payableItem = new CustomerPayableClass();

            payableItem = this.customerPayableListAccessor.AllPayables.Find(delegate(CustomerPayableClass cpayable)
            {
                return (cpayable.PayableCode == PayableCode);
            });

            if (payableItem == null)
                return "0.00";
            else
                return string.Format("{0:0.00}", payableItem.PayableAmount);
        }

        protected void dlAccounts_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBranchByAccountCode(dlAccounts.SelectedValue);
            dlObject_SelectedIndexChanged(sender, e);
        }
        protected void dlObject_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCustomerName();
        }
        protected void dlAreaGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            dlSubAreaGroup.Items.Clear();
            if (!string.IsNullOrEmpty(dlAreaGroup.Text))
            {
                LoadSubGroupArea(Convert.ToInt32(dlAreaGroup.SelectedValue));
            }
        }
        protected void dlCustomerGroup_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ResetContents();
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(dlChargeType.SelectedValue) == true ||
                string.IsNullOrEmpty(dlFieldType.SelectedValue) == true ||
                string.IsNullOrEmpty(dlRateValue.SelectedValue) == true)
            {
                ResponseMessage("Fields items required! (Sales type, Field type, Commission rate)");
                dlChargeType.Focus();
                return;
            }

            GetCommissionRatesGrid();
            CustomerCommissionRate commclass;
            commclass = new CustomerCommissionRate();
            commclass.SalesType = dlChargeType.Text;
            commclass.FieldType = dlFieldType.Text;
            commclass.FieldValue = (float)Convert.ToDecimal(dlRateValue.SelectedValue);
            this.commRateListAccessor.AddCommission(commclass);

            gvCommissionRates.DataSource = commRateListAccessor.AllCommission;
            gvCommissionRates.DataBind();
            LoadCommission();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            GetObjectsFromDropList();
            GetCommissionRatesGrid();
            GetPayablesValue();



            OutletClass NewOutlet = new OutletClass();

            if (btnSave.Text == "UPDATE")
            {
                GetUpdateInfo();
            }
            else
            {
                    OM.CollectionAddress = txtCollectionAddress.Text;
                    OM.DepartmentCode = txtDepartmentCode.Text;
                    //CustomerNo
                    NewOutlet.CompanyName = OM.OutletName;
                    //MainCustomerNo    //MainCustomerNo = null,
                    //CustomerCode
                    //CustomerType
                    NewOutlet.BrandName = dlBrand.Text;
                    //CBrand
                    NewOutlet.AgentName = txtAreaCoordinator.Text;
                    NewOutlet.PriceGroupNo = Convert.ToInt32(dlPriceGroupReg.SelectedValue);
                    NewOutlet.PriceGroupMarkdownNo = Convert.ToInt32(dlPriceGroupMDown.SelectedValue);
                    NewOutlet.AreaGroupNo = Convert.ToInt32(dlAreaGroup.SelectedValue);
                    NewOutlet.SubAreaGroupNo = Convert.ToInt32(dlSubAreaGroup.SelectedValue);
                    //BrandNameNo
                    //BrandNameNo2
                    NewOutlet.CompanyNo = Convert.ToInt32(dlUnderCompany.SelectedValue);
                    //ArrangementType
                    //AddressOne
                    //AddressTwo
                    //TIN_No
                    //ContactPerson
                    //DesignationPost
                    //TelephoneNo
                    //CellphoneNo
                    //FaxNo
                    NewOutlet.BillingAddress = txtCollectionAddress.Text;
                    //ShippingAddress
                    //OrderedList
                    NewOutlet.CreditLimit = (float)Convert.ToDecimal(txtCreditLimit.Text);
                    NewOutlet.Terms = txtTerms.Text;
                    NewOutlet.ContractDate = Convert.ToDateTime(txtDateStart.Text);
                    NewOutlet.LiquidationStatus = Convert.ToInt16(rdioLiquidationStatus.SelectedValue);

                              
            }
            //SAVE FIRST TO CUSTOMER REFERENCE TABLE
            try
            {
                if (btnSave.Text.ToUpper() == "SAVE")
                    OM.Save(NewOutlet);
                else
                    OM.Update();

                OM.SaveContract(this.commRateListAccessor, this.customerPayableListAccessor);
                ResponseMessage("Saved new outlet (Outlet Code:" + OM.OutletCode + ")");
                ResetContents();

                //btnClear.Click();
            }
            catch (Exception except)
            {
                throw new System.ArgumentException(except.Message);
            }
            Response.Redirect("CustomListing.aspx");
        }
        private void GetUpdateInfo()
        {
            OM.FindOutlet(txtCustomerCode.Text);
            OM.CollectionAddress = txtCollectionAddress.Text;
            OM.DepartmentCode = txtDepartmentCode.Text;
            OM.Outlet.AgentName = txtAreaCoordinator.Text;
            OM.Outlet.PriceGroupNo = Convert.ToInt32(dlPriceGroupReg.SelectedValue);
            OM.Outlet.PriceGroupMarkdownNo = Convert.ToInt32(dlPriceGroupMDown.SelectedValue);
            OM.Outlet.AreaGroupNo = Convert.ToInt32(dlAreaGroup.SelectedValue);
            OM.Outlet.SubAreaGroupNo = Convert.ToInt32(dlSubAreaGroup.SelectedValue);

            OM.Outlet.CompanyNo = Convert.ToInt32(dlUnderCompany.SelectedValue);
            OM.Outlet.BillingAddress = txtCollectionAddress.Text;

            OM.Outlet.CreditLimit = (float)Convert.ToDecimal(txtCreditLimit.Text);
            OM.Outlet.Terms = txtTerms.Text;
            OM.Outlet.ContractDate = Convert.ToDateTime(txtDateStart.Text);
            OM.Outlet.LiquidationStatus = Convert.ToInt16(rdioLiquidationStatus.SelectedValue);
        }


        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("~\\Marketing\\CustomListing.aspx");
        }

        protected void gvCommissionRates_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GetCommissionRatesGrid();
            commRateListAccessor.AllCommission.RemoveAt(e.RowIndex);
            gvCommissionRates.DataSource = commRateListAccessor.AllCommission;
            gvCommissionRates.DataBind();
        }
        private void ResponseMessage(string sMess)
        {
            //this.Response.Write("<script language=\"javascript\">alert('" + sMess + "');</script>");         
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + sMess + "');", true);
        }

        private void ResetContents()
        {

            txtAreaCoordinator.Text = string.Empty;
            txtCollectionAddress.Text = string.Empty;
            txtCustomerCode.Text = "[AUTO GENERATED]";
            txtDateStart.Text = string.Empty;
            txtDepartmentCode.Text = string.Empty;
            txtOutletName.Text = string.Empty;
            txtTerms.Text = string.Empty;

            txtAmountInsured.Text = "0.00";
            txtCreditLimit.Text = "0.00";
            txtAdditional.Text = "0.00";
            txtStockRoomFee.Text = "0.00";
            txtUtilitiesFee.Text = "0.00";

            LoadAllAccounts();
            LoadAllBrands();
            LoadGroupArea();
            LoadCommission();
            LoadPriceGroup();
            LoadCompany();

            commRateListAccessor.AllCommission.Clear();
            BindableObjects();
        }
        private void BindableObjects()
        {
            gvCommissionRates.DataSource = commRateListAccessor.AllCommission;
            gvCommissionRates.DataBind();
        }
    }

}