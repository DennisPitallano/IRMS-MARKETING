using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IntegratedResourceManagementSystem.Shared;
using IRMS.Entities.view;
using System.Data;
using IRMS.Components;
namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class NewTransferSummary : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager();
        PullOutLetterSummaryManager POLSummaryManager = new PullOutLetterSummaryManager();
        StockTransferManager STManager = new StockTransferManager();
        StockTransferDetailManager STDetailsManager = new StockTransferDetailManager();
        BrandManager BrandManager = new BrandManager();
        PriceManager PManager = new PriceManager();
        PricePointManager PricePointManager = new PricePointManager();
        CustomerInfoManager CustomerManager = new CustomerInfoManager();
        private static Random random = new Random();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            this.hfStockTransferCode.Value = Security.CreateCode(25, random);
            this.txtSTDate.Text = DateTime.UtcNow.ToShortDateString();
            int PullOutId = int.Parse(Request.QueryString["PullOutId"]);
            string PullOutCode = Request.QueryString["PullOutCode"];
            string PullOutSeriesNumber = Request.QueryString["PullOutSeries"];

            PullOutLetter PullOutLetter = POLManager.FetchById(PullOutId);

            hfFromBrand.Value = PullOutLetter.BrandName;
            txtAccountName.Text = PullOutLetter.AccountName;
            txtBranchName.Text = PullOutLetter.BranchName;
            txtFromCustomer.Text = PullOutLetter.CompanyName;
            txtPOLSeriesNumber.Text = PullOutLetter.SeriesNumber;
            txtTotalQTY.Text = PullOutLetter.TotalQuantity.ToString("###,###");
            hfFromCustomerNumber.Value = PullOutLetter.CustomerNumber.ToString();
            hfPullOutLetterCode.Value = PullOutLetter.PullOutCode;
            hfPullOutLetterId.Value = PullOutLetter.RecordNumber.ToString();
            hfPullOutSeriesNumber.Value = PullOutLetter.SeriesNumber;
            var POLSummaries = POLSummaryManager.PullOutLetterSummariesByPullOutCode(PullOutCode);
            foreach (var summary in POLSummaries)
            {
                if (summary.ContainerType=="Box")
                {
                    summary.PullOutCode = Constant.BoxImageUrl;
                }
                else
                {
                    summary.PullOutCode = Constant.SackImageUrl;
                }
            }
            gvPOLSummaries.DataSource = POLSummaries;
            gvPOLSummaries.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void iBtnSearchCustomer_Click(object sender, ImageClickEventArgs e)
        {
            POLManager.SearchCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text, false, hfFromBrand.Value);
            btnBrowseToCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            btnBrowseToCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnSelectCustomer.Enabled = true;
            btnBrowseToCustomer_ModalPopupExtender.Show();

        }

        protected void gvCustomers_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            btnBrowseToCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_Sorting(object sender, GridViewSortEventArgs e)
        {
            btnBrowseToCustomer_ModalPopupExtender.Show();
        }

        protected void btnSelectCustomer_Click(object sender, EventArgs e)
        {
            txtToCustomer.Text = gvCustomers.SelectedDataKey[1].ToString();
            if (string.Equals(txtFromCustomer.Text, txtToCustomer.Text) == true)
            {
                lblErrorMessage.Text = "WARNING! <br />Cannot transfer into thesame Outlet!";
                txtToCustomer.Text = string.Empty;
                txtToBranchName.Text = string.Empty;
                txtToAccountName.Text = string.Empty;
                hfErrorModalHandLer_ModalPopupExtender.Show();
                return;
            }
            int customerNumber = int.Parse(gvCustomers.SelectedValue.ToString());
            hfAreaGroupNo.Value = gvCustomers.SelectedDataKey[5].ToString();
            hfCustomerNumber.Value = gvCustomers.SelectedValue.ToString();
            hfPGMDNo.Value = gvCustomers.SelectedDataKey[3].ToString();
            hfPGNo.Value = gvCustomers.SelectedDataKey[4].ToString();
            hfSubAreaGroupNo.Value = gvCustomers.SelectedDataKey[6].ToString();
            string brandName = gvCustomers.SelectedDataKey[2].ToString();
            hfBrandCode.Value = BrandManager.GetBrandByBrandName(brandName).BrandCode;
            txtToBranchName.Text = POLManager.GetBranchNameByCustomerNumber(customerNumber);
            txtToAccountName.Text = POLManager.GetAccountNameByCustomerNumber(customerNumber);
            CustomerInfo customer = CustomerManager.GetCustomerByKey(int.Parse(hfCustomerNumber.Value));
            if (string.IsNullOrEmpty(txtReferenceNumber.Text))
            {
                txtReferenceNumber.Text = STManager.getDRNumberSequenceNumber(customer.CompanyNo).ToString();
            }
        }

        protected void txtSearchStyleNumber_TextChanged(object sender, EventArgs e)
        {
            POLManager.SearchStyles(SqlDataSourceStyles, txtSearchStyleNumber.Text, hfFromBrand.Value);
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            POLManager.SearchStyles(SqlDataSourceStyles, txtSearchStyleNumber.Text, hfFromBrand.Value);
        }

        protected void gvStyles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearchStyleNumber.Text))
            {
                POLManager.SearchStyles(SqlDataSourceStyles, txtSearchStyleNumber.Text, hfFromBrand.Value);
              
            }
            btnAddDetails_ModalPopupExtender.Show();
        }

        protected void gvPOLSummaries_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtToCustomer.Text))
            {
                 lblErrorMessage.Text = "WARNING! <br />Please Select Outlet/Customer!";
                hfErrorModalHandLer_ModalPopupExtender.Show();
                return;
            }
            btnAddDetails.CssClass = "btnAddDetails";
            btnDeleteDetails.CssClass = "btnDeleteDetail";
            btnAddDetails.Enabled = true;
            lblSelected.Text = "Selected Container: "+gvPOLSummaries.SelectedDataKey[1].ToString() + " " + gvPOLSummaries.SelectedValue.ToString();
        }

        protected void gvStyles_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            btnAddDetails_ModalPopupExtender.Show();
        }

        protected void btnAddToDetails_Click(object sender, EventArgs e)
        {
            IList<PullOutLetterDetail> BoxItems = getSelectedStylesForBoxes();
            int containerNumber = int.Parse(gvPOLSummaries.SelectedValue.ToString());
            string containerType = gvPOLSummaries.SelectedDataKey[1].ToString();
            long totalQty =long.Parse(gvPOLSummaries.SelectedDataKey[2].ToString());
            long totalQtyPerContainer = BoxItems.Where(i => i.ContainerType == containerType && i.ContainerNumber == containerNumber).Sum(i => i.Quantity);
            int totalSelectedStyleTobeAdded = 0;
            try
            {
              
                IList<ITEM> ContainerStyles = new List<ITEM>();
                List<StylePrice> CONTAINER_PRICES = new List<StylePrice>();

                #region populate for boxes
                foreach (GridViewRow row in gvStyles.Rows)
                {
                    CheckBox chkItem = (CheckBox)row.FindControl("chkItems");
                    TextBox txtQuantity = (TextBox)row.FindControl("txtQty");
                    CheckBox chkIsLostTag = (CheckBox)row.FindControl("chkIsLostTag");
                   
                    if (chkItem.Checked)
                    {
                        int qty;
                        if (string.IsNullOrEmpty(txtQuantity.Text) || int.TryParse(txtQuantity.Text, out qty) == false)
                        {
                            txtQuantity.Text = "1";
                        }
                        ITEM style = new ITEM
                        {
                            APType = chkIsLostTag.Checked.ToString(),
                            Brand = hfFromBrand.Value,
                            CostPrice = decimal.Parse(txtQuantity.Text), //as quantity
                            Description = row.Cells[4].Text,
                            StyleNumber = row.Cells[2].Text,
                            Box = containerNumber
                        };
                        if (!isAlreadySelected(BoxItems, style.StyleNumber, containerNumber))
                        {
                            totalSelectedStyleTobeAdded+=(int)style.CostPrice;
                            ContainerStyles.Add(style);
                        }
                    }
                }

                if ((totalQtyPerContainer + totalSelectedStyleTobeAdded) > totalQty)
                {
                    lblErrorMessage.Text = "Container " + containerType + ":" + containerNumber + " is greater than " + totalQty.ToString() + " Styles!";
                    hfErrorModalHandLer_ModalPopupExtender.Show();
                    return;
                }

                //for boxes
                    foreach (ITEM item_ in ContainerStyles)
                    {
                        StylePrice price_ = new StylePrice();
                        price_ = PricePointManager.GetStyleCurrentPrice(item_.StyleNumber, int.Parse(hfPGMDNo.Value),
                           int.Parse(hfAreaGroupNo.Value), int.Parse(hfSubAreaGroupNo.Value), int.Parse(hfCustomerNumber.Value));
                        if (price_ != null)
                        {
                            price_.PriceType = "MARKDOWN";
                            price_.PGNo = item_.Box.ToString();//as boxNumber
                            price_.GrpNo = item_.Description; //as Description
                            price_.APType = item_.APType;
                            price_.StyleNo = item_.StyleNumber;
                            price_.SRP = getSRP(item_, price_).Price;
                            price_.GenMemoID = (int)item_.CostPrice; // as quantity
                            CONTAINER_PRICES.Add(price_);
                        }
                        else
                        {
                            price_ = getSRP(item_, price_);
                            CONTAINER_PRICES.Add(price_);
                        }
                    }

                    foreach (StylePrice price_ in CONTAINER_PRICES)
                    {
                        PullOutLetterDetail pd = new PullOutLetterDetail
                        {
                            ContainerNumber = int.Parse(price_.PGNo),
                            StyleDescription = price_.GrpNo,
                            Quantity = price_.GenMemoID,
                            SRP = price_.Price,
                            StyleNumber = price_.StyleNo,
                            TtlAmount = (price_.GenMemoID * price_.Price),
                            IsLostTag = bool.Parse(price_.APType)
                           ,
                            ContainerType = containerType,
                            PullOutLetterCode = hfPullOutLetterCode.Value
                        };
                        BoxItems.Add(pd);
                    }

                    lblTotalSelected.Text = "Total Styles:" + BoxItems.Count.ToString("###,##0");
                    lblTotalAmount.Text = "Total Amt:" + BoxItems.Sum(i => i.TtlAmount).ToString("###,##0.00");
                    gvSelectedStyles.DataSource = BoxItems.OrderBy(s => s.ContainerNumber).ThenBy(s => s.StyleNumber);
                    gvSelectedStyles.DataBind();

                #endregion
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
                hfErrorModalHandLer_ModalPopupExtender.Show();
               // throw;
            }
            btnSaveTransfer.Enabled = true;
        }

        private IList<PullOutLetterDetail> getSelectedStylesForBoxes()
        {
            IList<PullOutLetterDetail> selectedItems = new List<PullOutLetterDetail>();
            string containerType = gvPOLSummaries.SelectedDataKey[1].ToString();
            foreach (GridViewRow row in this.gvSelectedStyles.Rows)
            {
                CheckBox chkItem = (CheckBox)row.FindControl("chkItems");
                //CheckBox chkIsLostTag = (CheckBox)row.FindControl("chkIsLostTag");
                if (!chkItem.Checked)
                {
                    PullOutLetterDetail pd = new PullOutLetterDetail
                    {
                        ContainerNumber = int.Parse(row.Cells[7].Text),
                        StyleDescription = row.Cells[3].Text,
                        Quantity = int.Parse(row.Cells[4].Text),
                        SRP = decimal.Parse(row.Cells[5].Text),
                        StyleNumber = row.Cells[2].Text,
                        TtlAmount = decimal.Parse(row.Cells[6].Text),
                        IsLostTag = false,
                        ContainerType = containerType,
                        PullOutLetterCode = hfPullOutLetterCode.Value
                    };
                    selectedItems.Add(pd);
                }
            }
            return selectedItems;
        }

        private StylePrice getSRP(ITEM item_, StylePrice price_)
        {
            DataTable price = PManager.GetSRP(int.Parse(hfPGNo.Value), item_.StyleNumber);
            foreach (DataRow row in price.Rows)
            {
                switch (int.Parse(hfPGNo.Value))
                {
                    case 1:
                        price_ = new StylePrice
                        {
                            ID = int.Parse(row[0].ToString()),
                            StyleNo = item_.StyleNumber,
                            Price = decimal.Parse(row[6].ToString()),
                            PriceType = "REGULAR PRICE",
                            GrpNo = item_.Description,
                            GenMemoID = (int)item_.CostPrice, // as quantity
                            PGNo = item_.Box.ToString(),// as box number
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
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
                            PGNo = item_.Box.ToString(),// as box number
                            GenMemoID = (int)item_.CostPrice, // as quantity
                            APType = item_.APType
                        };
                        break;
                }
            }
            return price_;
        }

        private bool isAlreadySelected(IList<PullOutLetterDetail> selectedItems, string StyleNumber, int boxNumber)
        {
            bool result = false;
            foreach (PullOutLetterDetail item_ in selectedItems)
            {
                if (item_.StyleNumber == StyleNumber && item_.ContainerNumber == boxNumber)
                {
                    result = true;
                    break;
                }
            }
            return result;
        }

        protected void btnDeleteDetails_Click(object sender, EventArgs e)
        {
            IList<PullOutLetterDetail> selectedItemsForBoxes = getSelectedStylesForBoxes();
            lblTotalAmount.Text = "Total Amt:" + selectedItemsForBoxes.Sum(i => i.TtlAmount).ToString("###,##0.00");
            this.lblTotalSelected.Text = "Total Styles:" + selectedItemsForBoxes.Sum(i => i.Quantity).ToString("###,##0");
            gvSelectedStyles.DataSource = selectedItemsForBoxes.OrderBy(s => s.ContainerNumber).ThenBy(s => s.StyleNumber);
            gvSelectedStyles.DataBind();
        }

        private void reFetchSelectedStyleForBoxesAffectedByRemovingBox(List<Container> containersToRemove)
        {
            List<PullOutLetterDetail> boxPLDetails = getSelectedStylesForBoxes().ToList();

            foreach (Container container in containersToRemove)
            {
                int boxNumber = int.Parse(container.BoxNumber.Split(':')[1]);
                boxPLDetails.RemoveAll(s => s.ContainerNumber == boxNumber);
            }

            gvSelectedStyles.DataSource = boxPLDetails.OrderBy(s => s.ContainerNumber).ThenBy(s => s.StyleNumber);
            gvSelectedStyles.DataBind();
        }

        protected void btnSaveYes_Click(object sender, EventArgs e)
        {
            try
            {
                StockTransfer newStockTransfer = new StockTransfer
                   {
                       BrandName = hfFromBrand.Value,
                       DateRecorded = DateTime.UtcNow,
                       FromCustomerName = txtFromCustomer.Text,
                       FromCustomerNumber = int.Parse(hfFromCustomerNumber.Value),
                       ToCusmtomerName = txtToCustomer.Text,
                       ToCustomerNumber = int.Parse(hfCustomerNumber.Value),
                       PullOutLetterId = long.Parse(hfPullOutLetterId.Value),
                       PullOutLetterSeriesNumber = txtPOLSeriesNumber.Text,
                       ReferenceNumber = txtReferenceNumber.Text,
                       StockTransferCode = hfStockTransferCode.Value,
                       StockTransferDate = DateTime.Parse(txtSTDate.Text),
                       TotalQuantity = long.Parse(txtTotalQTY.Text),
                       TotalAmount = double.Parse(lblTotalAmount.Text.Split(':')[1])
                   };
                List<StockTransferDetail> stockTransferDetails = new List<StockTransferDetail>();

                foreach (var item in getSelectedStylesForBoxes())
                {
                    StockTransferDetail std = new StockTransferDetail
                    {
                        ContainerNumber = item.ContainerNumber,
                        ContainerType = item.ContainerType,
                        DateRecorded = DateTime.UtcNow,
                        Quantity = item.Quantity,
                        ReferenceNumber = newStockTransfer.ReferenceNumber,
                        SRP = item.SRP,
                        StockTransferCode = newStockTransfer.StockTransferCode,
                        StyleDescription = item.StyleDescription,
                        StyleNumber = item.StyleNumber,
                        TotalAmount = item.TtlAmount
                    };
                    stockTransferDetails.Add(std);
                }

                STManager.Save(newStockTransfer);
                STDetailsManager.Save(stockTransferDetails);
                hfSuccessfulModalHandler_ModalPopupExtender.Show();
            }
            catch (Exception ex )
            {
                lblErrorMessage.Text = ex.Message;
                hfErrorModalHandLer_ModalPopupExtender.Show();
                return;
                //throw;
            }
        }
    }
}