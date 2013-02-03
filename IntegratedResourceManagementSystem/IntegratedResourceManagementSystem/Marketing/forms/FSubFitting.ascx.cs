using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing.forms
{
    public partial class FSubFitting : System.Web.UI.UserControl
    {
        FittingManager FittingManager = new FittingManager();

        public string FittingCode { get { return DDLFittings.SelectedValue; } set { DDLFittings.SelectedValue = value; } }

        public long RecordNumber { get { return long.Parse(hfID.Value); } set { hfID.Value = (value).ToString(); } }

        public string SubFittingDescription { get { return txtSubFitting.Text; } set { txtSubFitting.Text = value; } }

        public SubFitting SubFitting
        {
            get
            {
                return new SubFitting
                {
                     DateRecorded = DateTime.UtcNow
                     , FittingCode =FittingCode,
                      RecordNumber = RecordNumber,
                       SubFittingDesc = SubFittingDescription
                };
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            InitializeFiitingList();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void InitializeFiitingList()
        {
            DDLFittings.Items.Clear();
            foreach (Fitting fitting in FittingManager.Fittings())
            {
                DDLFittings.Items.Add(new ListItem(fitting.FittingName, fitting.FiitingCode));
            }
        }
    }
}