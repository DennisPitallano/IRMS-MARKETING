using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class ReturnsAndTransferReportPanel : System.Web.UI.Page
    {
        #region variables
        BrandManager BrandManager = new BrandManager();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            initializedBrandList();
            hpLinkPrint.NavigateUrl = getGeneratedReportLink();
        }

        private void initializedBrandList()
        {
            DDLBrands.Items.Clear();
            DDLBrands.Items.Add(new ListItem("ALL", "ALL"));
            foreach (var brand in BrandManager.Brands())
            {
                DDLBrands.Items.Add(new ListItem(brand.BrandDescription, brand.BrandDescription));
            }
        }

        private string getGeneratedReportLink()
        {
            string link = string.Empty;
            link = "~/Reports/ReportForms/PullOutletterReport.aspx?Brand="+DDLBrands.SelectedValue.ToString()+"&Status="+rdioAreaGroup.SelectedValue;
            return link;
        }

        protected void DDLBrands_SelectedIndexChanged(object sender, EventArgs e)
        {
            hpLinkPrint.NavigateUrl = getGeneratedReportLink();
        }

        protected void rdioAreaGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            hpLinkPrint.NavigateUrl = getGeneratedReportLink();
        }
    }
}