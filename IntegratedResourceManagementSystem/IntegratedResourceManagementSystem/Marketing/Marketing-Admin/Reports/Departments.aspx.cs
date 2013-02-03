using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin.Reports
{
    public partial class Departments : System.Web.UI.Page
    {
        DepartmentManager DM = new DepartmentManager();

        protected void Page_Init(object sender, EventArgs e)
        {
            gvDepartments.DataSource = DM.Departments();
            gvDepartments.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}