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
    public partial class CustomerDeliveryIndexPerArea : System.Web.UI.Page
    {
        #region variables
        DeliveryReceiptsManager DRManager = new DeliveryReceiptsManager();
        GroupAreaManager AreaGroupManager = new GroupAreaManager();
        SubGroupAreaManager SubAreaGroupManager = new SubGroupAreaManager();
        BrandManager BrandManager = new BrandManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            InitializeBrands();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                InitializedMonthList();
                InitializedYearList();
                InitializeAreaGroups();
            }
        }

        private void InitializedMonthList()
        {
            DateTime now = DateTime.Now;
            for (int i = 1; i <= 12; i++)
            {
                DateTimeFormatInfo mfi = new DateTimeFormatInfo();
                ddListMonth.Items.Add(new ListItem(mfi.GetMonthName(i), i.ToString()));
            }
        }

        private void InitializedYearList()
        {
            DateTime now = DateTime.Now;
            for (int i = 2000; i <= now.Year + 1; i++)
            {
                ddlDateYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
                txtYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
            ddlDateYear.SelectedValue = now.Year.ToString();
            txtYear.SelectedValue = now.Year.ToString();
        }

        private void InitializeAreaGroups()
        {
            DDLAreaGroup.Items.Clear();
            DDLAreaGroup.Items.Add(new ListItem ("ALL", "0"));
            foreach (var item in AreaGroupManager.AreaGroups())
            {
                DDLAreaGroup.Items.Add(new ListItem(item.GroupName, item.AreaGroupNo.ToString()));
            }
            InitializeSubAreaGroups(int.Parse(DDLAreaGroup.SelectedValue));
        }

        private void InitializeSubAreaGroups(int areaGroupNumber)
        {
            DDLSubArea.Items.Clear();
            foreach (var item in SubAreaGroupManager.SubGroupArea(areaGroupNumber))
            {
                DDLSubArea.Items.Add(new ListItem(item.GroupName, item.SubAreaGroupNo.ToString()));
            }
        }

        private void InitializeBrands()
        {
            DDLBrands.Items.Clear();
            DDLBrands.Items.Add(new ListItem("ALL", "ALL"));
            foreach (var item in BrandManager.Brands())
            {
                DDLBrands.Items.Add(new ListItem(item.BrandDescription, item.BrandDescription));
            }
        }

        protected void rdioAsOfDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdioAsOfDate.SelectedIndex == 0)
            {
                mviewAsOfDateOption.ActiveViewIndex = 0;
            }
            else
            if (rdioAsOfDate.SelectedIndex == 1)
            {
                mviewAsOfDateOption.ActiveViewIndex = 1;
            }
            else
            {
                mviewAsOfDateOption.ActiveViewIndex = 2;
            }
        }

        protected void imgBtnSearch_Click(object sender, ImageClickEventArgs e)
        {
            DateTime FROM;
            DateTime TO;
           
            if (rdioAsOfDate.SelectedIndex == 0)
            {
                int year = int.Parse(ddlDateYear.SelectedValue);
                int month = int.Parse(ddListMonth.SelectedValue);
                FROM = new DateTime(year, month, 1);
                TO = new DateTime(year, month, DateTime.DaysInMonth(year, month));
                hfDateFrom.Value = FROM.ToString();
                hfDateTo.Value = TO.ToString();
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
            lblTitle.Text = "DELIVERY INDEX FOR CUSTOMER:" + this.txtAreaSubArea.Text + "  FROM: " + DateTime.Parse(hfDateFrom.Value).ToString("MMMM dd, yyyy")
                       + " TO " + DateTime.Parse(hfDateTo.Value).ToString("MMMM dd, yyyy");
        }

        protected void rdioType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdioType.SelectedIndex == 0)
            {
               pnlSubArea.Visible = false;
            }
            else
            {
                pnlSubArea.Visible = true;
            }
            btnBrowseCustomer_ModalPopupExtender.Show();
        }

        protected void DDLAreaGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            InitializeSubAreaGroups(int.Parse(DDLAreaGroup.SelectedValue));
            btnBrowseCustomer_ModalPopupExtender.Show();
        }

        protected void btnSelectCustomer_Click(object sender, EventArgs e)
        {
            if (rdioType.SelectedIndex == 0)
            {
                this.txtAreaSubArea.Text = DDLAreaGroup.SelectedItem.Text;
                lblCustomerLabel.Text = "AREA:";
                hfAreaGroupNumber.Value = DDLAreaGroup.SelectedValue;
                hfSubAreaGroupNumber.Value = "0";
            }
            else
            {
                this.txtAreaSubArea.Text = DDLSubArea.SelectedItem.Text;
                lblCustomerLabel.Text = "SUB-AREA:";
                hfSubAreaGroupNumber.Value = DDLSubArea.SelectedValue;
                hfAreaGroupNumber.Value = DDLAreaGroup.SelectedValue;
            }
            hfBrandName.Value = DDLBrands.SelectedValue;
        }
    }
}