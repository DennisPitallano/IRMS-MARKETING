using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin.Reports
{
    public partial class PriceGroup : System.Web.UI.Page
    {
        PriceGroupManager PGM = new PriceGroupManager();

        protected void Page_Init(object sender, EventArgs e)
        {
            gvPriceGroups.DataSource = PGM.PriceGroups();
            gvPriceGroups.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}