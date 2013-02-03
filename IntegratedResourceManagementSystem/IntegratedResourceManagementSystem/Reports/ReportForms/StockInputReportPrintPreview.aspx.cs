using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using IRMS.BusinessLogic.Manager;
using IntegratedResourceManagementSystem.Reports.ReportDocuments;
using System.Data.SqlClient;
using System.Configuration;

namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class StockInputReportPrintPreview : System.Web.UI.Page
    {
        #region variables
        GroupAreaManager areaGroupManager = new GroupAreaManager();
        SubGroupAreaManager subAreaGroupManager = new SubGroupAreaManager();
        #endregion
        protected void Page_Init(object sender, EventArgs e)
        {
            InitializeReport();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

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

        private int GetMonthDayCount(int year, int month)
        {
            return DateTime.DaysInMonth(year, month);
        }

        private void InitializeReport()
        {
            int area = int.Parse(Request.QueryString["Area"]);
            int subArea = int.Parse(Request.QueryString["SubArea"]);
            string brand = Request.QueryString["Brand"];
            string memoStatus = Request.QueryString["PriceStatus"];
            string dateFrom = Request.QueryString["DateFrom"];
            string dateTo = Request.QueryString["DateTo"];
            string areaName = areaGroupManager.GetAreaGroupByKey(int.Parse(Request.QueryString["Area"])).GroupName;
            string subAreaName = subAreaGroupManager.GetSubAreaGroupByKey(int.Parse(Request.QueryString["SubArea"])).GroupName;
            string subAreaNameVal = string.Empty;
            if (string.IsNullOrEmpty(subAreaName))
            {
                subAreaNameVal="";
            }
            else
            {
                subAreaNameVal = "SUB-AREA: "+subAreaName;
            }
            ReportDocument REPORT_DOC = new ReportDocument();
            string reportCacheKey = string.Concat("StockInputReport", area, subArea,brand, memoStatus);
            ParameterField prmArea = new ParameterField();
            ParameterField prmAreaName = new ParameterField();
            ParameterField prmSubArea = new ParameterField();
            ParameterField prmSubAreaName = new ParameterField();
            ParameterField prmBrand = new ParameterField();
            ParameterField prmMemoStatus = new ParameterField();
            ParameterField prmDateFrom = new ParameterField();
            ParameterField prmDateTo = new ParameterField();

            ParameterFields prmList = new ParameterFields();

            prmDateFrom.ParameterFieldName = "@datefrom";
            prmDateTo.ParameterFieldName = "@dateto";
            prmBrand.ParameterFieldName = "@brandname";
            prmMemoStatus.ParameterFieldName = "@memostatus";
            prmArea.ParameterFieldName = "@agno";
            prmAreaName.ParameterFieldName = "areaName";
            prmSubArea.ParameterFieldName = "@sub_area";
            prmSubAreaName.ParameterFieldName = "subAreaName";


            ParameterDiscreteValue prmDateFromValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmDateToValue = new ParameterDiscreteValue();
            ParameterDiscreteValue pramBrandValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmMemoStatusValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmAreaValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmAreaNameValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmSubAreaValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmSubAreaNameValue = new ParameterDiscreteValue();

            prmDateFromValue.Value = dateFrom;
            prmDateToValue.Value = dateTo;
            pramBrandValue.Value = brand;
            prmMemoStatusValue.Value =memoStatus;
            prmAreaNameValue.Value = areaName;
            prmSubAreaNameValue.Value = subAreaNameVal;
            prmAreaValue.Value = area;
            prmSubAreaValue.Value = subArea;

            prmDateFrom.CurrentValues.Add(prmDateFromValue);
            prmDateTo.CurrentValues.Add(prmDateToValue);
            prmBrand.CurrentValues.Add(pramBrandValue);
            prmMemoStatus.CurrentValues.Add(prmMemoStatusValue);
            prmArea.CurrentValues.Add(prmAreaValue);
            prmSubArea.CurrentValues.Add(prmSubAreaValue);
            prmAreaName.CurrentValues.Add(prmAreaNameValue);
            prmSubAreaName.CurrentValues.Add(prmSubAreaNameValue);

            prmList.Add(prmDateFrom);
            prmList.Add(prmDateTo);
            prmList.Add(prmBrand);
            prmList.Add(prmMemoStatus);
            prmList.Add(prmArea);
            prmList.Add(prmSubArea);
            prmList.Add(prmSubAreaName);
            prmList.Add(prmAreaName);

             if (Cache[reportCacheKey] != null)
                    {
                        REPORT_DOC = (StockInputReport)Cache[reportCacheKey];
                    }
                    else
                    {
                        REPORT_DOC = new StockInputReport();
                        Cache.Insert(reportCacheKey, REPORT_DOC);
                    }
            DataBaseLogIn(REPORT_DOC);
            this.StockInputReportViewer.ParameterFieldInfo = prmList;
            StockInputReportViewer.ReportSource = REPORT_DOC;
        }
    }
}