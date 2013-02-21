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

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class NewTransferDefault : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager();
        PriceManager PManager = new PriceManager();
        PricePointManager PricePointManager = new PricePointManager();
        BrandDepartmentCodeManager BrandDeptCodeManager = new BrandDepartmentCodeManager();
        PullOutLetterSummaryManager POLSummaryManager = new PullOutLetterSummaryManager();
        StockTransferManager STManager = new StockTransferManager();
        BrandManager BrandManager = new BrandManager();
        CustomerInfoManager CustomerManager = new CustomerInfoManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
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
            Label1.Text = PullOutLetter.ForSM.ToString();
            txtTotalQTY.Text = PullOutLetter.TotalQuantity.ToString("###,###");
            hfFromCustomerNumber.Value = PullOutLetter.CustomerNumber.ToString();
            hfPullOutLetterCode.Value = PullOutLetter.PullOutCode;
            hfPullOutLetterId.Value = PullOutLetter.RecordNumber.ToString();
            hfPullOutSeriesNumber.Value = PullOutLetter.SeriesNumber;

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

            pnlStylesSelection.Visible = true;
            pnlBoxesCommand.Visible = true;
            pnlSacksCommand.Visible = true;
            btnRemoveBox.Visible = false;
            btnRemoveSack.Visible = false;

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
        
        protected void btnRemoveBox_Click(object sender, EventArgs e)
        {
            List<Container> containerBoxList = new List<Container>();
            List<Container> selectedBoxesToremove = new List<Container>();
            List<Container> containerSackList = sacksContainer();

            if (rptrBoxes.Items.Count > 0)
            {
                foreach (RepeaterItem rptrItem in rptrBoxes.Items)
                {
                    CheckBox chkBox = (CheckBox)rptrItem.FindControl("chkBox");
                    Label lblItemsQuantity = (Label)rptrItem.FindControl("lblItemsQuantity");
                    Label lblStylesQuantity = (Label)rptrItem.FindControl("lblStylesQuantity");
                    Label lblTotalAmount = (Label)rptrItem.FindControl("lblTotalAmount");
                    Image imgbox = (Image)rptrItem.FindControl("imgbox");
                    Container boxContainer = new Container
                    {
                        BoxNumber = chkBox.ToolTip,
                        ItemsQuantity = int.Parse(lblItemsQuantity.Text.Split(':')[1]),
                        StylesQuantity = int.Parse(lblStylesQuantity.Text.Split(':')[1]),
                        Type = "Box",
                        TotalAmount = decimal.Parse(lblTotalAmount.Text.Split(':')[1])
                        ,
                        ImageUrl = imgbox.ImageUrl,
                        IsSelected = bool.Parse(imgbox.ToolTip)
                    };
                    if (chkBox.Checked)
                    {
                        selectedBoxesToremove.Add(boxContainer);
                    }
                    containerBoxList.Add(boxContainer);
                }

                foreach (Container container in selectedBoxesToremove)
                {
                    containerBoxList.RemoveAll(s => s.BoxNumber == container.BoxNumber);
                }
                chkBoxList.Items.Clear();
                string activeContainer = string.Empty;
                if (containerBoxList.Count > 0)
                {
                    foreach (var item in containerBoxList)
                    {
                        string chkValue = item.BoxNumber.Split(':')[1];
                        chkBoxList.Items.Add(new ListItem(chkValue, chkValue));
                        if (item.IsSelected)
                        {
                            activeContainer = chkValue;
                        }
                    }
                    if (!string.IsNullOrEmpty(activeContainer))
                    {
                        chkBoxList.SelectedValue = activeContainer;
                    }
                }
                else
                {
                    btnRemoveBox.Visible = false;
                    pnlChkBoxList.Visible = false;
                }

                rptrBoxes.DataSource = containerBoxList;
                rptrBoxes.DataBind();

                reFetchSelectedStyleForBoxesAffectedByRemovingBox(selectedBoxesToremove);
            }
        }

        /// <summary>
        /// Fetch All Sack Containers
        /// </summary>
        /// <returns>List of Sack Container</returns>
        private List<Container> sacksContainer()
        {
            List<Container> containerSackList = new List<Container>();
            foreach (RepeaterItem rptrItem in this.rptrSacks.Items)
            {
                CheckBox chkBox = (CheckBox)rptrItem.FindControl("chkBox");
                Label lblItemsQuantity = (Label)rptrItem.FindControl("lblItemsQuantity");
                Label lblStylesQuantity = (Label)rptrItem.FindControl("lblStylesQuantity");
                Label lblTotalAmount = (Label)rptrItem.FindControl("lblTotalAmount");
                Image imgSack = (Image)rptrItem.FindControl("imgSack");
                Container sackContainer = new Container
                {
                    BoxNumber = chkBox.ToolTip,
                    ItemsQuantity = int.Parse(lblItemsQuantity.Text.Split(':')[1]),
                    StylesQuantity = int.Parse(lblStylesQuantity.Text.Split(':')[1]),
                    Type = "Sack",
                    TotalAmount = decimal.Parse(lblTotalAmount.Text.Split(':')[1])
                    ,
                    ImageUrl = imgSack.ImageUrl,
                    IsSelected = bool.Parse(imgSack.ToolTip)
                };
                containerSackList.Add(sackContainer);
            }
            return containerSackList;
        }

        /// <summary>
        /// ReFetch All Selected Styles for Box Containers Affected By Removing Box/es Item.
        /// </summary>
        /// <param name="containersToRemove">Box Containers to Remove/Delete</param>
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

        /// <summary>
        /// ReFetch All Selected Styles for Sack Containers Affected By Removing Sack/s Item.
        /// </summary>
        /// <param name="containersToRemove">Sack Containers to Remove/Delete</param>
        private void reFetchSelectedStyleForSacksAffectedByRemovingSack(List<Container> containersToRemove)
        {
            List<PullOutLetterDetail> sackPLDetails = getSelectedStylesForSacks().ToList();

            foreach (Container container in containersToRemove)
            {
                int sackNumber = int.Parse(container.BoxNumber.Split(':')[1]);
                sackPLDetails.RemoveAll(s => s.ContainerNumber == sackNumber);
            }

            gvSelectedStylesForSacks.DataSource = sackPLDetails.OrderBy(s => s.ContainerNumber).ThenBy(s => s.StyleNumber);
            gvSelectedStylesForSacks.DataBind();
        }

        private IList<PullOutLetterDetail> getSelectedStylesForBoxes()
        {
            IList<PullOutLetterDetail> selectedItems = new List<PullOutLetterDetail>();
            foreach (GridViewRow row in this.gvSelectedStyles.Rows)
            {
                CheckBox chkItem = (CheckBox)row.FindControl("chkItems");
                CheckBox chkIsLostTag = (CheckBox)row.FindControl("chkIsLostTag");
                if (!chkItem.Checked)
                {
                    PullOutLetterDetail pd = new PullOutLetterDetail
                    {
                        ContainerNumber = int.Parse(row.Cells[8].Text),
                        StyleDescription = row.Cells[3].Text,
                        Quantity = int.Parse(row.Cells[4].Text),
                        SRP = decimal.Parse(row.Cells[5].Text),
                        StyleNumber = row.Cells[2].Text,
                        TtlAmount = decimal.Parse(row.Cells[6].Text),
                        IsLostTag = chkIsLostTag.Checked,
                        ContainerType = "BOX",
                        PullOutLetterCode = hfPullOutLetterCode.Value
                    };
                    selectedItems.Add(pd);
                }
            }
            return selectedItems;
        }

        private IList<PullOutLetterDetail> getSelectedStylesForSacks()
        {
            IList<PullOutLetterDetail> selectedItems = new List<PullOutLetterDetail>();
            foreach (GridViewRow row in this.gvSelectedStylesForSacks.Rows)
            {
                CheckBox chkItem = (CheckBox)row.FindControl("chkItems");
                CheckBox chkIsLostTag = (CheckBox)row.FindControl("chkIsLostTag");
                if (!chkItem.Checked)
                {
                    PullOutLetterDetail pd = new PullOutLetterDetail
                    {
                        ContainerNumber = int.Parse(row.Cells[8].Text),
                        StyleDescription = row.Cells[3].Text,
                        Quantity = int.Parse(row.Cells[4].Text),
                        SRP = decimal.Parse(row.Cells[5].Text),
                        StyleNumber = row.Cells[2].Text,
                        TtlAmount = decimal.Parse(row.Cells[6].Text),
                        IsLostTag = chkIsLostTag.Checked,
                        ContainerType = "SACK",
                        PullOutLetterCode = hfPullOutLetterCode.Value
                    };
                    selectedItems.Add(pd);
                }
            }
            return selectedItems;
        }

        protected void btnAddBox_Click(object sender, EventArgs e)
        {
            List<Container> containerBoxList = boxesContainer();
            List<Container> containerSackList = sacksContainer();
            int boxesCount = containerBoxList.Count;
            int lastBoxNumber = 0;
            if (boxesCount > 0)
            {
                lastBoxNumber = int.Parse(containerBoxList.Max(s => s.BoxNumber.Split(':')[1])) + 1;
            }
            else
            {
                lastBoxNumber = (lastBoxNumber + 1);
            }
            Container newContainer = new Container
            {
                BoxNumber = "BOX#:" + (lastBoxNumber),
                ImageUrl = Constant.ActiveBoxImageUrl,
                ItemsQuantity = 0,
                StylesQuantity = 0,
                TotalAmount = 0,
                Type = "Box"
                ,
                IsSelected = true
            };

            foreach (var box in containerBoxList)
            {
                box.IsSelected = false;
                box.ImageUrl = Constant.BoxImageUrl;
            }

            containerBoxList.Add(newContainer);
            chkBoxList.Items.Clear();
            if (containerBoxList.Count > 0)
            {
                foreach (var item in containerBoxList)
                {
                    chkBoxList.Items.Add(new ListItem(item.BoxNumber.Split(':')[1], item.BoxNumber.Split(':')[1]));
                }
                chkBoxList.SelectedValue = lastBoxNumber.ToString();
                chkSackList.SelectedIndex = -1;
                this.btnRemoveBox.Visible = true;
                this.pnlChkBoxList.Visible = true;
            }
            rptrBoxes.DataSource = containerBoxList;
            rptrBoxes.DataBind();

            foreach (var sack in containerSackList)
            {
                sack.ImageUrl = Constant.SackImageUrl;
                sack.IsSelected = false;
            }
            this.rptrSacks.DataSource = containerSackList;
            rptrSacks.DataBind();
        }

        /// <summary>
        /// Fetch All Box Containers
        /// </summary>
        /// <returns>List of Box Container</returns>
        private List<Container> boxesContainer()
        {
            List<Container> containerBoxList = new List<Container>();
            foreach (RepeaterItem rptrItem in this.rptrBoxes.Items)
            {
                CheckBox chkBox = (CheckBox)rptrItem.FindControl("chkBox");
                Label lblItemsQuantity = (Label)rptrItem.FindControl("lblItemsQuantity");
                Label lblStylesQuantity = (Label)rptrItem.FindControl("lblStylesQuantity");
                Label lblTotalAmount = (Label)rptrItem.FindControl("lblTotalAmount");
                Image imgbox = (Image)rptrItem.FindControl("imgbox");
                Container boxContainer = new Container
                {
                    BoxNumber = chkBox.ToolTip,
                    ItemsQuantity = int.Parse(lblItemsQuantity.Text.Split(':')[1]),
                    StylesQuantity = int.Parse(lblStylesQuantity.Text.Split(':')[1]),
                    Type = "Box",
                    TotalAmount = decimal.Parse(lblTotalAmount.Text.Split(':')[1]),
                    ImageUrl = imgbox.ImageUrl.ToString(),
                    IsSelected = bool.Parse(imgbox.ToolTip.ToString())
                };
                containerBoxList.Add(boxContainer);
            }
            return containerBoxList;
        }

        protected void btnRemoveSack_Click(object sender, EventArgs e)
        {
            List<Container> containerSackList = new List<Container>();
            List<Container> selectedSacksToRemove = new List<Container>();
            List<Container> containerBoxList = boxesContainer();
            foreach (RepeaterItem rptrItem in this.rptrSacks.Items)
            {
                CheckBox chkBox = (CheckBox)rptrItem.FindControl("chkBox");
                Label lblItemsQuantity = (Label)rptrItem.FindControl("lblItemsQuantity");
                Label lblStylesQuantity = (Label)rptrItem.FindControl("lblStylesQuantity");
                Label lblTotalAmount = (Label)rptrItem.FindControl("lblTotalAmount");
                Image imgSack = (Image)rptrItem.FindControl("imgSack");
                Container boxContainer = new Container
                {
                    BoxNumber = chkBox.ToolTip,
                    ItemsQuantity = int.Parse(lblItemsQuantity.Text.Split(':')[1]),
                    StylesQuantity = int.Parse(lblStylesQuantity.Text.Split(':')[1]),
                    Type = "Sack",
                    ImageUrl = imgSack.ImageUrl,
                    IsSelected = bool.Parse(imgSack.ToolTip),
                    TotalAmount = decimal.Parse(lblTotalAmount.Text.Split(':')[1])
                };
                if (chkBox.Checked)
                {
                    selectedSacksToRemove.Add(boxContainer);
                }
                containerSackList.Add(boxContainer);
            }

            foreach (Container container in selectedSacksToRemove)
            {
                containerSackList.RemoveAll(s => s.BoxNumber == container.BoxNumber);
            }
            this.chkSackList.Items.Clear();
            string activeContainer = string.Empty;
            if (containerSackList.Count > 0)
            {
                foreach (var item in containerSackList)
                {
                    string chkValue = item.BoxNumber.Split(':')[1];
                    chkSackList.Items.Add(new ListItem(chkValue, chkValue));
                    if (item.IsSelected)
                    {
                        activeContainer = chkValue;
                    }
                }
                if (!string.IsNullOrEmpty(activeContainer))
                {
                    chkSackList.SelectedValue = activeContainer;
                }
            }
            else
            {
                btnRemoveSack.Visible = false;
                pnlChkSackList.Visible = false;
            }
            rptrSacks.DataSource = containerSackList;
            rptrSacks.DataBind();
            reFetchSelectedStyleForSacksAffectedByRemovingSack(selectedSacksToRemove);
        }

        protected void btnAddSack_Click(object sender, EventArgs e)
        {
            pnlSelectedStyleForSacks.Visible = true;
            List<Container> containerSackList = sacksContainer();
            List<Container> containerBoxList = boxesContainer();
            int sacksCount = containerSackList.Count;
            int lastSackNumber = 0;
            if (sacksCount > 0)
            {
                lastSackNumber = int.Parse(containerSackList.Max(s => s.BoxNumber.Split(':')[1])) + 1;
            }
            else
            {
                lastSackNumber = (lastSackNumber + 1);
            }
            Container newContainer = new Container
            {
                BoxNumber = "SACK#:" + (lastSackNumber),
                ImageUrl = Constant.ActiveSackImageUrl,
                ItemsQuantity = 0,
                StylesQuantity = 0,
                TotalAmount = 0,
                Type = "Box",
                IsSelected = true
            };

            foreach (var box in containerSackList)
            {
                box.IsSelected = false;
                box.ImageUrl = Constant.SackImageUrl;
            }
            containerSackList.Add(newContainer);
            chkSackList.Items.Clear();
            if (containerSackList.Count > 0)
            {
                foreach (var item in containerSackList)
                {
                    chkSackList.Items.Add(new ListItem(item.BoxNumber.Split(':')[1], item.BoxNumber.Split(':')[1]));
                }
                chkSackList.SelectedValue = lastSackNumber.ToString();
                chkBoxList.SelectedIndex = -1;
                this.btnRemoveSack.Visible = true;
                this.pnlChkSackList.Visible = true;
            }
            this.rptrSacks.DataSource = containerSackList;
            rptrSacks.DataBind();

            foreach (var box in containerBoxList)
            {
                box.ImageUrl = Constant.BoxImageUrl;
                box.IsSelected = false;
            }
            this.rptrBoxes.DataSource = containerBoxList;
            rptrBoxes.DataBind();
        }

        protected void gvStyles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearchStyleNumber.Text))
            {
                POLManager.SearchStyles(SqlDataSourceStyles, txtSearchStyleNumber.Text, hfFromBrand.Value);
            }
        }

        protected void chkBoxList_SelectedIndexChanged(object sender, EventArgs e)
        {
            chkSackList.SelectedIndex = -1;
            List<Container> containerBoxList = boxesContainer();
            List<Container> containerSackList = sacksContainer();
            foreach (var box in containerBoxList)
            {
                if (chkBoxList.SelectedValue == box.BoxNumber.Split(':')[1])
                {
                    box.IsSelected = true;
                    box.ImageUrl = Constant.ActiveBoxImageUrl;
                }
                else
                {
                    box.IsSelected = false;
                    box.ImageUrl = Constant.BoxImageUrl;
                }
            }

            rptrBoxes.DataSource = containerBoxList;
            rptrBoxes.DataBind();

            foreach (var sack in containerSackList)
            {
                sack.ImageUrl = Constant.SackImageUrl;
                sack.IsSelected = false;
            }
            this.rptrSacks.DataSource = containerSackList;
            rptrSacks.DataBind();
        }

        protected void chkSackList_SelectedIndexChanged(object sender, EventArgs e)
        {
            chkBoxList.SelectedIndex = -1;
            List<Container> containerBoxList = boxesContainer();
            List<Container> containerSackList = sacksContainer();
            foreach (var box in containerBoxList)
            {
                box.ImageUrl = Constant.BoxImageUrl;
                box.IsSelected = false;
            }

            rptrBoxes.DataSource = containerBoxList;
            rptrBoxes.DataBind();

            foreach (var sack in containerSackList)
            {
                if (chkSackList.SelectedValue == sack.BoxNumber.Split(':')[1])
                {
                    sack.IsSelected = true;
                    sack.ImageUrl = Constant.ActiveSackImageUrl;
                }
                else
                {
                    sack.IsSelected = false;
                    sack.ImageUrl = Constant.SackImageUrl;
                }

            }
            this.rptrSacks.DataSource = containerSackList;
            rptrSacks.DataBind();
        }

        protected void btnAddSelected_Click(object sender, EventArgs e)
        {
            try
            {
                IList<PullOutLetterDetail> BoxItems = getSelectedStylesForBoxes();
                IList<ITEM> BoxesStyles = new List<ITEM>();
                List<StylePrice> BOX_PRICES = new List<StylePrice>();

                IList<PullOutLetterDetail> SackItems = getSelectedStylesForSacks();
                IList<ITEM> SacksStyles = new List<ITEM>();
                List<StylePrice> SACK_PRICES = new List<StylePrice>();

                List<Container> boxContainers = boxesContainer();
                List<Container> sackContainers = sacksContainer();

                long totalQty = long.Parse(txtTotalQTY.Text);
                long totalBoxContainersQty = BoxItems.Sum(b => b.Quantity);
                long totalSackContainersQty = SackItems.Sum(s => s.Quantity);
                long totalContainersQty = (totalBoxContainersQty + totalSackContainersQty);

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

                        //for boxes
                        if (chkBoxList.Items.Count > 0)
                        {
                            for (int i = 0; i < chkBoxList.Items.Count; i++)
                            {
                                if (chkBoxList.Items[i].Selected)
                                {
                                    ITEM style = new ITEM
                                    {
                                        APType = chkIsLostTag.Checked.ToString(),
                                        Brand = hfFromBrand.Value,
                                        CostPrice = decimal.Parse(txtQuantity.Text), //as quantity
                                        Description = row.Cells[4].Text,
                                        StyleNumber = row.Cells[2].Text,
                                        Box = int.Parse(chkBoxList.Items[i].Value)
                                    };
                                    if (!isAlreadySelected(BoxItems, style.StyleNumber, int.Parse(chkBoxList.Items[i].Value)))
                                    {
                                        BoxesStyles.Add(style);
                                    }
                                }
                            }
                        }


                        //for sacks
                        if (chkSackList.Items.Count > 0)
                        {
                            for (int i = 0; i < this.chkSackList.Items.Count; i++)
                            {
                                if (chkSackList.Items[i].Selected)
                                {
                                    ITEM style = new ITEM
                                    {
                                        APType = chkIsLostTag.Checked.ToString(),
                                        Brand =hfFromBrand.Value,
                                        CostPrice = decimal.Parse(txtQuantity.Text), //as quantity
                                        Description = row.Cells[4].Text,
                                        StyleNumber = row.Cells[2].Text,
                                        Box = int.Parse(chkSackList.Items[i].Value)
                                    };
                                    if (!isAlreadySelected(SackItems, style.StyleNumber, int.Parse(chkSackList.Items[i].Value)))
                                    {
                                        SacksStyles.Add(style);
                                    }
                                }
                            }
                        }

                    }
                }

                if (totalQty > totalContainersQty)
                {
                    this.lblErrorMessage.Text = "";
                    this.hfErrorModalHandLer_ModalPopupExtender.Show();
                    return;
                }


                //for boxes
                if (chkBoxList.Items.Count > 0)
                {
                    foreach (ITEM item_ in BoxesStyles)
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
                            BOX_PRICES.Add(price_);
                        }
                        else
                        {
                            price_ = getSRP(item_, price_);
                            BOX_PRICES.Add(price_);
                        }
                    }

                    foreach (StylePrice price_ in BOX_PRICES)
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
                            ContainerType = "BOX",
                            PullOutLetterCode = hfPullOutLetterCode.Value
                        };
                        BoxItems.Add(pd);
                    }

                    gvSelectedStyles.DataSource = BoxItems.OrderBy(s => s.ContainerNumber).ThenBy(s => s.StyleNumber);
                    gvSelectedStyles.DataBind();
                }
                //for sacks
                if (chkSackList.Items.Count > 0)
                {
                    foreach (ITEM item_ in SacksStyles)
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
                            SACK_PRICES.Add(price_);
                        }
                        else
                        {
                            price_ = getSRP(item_, price_);
                            SACK_PRICES.Add(price_);
                        }
                    }

                    foreach (StylePrice price_ in SACK_PRICES)
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
                            ContainerType = "SACK",
                            PullOutLetterCode = hfPullOutLetterCode.Value
                        };
                        SackItems.Add(pd);
                    }

                    this.gvSelectedStylesForSacks.DataSource = SackItems.OrderBy(s => s.ContainerNumber).ThenBy(s => s.StyleNumber);
                    gvSelectedStylesForSacks.DataBind();
                }
                uncheckSelectedStyles();
                #endregion
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
                hfErrorModalHandLer_ModalPopupExtender.Show();
                //throw;
            }
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

        protected void btnRemoveSelected_Click(object sender, EventArgs e)
        {
            IList<PullOutLetterDetail> selectedItemsForBoxes = getSelectedStylesForBoxes();
            IList<PullOutLetterDetail> selectedItemsForSacks = getSelectedStylesForSacks();
            gvSelectedStyles.DataSource = selectedItemsForBoxes.OrderBy(s => s.ContainerNumber).ThenBy(s => s.StyleNumber);
            gvSelectedStyles.DataBind();
            gvSelectedStylesForSacks.DataSource = selectedItemsForSacks.OrderBy(s => s.ContainerNumber).ThenBy(s => s.StyleNumber);
            gvSelectedStylesForSacks.DataBind();
            uncheckSelectedStyles();
        }

        private void uncheckSelectedStyles()
        {
            CheckBox chkAll = (CheckBox)gvStyles.HeaderRow.FindControl("chkAll");
            chkAll.Checked = false;
            foreach (GridViewRow row in this.gvStyles.Rows)
            {
                CheckBox chkItem = (CheckBox)row.FindControl("chkItems");
                chkItem.Checked = false;
            }
            countStylesPerContainers();
        }

        /// <summary>
        /// Container Items Counter
        /// </summary>
        private void countStylesPerContainers()
        {
            countStylesSummaries(getSelectedStylesForBoxes(),
                "Box", lblStylesSelectedCount, rptrBoxes, gvSelectedStyles, boxesContainer());
            countStylesSummaries(getSelectedStylesForSacks(),
                "Sack", this.lblStylesSelectedForSacksCount, rptrSacks, gvSelectedStylesForSacks, sacksContainer());
        }

        /// <summary>
        /// Count Style Summary for every Containers
        /// </summary>
        /// <param name="pullOutDetails"></param>
        /// <param name="containerType"></param>
        /// <param name="lblCounter"></param>
        /// <param name="rptrContainer"></param>
        /// <param name="selectedStyles"></param>
        /// <param name="containers"></param>
        private void countStylesSummaries(IList<PullOutLetterDetail> pullOutDetails,
            string containerType, Label lblCounter, Repeater rptrContainer, GridView selectedStyles, List<Container> containers)
        {
            List<Container> containerList = new List<Container>();
            long totalQuantity = 0;
            long quantityPerContainer = 0;
            decimal totalAmount = 0;
            int styleQuantity = 0;
            string imageUrl = string.Empty;
            if (containerType == "Box")
            {
                imageUrl = "~/Resources/Box64.png";
            }
            else
            {
                imageUrl = "~/Resources/Sack64.png";
            }
            foreach (var container in containers)
            {
                var result = (from style in pullOutDetails
                              where style.ContainerNumber == int.Parse(container.BoxNumber.Split(':')[1])
                              select style).ToList();
                quantityPerContainer = result.Sum(s => s.Quantity);

                totalAmount = result.Sum(s => s.TtlAmount);
                totalQuantity += quantityPerContainer;
                styleQuantity = result.Count;
                Container container_ = new Container
                {
                    BoxNumber = container.BoxNumber,
                    ItemsQuantity = quantityPerContainer,
                    StylesQuantity = styleQuantity,
                    TotalAmount = totalAmount
                     ,
                    ImageUrl = container.ImageUrl,
                    IsSelected = container.IsSelected,
                    Type = containerType
                };
                containerList.Add(container_);
            }

            lblCounter.Text = "COUNT: " + selectedStyles.Rows.Count.ToString() + "/" + totalQuantity;
            rptrContainer.DataSource = containerList;
            rptrContainer.DataBind();
        }

        protected void btnSaveYes_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    bool PLType = false;
            //    if (rdioPLType.SelectedIndex == 1)
            //    {
            //        PLType = true;
            //    }
            //    int totalBoxStyleQty = int.Parse(lblStylesSelectedCount.Text.Split('/')[1]);
            //    int totalSackStyleQty = int.Parse(lblStylesSelectedForSacksCount.Text.Split('/')[1]);
            //    int totalStyleQty = totalBoxStyleQty + totalSackStyleQty;
            //    PullOutLetter newPullOutLetter = new PullOutLetter
            //    {
            //        AccountName = txtAccountName.Text,
            //        BranchDepartmentCode = txtBranchDepartmentCodePreview.Text,
            //        BranchName = txtBranchName.Text,
            //        BrandCode = hfBrandCode.Value,
            //        BrandDepartmentCode = txtBrandDepartmentCodePreview.Text,
            //        BrandName = txtBrand.Text,
            //        CompanyName = txtOuletStore.Text,
            //        CustomerNumber = long.Parse(hfCustomerNumber.Value),
            //        ForSM = true,
            //        Forwarders = "Not Assigned",
            //        IsActive = true,
            //        LetterStatus = LetterStatus.PENDING.ToString(),
            //        PullOutCode = hfPullOutLetterCode.Value,
            //        PulloutDate = DateTime.Parse(txtPullOutDate.Text),
            //        SeriesNumber = generateSeriesNumber(txtBranchDepartmentCodePreview.Text, lastPullOutLetterIdentity)[0],
            //        TransactionDate = DateTime.UtcNow,
            //        IsBackLoad = PLType,
            //        TotalQuantity = totalStyleQty
            //    };
            //    POLManager.Save(newPullOutLetter);
            //    POLDetailManager.Save(getSelectedStylesForBoxes().ToList());
            //    POLDetailManager.Save(getSelectedStylesForSacks().ToList());
            //    hfSuccessfulModalHandler_ModalPopupExtender.Show();
            //}
            //catch (Exception ex)
            //{

            //    throw ex;
            //}
        }
    }
}