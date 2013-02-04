using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class markDownMemoPreview : System.Web.UI.Page
    {
        #region variables
        MarkDownMemoManager MDMemoManager = new MarkDownMemoManager();
        private int MemoKey
        {
            get { return int.Parse(Request.QueryString[0]); }

        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                InitializeMarkDownMemoData();
            }
        }
        private void InitializeMarkDownMemoData()
        {
          var MDMEMO=  MDMemoManager.GetMarkDownMemo(MemoKey);
          this.txtHeader.Text =HttpUtility.HtmlDecode(MDMEMO.Header);
          this.txtMemoNumber.Text ="MEMO #: "+ MDMEMO.MemoNumber;
          lblIntro.Text = MDMEMO.Intro;
          //txtMessage.Text = 
        }
    }
}