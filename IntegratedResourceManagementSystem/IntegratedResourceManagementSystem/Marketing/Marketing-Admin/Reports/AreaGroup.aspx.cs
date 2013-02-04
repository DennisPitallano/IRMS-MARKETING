using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin.Reports
{
    public partial class AreaGroup : System.Web.UI.Page
    {
        GroupAreaManager AreaGroupManager = new GroupAreaManager();

         protected void Page_Init(object sender, EventArgs e)
        {
            gvAreaGroups.DataSource = AreaGroupManager.AreaGroups();
            gvAreaGroups.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}