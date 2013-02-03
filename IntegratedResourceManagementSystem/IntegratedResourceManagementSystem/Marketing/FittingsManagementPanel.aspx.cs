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
    public partial class FittingsManagementPanel : System.Web.UI.Page
    {
        #region variables
        FittingManager FittingManager = new FittingManager();
        SubFittingManager SubFittingManager = new SubFittingManager();
        #endregion
        #region Page_init
        protected void Page_Init(object sender, EventArgs e)
        {
            #region check roles
            Permission.PERMITTED_USER = (UsersClass)Session["USER_ACCOUNT"];
            if (!Permission.IsAdmin())
            {
                Redirector.Redirect("~/Marketing/Stylepanel.aspx");
            }

            Permission.ROLES = (List<UserRole>)Session["USER_ROLES"];
            StringBuilder strPermissionNotification = new StringBuilder();
            strPermissionNotification.Append("Your Account do not have: <br />");
            if (Permission.CanInsert() == false)
            {
                btnAddNewSubFitting.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.Append(" - Permission to Insert/Add Fitting.<br />");
            }

            if (Permission.CanUpdate() == false)
            {
                this.btnUpdateBrand.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Update/Edit Fitting.<br />");
            }

            if (Permission.CanDelete() == false)
            {
                btnDelete.Enabled = false;
                btnDeleteSubFitting.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Delete Fitting.<br />");
            }
            lblPermissionNotifications.Text = strPermissionNotification.ToString();
            #endregion
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvFittings_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfFittingCode.Value = gvFittings.SelectedDataKey[1].ToString();
            lblFittingToDelete.Text = "FITTING: " + gvFittings.SelectedRow.Cells[4].Text;
            btnOKDeleteFitting.Enabled = true;

            fSubFitting.FittingCode = gvFittings.SelectedDataKey[1].ToString();

            fFitting.FittingName = gvFittings.SelectedRow.Cells[4].Text;
            fFitting.Category = HttpUtility.HtmlDecode(gvFittings.SelectedRow.Cells[5].Text.Trim());
            
        }

        protected void gvSubFittings_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSubFittingToDelete.Text = "SUB-FITTING:" + gvSubFittings.SelectedRow.Cells[3].Text;
            btnDeleteSubFittingOK.Enabled = true;
        }

        protected void btnSaveFittingUpdate_Click(object sender, EventArgs e)
        {
            fFitting.RecordNo = long.Parse(gvFittings.SelectedValue.ToString());
            fFitting.FittingCode = gvFittings.SelectedDataKey[1].ToString();
            FittingManager.Save(fFitting.FITTING);
            gvFittings.DataBind();
        }

        protected void btnOKDeleteFitting_Click(object sender, EventArgs e)
        {
            fFitting.RecordNo = long.Parse(gvFittings.SelectedValue.ToString());
            FittingManager.Delete(fFitting.FITTING);
            gvFittings.DataBind();
        }

        protected void btnDeleteSubFittingOK_Click(object sender, EventArgs e)
        {
            SubFitting sub_fitting = new SubFitting();
            sub_fitting.RecordNumber = long.Parse(gvSubFittings.SelectedValue.ToString());
            SubFittingManager.Delete(sub_fitting);
            gvSubFittings.DataBind();
        }

        protected void btnSaveSubFitting_Click(object sender, EventArgs e)
        {
            SubFittingManager.Save(fSubFitting.SubFitting);
            gvSubFittings.DataBind();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            FittingManager.SearchFittings(SqlDataSourceFittings, txtSearch.Text);
        }
    }
}