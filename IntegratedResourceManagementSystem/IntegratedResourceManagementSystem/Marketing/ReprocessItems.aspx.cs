using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.Entities;
using IRMS.ObjectModel;
using System.Text;
using IntegratedResourceManagementSystem.Common;
using IRMS.Components;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class ReprocessItems : System.Web.UI.Page
    {
        #region variables
        GenericStyleManager GenericStyleManger = new GenericStyleManager();
        StyleManager StyleManager = new StyleManager();
        ProductManager ProductManager = new ProductManager();
        BrandManager BrandManager = new BrandManager();
        string START_BARCODE = "0000000000";
        #endregion

        #region Page_init
        protected void Page_Init(object sender, EventArgs e)
        {
            #region check roles
            Permission.PERMITTED_USER = (UsersClass)Session["USER_ACCOUNT"];
           
            Permission.ROLES = (List<UserRole>)Session["USER_ROLES"];
            StringBuilder strPermissionNotification = new StringBuilder();
            strPermissionNotification.Append("Your Account do not have: <br />");
           
            if (Permission.CanUpdate() == false)
            {
                this.btnViewPriceHistory.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Reclassify Item/s.<br />");
            }

            lblPermissionNotifications.Text = strPermissionNotification.ToString();
            #endregion
        }
        #endregion

        /// <summary>
        /// Get Last Generix Style Barcode Series
        /// </summary>
        /// <param name="Brand">Brand Name</param>
        /// <returns>Barcode</returns>
        private long GenericStyleBarcode(string Brand)
        {
            string Barcode = "0";
            var genericStyleProduct = (from generic_prod in GenericStyleManger.GenericStyles()
                                        where generic_prod.Brand == Brand
                                        orderby generic_prod.BarCode descending
                                        select generic_prod).FirstOrDefault();
            if (genericStyleProduct != null)
            {
                Barcode = genericStyleProduct.BarCode;
            }
            return long.Parse(Barcode);
        }

        /// <summary>
        /// Get Start Series by Brand (Start of Barcode)
        /// </summary>
        /// <returns>Start Series Number</returns>
        private string GetStartSeries()
        {
            return BrandManager.GetBrandByBrandName(DDLBrands.SelectedValue).StartSeries;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="StyleNumber"></param>
        /// <returns></returns>
        private long GetBarCodeByStyleNumber(string StyleNumber)
        {
            string Barcode = "0";
            var genericStyleProduct = (from generic_prod in GenericStyleManger.GenericStyles()
                                       where generic_prod.GenericStyleNumber == StyleNumber
                                       orderby generic_prod.BarCode descending
                                       select generic_prod).FirstOrDefault();
            if (genericStyleProduct != null)
            {
                Barcode = genericStyleProduct.BarCode;
            }
            return long.Parse(Barcode);
        }

        private string GenerateBarCode(string Brand)
        {
            string BarCode = "";
            long ProductBarCode = ProductSKU(Brand);
            long GenericBarCode = GenericStyleBarcode(Brand);
            long BarCodeByStyleNo = GetBarCodeByStyleNumber(DDLNewStyle.SelectedValue);

            if (BarCodeByStyleNo != 0)
            {
                BarCode = BarCodeByStyleNo.ToString();
            }
            else
            {
                if (ProductBarCode != 0)
                {
                    if (ProductBarCode > GenericBarCode)
                    {
                        BarCode = (ProductBarCode+1).ToString();
                    }
                    else
                    {
                        BarCode = (GenericBarCode+1).ToString();
                    }
                }
                else
                {
                    BarCode =(long.Parse(GetStartSeries() + START_BARCODE)+1).ToString();
                }
            }
            hfSRP.Value = StyleManager.GetStyleNumberByItemStyle(DDLNewStyle.SelectedValue).SRP.ToString() ;
           
            return BarCode;
        }

        private long ProductSKU(string Brand)
        {
            string Barcode = "0";
            try
            {
                var products = (from prod in ProductManager.GetAllOldProducts()
                                where prod.BrandName == Brand
                                orderby prod.SKU descending
                                select prod).FirstOrDefault();

                if (products != null)
                {
                    Barcode = (long.Parse(products.SKU)).ToString();
                }
            }
            catch (Exception)
            {
                // throw;
            }

            return long.Parse(Barcode);
        }

        private void GetAllGenericStyles()
        {
            DDLNewStyle.Items.Clear();
            DDLNewStyle.Items.Add(new ListItem("--Select Style--", ""));
            var genericStyles = (from gen_style in StyleManager.StylesFromOld()
                                where gen_style.IsGeneric == true && gen_style.BrandName==DDLBrands.SelectedValue
                                select gen_style).ToList();
            foreach (ProductStyle gen_style_ in genericStyles)
            {
                DDLNewStyle.Items.Add(new ListItem(gen_style_.StyleNumber, gen_style_.StyleNumber));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void gvItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            hfStyleNumber.Value = HttpUtility.HtmlDecode(gvItems.SelectedRow.Cells[3].Text);
            hpLinkPreviewHistory.NavigateUrl = "PriceHistory.aspx?BRAND=" + DDLBrands.SelectedValue + "&STYLE_NUMBER=" + hfStyleNumber.Value;
        }

        public void GetSelectedItems()
        {
            List<ITEM> selected_items = new List<ITEM>();
            foreach (GridViewRow row in this.gvItems.Rows)
            {
                CheckBox chkItem = (CheckBox)row.FindControl("chkItems");
                ITEM item = new ITEM
                {
                    StyleNumber = row.Cells[3].Text,
                    Description = row.Cells[4].Text
                };
                if (chkItem.Checked)
                {
                    selected_items.Add(item);
                }
            }
            gvSelectedItems.DataSource = selected_items;
            gvSelectedItems.DataBind();

            lblBarCode.Text = GenerateBarCode(DDLBrands.SelectedValue);
            lblSelectedItemsModalHandler_ModalPopupExtender.Show();
        }

        protected void btnViewPriceHistory_Click(object sender, EventArgs e)
        {
            GetSelectedItems();
        }

        protected void btnContinueReprocess_Click(object sender, EventArgs e)
        {
            List<GenericStyleProduct> GenericStyleProducts = new List<GenericStyleProduct>();

            foreach (GridViewRow row in this.gvSelectedItems.Rows)
            {
                GenericStyleProduct generic_style_product = new GenericStyleProduct
                {
                 BarCode = lblBarCode.Text ,
                 Brand = DDLBrands.SelectedValue,
                 DateGenerated = DateTime.UtcNow,
                 GenericStyleNumber = DDLNewStyle.SelectedValue,
                 OldStyleNumber = row.Cells[0].Text,
                  SRP = decimal.Parse(hfSRP.Value)
                };
                GenericStyleProducts.Add(generic_style_product);
            }

            GenericStyleManger.Save(GenericStyleProducts);
            Response.Redirect("~/Marketing/GenericStylesManagementPanel.aspx");
         //   lblSuccessFullReprocessModalHandler_ModalPopupExtender.Show();
        }

        protected void DDLNewStyle_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblBarCode.Text = GenerateBarCode(DDLBrands.SelectedValue);
            lblSelectedItemsModalHandler_ModalPopupExtender.Show();
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            StyleManager.SearchStylesForReprocess(SqlDataSourceStyles, txtSearch.Text, DDLBrands.SelectedValue);
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            StyleManager.SearchStylesForReprocess(SqlDataSourceStyles, txtSearch.Text, DDLBrands.SelectedValue);
        }

        protected void gvItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearch.Text))
            {
                StyleManager.SearchStylesForReprocess(SqlDataSourceStyles, txtSearch.Text, DDLBrands.SelectedValue);
            }
        }

        protected void gvItems_Sorting(object sender, GridViewSortEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearch.Text))
            {
                StyleManager.SearchStylesForReprocess(SqlDataSourceStyles, txtSearch.Text, DDLBrands.SelectedValue);
            }
        }

        protected void gvItems_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearch.Text))
            {
                StyleManager.SearchStylesForReprocess(SqlDataSourceStyles, txtSearch.Text, DDLBrands.SelectedValue);
            }
        }

        protected void DDLDisplayPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvItems.PageSize = int.Parse(DDLDisplayPageSize.SelectedValue);
        }
    }

    public class ITEM
    {
        public string StyleNumber { get; set; }
        public string Brand { get; set; }
        public string Description { get; set; }
        public decimal CostPrice { get; set; }
        public string APType { get; set; }
        public int Box { get; set; }
    }
}