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
    public partial class SMPullOutLetterManagementPanel : System.Web.UI.Page
    {
        #region  variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutLetter POL {
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

        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void gvPullOutLetters_SelectedIndexChanged(object sender, EventArgs e)
        {
            string pullOutCode = gvPullOutLetters.SelectedDataKey[1].ToString();
            string pullOutId = gvPullOutLetters.SelectedValue.ToString();
            string pullOutSeriesNumber = gvPullOutLetters.SelectedDataKey[3].ToString();
            hpLinkPrint.NavigateUrl = "~/Reports/ReportForms/PullOutLetterPrintPreview.aspx?PullOutId=" + pullOutId + "&PullOutCode="
                + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
            this.hpLinkUpdateContents.NavigateUrl = "~/Marketing/SMPullOutLetterUpdate.aspx?PullOutId=" + pullOutId + "&PullOutCode="
               + pullOutCode + "&PullOutSeries=" + pullOutSeriesNumber;
            lblPOLToDelete.Text = "Are you sure you want to delete <br /> Pull Out Letter : "+ pullOutSeriesNumber+"?";
            hfSelectedItem.Value = gvPullOutLetters.SelectedValue.ToString();
            btnDelete.Enabled = true;
            DDLLetterStatus.SelectedValue = gvPullOutLetters.SelectedDataKey[4].ToString();
            btnUpdateStatus.Enabled = true;
            DDLLetterStatus.Enabled = true;
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            PullOutLetter polToDelete = new PullOutLetter
            {
                 RecordNumber = int.Parse(hfSelectedItem.Value)
            };
            POLManager.Delete(polToDelete);
            gvPullOutLetters.DataBind();
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
            POLManager.FilterPullOutLetters(SqlDataSourcePullOutLetters, DDLBrands.SelectedValue);
        }

        protected void btnReFresh_Click(object sender, EventArgs e)
        {
            gvPullOutLetters.DataBind();
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            SearchPullOutLetters();
        }

        private void SearchPullOutLetters()
        {
            if (!string.IsNullOrEmpty(txtSearch.Text))
            {
                POLManager.SearchPullOutLetters(SqlDataSourcePullOutLetters, txtSearch.Text, rdioSearchType.SelectedValue, DDLBrands.SelectedValue, DDLFilterStatus.SelectedValue);
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            SearchPullOutLetters();
        }

        protected void btnFilterByStatus_Click(object sender, EventArgs e)
        {
            POLManager.FilterPullOutLetters(SqlDataSourcePullOutLetters, DDLBrands.SelectedValue, DDLFilterStatus.SelectedValue);
        }

        protected void gvPullOutLetters_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (!string.IsNullOrEmpty(DDLBrands.SelectedValue) || DDLFilterStatus.SelectedValue !="ALL")
            {
                POLManager.SearchPullOutLetters(SqlDataSourcePullOutLetters, txtSearch.Text, rdioSearchType.SelectedValue, DDLBrands.SelectedValue, DDLFilterStatus.SelectedValue);
            }
        }

        protected void gvPullOutLetters_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            FilterList();
        }

        protected void gvPullOutLetters_Sorting(object sender, GridViewSortEventArgs e)
        {
            FilterList();
        }

        private void FilterList()
        {
            if (!string.IsNullOrEmpty(DDLBrands.SelectedValue) || DDLFilterStatus.SelectedValue != "ALL")
            {
                if (!string.IsNullOrEmpty(txtSearch.Text))
                {
                    POLManager.SearchPullOutLetters(SqlDataSourcePullOutLetters, txtSearch.Text, rdioSearchType.SelectedValue, DDLBrands.SelectedValue, DDLFilterStatus.SelectedValue);
                }
                else
                {
                    POLManager.FilterPullOutLetters(SqlDataSourcePullOutLetters, DDLBrands.SelectedValue, DDLFilterStatus.SelectedValue);
                }
            }
            gvPullOutLetters.DataBind();
        }

    }
}