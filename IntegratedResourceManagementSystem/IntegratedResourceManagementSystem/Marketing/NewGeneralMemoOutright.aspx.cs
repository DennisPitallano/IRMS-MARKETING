using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class NewGeneralMemoOutright : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // InitializedHeader();
            }
        }

        private void InitializedHeader()
        {
            txtMemoDate.Text = DateTime.UtcNow.ToShortDateString();
            txtMemoHeader.Text = "";
        }

        protected void rdioApplyPricePointTo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdioApplyPricePointTo.SelectedIndex == 0)
            {
                pnlAreaGroup.Visible = true;
                pnlSubAreaGroup.Visible = false;
                mvApplyPricePoint.SetActiveView(vAreaGroup);
            }
            else if (rdioApplyPricePointTo.SelectedIndex == 1)
            {
                pnlSubAreaGroup.Visible = true;
                pnlAreaGroup.Visible = false;
                mvApplyPricePoint.SetActiveView(vAreaGroup);
            }
            else
            {
                mvApplyPricePoint.SetActiveView(vCustomer);
            }
        }

        protected void gvCustomers_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            btnBrowseCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            btnBrowseCustomer_ModalPopupExtender.Show();
        }

        protected void gvCustomers_Sorting(object sender, GridViewSortEventArgs e)
        {
            btnBrowseCustomer_ModalPopupExtender.Show();
        }

        protected void btnSelectCustomer_Click(object sender, EventArgs e)
        {
            Image imgCustomer = (Image)gvCustomers.SelectedRow.FindControl("imgCustomer");
            hfCustomerId.Value = imgCustomer.AlternateText;
            txtCustomer.Text = gvCustomers.SelectedRow.Cells[3].Text;
        }

        protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnSelectCustomer.Enabled = true;
        }

        protected void gvItems_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            btnAddNewItem_ModalPopupExtender.Show();
        }

        protected void gvItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            btnAddNewItem_ModalPopupExtender.Show();
        }

        protected void gvItems_Sorting(object sender, GridViewSortEventArgs e)
        {
            btnAddNewItem_ModalPopupExtender.Show();
        }
    }
}