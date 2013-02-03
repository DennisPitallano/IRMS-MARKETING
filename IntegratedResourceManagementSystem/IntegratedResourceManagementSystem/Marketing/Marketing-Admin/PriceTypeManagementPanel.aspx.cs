using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.Entities;
using IntegratedResourceManagementSystem.Common;
using IRMS.Components;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class PriceTypeManagementPanel : System.Web.UI.Page
    {
        #region variables
        PriceTypeManager PriceTypeManager = new PriceTypeManager();
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SavePriceType(fPriceType.PriceType);
            #region log
            PriceTypeManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
            #endregion
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="PriceType"></param>
        private void SavePriceType(PriceType PriceType)
        {
            PriceTypeManager.Save(PriceType);
            gvPriceTypeList.DataBind();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            SavePriceType(fPriceType_Update.PriceType);
            #region log
            PriceTypeManager.Identity = fPriceType_Update.PriceTypeId;
            PriceTypeManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            PriceTypeManager.Delete(fPriceType_Update.PriceType);
            #region log
            PriceTypeManager.Identity = fPriceType_Update.PriceTypeId;
            PriceTypeManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
            #endregion
            gvPriceTypeList.DataBind();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            PriceTypeManager.LoadPriceTypes(SqlDataSourcePriceType, txtSearch.Text);
        }

        protected void gvPriceTypeList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fPriceType_Update.PriceTypeDescription = gvPriceTypeList.SelectedRow.Cells[3].Text;
            fPriceType_Update.PriceTypeId = int.Parse(gvPriceTypeList.SelectedRow.Cells[2].Text);
            UpdateModalState();
        }

        private void UpdateModalState()
        {
            btnSaveUpdate.Enabled = true;
            btnYes.Enabled = true;
            lblPriceTypeToDelete.Text = "Delete Price Type: " + fPriceType_Update.PriceTypeDescription + "?";
            updateErrorMessage.Visible = false;
        }
    }
}