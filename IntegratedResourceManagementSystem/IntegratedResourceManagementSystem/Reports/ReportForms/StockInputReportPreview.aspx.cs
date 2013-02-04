using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class StockInputReportPreview : System.Web.UI.Page
    {
        #region variables
        GroupAreaManager areaGroupManager = new GroupAreaManager();
        SubGroupAreaManager subAreaGroupManager = new SubGroupAreaManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            txtArea.Text = areaGroupManager.GetAreaGroupByKey(int.Parse(Request.QueryString["Area"])).GroupName;
            txtSubArea.Text = subAreaGroupManager.GetSubAreaGroupByKey(int.Parse(Request.QueryString["SubArea"])).GroupName;
            txtBrand.Text = Request.QueryString["Brand"];
            txtDateRange.Text = DateTime.Parse(Request.QueryString["DateFrom"]).ToString("MMMM dd, yyyy") + " - " 
                + DateTime.Parse(Request.QueryString["DateTo"]).ToString("MMMM dd, yyyy");
            txtMemmoStatus.Text = Request.QueryString["PriceStatus"];

            hpPrint.NavigateUrl = "~/Reports/ReportForms/StockInputReportPrintPreview.aspx?Area=" + Request.QueryString["Area"] 
                + "&SubArea=" + Request.QueryString["SubArea"]
                + "&DateFrom=" + Request.QueryString["DateFrom"] + "&DateTo=" + Request.QueryString["DateTo"]
                + "&Brand=" + Request.QueryString["Brand"] + "&PriceStatus=" + Request.QueryString["PriceStatus"];
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}