using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IRMS.Components;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class NewTransferDetails : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager();
        PullOutLetterSummaryManager POLSummaryManager = new PullOutLetterSummaryManager();
        StockTransferManager STManager = new StockTransferManager();
        CustomerInfoManager CustomerManager = new CustomerInfoManager();
        BrandManager BrandManager = new BrandManager();
        StockTransferDetailManager STDetailsManager = new StockTransferDetailManager();
        private static Random random = new Random();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            this.hfStockTransferCode.Value = Security.CreateCode(25, random);
            int PullOutId = int.Parse(Request.QueryString["PullOutId"]);
            string PullOutCode = Request.QueryString["PullOutCode"];
            string PullOutSeriesNumber = Request.QueryString["PullOutSeries"];
           
            PullOutLetter PullOutLetter = POLManager.FetchById(PullOutId);
            txtSTDate.Text = DateTime.UtcNow.ToShortDateString();

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
           // txtTotalAmount.Text = totalAmt().ToString("###,###.00");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
              
            }
        }

        protected void DDLCustomerBrands_SelectedIndexChanged(object sender, EventArgs e)
        {
            POLManager.SearchCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text, false, hfFromBrand.Value);
            btnBrowseToCustomer_ModalPopupExtender.Show();
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
            btnSaveTransfer.Enabled = true;
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
                    TotalAmount = double.Parse(txtTotalAmount.Text)
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
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
                hfErrorModalHandLer_ModalPopupExtender.Show();
                return;
                //throw;
            }
        }

        protected void gvPullOutDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            decimal result = 0;
            foreach (GridViewRow row in gvPullOutDetails.Rows)
            {
                result += decimal.Parse(row.Cells[8].Text);
            }
            txtTotalAmount.Text = result.ToString("###,###.00");
        }

        private IList<PullOutLetterDetail> getSelectedStylesForBoxes()
        {
            IList<PullOutLetterDetail> selectedItems = new List<PullOutLetterDetail>();
            foreach (GridViewRow row in this.gvPullOutDetails.Rows)
            {
                CheckBox chkItem = (CheckBox)row.FindControl("chkItems");
                string ContainerType ="Sack";
                if (ContainerType =="BOX")
                {
                    ContainerType = "Box";
                }
                
                if (!chkItem.Checked)
                {
                    PullOutLetterDetail pd = new PullOutLetterDetail
                    {
                        ContainerNumber = int.Parse(row.Cells[3].Text),
                        StyleDescription = row.Cells[5].Text,
                        Quantity = int.Parse(row.Cells[6].Text),
                        SRP = decimal.Parse(row.Cells[7].Text),
                        StyleNumber = row.Cells[4].Text,
                        TtlAmount = decimal.Parse(row.Cells[8].Text),
                        IsLostTag = false,
                        ContainerType = ContainerType,
                        PullOutLetterCode = hfPullOutLetterCode.Value
                    };
                    selectedItems.Add(pd);
                }
            }
            return selectedItems;
        }
    }
}