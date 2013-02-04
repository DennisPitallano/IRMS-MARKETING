using System;
using IntegratedResourceManagementSystem.Common;
using IRMS.BusinessLogic.Manager;
using IRMS.Components;
using IRMS.Entities;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class FormulaManagementPanel : System.Web.UI.Page
    {
        #region variables
        FormulaManager FormulaManager = new FormulaManager();
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

        protected void btnYes_Click(object sender, EventArgs e)
        {
            FormulaManager.Delete(fFormula_Update.Formula);
            #region log
            FormulaManager.Identity = fFormula_Update.FormulaId;
            FormulaManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
            #endregion
            gvFormulaList.DataBind();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            SaveFormula(fFormula_Update.Formula);
            #region log
            FormulaManager.Identity = fFormula_Update.FormulaId;
            FormulaManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveFormula(fFormula.Formula);
            #region log
            FormulaManager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
            #endregion
        }

        /// <summary>
        /// Save/Update Formula
        /// </summary>
        /// <param name="Formula">Formula Object</param>
        private void SaveFormula(Formula Formula)
        {
            FormulaManager.Save(Formula);
            gvFormulaList.DataBind();
        }

        protected void gvFormulaList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fFormula_Update.FormulaDescription = gvFormulaList.SelectedRow.Cells[3].Text;
            fFormula_Update.FormulaId = int.Parse(gvFormulaList.SelectedRow.Cells[2].Text);
            UpdateModalState();
        }

        /// <summary>
        /// Update controls in modals
        /// </summary>
        private void UpdateModalState()
        {
            lblFormulaToDelete.Text = "Delete Formula: " + fFormula_Update.FormulaDescription + "?";
            btnYes.Enabled = true;
            btnSaveUpdate.Enabled = true;
            updateErrorMessage.Visible = false;
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            FormulaManager.LoadFormulas(SqlDataSourceFormula, txtSearch.Text);
            gvFormulaList.DataBind();
        }
    }
}