using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using IntegratedResourceManagementSystem.Reports.ReportDocuments;

namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class DRSummaryPerAreaAndCustomerPrintPreview : System.Web.UI.Page
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
            string Area = Request.QueryString["Area"];

            int AreaNumber = GetAreaNumber(Area);
            DateTime DateTo = new DateTime(year, 12, 31);
            DateTime DateFrom = new DateTime(year, 1, 1);

            ReportDocument REPORT_DOC = new ReportDocument();
            string reportCacheKey = string.Concat("DRSummaryPerAreaAndCustomer", year, Request.QueryString["Brand"],Area,DRStatus);
            ParameterField prmDateFrom = new ParameterField();
            ParameterField prmDateTo = new ParameterField();
            ParameterField prmBrand = new ParameterField();
            ParameterField prmFebDaysCount = new ParameterField();
            ParameterField prmAreaNumber = new ParameterField();
            ParameterField prmDRStatus = new ParameterField();
            ParameterFields prmList = new ParameterFields();

            prmDateFrom.ParameterFieldName = "@DATE_FROM_PARAM";
            prmDateTo.ParameterFieldName = "@DATE_TO_PARAM";
            prmBrand.ParameterFieldName = "@BRAND_NAME";
            prmFebDaysCount.ParameterFieldName = "@FEB_DAY_";
            prmAreaNumber.ParameterFieldName = "@AREA_GROUP";
            prmDRStatus.ParameterFieldName="@DR_STATUS";

            ParameterDiscreteValue prmDateFromValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmDateToValue = new ParameterDiscreteValue();
            ParameterDiscreteValue pramBrandValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmFebDaysCountValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmAreaNumbervalue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmDRStatusValue = new ParameterDiscreteValue();


            prmDateFromValue.Value = DateFrom;
            prmDateToValue.Value = DateTo;
            pramBrandValue.Value = Request.QueryString["Brand"];
            prmFebDaysCountValue.Value = days_count;
            prmAreaNumbervalue.Value = AreaNumber;
            prmDRStatusValue.Value = DRStatus;

            prmDateFrom.CurrentValues.Add(prmDateFromValue);
            prmDateTo.CurrentValues.Add(prmDateToValue);
            prmBrand.CurrentValues.Add(pramBrandValue);
            prmFebDaysCount.CurrentValues.Add(prmFebDaysCountValue);
            prmAreaNumber.CurrentValues.Add(prmAreaNumbervalue);
            prmDRStatus.CurrentValues.Add(prmDRStatusValue);

            prmList.Add(prmDateFrom);
            prmList.Add(prmDateTo);
            prmList.Add(prmBrand);
            prmList.Add(prmFebDaysCount);
            prmList.Add(prmAreaNumber);
            prmList.Add(prmDRStatus);
           
                if (Cache[reportCacheKey] != null)
                {
                    REPORT_DOC = (RptCDISummaryPerAreaAndCustomer)Cache[reportCacheKey];
                }
                else
                {
                    REPORT_DOC = new RptCDISummaryPerAreaAndCustomer();
                    Cache.Insert(reportCacheKey, REPORT_DOC);
                }
          
           
            DataBaseLogIn(REPORT_DOC);
            this.DRSummaryPerAreaAndCustomerReport.ParameterFieldInfo = prmList;
            DRSummaryPerAreaAndCustomerReport.ReportSource = REPORT_DOC;
        }

        private int GetAreaNumber(string Area)
        {
            int areaNo = 0;
            switch (Area)
            {
                case"MMDS":
                    areaNo = 1;
                    break;
                case "VISAYAS":
                    areaNo = 4;
                    break;
                case "MINDANAO":
                    areaNo = 5;
                    break;
                case "BOUTIQUE":
                    areaNo = 6;
                    break;
                default:
                    areaNo = 0;
                    break;
            }
            return areaNo;
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