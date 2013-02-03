using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using System.Data;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class PriceChecking : System.Web.UI.Page
    {
        #region variables
        CustomerInfoManager CustInfoManager = new CustomerInfoManager();
        PriceGroupManager PriceManager = new PriceGroupManager();
        GroupAreaManager GAreamanager = new GroupAreaManager();
        PriceManager PManager = new PriceManager();
        SubGroupAreaManager SAreaGroupManager = new SubGroupAreaManager();
        CustomerInfo CUSTOMER
        {
            get
            {
                return CustInfoManager.GetCustomerByKey(int.Parse(Request.QueryString["CustomerNumber"]));
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                InitializeInfo();
            }
        }
        private void InitializeInfo()
        {
            lblStyleDescription.Text =Request.QueryString["StyleDesc"];
            lblStyleCostPrice.Text = decimal.Parse(Request.QueryString["CostPrice"]).ToString("Php###,###.00");
            lblCustomerName.Text = CUSTOMER.CompanyName;
            lblBrand.Text = Request.QueryString["Brand"];
            lblStyleNumber.Text = Request.QueryString["StyleNumber"];
            lblPriceGroupRegular.Text = GetPriceGroup(CUSTOMER.PriceGroupNo).GroupField;
            lblPriceGroupMD.Text = GetPriceGroup(CUSTOMER.PriceGroupMarkdownNo).GroupField;
            lblArrangementType.Text = CUSTOMER.ArrangementType.ToUpper();
            lblArea.Text = GAreamanager.GetAreaGroupByKey(CUSTOMER.AreaGroupNo).GroupName;
            lblSubArea.Text = SAreaGroupManager.GetSubAreaGroupByKey(CUSTOMER.SubAreaGroupNo).GroupName;
            DataTable Price = PManager.PriceCheck(CUSTOMER.BrandName,lblStyleNumber.Text,CUSTOMER.CustomerNo);
            if (Price.Rows.Count >= 1)
            {
                foreach (DataRow row in Price.Rows)
                {
                    lblSRP.Text =ComputeMardownPrice(double.Parse(row[8].ToString()),CUSTOMER.PriceGroupNo).ToString("Php###,###.00");
                }
                DListPriceHistory.DataSource = Price;
                DListPriceHistory.DataBind();
                lblPriceFrom.Text = "PRICE FROM CURRENT MARKDOWN";
            }
            else
            {
                lblSRP.Text = "WALA";
                lblPriceFrom.Text = "REGULAR PRICE";
            }
            lblPickUpPrice.Text = lblSRP.Text;
           
        }

        private PriceGroup GetPriceGroup(int pg)
        {
            return PriceManager.GetPriceGroupByKey(pg);
        }

        private double ComputeMardownPrice(double  price_,int PGNo)
        {
            double _price = 0;
            switch (PGNo )
            {
                case 1:
                    _price = price_ + 0.50;
                    break;
                case 2:
                    _price = price_ + 0.75;
                    break;
                case 3:
                    _price = price_ + 0.95;
                    break;
                case 4:
                    _price = price_ + 1.00;
                    break;
                case 10:
                    _price = price_;
                    break;
                case 11:
                    _price = price_ + 0.97;
                    break;
                case 14:
                    _price = price_ + 0.99;
                    break;

            }
            return _price;
        }
    }
}