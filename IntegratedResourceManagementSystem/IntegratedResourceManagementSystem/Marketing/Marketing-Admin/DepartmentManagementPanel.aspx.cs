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
    public partial class DepartmentManagementPanel : System.Web.UI.Page
    {
        #region variables
        DepartmentManager DeptManger = new DepartmentManager();
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

        protected void btnSaveDepartment_Click(object sender, EventArgs e)
        {
            DeptManger.Save(fDepartment.Department);
            #region log
            DeptManger.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.INSERT);
            #endregion
            gvDepartmentList.DataBind();
        }

        protected void gvDepartmentList_SelectedIndexChanged(object sender, EventArgs e)
        {
            fDepartment_Update.DepartmentName = gvDepartmentList.SelectedRow.Cells[3].Text;
            fDepartment_Update.DeptID  = int.Parse(gvDepartmentList.SelectedRow.Cells[2].Text);
            UpdateModalState();
        }

        private void UpdateModalState()
        {
            updateErrorMessage.Visible = false;
            lblBrandToDelete.Text = "Delete Department: " + fDepartment_Update.DepartmentName + "?";
            btnSaveUpdate.Enabled = true;
            btnYes.Enabled = true;
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            DeptManger.Save(fDepartment_Update.Department);
            #region log
            DeptManger.Identity = fDepartment_Update.DeptID;
            DeptManger.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.UPDATE);
            #endregion
            gvDepartmentList.DataBind();
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            var dept = new  Department{
                 Id = int.Parse(gvDepartmentList.SelectedRow.Cells[2].Text )
            };
            DeptManger.Delete(dept);
            #region log
            DeptManger.Identity = fDepartment_Update.DeptID;
            DeptManger.SaveTransactionLog(Permission.PERMITTED_USER, TransactionType.DELETE);
            #endregion
            gvDepartmentList.DataBind();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            DeptManger.LoadDepartments(SqlDataSourceDepartments, txtSearch.Text);
            gvDepartmentList.DataBind();
        }
    }
}