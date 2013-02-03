using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.forms
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Last Updated: July 22, 2012 5:40
    /// Description: Brand Form
    /// </summary>
    public partial class FBrand : System.Web.UI.UserControl
    {
        public string BrandCode
        {
            get
            {
                return txtBrandCode.Text.ToUpper();
            }
            set
            {
                txtBrandCode.Text = value;
            }
        }

        public string BrandDescription
        {
            get
            {
                return txtBrandDescription.Text.ToUpper();
            }
            set
            {
                txtBrandDescription.Text = value;
            }
        }

        public string StartSeries
        {
            get
            {
                return txtStartSeries.Text;
            }
            set
            {
                txtStartSeries.Text = value;
            }
        }

        public long BrandId
        {
            get
            {
                return long.Parse(hfID.Value);
            }
            set
            {
                hfID.Value = (value).ToString();
            }
        } 

        public Brand Brand
        {
            get
            {
                return new Brand{
                    BrandCode = BrandCode,
                    BrandDescription = BrandDescription ,
                    DateCreated = DateTime.Now,
                    IsActive = "Yes",
                    StartSeries = StartSeries, 
                     RecordNo = BrandId
                };
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}