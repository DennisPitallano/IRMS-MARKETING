using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;
using System.Text;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class NewFitting : System.Web.UI.Page
    {
        List<SubFitting> SubFittings = new List<SubFitting>();
        FittingManager FittingManager = new FittingManager();
        SubFittingManager SubFittingManager = new SubFittingManager();
        private static Random random = new Random();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Session["SUB_FITTING"] = SubFittings;
                hfCODE.Value = CreateCode(15);
            }
        }

        protected void btnAddSubFitting_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSubFitting.Text))
            {
                return;
            }
            SubFittings = (List<SubFitting>)Session["SUB_FITTING"];

            SubFittings.Add(new SubFitting
            {
               SubFittingDesc=txtSubFitting.Text,
               FittingCode = hfCODE.Value,
               DateRecorded =DateTime.UtcNow
            });
            gvSubFittings.DataSource = SubFittings;
            gvSubFittings.DataBind();
        }
        private static string CreateCode(int size)
        {
            var pass = new StringBuilder();
            for (var i = 0; i < size; i++)
            {
                var binary = random.Next(0, 2);
                switch (binary)
                {
                    case 0:
                        var ch = (Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65))));
                        pass.Append(ch);
                        break;
                    case 1:
                        var num = random.Next(1, 10);
                        pass.Append(num);
                        break;
                }
            }
            return pass.ToString();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SubFittings = (List<SubFitting>)Session["SUB_FITTING"];

            SubFittings.RemoveAt(gvSubFittings.SelectedIndex);
            gvSubFittings.DataSource = SubFittings;
            gvSubFittings.DataBind();
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            fFitting.FittingCode = hfCODE.Value;
            FittingManager.Save(fFitting.FITTING);
            SubFittings = (List<SubFitting>)Session["SUB_FITTING"];
            SubFittingManager.Save(SubFittings);
            Response.Redirect("~/Marketing/FittingsManagementPanel.aspx");
        }
       
    }
}