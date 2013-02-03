using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class AuditTrails : System.Web.UI.Page
    {
        #region variables
        AuditTrailManager auditTrailManager = new AuditTrailManager();
        #endregion
        protected void Page_Init(object sender, EventArgs e)
        {
           

        }
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DDLDisPlaySize_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (DDLDisPlaySize.SelectedValue)
            {
                case "DEFAULT":
                    gvActivityLogs.PageSize = 25;
                    break;
                case "50":
                    gvActivityLogs.PageSize = 50;
                    break;
                case "100":
                    gvActivityLogs.PageSize = 100;
                    break;
                case "250":
                    gvActivityLogs.PageSize = 250;
                    break;
                case "500":
                    gvActivityLogs.PageSize = 500;
                    break;
                case "1000":
                    gvActivityLogs.PageSize = 1000;
                    break;
                case "ALL":
                    gvActivityLogs.PageSize = 1000000;
                    break;
            }
        }

        protected void gvUserAccounts_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfSelectedUsername.Value = gvUserAccounts.SelectedValue.ToString();
            gvActivityLogs.DataSourceID = "SqlDataSourceAuditTrailsByUserAccount";

        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            auditTrailManager.SearchUserAccounts(SqlDataSourceUserAccounts, txtSearch.Text);
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            auditTrailManager.SearchUserAccounts(SqlDataSourceUserAccounts, txtSearch.Text);
        }

        protected void btnFilterByBrand_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(hfSelectedUsername.Value))
            {
                auditTrailManager.FilterAuditLogs(SqlDataSourceAuditTrails, DateTime.Parse(txtFilterDateFrom.Text), DateTime.Parse(txtFilterDateTo.Text));
            }
            else
            {
                auditTrailManager.FilterAuditLogs(SqlDataSourceAuditTrailsByUserAccount, DateTime.Parse(txtFilterDateFrom.Text), DateTime.Parse(txtFilterDateTo.Text), gvUserAccounts.SelectedValue.ToString());     
            }
        }

        protected void gvActivityLogs_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtFilterDateFrom.Text) && !string.IsNullOrEmpty(txtFilterDateTo.Text))
            {
                if (string.IsNullOrEmpty(hfSelectedUsername.Value))
                {
                    auditTrailManager.FilterAuditLogs(SqlDataSourceAuditTrails, DateTime.Parse(txtFilterDateFrom.Text), DateTime.Parse(txtFilterDateTo.Text));
                }
                else
                {
                    auditTrailManager.FilterAuditLogs(SqlDataSourceAuditTrailsByUserAccount, DateTime.Parse(txtFilterDateFrom.Text), DateTime.Parse(txtFilterDateTo.Text), gvUserAccounts.SelectedValue.ToString());
                }
            }
           
        }

    }
}