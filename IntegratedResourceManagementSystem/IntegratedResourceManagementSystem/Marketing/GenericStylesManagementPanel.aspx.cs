using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IntegratedResourceManagementSystem.Common;
using IRMS.Components;
using IRMS.ObjectModel;
using System.Text;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class GenericStylesManagementPanel : System.Web.UI.Page
    {
        #region variables
        GenericStyleManager GenStyleManager = new GenericStyleManager();

        #endregion
        #region Page_init
        protected void Page_Init(object sender, EventArgs e)
        {
            #region check roles
            Permission.PERMITTED_USER = (UsersClass)Session["USER_ACCOUNT"];
           

            Permission.ROLES = (List<UserRole>)Session["USER_ROLES"];
            StringBuilder strPermissionNotification = new StringBuilder();
            strPermissionNotification.Append("Your Account do not have: <br />");
            if (Permission.CanInsert() == false)
            {
                pnlNotification.Visible = true;
                strPermissionNotification.Append(" - Permission to Insert/Add Generic Style.<br />");
            }

            if (Permission.CanUpdate() == false)
            {
                this.btnUpdate.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Update/Edit Generic Style.<br />");
            }

            if (Permission.CanDelete() == false)
            {
                btnDelete.Enabled = false;
                pnlNotification.Visible = true;
                strPermissionNotification.AppendLine(" - Permission to Delete Generic Style.<br />");
            }
            lblPermissionNotifications.Text = strPermissionNotification.ToString();
            #endregion
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDeleteYes_Click(object sender, EventArgs e)
        {
            GenStyleManager.UpdateStyleActiveStatus(false, gvGenericStyleList.SelectedValue.ToString());
            gvGenericStyleList.DataBind();
        }

        protected void gvGenericStyleList_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSelectedValue.Text = gvGenericStyleList.SelectedValue.ToString();
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            GenStyleManager.SearchGenericStyles(SqlDataSourceGenericStyles, txtSearch.Text);
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            GenStyleManager.SearchGenericStyles(SqlDataSourceGenericStyles, txtSearch.Text);
        }
    }
}