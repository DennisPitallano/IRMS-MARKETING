using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing.forms
{
    public partial class FFitting : System.Web.UI.UserControl
    {
        #region variables
        BrandManager BM = new BrandManager();
        #endregion
        protected void Page_Init(object sender, EventArgs e)
        {
            InitializeBrands();
        }
        private void InitializeBrands()
        {
            DDLBrands.Items.Clear();
            foreach (Brand brand in BM.Brands())
            {
                DDLBrands.Items.Add(new ListItem(brand.BrandDescription, brand.BrandDescription));
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string FittingCode { get { return hfFiitingCode.Value; } set { hfFiitingCode.Value = value; } }

        public string FittingName { get { return txtFitting.Text; } set { txtFitting.Text = value; } }

        public string Category { get { return rdioCategory.SelectedValue; } set { rdioCategory.SelectedValue = value; } }

        public long RecordNo { get { return long.Parse(hfID.Value); } set { hfID.Value = value.ToString(); } }

        public string BrandName { get { return DDLBrands.SelectedValue; } set { DDLBrands.SelectedValue = value; } }

        public string FittingSeriesCode { get { return txtCode.Text; } set { txtCode.Text = value; } }

        public Fitting FITTING
        {
            get
            {
                return new Fitting
                {
                    Category = Category,
                    DateRecorded = DateTime.UtcNow ,
                    FiitingCode = FittingCode,
                    FittingName = FittingName,
                    RecordNumber = RecordNo,
                    BrandName = BrandName,
                     FittingSeriesCode = FittingSeriesCode
                };
            }
        }
    }
}