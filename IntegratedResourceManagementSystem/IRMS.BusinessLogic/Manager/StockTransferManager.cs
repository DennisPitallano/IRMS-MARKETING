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
        public void FilterPOL(SqlDataSource POLDataSource, string searchParameter,string searchType, string forSM)
        {
            StringBuilder strCmd = new StringBuilder();
            strCmd.Append("SELECT * FROM [PULL_OUT_LETTERS] WHERE ([IS_ACTIVE] =1 AND IS_BACK_LOAD=0) ");
            switch (forSM)
            {
                case "True":
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
                    break;
                case "False":
                        strCmd.Append(" AND FOR_SM = 0 ");
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
                    break;
                default:
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
                    break;
            }
            POLDataSource.SelectCommand = strCmd.ToString();
            POLDataSource.DataBind();
        }
        #endregion

    }
}
