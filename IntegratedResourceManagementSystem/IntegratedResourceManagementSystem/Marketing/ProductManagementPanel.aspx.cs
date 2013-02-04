using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.Components;
using IRMS.Entities;
using IRMS.ObjectModel;
using IntegratedResourceManagementSystem.Common;
using System.Text;

namespace IntegratedResourceManagementSystem.Marketing
{
    /// <summary>
    /// Description: Manage Styles and Products Partial Class
    /// Create by: Syste Generated Class Model.
    /// Modified by: Dennis Pitallano
    /// Last date Modified: June 1 2012
    /// Company: iServe Customer Service Management Solution Inc.
    /// </summary>
    public partial class ProductCategoryManagementPanel : System.Web.UI.Page
    {
        #region "public members"

        public ItemStyle STYLE_ { get; set; }

        #endregion
        #region "private variables"
        BrandManager BM = new BrandManager();
        FabricManager FM = new FabricManager();
        GarmentManager GM = new GarmentManager();
        SizeManager SM = new SizeManager();
        ColorManager CM = new ColorManager();
        ProductManager PM = new ProductManager();
        CategoryManager CatM = new CategoryManager();
        StyleManager StyleManager = new StyleManager();

        Product product = new Product();
        #endregion

        #region Page_init
        protected void Page_Init(object sender, EventArgs e)
        {
            #region check roles
            Permission.PERMITTED_USER = (UsersClass)Session["USER_ACCOUNT"];
           
            Permission.ROLES = (List<UserRole>)Session["USER_ROLES"];
            StringBuilder strPermissionNotification = new StringBuilder();
            strPermissionNotification.Append("Your Account do not have: <br />");
            if (Permission.CanInsert() == false)
            {
               
                pnlNotification.Visible = true;
                strPermissionNotification.Append(" - Permission to Insert/Add Style.<br />");
            }

            if (Permission.CanUpdate() == false)
            {
                this.btnUpdateProductCategory.Enabled = false;
                btnGenerateItemCodeAndSKUS.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Update/Edit Style.<br />");
            }

            if (Permission.CanDelete() == false)
            {
                btnCancelSelectedSKUs.Visible = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Cancel SKU's.<br />");
            }
            lblPermissionNotifications.Text = strPermissionNotification.ToString();
            #endregion
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //hfTotalStyles.Value = GetTotalItems().ToString("###,###");
                //hfTotalSKUS.Value = GetTotalSkus().ToString("###,###");
                //lblTotalItems.Text = hfTotalStyles.Value;
                //lblTotalSKUs.Text = hfTotalSKUS.Value;
                this.hfListStatus.Value = "ACTIVE";
             
            }
            txtSearch.Focus();
            btnCancelSelectedSKUs.Enabled = true;
        }

        private long GetTotalItems()
        {
           return StyleManager.StylesFromOld().Count;
        }

        private long GetTotalSkus()
        {
            return PM.GetAllOldProducts().Count;
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            PM.Delete(PM.GetProductByKey(long.Parse(gvProductList.SelectedRow.Cells[2].Text)));
            LoadAllStyles();
        }

