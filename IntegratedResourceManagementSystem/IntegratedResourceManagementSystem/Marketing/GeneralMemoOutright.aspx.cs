using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class GeneralMemoOutright : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvGeneralMemo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (HttpUtility.HtmlEncode(gvGeneralMemo.SelectedRow.Cells[9].Text)!="Approved"){
                btnApprove.CssClass = "btnApprove";
                btnUnApprove.CssClass = "btnDisableUnApproved";
                btnApprove.Enabled = true;
                btnUnApprove.Enabled = false;
            } else{
                btnApprove.CssClass = "btnDisableApproved";
                btnUnApprove.CssClass = "btnUnApprove";
                btnApprove.Enabled = false;
                btnUnApprove.Enabled = true;
            }
        }
    }
}