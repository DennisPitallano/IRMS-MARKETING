using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class BrandDepartmentCodeManagementPanel : System.Web.UI.Page
    {
        #region variables
        BrandManager BrandManager = new BrandManager();
        BrandDepartmentCodeManager BrandDeptCodeManager = new BrandDepartmentCodeManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            initializeBrands();
        }

        private void initializeBrands()
        {
            DDLBrands.Items.Clear();
            var brands =  BrandManager.Brands();
            var branchDepartmentCodes = BrandDeptCodeManager.FetchAll();
            
            foreach (var item in branchDepartmentCodes)
            {
                brands.RemoveAll(b => b.BrandDescription == item.BrandName);
            }

            foreach (var brand in brands)
            {
                DDLBrands.Items.Add(new ListItem(brand.BrandDescription, brand.BrandCode));
            }
        }

        private void initializeBrandsForUpdate(string selectedBrand)
        {
            this.DDLBrandsUpdate.Items.Clear();
            var brands = BrandManager.Brands();
            var availableBrands = new List<Brand>();
            var branchDepartmentCodes = BrandDeptCodeManager.FetchAll();

            branchDepartmentCodes.RemoveAll(s => s.BrandName == selectedBrand);

            foreach (var item in branchDepartmentCodes)
            {
                brands.RemoveAll(b => b.BrandDescription == item.BrandName);
            }
            
            foreach (var brand in brands)
            {
                DDLBrandsUpdate.Items.Add(new ListItem(brand.BrandDescription, brand.BrandCode));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveBrandDepartmentCode_Click(object sender, EventArgs e)
        {
            BrandDepartmentCode newBrandDepartmentCode = new BrandDepartmentCode
            {
                BrandCode = DDLBrands.SelectedValue,
                 BrandName = DDLBrands.SelectedItem.Text,
                  DepartmentCode = txtBrandDepartmentCode.Text 
            };
            BrandDeptCodeManager.Save(newBrandDepartmentCode);
          gvBrandDepartmentCode.DataBind();
          initializeBrands();
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            BrandDepartmentCode brandDeptCodetoDelete = new BrandDepartmentCode
            {
                 RecordNumber = int.Parse(gvBrandDepartmentCode.SelectedValue.ToString())
            };
            BrandDeptCodeManager.Delete(brandDeptCodetoDelete);
            gvBrandDepartmentCode.DataBind();
            initializeBrands();
        }

        protected void gvBrandDepartmentCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selecteddepartmentCode=gvBrandDepartmentCode.SelectedRow.Cells[4].Text;
            string selectedBrand = gvBrandDepartmentCode.SelectedRow.Cells[2].Text;
            this.txtBrandDeptCodeToUpdate.Text = selecteddepartmentCode;
            initializeBrandsForUpdate(selectedBrand);
            DDLBrandsUpdate.SelectedItem.Text = selectedBrand;
            lblBrandDepartmentCodeToDelete.Text = "Are you sure you want to delete department code: " + selecteddepartmentCode;
            btnYes.Enabled = true;
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            BrandDepartmentCode brandDeptCodetoToUpdate = new BrandDepartmentCode
            {
                RecordNumber = int.Parse(gvBrandDepartmentCode.SelectedValue.ToString())
                , BrandCode = DDLBrandsUpdate.SelectedValue,
                 BrandName = DDLBrandsUpdate.SelectedItem.Text,
                  DepartmentCode = txtBrandDeptCodeToUpdate.Text
            };
            BrandDeptCodeManager.Save(brandDeptCodetoToUpdate);
            gvBrandDepartmentCode.DataBind();
            initializeBrands();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BrandDeptCodeManager.SearchBrandDepartmentCodes(SqlDataSourceBrandDepartmentCodes, txtSearch.Text);
        }
    }
}