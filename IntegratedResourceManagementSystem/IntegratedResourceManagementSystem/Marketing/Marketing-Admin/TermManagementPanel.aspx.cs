using System;
using IRMS.BusinessLogic.Manager;
using IntegratedResourceManagementSystem.Common;
using IRMS.Components;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class TermManagementPanel : System.Web.UI.Page
    {
        #region variables
        TermManager Termmanager = new TermManager();
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

        protected void btnSaveTerm_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(fTerm.TermName))
            {
                return;
            }
                Termmanager.Save(fTerm.Term);
                #region log
                Termmanager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
                #endregion
                gvTermsList.DataBind();
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(fTerm_Update.TermName))
            {
                return;
            }
            Termmanager.Save(fTerm_Update.Term);
            #region log
            Termmanager.Identity = fTerm_Update.TermId;
            Termmanager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
            gvTermsList.DataBind();
        }

        protected void gvTermsList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fTerm_Update.TermName = gvTermsList.SelectedRow.Cells[3].Text;
            fTerm_Update.TermId =  int.Parse(gvTermsList.SelectedRow.Cells[2].Text);
            UpdateModalState();
        }

        private void UpdateModalState()
        {
            btnSaveUpdate.Enabled = true;
            updateErrorMessage.Visible = false;
            lblTermToDelete.Text = "Delete Term: " + fTerm_Update.TermName + "?";
            btnYes.Enabled = true;
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            Termmanager.Delete(fTerm_Update.Term);
            #region log
            Termmanager.Identity = fTerm_Update.TermId;
            Termmanager.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
            #endregion
            gvTermsList.DataBind();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            Termmanager.LoadTerms(SqlDataSourceTerms, txtSearch.Text);
            gvTermsList.DataBind();
        }
    }
}