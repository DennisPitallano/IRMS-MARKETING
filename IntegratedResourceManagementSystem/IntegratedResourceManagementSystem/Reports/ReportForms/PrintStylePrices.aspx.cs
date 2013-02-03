using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.Entities.view;
using IRMS.ObjectModel;
using IRMS.BusinessLogic.Manager;
using System.Data;
using System.Diagnostics;
using System.IO;

namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class PrintStylePrices : System.Web.UI.Page
    {
        #region variables
        PriceGroupManager PriceManager = new PriceGroupManager();
        GroupAreaManager GAreamanager = new GroupAreaManager();
        PriceManager PManager = new PriceManager();
        SubGroupAreaManager SAreaGroupManager = new SubGroupAreaManager();
        PricePointManager PricePointManager = new PricePointManager();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                InitializeData();

            }
        }

        private void InitializeData()
        {
            List<StylePrice> STYLE_PRICES = (List<StylePrice>)Session["STYLE_PRICES"];
            CustomerInfo CUSTOMER = (CustomerInfo)Session["CUSTOMER"];

            List<StylePrice> MARKDOWN_PRICES = (List<StylePrice>)Session["STYLE_PRICES_MARKDOWN"];
            List<StylePrice> REGULAR_PRICES = (List<StylePrice>)Session["STYLE_PRICES_REGULAR"];
            List<StylePrice> REGULAR_PRICE_BOTTOM = new List<StylePrice>();
            List<StylePrice> REGULAR_PRICE_TOP = new List<StylePrice>();
            List<StylePrice> MARKDOWN_PRICE_BOTTOM = new List<StylePrice>();
            List<StylePrice> MARKDOWN_PRICE_TOP = new List<StylePrice>();
            lblCustomerName.Text = CUSTOMER.CompanyName;
            lblBrandName.Text = CUSTOMER.BrandName;
            lblPriceGroupRegular.Text = GetPriceGroup(CUSTOMER.PriceGroupNo).GroupField;
            lblPriceGroupMD.Text = GetPriceGroup(CUSTOMER.PriceGroupMarkdownNo).GroupField;
            lblArrangementType.Text = CUSTOMER.ArrangementType.ToUpper();
            lblArea.Text = GAreamanager.GetAreaGroupByKey(CUSTOMER.AreaGroupNo).GroupName;
            lblSubArea.Text = SAreaGroupManager.GetSubAreaGroupByKey(CUSTOMER.SubAreaGroupNo).GroupName;

            //foreach (StylePrice sp in STYLE_PRICES)
            //{
            //    if (sp.PriceType == "MARKDOWN")
            //    {
            //        MARKDOWN_PRICES.Add(sp);
            //    }
            //    else
            //    {
            //        REGULAR_PRICES.Add(sp);
            //    }
            //}

            foreach (StylePrice sp_b in REGULAR_PRICES)
            {
                if (sp_b.APType == "B")
                {
                    REGULAR_PRICE_BOTTOM.Add(sp_b);
                }
                else
                {
                    REGULAR_PRICE_TOP.Add(sp_b);
                }
            }

            foreach (StylePrice sp_m_b in MARKDOWN_PRICES)
            {
                if (sp_m_b.APType == "B")
                {
                    MARKDOWN_PRICE_BOTTOM.Add(sp_m_b);
                }
                else
                {
                    MARKDOWN_PRICE_TOP.Add(sp_m_b);
                }
            }

            gvStylesMarkdown.DataSource = MARKDOWN_PRICE_TOP.OrderBy(e=> e.StyleNo);
            gvStylesMarkdown.DataBind();

            gvPriceStyles.DataSource = REGULAR_PRICE_TOP.OrderBy(e=>e.StyleNo);
            gvPriceStyles.DataBind();

            gvRegularBottom.DataSource = REGULAR_PRICE_BOTTOM.OrderBy(e=> e.StyleNo);
            gvRegularBottom.DataBind();

            gvMarkDownBottom.DataSource = MARKDOWN_PRICE_BOTTOM.OrderBy(e=> e.StyleNo);
            gvMarkDownBottom.DataBind();

            if (gvPriceStyles.Rows.Count < 1 && gvRegularBottom.Rows.Count < 1)
            {
                lblRegular.Visible = false;
                pnlLeft.Visible = false;
            }
            if (gvPriceStyles.Rows.Count < 1)
            {
                lblRegularTop.Visible = false;
            }
            if (gvRegularBottom.Rows.Count < 1)
            {
                lblRegularBottom.Visible = false;
            }

            if (gvStylesMarkdown.Rows.Count < 1 && gvMarkDownBottom.Rows.Count < 1)
            {
                lblMarkDown.Visible = false;
                pnlRight.Visible = false;

            }
            if (gvStylesMarkdown.Rows.Count <1)
            {
                lblMarkDownTop.Visible = false;
            }

            if (gvMarkDownBottom.Rows.Count < 1)
            {
                lblMarkDownBottom.Visible = false;
            }

        }
        private PriceGroup GetPriceGroup(int pg)
        {
            return PriceManager.GetPriceGroupByKey(pg);
        }

        protected void gvPriceStyles_RowCreated(object sender, GridViewRowEventArgs e)
        {
            foreach (GridViewRow row in this.gvPriceStyles.Rows)
            {
                if (row.Cells[2].Text == "MARKDOWN")
                {
                    row.Cells[1].Style.Add("font-weight", "bold");
                    row.Cells[2].Style.Add("font-weight", "bold");
                }
            }
        }

        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            ExportToExcel();
        }

        /// <summary>
        /// Export to Excel format
        /// </summary>
        private void ExportToExcel()
        {
            btnExportToExcel.Visible = false;
            Response.Clear();
            Response.Buffer = true;
            Response.AppendHeader("Content-Disposition", "attachment;filename=StylePrices" + DateTime.
            Now.ToString("yyyy-MM-dd hh:mm") + ".xls");
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/ms-excel";
            this.EnableViewState = false;
        }
       
    }
}