using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.Components;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class UserManagementPanel : System.Web.UI.Page
    {
        #region variables
        DepartmentManager DM = new DepartmentManager();
        UserManager userManager = new UserManager();
        #endregion
        protected void Page_Init(object sender, EventArgs e)
        {
            DDLDepartments.Items.Clear();
            DDLDepartments.Items.Add( new ListItem("ALL","0"));
            foreach (var dep in DM.Departments())
            {
                DDLDepartments.Items.Add(new ListItem(dep.DepartmentName, dep.Id.ToString()));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void hLinkDelete_Click(object sender, EventArgs e)
        {
            lblTermToDelete.Text = Request.QueryString["UserID"];
            hLinkDeletee_ModalPopupExtender.Show();
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            Redirector.Redirect("~/Marketing/Marketing-Admin/UserManagementPanel.aspx");
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            Redirector.Redirect("~/Marketing/Marketing-Admin/UserManagementPanel.aspx");
        }

        protected void btnFilterByBrand_Click(object sender, EventArgs e)
        {
            if (DDLDepartments.SelectedValue!="0")
            {
                ListViewUserAccounts.DataSourceID = "SqlDataSourceUserAccountByDepartment";
            }
            else
            {
                ListViewUserAccounts.DataSourceID = "SqlDataSourceUsersAccount";
            }
            lblDepartmentView.Text = DDLDepartments.SelectedItem.Text+" DEPARTMENTS";
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
             if (DDLDepartments.SelectedValue!="0")
            {
                userManager.SearchUserAccounts(SqlDataSourceUserAccountByDepartment, txtSearch.Text, DDLDepartments.SelectedValue);
            }
            else
            {
                userManager.SearchUserAccounts(SqlDataSourceUsersAccount, txtSearch.Text, DDLDepartments.SelectedValue);
            }
        }
    }
}