using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;    
using IRMS.ObjectModel;
using IntegratedResourceManagementSystem.Common;
using IRMS.Components;
using System.Text;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class AccountManagementPanel : System.Web.UI.Page
    {
        AccountsManager AM = new AccountsManager();
        AccountClass accounts = new AccountClass();

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
                this.btnNewAccount.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.Append(" - Permission to Insert/Add Account.<br />");
            }

            if (Permission.CanUpdate() == false)
            {
                this.btnUpdateAccount.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Update/Edit Account.<br />");
            }

            if (Permission.CanDelete() == false)
            {
                btnDelete.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Delete Account.<br />");
            }
            lblPermissionNotifications.Text = strPermissionNotification.ToString();
            #endregion
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack) { 
            LoadAllAccounts();
            txtAccountCode.Text = "[AUTO-GENERATE]";}
        }

        private void LoadAllAccounts(string[] search_parameter = null)
        {
            if (search_parameter != null)
            {
                this.gvAccountList.DataSource = AM.SearchAccounts(search_parameter);
                gvAccountList.DataBind();
            }
            else
            {
                gvAccountList.DataSource = AM.Accounts();
                gvAccountList.DataBind();
            }
        }

        private void ClearTextControl()
        {
            txtAccountCode.Text = "[AUTO-GENERATE]";
            txtAccountName.Text = string.Empty;
            txtAccountCodeUpdate.Text = string.Empty;
            txtAccountNameUpdate.Text = string.Empty;
        }

        private void Search()
        {
            string[] search_param = new string[1];
            search_param[0] = txtSearch.Text;
            LoadAllAccounts(search_param);
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            Search();
        }

        protected void gvAccountList_SelectedIndexChanged(object sender, EventArgs e)
        {
            accounts = AM.GetAccountByKey(long.Parse(gvAccountList.SelectedRow.Cells[2].Text));
            AM.PreviousAccount = AM.GetAccountByKey(long.Parse(gvAccountList.SelectedRow.Cells[2].Text));
            txtAccountCodeUpdate.Text = accounts.AccountCode;
            txtAccountNameUpdate.Text = accounts.AccountName;
        }

        protected void btnSaveAccount_Click(object sender, EventArgs e)
        {
            AM.Add();
            var accounts = new AccountClass
            {
                AccountCode = string.Empty,
                AccountName = this.txtAccountName.Text.ToUpper()
            };

            string sMessage = string.Empty;
            if (AM.ValidateAccount(accounts, ref sMessage) == true)
            {
                AM.Save(accounts);
                ClearTextControl();
                LoadAllAccounts();
                //ResponseMessage("Account has been saved!");
            }
            else
            {
                lblErrorMessage.Text = sMessage.ToUpper();
                btnNewAccount_ModalPopupExtender.Show();
            }
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            AM.Update();
            AM.PreviousAccount = AM.GetAccountByKey(long.Parse(gvAccountList.SelectedRow.Cells[2].Text));
            accounts = AM.GetAccountByKey(long.Parse(gvAccountList.SelectedRow.Cells[2].Text));
            accounts.AccountCode = this.txtAccountCodeUpdate.Text.ToUpper();
            accounts.AccountName = this.txtAccountNameUpdate.Text.ToUpper();

            string sMessage = string.Empty;
            if (AM.ValidateAccount(accounts, ref sMessage) == true)
            {
                AM.Save(accounts);
                ClearTextControl();
                LoadAllAccounts();
            }
            else
            {
                lblErrorMessageUpdate.Text = sMessage.ToUpper();
                btnUpdateAccount_ModalPopupExtender.Show();
            }
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            AM.Delete(AM.GetAccountByKey(long.Parse(gvAccountList.SelectedRow.Cells[2].Text)));
            LoadAllAccounts();
        }

        protected void btnNewAccount_Click(object sender, EventArgs e)
        {
        }

        protected void pnlNewAccountModal_Load(object sender, EventArgs e)
        {
        }

        protected void btnNewAccount_ModalPopupExtender_Load(object sender, EventArgs e)
        {
        }

        private void ResponseMessage(string sMess)
        {
            //this.Response.Write("<script language=\"javascript\">alert('" + sMess + "');</script>");         
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + sMess + "');", true);
        }
    }
}