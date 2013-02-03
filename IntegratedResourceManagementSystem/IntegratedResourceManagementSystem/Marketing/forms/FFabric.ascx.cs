using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.forms
{
    public partial class FFabric : System.Web.UI.UserControl 
    {
        public string FabricCode { get { return txtFabricCode.Text.ToUpper(); } set { txtFabricCode.Text = value; } }
        public string FabricDescrition { get { return txtFabricDescription.Text.ToUpper(); } set { txtFabricDescription.Text = value; } }
        public char TopOrBottom { get { return char.Parse(rdioTopOrBottom.SelectedValue); } set { rdioTopOrBottom.SelectedValue = (value).ToString(); } }
        

        public Fabric Fabric
        {
            get
            {
                return new Fabric{
                    FabricCode = FabricCode,
                    RecordNo = FabricId,
                    FabricDescription = FabricDescrition ,
                    TopOrBottom = (TopOrBottom),
                    DateCreated = DateTime.Now ,
                    IsActive = "Yes"
                };
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public long FabricId { get { return long.Parse(hfID.Value); } set { hfID.Value = (value).ToString(); } }

        public void Clear()
        {
            this.FabricCode = string.Empty;
            this.FabricDescrition = string.Empty;
            this.FabricId = 0;
            this.rdioTopOrBottom.SelectedIndex = -1;
        }
    }
}