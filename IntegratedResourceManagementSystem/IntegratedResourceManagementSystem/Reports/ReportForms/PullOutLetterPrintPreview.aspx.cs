﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;
using IRMS.Entities.view;

namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class PullOutLetterPrintPreview : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager();
        CompanyManager CompanyManager = new CompanyManager();
        PullOutLetterSummaryManager POLSummaryManager = new PullOutLetterSummaryManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            hpLinkPreviewDetails.Visible = true;
            int PullOutId =int.Parse(Request.QueryString["PullOutId"]);
            lblDate.Text = DateTime.UtcNow.ToString("MMMM dd, yyyy");
            lblSeriesNumber.Text = Request.QueryString["PullOutSeries"];
            PullOutLetter pullOutLetter = POLManager.FetchById(PullOutId);


            lblDepartmentCode.Text = "Dept. Code: " + pullOutLetter.BrandDepartmentCode;
            lblTo.Text = pullOutLetter.CompanyName;
            lblBranch.Text= pullOutLetter.BranchName+" BRANCH";
            lblBrand.Text = pullOutLetter.BrandName;
            lblAttention.Text = "STORE CONSIGNOR MANAGER";
            lblBrandLetter.Text = pullOutLetter.BrandName;
            lblTotalQuantity.Text = pullOutLetter.TotalQuantity.ToString("###,###");
            lblPullOutDate.Text = pullOutLetter.PulloutDate.ToString("MMMM dd, yyyy");
            lblCompanyName.Text = CompanyManager.GetComapnyByKey((int)pullOutLetter.CustomerNumber).CompanyName;
            //update init
            txtAttnChange.Text = lblAttention.Text;
            txtChangeTo.Text = lblTo.Text;
            txtBrandGeneralManager.Text = lblBrandGeneralManager.Text;
            //

            txtMrktAssUpdate.Text = "Dhel Cruz / Mr. Alberto San Gregorio";
            if (pullOutLetter.IsBackLoad)
            {
                chkBackLoad.Checked = true;
            }
            else
            {
                chkCT.Checked = true;
                pnlCut.CssClass  = "pnlCut";
            }

            List<PullOutLetterDetail> POLDetails = POLDetailManager.PullOutLetterDetailsByPullOutCode(pullOutLetter.PullOutCode);
            List<PullOutLetterSummary> POLSummaries = POLSummaryManager.PullOutLetterSummariesByPullOutCode(pullOutLetter.PullOutCode);
            if (POLDetails.Count > 0)
            {
                if (POLDetails.Count <=10)
                {
                    long  totalQty = 0;
                    decimal totalAmount = 0;
                    gvStyles.DataSource = POLDetails;
                    gvStyles.DataBind();
                    foreach (var pold in POLDetails)
                    {
                        totalQty += pold.Quantity;
                        totalAmount += pold.TtlAmount;
                    }
                    lblTotalQtyStyles.Text = totalQty.ToString();
                    lblTotalAmount.Text = totalAmount.ToString("###,###.00");
                    pnlSummary.Visible = true;
                }
                else
                {
                    pnlSummary.Visible = false;
                }
                hpLinkPreviewDetails.NavigateUrl = "~/Reports/ReportForms/PullOutLetterDetailsPrintPreview.aspx?PullOutCode="
                  + pullOutLetter.PullOutCode + "&Customer=" + lblTo.Text + "&Branch=" + lblBranch.Text + "&Series=" + lblSeriesNumber.Text + "&CustomerId=" + pullOutLetter.CustomerNumber;
            }
            else
            {
                pnlSummary.Visible = false;
                if (POLSummaries.Count > 0)
                {
                    hpLinkPreviewDetails.NavigateUrl = "~/Reports/ReportForms/PullOutLetterSummaryPrintPreview.aspx?PullOutCode="
                 + pullOutLetter.PullOutCode + "&Customer=" + lblTo.Text + "&Branch=" + lblBranch.Text + "&Series=" + lblSeriesNumber.Text + "&CustomerId=" + pullOutLetter.CustomerNumber;
                    Session["POL_SUMMARIES"] = POLSummaries;
                }
                else
                {
                    hpLinkPreviewDetails.Visible = false;
                }
            }

            if (pullOutLetter.Forwarders!="Not Assigned")
            {
                lblForwarder.Text = pullOutLetter.Forwarders;
                pnlForwarder.Visible = true;
                lblDepartmentCode.Visible = false;
            }
           
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveAttension_Click(object sender, EventArgs e)
        {
            lblAttention.Text = txtAttnChange.Text;
        }

        protected void btnUpdateTo_Click(object sender, EventArgs e)
        {
            lblTo.Text = txtChangeTo.Text;
        }

        protected void btnUpdateMrktAss_Click(object sender, EventArgs e)
        {
            lblMrktAss.Text = txtMrktAssUpdate.Text;
        }

        protected void gvCompanyLogos_SelectedIndexChanged(object sender, EventArgs e)
        {
            imgLogo.ImageUrl = "~/Marketing/Marketing-Admin/company-logos/" + gvCompanyLogos.SelectedValue.ToString();
            btnChangeLogo_ModalPopupExtender.Show();
        }

        protected void btnUpdateBrandGenManagerSave_Click(object sender, EventArgs e)
        {
            lblBrandGeneralManager.Text = txtBrandGeneralManager.Text;
        }
    }
}