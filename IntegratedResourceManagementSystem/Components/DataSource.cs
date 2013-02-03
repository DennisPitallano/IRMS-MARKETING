using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using System.Configuration;

namespace IRMS.Components
{
    public static class DataSource
    {

        static string ConnectionString = ConfigurationManager.ConnectionStrings["IRMSConnectionString"].ConnectionString;
      
       public static SqlDataSource IRMSDataSource(string ConnectionString)
        {
           SqlDataSource DATA_SOURCE = new SqlDataSource();
           DATA_SOURCE.ConnectionString = ConnectionString;
           //DATA_SOURCE.ProviderName = ProviderName;
           DATA_SOURCE.SelectCommand = "Select * from lstDept";
           return DATA_SOURCE;
        }

    }
}
