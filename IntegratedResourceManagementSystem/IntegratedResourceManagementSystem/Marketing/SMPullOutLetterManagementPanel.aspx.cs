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
    public partial class SMPullOutLetterManagementPanel : System.Web.UI.Page
    {
        #region  variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvPullOutLetters_SelectedIndexChanged(object sender, EventArgs e)
        {
            string pullOutCode = gvPullOutLetters.SelectedDataKey[1].ToString();
            string pullOutId = gvPullOutLetters.SelectedValue.ToString();
            string pullOutSeriesNumber = gvPullOutLetters.SelectedDataKey[3].ToString();
            hpLinkPullOutLetterDetails.NavigateUrl = "~/Marketing/SMPullOutLetterDetailsPreview.aspx?PullOutCode="+pullOutCode;
            hpLinkPrint.NavigateUrl = "~/Reports/ReportForms/PullOutLetterPrintPreview.aspx?PullOutId=" + pullOutId + "&PullOutCode="
                + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
            this.hpLinkUpdate.NavigateUrl = "~/Marketing/SMPullOutLetterUpdate.aspx?PullOutId=" + pullOutId + "&PullOutCode="
               + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
            lblPOLToDelete.Text = "Are you sure you want to delete <br /> Pull Out Letter : "+ pullOutSeriesNumber+"?";
            hfSelectedItem.Value = gvPullOutLetters.SelectedValue.ToString();
            btnDelete.Enabled = true;
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            PullOutLetter polToDelete = new PullOutLetter
            {
                 RecordNumber = int.Parse(hfSelectedItem.Value)
            };
            POLManager.Delete(polToDelete);
            gvPullOutLetters.DataBind();
            //#FAFAFA
        }

    }
}