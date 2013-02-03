using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin.forms
{
    public partial class PriceGroupForm : System.Web.UI.UserControl
    {

        public int PriceGroupId { get { return int.Parse(hfID.Value); } set { hfID.Value = (value).ToString(); } }

        public string PriceGroupName { get { return txtPriceGroupName.Text; } set { txtPriceGroupName.Text = value; } }

        public string PriceField { get { return txtGroupField.Text; } set { txtGroupField.Text = value; } }

        public int PriceId { get { return int.Parse(txtPriceId.Text); } set { txtPriceId.Text = (value).ToString(); } }

        public bool IsConcession { get { return chkIsConcession.Checked; } set { chkIsConcession.Checked = value; } }

        public bool IsOutRight { get { return chkIsOutRight.Checked; } set { chkIsOutRight.Checked = value; } }

        public float Discount { get { return float.Parse(hfDiscount.Value); } set { hfDiscount.Value = (value).ToString(); } }

        public PriceGroup PriceGroup
        {
            get
            {
                return new PriceGroup
                {
                     Concession = IsConcession ,
                      
                     Discount = Discount ,
                     GroupField = PriceField ,
                     GroupName = PriceGroupName ,
                     Outright = IsOutRight ,
                     PGNo = PriceGroupId ,
                     PriceID = PriceId 
                };
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}