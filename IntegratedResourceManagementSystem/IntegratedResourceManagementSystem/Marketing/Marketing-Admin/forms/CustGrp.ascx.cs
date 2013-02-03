using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.Entities;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin.forms
{
    public partial class CustGrp : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public int Cust_ID
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
        public string Code
        {
            get
            {
                return txtCodeNo.Text.ToUpper();
            }
            set
            {
                txtCodeNo.Text = value;
            }

        }
        public string Description
        {
            get
            {

                return txtDesc.Text.ToUpper();
            }
            set
            {
                txtDesc.Text = value;
            }
        }
        public string BrandName
        {
            get
            {
                return ddbrand.Text;
               
            }
            set
            {
                ddbrand.Text = value;
            }
        }
        public string Customer
        {
            get
            {
                return txtCustomer.Text.ToUpper();
                
            }
            set
            {
                txtCustomer.Text = value;
            }
        }
        public string SapGroup
        {
            get
            {

                return txtSapGroup.Text.ToUpper();

            }
            set
            {
                txtSapGroup.Text = value;
            }
        }
        public CustomerGroup CustomerGroup
        {
            get
            {
                return new CustomerGroup
                {
                    id = Cust_ID,
                   Code = Code, 
                    Customer = Customer,
                    BrandName = BrandName,
                    ListDesc = Description,
                    SAPGroup = SapGroup
                };
            }
        }


    }
}