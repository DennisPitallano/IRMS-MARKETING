using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IntegratedResourceManagementSystem.Common;
using System.Text;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class BranchManagementPanel : System.Web.UI.Page
    {
        AccountsManager AC = new AccountsManager();
        BranchManager BM = new BranchManager();
        BranchClass branch = new BranchClass();

        #region Page_init
        protected void Page_Init(object sender, EventArgs e)
        {
            #region check roles
            Permission.PERMITTED_USER = (UsersClass)Session["USER_ACCOUNT"];

            Permission.ROLES = (List<UserRole>)Session["USER_ROLES"];
            StringBuilder strPermissionNotification = new StringBuilder();
            strPermissionNotification.Append("Your Account do not have: <br />");
            if (Permission.CanInsert() == false)
            {
                this.btnNewBranch.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.Append(" - Permission to Insert/Add Branch.<br />");
            }

            if (Permission.CanUpdate() == false)
            {
                this.btnUpdateBranch.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Update/Edit Branch.<br />");
            }

            if (Permission.CanDelete() == false)
            {
                btnDelete.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Delete Branch.<br />");
            }
            lblPermissionNotifications.Text = strPermissionNotification.ToString();
            #endregion
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                LoadListings();
                EnableButtons();
            }
        }

        private void LoadListings()
        {
            LoadAllBranch();
            LoadAccountList();
        }

        private void EnableButtons()
        {
            bool bResult = (gvBranchList.Rows.Count > 0);
            btnUpdateBranch.Enabled = bResult;
            btnDelete.Enabled = bResult;
            btnPrint.Enabled = bResult;
        }

        private void ClearTextCtrls()
        {
            txtAddressOne.Text = string.Empty;
            txtAddressTwo.Text = string.Empty;
            txtBillingAdd.Text = string.Empty;
            txtBranchName.Text = string.Empty;
            txtContactPerson.Text = string.Empty;
            txtFaxNo.Text = string.Empty;
            txtMobileNo.Text = string.Empty;
            txtPosition.Text = string.Empty;
            txtShipToBillAdd.Text = string.Empty;
            txtTelNo.Text = string.Empty;
            txtTIN.Text = string.Empty;
            //dlAccounts.Text = string.Empty;

            txtAccountNameUpdate.Text = string.Empty;
            txtAddressOneUpdate.Text = string.Empty;
            txtAddressTwoUpdate.Text = string.Empty;
            txtBillAddUpdate.Text = string.Empty;
            txtBranchCodeUpdate.Text = string.Empty;
            txtBranchNameUpdate.Text = string.Empty;
            txtContactPersonUpdate.Text = string.Empty;
            txtFaxNoUpdate.Text = string.Empty;
            txtMobileNoUpdate.Text = string.Empty;
            txtPositionUpdate.Text = string.Empty;
            txtShipToAddUpdate.Text = string.Empty;
            txtTelNoUpdate.Text = string.Empty;
            txtTinUpdate.Text = string.Empty;
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            Search();
        }

        private void Search()
        {
            string[] search_param = new string[1];
            search_param[0] = txtSearch.Text;
            LoadAllBranch(search_param);
        }

        private void LoadAllBranch(string[] search_parameter = null)
        {
            if (search_parameter != null)
            {
                this.gvBranchList.DataSource = BM.SearchBranch(search_parameter);
                gvBranchList.DataBind();
            }
            else
            {
                gvBranchList.DataSource = BM.Branch();
                gvBranchList.DataBind();
            }
        }

        private void LoadAccountList()
        {
            dlAccounts.Items.Clear();
            foreach (AccountClass account in AC.Accounts())
            {
                dlAccounts.Items.Add(new ListItem(account.AccountName, account.AccountCode));
            }
        }

        protected void gvBranchList_SelectedIndexChanged(object sender, EventArgs e)
        {
            AccountsManager AM = new AccountsManager();
            branch = BM.GetBranchByKey(long.Parse(gvBranchList.SelectedRow.Cells[2].Text));

            txtAccountNameUpdate.Text = AM.GetAccountByAccountCode(branch.AccountCode).AccountName;
            txtAddressOneUpdate.Text = branch.AddressOne;
            txtAddressTwoUpdate.Text = branch.AddressTwo;
            txtBillAddUpdate.Text = branch.BillingAddress;
            txtBranchCodeUpdate.Text = branch.BranchCode;
            txtBranchNameUpdate.Text = branch.BranchName;
            txtContactPersonUpdate.Text = branch.ContactPerson;
            txtFaxNoUpdate.Text = branch.FaxNumber;
            txtMobileNoUpdate.Text = branch.MobileNumber;
            txtPositionUpdate.Text = branch.PositionDescription;
            txtShipToAddUpdate.Text = branch.ShippingAddress;
            txtTelNoUpdate.Text = branch.TelephoneNumber;
            txtTinUpdate.Text = branch.TIN;
        }

        protected void btnSaveBranch_Click(object sender, EventArgs e)
        {
            ListItem litem = new ListItem();
            lblErrorMessage.Text = string.Empty;

            litem = dlAccounts.Items[dlAccounts.SelectedIndex];
            var branch = new BranchClass
            {
                AccountCode = litem.Value,
                BranchCode = txtBranchCode.Text,
                BranchName = txtBranchName.Text,
                AddressOne = txtAddressOne.Text,
                AddressTwo = txtAddressTwo.Text,
                ContactPerson = txtContactPerson.Text,
                PositionDescription = txtPosition.Text,
                TelephoneNumber = txtTelNo.Text,
                MobileNumber = txtMobileNo.Text,
                FaxNumber = txtFaxNo.Text,
                BillingAddress = txtBillingAdd.Text,
                ShippingAddress = txtShipToBillAdd.Text,
                TIN = txtTIN.Text
            };

            BM.Add();
            string sMessage = string.Empty;
            if (BM.ValidateData(branch, ref sMessage) == true)
            {
                BM.Save(branch);
                LoadAllBranch();
                ClearTextCtrls();
                EnableButtons();
            }
            else
            {
                lblErrorMessage.Text = sMessage;
                btnNewBranch_ModalPopupExtender.Show();
            }
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            BM.Update();
            lblErrorMessageUpdate.Text = string.Empty;

            branch = BM.GetBranchByKey(long.Parse(gvBranchList.SelectedRow.Cells[2].Text));
            BM.PreviousBranch = BM.GetBranchByKey(long.Parse(gvBranchList.SelectedRow.Cells[2].Text));

            branch.AddressOne = txtAddressOneUpdate.Text;
            branch.AddressTwo = txtAddressTwoUpdate.Text;
            branch.BillingAddress = txtBillAddUpdate.Text;
            branch.BranchName = txtBranchNameUpdate.Text;
            branch.ContactPerson = txtContactPersonUpdate.Text;
            branch.FaxNumber = txtFaxNoUpdate.Text;
            branch.MobileNumber = txtMobileNoUpdate.Text;
            branch.PositionDescription = txtPositionUpdate.Text;
            branch.ShippingAddress = txtShipToAddUpdate.Text;
            branch.TelephoneNumber = txtTelNoUpdate.Text;
            branch.TIN = txtTinUpdate.Text;

            string sMessage = string.Empty;

            if (BM.ValidateData(branch, ref sMessage) == true)
            {
                BM.Save(branch);
                LoadAllBranch();
                ClearTextCtrls();
                EnableButtons();
            }
            else
            {
                lblErrorMessageUpdate.Text = sMessage;
                btnUpdateBranch_ModalPopupExtender.Show();
            }
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            BM.Delete(BM.GetBranchByKey(long.Parse(gvBranchList.SelectedRow.Cells[2].Text)));
            LoadAllBranch();
        }

        protected void pnlNewBranchModal_Load(object sender, EventArgs e)
        {
        }

        protected void dlAccounts_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

    }
}