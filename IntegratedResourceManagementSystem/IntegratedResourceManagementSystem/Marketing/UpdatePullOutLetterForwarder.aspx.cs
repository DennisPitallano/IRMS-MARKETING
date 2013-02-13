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
    public partial class UpdatePullOutLetterForwarder : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        ForwarderManager ForwarderManager = new ForwarderManager();
        #endregion
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Page_Init(object sender, EventArgs e)
        {
            InitializedForwarders();
            PullOutLetter POL = POLManager.FetchById(int.Parse(Request.QueryString["PullOutId"]));
            lblPullOutSeriesNumber.Text = POL.SeriesNumber;
            lblCustomer.Text = POL.CompanyName;
            if (POL.Forwarders !="Not Assigned")
            {
                ddlForwarders.SelectedValue = POL.Forwarders;
            }

            switch (Request["mode"])
            {
                case "smdetails":
                    hpLinkBack.NavigateUrl = "~/Marketing/SMPullOutLetterUpdate.aspx?PullOutId=" + POL.RecordNumber + "&PullOutCode="
              + POL.PullOutCode + "&PullOutSeries=" + POL.SeriesNumber;
                    break;
                case "notsmdetails":
                    hpLinkBack.NavigateUrl = "~/Marketing/PullOutLetterUpdate.aspx?PullOutId=" + POL.RecordNumber + "&PullOutCode="
                 + POL.PullOutCode + "&PullOutSeries=" + POL.SeriesNumber;
                    break;
                case "summary":
                    hpLinkBack.NavigateUrl = "~/Marketing/PullOutLetterSummaryUpdate.aspx?PullOutId=" + POL.RecordNumber + "&PullOutCode="
               + POL.PullOutCode + "&PullOutSeries=" + POL.SeriesNumber;
                    break;
                case "default":
                    hpLinkBack.NavigateUrl = "~/Marketing/PullOutLetterUpdateDefault.aspx?PullOutId=" + POL.RecordNumber + "&PullOutCode="
                 + POL.PullOutCode + "&PullOutSeries=" + POL.SeriesNumber;
                    break;
                default:
                    break;
            }
        }

        public void InitializedForwarders()
        {
            ddlForwarders.Items.Clear();
            foreach (var forwarder in ForwarderManager.Forwarders())
            {
                ddlForwarders.Items.Add(new ListItem(forwarder.ForwarderName, forwarder.ForwarderName));
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            PullOutLetter POL = POLManager.FetchById(int.Parse(Request.QueryString["PullOutId"]));
            POL.Forwarders = ddlForwarders.SelectedValue;
            POLManager.Save(POL);
            hfSuccessfulModalHandler_ModalPopupExtender.Show();
        }
       
    }
}