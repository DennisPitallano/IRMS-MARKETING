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
    /// July 19, 2012 1:39 PM
    /// </summary>
    public partial class FormulaForm : System.Web.UI.UserControl
    {

        public int FormulaId
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


        public string FormulaDescription
        {
            get
            {
                return txtFormulaDescription.Text;
            }
            set
            {
                txtFormulaDescription.Text = value;
            }
        }


        public Formula Formula
        {
            get
            {
                return new Formula
                {
                     FormulaDescription = FormulaDescription,
                      FormulaId = FormulaId
                };
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}