using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IntegratedResourceManagementSystem.Shared;
namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class NewTransferSummary : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager();
        PullOutLetterSummaryManager POLSummaryManager = new PullOutLetterSummaryManager();
        StockTransferManager STManager = new StockTransferManager();
        BrandManager BrandManager = new BrandManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            int PullOutId = int.Parse(Request.QueryString["PullOutId"]);
            string PullOutCode = Request.QueryString["PullOutCode"];
            string PullOutSeriesNumber = Request.QueryString["PullOutSeries"];

            PullOutLetter PullOutLetter = POLManager.FetchById(PullOutId);

            hfFromBrand.Value = PullOutLetter.BrandName;
            txtAccountName.Text = PullOutLetter.AccountName;
            txtBranchName.Text = PullOutLetter.BranchName;
            txtFromCustomer.Text = PullOutLetter.CompanyName;
            txtPOLSeriesNumber.Text = PullOutLetter.SeriesNumber;
            Label1.Text = PullOutLetter.ForSM.ToString();
            txtTotalQTY.Text = PullOutLetter.TotalQuantity.ToString("###,###");

            var POLSummaries = POLSummaryManager.PullOutLetterSummariesByPullOutCode(PullOutCode);
            foreach (var summary in POLSummaries)
            {
                if (summary.ContainerType=="Box")
                {
                    summary.PullOutCode = Constant.BoxImageUrl;
                }
                else
                {
                    summary.PullOutCode = Constant.SackImageUrl;
                }
            }
            gvPOLSummaries.DataSource = POLSummaries;
            gvPOLSummaries.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void iBtnSearchCustomer_Click(object sender, ImageClickEventArgs e)
        {
            POLManager.SearchCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text, false, hfFromBrand.Value);
            btnBrowseToCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            btnBrowseToCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnSelectCustomer.Enabled = true;
            btnBrowseToCustomer_ModalPopupExtender.Show();

        }

        protected void gvCustomers_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            btnBrowseToCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_Sorting(object sender, GridViewSortEventArgs e)
        {
            btnBrowseToCustomer_ModalPopupExtender.Show();
        }

        protected void btnSelectCustomer_Click(object sender, EventArgs e)
        {
            txtToCustomer.Text = gvCustomers.SelectedDataKey[1].ToString();
            if (string.Equals(txtFromCustomer.Text, txtToCustomer.Text) == true)
            {
                lblErrorMessage.Text = "WARNING! <br />Cannot transfer into thesame Outlet!";
                txtToCustomer.Text = string.Empty;
                txtToBranchName.Text = string.Empty;
                txtToAccountName.Text = string.Empty;
                hfErrorModalHandLer_ModalPopupExtender.Show();
                return;
            }
            int customerNumber = int.Parse(gvCustomers.SelectedValue.ToString());
            hfAreaGroupNo.Value = gvCustomers.SelectedDataKey[5].ToString();
            hfCustomerNumber.Value = gvCustomers.SelectedValue.ToString();
            hfPGMDNo.Value = gvCustomers.SelectedDataKey[3].ToString();
            hfPGNo.Value = gvCustomers.SelectedDataKey[4].ToString();
            hfSubAreaGroupNo.Value = gvCustomers.SelectedDataKey[6].ToString();
            string brandName = gvCustomers.SelectedDataKey[2].ToString();
            hfBrandCode.Value = BrandManager.GetBrandByBrandName(brandName).BrandCode;
            txtToBranchName.Text = POLManager.GetBranchNameByCustomerNumber(customerNumber);
            txtToAccountName.Text = POLManager.GetAccountNameByCustomerNumber(customerNumber);

        }

        protected void txtSearchStyleNumber_TextChanged(object sender, EventArgs e)
        {
            POLManager.SearchStyles(SqlDataSourceStyles, txtSearchStyleNumber.Text, hfFromBrand.Value);
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            POLManager.SearchStyles(SqlDataSourceStyles, txtSearchStyleNumber.Text, hfFromBrand.Value);
        }

        protected void gvStyles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearchStyleNumber.Text))
            {
                POLManager.SearchStyles(SqlDataSourceStyles, txtSearchStyleNumber.Text, hfFromBrand.Value);
            }
        }
    }
}