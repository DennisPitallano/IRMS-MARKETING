using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IntegratedResourceManagementSystem.Common;
using IRMS.Components;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class ArrangementManagementPanel : System.Web.UI.Page
    {
        ArrangementTypeManager ArrangementTypeManager = new ArrangementTypeManager();

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
            ArrangementTypeManager.LoadArrangementTypes(SqlDataSourceArrangementType, txtSearch.Text);
            gvArrangementTypeList.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ArrangementTypeManager.Save(fArrangement.ArrangementType);
            #region log
            ArrangementTypeManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
            #endregion
            gvArrangementTypeList.DataBind();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            ArrangementTypeManager.Save(fArrangementType_Update.ArrangementType);
            #region log
            ArrangementTypeManager.Identity = fArrangementType_Update.ArrangementTypeId;
            ArrangementTypeManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
            gvArrangementTypeList.DataBind();
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            ArrangementTypeManager.Delete(fArrangementType_Update.ArrangementType);
            #region log
            ArrangementTypeManager.Identity = fArrangementType_Update.ArrangementTypeId;
            ArrangementTypeManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
            #endregion
            gvArrangementTypeList.DataBind();
        }

        protected void gvArrangementTypeList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fArrangementType_Update.ArrangementTypeDescription = gvArrangementTypeList.SelectedRow.Cells[3].Text;
            fArrangementType_Update.ArrangementTypeId = int.Parse(gvArrangementTypeList.SelectedRow.Cells[2].Text);
            UpdateModalState();
        }

        private void UpdateModalState()
        {
            updateErrorMessage.Visible = false;
            lblTermToDelete.Text = "Delete Arrangement Type:" + fArrangementType_Update.ArrangementTypeDescription + "?";
            btnSaveUpdate.Enabled = true;
            btnYes.Enabled = true;
        }
    }
}