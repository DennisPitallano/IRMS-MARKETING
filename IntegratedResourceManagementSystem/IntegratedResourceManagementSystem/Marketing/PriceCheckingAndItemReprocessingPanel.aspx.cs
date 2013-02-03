using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.Entities;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class PriceCheckingAndItemReprocessingPanel : System.Web.UI.Page
    {
        #region variables
        ItemsReprocessManager ItemReprocessManager = new ItemsReprocessManager();
        BrandManager BrandManager = new BrandManager();

        public List<ITEM> STYLES
        {
            get
            {
                return GetSelectedStyles();
            }
        }
        
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            InitializedBrandList();
        }

        private void InitializedBrandList()
        {
            DDLCustomerBrands.Items.Clear();
            DDLCustomerBrands.Items.Add(new ListItem("-SELECT BRAND-", ""));
            foreach(Brand brand in BrandManager.Brands()){
                DDLCustomerBrands.Items.Add(new ListItem(brand.BrandDescription, brand.BrandDescription));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNewBrand_Click(object sender, EventArgs e)
        {
            List<IRMSProduct> list = new List<IRMSProduct>();
            foreach (GridViewRow row in this.gvProductList.Rows)
            {
                CheckBox ck = ((CheckBox)row.FindControl("chkSKUs"));
                if (ck.Checked)
                {
                    IRMSProduct product = new IRMSProduct();
                    product.ItemCode = row.Cells[4].Text;
                    product.SKU = row.Cells[5].Text;
                    product.BrandName = ck.ToolTip;
                    list.Add(product);
                }
            }
        }

        protected void btnFilterByBrand_Click(object sender, EventArgs e)
        {
            hfFilterBrand.Value = DDLBrands.SelectedValue;
            hfBrandForCustomerFilter.Value = DDLBrands.SelectedValue;
            ItemReprocessManager.FilterStyles(SqlDataSourceStyles, DDLBrands.SelectedValue);
            pnlCustomerBrands.Visible = false;
        }

        protected void btnReFresh_Click(object sender, EventArgs e)
        {
            hfFilterBrand.Value = "ALL";
            gvProductList.DataBind();

        }

        protected void gvProductList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CheckFiltering();
        }

        private void CheckFiltering()
        {
            if (hfFilterBrand.Value != "ALL")
            {
                ItemReprocessManager.FilterStyles(SqlDataSourceStyles, DDLBrands.SelectedValue);
            }
        }

        protected void gvCustomers_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearchCustomer.Text))
            {
                ItemReprocessManager.SearchCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text, hfBrandForCustomerFilter.Value);
            }
            btnPriceCheck_ModalPopupExtender.Show();
        }

        protected void gvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearchCustomer.Text))
            {
                ItemReprocessManager.SearchCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text, hfBrandForCustomerFilter.Value);
            }
            btnPriceCheck_ModalPopupExtender.Show();
        }

        protected void gvCustomers_Sorting(object sender, GridViewSortEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearchCustomer.Text))
            {
                ItemReprocessManager.SearchCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text, hfBrandForCustomerFilter.Value);
            }
            btnPriceCheck_ModalPopupExtender.Show();
        }

        protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            Image imgCustomer = (Image)gvCustomers.SelectedRow.FindControl("imgCustomer");
            
            hfCustomerId.Value = imgCustomer.AlternateText;
            txtCustomer.Text = gvCustomers.SelectedRow.Cells[3].Text;
            hpLinkContinuePriceCheck.Enabled = true;
            Session["STYLES"] = STYLES;
            hpLinkContinuePriceCheck.NavigateUrl = "CheckStylesPrice.aspx?CustomerNumber=" + hfCustomerId.Value + "";
            foreach (GridViewRow row in this.gvSelectedStyles.Rows)
            {
                CheckBox chkItem = (CheckBox)row.FindControl("chkItems");
                chkItem.Checked = false;
            }
        }

        protected void gvProductList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Image imgCustomer = (Image)gvProductList.SelectedRow.FindControl("imgStyle");
            hfStyleNumber.Value = gvProductList.SelectedRow.Cells[4].Text;
            hfBrandForCustomerFilter.Value = gvProductList.SelectedRow.Cells[7].Text;
            gvCustomers.DataBind();
            btnPriceCheck.CssClass = "btnPriceCheck";
           // lblStyleNumber.Text = gvProductList.SelectedRow.Cells[4].Text;
            btnPriceCheck.Enabled = true;
            lblStyleNumberHistory.Text = "PRICE HISTORY LIST FOR STYLE #: " + hfStyleNumber.Value + ".";
            lblPriceTitle.Text = "PRICES OF STYLE BASE ON PRICE GROUP.";
            lblMarkDownHistoryTitle.Text = "MARKDOWN HISTORY LIST.";
            pnlSelectError.Visible = false;
        }

        protected void gvProductList_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            CheckFiltering();
        }

        protected void gvProductList_Sorting(object sender, GridViewSortEventArgs e)
        {
            CheckFiltering();
        }

        protected void iBtnSearchCustomer_Click(object sender, ImageClickEventArgs e)
        {
            ItemReprocessManager.SearchCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text, hfBrandForCustomerFilter.Value);
            btnPriceCheck_ModalPopupExtender.Show();
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            SearchStyles();
        }

        private void SearchStyles()
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
            {
                gvProductList.DataBind();
                return;
            }
            ItemReprocessManager.SearchStyles(SqlDataSourceStyles, txtSearch.Text, hfFilterBrand.Value);
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            SearchStyles();
        }

        protected void btnAddStyle_Click(object sender, EventArgs e)
        {
            List<ITEM> selected_items = STYLES;
            foreach (GridViewRow row in this.gvProductList.Rows)
            {
                CheckBox chkItem = (CheckBox)row.FindControl("chkItems");
                Image imgItem = (Image)row.FindControl("imgStyle");
                ITEM item = new ITEM
                {
                    StyleNumber = row.Cells[4].Text,
                    Brand = row.Cells[7].Text,
                    CostPrice = decimal.Parse(imgItem.AlternateText),
                    Description  =  (row.Cells[5].Text),
                     APType = imgItem.ToolTip 
                };
                if (chkItem.Checked)
                {
                    if (!IsAlreadySelected(selected_items, item.StyleNumber, item.Description))
                    {
                        selected_items.Add(item);
                    }
                }
            }
            CheckHasSelected(selected_items);
            gvSelectedStyles.DataSource = selected_items;
            gvSelectedStyles.DataBind();
           UncheckSelectedStyles();
        }

        private void UncheckSelectedStyles()
        {
            foreach (GridViewRow row in this.gvProductList.Rows)
            {
                CheckBox chkItem = (CheckBox)row.FindControl("chkItems");
                if (chkItem.Checked)
                {
                    chkItem.Checked = false;
                }
            }
        }

        private void CheckHasSelected(List<ITEM> selected_items)
        {
            if (selected_items.Count > 0)
            {
                btnPriceCheck.CssClass = "btnPriceCheck";
                btnPriceCheck.Enabled = true;
            }
            else
            {
                btnPriceCheck.CssClass = "btnDisablePriceCheck";
                btnPriceCheck.Enabled = false;
            }
        }

        protected void btnRemoveStyle_Click(object sender, EventArgs e)
        {
            List<ITEM> selected_items = GetSelectedStyles();
            CheckHasSelected(selected_items);
            gvSelectedStyles.DataSource = selected_items;
            gvSelectedStyles.DataBind();
        }

        private bool IsAlreadySelected(List<ITEM> selected_items,string StyleNumber,string Brand)
        {
            bool result = false;
            foreach (ITEM item_ in selected_items)
            {
                if (item_.StyleNumber == StyleNumber && item_.Description == Brand)
                {
                    result= true;
                    break;
                }
            }
            return result;
        }
        private List<ITEM> GetSelectedStyles()
        {
            List<ITEM> selected_items = new List<ITEM>();
            foreach (GridViewRow row in this.gvSelectedStyles.Rows)
            {
                CheckBox chkItem = (CheckBox)row.FindControl("chkItems");
              Image imgItem = (Image)row.FindControl("imgStyle");
                ITEM item = new ITEM
                {
                    StyleNumber = row.Cells[2].Text,
                    Brand = row.Cells[3].Text,
                    CostPrice = decimal.Parse(imgItem.AlternateText.Split('-')[0]),
                    Description  = imgItem.ToolTip,
                    APType = imgItem.AlternateText.Split('-')[1]
                };
                if (!chkItem.Checked)
                {
                    selected_items.Add(item);
                }
            }
            return selected_items;
        }

        protected void DDLCustomerBrands_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnPriceCheck_ModalPopupExtender.Show();
            hfBrandForCustomerFilter.Value = DDLCustomerBrands.SelectedValue;
        }

    }
}