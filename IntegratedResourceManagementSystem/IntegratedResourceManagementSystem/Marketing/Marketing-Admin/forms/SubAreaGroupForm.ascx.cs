using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin.forms
{
    public partial class SubAreaGroupForm : System.Web.UI.UserControl
    {
        public int SubAreaGroupId
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

        public string SubAreaGroupName
        {
            get
            {
                return txtSubAreaGroupName.Text;
            }
            set
            {
                txtSubAreaGroupName.Text = value;
            }
        }

        public int AreaGroup {
            get
            {
                return int.Parse (DDLAreaGroup.SelectedValue);
            }
        }

        public string AreaGroupName
        {
            set
            {
                DDLAreaGroup.SelectedItem.Text = value;
            }
        }
        public SubGroupAreaClass SubAreaGroup
        {
            get
            {
                return new SubGroupAreaClass
                {
                   AreaGroupNo = AreaGroup,
                    GroupName = SubAreaGroupName,
                     SubAreaGroupNo = SubAreaGroupId
                };
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}