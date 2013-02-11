using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using System.Web.UI.WebControls;

namespace IRMS.BusinessLogic.Manager
{
    public class StockTransferManager : LogManager<StockTransfer>, IBaseManager<StockTransfer>
    {
        #region Accessor
        /// <summary>
        /// Initialize Pull-Out Header Accessor
        /// </summary>
        StockTransferAccessor  Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return StockTransferAccessor.CreateInstance();
            }
        }
        #endregion


        public void Save(StockTransfer model)
        {
            throw new NotImplementedException();
        }

        public void Delete(StockTransfer model)
        {
            throw new NotImplementedException();
        }

        public void Delete(List<StockTransfer> collection)
        {
            throw new NotImplementedException();
        }

        public List<StockTransfer> FetchAll()
        {
            throw new NotImplementedException();
        }

        public StockTransfer FetchById(int key)
        {
            throw new NotImplementedException();
        }

        #region filter
        public void FilterPOL(SqlDataSource POLDataSource, string searchParameter,string searchType, bool forSM)
        {
            StringBuilder strCmd = new StringBuilder();
            strCmd.Append("SELECT * FROM [PULL_OUT_LETTERS] WHERE ([IS_ACTIVE] = @IS_ACTIVE AND IS_BACK_LOAD=@ISBACKLOAD) ");
            if (forSM)
            {
                strCmd.Append(" AND FOR_SM = 1 ");
                if (!string.IsNullOrEmpty(searchParameter))
                {
                    if (searchType =="SERIES")
                    {
                        strCmd.Append(" AND SERIES_NO LIKE '%" + searchParameter + "%' ");
                    }
                    else
                    {
                        strCmd.Append(" AND COMPANY_NAME LIKE '%" + searchParameter + "%' ");
                    }
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(searchParameter))
                {
                    if (searchType == "SERIES")
                    {
                        strCmd.Append(" AND SERIES_NO LIKE '%" + searchParameter + "%' ");
                    }
                    else
                    {
                        strCmd.Append(" AND COMPANY_NAME LIKE '%" + searchParameter + "%' ");
                    }
                }
            }
            POLDataSource.SelectCommand = strCmd.ToString();
            POLDataSource.DataBind();
        }
        #endregion

    }
}
