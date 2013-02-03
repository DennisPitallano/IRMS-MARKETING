using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;
using IRMS.BusinessLogic.Manager;
using IntegratedResourceManagementSystem.Common;
using IRMS.Components;
using System.Text;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin
{
    public partial class SendMessage : System.Web.UI.Page
    {
        #region variables
        Message MSG = new Message();
        MessageManager MSGManager = new MessageManager();
        UserManager UserManager = new UserManager();
       
        #endregion
        public void Page_Init(object sender, EventArgs e)
        {
            #region check roles
            Permission.PERMITTED_USER = (UsersClass)Session["USER_ACCOUNT"];
            if (!Permission.IsAdmin())
            {
                Redirector.Redirect("~/Marketing/Stylepanel.aspx");
            }

            #endregion
            UsersClass user_account = UserManager.GetUserAccountByKey(long.Parse(Request.QueryString["UserId"]));
            if (string.IsNullOrEmpty(user_account.FullName))
            {
                txtTo.Text = user_account.Username;
            }
            else
            {
                txtTo.Text = user_account.FullName;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            long ToUser = long.Parse(Request.QueryString["UserID"]);
            long FromUser = Permission.PERMITTED_USER.ID;
            MSG = new Message
            {
                DateSent = DateTime.UtcNow,
                FromUserId = FromUser ,
                Status = "UNREAD",
                MessageContent = messageEditor.Content,
                Subject = txtSubject .Text,
                ToUserId = ToUser
            };
            MSGManager.Save(MSG);
            hfMessageSent_ModalPopupExtender.Show();
        }

       
    }
}