using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;
using System.Web.UI.WebControls;

namespace IRMS.BusinessLogic.Manager
{
    public class FittingManager:LogManager<Fitting>
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        FittingAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return FittingAccessor.CreateInstance();
            }
        }

        #endregion

        public List<Fitting> Fittings()
        {
            using (DbManager dbm = new DbManager())
            {
                return Accessor.Query.SelectAll<Fitting>(dbm);
            }
        }

        public void Save(Fitting Fitting)
        {
            using (DbManager dbm =  new DbManager())
            {
                if (Fitting.RecordNumber > 0)
                {
                    Accessor.Query.Update(dbm,Fitting);
                }
                else
                {
                  Identity=Accessor.Query.InsertAndGetIdentity(dbm, Fitting);
                }
            }
        }

        public void Delete(Fitting Fitting)
        {
            using (DbManager dbm = new DbManager())
            {
                Accessor.Query.Delete(dbm,Fitting);
            }
        }

        #region search fittings
        public void SearchFittings(SqlDataSource fittingDataSource, string searchParameter)
        {
            StringBuilder strCmd = new StringBuilder();
            strCmd.Append("SELECT * FROM [FITTINGS] ");
            if (!string.IsNullOrEmpty(searchParameter))
            {
                strCmd.Append(" where FITTING_NAME like '%" + searchParameter + "%' ");
            }
            strCmd.Append(" ORDER BY RECORD_NO DESC");
            fittingDataSource.SelectCommand = strCmd.ToString();
            fittingDataSource.DataBind();
        }
        #endregion
    }
}
