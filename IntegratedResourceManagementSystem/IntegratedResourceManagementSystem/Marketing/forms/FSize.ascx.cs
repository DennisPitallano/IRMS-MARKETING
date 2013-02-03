using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.forms
{
    public partial class FSize : System.Web.UI.UserControl
    {
        public string SizeCode { get { return txtSizeCode.Text.ToUpper(); } set { txtSizeCode.Text = value; } }
        public string SizeDescription { get { return txtSizeDescription.Text.ToUpper(); } set { txtSizeDescription.Text = value; } }

        public int SizeDisplayIndex { get { return int.Parse(hfDisplay.Value); } set { hfDisplay.Value = (value).ToString(); } }

        public long SizeGroup { get { return long.Parse(hfSizeGroup.Value); } set { hfSizeGroup.Value = (value).ToString(); } }

        public Size Size
        {
            get
            {
                return new Size{
                    SizeCode = SizeCode ,
                    RecordNo = SizeId,
                    DisplayIndex = SizeDisplayIndex,
                    SizeGroup = SizeGroup, 
                    SizeDescription = SizeDescription ,
                    DateCreated = DateTime.Now,
                     IsActive ="Yes"
                };
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public long SizeId { get { return int.Parse(hfID.Value); } set { hfID.Value = (value).ToString(); } }
    }
}