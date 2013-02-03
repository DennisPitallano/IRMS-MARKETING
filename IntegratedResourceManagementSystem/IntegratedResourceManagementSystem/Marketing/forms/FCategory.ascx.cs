using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.forms
{
    public partial class FCategory : System.Web.UI.UserControl
    {
        public string CategoryDesription
        {
            get
            {
                return txtCategoryDescription.Text.ToUpper();
            }
            set
            {
                txtCategoryDescription.Text = value;
            }
        }

        public string CategoryCode
        {
            get
            {
                return txtCategoryCode.Text.ToUpper();
            }
            set
            {
                txtCategoryCode.Text = value;
            }
        }

        public Category Category
        {
            get
            {
                return new Category{
                    CategoryCode = CategoryCode,
                    CategoryDescription = CategoryDesription,
                    IsActive = "Yes",
                    DateCreated = DateTime.UtcNow,
                     RecordNo = CategoryId
                };
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public long CategoryId { get { return long.Parse(hfID.Value); } set { hfID.Value = (value).ToString(); } }
    }
}