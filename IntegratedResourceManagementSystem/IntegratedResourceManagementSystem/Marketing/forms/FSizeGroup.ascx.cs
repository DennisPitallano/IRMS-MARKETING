using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.forms
{
    public partial class FSizeGroup : System.Web.UI.UserControl
    {
        public string SizeGroupName { get { return txtSizeGroupName.Text; } set { txtSizeGroupName.Text = value; } }

        public SizeGroup SizeGroup
        {
            get
            {
                return new SizeGroup
                {
                     SizeGroupName = SizeGroupName.ToUpper (),
                };
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}