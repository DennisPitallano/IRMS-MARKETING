using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.Manager;
using IRMS.ObjectModel;

namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class PullOutletterReport : System.Web.UI.Page
    {
        #region variables
        PullOutLetterManager POLManager = new PullOutLetterManager();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Page_Init(object sender, EventArgs e)
        {
            lblBrand.Text = Request.QueryString["Brand"];
            lblLetterStatus.Text = Request.QueryString["Status"];
            if (Request.QueryString["polfor"]!="ALL")
            {
                if (bool.Parse(Request.QueryString["polfor"]))
                {
                    lblFor.Text = "SM";
                }
                else
                {
                    lblFor.Text = "NON SM & OTHER STORES";
                }
            }
            else
            {
                lblFor.Text = "ALL";
            }
            LoadPullOutLetterReport(Request.QueryString["Brand"], Request.QueryString["Status"],Request.QueryString["polfor"]);
        }

        private void LoadPullOutLetterReport(string Brand, string Status, string polFor)
        {
            List<PullOutLetter> pullOutLetters = POLManager.FetchAll();
            List<PullOutLetter> pullOutLettersFilter = new List<PullOutLetter>();
            if (Brand !="ALL" && Status!="ALL")
            {
                if (polFor !="ALL")
                {
                    pullOutLettersFilter = pullOutLetters.Where(pol => pol.BrandName == Brand && 
                        pol.LetterStatus == Status && pol.ForSM == bool.Parse(polFor)).ToList();
                }
                else
                {
                    pullOutLettersFilter = pullOutLetters.Where(pol => pol.BrandName == Brand && pol.LetterStatus == Status).ToList();
                }
            }else 
            if (Brand !="ALL" && Status =="ALL")
            {
                if (polFor != "ALL")
                {
                    pullOutLettersFilter = pullOutLetters.Where(pol => pol.BrandName == Brand && pol.ForSM == bool.Parse(polFor)).ToList();
                }
                else
                {
                    pullOutLettersFilter = pullOutLetters.Where(pol => pol.BrandName == Brand).ToList();
                }
            }else 
            if (Brand == "ALL" && Status != "ALL")
            {
                if (polFor != "ALL")
                {
                    pullOutLettersFilter = pullOutLetters.Where(pol => pol.LetterStatus == Status && pol.ForSM == bool.Parse(polFor)).ToList() ;
                }
                else
                {
                    pullOutLettersFilter = pullOutLetters.Where(pol => pol.LetterStatus == Status).ToList();
                }
            }
            else
            {
                if (polFor != "ALL")
                {
                    pullOutLettersFilter = pullOutLetters.Where(pol => pol.ForSM == bool.Parse(polFor)).ToList();
                }
                else
                {
                    pullOutLettersFilter = pullOutLetters;
                }
            }
           
            switch (rdioFilter.SelectedIndex)
            {
                case 0:
                    gvPullOutLetters.DataSource = pullOutLettersFilter;
                    break;
                case 1:
                    gvPullOutLetters.DataSource = pullOutLettersFilter.Where(pol => pol.IsBackLoad == true);
                    break;
                case 2:
                    gvPullOutLetters.DataSource = pullOutLettersFilter.Where(pol => pol.IsBackLoad == false );
                    break;
                default:
                    gvPullOutLetters.DataSource = pullOutLettersFilter;
                    break;
            }
            gvPullOutLetters.DataBind();
        }

        protected void rdioFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadPullOutLetterReport(Request.QueryString["Brand"], Request.QueryString["Status"], Request.QueryString["polfor"]);
        }
    }
}