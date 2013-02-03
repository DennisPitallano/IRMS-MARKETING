﻿using System;
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
    public partial class LUZONDRSummaryPrintPreview : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            InitializeReport();
        }

        private void InitializeReport()
        {
            int year = int.Parse(Request.QueryString["Year"]);
            int month = int.Parse(Request.QueryString["Month"]);
            string DRStatus = Request.QueryString["Status"];
            int days_count = GetMonthDayCount(year, month);

            DateTime DateTo = new DateTime(year, month, days_count);
            DateTime DateFrom = new DateTime(year, month, 1);

            ReportDocument REPORT_DOC = new ReportDocument();
            string reportCacheKey30 = string.Concat("LUZONCDISummary30", year, month, Request.QueryString["Brand"],DRStatus);
            string reportCacheKey31 = string.Concat("LUZONCDISummary31", year, month, Request.QueryString["Brand"],DRStatus);
            string reportCacheKey28 = string.Concat("LUZONCDISummary28", year, month, Request.QueryString["Brand"],DRStatus);
            string reportCacheKey29 = string.Concat("LUZONCDISummary29", year, month, Request.QueryString["Brand"],DRStatus);
            ParameterField prmDateFrom = new ParameterField();
            ParameterField prmDateTo = new ParameterField();
            ParameterField prmBrand = new ParameterField();
            ParameterField prmStatus = new ParameterField();
            ParameterFields prmList = new ParameterFields();

            prmDateFrom.ParameterFieldName = "@date_from_param";
            prmDateTo.ParameterFieldName = "@date_to_param";
            prmBrand.ParameterFieldName = "@brand_name";
            prmStatus.ParameterFieldName = "@dr_status";

            ParameterDiscreteValue prmDateFromValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmDateToValue = new ParameterDiscreteValue();
            ParameterDiscreteValue pramBrandValue = new ParameterDiscreteValue();
            ParameterDiscreteValue prmStatusValue = new ParameterDiscreteValue();

            prmDateFromValue.Value = DateFrom;
            prmDateToValue.Value = DateTo;
            pramBrandValue.Value = Request.QueryString["Brand"];
            prmStatusValue.Value = DRStatus;

            prmDateFrom.CurrentValues.Add(prmDateFromValue);
            prmDateTo.CurrentValues.Add(prmDateToValue);
            prmBrand.CurrentValues.Add(pramBrandValue);
            prmStatus.CurrentValues.Add(prmStatusValue);

            prmList.Add(prmDateFrom);
            prmList.Add(prmDateTo);
            prmList.Add(prmBrand);
            prmList.Add(prmStatus);
            switch (days_count)
            {
                case 30:
                    if (Cache[reportCacheKey30] != null)
                    {
                        REPORT_DOC = (RptCDISummaryLuzon30)Cache[reportCacheKey30];
                    }
                    else
                    {
                        REPORT_DOC = new RptCDISummaryLuzon30();
                        Cache.Insert(reportCacheKey30, REPORT_DOC);
                    }
                    break;
                case 31:
                    if (Cache[reportCacheKey31] != null)
                    {
                        REPORT_DOC = (RptCDISummaryLuzon31)Cache[reportCacheKey31];
                    }
                    else
                    {
                        REPORT_DOC = new RptCDISummaryLuzon31();
                        Cache.Insert(reportCacheKey31, REPORT_DOC);
                    }
                    break;
                case 28:
                    if (Cache[reportCacheKey28] != null)
                    {
                        REPORT_DOC = (RptCDISummaryLuzon28)Cache[reportCacheKey28];
                    }
                    else
                    {
                        REPORT_DOC = new RptCDISummaryLuzon28();
                        Cache.Insert(reportCacheKey28, REPORT_DOC);
                    }
                    break;
                case 29:
                    if (Cache[reportCacheKey29] != null)
                    {
                        REPORT_DOC = (RptCDISummaryLuzon29)Cache[reportCacheKey29];
                    }
                    else
                    {
                        REPORT_DOC = new RptCDISummaryLuzon29();
                        Cache.Insert(reportCacheKey29, REPORT_DOC);
                    }
                    break;
                default:
                    break;
            }
            DataBaseLogIn(REPORT_DOC);
            this.LUZONDRSummaryReport.ParameterFieldInfo = prmList;
            LUZONDRSummaryReport.ReportSource = REPORT_DOC;
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