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
    /// July 19, 2012 12:34 PM
    /// </summary>
    public partial class CompanyForm : System.Web.UI.UserControl
    {
        public string CompanyLogo
        {
            get
            {
                return hfLogo.Value;
            }
            set
            {
                hfLogo.Value = (value);
            }
        }
        public int CompanyId
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

        public string CompanyName
        {
            get
            {
                return txtCompanyName.Text;
            }
            set
            {
                txtCompanyName.Text = value;
            }
        }

        public Company Company
        {
            get
            {
                return new Company
                {
                 CompanyId = CompanyId,
                  CompanyName = CompanyName,
                  CompanyLogo= CompanyLogo
                };
            }
           
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}