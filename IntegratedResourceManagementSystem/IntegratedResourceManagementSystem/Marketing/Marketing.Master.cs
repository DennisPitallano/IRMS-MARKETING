using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using IRMS.Components;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class Marketing : System.Web.UI.MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
           

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void lnkbtnLogin_Click(object sender, EventArgs e)
        {
            //if (lnkbtnLogin.Text == "Log Out")
            //{
            //    Session.Abandon();
            //    lblUser.Text = "NONE";
            //    lnkbtnLogin.Text = "Log In";
            //    Response.Redirect("~/Marketing/Login.aspx");
            //}
        }
    }
}