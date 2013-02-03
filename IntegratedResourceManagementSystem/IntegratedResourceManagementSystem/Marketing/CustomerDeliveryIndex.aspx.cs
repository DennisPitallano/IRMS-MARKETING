using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using System.Globalization;

namespace IntegratedResourceManagementSystem.Marketing
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Updated: July 25, 2012 11:16 AM
    /// </summary>
    public partial class CustomerDeliveryIndex : System.Web.UI.Page
    {
        DeliveryReceiptsManager DRManager = new DeliveryReceiptsManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                InitializedMonthList();
                InitializedYearList();
                
            }
        }

        private void InitializedMonthList()
        {
            DateTime now = DateTime.Now;
            for (int i =1; i <=12; i++)
            {
                DateTimeFormatInfo mfi = new DateTimeFormatInfo();
                ddListMonth.Items.Add(new ListItem(mfi.GetMonthName(i), i.ToString()));
            }
        }

        private void InitializedYearList()
        {
            DateTime now = DateTime.Now;
            for (int i = 2000; i <= now.Year+1; i++)
            {
                ddlDateYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
                txtYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
            ddlDateYear.SelectedValue = now.Year.ToString();
            txtYear.SelectedValue = now.Year.ToString();
        }

        protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCustomerNameAndId();
        }

        private void  GetCustomerNameAndId()
        {
            Image imgCustomer = (Image)gvCustomers.SelectedRow.FindControl("imgCustomer");
            btnSelectCustomer.Enabled = true;
            btnSelectCustomer.ToolTip = "Use Selected Customer.";
            hfCustomerId.Value = imgCustomer.AlternateText;
        }

        protected void gvCustomers_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearchCustomer.Text))
            {
                DRManager.SeachCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text);
            }
            btnBrowseCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearchCustomer.Text))
            {
                DRManager.SeachCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text);
            }
            btnBrowseCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_Sorting(object sender, GridViewSortEventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearchCustomer.Text))
            {
                DRManager.SeachCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text);
            }
            btnBrowseCustomer_ModalPopupExtender.Show();
        }

        protected void btnSelectCustomer_Click(object sender, EventArgs e)
        {
            txtCustomer.Text = gvCustomers.SelectedRow.Cells[3].Text;
        }

        protected void rdioAsOfDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdioAsOfDate.SelectedIndex == 0)
            {
                mviewAsOfDateOption.ActiveViewIndex = 0;
            }else
                if(rdioAsOfDate.SelectedIndex ==1){
                    mviewAsOfDateOption.ActiveViewIndex = 1;
            }
                else {
                    mviewAsOfDateOption.ActiveViewIndex = 2;
                }
        }

        protected void iBtnSearchCustomer_Click(object sender, ImageClickEventArgs e)
        {
            DRManager.SeachCustomers(SqlDataSourceCustomers, txtSearchCustomer.Text);
            gvCustomers.DataBind();
            btnBrowseCustomer_ModalPopupExtender.Show();
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            DateTime FROM;
            DateTime TO;
            if (rdioAsOfDate.SelectedIndex == 0)
            {
                int year = int.Parse(ddlDateYear.SelectedValue);
                int month = int.Parse(ddListMonth.SelectedValue);
                FROM = new DateTime(year,month , 1);
                TO = new DateTime(year, month, DateTime.DaysInMonth(year, month));
                hfDateFrom.Value =FROM.ToString();
                hfDateTo.Value = TO.ToString() ;
            }
            else
                if (rdioAsOfDate.SelectedIndex == 1)
                {
                    hfDateFrom.Value = txtDate.Text;
                    hfDateTo.Value = txtDateTo.Text;
                }
                else
                {
                  int year = int.Parse(txtYear.SelectedValue);
                  FROM = new DateTime(year, 1, 1);
                  TO = new DateTime(year, 12, DateTime.DaysInMonth(year, 12));
                    hfDateFrom.Value = FROM.ToString();
                    hfDateTo.Value = TO.ToString();
                }
            lblTitle.Text ="DELIVERY INDEX FOR CUSTOMER:"+ txtCustomer.Text +"         FROM: "+ DateTime.Parse(hfDateFrom.Value).ToString("MMMM dd, yyyy")
                        + " TO " + DateTime.Parse(hfDateTo.Value).ToString("MMMM dd, yyyy");
        }

     
    }
}