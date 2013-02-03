using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.Entities;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin.forms
{
    public partial class PriceTypeForm : System.Web.UI.UserControl
    {

        public int PriceTypeId { get { return int.Parse(hfID.Value); } set { hfID.Value = (value).ToString(); } }

        public string PriceTypeDescription { get { return txtPriceTypeDescription.Text; } set { txtPriceTypeDescription.Text = value; } }

        public PriceType PriceType
        {
            get
            {
                return new PriceType
                {
                      PriceTypeDescription= PriceTypeDescription ,
                       PriceTypeId = PriceTypeId
                };
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}