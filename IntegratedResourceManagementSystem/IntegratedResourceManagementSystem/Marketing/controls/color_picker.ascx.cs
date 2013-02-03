using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.controls
{
    public partial class color_picker : System.Web.UI.UserControl
    {
        public string COLOR_DESCRIPTION { get; set; }
        public string COLOR_CODE { get; set; }

        public Color Color
        {
            get
            {
                return new Color{
                    ColorCode = COLOR_CODE,
                    ColorDescription = COLOR_DESCRIPTION,
                    IsActive = "Yes",
                    DateCreated = DateTime.Now
                };
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
   
    }
}