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

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class PriceGroupManagementPanel : System.Web.UI.Page
    {
        PriceGroupManager PriceGroupManager = new PriceGroupManager();

        protected void Page_Init(object sender, EventArgs e)
        {
            Permission.PERMITTED_USER = (UsersClass)Session["USER_ACCOUNT"];
            if (!Permission.IsAdmin())
            {
                Redirector.Redirect("~/Marketing/DashBoardPanel.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            PriceGroupManager.LoadPriceGroups(SqlDataSourcePriceGroup, txtSearch.Text);
            gvPriceGroupList.DataBind();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            SavePriceGroup(fPriceGroup_Update.PriceGroup);
            #region log 
            PriceGroupManager.Identity = fPriceGroup_Update.PriceGroupId;
            PriceGroupManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            PriceGroupManager.Delete(fPriceGroup_Update.PriceGroup);
            #region log
            PriceGroupManager.Identity = fPriceGroup_Update.PriceGroupId;
            PriceGroupManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
            #endregion
            gvPriceGroupList.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SavePriceGroup(fPriceGroup.PriceGroup);
        }

        private void SavePriceGroup(PriceGroup PriceGroup)
        {
            PriceGroupManager.Save(PriceGroup);
            #region log
            PriceGroupManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
            #endregion
            gvPriceGroupList.DataBind();
        }

        protected void gvPriceGroupList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fPriceGroup_Update.PriceGroupId = int.Parse(gvPriceGroupList.SelectedRow.Cells[2].Text);
            fPriceGroup_Update.PriceGroupName = gvPriceGroupList.SelectedRow.Cells[3].Text;
            fPriceGroup_Update.PriceField = gvPriceGroupList.SelectedRow.Cells[4].Text;
            fPriceGroup_Update.PriceId = int.Parse(gvPriceGroupList.SelectedRow.Cells[5].Text);
            CheckBox IsConncession = (CheckBox)gvPriceGroupList.SelectedRow.FindControl("chkIsConcession");
            CheckBox IsOutRight = (CheckBox)gvPriceGroupList.SelectedRow.FindControl("chkIsOutRight");
            fPriceGroup_Update.IsConcession = IsConncession.Checked ;
            fPriceGroup_Update.IsOutRight = IsOutRight.Checked;
            UpdateModalState();
        }

        private void UpdateModalState()
        {
            updateErrorMessage.Visible = false;
            btnSaveUpdate.Enabled = true;
            btnYes.Enabled = true;
            lblPriceGroupToDelete.Text = "Delete Price Group: " + fPriceGroup_Update.PriceGroupName + "?";
        }
    }
}