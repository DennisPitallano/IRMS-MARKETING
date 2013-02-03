using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using System.Configuration;
using IntegratedResourceManagementSystem.Reports.ReportDocuments;


namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class MarkDownMemoPrintPreview : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            PrepareReport();
        }

        private void PrepareReport()
        {
            int iRpt = Convert.ToInt32(Request.QueryString["ReportType"]);
            ReportDocument rptDoc = new ReportDocument();

            ParameterField prmDateFrom = new ParameterField();
            ParameterField prmDateTo = new ParameterField();
            ParameterField prmBrand = new ParameterField();
            ParameterFields prmList = new ParameterFields();

            prmDateFrom.ParameterFieldName = "DateFrom";
            prmDateTo.ParameterFieldName = "DateTo";
            prmBrand.ParameterFieldName = "BrandName";

            ParameterDiscreteValue prmDateFromValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmDateToValue = new ParameterDiscreteValue();
            ParameterDiscreteValue pramBrandValue = new ParameterDiscreteValue();


            prmDateFromValue.Value = Request.QueryString["DateFrom"];
            prmDateToValue.Value = Request.QueryString["DateTo"]; 
            pramBrandValue.Value = Request.QueryString["BrandName"];
 
            prmDateFrom.CurrentValues.Add(prmDateFromValue);
            prmDateTo.CurrentValues.Add(prmDateToValue);
            prmBrand.CurrentValues.Add(pramBrandValue);


            switch (iRpt)
            {
                case 1: 
                    {
                      //  rptDoc = new RptMarkdownSummaryPerMemo();
                        prmList.Add(prmDateFrom);
                        prmList.Add(prmDateTo);
                        break;
                    }
                case 2:
                    {
                        prmList.Add(prmBrand);
                        //rptDoc = new RptMarkdownSummaryPerBrand();
                        break;
                    }
            }


            DataBaseLogIn(rptDoc);
            this.crMarkDownReport.ParameterFieldInfo = prmList;
            this.crMarkDownReport.ReportSource = rptDoc;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private static void DataBaseLogIn(ReportDocument rpt)
        {
            ConnectionInfo con_info = new ConnectionInfo();
            TableLogOnInfos crtableLogoninfos = new TableLogOnInfos();
            TableLogOnInfo crtableLogoninfo = new TableLogOnInfo();
            Tables crTables;

            con_info.ServerName = Connection().DataSource;
            con_info.DatabaseName = Connection().InitialCatalog;
            con_info.UserID = Connection().UserID;
            con_info.Password = Connection().Password;

            crTables = rpt.Database.Tables;

            foreach (CrystalDecisions.CrystalReports.Engine.Table crTable in crTables)
            {
                crtableLogoninfo = crTable.LogOnInfo;
                crtableLogoninfo.ConnectionInfo = con_info;
                crTable.ApplyLogOnInfo(crtableLogoninfo);
            }
        }

        private static SqlConnectionStringBuilder Connection()
        {
            SqlConnectionStringBuilder con = new SqlConnectionStringBuilder();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["IRMSConnectionString"].ConnectionString;
            return con;
        }
    }
}