using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class NewTransfer : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager();
        PullOutLetterSummaryManager POLSummaryManager = new PullOutLetterSummaryManager();
        StockTransferManager STManager = new StockTransferManager();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvPullOutLetter_SelectedIndexChanged(object sender, EventArgs e)
        {
             string pullOutCode = gvPullOutLetter.SelectedDataKey[1].ToString();
            int pullOutId = int.Parse(gvPullOutLetter.SelectedValue.ToString());
            string pullOutSeriesNumber = gvPullOutLetter.SelectedDataKey[2].ToString();
            List<PullOutLetterDetail> POLDetails = POLDetailManager.PullOutLetterDetailsByPullOutCode(pullOutCode);
            List<PullOutLetterSummary> POLSummaries = POLSummaryManager.PullOutLetterSummariesByPullOutCode(pullOutCode);
          
               this.hpLinkViewDetails.NavigateUrl = "~/Reports/ReportForms/PullOutLetterPrintPreview.aspx?PullOutId=" + pullOutId + "&PullOutCode="
               + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
        }

        protected void rdioFilterPullOutLetterType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdioFilterPullOutLetterType.SelectedIndex ==0)
            {
                gvPullOutLetter.DataBind();
                return;
            }
            else
            {
                STManager.FilterPOL(this.SqlDataSourcePullOutLetters, txtSearch.Text, rdioSearchType.SelectedValue, bool.Parse(rdioFilterPullOutLetterType.SelectedValue));
            }
        }
    }
}