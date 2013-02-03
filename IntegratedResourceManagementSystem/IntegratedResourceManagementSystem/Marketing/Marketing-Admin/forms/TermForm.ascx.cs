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
    public partial class TermForm : System.Web.UI.UserControl
    {
        public int TermId
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

        public string TermName
        {
            get
            {
                return txtTermName.Text;
            }
            set
            {
                txtTermName.Text = value;
            }
        }
        public Term Term
        {
            get
            {
                return new Term
                {
                     TermId = TermId,
                      TermName = TermName 
                };
            }
        }

        public string ActionMode
        {
            get
            {
                return hfMActionMode.Value;
            }
            set
            {
                hfMActionMode.Value = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}