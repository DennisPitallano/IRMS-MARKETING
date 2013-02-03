using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.Entities;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class SkuBarcodeManagementPanel : System.Web.UI.Page
    {
        ProductManager PM = new ProductManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               // LoadAllSKUProduct();
            }
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            try
            {
                Image imgRecordNumberOld = (Image)gvSkusFromOld.SelectedRow.FindControl("imgRecordNumberOld");
                IRMSProduct selected_product = new IRMSProduct();
                selected_product.ProductNumber = int.Parse(imgRecordNumberOld.AlternateText);
                PM.DeleteProduct(selected_product);
                gvSkusFromOld.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
            lblDeletedSuccessful_ModalPopupExtender.Show();
        }

        protected void gvSkusFromOld_SelectedIndexChanged(object sender, EventArgs e)
        {
            string SKU = gvSkusFromOld.SelectedRow.Cells[6].Text;
            lblSKUToDelete.Text = "Are you sure you want to delete this SKU: " + SKU +"?" ;
            lblDeleted.Text = "SKU: " + SKU + "\nSUCCESSFULLY DELETED!";
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            PM.SearchSKU(SqlDataSourceAllSKUS, txtSearch.Text);
            gvSkusFromOld.DataBind();
        }

      
    }
}