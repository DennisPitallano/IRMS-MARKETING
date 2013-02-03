using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class UserLogsPreview : System.Web.UI.Page
    {
        #region variables
        UserManager UserManager = new UserManager();
        UsersClass USER_ACCOUNT {get{ return UserManager.GetUserAccountByKey(long.Parse(Request.QueryString["UserId"]));}}
        DepartmentManager DepartmentManager = new DepartmentManager();
        UserLevelManager UserLevelManager = new UserLevelManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            hfUserName.Value = USER_ACCOUNT.Username;
            imgUser.ImageUrl = @"user-images/" + USER_ACCOUNT.Avatar;
            lblName.Text = USER_ACCOUNT.FullName;
            lblContactNumber.Text = USER_ACCOUNT.ContactNumber;
            lblDepartment.Text = DepartmentManager.GetDepartmentByKey(USER_ACCOUNT.DeptID).DepartmentName;
            lblEmailAddress.Text = USER_ACCOUNT.Email;
            lblUserLevel.Text = UserLevelManager.GetUserLevelByKey(USER_ACCOUNT.UserLevelID).UserLevelDescription;
            lblUserName.Text = USER_ACCOUNT.Username;
            if (USER_ACCOUNT.IsActive == true)
            {
                imgActiveStatus.ImageUrl = @"user-images/contact_followed.png";
                lblUserStatus.Text = "ACTIVE USER";
            }
            else
            {
                imgActiveStatus.ImageUrl = @"user-images/contact_ignored.png";
                lblUserStatus.Text = "INACTIVE USER";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DDLDisPlaySize_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (DDLDisPlaySize.SelectedValue)
            {
                case "DEFAULT":
                    gvActivityLogs.PageSize = 25;
                    break;
                case "50":
                    gvActivityLogs.PageSize = 50;
                    break;
                case "100":
                    gvActivityLogs.PageSize = 100;
                    break;
                case "250":
                    gvActivityLogs.PageSize = 250;
                    break;
                case "500":
                    gvActivityLogs.PageSize = 500;
                    break;
                case "1000":
                    gvActivityLogs.PageSize = 1000;
                    break;
                case "ALL":
                    gvActivityLogs.PageSize = 1000000;
                    break;
            }
        }
    }
}