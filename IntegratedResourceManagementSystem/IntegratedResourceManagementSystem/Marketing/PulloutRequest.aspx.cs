using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.Components;
using IRMS.BusinessLogic.Manager;
using IntegratedResourceManagementSystem.Common;
using IRMS.ObjectModel;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class PulloutRequest : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IRMSConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        
        PullOutLetterManager POHeadManager = new PullOutLetterManager();
        PullOutLetter PH = new PullOutLetter();
        PullOutDetailManager PODetailManager = new PullOutDetailManager();
        
        CustomerManager CM = new CustomerManager();
        CustomerInfoManager CIM = new CustomerInfoManager();
        StyleManager SM = new StyleManager();
        PriceManager PriceM = new PriceManager();
        PricePointManager PPM = new PricePointManager();
        RankManager RM = new RankManager();

        List<PullOutLetterDetail> LPD = new List<PullOutLetterDetail>();
        string StartSeries = "000000";
        string StartSeries2 = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            txtRecordNo.Text = (Session["ID"]).ToString();
            if (!Page.IsPostBack)
            {
                if (txtRecordNo.Text != string.Empty)
                {

                    conn.Open();
                    
                    cmd.Connection = conn;
                    cmd.CommandTimeout = 3000;

                    DataTable ResultSet = new DataTable();
                    cmd.CommandText = "select top 1 a.*, b.box_no from PULLOUT_HDR a inner join PULLOUT_Detail b on a.id=b.pullout_id where a.id = '" + Session["ID"] + "' order by b.id desc";

                    using (SqlDataAdapter adapter = new SqlDataAdapter())
                    {
                        adapter.SelectCommand = cmd;
                        adapter.Fill(ResultSet);
                    }
                    foreach (DataRow row in ResultSet.Rows)
                    {
                        txtCustNo.Text = ((int)row[1]).ToString();
                        txtCustomer.Text = (string)row[2];
                        txtAcct_Name.Text = (string)row[3];
                        txtBranch_Name.Text = (string)row[4];
                        txtPulloutDate.Text = ((DateTime)row[5]).ToString("MMMM dd, yyyy");
                        txtBrandName.Text = (string)row[6];
                        txtTransDate.Text = ((DateTime)row[7]).ToString();
                        txtDeptCode.Text = (string)row[8];
                        txtBrandCode.Text = (string)row[9];
                        string SeriesPerBrand = (string)row[10];
                        txtForwarder.Text = (string)row[11];
                        txtBoxNo.Text = ((int)row[13]).ToString();
                        UpdateGeneration((int)row[0]);
                        
                    }
                    conn.Close();
                    txtStyleno.Enabled = true;
                    txtDescription.Enabled = true;
                    txtQuantity.Enabled = true;
                    txtSRP.Enabled = true;
                    btnStyleBrowse.Enabled = true;
                    chkLostTag.Enabled = true;
                    btnSaveRequest.Visible = false;
                }
                else
                {
                    txtTransDate.Text = DateTime.Now.ToString();
                    pnlError.Visible = false;
                    txtStyleno.Enabled = false;
                    txtDescription.Enabled = false;
                    txtQuantity.Enabled = false;
                    txtSRP.Enabled = false;
                    btnStyleBrowse.Enabled = false;
                    chkLostTag.Enabled = false;
                    btnUpdateRequest.Visible = false;
                }
            }
        }

        #region "Methods"

            private void UpdateGeneration(int Identity)
            {
                gvPODetailList.DataSource = PODetailManager.GetPODetailByHDR_id(Identity);
                gvPODetailList.DataBind();
            }

            private void LoadAllCustomers()
            {
                gvOutlets.DataSource = CM.AllCustomers();
                gvOutlets.DataBind();
            }

            private string LastNo()
            {
                string NewSeries = "";
                try
                {
                    var PullOutSeries = from Pullout in POHeadManager.GetRequestALL()
                                        where Pullout.BrandName == txtBrandName.Text
                                        orderby Pullout.RecordNumber descending
                                        select Pullout;
                    PullOutLetter Ph = PullOutSeries.FirstOrDefault();
                    //if (Ph.RecordNumber > 0)
                    //{
                    //    NewSeries = Ph.SeriesPerBrand.Remove(0, Ph.SeriesPerBrand.Length - 6);
                    //}
                    //else
                    //{
                    //    NewSeries = "0";
                    //}
                }
                catch (Exception)
                {
                    NewSeries = StartSeries;
                }
                return NewSeries;
            }

            private string Sereies_No()
            {
                string NewSeriesNo = "";
                try
                {
                    var PullOutSeries = from Pullout in POHeadManager.GetRequestALL()
                                        where Pullout.TransactionDate.Year == DateTime.Parse(txtTransDate.Text).Year
                                        orderby Pullout.RecordNumber descending
                                        select Pullout;
                    PullOutLetter Ph = PullOutSeries.FirstOrDefault();
                    if (Ph.RecordNumber != 0)
                    {
                        NewSeriesNo = Ph.SeriesNumber + 1;
                    }
                    else
                    {
                        NewSeriesNo = "1";
                    }
                }
                catch (Exception)
                {
                    NewSeriesNo = StartSeries2;
                }
                return NewSeriesNo;
            }

            private decimal GetPricePerCutOffDate(string Style_No, long Customer_No, DateTime CutOff_Date)
            {
                try
                {
                    string Company_Name;
                    int PGNo;
                    int PGMDNo;
                    int AGNo;
                    int SAGNo;
                    string Arr_Type;
                    var Condition = "";
                    decimal LatestPrice;

                    var CustomerInfos = from CustInfo in CIM.GetAllCustomer()
                                        where CustInfo.CustomerNo == Customer_No
                                        select CustInfo;
                    CustomerInfo CI = CustomerInfos.FirstOrDefault();

                    Company_Name = CI.CompanyName;
                    PGNo = CI.PriceGroupNo;
                    PGMDNo = CI.PriceGroupMarkdownNo;
                    AGNo = CI.AreaGroupNo;
                    SAGNo = CI.SubAreaGroupNo;
                    Arr_Type = CI.ArrangementType;

                    if (PGNo == 0)
                    {
                        PGNo = 2;
                        Arr_Type = "Concession";
                        Condition = "and ((a.pricetype='Area' and a.grpno=1)";
                    }
                    else
                    {
                        Condition = "and ((a.pricetype='Area' and a.grpno=" + AGNo + ") or (a.pricetype='Sub-Area' and a.grpno=" + SAGNo + ") or (a.pricetype='Customer' and a.grpno=" + Customer_No + "))";
                    }
                        
                    if (PGMDNo != 0)
                    {
                        PGNo = PGMDNo;
                    }

                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IRMSConnectionString"].ConnectionString);
                        conn.Open();

                        SqlCommand cmd = new SqlCommand();
                        cmd.Connection = conn;

                        DataTable tblPrice = new DataTable();
                        DateTime ToDate;
                        DateTime FromDate;
                        LatestPrice = 0;

                        cmd.CommandText = "select a.id, a.price, a.fromdate, ";
                        cmd.CommandText += "case when a.todate is null then cast('3001-1-1 00:00:00.000' as datetime) else a.todate end as todate ";
                        cmd.CommandText += "from pricepoint a,rank b ";
                        cmd.CommandText += "where a.ynoutright=0 and a.pricetype=b.pricetype and (a.dateapproved is not null) ";
                        cmd.CommandText += "and a.styleno= '" + Style_No + "'  and a.pgno= '" + PGNo + "' " + Condition + "  order by b.rank,a.fromdate desc";
                        using (SqlDataAdapter adapter = new SqlDataAdapter())
                        {
                            adapter.SelectCommand = cmd;
                            adapter.Fill(tblPrice);
                        }

                        foreach (DataRow row in tblPrice.Rows)
                        {
                            FromDate = (DateTime)row[2];
                            ToDate = (DateTime)row[3];

                            if (CutOff_Date.Year != ToDate.Year)
                            {
                                if (CutOff_Date >= FromDate)
                                {
                                    LatestPrice = (decimal)row[1];
                                    break;
                                }
                            }
                            else
                            {
                                if (CutOff_Date >= FromDate && CutOff_Date <= ToDate)
                                {
                                    LatestPrice = (decimal)row[1];
                                    break;
                                }
                            }
                        }

                        if (LatestPrice == 0)
                        {
                            DataTable Price = new DataTable();
                            cmd.CommandText = "select price" + PGNo + " from price where styleno = '" + Style_No + "' order by id desc";
                            using (SqlDataAdapter adapter = new SqlDataAdapter())
                            {
                                adapter.SelectCommand = cmd;
                                adapter.Fill(Price);
                            }

                            foreach (DataRow row in Price.Rows)
                            {
                                LatestPrice = (decimal)row[0];
                                break;
                            }
                        }
                        return LatestPrice;
                }
                catch (Exception except)
                {
                    throw except;
                }
            }

            #region "Buttons Methods"
            
                protected int SaveRequest()
                {
                    var PH = new PullOutLetter
                    {
                        AccountName = txtAcct_Name.Text,
                        BranchName = txtBranch_Name.Text,
                        Forwarders = txtForwarder.Text,
                        CustomerNumber = Convert.ToInt32(txtCustNo.Text),
                        CompanyName = txtCustomer.Text,
                        PulloutDate = Convert.ToDateTime(txtPulloutDate.Text),
                        BrandName = txtBrandName.Text,
                        TransactionDate = Convert.ToDateTime(txtTransDate.Text),
                      //  DeptCode = txtDeptCode.Text,
                        BrandCode = txtBrandCode.Text,
                     //   SeriesPerBrand = "" + txtBrandCode.Text + "" + (DateTime.Parse(txtPulloutDate.Text).Year).ToString().Remove(0,2) + " - " + (long.Parse(LastNo()) + 1).ToString("000000") + "",
                        SeriesNumber = Sereies_No(),
                       // ForSM = "PENDING"
                    };
                    //  POHeadManager.SaveRequest(PH);
                    return PODetailManager.GetIdentity(PH);
                }

                protected void SaveItems()
                {
                    if (txtCustomer.Text == string.Empty)
                    {
                        pnlError.Visible = true;
                        lblError.Text = "PLEASE INSERT CUSTOMER!!!";
                    }
                    else if (txtPulloutDate.Text == string.Empty)
                    {
                        pnlError.Visible = true;
                        lblError.Text = "PLEASE INSERT CUSTOMER!!!";
                    }
                    else if (txtStyleno.Text == string.Empty && chkLostTag.Checked == false)
                    {
                        pnlError.Visible = true;
                        lblError.Text = "PLEASE INSERT STYLENO!!!";
                    }
                    else if (txtQuantity.Text == string.Empty)
                    {
                        pnlError.Visible = true;
                        lblError.Text = "PLEASE INSERT QUANTITY!!!";
                    }
                    else if (txtSRP.Text == string.Empty && chkLostTag.Checked == false)
                    {
                        pnlError.Visible = true;
                        lblError.Text = "PLEASE INSERT SRP!!!";
                    }
                    
                    else
                    {
                        foreach (TableRow rows in gvPODetailList.Rows)
                        {
                            PullOutLetterDetail PD = new PullOutLetterDetail();
                            PD.ContainerNumber = Convert.ToInt32(rows.Cells[3].Text);
                            PD.StyleNumber = rows.Cells[4].Text;
                            PD.StyleDescription = rows.Cells[5].Text;
                            PD.Quantity = Convert.ToInt32(rows.Cells[6].Text);
                            PD.SRP = Convert.ToDecimal(rows.Cells[7].Text.Replace("Php", ""));
                            PD.TtlAmount = Convert.ToDecimal(rows.Cells[8].Text.Replace("Php", ""));
                            LPD.Add(PD);
                        }

                        PullOutLetterDetail PullOut_detail = new PullOutLetterDetail();
                        PullOut_detail.ContainerNumber = Convert.ToInt32(txtBoxNo.Text);
                        PullOut_detail.Quantity = Convert.ToInt32(txtQuantity.Text);
                        
                        if (chkLostTag.Checked == true)
                        {
                            PullOut_detail.StyleNumber = "Lost Tag";
                            PullOut_detail.StyleDescription = "" + txtBrandCode.Text + " - " + rblDescription.SelectedItem.Text + "";
                            PullOut_detail.SRP = decimal.Parse(txtSRP.Text);
                            PullOut_detail.TtlAmount = decimal.Parse(txtQuantity.Text) * decimal.Parse(txtSRP.Text);
                        }
                        else
                        {
                            PullOut_detail.StyleNumber = txtStyleno.Text;
                            PullOut_detail.StyleDescription = txtDescription.Text;
                            PullOut_detail.SRP = Convert.ToDecimal(txtSRP.Text);
                            PullOut_detail.TtlAmount = Convert.ToInt32(txtQuantity.Text) * Convert.ToDecimal(txtSRP.Text);
                        }

                        LPD.Add(PullOut_detail);
                        gvPODetailList.DataSource = LPD;
                        gvPODetailList.DataBind();

                        txtStyleno.Text = string.Empty;
                        txtDescription.Text = string.Empty;
                        txtQuantity.Text = string.Empty;
                        txtSRP.Text = "0.00";
                        pnlError.Visible = false;
                    }
                }

            #endregion

        #endregion

        #region "Popup for STYLES"

            protected void gvStyleList_SelectedIndexChanged(object sender, EventArgs e)
            {
                btnStyleBrowse_ModalPopupExtender.Show();
            }

            protected void gvStyleList_PageIndexChanged(object sender, EventArgs e)
            {
                btnStyleBrowse_ModalPopupExtender.Show();
            }

            protected void gvStyleList_Sorted(object sender, EventArgs e)
            {
                if (txtSearchStyle.Text != string.Empty)
                {
                    POHeadManager.SearchStyleDataSource(SqlDataSourceStyle, txtSearchStyle.Text);
                    gvStyleList.DataBind();
                }
                btnStyleBrowse_ModalPopupExtender.Show();
            }

            protected void gvStyleList_PageIndexChanging(object sender, EventArgs e)
            {
                if (txtSearchStyle.Text != string.Empty)
                {
                    POHeadManager.SearchStyleDataSource(SqlDataSourceStyle, txtSearchStyle.Text);
                    gvStyleList.DataBind();
                }
                btnStyleBrowse_ModalPopupExtender.Show();
            }

            protected void imgBtnSearchStyle_Click(object sender, ImageClickEventArgs e)
            {
                if (txtSearchStyle.Text != string.Empty)
                {
                    POHeadManager.SearchStyleDataSource(SqlDataSourceStyle, txtSearchStyle.Text);
                    gvStyleList.DataBind();
                }
                btnStyleBrowse_ModalPopupExtender.Show();
            }

            protected void btnSelectStyle_Click(object sender, EventArgs e)
            {
                
                txtStyleno.Text = gvStyleList.SelectedRow.Cells[2].Text;

                string Desc = gvStyleList.SelectedRow.Cells[5].Text;
                if (Desc == "T")
                    txtDescription.Text = "" + gvStyleList.SelectedRow.Cells[6].Text + " - TOPS";
                else
                    txtDescription.Text = "" + gvStyleList.SelectedRow.Cells[6].Text + " - BOTTOMS";
                txtSRP.Text = GetPricePerCutOffDate(txtStyleno.Text, long.Parse(txtCustNo.Text), DateTime.Parse(txtPulloutDate.Text)).ToString("###,###.00");
            }

        #endregion

        #region "Popup for OUTLETS"

            protected void gvOutlets_SelectedIndexChanged(object sender, EventArgs e)
            {
                btnBrowse_ModalPopupExtender.Show();
            }

            protected void gvOutlets_PageIndexChanged(object sender, EventArgs e)
            {
                btnBrowse_ModalPopupExtender.Show();
            }

            protected void gvOutlets_Sorted(object sender, EventArgs e)
            {
                if (txtSearchOutlet.Text != string.Empty)
                {
                    POHeadManager.SearchOutletDataSource(SqlDataSourceCustomers, txtSearchOutlet.Text);
                    gvOutlets.DataBind();
                }
                btnBrowse_ModalPopupExtender.Show();
            }

            protected void gvOutlets_PageIndexChanging(object sender, GridViewPageEventArgs e)
            {
                if (txtSearchOutlet.Text != string.Empty)
                {
                    POHeadManager.SearchOutletDataSource(SqlDataSourceCustomers, txtSearchOutlet.Text);
                    gvOutlets.DataBind();
                }
                btnBrowse_ModalPopupExtender.Show();
            }

            protected void imgBtnSearchOutlet_Click(object sender, ImageClickEventArgs e)
            {
                if (txtSearchOutlet.Text != string.Empty)
                {
                    POHeadManager.SearchOutletDataSource(SqlDataSourceCustomers, txtSearchOutlet.Text);
                    gvOutlets.DataBind();
                }
                btnBrowse_ModalPopupExtender.Show();
            }

            protected void btnSelectOutlet_Click(object sender, EventArgs e)
            {
                txtAcct_Name.Text = gvOutlets.SelectedRow.Cells[2].Text;
                txtBranch_Name.Text = gvOutlets.SelectedRow.Cells[3].Text;
                txtBrandName.Text = gvOutlets.SelectedRow.Cells[4].Text;
               // txtDeptCode.Text = gvOutlets.SelectedRow.Cells[5].Text;
                txtBrandCode.Text = gvOutlets.SelectedRow.Cells[6].Text;
                txtCustNo.Text = gvOutlets.SelectedRow.Cells[7].Text;
                txtCustomer.Text = gvOutlets.SelectedRow.Cells[8].Text;
                txtForwarder.Text = gvOutlets.SelectedRow.Cells[9].Text;
            }

        #endregion

        #region "Buttons Process"

            protected void btnSaveRequest_Click(object sender, EventArgs e)
            {
                int HDRID = SaveRequest();
                foreach (TableRow Row in gvPODetailList.Rows)
                {
                    PullOutLetterDetail PD = new PullOutLetterDetail();
                  //  PD.PullOutLetterCode = HDRID;
                    PD.ContainerNumber = Convert.ToInt32(Row.Cells[3].Text);
                    PD.StyleNumber = Row.Cells[4].Text;
                    PD.StyleDescription = Row.Cells[5].Text;
                    PD.Quantity = Convert.ToInt32(Row.Cells[6].Text);
                    PD.SRP = Convert.ToDecimal(Row.Cells[7].Text.Replace("Php", ""));
                    PD.TtlAmount = Convert.ToDecimal(Row.Cells[8].Text.Replace("Php", ""));
                    PODetailManager.SaveItems(PD);
                }
            
                Redirector.Redirect("~/Marketing/RequestPanel.aspx");
            }

            protected void btnUpdateRequest_Click(object sender, EventArgs e)
            {
                conn.Open();
                cmd.Connection = conn;
                cmd.CommandTimeout = 300;
                cmd.CommandText = "delete from pullout_detail where pullout_id = '" + Session["ID"] + "'";
                cmd.ExecuteNonQuery();
                conn.Close();
                foreach (TableRow Row in gvPODetailList.Rows)
                {
                    PullOutLetterDetail PD = new PullOutLetterDetail();
                    PD.PullOutLetterCode = (txtRecordNo.Text);
                    PD.ContainerNumber = Convert.ToInt32(Row.Cells[3].Text);
                    PD.StyleNumber = Row.Cells[4].Text;
                    PD.StyleDescription = Row.Cells[5].Text;
                    PD.Quantity = Convert.ToInt32(Row.Cells[6].Text);
                    PD.SRP = Convert.ToDecimal(Row.Cells[7].Text.Replace("Php", ""));
                    PD.TtlAmount = Convert.ToDecimal(Row.Cells[8].Text.Replace("Php", ""));
                    PODetailManager.SaveItems(PD);
                }
                Redirector.Redirect("~/Marketing/RequestPanel.aspx");
            }

            protected void btnAddRecord_Click(object sender, EventArgs e)
            {
                SaveItems();
            }

        #endregion
                
        protected void gvPODetailList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            //if (txtRecordNo.Text != string.Empty)
            //{
            //    e.RowIndex = gvPODetailList.Rows.
            //    PODetailManager.DeleteItems(PODetailManager.GetPODetailByID(e.RowIndex));
            //}
            //else
            //{
                foreach (GridViewRow rows in gvPODetailList.Rows)
                {
                    PullOutLetterDetail PODtl = new PullOutLetterDetail();
                    PODtl.ContainerNumber = Convert.ToInt32(rows.Cells[3].Text);
                    PODtl.StyleNumber = rows.Cells[4].Text;
                    PODtl.StyleDescription = rows.Cells[5].Text;
                    PODtl.Quantity = Convert.ToInt32(rows.Cells[6].Text);
                    PODtl.SRP = Convert.ToDecimal(rows.Cells[7].Text.Replace("Php", ""));
                    PODtl.TtlAmount = Convert.ToDecimal(rows.Cells[8].Text.Replace("Php", ""));
                    LPD.Add(PODtl);
                }
                LPD.RemoveAt(e.RowIndex);
                gvPODetailList.DataSource = LPD;
            //}
            gvPODetailList.DataBind();
        }

        protected void chkLostTag_CheckedChanged(object sender, EventArgs e)
        {
            if (chkLostTag.Checked == true)
            {
                btnStyleBrowse.Enabled = false;
                txtStyleno.Enabled = false;
                txtStyleno.Text = string.Empty;
                txtDescription.Text = string.Empty;
                txtDescription.Visible = false;
                rblDescription.Visible = true;
                txtSRP.ReadOnly = false;
                txtSRP.Text = "0.00";

            }
            else
            {
                btnStyleBrowse.Enabled = true;
                txtStyleno.Enabled = true;
                txtDescription.Visible = true;
                rblDescription.Visible = false;
                txtSRP.Enabled = true;
            }
        }

        protected void txtPulloutDate_TextChanged(object sender, EventArgs e)
        {
            if (txtPulloutDate.Text == string.Empty)
            {
                txtStyleno.Enabled = true;
                txtDescription.Enabled = true;
                txtQuantity.Enabled = true;
                txtSRP.Enabled = true;
                btnStyleBrowse.Enabled = true;
                chkLostTag.Enabled = true;
                btnBrowse.Enabled = false;
            }
            else
            {
                txtStyleno.Enabled = true;
                txtDescription.Enabled = true;
                txtQuantity.Enabled = true;
                txtSRP.Enabled = true;
                btnStyleBrowse.Enabled = true;
                chkLostTag.Enabled = true;
                btnBrowse.Enabled = false;
            }
            
        }

        protected void txtSearchStyle_TextChanged(object sender, EventArgs e)
        {
            if (txtSearchStyle.Text != string.Empty)
            {
                POHeadManager.SearchStyleDataSource(SqlDataSourceStyle, txtSearchStyle.Text);
                gvStyleList.DataBind();
            }
            btnStyleBrowse_ModalPopupExtender.Show();
        }

        
    }
}