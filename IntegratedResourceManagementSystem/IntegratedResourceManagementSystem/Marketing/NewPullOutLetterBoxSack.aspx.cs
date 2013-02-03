using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IRMS.Entities.view;
using System.Data;
using System.Configuration;
using IRMS.Components;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class NewPullOutLetterBoxSack : System.Web.UI.Page
    {
        #region variables
        BrandManager BrandManager = new BrandManager();
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager();
        PullOutLetterSummaryManager POLSummaryManager = new PullOutLetterSummaryManager();
        PriceManager PManager = new PriceManager();
        PricePointManager PricePointManager = new PricePointManager();
        BrandDepartmentCodeManager BrandDeptCodeManager = new BrandDepartmentCodeManager();
        BranchDepartmentCodeManager BranchDeptCodeManager = new BranchDepartmentCodeManager();
        ForwarderManager ForwarderManager = new ForwarderManager();
        private string VENDORCODE { get { return ConfigurationManager.AppSettings["VENDOR_CODE"]; } }
        private static Random random = new Random();
        private int lastPullOutLetterIdentity { get { return POLManager.lastPullOutLetterIdentity(txtBrand.Text); } }
        #endregion
        protected void Page_Init(object sender, EventArgs e)
        {
            
            hfPullOutLetterCode.Value = Security.CreateCode(25, random);
            txtPullOutDate.Text = DateTime.UtcNow.ToShortDateString();
            initializedBrandList();
        }

        private void initializedBrandList()
        {
            DDLCustomerBrands.Items.Clear();
            DDLCustomerBrands.Items.Add(new ListItem("-SELECT BRAND-", ""));
            foreach (Brand brand in BrandManager.Brands())
            {
                DDLCustomerBrands.Items.Add(new ListItem(brand.BrandDescription, brand.BrandDescription));
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        private bool IsAlreadySelected(IList<PullOutLetterDetail> selectedItems, string StyleNumber)
        {
            bool result = false;
            foreach (PullOutLetterDetail item_ in selectedItems)
            {
                if (item_.StyleNumber == StyleNumber)
                {
                    result = true;
                    break;
                }
            }
            return result;
        }

        protected void btnSelectCustomer_Click(object sender, EventArgs e)
        {
            int customerNumber = int.Parse(gvCustomers.SelectedValue.ToString());
            txtBrand.Text = gvCustomers.SelectedDataKey[2].ToString();

            hfLastPullOutLetterNumber.Value = lastPullOutLetterIdentity.ToString();

            txtOuletStore.Text = gvCustomers.SelectedDataKey[1].ToString();
            hfAreaGroupNo.Value = gvCustomers.SelectedDataKey[5].ToString();
            hfCustomerNumber.Value = gvCustomers.SelectedValue.ToString();
            hfPGMDNo.Value = gvCustomers.SelectedDataKey[3].ToString();
            hfPGNo.Value = gvCustomers.SelectedDataKey[4].ToString();
            hfSubAreaGroupNo.Value = gvCustomers.SelectedDataKey[6].ToString();
            string brandName = txtBrand.Text;
            hfBrandCode.Value = BrandManager.GetBrandByBrandName(brandName).BrandCode;
            txtBranchName.Text = POLManager.GetBranchNameByCustomerNumber(customerNumber);
            txtAccountName.Text = POLManager.GetAccountNameByCustomerNumber(customerNumber);
           
                txtSeriesNumber.Text = generateSeriesNumber(int.Parse(hfLastPullOutLetterNumber.Value))[1];

            chkSummaryPerContainer.Enabled = true;
            btnSave.Enabled = true;
        }

        protected void gvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            btnBrowseStoreOutlet_ModalPopupExtender.Show();
        }

        protected void gvCustomers_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            btnBrowseStoreOutlet_ModalPopupExtender.Show();
        }

        protected void gvCustomers_Sorting(object sender, GridViewSortEventArgs e)
        {
            btnBrowseStoreOutlet_ModalPopupExtender.Show();
        }

        protected void DDLCustomerBrands_SelectedIndexChanged(object sender, EventArgs e)
        {
            POLManager.SearchCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text, DDLCustomerBrands.SelectedValue);
            btnBrowseStoreOutlet_ModalPopupExtender.Show();
        }

        protected void iBtnSearchCustomer_Click(object sender, ImageClickEventArgs e)
        {
            POLManager.SearchCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text, DDLCustomerBrands.SelectedValue);
            btnBrowseStoreOutlet_ModalPopupExtender.Show();
        }

        protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnSelectCustomer.Enabled = true;
        }

        protected void rdioBoxOrSack_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdioBoxOrSack.SelectedIndex ==0)
            {
                imgBoxOrSack.ImageUrl = "~/Resources/Box64.png";
            }
            else
            {
                imgBoxOrSack.ImageUrl = "~/Resources/Sack64.png";
            }
            btnAddNewBox_ModalPopupExtender.Show();
        }

        protected void gvContainers_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnRemoveContainer.Enabled = true;
        }

        private void countTotalQuantities(List<Container> containers,bool reset=false  )
        {
            if (reset)
            {
                lblTotalQTY.Text = "TOTAL QTY: 0 | ";
                lblTotalBox.Text = "TOTAL BOXES:[0/]";
                lblTotalSack.Text = "TOTAL SACKS:[0/] |";
                txtTotalQtySummary.Text = "0";
            }
            else
            {
                long totalQTY = containers.Sum(s => s.ItemsQuantity);
                if (totalQTY>0)
                {
                    txtTotalQtySummary.Text = totalQTY.ToString("###,###");
                }
                else
                {
                    txtTotalQtySummary.Text = "0";
                }
                lblTotalQTY.Text = "TOTAL QTY: " + totalQTY.ToString("###,###") + "| ";
                lblTotalBox.Text = "TOTAL BOXES: [" + containers.Where(s => s.Type == "Box").Count() + "/"
                    + containers.Where(s => s.Type == "Box").Sum(s => s.ItemsQuantity).ToString("###,###") + "]";
                lblTotalSack.Text = "TOTAL SACKS: " + containers.Where(s => s.Type == "Sack").Count() + "/"
                    + containers.Where(s => s.Type == "Sack").Sum(s => s.ItemsQuantity).ToString("###,###") + "] |";
             
            }
        }

        private List<Container> containerList()
        {
            List<Container> containers = new List<Container>();
            foreach (GridViewRow  row in gvContainers.Rows)
            {
                Image imgContainer = (Image)row.FindControl("imgContainer");
                Container container = new Container
                {
                    BoxNumber = row.Cells[1].Text,
                    ImageUrl = imgContainer.ImageUrl,
                    ItemsQuantity =int.Parse(row.Cells[2].Text),
                    Type = row.Cells[3].Text
                };
                containers.Add(container);
            }
            return containers ?? new List<Container>();
        }

        protected void btnAddContainer_Click(object sender, EventArgs e)
        {
            List<Container> containers = containerList();
            string containerLastNumber = "0";
            containerLastNumber = containers.Where(s => s.Type == rdioBoxOrSack.SelectedValue).Max(s => s.BoxNumber)?? "0";
            Container newContainer = new Container
            {
              BoxNumber = (int.Parse(containerLastNumber)+1).ToString(),
              ImageUrl = imgBoxOrSack.ImageUrl ,
              Type = rdioBoxOrSack.SelectedValue,
              ItemsQuantity = int.Parse(txtTotalQty.Text),
            };
            containers.Add(newContainer);
            gvContainers.DataSource = containers.OrderBy(s=>s.Type).ThenBy(s=>s.BoxNumber);
            gvContainers.DataBind();
            countTotalQuantities(containers);
        }

        protected void btnRemoveContainer_Click(object sender, EventArgs e)
        {
            List<Container> containers = containerList();
            Container conTainerToRemove = new Container
            {
                 BoxNumber = gvContainers.SelectedRow.Cells[1].Text
                 , Type = gvContainers.SelectedRow.Cells[3].Text
            };
            containers.RemoveAll(s=>s.BoxNumber == conTainerToRemove.BoxNumber && s.Type ==conTainerToRemove.Type);
            gvContainers.DataSource = containers.OrderBy(s => s.Type).ThenBy(s => s.BoxNumber);
            gvContainers.DataBind();
            countTotalQuantities(containers);
        }

        protected void btnResetContainers_Click(object sender, EventArgs e)
        {
            countTotalQuantities(new List<Container>(),true);
            gvContainers.DataBind();
        
        }

        protected void rdioPLType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void chkSummaryPerContainer_CheckedChanged(object sender, EventArgs e)
        {
            if (chkSummaryPerContainer.Checked)
            {
                pnlStylesSelection.Visible = true;
                txtTotalQtySummary.ReadOnly = true;
                txtTotalQtySummary.Text = "0";
            }
            else
            {
                pnlStylesSelection.Visible = false;
                txtTotalQtySummary.ReadOnly = false;
            }
        }

        protected void btnSaveYes_Click(object sender, EventArgs e)
        {
            if (txtTotalQtySummary.Text =="0")
            {
                lblErrorMessage.Text = "Cannot Save Letter with 0 total quantity.";
                hfErrorModalHandLer_ModalPopupExtender.Show();
            }
            bool isBackLoad = false;
            if (rdioPLType.SelectedValue =="BL")
            {
                isBackLoad = true;
            }
           
            PullOutLetter newPullOutLetter = new PullOutLetter
            {
                AccountName = txtAccountName.Text,
                Forwarders ="Not Assigned",
                BranchDepartmentCode = "N/A",
                BranchName = txtBranchName.Text,
                BrandCode = hfBrandCode.Value,
                BrandDepartmentCode = "N/A",
                BrandName = txtBrand.Text ,
                CompanyName = txtOuletStore.Text ,
                CustomerNumber =long.Parse( hfCustomerNumber.Value),
                ForSM = false,
                IsActive = true ,
                IsBackLoad= isBackLoad ,
                LetterStatus = LetterStatus.PENDING.ToString(),
                PullOutCode = hfPullOutLetterCode.Value ,
                PulloutDate = DateTime.Parse(txtPullOutDate.Text),
                SeriesNumber =generateSeriesNumber(lastPullOutLetterIdentity)[0] ,
                TotalQuantity =int.Parse(txtTotalQtySummary.Text),
                TransactionDate = DateTime.UtcNow
            };
            POLManager.Save(newPullOutLetter);
            if (chkSummaryPerContainer.Checked)
            {
                POLSummaryManager.Save(pullLetterSummaries());
            }
            hfSuccessfulModalHandler_ModalPopupExtender.Show();
        }

        private string[] generateSeriesNumber(int lastRecordNumber)
        {
            string[] series =new string[2];
            series[0] = VENDORCODE+ "-" + lastRecordNumber.ToString("00000000");
            series[1] = VENDORCODE+ "-" + " --------";
            return series;
        }

        private List<PullOutLetterSummary> pullLetterSummaries()
        {
            List<PullOutLetterSummary> summaries = new List<PullOutLetterSummary>();
            List<Container> containers = containerList();
            foreach (var item in containers)
            {
                PullOutLetterSummary polSum = new PullOutLetterSummary
                {
                    ContainerNumber = int.Parse(item.BoxNumber),
                    ContainerType = item.Type,
                    PullOutCode = hfPullOutLetterCode.Value,
                    TotalQuantity = (int)item.ItemsQuantity
                };
                summaries.Add(polSum);
            }
            return summaries ?? new List<PullOutLetterSummary>();
        }
    }
}