using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;
using IRMS.BusinessLogic.Manager;
using IRMS.Entities;

namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class PullOutLetterSummaryPrintPreview : System.Web.UI.Page
    {
        #region variables
        CompanyManager CompanyManager = new CompanyManager();
        #endregion 
        protected void Page_Init(object sender, EventArgs e)
        {
            List<PullOutLetterSummary> POLSummaries = (List<PullOutLetterSummary>)Session["POL_SUMMARIES"];

            Company company = CompanyManager.GetComapnyByKey(int.Parse(Request.QueryString["CustomerId"]));
            imgLogo.ImageUrl = "~/Marketing/Marketing-Admin/company-logos/" + company.CompanyLogo;
            lblBranch.Text = Request.QueryString["Branch"];
            lblCustomer.Text = Request.QueryString["Customer"];
            lblseries.Text = Request.QueryString["Series"];
            if (POLSummaries.Count > 1)
            {
                PullOutLetterSummary polTotalSum = new PullOutLetterSummary
                {
                    ContainerNumber = POLSummaries.Count,
                    ContainerType = "TOTAL: ",
                    TotalQuantity = POLSummaries.Sum(s => s.TotalQuantity)
                };
                POLSummaries.Add(polTotalSum);
            }
            gvSummaries.DataSource = POLSummaries;
            gvSummaries.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void gvCompanyLogos_SelectedIndexChanged(object sender, EventArgs e)
        {
            imgLogo.ImageUrl = "~/Marketing/Marketing-Admin/company-logos/" + gvCompanyLogos.SelectedValue.ToString();
            btnChangeLogo_ModalPopupExtender.Show();
        }
    }
}