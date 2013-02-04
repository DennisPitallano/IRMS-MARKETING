using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.Components;
using System.Web.Caching;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class GeneralMemoConcession : System.Web.UI.Page
    {
        private GeneralMemoConcessionManager GMCM = new GeneralMemoConcessionManager();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            btnDeleteYes.Enabled = true;
            //btnDUplicateYes.Enabled = true;
            Session["MDStateEdit"] = "NO"; 
        }
        private void UpdateModalState()
        {
            lblApproved.Text = "Update MEMO " + gvGeneralMemo.SelectedRow.Cells[3].Text + " From " + gvGeneralMemo.SelectedRow.Cells[9].Text + " to Approved?";
            lblUnapproved.Text = "Update MEMO " + gvGeneralMemo.SelectedRow.Cells[3].Text + " From " + gvGeneralMemo.SelectedRow.Cells[9].Text + " to Unapproved?";
            //lblDuplicate.Text = gvGeneralMemo.SelectedRow.Cells[8].Text;
            lblBrandToDelete.Text = "Delete MEMO " + gvGeneralMemo.SelectedRow.Cells[3].Text + " ?";           
        }
        protected void gvGeneralMemo_SelectedIndexChanged(object sender, EventArgs e)
        {
            DateTime dt = Convert.ToDateTime(gvGeneralMemo.SelectedRow.Cells[4].Text);
            Session["MemoID"] = gvGeneralMemo.SelectedRow.Cells[3].Text;
            Session["Date"] = string.Format("{0:yyyy-MM-dd}", dt);
            Session["Brand"] = gvGeneralMemo.SelectedRow.Cells[5].Text;

            if (gvGeneralMemo.SelectedRow.Cells[10].Text != "Approved")
            {
                btnApprove.CssClass = "btnApprove";
                btnUnApprove.CssClass = "btnDisableUnApproved";
                
                btnApprove.Enabled = true;
                btnUnApprove.Enabled = false;
                btnApprovedYes.Enabled = true;
                
                //Enable Update button if memo is pending
                btnUpdateMemo.Enabled = true;
                btnUpdateMemo.CssClass = "btnUpdate";

                UpdateModalState();
            }
            else
            {
                //Enable Update button if memo is pending
                btnUpdateMemo.Enabled = false;
                btnUpdateMemo.CssClass = "btnDisableUpdate";

                btnApprove.CssClass = "btnDisableApproved";
                btnUnApprove.CssClass = "btnUnApprove";
                btnApprove.Enabled = false;
                btnUnApprove.Enabled = true;
                btnUnApprovedYes.Enabled = true;
                UpdateModalState();
            }
            int MemoId = int.Parse(gvGeneralMemo.SelectedValue.ToString());
            //hpLinkPrintDraft.NavigateUrl = "GeneralMemoPrintPreview.aspx?GenMemoNumber="+MemoId.ToString();
            hpLinkPrintDraft.NavigateUrl = "MarkDownMemoPreview.aspx?GenMemoNumber=" + MemoId.ToString();

        }

        protected void btnApprovedYes_Click(object sender, EventArgs e)
        {
            Image imgMemo = (Image)gvGeneralMemo.SelectedRow.FindControl("imgMemo");
            int ID = int.Parse(imgMemo.AlternateText);

            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["IRMSConnectionString"].ConnectionString);
            cnn.Close();
            cnn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spUpdateGenMemo";
            cmd.Parameters.AddWithValue("@id", ID);
            cmd.Parameters.AddWithValue("@stat", "Approved");
            cmd.Connection = cnn;
            cmd.ExecuteNonQuery();
            gvGeneralMemo.DataBind();
            //gvGeneralMemo.SelectedIndex = -1;
            cnn.Close();
        }

        protected void btnUnApprovedYes_Click(object sender, EventArgs e)
        {
            Image imgMemo = (Image)gvGeneralMemo.SelectedRow.FindControl("imgMemo");
            int ID = int.Parse(imgMemo.AlternateText);

            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["IRMSConnectionString"].ConnectionString);
            cnn.Close();
            cnn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spUpdateGenMemo";
            cmd.Parameters.AddWithValue("@id", ID);
            cmd.Parameters.AddWithValue("@stat", "Pending");
            cmd.Connection = cnn;
            cmd.ExecuteNonQuery();
            gvGeneralMemo.DataBind();
            //gvGeneralMemo.SelectedIndex = -1;
            cnn.Close();
        }

        protected void btnDeleteYes_Click(object sender, EventArgs e)
        {
            Image imgMemo = (Image)gvGeneralMemo.SelectedRow.FindControl("imgMemo");
            int ID = int.Parse(imgMemo.AlternateText);

            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["IRMSConnectionString"].ConnectionString);
            cnn.Close();
            cnn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spDeleteGenMemo";
            cmd.Parameters.AddWithValue("@id", ID);
            cmd.Connection = cnn;
            cmd.ExecuteNonQuery();
            gvGeneralMemo.DataBind();
            cnn.Close();
        }

        protected void btnDUplicateYes_Click(object sender, EventArgs e)
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["IRMSConnectionString"].ConnectionString);
            cnn.Close();
            cnn.Open();
      
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "spDuplicateGenMemo";
            cmd.Parameters.AddWithValue("@MemoNo", gvGeneralMemo.SelectedRow.Cells[3].Text);
            if (gvGeneralMemo.SelectedRow.Cells[4].Text == "&nbsp;")
            {
                cmd.Parameters.AddWithValue("@MemoDate", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@MemoDate", Convert.ToDateTime(gvGeneralMemo.SelectedRow.Cells[4].Text));
            }
            cmd.Parameters.AddWithValue("@Brand", gvGeneralMemo.SelectedRow.Cells[5].Text);
            cmd.Parameters.AddWithValue("@Pricetype", gvGeneralMemo.SelectedRow.Cells[6].Text);
            if (gvGeneralMemo.SelectedRow.Cells[7].Text == "&nbsp;")
            {
                cmd.Parameters.AddWithValue("@FromDate", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@FromDate", Convert.ToDateTime(gvGeneralMemo.SelectedRow.Cells[7].Text));
            }
            
            if (gvGeneralMemo.SelectedRow.Cells[8].Text == "&nbsp;")
            {
                cmd.Parameters.AddWithValue("@Todate", DBNull.Value);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Todate", Convert.ToDateTime(gvGeneralMemo.SelectedRow.Cells[8].Text));
            }
            cmd.Parameters.AddWithValue("@Status", "pending");
            cmd.Connection = cnn;
            cmd.ExecuteNonQuery();
            gvGeneralMemo.DataBind();
            cnn.Close();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            GMCM.SearchGeneralMemo(SqlDataSourceGeneralMemo, txtSearch.Text);
            gvGeneralMemo.DataBind();
        }

        protected void btnUpdateBrand_Click(object sender, EventArgs e)
        {

        }

        protected void btnUpdateMemo_Click(object sender, EventArgs e)
        {
            if (gvGeneralMemo.SelectedIndex >= 0)
            {
                Session["MemoNo"] = gvGeneralMemo.SelectedRow.Cells[3].Text;
                Session["MemDate"] = gvGeneralMemo.SelectedRow.Cells[4].Text;
                Session["Brand"] = gvGeneralMemo.SelectedRow.Cells[5].Text;               
                Session["MDStateEdit"] = "YES";
                Session["MemoID"] = gvGeneralMemo.SelectedValue.ToString();

                Redirector.Redirect("../Marketing/UpdateGeneralMemoConcession.aspx");
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            if (gvGeneralMemo.SelectedIndex >= 0)
            {
                Session["MemoNo"] = gvGeneralMemo.SelectedRow.Cells[3].Text;
                Session["MemDate"] = gvGeneralMemo.SelectedRow.Cells[4].Text;
                Session["Brand"] = gvGeneralMemo.SelectedRow.Cells[5].Text;
                Session["MDStateEdit"] = "YES";
                Session["MemoID"] = gvGeneralMemo.SelectedValue.ToString();

                Redirector.Redirect("../Marketing/ViewGeneralMemoConcession.aspx");
            }
        }
    }
}