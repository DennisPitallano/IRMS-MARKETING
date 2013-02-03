using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class CustomerDeliveryIndexDetails : System.Web.UI.Page
    {
        DeliveryReceiptsManager DRManager = new DeliveryReceiptsManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DisplayDRDetails();
                //SetDRListBoxValues();
            }
        }

        private void DisplayDRDetails()
        {
            lblCustomer.Text = Request.QueryString["Customer"];
            lblDRDate.Text = Request.QueryString["DRDate"];
            if (!string.IsNullOrEmpty(Request.QueryString["TQ"]))
            {
                lblTotalQuantity.Text = Request.QueryString["TQ"]; 
            }
            else
            {
                lblTotalQuantity.Text = "0";
                long totalQTY = 0;
                foreach (TableRow row in gvDRList.Rows)
                {
                    totalQTY +=long.Parse(row.Cells[2].Text);
                }
                lblTotalQuantity.Text = totalQTY.ToString();
            }
            if (!string.IsNullOrEmpty(Request.QueryString["TP"]))
            {
                lblTotalAmount.Text = decimal.Parse(Request.QueryString["TP"]).ToString("###,###.00");
            }
            else
            {
                lblTotalAmount.Text = "0.00";
                float totalAMT = 0;
                foreach (TableRow row in gvDRList.Rows)
                {
                    totalAMT += float.Parse(row.Cells[3].Text);
                }
                lblTotalAmount.Text = totalAMT.ToString("###,###.00");
            }
          
            lblDRNoRange.Text = Request.QueryString["DRRange"];
        }

        protected void DDLDisplayPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.gvDRDetails.PageSize = int.Parse(DDLDisplayPageSize.SelectedValue);
        }

        protected void gvDRList_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvDRDetails.DataSourceID = "SqlDataSourceDRDetailsByDRNo";
        }

        protected void btnReloadList_Click(object sender, EventArgs e)
        {
            gvDRDetails.DataSourceID = "SqlDataSourceDRDetails";
            gvDRList.SelectedIndex = -1;
        }

    }
}