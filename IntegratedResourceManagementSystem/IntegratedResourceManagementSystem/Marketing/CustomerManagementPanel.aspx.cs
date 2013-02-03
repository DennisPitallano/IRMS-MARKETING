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
    public partial class CustomerManagementPanel : System.Web.UI.Page
    {
        private CustomerManager CM = new CustomerManager();
        private AccountsManager AM = new AccountsManager();
        private BranchManager BM = new BranchManager();
        private BrandManager BrM = new BrandManager();

        private Customer customer = new Customer();
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
                GetCustomerName();
            }
        }

        private void LoadCustomerList(string[] search_parameter = null)
        {
            if (search_parameter != null)
            {
                //this.gvCustomerList.DataSource = CM.SearchCustomer(search_parameter);
            }
            else
            {
                //this.gvCustomerList.DataSource = CM.CustomerHandler();
                //gvCustomerList.DataBind();
            }
        }
        private void LoadAllAccounts()
        {
            dlAccounts.Items.Clear();
            foreach (AccountClass account in AM.Accounts())
            {
                dlAccounts.Items.Add(new ListItem(account.AccountName,account.AccountCode));
            }
            LoadBranchByAccountCode(dlAccounts.SelectedValue);
        }
        private void LoadAllBrands()
        {
            dlBrand.Items.Clear();
            foreach (Brand brand in BrM.Brands())
            {
                dlBrand.Items.Add(new ListItem(brand.BrandDescription, brand.BrandCode));
            }
        }
        private void LoadBranchByAccountCode(string AccountCode)
        {
            dlBranch.Items.Clear();
            string[] x = new string[1];
            x[0] = AccountCode;

            foreach (BranchClass branch in BM.SearchBranchByAccountCode(x))
            {
                dlBranch.Items.Add(new ListItem(branch.BranchName, branch.BranchCode));
            }
        }      

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }
        protected void gvGarmentList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void dlAccounts_SelectedIndexChanged(object sender, EventArgs e)
        {
            account.AccountCode = dlAccounts.SelectedValue;
            account.AccountName = dlAccounts.SelectedItem.Text;
            CM.AccountObject = account;
            LoadBranchByAccountCode(dlAccounts.SelectedValue);
            GetCustomerName();
            btnNewCustomer_ModalPopupExtender.Show();

        }
        protected void dlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            branch.BranchCode = dlBranch.SelectedValue;
            branch.BranchName = dlBranch.SelectedItem.Text;
            GetCustomerName();
            btnNewCustomer_ModalPopupExtender.Show();
        }

        protected void dlBrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            brand.BrandCode = dlBrand.SelectedValue;
            brand.BrandDescription = dlBrand.SelectedItem.Text;
            GetCustomerName();
            btnNewCustomer_ModalPopupExtender.Show();
        }

        private void GetCustomerName()
        {
            txtOutletName.Text = CM.CustomerName;
        }




    }
}