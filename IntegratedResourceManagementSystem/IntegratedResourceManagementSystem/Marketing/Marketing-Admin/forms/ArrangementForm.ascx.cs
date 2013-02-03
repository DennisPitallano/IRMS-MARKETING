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
    /// July 19, 2012 11:55 AM
    /// </summary>
    public partial class ArrangementForm : System.Web.UI.UserControl
    {
        public int ArrangementTypeId
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

        public string ArrangementTypeDescription
        {
            get
            {
                return txtArrangementDescription.Text;
            }
            set
            {
                txtArrangementDescription.Text = value;
            }
        }

        public ArrangementType ArrangementType {
            get
            {
                return new ArrangementType
                {
                    ArrangementDescription = ArrangementTypeDescription ,
                     ArrangementId = ArrangementTypeId
                };
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}