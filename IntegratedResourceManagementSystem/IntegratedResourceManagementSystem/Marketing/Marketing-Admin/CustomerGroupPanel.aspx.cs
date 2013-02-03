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
    public partial class CustomerGroupPanel : System.Web.UI.Page
    {
        private CustomerGroup CG = new CustomerGroup();
        private CustomerGroupsManager CGM = new CustomerGroupsManager();

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
            CGM.Save(fCustomerGroup.CustomerGroup);
            #region log
            CGM.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
            #endregion
            gvCustomerGroupList.DataBind();
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {           
            var cust = new  CustomerGroup{
                id = int.Parse(gvCustomerGroupList.SelectedRow.Cells[2].Text)
            };
            CGM.Delete(fCustomerGroup_Update.CustomerGroup);
            #region log
            CGM.Identity = cust.id;
            CGM.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
            #endregion
            gvCustomerGroupList.DataBind();
       
        }

        protected void gvCustomerGroupList_SelectedIndexChanged(object sender, EventArgs e)
        {

             fCustomerGroup_Update.Code = gvCustomerGroupList.SelectedRow.Cells[3].Text;
             fCustomerGroup_Update.Cust_ID = int.Parse(gvCustomerGroupList.SelectedRow.Cells[2].Text);
             fCustomerGroup_Update.Description = gvCustomerGroupList.SelectedRow.Cells[4].Text;
             fCustomerGroup_Update.BrandName = gvCustomerGroupList.SelectedRow.Cells[5].Text;
             fCustomerGroup_Update.Customer = gvCustomerGroupList.SelectedRow.Cells[6].Text;
             fCustomerGroup_Update.SapGroup = gvCustomerGroupList.SelectedRow.Cells[7].Text;
         UpdateModalState();
        }
        private void UpdateModalState()
        {
            
            updateErrorMessage.Visible = false;
            lblTermToDelete.Text = "Delete Customer Group Code : " + fCustomerGroup_Update.Code + "?";
            btnSaveUpdate.Enabled = true;
            btnYes.Enabled = true;
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            CGM.Save(fCustomerGroup_Update.CustomerGroup);
            #region log
            CGM.Identity = fCustomerGroup_Update.Cust_ID;
            CGM.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
            gvCustomerGroupList.DataBind();
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            CGM.LoadCustomerGroupList(SqlDataSourceCustomerGroup, txtSearch.Text);
            gvCustomerGroupList.DataBind();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            CGM.LoadCustomerGroupList(SqlDataSourceCustomerGroup, txtSearch.Text);
            gvCustomerGroupList.DataBind();
        }

    }
}