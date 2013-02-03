using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IRMS.Components;
using IntegratedResourceManagementSystem.Common;
using System.Text;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class CustomListing : System.Web.UI.Page
    {
        CustomerListingManager CLM = new CustomerListingManager();

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
                this.btnNewCustomer.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.Append(" - Permission to Insert/Add Outlet.<br />");
            }

            if (Permission.CanUpdate() == false)
            {
                this.btnUpdateCustomer.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Update/Edit Outlet.<br />");
            }

            if (Permission.CanDelete() == false)
            {
                btnDelete.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Delete Outlet.<br />");
            }
            lblPermissionNotifications.Text = strPermissionNotification.ToString();
            #endregion
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.gvAccountList.DataSource = CLM.AllCustomerList();
                gvAccountList.DataBind();
            }
        }

        protected void btnUpdateCustomer_Click(object sender, EventArgs e)
        {
            int iIndex = gvAccountList.SelectedIndex;
            Response.Write("<form name='custupdatefrm' action='OutletManagementPanel.aspx' method='POST'>");
            Response.Write("<input type=hidden name='outletID' value='" + CLM.CustomerList[iIndex].CustomerCode + "' >");
            Response.Write("<input type=hidden name='account' value='" + CLM.CustomerList[iIndex].AccountName + "' >");
            Response.Write("<input type=hidden name='branch' value='" + CLM.CustomerList[iIndex].BranchName + "' >");
            Response.Write("<input type=hidden name='brand' value='" + CLM.CustomerList[iIndex].BrandName + "' >");
            Response.Write("<input type=hidden name='processID' value='update' >");
            Response.Write("</form>");
            Response.Write("<script>window.document.custupdatefrm.submit();</script>");
            Response.End();
        }

        protected void btnNewCustomer_Click(object sender, EventArgs e)
        {
            Response.Write("<form name='custnewfrm' action='OutletManagementPanel.aspx' method='POST'>");
            Response.Write("<input type=hidden name='processID' value='new' >");
            Response.Write("</form>");
            Response.Write("<script>window.document.custnewfrm.submit();</script>");
            Response.End();
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            string CustomerCode = HttpUtility.HtmlEncode(gvAccountList.SelectedRow.Cells[6].Text);
            string Area = HttpUtility.HtmlEncode(gvAccountList.SelectedRow.Cells[9].Text);
            string SubArea = HttpUtility.HtmlEncode(gvAccountList.SelectedRow.Cells[11].Text);
            Redirector.Redirect("~/Reports/ReportForms/PrintOutlet.aspx?OutletCode=" + CustomerCode+"&Area="+Area+"&SubArea="+ SubArea);
        }
    }
}