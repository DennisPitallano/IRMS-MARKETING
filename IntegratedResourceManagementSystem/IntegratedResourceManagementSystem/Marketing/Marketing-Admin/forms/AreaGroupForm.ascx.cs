using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin.forms
{
    public partial class AreaGroupForm : System.Web.UI.UserControl
    {

        public int AreaGroupId { get { return int.Parse(hfID.Value); } set { hfID.Value = (value).ToString(); } }

        public string AreaGroupName { get { return txtAreaGroupName.Text; } set { txtAreaGroupName.Text = value; } }

        public GroupAreaClass AreaGroup
        {
            get
            {
                return new GroupAreaClass
                {
                     AreaGroupNo = AreaGroupId ,
                      GroupName = AreaGroupName 
                };
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}