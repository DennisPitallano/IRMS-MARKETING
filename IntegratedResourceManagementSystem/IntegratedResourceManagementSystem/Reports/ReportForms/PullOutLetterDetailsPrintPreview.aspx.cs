using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;
using IRMS.Entities.view;
using IRMS.BusinessLogic.Manager;
using IRMS.Entities;

namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class PullOutLetterDetailsPrintPreview : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager();
        CompanyManager CompanyManager = new CompanyManager();
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            hfPullOutCode.Value = Request.QueryString["PullOutCode"];
            initializeContainers();
            Company company = CompanyManager.GetComapnyByKey(int.Parse(Request.QueryString["CustomerId"]));
            imgLogo.ImageUrl = "~/Marketing/Marketing-Admin/company-logos/" + company.CompanyLogo;
            pnlSummary.Visible = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void initializeContainers()
        {
            List<Container> boxContainers = new List<Container>();
            List<Container> sackContainers = new List<Container>();
            List<Container> containers = new List<Container>();

            List<PullOutLetterDetail> containerDetails = POLDetailManager.FetchAll().Where(s =>
                                                            s.PullOutLetterCode == hfPullOutCode.Value)
                                                            .ToList();

            List<PullOutLetterDetail> boxDetails = new List<PullOutLetterDetail>();
            List<PullOutLetterDetail> sackDetails = new List<PullOutLetterDetail>();
            int totalStyles = containerDetails.Select(a => a.StyleNumber).Distinct().ToList().Count;
            long totalQty = 0;
            decimal totalAmt = 0;
            foreach (var item in containerDetails)
            {
                if (item.ContainerType == "BOX")
                {
                    boxDetails.Add(item);
                    Container container = new Container
                    {
                        BoxNumber = "BOX#" + item.ContainerNumber
                         ,
                        ImageUrl = "~/Resources/Box.png",

                    };
                    containers.Add(container);
                }
                else
                {
                    sackDetails.Add(item);
                    Container container = new Container
                    {
                        BoxNumber = "SACK#" + item.ContainerNumber
                        ,
                        ImageUrl = "~/Resources/Sack32.png"
                    };
                    containers.Add(container);
                }
                totalQty += item.Quantity;
                totalAmt += item.TtlAmount;
            }

          

            //PullOutLetterDetail pullOutSummary = new PullOutLetterDetail
            //{
            //    ContainerType = "GRAND TOTAL:",
            //    Quantity = totalQty,
            //    StyleNumber = totalStyles.ToString(),
            //    TtlAmount = totalAmt,
            //    SRP = decimal.Parse("0"),

            //};
            //containerDetails.Add(pullOutSummary);

            var Con = (from con in containers
                       select new { BoxNumber = con.BoxNumber, ImageUrl = con.ImageUrl, qty = con.ItemsQuantity }).Distinct();

            this.lblTotalQty.Text = totalQty.ToString();
            this.lblTotalPrice.Text =totalAmt.ToString("###,###.00");
            lblTotalNumberOfContainer.Text =Con.ToList().Count.ToString();
         
          
            gvContainers.DataSource = Con;
            gvContainers.DataBind();

            List<PullOutLetterDetail> detailsSummaries = new List<PullOutLetterDetail>();

            foreach (var item in Con.ToList())
            {
                PullOutLetterDetail pdSum = new PullOutLetterDetail();
                    
                foreach (var cd in containerDetails)
                {
                    if (item.BoxNumber.Split('#')[0]==cd.ContainerType && int.Parse(item.BoxNumber.Split('#')[1])==cd.ContainerNumber)
                    { 
                             pdSum.ContainerNumber = cd.ContainerNumber;
                             pdSum.ContainerType = cd.ContainerType;
                             pdSum.IsLostTag = cd.IsLostTag;
                             pdSum.Quantity +=  cd.Quantity;
                             pdSum.TtlAmount += cd.TtlAmount;
                             pdSum.ContainerType = "TOTAL " + cd.ContainerType + "#" + cd.ContainerNumber;
                             pdSum.StyleDescription = "";
                             cd.ContainerType = "";
                             cd.StyleDescription = "pc.";
                             detailsSummaries.Add(cd);
                    }
                }
                detailsSummaries.Add(pdSum);
            }

            gvDetails.DataSource = containerDetails;
            gvDetails.DataBind();
           // detailsSummaries.Add(pullOutSummary);
            gvBoxContainerDetails.DataSource = detailsSummaries;
            gvBoxContainerDetails.DataBind();

            lblBranch.Text = Request.QueryString["Branch"];
            lblCustomer.Text = Request.QueryString["Customer"];
            lblseries.Text = Request.QueryString["Series"];
        }

        protected void gvContainers_SelectedIndexChanged(object sender, EventArgs e)
        {
            string containterType = gvContainers.SelectedValue.ToString().Split('#')[0];
            int containerNumber = int.Parse(gvContainers.SelectedValue.ToString().Split('#')[1]);

            List<PullOutLetterDetail> containerDetails = POLDetailManager.FetchAll().Where(s =>
                                                           s.PullOutLetterCode == hfPullOutCode.Value
                                                           && s.ContainerType == containterType
                                                           && s.ContainerNumber == containerNumber)
                                                           .ToList();
            long totalQty = 0;
            decimal totalAmt = 0;
            int totalStyles = containerDetails.Count;
            foreach (var item in containerDetails)
            {
                totalQty += item.Quantity;
                totalAmt += item.TtlAmount;
            }

           
            PullOutLetterDetail pullOutSummary = new PullOutLetterDetail
            {
                ContainerType = "TOTAL " + containterType + "#" + containerNumber.ToString(),
                Quantity = totalQty,
                StyleNumber=totalStyles.ToString(),
                TtlAmount = totalAmt,
                SRP = decimal.Parse("0"),
                     
            };
            containerDetails.Add(pullOutSummary);
            gvBoxContainerDetails.DataSource = containerDetails;
            gvBoxContainerDetails.DataBind();
            int rows = gvContainers.Rows.Count-1;
            int selected_row =gvContainers.SelectedRow.RowIndex;
            if (rows ==selected_row)
            {
                pnlSummary.Visible = true;
            }
            else
            {
                pnlSummary.Visible = false;
            }
           
        }

        protected void imgBtn_Click(object sender, ImageClickEventArgs e)
        {
            initializeContainers();
        }

        protected void gvCompanyLogos_SelectedIndexChanged(object sender, EventArgs e)
        {
            imgLogo.ImageUrl = "~/Marketing/Marketing-Admin/company-logos/"+gvCompanyLogos.SelectedValue.ToString();
            btnChangeLogo_ModalPopupExtender.Show();
        }

        protected void rdioTemplate_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdioTemplate.SelectedIndex ==1)
            {
                gvDetails.Visible = true;
                gvBoxContainerDetails.Visible = false;
                lblTotalContainerLabel.Visible = false;
                lblTotalNumberOfContainer.Visible = false;
            }
            else
            {
                gvDetails.Visible = false;
                gvBoxContainerDetails.Visible = true;
                lblTotalContainerLabel.Visible = true;
                lblTotalNumberOfContainer.Visible = true;
            }
        }
    }
}