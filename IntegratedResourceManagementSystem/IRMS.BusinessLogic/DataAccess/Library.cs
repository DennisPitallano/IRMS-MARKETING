using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Aspects;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using BLToolkit.Reflection;
using System.Data;
namespace IRMS.BusinessLogic.DataAccess
{
    public class ISERVELibrary 
    {
        public DateTime GetServerDate()
        {
            DateTime ServerDate = DateTime.Now;
            string sResult = string.Empty;
            using (DbManager db = new DbManager())
            {

                ServerDate = Convert.ToDateTime(db.SetCommand("select getdate() as CurrentDate").ExecuteScalar());
            }
            return ServerDate;
        }
    }
}
