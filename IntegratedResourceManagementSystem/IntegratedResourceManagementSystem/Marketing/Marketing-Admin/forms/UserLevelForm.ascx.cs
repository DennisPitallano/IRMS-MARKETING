using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.Entities;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin.forms
{
    /// <summary>
    /// Dennis Pitallano 
    /// July 19, 2012 1:38 PM
    /// </summary>
    public partial class UserLevelForm : System.Web.UI.UserControl
    {

        public int UserLevelId
        {
            get
            {
                return int.Parse(hfID.Value);
            }
            set
            {
                hfID.Value = (value).ToString();
            }
        }

        public string  UserLevelDescription 
        { 
            
            get
            {
                return txtUserlevelDescription.Text;
            }            
            set
            {
                txtUserlevelDescription.Text = value;
            }
        }

        public UserLevel UserLevel
        {
            get
            {
                return new UserLevel
                {
                     UserLevelDescription = UserLevelDescription,
                      UserLevelId = UserLevelId
                };
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}