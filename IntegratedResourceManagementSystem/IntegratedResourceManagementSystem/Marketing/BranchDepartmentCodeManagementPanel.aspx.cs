using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using System.Collections;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class BranchDepartmentCodeManagementPanel : System.Web.UI.Page
    {
        #region variables
        BranchManager BranchManager = new BranchManager();
        BranchDepartmentCodeManager BranchDeptCodeManager = new BranchDepartmentCodeManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            initializeBranches();
        }

        private void initializeBranches()
        {
            var branches = (from branch in BranchManager.Branch()
                           select new
                           {
                             branch.BranchName
                           }).Distinct().ToList();
            var branchDeptCodes = BranchDeptCodeManager.FetchAll();
            DDLBranches.Items.Clear();
            foreach (var bdc in branchDeptCodes)
            {
                branches.RemoveAll(b => b.BranchName == bdc.BranchName);
            }
            foreach (var brnch in branches)
            {
                DDLBranches.Items.Add(new ListItem(brnch.BranchName, brnch.BranchName));
            }
        }

        private void initializeBranchesForUpdate(string selectedBranch)
        {
            var branches = (from branch in BranchManager.Branch()
                            select new
                            {
                              branchName= branch.BranchName
                            }).Distinct().ToList();
            var branchDeptCodes = BranchDeptCodeManager.FetchAll();
            DDLBranchesUpdate.Items.Clear();
            branchDeptCodes.RemoveAll(s => s.BranchName == selectedBranch);
            foreach (var bdc in branchDeptCodes)
            {
                branches.RemoveAll(b => b.branchName == bdc.BranchName);
            }

            foreach (var brnch in branches)
            {
                DDLBranchesUpdate.Items.Add(new ListItem(brnch.branchName, brnch.branchName));
            }
            DDLBranchesUpdate.SelectedValue = selectedBranch;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveBranchDepartmentCode_Click(object sender, EventArgs e)
        {
            BranchDepartmentCode newBranchDeptCode = new BranchDepartmentCode
            {
                 BranchName= DDLBranches.SelectedValue,
                  DepartmentCode = txtBranchDepartmentCode.Text
            };
            BranchDeptCodeManager.Save(newBranchDeptCode);
            gvBrandDepartmentCode.DataBind();
            initializeBranches();
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            long branchDeptCodeToDeleteId = long.Parse(gvBrandDepartmentCode.SelectedValue.ToString());
            BranchDepartmentCode branchDeptCodeToDelete = new BranchDepartmentCode
            {
                 RecordNumber = branchDeptCodeToDeleteId
            };
            BranchDeptCodeManager.Delete(branchDeptCodeToDelete);
            gvBrandDepartmentCode.DataBind();
            initializeBranches();
        }

        protected void gvBrandDepartmentCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtBranchDeptCodeToUpdate.Text = gvBrandDepartmentCode.SelectedRow.Cells[3].Text;
            lblBranchDepartmentCodeToDelete.Text = "Are you sure you want to delete dept. code: "+txtBranchDeptCodeToUpdate.Text;
            initializeBranchesForUpdate(gvBrandDepartmentCode.SelectedRow.Cells[2].Text);
            btnYes.Enabled = true;
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            long branchDeptCodeToDeleteId = long.Parse(gvBrandDepartmentCode.SelectedValue.ToString());
            BranchDepartmentCode branchDeptCodeToUpdate = new BranchDepartmentCode
            {
                BranchName = DDLBranchesUpdate.SelectedValue,
                DepartmentCode = txtBranchDeptCodeToUpdate.Text,
                RecordNumber = branchDeptCodeToDeleteId
            };
            BranchDeptCodeManager.Save(branchDeptCodeToUpdate);
            gvBrandDepartmentCode.DataBind();
            initializeBranches();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BranchDeptCodeManager.SearchBranchDepartmentCodes(SqlDataSourceBranchDepartmentCodes, txtSearch.Text);
        }
    }
}