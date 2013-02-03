using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using System.Data.SqlClient;
using System.Configuration;
using IntegratedResourceManagementSystem.Reports.ReportDocuments;

namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class DRSummaryPerAreaPrintPreview : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            InitializeReport();
        }

        private void InitializeReport()
        {
            int year = int.Parse(Request.QueryString["Year"]);
            int days_count = GetMonthDayCount(year, 2);
            string DRStatus = Request.QueryString["Status"];
            string Template = Request.QueryString["Template"];

            DateTime DateTo = new DateTime(year, 12, 31);
            DateTime DateFrom = new DateTime(year, 1, 1);

            ReportDocument REPORT_DOC = new ReportDocument();
            string reportCacheKey = string.Concat("DRSummaryPerArea", year, Request.QueryString["Brand"],DRStatus);
            string reportCacheKey_Sum = string.Concat("DRSummaryPerAreaSum", year, Request.QueryString["Brand"],DRStatus);
            ParameterField prmDateFrom = new ParameterField();
            ParameterField prmDateTo = new ParameterField();
            ParameterField prmBrand = new ParameterField();
            ParameterField prmFebDaysCount = new ParameterField();
            ParameterField prmDRStatus = new ParameterField();
            ParameterFields prmList = new ParameterFields();

            prmDateFrom.ParameterFieldName = "@DATE_FROM_PARAM";
            prmDateTo.ParameterFieldName = "@DATE_TO_PARAM";
            prmBrand.ParameterFieldName = "@BRAND_NAME";
            prmFebDaysCount.ParameterFieldName="@FEB_DAY_";
            prmDRStatus.ParameterFieldName = "@DR_STATUS";


            ParameterDiscreteValue prmDateFromValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmDateToValue = new ParameterDiscreteValue();
            ParameterDiscreteValue pramBrandValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmFebDaysCountValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmDRStatusValue = new ParameterDiscreteValue();

            prmDateFromValue.Value = DateFrom;
            prmDateToValue.Value = DateTo;
            pramBrandValue.Value = Request.QueryString["Brand"];
            prmFebDaysCountValue.Value = days_count;
            prmDRStatusValue.Value = DRStatus;

            prmDateFrom.CurrentValues.Add(prmDateFromValue);
            prmDateTo.CurrentValues.Add(prmDateToValue);
            prmBrand.CurrentValues.Add(pramBrandValue);
            prmFebDaysCount.CurrentValues.Add(prmFebDaysCountValue);
            prmDRStatus.CurrentValues.Add(prmDRStatusValue);

            prmList.Add(prmDateFrom);
            prmList.Add(prmDateTo);
            prmList.Add(prmBrand);
            prmList.Add(prmFebDaysCount);
            prmList.Add(prmDRStatus);

            if (Template.Equals("ALL"))
            {
                if (Cache[reportCacheKey] != null)
                {
                    REPORT_DOC = (RptDRSummaryPerArea)Cache[reportCacheKey];
                }
                else
                {
                    REPORT_DOC = new RptDRSummaryPerArea();
                    Cache.Insert(reportCacheKey, REPORT_DOC);
                }
            }
            else
            {
                if (Cache[reportCacheKey_Sum] != null)
                {
                    REPORT_DOC = (RptDRSummaryPerArea_)Cache[reportCacheKey_Sum];
                }
                else
                {
                    REPORT_DOC = new RptDRSummaryPerArea_();
                    Cache.Insert(reportCacheKey_Sum, REPORT_DOC);
                }
            }
               
         
            DataBaseLogIn(REPORT_DOC);
            this.DRSummaryPerAreaReport.ParameterFieldInfo = prmList;
            DRSummaryPerAreaReport.ReportSource = REPORT_DOC;
        }

        private int GetMonthDayCount(int year, int month)
        {
            return DateTime.DaysInMonth(year, month);
        }

        private static SqlConnectionStringBuilder Connection()
        {
            SqlConnectionStringBuilder con = new SqlConnectionStringBuilder();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["IRMSConnectionString"].ConnectionString;
            return con;
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

        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
    }
}