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
    public partial class FabricManagementPanel : System.Web.UI.Page
    {
        FabricManager FM = new FabricManager();

        Fabric _FABRIC
        {
            get
            {
                return new Fabric
                {
                   RecordNo = long.Parse(gvFabricList.SelectedRow.Cells[2].Text),
                   FabricCode = gvFabricList.SelectedRow.Cells[3].Text,
                   FabricDescription = gvFabricList.SelectedRow.Cells[4].Text,
                   TopOrBottom = char.Parse( HttpUtility.HtmlDecode(gvFabricList.SelectedRow.Cells[5].Text.Trim()))
                };
            }
        }

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
                this.btnNewFabric.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.Append(" - Permission to Insert/Add Fabric.<br />");
            }

            if (Permission.CanUpdate() == false)
            {
                this.btnUpdateFabric.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Update/Edit Fabric.<br />");
            }

            if (Permission.CanDelete() == false)
            {
                btnDelete.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Delete Fabric.<br />");
            }
            lblPermissionNotifications.Text = strPermissionNotification.ToString();
            #endregion
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }

        private void LoadAllFabrics(string search_pameter="")
        {
            if (string.IsNullOrEmpty(search_pameter))
            {
                gvFabricList.DataBind();
                return;
            }
            FM.LoadFabrics(SqlDataSourceFabrics, search_pameter);
        }

        private void Search()
        {
            LoadAllFabrics(txtSearch.Text);
        }

        protected void gvGarmentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ffabric_update.FabricCode = _FABRIC.FabricCode;
            ffabric_update.FabricDescrition = _FABRIC.FabricDescription;
            ffabric_update.TopOrBottom = _FABRIC.TopOrBottom;
            ffabric_update.FabricId = _FABRIC.RecordNo;
            lblFabricToDelete.Text = "Delete fabric " + _FABRIC.FabricDescription + "?" ;
            updateErrorMessage.Visible = false;
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            FM.Delete(ffabric_update .Fabric);
            LoadAllFabrics();
        }

        protected void btnSaveFabric_Click(object sender, EventArgs e)
        {
            if (char.IsWhiteSpace(ffabric.TopOrBottom) && string.IsNullOrEmpty(ffabric.FabricCode))
            {
                return;
            }
            FM.Save(ffabric.Fabric);
            ffabric.Clear();
            LoadAllFabrics();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ffabric_update.FabricCode))
            {
                return;
            }
            FM.Save(ffabric_update.Fabric);
            LoadAllFabrics();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            Search();
        }
    }
}