        protected void gvProductList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                lblStyleNumber.Text = gvProductList.SelectedRow.Cells[3].Text;
                hfStyleNumber.Value = gvProductList.SelectedRow.Cells[3].Text;
                this.gvSKUDetails.DataBind();
                if (gvSKUDetails.Rows.Count > 0)
                {
                    btnGenerateItemCodeAndSKUS.Visible = false;
                    btnUpdateProductCategory.Visible = true;
                }
                else
                {
                    btnGenerateItemCodeAndSKUS.Visible = true;
                    btnUpdateProductCategory.Visible = false;
                   
                }
            }
            catch (Exception ex)
            {
                this.gvSKUDetails.DataBind();
                lblStyleNumber.Text = gvProductList.SelectedRow.Cells[3].Text;
            }
        }

        private void LoadProductDetails(string Status="Yes")
        {
            try
            {
             
                var products = PM.GetProductByStyleNumber(gvProductList.SelectedRow.Cells[3].Text, Status);
                var new_list = new List<Product>();
                foreach (Product product in products)
                {
                    string[] item_code = product.ItemCode.Split('-');
                    string new_description = "DESCRIPTION: " + product.Description + "\n";
                    new_description += " COLOR: " + CM.GetColorByCode(item_code[2]).ColorDescription + "\n";
                    new_description += " SIZE: " + SM.GetSizeByCode(item_code[3]).SizeDescription;
                    product.Description = new_description;
                    new_list.Add(product);
                }
                this.gvSKUDetails.DataSource = new_list;
                this.gvSKUDetails.DataBind();
            }
            catch (Exception)
            {
                this.gvSKUDetails.DataBind();
            }
        }

        private void LoadAllStyles(string approve_status="")
        {
            StyleManager.FilterStyles(SqlDataSourceStyles, approve_status);
           
        }

        protected void btnGenerateItemCodeAndSKUS_Click(object sender, EventArgs e)
        {
            try
            {
                Redirector.Redirect("~/Marketing/GenerateItemCode-SKUForm.aspx?SytleNumber=" +
            HttpUtility.HtmlEncode(gvProductList.SelectedRow.Cells[3].Text));
            }
            catch (Exception)
            {
                return;
            }
          
        }

        protected void rdioFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadAllStyles(rdioFilter.SelectedValue);
        }

        protected void btnUpdateGeneratedSKUs_Click(object sender, EventArgs e)
        {
            try
            {
                STYLE_ = StyleManager.GetStyleNumberByItemStyle(gvProductList.SelectedRow.Cells[3].Text);
            }
            catch (Exception)
            {
                STYLE_ = null;
            }
        }

        private List<Product> GetSelectedSKUToCancel() 
        {
            List<Product> list = new List<Product>();
            foreach (GridViewRow row in this.gvSKUDetails.Rows)
            {
                CheckBox ck = ((CheckBox)row.FindControl("chkSKUs"));
                if (ck.Checked)
                {
                    Product product = new Product();
                    product.ItemCode = row.Cells[2].Text;
                    product.SKUBarcode = row.Cells[3].Text;
                    product.RecordNo = long.Parse(ck.Text);
                    list.Add(product);
                }
                else
                {
                    //Code if it is not checked ......may not be required
                }
            }
            return list;
        }

        private List<IRMSProduct> GetSelectedSKUToCancelOldTable()
        {
            List<IRMSProduct> list = new List<IRMSProduct>();
            foreach (GridViewRow row in this.gvSKUDetails.Rows)
            {
                CheckBox ck = ((CheckBox)row.FindControl("chkSKUs"));
                if (ck.Checked)
                {
                    IRMSProduct product = new IRMSProduct();
                    product.ItemCode = row.Cells[2].Text;
                    product.SKU = row.Cells[3].Text;
                    product.ProductNumber = int.Parse(ck.Text);
                    list.Add(product);
                }
                else
                {
                    //Code if it is not checked ......may not be required
                }
            }
            return list;
        }

        protected void LoadSelectedSKUToCancel(object sender, EventArgs e)
        {
            try
            {
                List<IRMSProduct> list = GetSelectedSKUToCancelOldTable();
                this.gvSelectedSKUToCancel.DataSource = list;
                this.gvSelectedSKUToCancel.DataBind();
            }
            catch (Exception)
            {
                return;
            }
        }

        protected void btnCancelSelectedSKUs_Click(object sender, EventArgs e)
        {
            LoadSelectedSKUToCancel(sender, e);
            this.btnCancelSelectedSKUs_ModalPopupExtender.Show();
        }

        protected void btnContinueSKUCancelation_Click(object sender, EventArgs e)
        {
            try
            {
                List<IRMSProduct> list = GetSelectedSKUToCancelOldTable();

                try
                {
                    PM.DeleteProducts(list);
                }
                catch (Exception)
                {
                   throw;
                }
                gvSKUDetails.DataBind();
            }
            catch (Exception)
            {
                return;
            }
        }

        protected void btnSetAsActiveSelectedSKUs_Click(object sender, EventArgs e)
        {
            LoadSelectedSKUToCancel(sender, e);
            this.btnCancelSelectedSKUs_ModalPopupExtender.Show();
        }

        protected void btnUpdateProductCategory_Click(object sender, EventArgs e)
        {
            try
            {
                Redirector.Redirect("~/Marketing/UpdateGeneratedCodes-SKUs.aspx?SytleNumber=" +
               HttpUtility.HtmlEncode(gvProductList.SelectedRow.Cells[3].Text));
            }
            catch (Exception)
            {
                return;
            }
           
        }

        protected void imgBtnRelodStyleList_Click(object sender, ImageClickEventArgs e)
        {
            LoadAllStyles();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            try
            {
                SearchStyles();
            }
            catch (Exception)
            {

                return;
            }
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                SearchStyles();
            }
            catch (Exception)
            {

                return;
            }

        }

        private void SearchStyles()
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
            {
                gvProductList.DataBind();
                return;
            }
            StyleManager.SearchStyles(SqlDataSourceStyles, txtSearch.Text);
        }
    }
}