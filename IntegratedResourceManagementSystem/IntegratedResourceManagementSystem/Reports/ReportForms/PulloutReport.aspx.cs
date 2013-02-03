using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.Shared;
using IntegratedResourceManagementSystem.Reports.ReportDocuments;
using CrystalDecisions.CrystalReports.Engine;
using System.Configuration;
using System.Data;
using IRMS.Components;
using System.Data.SqlClient ;
namespace IntegratedResourceManagementSystem.Reports.ReportForms
{
    public partial class TransactionReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            PulloutReports();
            
        }

        private void PulloutReports()
        {
            //string rptDocCachedKey = null;
            ReportDocument rpt =  new PulloutRequest();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["IRMSConnectionString"].ConnectionString);
            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandTimeout = 3000;

            DataTable ResultSet = new DataTable();
            cmd.CommandText = "select agno from custinfo a inner join PULLOUT_HDR b on a.custno = b.customer_no where a.ynheadoffice=0 and b.id = '" + Session["ID"] + "'";

            using (SqlDataAdapter adapter = new SqlDataAdapter())
            {
                adapter.SelectCommand = cmd;
                adapter.Fill(ResultSet);
            }
            foreach(DataRow row in ResultSet.Rows)
            {
            //rptDocCachedKey = "PULLOUT";
                //int AGNO = ;
                if ((int)row[0] != 1)
                {
                    //if (rptDocCachedKey != null)
                    //{
                    //    rpt = (PulloutRequest)Cache[rptDocCachedKey];
                    //}
                    //else
                    //{
                    rpt = new PulloutRequestProv();
                    //    Cache.Insert(rptDocCachedKey, rpt);
                    //}
                }
                else
                {
                    //if (rptDocCachedKey != null)
                    //{
                    //    rpt = (PulloutRequestProv)Cache[rptDocCachedKey];
                    //}
                    //else
                    //{
                        rpt = new PulloutRequest();
                    //    Cache.Insert(rptDocCachedKey, rpt);
                    //}
                }
            }
            conn.Close();

            DataBaseLogIn(rpt);

            ParameterField prmID = new ParameterField();
            ParameterFields prmList = new ParameterFields();

            prmID.ParameterFieldName = "ID";

            ParameterDiscreteValue prmIDValue = new ParameterDiscreteValue();

            prmIDValue.Value = Session["ID"];

            prmID.CurrentValues.Add(prmIDValue);
            
            prmList.Add(prmID);

            crvPulloutReport.ParameterFieldInfo = prmList;
            crvPulloutReport.ReportSource = rpt;
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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Redirector.Redirect("~/Marketing/RequestPanel.aspx");
        }
    }
}