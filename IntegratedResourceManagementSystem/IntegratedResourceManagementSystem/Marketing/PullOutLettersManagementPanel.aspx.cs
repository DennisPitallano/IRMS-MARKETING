using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class PullOutLettersManagementPanel : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager();
        PullOutLetterSummaryManager POLSummaryManager = new PullOutLetterSummaryManager();
        PullOutLetter POL
        {
            get
            {
                return POLManager.FetchById(int.Parse(gvPullOutLetters.SelectedValue.ToString()));
            }
        }
        BrandManager BrandManager = new BrandManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            initBrandList();
        }
        private void initBrandList()
        {
            DDLBrands.Items.Clear();
            DDLBrands.Items.Add(new ListItem("ALL", ""));
            foreach (var brand in BrandManager.Brands())
            {
                DDLBrands.Items.Add(new ListItem(brand.BrandDescription, brand.BrandDescription));
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvPullOutLetters_SelectedIndexChanged(object sender, EventArgs e)
        {
            string pullOutCode = gvPullOutLetters.SelectedDataKey[1].ToString();
            int pullOutId = int.Parse(gvPullOutLetters.SelectedValue.ToString());
            string pullOutSeriesNumber = gvPullOutLetters.SelectedDataKey[3].ToString();
            List<PullOutLetterDetail> POLDetails = POLDetailManager.PullOutLetterDetailsByPullOutCode(pullOutCode);
            List<PullOutLetterSummary> POLSummaries = POLSummaryManager.PullOutLetterSummariesByPullOutCode(pullOutCode);
            if (POLDetails.Count > 0)
            {
                this.hpLinkUpdateContents.NavigateUrl = "~/Marketing/PullOutLetterUpdate.aspx?PullOutId=" + pullOutId + "&PullOutCode="
                  + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
            }
            else
            {
                if (POLSummaries.Count > 0)
                {
                    this.hpLinkUpdateContents.NavigateUrl = "~/Marketing/PullOutLetterSummaryUpdate.aspx?PullOutId=" + pullOutId + "&PullOutCode="
                 + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
                }
                else
                {
                    this.hpLinkUpdateContents.NavigateUrl = "~/Marketing/PullOutLetterUpdateDefault.aspx?PullOutId=" + pullOutId + "&PullOutCode="
                 + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
                }
            }
               hpLinkPrint.NavigateUrl = "~/Reports/ReportForms/PullOutLetterPrintPreview.aspx?PullOutId=" + pullOutId + "&PullOutCode="
               + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
               lblPOLToDelete.Text = "Are you sure you want to delete this <br /> POL: "+gvPullOutLetters.SelectedDataKey[3].ToString()+"?";
               DDLLetterStatus.SelectedValue = gvPullOutLetters.SelectedDataKey[4].ToString();
               btnUpdateStatus.Enabled = true;
               DDLLetterStatus.Enabled = true;
        }

        protected void btnUpdateStatus_Click(object sender, EventArgs e)
        {
            PullOutLetter POLToUpdate = POL;
            POLToUpdate.LetterStatus = DDLLetterStatus.SelectedValue;
            POLManager.Save(POLToUpdate);
            gvPullOutLetters.DataBind();
        }

        protected void btnFilterByBrand_Click(object sender, EventArgs e)
        {
            POLManager.FilterPullOutLetters(SqlDataSourcePullOutLetters, DDLBrands.SelectedValue,0);
        }

        protected void btnFilterByStatus_Click(object sender, EventArgs e)
        {
            POLManager.FilterPullOutLetters(SqlDataSourcePullOutLetters, DDLBrands.SelectedValue, DDLFilterStatus.SelectedValue,0);
        }

        protected void btnReFresh_Click(object sender, EventArgs e)
        {
            gvPullOutLetters.DataBind();
        }

        protected void gvPullOutLetters_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (!string.IsNullOrEmpty(DDLBrands.SelectedValue) || DDLFilterStatus.SelectedValue != "ALL")
            {
                POLManager.SearchPullOutLetters(SqlDataSourcePullOutLetters, txtSearch.Text, rdioSearchType.SelectedValue, DDLBrands.SelectedValue, DDLFilterStatus.SelectedValue,0);
            }
        }

        protected void gvPullOutLetters_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            FilterList();
        }

        private void FilterList()
        {
            if (!string.IsNullOrEmpty(DDLBrands.SelectedValue) || DDLFilterStatus.SelectedValue != "ALL")
            {
                if (!string.IsNullOrEmpty(txtSearch.Text))
                {
                    POLManager.SearchPullOutLetters(SqlDataSourcePullOutLetters, txtSearch.Text, rdioSearchType.SelectedValue, DDLBrands.SelectedValue, DDLFilterStatus.SelectedValue, 0);
                }
                else
                {
                    POLManager.FilterPullOutLetters(SqlDataSourcePullOutLetters, DDLBrands.SelectedValue, DDLFilterStatus.SelectedValue, 0);
                }
            }
            gvPullOutLetters.DataBind();
        }

        protected void gvPullOutLetters_Sorting(object sender, GridViewSortEventArgs e)
        {
            FilterList();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            SearchPullOutLetters();
        }

        private void SearchPullOutLetters()
        {
            if (!string.IsNullOrEmpty(txtSearch.Text))
            {
                POLManager.SearchPullOutLetters(SqlDataSourcePullOutLetters, txtSearch.Text, rdioSearchType.SelectedValue, DDLBrands.SelectedValue, DDLFilterStatus.SelectedValue, 0);
            }
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            SearchPullOutLetters();
        }
    }
}