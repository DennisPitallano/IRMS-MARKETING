using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.Entities;

namespace IntegratedResourceManagementSystem.Marketing.Marketing_Admin.forms
{
    public partial class DepartmentForm : System.Web.UI.UserControl
    {
        public int DeptID { 
            get{

                return int.Parse(hfID.Value);
            }
            set {
                hfID.Value = (value).ToString();
            }
        }
        public string DepartmentName
        {
            get
            {
                return txtDepartmentName.Text.ToUpper();
            }
            set
            {
                txtDepartmentName.Text = value;
            }

        }

        public Department Department
        {
            get
            {
                return new Department
                {
                    DepartmentName = DepartmentName,
                     Id = DeptID                    
                };
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}