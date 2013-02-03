using System;
using IntegratedResourceManagementSystem.Common;
using IRMS.BusinessLogic.Manager;
using IRMS.Components;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class SubAreaGroupManagementPanel : System.Web.UI.Page
    {
        #region variables
        public SubGroupAreaManager SubGroupAreaManager = new SubGroupAreaManager();
        #endregion

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
            SubGroupAreaManager.LoadSubAreaGroups(SqlDataSourceSubAreaGroup,txtSearch.Text);
            gvSubAreaGroupList.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(fSubAreaGroup.SubAreaGroupName))
            {
                return;
            }
            SaveSubAreaGroup(fSubAreaGroup.SubAreaGroup);
            #region log
            SubGroupAreaManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
            #endregion
        }

        private void SaveSubAreaGroup(SubGroupAreaClass SubGroupArea)
        {
            SubGroupAreaManager.Save(SubGroupArea);
            gvSubAreaGroupList.DataBind();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            SaveSubAreaGroup(fSubAreaGroup_Update.SubAreaGroup);
            #region log
            SubGroupAreaManager.Identity = fSubAreaGroup_Update.SubAreaGroupId;
            SubGroupAreaManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            DeleteSubAreaGroup();
        }

        private void DeleteSubAreaGroup()
        {
            SubGroupAreaManager.Delete(fSubAreaGroup_Update.SubAreaGroup);
            #region log
            SubGroupAreaManager.Identity = fSubAreaGroup_Update.SubAreaGroupId;
            SubGroupAreaManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
            #endregion
            gvSubAreaGroupList.DataBind();
        }

        protected void gvSubAreaGroupList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fSubAreaGroup_Update.SubAreaGroupName = gvSubAreaGroupList.SelectedRow.Cells[3].Text;
            fSubAreaGroup_Update.SubAreaGroupId = int.Parse(gvSubAreaGroupList.SelectedRow.Cells[2].Text);
            fSubAreaGroup_Update.AreaGroupName = gvSubAreaGroupList.SelectedRow.Cells[4].Text;
            UpdateModaState();
        }

        private void UpdateModaState()
        {
            btnSaveUpdate.Enabled = true;
            updateErrorMessage.Visible = false;
            btnYes.Enabled = true;
            lblSubAreaGroupToDelete.Text = "Delete Sub-Area Group: " + fSubAreaGroup_Update.SubAreaGroupName + "?";
        }
    }
}