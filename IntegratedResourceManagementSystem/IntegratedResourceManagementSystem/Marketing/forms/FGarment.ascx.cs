using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.forms
{
    public partial class FGarment : System.Web.UI.UserControl
    {
        public string GarmentCode { get { return txtGarmentCode.Text; } set { txtGarmentCode.Text = value; } }
        public string GarmentDescription { get { return txtGarmentDescription.Text; } set { txtGarmentDescription.Text = value; } }
        public string TopOrBottom { get { return rdioTopOrBottom.SelectedValue; } set { rdioTopOrBottom.SelectedValue = value; } }

        public Garment Garment
        {
            get
            {
                return new Garment{
                    GarmentCode = GarmentCode ,
                    GarmentDescription = GarmentDescription ,
                    TopOrBottom = char.Parse(TopOrBottom),
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