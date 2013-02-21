using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;
using IRMS.BusinessLogic.Manager;
using IRMS.Entities.view;
using System.Data;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class PullOutLetterUpdate : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager();
        PricePointManager PricePointManager = new PricePointManager();
        CustomerInfoManager CustInfoManager = new CustomerInfoManager();
        PriceManager PManager = new PriceManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            hfPullOutCode.Value = Request.QueryString["PullOutCode"];
            initializeContainers();
            initializeHeader();
        }

        private void initializeHeader()
        {
            PullOutLetter pullOutLetter = POLManager.FetchById(int.Parse(Request.QueryString["PullOutId"]));
            txtAccountName.Text = pullOutLetter.AccountName;
            txtBranchDeptCode.Text = pullOutLetter.BranchDepartmentCode;
            txtBranchName.Text = pullOutLetter.BranchName;
            txtBrandDeptCode.Text = pullOutLetter.BrandDepartmentCode;
            txtBrand.Text = pullOutLetter.BrandName;
            txtOutLetName.Text = pullOutLetter.CompanyName;
            txtPullOutDate.Text = pullOutLetter.PulloutDate.ToString("MMMM dd, yyyy");
            txtSeriesNumber.Text = pullOutLetter.SeriesNumber;
            txtForwarder.Text = pullOutLetter.Forwarders;
            if (pullOutLetter.IsBackLoad)
            {
                rdioPLType.SelectedIndex = 0;
                btnAddLostTagItems.Enabled = true;
                btnAddLostTagItems.CssClass = "btnTag";
            }
            else
            {
                rdioPLType.SelectedIndex = 1;
                btnAddLostTagItems.Enabled = false;
                btnAddLostTagItems.CssClass = "btnDisableTag";
            }
            CustomerInfo customer = CustInfoManager.GetCustomerByKey(pullOutLetter.CustomerNumber);
            hfAreaGroupNo.Value = customer.AreaGroupNo.ToString();
            hfBrandCode.Value = pullOutLetter.BrandCode;
            hfCustomerNumber.Value = pullOutLetter.CustomerNumber.ToString();
            hfPGMDNo.Value = customer.PriceGroupMarkdownNo.ToString();
            hfPGNo.Value = customer.PriceGroupNo.ToString();
            hfSubAreaGroupNo.Value = customer.SubAreaGroupNo.ToString();
            hpLinlUpdateForwarder.NavigateUrl = "~/Marketing/UpdatePullOutLetterForwarder.aspx?PullOutId=" + pullOutLetter.RecordNumber+"&mode=notsmdetails";
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void initializeContainers()
        {
            List<Container> boxContainers = new List<Container>();
            List<Container> sackContainers = new List<Container>();
            List<Container> containers = new List<Container>();

            List<PullOutLetterDetail> containerDetails = POLDetailManager.FetchAll().Where(s =>
                                                           s.PullOutLetterCode == hfPullOutCode.Value).OrderBy(s => s.ContainerType).ThenBy(s => s.ContainerNumber)
                                                           .ToList();

            List<PullOutLetterDetail> boxDetails = new List<PullOutLetterDetail>();
            List<PullOutLetterDetail> sackDetails = new List<PullOutLetterDetail>();

            long totalQty = 0;
            decimal totalAmt = 0;
            foreach (var item in containerDetails)
            {
                if (item.ContainerType == "BOX")
                {
                    boxDetails.Add(item);
                    Container container = new Container
                    {
                        BoxNumber = "BOX#" + item.ContainerNumber
                         ,
                        ImageUrl = "~/Resources/Box.png",

                    };
                    containers.Add(container);
                }
                else
                {
                    sackDetails.Add(item);
                    Container container = new Container
                    {
                        BoxNumber = "SACK#" + item.ContainerNumber
                        ,
                        ImageUrl = "~/Resources/Sack32.png"
                    };
                    containers.Add(container);
                }
                totalQty += item.Quantity;
                totalAmt += item.TtlAmount;
            }

            var Con = (from con in containers
                       select new { BoxNumber = con.BoxNumber, ImageUrl = con.ImageUrl, qty = con.ItemsQuantity }).Distinct();

            txtSummary.Text = "SUMMARY TOTAL QTY: " + totalQty.ToString() + " TOTAL AMOUNT: " + totalAmt.ToString("###,###.00");
            lblTotalCotainer.Text = "TOTAL CONTAINER: " + Con.ToList().Count.ToString();
            gvBoxContainerDetails.DataSource = containerDetails;
            gvBoxContainerDetails.DataBind();
            gvContainers.DataSource = Con;
            gvContainers.DataBind();

            rdioContainers.DataSource = Con;
            rdioContainers.DataTextField = "BoxNumber";
            rdioContainers.DataValueField = "BoxNumber";
            rdioContainers.DataBind();
            rdioContainers.SelectedIndex = 0;
            rdioLostTagContainers.DataSource = Con;
            rdioLostTagContainers.DataTextField = "BoxNumber";
            rdioLostTagContainers.DataValueField = "BoxNumber";
            rdioLostTagContainers.DataBind();
            rdioLostTagContainers.SelectedIndex = 0;
        }

        protected void gvContainers_SelectedIndexChanged(object sender, EventArgs e)
        {
            string containterType = gvContainers.SelectedValue.ToString().Split('#')[0];
            int containerNumber = int.Parse(gvContainers.SelectedValue.ToString().Split('#')[1]);

            List<PullOutLetterDetail> containerDetails = POLDetailManager.FetchAll().Where(s =>
                                                           s.PullOutLetterCode == hfPullOutCode.Value
                                                           && s.ContainerType == containterType
                                                           && s.ContainerNumber == containerNumber)
                                                           .ToList();
            long totalQty = 0;
            decimal totalAmt = 0;
            foreach (var item in containerDetails)
            {
                totalQty += item.Quantity;
                totalAmt += item.TtlAmount;
            }
            txtSummary.Text = "SUMMARY TOTAL QTY: " + totalQty.ToString() + " TOTAL AMOUNT: " + totalAmt.ToString("###,###.00");
            gvBoxContainerDetails.DataSource = containerDetails;
            gvBoxContainerDetails.DataBind();
            pnlContainerOptions.Visible = false;
            pnlrdioLostTagContainers.Visible = false;
        }

        protected void imgBtn_Click(object sender, ImageClickEventArgs e)
        {
            initializeContainers();
        }

        protected void btnUpdateHeader_Click(object sender, EventArgs e)
        {
            btnDoneHeaderEditing.Visible = true;
            btnUpdateHeader.Visible = false;
            rdioPLType.Enabled = true;
            txtPullOutDate.Enabled = true;
        }

        protected void btnDoneHeaderEditing_Click(object sender, EventArgs e)
        {
            btnDoneHeaderEditing.Visible = false;
            btnUpdateHeader.Visible = true;
            rdioPLType.Enabled = false;
            txtPullOutDate.Enabled = false;
            PullOutLetter pullOutLetter = POLManager.FetchById(int.Parse(Request.QueryString["PullOutId"]));
            pullOutLetter.PulloutDate = DateTime.Parse(txtPullOutDate.Text);
            if (rdioPLType.SelectedValue == "BL")
            {
                pullOutLetter.IsBackLoad = true;
            }
            else
            {
                pullOutLetter.IsBackLoad = false;
            }
            POLManager.Save(pullOutLetter);
        }

        protected void btnSaveLostTag_Click(object sender, EventArgs e)
        {
            int containerNumber = 0;
            string containerType = string.Empty;
            if (pnlrdioLostTagContainers.Visible)
            {
                containerType = rdioLostTagContainers.SelectedValue.ToString().Split('#')[0];
                containerNumber = int.Parse(rdioLostTagContainers.SelectedValue.ToString().Split('#')[1]);
            }
            else
            {
                containerType = gvContainers.SelectedValue.ToString().Split('#')[0];
                containerNumber = int.Parse(gvContainers.SelectedValue.ToString().Split('#')[1]);
            }
            PullOutLetterDetail newLostTag = new PullOutLetterDetail
            {
                ContainerNumber = containerNumber,
                ContainerType = containerType,
                IsLostTag = true,
                PullOutLetterCode = hfPullOutCode.Value,
                Quantity = int.Parse(txtLostTagQty.Text),
                SRP = 00,
                StyleDescription = "N/A",
                StyleNumber = "LOST TAG",
                TtlAmount = 00
            };
            POLDetailManager.Save(newLostTag);
            PullOutLetter pullOutLetter = POLManager.FetchById(int.Parse(Request.QueryString["PullOutId"]));
            pullOutLetter.TotalQuantity += (int)newLostTag.Quantity;
            POLManager.Save(pullOutLetter);
            ReloadDetailsView();
        }

        protected void rdioPLType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdioPLType.SelectedValue == "BL")
            {
                btnAddLostTagItems.Enabled = true;
                btnAddLostTagItems.CssClass = "btnTag";
            }
            else
            {
                btnAddLostTagItems.Enabled = false;
                btnAddLostTagItems.CssClass = "btnDisableTag";
            }
        }

        protected void gvStyles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearchStyleNumber.Text))
            {
                POLManager.SearchStyles(SqlDataSourceStyles, txtSearchStyleNumber.Text, txtBrand.Text);
            }
            btnAddStyle_ModalPopupExtender.Show();
        }

        protected void brnUpdateStyles_Click(object sender, EventArgs e)
        {
            List<PullOutLetterDetail> selectedItems = new List<PullOutLetterDetail>();
            foreach (GridViewRow row in gvBoxContainerDetails.Rows)
            {
                Image imgItems = (Image)row.FindControl("imgItem");
                CheckBox chkItems = (CheckBox)row.FindControl("chkItem");
                if (chkItems.Checked)
                {
                    PullOutLetterDetail pld = new PullOutLetterDetail
                    {
                        ContainerNumber = int.Parse(row.Cells[3].Text),
                        ContainerType = row.Cells[2].Text,
                        IsLostTag = bool.Parse(imgItems.AlternateText),
                        PullOutLetterCode = hfPullOutCode.Value,
                        Quantity = int.Parse(row.Cells[6].Text),
                        RecordNumber = int.Parse(imgItems.ToolTip),
                        SRP = decimal.Parse(row.Cells[7].Text),
                        StyleDescription = row.Cells[5].Text,
                        StyleNumber = row.Cells[4].Text,
                        TtlAmount = decimal.Parse(row.Cells[8].Text)
                    };
                    selectedItems.Add(pld);
                }

            }
            if (selectedItems.Count > 0)
            {
                gvSelectedItems.DataSource = selectedItems;
                gvSelectedItems.DataBind();
                hfUpdateStyleModalHandler_ModalPopupExtender.Show();
            }
        }

        protected void txtSearchStyleNumber_TextChanged(object sender, EventArgs e)
        {
            SearchStyle();
        }

        private void SearchStyle()
        {
            POLManager.SearchStyles(SqlDataSourceStyles, txtSearchStyleNumber.Text, txtBrand.Text);
            btnAddStyle_ModalPopupExtender.Show();
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            SearchStyle();
        }

        protected void btnSaveSelectedStyles_Click(object sender, EventArgs e)
        {
            List<PullOutLetterDetail> selectedItems = new List<PullOutLetterDetail>();

            IList<ITEM> ContainerStyles = new List<ITEM>();
            List<StylePrice> STYLE_PRICES = new List<StylePrice>();

            int containerNumber = 0;
            string containerType = string.Empty;
            if (pnlContainerOptions.Visible)
            {
                containerType = rdioContainers.SelectedValue.ToString().Split('#')[0];
                containerNumber = int.Parse(rdioContainers.SelectedValue.ToString().Split('#')[1]);
            }
            else
            {
                containerType = gvContainers.SelectedValue.ToString().Split('#')[0];
                containerNumber = int.Parse(gvContainers.SelectedValue.ToString().Split('#')[1]);
            }
            #region populate for boxes
            foreach (GridViewRow row in gvStyles.Rows)
            {
                CheckBox chkItem = (CheckBox)row.FindControl("chkStyles");
                TextBox txtQuantity = (TextBox)row.FindControl("txtQty");
                if (chkItem.Checked)
                {
                    int qty;
                    if (string.IsNullOrEmpty(txtQuantity.Text) || int.TryParse(txtQuantity.Text, out qty) == false)
                    {
                        txtQuantity.Text = "1";
                    }

                    if (rdioContainers.Items.Count > 0)
                    {
                        ITEM style = new ITEM
                        {
                            APType = "False",
                            Brand = txtBrand.Text,
                            CostPrice = decimal.Parse(txtQuantity.Text), //as quantity
                            Description = row.Cells[4].Text,
                            StyleNumber = row.Cells[2].Text,
                            Box = containerNumber
                        };
                        ContainerStyles.Add(style);
                    }
                }
            }

            if (rdioContainers.Items.Count > 0)
            {
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
                        STYLE_PRICES.Add(price_);
                    }
                    else
                    {
                        price_ = getSRP(item_, price_);
                        STYLE_PRICES.Add(price_);
                    }
                }

                foreach (StylePrice price_ in STYLE_PRICES)
                {
                    PullOutLetterDetail pd = new PullOutLetterDetail
                    {
                        ContainerNumber = int.Parse(price_.PGNo),
                        StyleDescription = price_.GrpNo,
                        Quantity = price_.GenMemoID,
                        SRP = price_.Price,
                        StyleNumber = price_.StyleNo,
                        TtlAmount = (price_.GenMemoID * price_.Price),
                        IsLostTag = bool.Parse(price_.APType),
                        ContainerType = containerType,
                        PullOutLetterCode = hfPullOutCode.Value
                    };
                    selectedItems.Add(pd);
                }

                POLDetailManager.Save(selectedItems);
                PullOutLetter pullOutLetter = POLManager.FetchById(int.Parse(Request.QueryString["PullOutId"]));
                pullOutLetter.TotalQuantity += (int)selectedItems.Sum(s => s.Quantity);
                POLManager.Save(pullOutLetter);
                ReloadDetailsView();
            }
            #endregion
        }

        private void ReloadDetailsView()
        {
            List<PullOutLetterDetail> containerDetails = POLDetailManager.FetchAll().Where(s =>
                                       s.PullOutLetterCode == hfPullOutCode.Value).OrderBy(s => s.ContainerType).ThenBy(s => s.ContainerNumber)
                                       .ToList();
            gvBoxContainerDetails.DataSource = containerDetails;
            gvBoxContainerDetails.DataBind();
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

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            List<PullOutLetterDetail> selectedItems = new List<PullOutLetterDetail>();
            foreach (GridViewRow row in gvSelectedItems.Rows)
            {
                Image imgItems = (Image)row.FindControl("imgStyle");
                TextBox txtSelectedItemQty = (TextBox)row.FindControl("txtSelectedItemQty");
                PullOutLetterDetail pld = new PullOutLetterDetail
                {
                    ContainerNumber = int.Parse(row.Cells[2].Text),
                    ContainerType = row.Cells[1].Text,
                    IsLostTag = false,
                    PullOutLetterCode = hfPullOutCode.Value,
                    Quantity = int.Parse(txtSelectedItemQty.Text),
                    RecordNumber = int.Parse(imgItems.AlternateText),
                    SRP = decimal.Parse(row.Cells[6].Text),
                    StyleDescription = row.Cells[4].Text,
                    StyleNumber = row.Cells[3].Text,
                    TtlAmount = int.Parse(txtSelectedItemQty.Text) * decimal.Parse(row.Cells[6].Text)
                };
                selectedItems.Add(pld);
            }
            POLDetailManager.Save(selectedItems);
            PullOutLetter pullOutLetter = POLManager.FetchById(int.Parse(Request.QueryString["PullOutId"]));
            pullOutLetter.TotalQuantity =(int)POLDetailManager.FetchAll().Where(s =>s.PullOutLetterCode == hfPullOutCode.Value).Sum(s => s.Quantity);
            POLManager.Save(pullOutLetter);
            ReloadDetailsView();
        }

        protected void bntDeleteYes_Click(object sender, EventArgs e)
        {
            List<PullOutLetterDetail> selectedItems = new List<PullOutLetterDetail>();
            foreach (GridViewRow row in gvBoxContainerDetails.Rows)
            {
                Image imgItems = (Image)row.FindControl("imgItem");
                CheckBox chkItems = (CheckBox)row.FindControl("chkItem");
                if (chkItems.Checked)
                {
                    PullOutLetterDetail pld = new PullOutLetterDetail
                    {
                        ContainerNumber = int.Parse(row.Cells[3].Text),
                        ContainerType = row.Cells[2].Text,
                        IsLostTag = bool.Parse(imgItems.AlternateText),
                        PullOutLetterCode = hfPullOutCode.Value,
                        Quantity = int.Parse(row.Cells[6].Text),
                        RecordNumber = int.Parse(imgItems.ToolTip),
                        SRP = decimal.Parse(row.Cells[7].Text),
                        StyleDescription = row.Cells[5].Text,
                        StyleNumber = row.Cells[4].Text,
                        TtlAmount = decimal.Parse(row.Cells[8].Text)
                    };
                    selectedItems.Add(pld);
                }
            }
            POLDetailManager.Delete(selectedItems);
            PullOutLetter pullOutLetter = POLManager.FetchById(int.Parse(Request.QueryString["PullOutId"]));
            pullOutLetter.TotalQuantity -= (int)selectedItems.Sum(s => s.Quantity);
            POLManager.Save(pullOutLetter);
            ReloadDetailsView();
        }
    }
}