using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;

using System.Data;
using IRMS.Entities.view;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class CheckStylesPrice : System.Web.UI.Page
    {
        #region variables
        CustomerInfoManager CustInfoManager = new CustomerInfoManager();
        PriceGroupManager PriceManager = new PriceGroupManager();
        GroupAreaManager GAreamanager = new GroupAreaManager();
        PriceManager PManager = new PriceManager();
        SubGroupAreaManager SAreaGroupManager = new SubGroupAreaManager();
        PricePointManager PricePointManager = new PricePointManager();
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
            lblCustomerName.Text = CUSTOMER.CompanyName;
            lblBrand.Text = CUSTOMER.BrandName;
            lblPriceGroupRegular.Text = GetPriceGroup(CUSTOMER.PriceGroupNo).GroupField;
            lblPriceGroupMD.Text = GetPriceGroup(CUSTOMER.PriceGroupMarkdownNo).GroupField;
            lblArrangementType.Text = CUSTOMER.ArrangementType.ToUpper();
            lblArea.Text = GAreamanager.GetAreaGroupByKey(CUSTOMER.AreaGroupNo).GroupName;
            lblSubArea.Text = SAreaGroupManager.GetSubAreaGroupByKey(CUSTOMER.SubAreaGroupNo).GroupName;
            List<StylePrice> PRICES = new List<StylePrice>();
            List<StylePrice> PRICES_MARKDOWN = new List<StylePrice>();
            List<StylePrice> PRICES_REGULAR = new List<StylePrice>();
            List<ITEM> ITEMS = (List<ITEM>)Session["STYLES"];

            foreach (ITEM item_ in ITEMS)
            {
                StylePrice price_ = new StylePrice();
                price_= PricePointManager.GetStyleCurrentPrice(item_.StyleNumber, CUSTOMER.PriceGroupMarkdownNo, CUSTOMER.AreaGroupNo, CUSTOMER.SubAreaGroupNo, CUSTOMER.CustomerNo);
                if (price_ != null)
                {
                    price_.PriceType = "MARKDOWN";
                    price_.PGNo = item_.CostPrice.ToString("###,###.00");
                    price_.GrpNo = item_.Description;
                    price_.APType = item_.APType;
                    price_.SRP = GetSRP(item_, price_).Price;
                    PRICES.Add(price_);
                    PRICES_MARKDOWN.Add(price_);
                }
                else
                {
                    price_ = GetSRP(item_, price_);
                    PRICES.Add(price_);
                    PRICES_REGULAR.Add(price_);
                }
            }

            var prices_ = (from _price in PRICES
                          orderby _price.PriceType
                           select _price).ToList() ;
            this.gvStylesPrice.DataSource = PRICES_MARKDOWN;
            gvStylesPrice.DataBind();
            this.gvRegularPrices.DataSource = PRICES_REGULAR;
            gvRegularPrices.DataBind();
            if (gvStylesPrice.Rows.Count < 1)
            {
                lblMarkDownTitle.Visible = false;
            }
            if (gvRegularPrices.Rows.Count < 1)
            {
                lblRegularTitle.Visible = false;
            }
         
            Session["STYLE_PRICES"] = prices_;
            Session["STYLE_PRICES_MARKDOWN"] = PRICES_MARKDOWN;
            Session["STYLE_PRICES_REGULAR"] = PRICES_REGULAR;
            Session["CUSTOMER"] = CUSTOMER;
            hpLinkPrintPreview.NavigateUrl = "~/Reports/ReportForms/PrintStylePrices.aspx";
         }

        private StylePrice GetSRP(ITEM item_, StylePrice price_)
        {
            DataTable price = PManager.GetSRP(CUSTOMER.PriceGroupNo, item_.StyleNumber);
            foreach (DataRow row in price.Rows)
            {
                switch (CUSTOMER.PriceGroupNo)
                {
                    case 1:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[6].ToString()),
                            PriceType = "REGULAR PRICE",
                             GrpNo = item_.Description,
                              PGNo = item_.CostPrice.ToString("###,###.00"),
                              APType = item_.APType
                        };
                        break;
                    case 2:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[7].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 3:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[8].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 4:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[9].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 5:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[10].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 6:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[11].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 7:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[12].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 8:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[13].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 9:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[14].ToString()),
                            PriceType = "REGULAR PRICE",
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 10:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[15].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 11:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[16].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 12:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[17].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 13:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[18].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 14:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[19].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 15:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[20].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;
                    case 16:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[21].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            PGNo = item_.CostPrice.ToString("###,###.00"),
                            APType = item_.APType
                        };
                        break;

                }

            }
            return price_;
        }

        private PriceGroup GetPriceGroup(int pg)
        {
            return PriceManager.GetPriceGroupByKey(pg);
        }

        private double ComputeMardownPrice(double price_, int PGNo)
        {
            double _price = 0;
            switch (PGNo)
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

        protected void gvStylesPrice_RowCreated(object sender, GridViewRowEventArgs e)
        {
            foreach (GridViewRow row in this.gvStylesPrice.Rows)
            {
                if (row.Cells[3].Text == "MARKDOWN")
                {
                    row.Cells[1].Style.Add("font-weight", "bold");
                    row.Cells[3].Style.Add("font-weight", "bold");
                }
            }
        }

       
    }
   
}