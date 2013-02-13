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
    public partial class NewTransferDetails : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager();
        PullOutLetterSummaryManager POLSummaryManager = new PullOutLetterSummaryManager();
        StockTransferManager STManager = new StockTransferManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            int PullOutId = int.Parse(Request.QueryString["PullOutId"]);
            string PullOutCode = Request.QueryString["PullOutCode"];
            string PullOutSeriesNumber = Request.QueryString["PullOutSeries"];

            PullOutLetter PullOutLetter = POLManager.FetchById(PullOutId);

            txtAccountName.Text = PullOutLetter.AccountName;
            txtBranchName.Text = PullOutLetter.BranchName;
            txtFromCustomer.Text = PullOutLetter.CompanyName;
            txtPOLSeriesNumber.Text = PullOutLetter.SeriesNumber;
            Label1.Text = PullOutLetter.ForSM.ToString();
            txtTotalQTY.Text = PullOutLetter.TotalQuantity.ToString("###,###");
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DDLCustomerBrands_SelectedIndexChanged(object sender, EventArgs e)
        {
            POLManager.SearchCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text, true, DDLCustomerBrands.SelectedValue);
            btnBrowseToCustomer_ModalPopupExtender.Show();
        }

        protected void iBtnSearchCustomer_Click(object sender, ImageClickEventArgs e)
        {
            POLManager.SearchCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text, true, DDLCustomerBrands.SelectedValue);
            btnBrowseToCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            btnBrowseToCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
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

        }
    }
}