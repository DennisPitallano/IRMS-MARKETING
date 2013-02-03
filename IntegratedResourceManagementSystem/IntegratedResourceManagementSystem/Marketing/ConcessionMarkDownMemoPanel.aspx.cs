using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.Entities;
using IRMS.BusinessLogic.Manager;
using IRMS.Components;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class ConcessionMarkDownMemoPanel : System.Web.UI.Page
    {
        MarkDownMemoManager MDManager = new MarkDownMemoManager();
        GeneralMemoConcessionManager GMManager = new GeneralMemoConcessionManager();
        GeneralMemoConcessionDetailManager GMConcessionDetailManager = new GeneralMemoConcessionDetailManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                btnDeleteMarkDownMemo.Text = "DELETE\nSELECTED";
                gvMarkDownMemo.SelectedIndex = 0;
                gvDeliveryReceipts_SelectedIndexChanged(sender, e);
            }
        }

        protected void rdioFilterView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void imgBtnSearchDR_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (txtMemoDateFrom.Text != string.Empty && txtMemoDateTo.Text == string.Empty)
                {
                    pnlError.Visible = true;
                    lblError.Text = "Date Range must be valid. Please check the Entry and try again!";
                }
                if (txtMemoDateFrom.Text == string.Empty && txtMemoDateTo.Text != string.Empty)
                {
                    pnlError.Visible = true;
                    lblError.Text = "Date Range must be valid. Please check the Entry and try again!";
                }
           
                {
                    pnlError.Visible = false;
                    lblError.Text = "Date Range must be valid. Please check the Entry and try again!";
                    if (this.txtMemoDateFrom.Text != string.Empty)
                    {
                        System.Threading.Thread.Sleep(100);
                        GMManager.SearchGeneralMemoIncludeDateRange(SqlDataSourceDeliveryReceipt, txtSearchDR.Text, DateTime.Parse(this.txtMemoDateFrom.Text), DateTime.Parse(txtMemoDateTo.Text));
                        gvMarkDownMemo.DataBind();
                    }
                    else
                    {
                        System.Threading.Thread.Sleep(100);
                        GMManager.SearchGeneralMemo(SqlDataSourceDeliveryReceipt, txtSearchDR.Text);
                        gvMarkDownMemo.DataBind();
                    }
                }
            }
            catch (Exception)
            {
                
                System.Threading.Thread.Sleep(100);
                        GMManager.SearchGeneralMemo(SqlDataSourceDeliveryReceipt, txtSearchDR.Text);
                        gvMarkDownMemo.DataBind();
            }

        }

        protected void gvDeliveryReceipts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void gvDeliveryReceipts_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                CheckBox chkBox = ((CheckBox)gvMarkDownMemo.SelectedRow.FindControl("chkID"));
                Image imgMemo = ((Image)gvMarkDownMemo.SelectedRow.FindControl("imgMemo"));
                hfMemoRecordNumber.Value = imgMemo.AlternateText;
                lblCustomer.Text = "BRAND: " + gvMarkDownMemo.SelectedRow.Cells[5].Text;
                lblMemoNumber.Text = "   MEMO #: " + gvMarkDownMemo.SelectedRow.Cells[3].Text;
            }
            catch (Exception)
            {
                // throw;
            }
        }
        private int CountTotalDetailsQuantity()
        {
            int count = 0;
            foreach (GridViewRow row in this.gvDRDetails.Rows)
            {
                count = count + int.Parse(row.Cells[4].Text);
            }
            return count;
        }

        private double CountTotalDetailsAmount()
        {
            double amount = 0.0;
            foreach (GridViewRow row in this.gvDRDetails.Rows)
            {
                amount = amount + double.Parse(row.Cells[7].Text.Replace("Php", ""));
            }
            return amount;
        }
        protected void chkSeleckAll_CheckedChanged(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(1000);
            //if (chkSeleckAll.Checked == true)
            //{
            //    foreach (GridViewRow row in this.gvMarkDownMemo.Rows)
            //    {
            //        CheckBox ck = ((CheckBox)row.FindControl("chkID"));
            //        ck.Checked = true;
            //    }
            //}
            //else
            //{
            //    foreach (GridViewRow row in this.gvMarkDownMemo.Rows)
            //    {
            //        CheckBox ck = ((CheckBox)row.FindControl("chkID"));
            //        ck.Checked = false;
            //    }
            //}
        }
        protected void btnCancelSelectedDR_ModalPopupExtender_Load(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(10);
            List<GeneralMemoConcessionDetail> list = GetSelectedMarkDownMemos();
            this.gvPreviewSelectedDR.DataSource = list;
            this.gvPreviewSelectedDR.DataBind();
        }
        private List<GeneralMemoConcessionDetail> GetSelectedMarkDownMemos()
        {
            List<GeneralMemoConcessionDetail> list = new List<GeneralMemoConcessionDetail>();
            foreach (GridViewRow row in this.gvDRDetails.Rows)
            {
                CheckBox ck = ((CheckBox)row.FindControl("chkDetailsRecordNumber"));
                if (ck.Checked)
                {
                    GeneralMemoConcessionDetail memo = new GeneralMemoConcessionDetail();
                    memo.RecordNumber = int.Parse(ck.ToolTip);
                    memo.StyleNumber = row.Cells[3].Text;
                    memo.StyleDescription = row.Cells[5].Text;
                    memo.MDPrice = int.Parse(row.Cells[6].Text);
                    memo.CurrentPrice = decimal.Parse(row.Cells[7].Text);
                    list.Add(memo);
                }
                else
                {
                    //Code if it is not checked ......may not be required
                }
            }
            return list;
        }

        private List<GeneralMemoConcessionDetail> GetSelectedMarkDownMemosForDeletetion()
        {
            List<GeneralMemoConcessionDetail> list = new List<GeneralMemoConcessionDetail>();
            foreach (GridViewRow row in this.gvPreviewSelectedDR.Rows)
            {
                CheckBox ck = ((CheckBox)row.FindControl("chkSelectedDRTCancelled"));
                if (ck.Checked)
                {
                    GeneralMemoConcessionDetail memo = new GeneralMemoConcessionDetail();
                    memo.RecordNumber = int.Parse(ck.ToolTip);
                    list.Add(memo);
                }
                else
                {
                    //Code if it is not checked ......may not be required
                }
            }
            return list;
        }

        protected void btnDeleteMarkDownMemo_Click(object sender, EventArgs e)
        {
            try
            {
                if (GetSelectedMarkDownMemos().Count > 0)
                {
                    btnCancelSelectedDR_ModalPopupExtender_Load(sender, e);
                    this.btnPreviewSelectedDRForcancel_ModalPopupExtender.Show();
                }
                else
                {
                    Redirector.Redirect("~/Marketing/ConcessionMarkDownMemoPanel.aspx");
                }

            }
            catch (Exception)
            {

                // throw;
            }
        }

        protected void btnContinueMarkDownDelete_Click(object sender, EventArgs e)
        {
            var MemoDetails = GetSelectedMarkDownMemosForDeletetion();

            try
            {
                GMConcessionDetailManager.Delete(MemoDetails);
                SqlDataSourceMemoDetails.DataBind();
                gvDRDetails.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void dlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {

            SetPageSize(dlPageSize.SelectedValue, gvDRDetails);
        }

        private void SetPageSize(string size, GridView gv)
        {
            switch (size)
            {
                case "20":
                    gv.PageSize = 20;
                    break;
                case "50":
                    gv.PageSize = 50;
                    break;
                case "100":
                    gv.PageSize = 100;
                    break;
                case "500":
                    gv.PageSize = 500;
                    break;
                case "1000":
                    gv.PageSize = 1000;
                    break;
                case "ALL":
                    gv.PageSize = 10000;
                    break;
                default:
                    gv.PageSize = 12;
                    break;

            }
        }
    }
}