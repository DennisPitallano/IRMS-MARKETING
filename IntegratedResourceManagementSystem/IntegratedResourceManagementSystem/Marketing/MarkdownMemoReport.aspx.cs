using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using AjaxControlToolkit;
using IRMS.Components;
using IntegratedResourceManagementSystem.Reports.ReportDocuments;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class MarkdownMemoReport : System.Web.UI.Page
    {
        private string _HyperLinkAdd = string.Empty;
        private BrandManager BManager = new BrandManager();

        protected void Page_Init(object sender, EventArgs e)
        {
            _HyperLinkAdd = "~/Reports/ReportForms/MarkDownMemoPrintPreview.aspx?BrandName=[BrandName]&DateFrom=[DateFrom]&DateTo=[DateTo]&ReportType=[rpt]" + "";
            hpLinkPrint.NavigateUrl = _HyperLinkAdd;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack != true)
            {
                LoadBrandList();
            }
        }

        private void LoadBrandList()
        {
            List<Brand> bList = new List<Brand>();
            bList = BManager.Brands();

            DlBrandList.Items.Clear();
            foreach (Brand item in bList)
            {
                DlBrandList.Items.Add(new ListItem(item.BrandDescription, item.BrandCode));
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }

        protected void rdoReportSelection_SelectedIndexChanged(object sender, EventArgs e)
        {
            CreateReportUrl();

            switch (rdoReportSelection.SelectedIndex)
            {
                case 0:
                    {
                        DlBrandList.Enabled = true;
                        txtDateFrom.ReadOnly = true;
                        txtDateTo.ReadOnly = true;
                        break;
                    }
                case 1:
                    {

                        txtDateFrom.ReadOnly = false;
                        txtDateTo.ReadOnly = false;
                        break;
                    }
            }

        }

        protected void DlBrandList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CreateReportUrl();           
        }

        protected void txtDateFrom_TextChanged(object sender, EventArgs e)
        {
            CreateReportUrl();
        }

        protected void txtDateTo_TextChanged(object sender, EventArgs e)
        {
            CreateReportUrl();
        }

        private void CreateReportUrl()
        {
            hpLinkPrint.NavigateUrl = string.Format("~/Reports/ReportForms/MarkDownMemoPrintPreview.aspx?BrandName={0}&DateFrom={1}&DateTo={2}&ReportType={3}",DlBrandList.SelectedItem.Text,txtDateFrom.Text,txtDateTo.Text,(rdoReportSelection.SelectedIndex+1)); 
        }
    }
}