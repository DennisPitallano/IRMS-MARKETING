using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.Entities.view;
using IRMS.ObjectModel;
using System.Collections;

namespace IntegratedResourceManagementSystem.Marketing
{
    public partial class SMPullOutLetterDetailsPreview : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        PullOutDetailManager POLDetailManager = new PullOutDetailManager(); 
        #endregion

        protected void Page_Init(object sender, EventArgs e)
        {
            hfPullOutCode.Value = Request.QueryString["PullOutCode"];
            initializeContainers();

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

            List<PullOutLetterDetail> boxDetails  = new List<PullOutLetterDetail>();
            List<PullOutLetterDetail> sackDetails = new List<PullOutLetterDetail>();

            long totalQty = 0;
            decimal totalAmt = 0;
            foreach (var item in containerDetails)
            {
                if (item.ContainerType=="BOX")
                {
                    boxDetails.Add(item);
                    Container container = new Container
                    {
                         BoxNumber ="BOX#"+item.ContainerNumber
                         , ImageUrl ="~/Resources/Box.png",
                         
                    };
                    containers.Add(container);
                }
                else
                {
                    sackDetails.Add(item);
                    Container container = new Container
                    {
                        BoxNumber = "SACK#" + item.ContainerNumber
                        ,ImageUrl = "~/Resources/Sack32.png"
                    };
                    containers.Add(container);
                }
                totalQty += item.Quantity;
                totalAmt += item.TtlAmount;
            }

            var Con = (from con in containers
                       select new  { BoxNumber= con.BoxNumber, ImageUrl= con.ImageUrl, qty= con.ItemsQuantity }).Distinct();

            txtSummary.Text = "SUMMARY TOTAL QTY: "+totalQty.ToString()+" TOTAL AMOUNT: "+totalAmt.ToString("###,###.00");
            lblTotalCotainer.Text = "TOTAL CONTAINER: " + Con.ToList().Count.ToString();
            gvBoxContainerDetails.DataSource = containerDetails;
            gvBoxContainerDetails.DataBind();
            gvContainers.DataSource = Con;
            gvContainers.DataBind();
        }

        protected void gvContainers_SelectedIndexChanged(object sender, EventArgs e)
        {
            string containterType = gvContainers.SelectedValue.ToString().Split('#')[0];
            int containerNumber = int.Parse(gvContainers.SelectedValue.ToString().Split('#')[1]);

            List<PullOutLetterDetail> containerDetails = POLDetailManager.FetchAll().Where(s =>
                                                           s.PullOutLetterCode == hfPullOutCode.Value 
                                                           && s.ContainerType==containterType 
                                                           && s.ContainerNumber ==containerNumber) 
                                                           .ToList();
            long totalQty = 0;
            decimal totalAmt = 0;
            foreach (var item in containerDetails)
            {
                totalQty += item.Quantity;
                totalAmt += item.TtlAmount;
            }
            txtSummary.Text = "SUMMARY TOTAL QTY: " + totalQty.ToString() + " TOTAL AMOUNT: " + totalAmt.ToString("###,###.00");
            gvBoxContainerDetails.DataSource = containerDetails;
            gvBoxContainerDetails.DataBind();
        }

        protected void imgBtn_Click(object sender, ImageClickEventArgs e)
        {
            initializeContainers();
        }
    }
}