using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;
using IRMS.Entities.view;
using IRMS.Components;
using IRMS.BusinessLogic.Manager;
using System.Configuration;
using IntegratedResourceManagementSystem.Shared;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class PullOutLetterSummaryUpdate : System.Web.UI.Page
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
        #endregion
        protected void Page_Init(object sender, EventArgs e)
        {
            hfPullOutLetterCode.Value = Request.QueryString["PullOutCode"];
            initializeDataToUpdate();
        }

        private void initializeDataToUpdate()
        {
           int pullOutId = int.Parse(Request.QueryString["PullOutId"]);
           PullOutLetter POL= POLManager.FetchById(pullOutId);
           if (POL.IsBackLoad)
           {
               rdioPLType.SelectedIndex = 0;
           }
           else
           {
               rdioPLType.SelectedIndex = 1;
           }

           txtPullOutDate.Text = POL.PulloutDate.ToShortDateString();
           txtSeriesNumber.Text = POL.SeriesNumber;
           txtOuletStore.Text = POL.CompanyName;
           txtAccountName.Text = POL.AccountName;
           txtBranchName.Text = POL.BranchName;
           txtBrand.Text = POL.BrandName;
           txtTotalQtySummary.Text = POL.TotalQuantity.ToString("###,###");
           gvContainers.DataSource = containerList();
           gvContainers.DataBind();
           hpLinlUpdateForwarder.NavigateUrl = "~/Marketing/UpdatePullOutLetterForwarder.aspx?PullOutId=" + POL.RecordNumber + "&mode=summary"; ;
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

        protected void rdioBoxOrSack_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdioBoxOrSack.SelectedIndex == 0)
            {
                imgBoxOrSack.ImageUrl = Constant.BoxImageUrl;
            }
            else
            {
                imgBoxOrSack.ImageUrl =Constant.SackImageUrl;
            }
            btnAddNewBox_ModalPopupExtender.Show();
        }

        protected void gvContainers_SelectedIndexChanged(object sender, EventArgs e)
        {
            imgBoxOrSackUpdate.ImageUrl = gvContainers.SelectedDataKey[2].ToString();
            txtTotalQTYUpdate.Text = gvContainers.SelectedDataKey[1].ToString();
            btnRemoveContainer.Enabled = true;
        }

        private void countTotalQuantities(List<Container> containers, bool reset = false)
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
                if (totalQTY > 0)
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
            var summaries = POLSummaryManager.FetchAll().Where(s => s.PullOutCode == hfPullOutLetterCode.Value);
            foreach (var summary in summaries)
            {
                string imgUrl = string.Empty;
                if (summary.ContainerType =="Box")
                {
                    imgUrl = Constant.BoxImageUrl;
                }
                else
                {
                    imgUrl = Constant.SackImageUrl;
                }
                Container container = new Container
                {
                    BoxNumber =summary.ContainerNumber.ToString(),
                    ImageUrl = imgUrl,
                    ItemsQuantity = summary.TotalQuantity,
                    Type = summary.ContainerType,
                     StylesQuantity = summary.RecordNumber, // as recordNumber container field
                };
                containers.Add(container);
            }
            return containers ?? new List<Container>();
        }

        protected void btnAddContainer_Click(object sender, EventArgs e)
        {
            List<Container> containers = containerList();
            string containerLastNumber = "0";
            containerLastNumber = containers.Where(s => s.Type == rdioBoxOrSack.SelectedValue).Max(s => s.BoxNumber) ?? "0";

            PullOutLetterSummary newPOLSummary = new PullOutLetterSummary
            {
                 ContainerNumber = int.Parse(containerLastNumber),
                 ContainerType = rdioBoxOrSack.SelectedValue, 
                 PullOutCode = hfPullOutLetterCode.Value,
                 TotalQuantity = int.Parse(txtTotalQty.Text),                     
            };
            POLSummaryManager.Save(newPOLSummary);
            int pullOutId = int.Parse(Request.QueryString["PullOutId"]);
            PullOutLetter POL = POLManager.FetchById(pullOutId);
            POL.TotalQuantity = int.Parse(txtTotalQtySummary.Text)+int.Parse(txtTotalQty.Text);
            POLManager.Save(POL);
            gvContainers.DataSource = containerList().OrderBy(s => s.Type).ThenBy(s => s.BoxNumber);
            gvContainers.DataBind();
            countTotalQuantities(containerList());
        }

        protected void btnRemoveContainer_Click(object sender, EventArgs e)
        {
            PullOutLetterSummary polSumToDelete = new PullOutLetterSummary
            {
                 RecordNumber =int.Parse(gvContainers.SelectedValue.ToString()),
                 TotalQuantity = int.Parse(gvContainers.SelectedDataKey[1].ToString())
            };
            POLSummaryManager.Delete(polSumToDelete);
            List<Container> containers = containerList();
            int pullOutId = int.Parse(Request.QueryString["PullOutId"]);
            PullOutLetter POL = POLManager.FetchById(pullOutId);
            POL.TotalQuantity -= polSumToDelete.TotalQuantity;
            POLManager.Save(POL);
            gvContainers.DataSource = containerList().OrderBy(s => s.Type).ThenBy(s => s.BoxNumber);
            gvContainers.DataBind();
            countTotalQuantities(containerList());
        }

        protected void rdioPLType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSaveYes_Click(object sender, EventArgs e)
        {
            if (txtTotalQtySummary.Text == "0")
            {
                lblErrorMessage.Text = "Cannot Save Letter with 0 total quantity.";
                hfErrorModalHandLer_ModalPopupExtender.Show();
            }
            bool isBackLoad = false;
            if (rdioPLType.SelectedValue == "BL")
            {
                isBackLoad = true;
            }
            int pullOutId = int.Parse(Request.QueryString["PullOutId"]);
            PullOutLetter POLToUpdate = POLManager.FetchById(pullOutId);
                POLToUpdate.IsBackLoad = isBackLoad;
                POLToUpdate.LetterStatus = LetterStatus.PENDING.ToString();
                POLToUpdate.PulloutDate = DateTime.Parse(txtPullOutDate.Text);
                POLToUpdate.TransactionDate = DateTime.UtcNow;
                POLManager.Save(POLToUpdate);
            hfSuccessfulModalHandler_ModalPopupExtender.Show();
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

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            PullOutLetterSummary newPOLSummary = new PullOutLetterSummary
            {
                ContainerNumber = int.Parse(gvContainers.SelectedDataKey[3].ToString()),
                ContainerType = rdioBoxOrSack.SelectedValue,
                PullOutCode = hfPullOutLetterCode.Value,
                TotalQuantity = int.Parse(this.txtTotalQTYUpdate.Text),
                 RecordNumber = int.Parse(gvContainers.SelectedValue.ToString())
            };
            POLSummaryManager.Save(newPOLSummary);
            gvContainers.DataSource = containerList().OrderBy(s => s.Type).ThenBy(s => s.BoxNumber);
            gvContainers.DataBind();
            int pullOutId = int.Parse(Request.QueryString["PullOutId"]);
            PullOutLetter POL = POLManager.FetchById(pullOutId);
            POL.TotalQuantity =(int)containerList().Sum(s => s.ItemsQuantity);
            POLManager.Save(POL);
            countTotalQuantities(containerList());
        }
    }
}