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
            LoadPullOutLetterReport(Request.QueryString["Brand"], Request.QueryString["Status"],Request.QueryString["polfor"]);
        }

        private void LoadPullOutLetterReport(string Brand, string Status,string polFor)
        {
            List<PullOutLetter> pullOutLetters = POLManager.FetchAll();
            if (Brand !="ALL" && Status!="ALL")
            {
                if (polFor !="ALL")
                {
                    gvPullOutLetters.DataSource = pullOutLetters.Where(pol => pol.BrandName == Brand && 
                        pol.LetterStatus == Status && pol.ForSM == bool.Parse(polFor));
                }
                else
                {
                    gvPullOutLetters.DataSource = pullOutLetters.Where(pol => pol.BrandName == Brand && pol.LetterStatus == Status);
                }
            }else 
            if (Brand !="ALL" && Status =="ALL")
            {
                if (polFor != "ALL")
                {
                    gvPullOutLetters.DataSource = pullOutLetters.Where(pol => pol.BrandName == Brand && pol.ForSM == bool.Parse(polFor));
                }
                else
                {
                    gvPullOutLetters.DataSource = pullOutLetters.Where(pol => pol.BrandName == Brand);
                }
            }else 
            if (Brand == "ALL" && Status != "ALL")
            {
                if (polFor != "ALL")
                {
                    gvPullOutLetters.DataSource = pullOutLetters.Where(pol => pol.LetterStatus == Status && pol.ForSM == bool.Parse(polFor));
                }
                else
                {
                    gvPullOutLetters.DataSource = pullOutLetters.Where(pol => pol.LetterStatus == Status);
                }
            }
            else
            {
                if (polFor != "ALL")
                {
                    gvPullOutLetters.DataSource = pullOutLetters.Where(pol=>pol.ForSM == bool.Parse(polFor));
                }
                else
                {
                    gvPullOutLetters.DataSource = pullOutLetters;
                }
            }
            gvPullOutLetters.DataBind();
        }
    }
}