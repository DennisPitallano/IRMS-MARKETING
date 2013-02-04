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
    public partial class RequestPanel : System.Web.UI.Page
    {
        PullOutLetterManager PM = new PullOutLetterManager();
        PullOutDetailManager PDM = new PullOutDetailManager();
        //public PulloutHeader UPDATEREQUEST { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                gvPulloutRequestList.DataSource = PM.GetRequestALL();
                gvPulloutRequestList.DataBind();
            }
        }

        //protected void btnUpdateRequest_Click(object sender, EventArgs e)
        //{
        //  UPDATEREQUEST = PM.GetPOHeadsByPODateAndCustno(Convert.ToDateTime(gvPulloutRequestList.SelectedRow.Cells[7].Text), Convert.ToInt32(gvPulloutRequestList.SelectedRow.Cells[4].Text));
        //}

        //protected void txtSearch_TextChanged(object sender, EventArgs e)
        //{
            
        //}

        private void LoadAllRequest(string[] search_parameter = null)
        {
            if (search_parameter != null)
            {
                this.gvPulloutRequestList.DataSource = PM.SearchOutlet(search_parameter);
                gvPulloutRequestList.DataBind();
            }
            else
            {
                gvPulloutRequestList.DataSource = PM.GetRequestALL();
                gvPulloutRequestList.DataBind();
            }
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            if (gvPulloutRequestList.SelectedValue == null)
            {
                pnlError.Visible = true;
                lblError.Text = "PLEASE SELECT REQUEST TO DELETE";
            }
            else
            {
                PM.DeleteRequest(PM.GetPOHeadByID(Convert.ToInt32(gvPulloutRequestList.SelectedRow.Cells[2].Text)));
                gvPulloutRequestList.DataSource = PM.GetRequestALL();
                gvPulloutRequestList.DataBind();
                pnlError.Visible = false;
            }
            
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            string[] search_param = new string[1];
            search_param[0] = txtSearch.Text;
            LoadAllRequest(search_param);
            txtSearch.Text = null;
        }

        protected void btnPrintRequest_Click(object sender, EventArgs e)
        {
            if (gvPulloutRequestList.SelectedValue != null )
            {
                Session["ID"] = gvPulloutRequestList.SelectedRow.Cells[2].Text;
                Response.Redirect("~/Reports/ReportForms/PulloutReport.aspx");                  
            }
            else
            {
                pnlError.Visible = true;
            }
            
        }

        protected void gvPulloutRequestList_SelectedIndexChanged(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(500);
            txtAcctName.Text = gvPulloutRequestList.SelectedRow.Cells[5].Text;
            txtBranchName.Text = gvPulloutRequestList.SelectedRow.Cells[6].Text;
            txtBrandName.Text = gvPulloutRequestList.SelectedRow.Cells[10].Text;
            txtTransDate.Text = gvPulloutRequestList.SelectedRow.Cells[3].Text;
            txtPulloutDate.Text = gvPulloutRequestList.SelectedRow.Cells[8].Text;
            txtForwarder.Text = gvPulloutRequestList.SelectedRow.Cells[9].Text;

            gvPODetailList.DataSource = PDM.GetPODetailByHDR_id(int.Parse(gvPulloutRequestList.SelectedRow.Cells[2].Text));
            gvPODetailList.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (gvPulloutRequestList.SelectedValue != null)
            {
                Session["ID"] = gvPulloutRequestList.SelectedRow.Cells[2].Text;
                Response.Redirect("~/Marketing/PulloutRequest.aspx");
            }
            else
            {
                pnlError.Visible = true;
            }
        }

        protected void btnNewRequest_Click(object sender, EventArgs e)
        {
            Session["ID"] = string.Empty;
            Response.Redirect("~/Marketing/PulloutRequest.aspx");
        }
    }
}