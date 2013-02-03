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
    public partial class CustomerDeliveryIndexReports : System.Web.UI.Page
    {
        #region variables
        BrandManager BM = new BrandManager();
        #endregion
        protected void Page_Init(object sender, EventArgs e)
        {
            InitializeBrandList();
            InitializeYearAndMonthList();
        }

        private void InitializeYearAndMonthList()
        {
            DDLMonth.Items.Clear();
            for (int i = 0; i < 12;i++ )
            {
                DDLMonth.Items.Add(new ListItem(DateTime.Now.AddMonths(i).ToString("MMMM"), DateTime.Now.AddMonths(i).ToString("MM")));
            }
            DDLYear.Items.Clear();
            DDLYearPerArea.Items.Clear();
            DDLYearPerAreaAndCustomer.Items.Clear();
            for (int y = 2006; y <= DateTime.UtcNow.Year+1; y++)
            {
                DDLYear.Items.Add(new ListItem(y.ToString(), y.ToString()));
                DDLYearPerArea.Items.Add(new ListItem(y.ToString(), y.ToString()));
                DDLYearPerAreaAndCustomer.Items.Add(new ListItem(y.ToString(), y.ToString()));
            }
            DDLYear.SelectedValue = DateTime.UtcNow.Year.ToString();
            DDLYearPerArea.SelectedValue = DateTime.UtcNow.Year.ToString();
            DDLYearPerAreaAndCustomer.SelectedValue = DateTime.UtcNow.Year.ToString();

        }
        private void InitializeBrandList()
        {
            DDLBrandsForArea.Items.Clear();
            DDLBrandsPerArea.Items.Clear();
            DDLBrandPerAreaAndCustomer.Items.Clear();
            foreach (Brand brand in BM.Brands())
            {
                DDLBrandsForArea.Items.Add(new ListItem(brand.BrandDescription, brand.BrandDescription));
                DDLBrandsPerArea.Items.Add(new ListItem(brand.BrandDescription, brand.BrandDescription));
                DDLBrandPerAreaAndCustomer.Items.Add(new ListItem(brand.BrandDescription, brand.BrandDescription));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rdioAreaGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            hpLinkPrint.NavigateUrl = CreateReportLink(rdioAreaGroup.SelectedValue);
        }

        private string CreateReportLink(string AreaGroup)
        {
            string link = "";
            switch (AreaGroup)
            {   
                case "MMDS":
                    link = "~/Reports/ReportForms/MMDSDRSummaryPrintPreview.aspx?Month=" + DDLMonth.SelectedValue + "&Year=" + DDLYear.SelectedValue + "&Brand=" + DDLBrandsForArea.SelectedValue +"&Status="+rdioTransitStatus.SelectedValue;
                    break;
                case "LUZON":
                    link = "~/Reports/ReportForms/LUZONDRSummaryPrintPreview.aspx?Month=" + DDLMonth.SelectedValue + "&Year=" + DDLYear.SelectedValue + "&Brand=" + DDLBrandsForArea.SelectedValue + "&Status=" + rdioTransitStatus.SelectedValue;
                    break;
                case "VISAYAS":
                    link = "~/Reports/ReportForms/VISAYASDRSummaryPrintPreview.aspx?Month=" + DDLMonth.SelectedValue + "&Year=" + DDLYear.SelectedValue + "&Brand=" + DDLBrandsForArea.SelectedValue + "&Status=" + rdioTransitStatus.SelectedValue;
                    break;
                case "MINDANAO":
                    link = "~/Reports/ReportForms/MINDANAODRSummaryPrintPreview.aspx?Month=" + DDLMonth.SelectedValue + "&Year=" + DDLYear.SelectedValue + "&Brand=" + DDLBrandsForArea.SelectedValue + "&Status=" + rdioTransitStatus.SelectedValue;
                    break;
                case "BOUTIQUE":
                    link = "~/Reports/ReportForms/BTQDRSummaryPrintPreview.aspx?Month=" + DDLMonth.SelectedValue + "&Year=" + DDLYear.SelectedValue + "&Brand=" + DDLBrandsForArea.SelectedValue + "&Status=" + rdioTransitStatus.SelectedValue;
                    break;
                default:
                    //link = "CustomerDeliveryIndexReports.aspx";
                    break;
            }
            return link;
        }

        protected void DDLMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            hpLinkPrint.NavigateUrl = CreateReportLink(rdioAreaGroup.SelectedValue);
        }

        protected void DDLYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            hpLinkPrint.NavigateUrl = CreateReportLink(rdioAreaGroup.SelectedValue);
        }

        protected void DDLBrandsForArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            hpLinkPrint.NavigateUrl = CreateReportLink(rdioAreaGroup.SelectedValue);
        }

        protected void DDLYearPerArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            CreatePrintLinkPerArea();
        }

        private void CreatePrintLinkPerArea()
        {
            hpLinkPrintPerArea.NavigateUrl = "~/Reports/ReportForms/DRSummaryPerAreaPrintPreview.aspx?Year=" + DDLYearPerArea.SelectedValue + "&Brand=" + DDLBrandsPerArea.SelectedValue + "&Template="+rdioTemplates.SelectedValue+"&Status="+rdioTransitStatusPerArea.SelectedValue;
        }

        protected void DDLBrandsPerArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            CreatePrintLinkPerArea();
        }

        protected void rdioTemplates_SelectedIndexChanged(object sender, EventArgs e)
        {
            CreatePrintLinkPerArea();
        }

        protected void rdioAreaGroupPerAreaAndCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            CreatePrintLinkPerAreaAndCustomer();
        }

        private void CreatePrintLinkPerAreaAndCustomer()
        {
            if (rdioAreaGroupPerAreaAndCustomer.SelectedValue != "LUZON")
            {
                hplinkPrintPreviewPerAreaAndCustomer.NavigateUrl = "~/Reports/ReportForms/DRSummaryPerAreaAndCustomerPrintPreview.aspx?Year=" + DDLYearPerAreaAndCustomer.SelectedValue + "&Brand=" + DDLBrandPerAreaAndCustomer.SelectedValue + "&Area=" + rdioAreaGroupPerAreaAndCustomer.SelectedValue+"&Status="+rdioStatusPerAreaAndCustomer.SelectedValue;
            }
            else
            {
                hplinkPrintPreviewPerAreaAndCustomer.NavigateUrl = "~/Reports/ReportForms/DRSummaryPerAreaAndCustomerLuzonPrintPreview.aspx?Year=" + DDLYearPerAreaAndCustomer.SelectedValue + "&Brand=" + DDLBrandPerAreaAndCustomer.SelectedValue + "&Area=" + rdioAreaGroupPerAreaAndCustomer.SelectedValue + "&Status=" + rdioStatusPerAreaAndCustomer.SelectedValue;
            }
        }

        protected void DDLYearPerAreaAndCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            CreatePrintLinkPerAreaAndCustomer();
        }

        protected void DDLBrandPerAreaAndCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            CreatePrintLinkPerAreaAndCustomer();
        }

        protected void rdioTransitStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            hpLinkPrint.NavigateUrl = CreateReportLink(rdioAreaGroup.SelectedValue);
        }

        protected void rdioStatusPerAreaAndCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            CreatePrintLinkPerAreaAndCustomer();
        }

        protected void rdioTransitStatusPerArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            CreatePrintLinkPerArea();
        }
    }
}