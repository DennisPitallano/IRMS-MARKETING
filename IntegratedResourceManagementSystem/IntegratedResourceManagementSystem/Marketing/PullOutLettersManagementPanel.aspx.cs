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
    public partial class PullOutLettersManagementPanel : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager();
        PullOutLetterSummaryManager POLSummaryManager = new PullOutLetterSummaryManager();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvPullOutLetters_SelectedIndexChanged(object sender, EventArgs e)
        {
            string pullOutCode = gvPullOutLetters.SelectedDataKey[1].ToString();
            int pullOutId = int.Parse(gvPullOutLetters.SelectedValue.ToString());
            string pullOutSeriesNumber = gvPullOutLetters.SelectedDataKey[3].ToString();
            List<PullOutLetterDetail> POLDetails = POLDetailManager.PullOutLetterDetailsByPullOutCode(pullOutCode);
            List<PullOutLetterSummary> POLSummaries = POLSummaryManager.PullOutLetterSummariesByPullOutCode(pullOutCode);
            if (POLDetails.Count > 0)
            {
                this.hpLinkUpdate.NavigateUrl = "~/Marketing/PullOutLetterUpdate.aspx?PullOutId=" + pullOutId + "&PullOutCode="
                  + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
            }
            else
            {
                if (POLSummaries.Count > 0)
                {
                    this.hpLinkUpdate.NavigateUrl = "~/Marketing/PullOutLetterSummaryUpdate.aspx?PullOutId=" + pullOutId + "&PullOutCode="
                 + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
                }
                else
                {
                    this.hpLinkUpdate.NavigateUrl = "~/Marketing/PullOutLetterUpdateDefault.aspx?PullOutId=" + pullOutId + "&PullOutCode="
                 + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
                }
            }
               hpLinkPrint.NavigateUrl = "~/Reports/ReportForms/PullOutLetterPrintPreview.aspx?PullOutId=" + pullOutId + "&PullOutCode="
               + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
               lblPOLToDelete.Text = "Are you sure you want to delete this <br /> POL: "+gvPullOutLetters.SelectedDataKey[3].ToString()+"?";
        }
    }
}