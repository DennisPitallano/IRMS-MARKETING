using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class CustomerOutletManagementPanel : System.Web.UI.Page
    {
        private CustomerManager CM = new CustomerManager();
        private CustomerPriceAgreementManager CPAM = new CustomerPriceAgreementManager();
        private CustomerContractTermManager CCTM = new CustomerContractTermManager();

        private AccountsManager AM = new AccountsManager();
        private BranchManager BM = new BranchManager();
        private BrandManager BrM = new BrandManager();

        private Customer customer = new Customer();
        private CustomerPriceAgreement priceAgreement = new CustomerPriceAgreement();
        private CustomerContractTerm contractTerm = new CustomerContractTerm();

        private BranchClass branch = new BranchClass();
        private AccountClass account = new AccountClass();
        private Brand brand = new Brand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadCustomerList();
                LoadAllAccounts();
                LoadAllBrands();

                LoadDroplistControls();
                GetCustomerName();
            }
        }

        private void LoadCustomerList(string[] search_parameter = null)
        {
            if (search_parameter != null)
            {
                this.gvCustomerList.DataSource = CM.SearchCustomer(search_parameter);
            }
            else
            {
                this.gvCustomerList.DataSource = CM.CustomerHandler();
                gvCustomerList.DataBind();
            }
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

        private void LoadDroplistControls()
        {
            dlCustomerGroup.Items.Clear();
            dlCustomerGroup.Items.Add(new ListItem("", ""));
            dlCustomerGroup.Items.Add(new ListItem("CustGroup1","GP01"));
            dlCustomerGroup.Items.Add(new ListItem("CustGroup2","GP02"));
            dlCustomerGroup.Items.Add(new ListItem("CustGroup3", "GP03"));

            dlUnderCompany.Items.Clear();
            dlUnderCompany.Items.Add(new ListItem("", ""));
            dlUnderCompany.Items.Add(new ListItem("Company1", "COMP1"));
            dlUnderCompany.Items.Add(new ListItem("Company2", "COMP2"));
            dlUnderCompany.Items.Add(new ListItem("Company3", "COMP3"));

            dlArrangeType.Items.Clear();
            dlArrangeType.Items.Add(new ListItem("", ""));
            dlArrangeType.Items.Add(new ListItem("Arrange1", "ARR1"));
            dlArrangeType.Items.Add(new ListItem("Arrange2", "ARR2"));
            dlArrangeType.Items.Add(new ListItem("Arrange3", "ARR3"));

            this.dlPriceGroupReg.Items.Clear();
            dlPriceGroupReg.Items.Add(new ListItem("", ""));
            dlPriceGroupReg.Items.Add(new ListItem("PGROUP1", "PGR1"));
            dlPriceGroupReg.Items.Add(new ListItem("PGROUP2", "PGR2"));
            dlPriceGroupReg.Items.Add(new ListItem("PGROUP3", "PGR3"));

            this.dlPriceGroupMDown.Items.Clear();
            dlPriceGroupMDown.Items.Add(new ListItem("", ""));
            dlPriceGroupMDown.Items.Add(new ListItem("MARKDOWN1", "PMD1"));
            dlPriceGroupMDown.Items.Add(new ListItem("MARKDOWN2", "PMD2"));
            dlPriceGroupMDown.Items.Add(new ListItem("MARKDOWN3", "PMD3"));

            this.dlAreaGroup.Items.Clear();
            dlAreaGroup.Items.Add(new ListItem("", ""));
            dlAreaGroup.Items.Add(new ListItem("CITY", "AG001"));
            dlAreaGroup.Items.Add(new ListItem("NON-CITY", "AG002"));

            this.dlSubAreaGroup.Items.Clear();
            dlSubAreaGroup.Items.Add(new ListItem("", ""));
            dlSubAreaGroup.Items.Add(new ListItem("SUB1", "SAG001"));
            dlSubAreaGroup.Items.Add(new ListItem("SUB2", "SAG002"));
        }


        private void GetObjectsFromDropList()
        {
            if (dlAccounts.SelectedIndex > 0)
            {
                AccountClass accountSelect = new AccountClass();
                accountSelect = AM.GetAccountByAccountCode(dlAccounts.SelectedValue);
                CM.AccountObject = accountSelect;
                CPAM.AccountObject = accountSelect;
                CCTM.AccountObject = accountSelect;
            }

            if (dlBranch.SelectedIndex > -1)
            {
                BranchClass branchSelect = new BranchClass();
                branchSelect = BM.GetBranchByBranchCode(dlBranch.SelectedValue);
                CM.BranchObject = branchSelect;
                CPAM.BranchObject = branchSelect;
                CCTM.BranchObject = branchSelect;
            }

            if (dlBrand.SelectedIndex > 0)
            {
                Brand brandlocal = new Brand();
                brandlocal = BrM.GetBrandByBrandCode(dlBrand.SelectedValue);
                CM.BrandObject = brandlocal;
                CPAM.BrandObject = brandlocal;
                CCTM.BrandObject = brandlocal;
            }
        }
        private void GetCustomerName()
        {
            GetObjectsFromDropList();
            txtOutletName.Text = CM.CustomerName;
        }

        protected void dlAccounts_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBranchByAccountCode(dlAccounts.SelectedValue);
            dlObject_SelectedIndexChanged(sender, e);
        }
        protected void dlObject_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCustomerName();
            btnNewCustomer_ModalPopupExtender.Show();
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            GetObjectsFromDropList();
            var customer = new Customer
            {
                ArrangementCode = this.dlArrangeType.SelectedValue,
                CompanyCode = this.dlUnderCompany.SelectedValue,
                CreditLimit = float.Parse(this.txtCreditLimit.Text),
                GroupCode = this.dlCustomerGroup.SelectedValue,
                DateStart = Convert.ToDateTime(this.txtDateStart.Text),
                Terms = txtTerms.Text
            };

            var priceAgreement = new CustomerPriceAgreement
            {
                AreaGroupCode = dlAreaGroup.SelectedValue,
                CoordinatorName = txtAreaCoordinator.Text,
                PriceGroupMarkdown = dlPriceGroupMDown.SelectedValue,
                PriceGroupRegular = dlPriceGroupReg.SelectedValue,
                SubAreaGroupCode = dlSubAreaGroup.SelectedValue
            };

            var contractTerm = new CustomerContractTerm
            {
                ActivationStatus = 2,
                CommissionAdditional = float.Parse(txtCommAdditional.Text),
                CommisssionCharge = float.Parse(txtCommCharge.Text),
                InsuredAmount = float.Parse(txtAmountInsured.Text),
                LiquidationStatus = Convert.ToInt32(rdioLiquidationStatus.SelectedValue),
                MarkdownCommAboveFifty = float.Parse(txtCommMdownAboveFifty.Text),
                MarkdownCommBelowFifty = float.Parse(txtCommMdownLessFifty.Text),
                MarkdownCommission = float.Parse(txtCommissionMarkdown.Text),
                RegularCommAboveFifty = float.Parse(txtCommRegAboveFifty.Text),
                RegularCommBelowFifty = float.Parse(txtCommRegLessFifty.Text),
                RegularCommission = float.Parse(txtCommisionRegular.Text),
                StockRoomFee = float.Parse(txtStockRoomFee.Text),
                UtilitiesFee = float.Parse(txtUtilitiesFee.Text)
            };


            try
            {
                CM.Save(customer);
                CPAM.Save(priceAgreement);
                CCTM.Save(contractTerm);
            }
            catch (Exception except)
            {
                throw new System.ArgumentException(except.Message);
            }
            ResetTextControl();
            LoadDroplistControls();
            LoadAllAccounts();
            LoadAllBrands();
            LoadCustomerList();
        }
        private void ResetTextControl()
        {
            txtAmountInsured.Text = string.Empty;
            txtAreaCoordinator.Text = string.Empty;
            txtCommAdditional.Text = string.Empty;
            txtCommCharge.Text = string.Empty;
            txtCommisionRegular.Text = string.Empty;
            txtCommissionMarkdown.Text = string.Empty;
            txtCommMdownAboveFifty.Text = string.Empty;
            txtCommMdownLessFifty.Text = string.Empty;
            txtCommRegAboveFifty.Text = string.Empty;
            txtCommRegLessFifty.Text = string.Empty;
            txtCreditLimit.Text = string.Empty;
            txtCustomerCode.Text = string.Empty;
            txtDateStart.Text = string.Empty;
            txtOutletName.Text = string.Empty;
            txtStockRoomFee.Text = string.Empty;
            txtTerms.Text = string.Empty;
            txtUtilitiesFee.Text = string.Empty;
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ResetTextControl();
            LoadDroplistControls();
            LoadAllAccounts();
            LoadAllBrands();            
            GetCustomerName();
            btnNewCustomer_ModalPopupExtender.Show();
        }

    }
}