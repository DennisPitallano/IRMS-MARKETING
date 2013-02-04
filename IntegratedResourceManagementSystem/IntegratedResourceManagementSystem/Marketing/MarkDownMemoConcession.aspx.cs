using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class MarkDownMemoConcession : System.Web.UI.Page
    {
        #region variables
        private int MemoKey
        {
            get
            {
                return int.Parse(gvMarkDownMemos.SelectedDataKey.Value.ToString());
            }
        }

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvMarkDownMemos_SelectedIndexChanged(object sender, EventArgs e)
        {
            hpLinkPrintDraft.NavigateUrl = "~/Reports/ReportForms/markDownMemoPreview.aspx?ID=" + MemoKey.ToString();
        }

    }
}