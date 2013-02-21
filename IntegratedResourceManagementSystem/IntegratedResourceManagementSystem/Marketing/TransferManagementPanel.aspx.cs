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
    public partial class TransferManagementPanel : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager();
        PullOutLetterSummaryManager POLSummaryManager = new PullOutLetterSummaryManager();
        StockTransferManager STManager = new StockTransferManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
        }
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
            if (POLDetails.Count > 0)
            {
                this.hpLinkUseSelectedPullOutLetter.NavigateUrl = "~/Marketing/NewTransferDetails.aspx?PullOutId=" + pullOutId + "&PullOutCode="
                  + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
            }
            else
            {
                if (POLSummaries.Count > 0)
                {
                    this.hpLinkUseSelectedPullOutLetter.NavigateUrl = "~/Marketing/NewTransferSummary.aspx?PullOutId=" + pullOutId + "&PullOutCode="
                 + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
                }
                else
                {
                    this.hpLinkUseSelectedPullOutLetter.NavigateUrl = "~/Marketing/NewTransferDefault.aspx?PullOutId=" + pullOutId + "&PullOutCode="
                 + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
                }
            }
            this.hpLinkViewDetails.NavigateUrl = "~/Reports/ReportForms/PullOutLetterPrintPreview.aspx?PullOutId=" + pullOutId + "&PullOutCode="
            + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
            btnBrowsePullOutLetter_ModalPopupExtender.Show();
        }

        protected void rdioFilterPullOutLetterType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdioFilterPullOutLetterType.SelectedIndex == 0)
            {
                gvPullOutLetter.DataBind();
                btnBrowsePullOutLetter_ModalPopupExtender.Show();
                return;
            }
            else
            {
                SearchPOL();
            }

        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            SearchPOL();
        }

        private void SearchPOL()
        {
            STManager.FilterPOL(this.SqlDataSourcePullOutLetters, txtSearch.Text, rdioSearchType.SelectedValue, rdioFilterPullOutLetterType.SelectedValue);
            btnBrowsePullOutLetter_ModalPopupExtender.Show();
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            SearchPOL();
        }

        protected void gvPullOutLetter_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            SearchPOL();
        }


        protected void gvPullOutLetter_Sorting(object sender, GridViewSortEventArgs e)
        {
         
            SearchPOL();
        }

        protected void gvStockTransfer_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
        }
    }
}