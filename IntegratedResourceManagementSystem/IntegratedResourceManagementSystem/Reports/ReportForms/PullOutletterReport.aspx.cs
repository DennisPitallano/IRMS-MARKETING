using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class PullOutletterReport : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Page_Init(object sender, EventArgs e)
        {
            LoadPullOutLetterReport(Request.QueryString["Brand"], Request.QueryString["Status"]);
        }

        private void LoadPullOutLetterReport(string Brand, string Status)
        {
            var pullOutLetters = POLManager.FetchAll().Where(pol => pol.BrandName == Brand & pol.LetterStatus == Status);
            gvPullOutLetters.DataSource = pullOutLetters;
            gvPullOutLetters.DataBind();
        }
    }
}