using System;
using IRMS.BusinessLogic.Manager;
using IRMS.Entities;
using IntegratedResourceManagementSystem.Common;
using IRMS.Components;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class UserLevelManagementPanel : System.Web.UI.Page
    {
        #region variables 
        UserLevelManager UserLevelManager = new UserLevelManager();
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
            UserLevelManager.LoadUserLevels(SqlDataSourceUserLevel, txtSearch.Text);
            gvUserLevelList.DataBind();
        }

        protected void gvUserLevelList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fUserLevel_Update.UserLevelDescription = gvUserLevelList.SelectedRow.Cells[3].Text;
            fUserLevel_Update.UserLevelId = int.Parse(gvUserLevelList.SelectedRow.Cells[2].Text);
            UpdateModalState();
        }

        private void UpdateModalState()
        {
            updateErrorMessage.Visible = false;
            btnSaveUpdate.Enabled = true;
            btnYes.Enabled = true;
            lblUserLevelToDelete.Text = "Delete User Level: " + fUserLevel_Update.UserLevelDescription + "?";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveUserLevel(fUserLevel.UserLevel);
            #region log
            UserLevelManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
            #endregion
        }

        /// <summary>
        /// Save or Update User Level
        /// </summary>
        /// <param name="UserLevel">User Level Object</param>
        private void SaveUserLevel(UserLevel UserLevel)
        {
            UserLevelManager.Save(UserLevel);
          
            gvUserLevelList.DataBind();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            SaveUserLevel(fUserLevel_Update.UserLevel);
            #region log
            UserLevelManager.Identity = fUserLevel_Update.UserLevelId;
            UserLevelManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            UserLevelManager.Delete(fUserLevel_Update.UserLevel);
            #region log
            UserLevelManager.Identity = fUserLevel_Update.UserLevelId;
            UserLevelManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
            #endregion
            gvUserLevelList.DataBind();
        }
    }
}