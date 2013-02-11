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
    public partial class ViewProductsData : System.Web.UI.Page
    {
        #region variables
        ProductManager PM = new ProductManager();
        StyleManager StyleManager = new StyleManager();
        #endregion
        protected void Page_Init(object sender, EventArgs e)
        {
            List<IRMSProduct> products = PM.GetAllProductsByStyleNumber(Request.QueryString["SN"]);
            ProductStyle style = StyleManager.GetStyleNumberByItemStyleFromOld(Request.QueryString["SN"]);
            lblStyleNumber.Text = Request.QueryString["SN"];
            lblBrand.Text = Request.QueryString["Brand"];
            lblCostPrice.Text = style.Cost.ToString("###,###.00");
            lblStyleDescription.Text = style.StyleDescription;
            lblFabric.Text = style.Fabric;
            lblFitting.Text = style.Fit;
            lblSubFitting.Text = style.SubFitting;
            chkIsActive.Checked = style.IsActive;
            gvProducts.DataSource = products;
            gvProducts.DataBind();
            hpLinkPrintPreview.NavigateUrl = "~/Reports/ReportForms/StylePrintPreview.aspx?SN=" + lblStyleNumber.Text + "&Brand=" + lblBrand.Text;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}