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
    public partial class AreaGroupManagementPanel : System.Web.UI.Page
    {
        #region variables
        GroupAreaManager AreaGroupManager = new GroupAreaManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            Permission.PERMITTED_USER = (UsersClass)Session["USER_ACCOUNT"];
            if (!Permission.IsAdmin())
            {
                Redirector.Redirect("~/Marketing/Stylepanel.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveAreaGroup(fAreaGroup.AreaGroup);
            #region _
            AreaGroupManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
            #endregion
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            SaveAreaGroup(fAreaGroup_Update.AreaGroup);
            #region _log
            AreaGroupManager.Identity = fAreaGroup_Update.AreaGroupId;
            AreaGroupManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="AreaGroup"></param>
        private void SaveAreaGroup(GroupAreaClass AreaGroup)
        {
            AreaGroupManager.Save(AreaGroup);
            gvAreaGroupList.DataBind();
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            AreaGroupManager.Delete(fAreaGroup_Update.AreaGroup);
            #region _log
            AreaGroupManager.Identity = fAreaGroup_Update.AreaGroupId;
            AreaGroupManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
            #endregion
            gvAreaGroupList.DataBind();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            AreaGroupManager.LoadAreaGroups(SqlDataSourceAreaGroup, txtSearch.Text);
            gvAreaGroupList.DataBind();
        }

        protected void gvAreaGroupList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fAreaGroup_Update.AreaGroupId = int.Parse(gvAreaGroupList.SelectedRow.Cells[2].Text);
            fAreaGroup_Update.AreaGroupName = gvAreaGroupList.SelectedRow.Cells[3].Text;
            UpdateModalState(); 
        }

        private void UpdateModalState()
        {
            updateErrorMessage.Visible = false;
            btnSaveUpdate.Enabled = true;
            btnYes.Enabled = true;
            lblAreaGroupToDelete.Text = "Delete Area Group: " + fAreaGroup_Update.AreaGroupName + "?";
        }
    }
}