using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IRMS.Components;
namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class ViewMessage : System.Web.UI.Page
    {
        MessageManager MSGManager = new MessageManager();
        UserManager UserManager = new UserManager();
        List<Message> Messages = new List<Message>();
        Message message;

        protected void Page_Init(object sendeer, EventArgs e)
        {


        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                try
                {
                    UsersClass userAccount = (UsersClass)Session["USER_ACCOUNT"];
                    Messages = MSGManager.GetMessagesToday(DateTime.Today, userAccount.ID);
                    if (Messages.Count > 1)
                    {
                        foreach (Message msg in Messages)
                        {
                            string from = "FROM: " + UserManager.GetUserAccountByKey(msg.FromUserId).Username + "<br />" + msg.MessageContent;
                            msg.MessageContent = from;
                        }
                        this.gvMessages.DataSource = Messages;
                        gvMessages.DataBind();
                    }
                    else
                    {
                        message = Messages.FirstOrDefault();
                   //     lblFrom.Text = UserManager.GetUserAccountByKey(message.FromUserId).Username;
                //        string from = lblFrom.Text + "<br />" + message.MessageContent;
                 //       message.MessageContent = from;
                     //   LiteralControl objPanelText = pnlMessageContent.Controls[0] as LiteralControl;
                    //    objPanelText.Text = message.MessageContent;
                     //   message.Status = "READ";
                     //   MSGManager.Save(message);
                    }
                }
                catch (Exception)
                {
                    Redirector.Redirect("~/Marketing/DashBoardPanel.aspx");
                }
            }
        }

        protected void gvMessages_SelectedIndexChanged(object sender, EventArgs e)
        {
            //UsersClass userAccount = (UsersClass)Session["USER_ACCOUNT"];
            //Messages = MSGManager.GetMessagesToday(DateTime.Today, userAccount.ID);
            //lblFrom.Text = UserManager.GetUserAccountByKey(message.FromUserId).Username;
            //message = MSGManager.GetMessage(long.Parse(gvMessages.SelectedValue.ToString()), Messages);
            //string from = lblFrom.Text + "<br />" + message.MessageContent;
            //message.MessageContent = from;
            //LiteralControl objPanelText = pnlMessageContent.Controls[0] as LiteralControl;
            //objPanelText.Text = message.MessageContent;
            //message.Status = "READ";
            //MSGManager.Save(message);
            //gvMessages.DataBind();
        }

        protected void btnOMessageOK_Click(object sender, EventArgs e)
        {
            UsersClass userAccount = (UsersClass)Session["USER_ACCOUNT"];
            Message message = new Message();
            List<Message> Messages = MSGManager.GetMessagesToday(DateTime.Today, userAccount.ID);
            message = Messages.FirstOrDefault();
            message.Status = "READ";
            MSGManager.Save(message);
        }
    }
}