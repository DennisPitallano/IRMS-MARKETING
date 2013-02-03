using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;
using IRMS.Components;
using IRMS.Entities.view;
using IRMS.BusinessLogic.Manager;
using IntegratedResourceManagementSystem.Shared;
using System.Configuration;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class PullOutLetterUpdateDefault : System.Web.UI.Page
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
            PullOutLetter POL = POLManager.FetchById(pullOutId);
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
            POLToUpdate.TotalQuantity = int.Parse(txtTotalQtySummary.Text);
            POLManager.Save(POLToUpdate);
            hfSuccessfulModalHandler_ModalPopupExtender.Show();
        }

      
    }
}