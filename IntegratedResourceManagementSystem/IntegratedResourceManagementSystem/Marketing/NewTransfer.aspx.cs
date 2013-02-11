﻿using System;
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
               btnBrowsePullOutLetter_ModalPopupExtender.Show();
        }

        protected void rdioFilterPullOutLetterType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdioFilterPullOutLetterType.SelectedIndex ==0)
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
    }
}