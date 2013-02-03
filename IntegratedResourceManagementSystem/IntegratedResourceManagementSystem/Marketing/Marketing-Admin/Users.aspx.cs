using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class Users : System.Web.UI.Page
    {
        #region variables
        UserManager userManager = new UserManager();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            userManager.SearchOnlineUserAccounts(SqlDataSourceUsersAccount,this.txtSearch.Text);
        }
    }
}