using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using System.Web.UI.WebControls;
using BLToolkit.DataAccess;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.Manager
{
    /// <summary>
    /// Author :Dennis Pitallano
    /// </summary>
    /// <Author>
    /// Dennis Pitallano
    /// </Author>
    /// <DateCreated>
    /// 2/13/2013 10PM
    /// </DateCreated>
    /// <Description>
    /// Stock Transfer Manager Class
    /// </Description>
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

        /// <summary>
        /// Save/Update Stock Transfer
        /// </summary>
        /// <param name="stockTransfer">Stock Transfer</param>
        public void Save(StockTransfer stockTransfer)
        {
            using (DbManager dbm = new DbManager())
            {
                if (stockTransfer.RecordNumber >0)
                {
                    Accessor.Query.Update(dbm, stockTransfer);
                }
                else
                {
                   Identity = Accessor.Query.InsertAndGetIdentity(dbm, stockTransfer);
                }
            }
        }

        /// <summary>
        /// Save/Update Stock Transfers
        /// </summary>
        /// <param name="stockTransfers">Stock Transfers Collection</param>
        public void Save(List<StockTransfer> stockTransfers)
        {
            foreach (var st in stockTransfers)
            {
                Save(st);
            }
        }

        /// <summary>
        /// Delete Stock Transfer
        /// </summary>
        /// <param name="stockTransfer">Stock Transfer</param>
        public void Delete(StockTransfer stockTransfer)
        {
            using (DbManager dbm = new DbManager())
            {
                Accessor.Query.Delete(dbm,stockTransfer);
            }
        }

        /// <summary>
        /// Delete Stock Transfers
        /// </summary>
        /// <param name="stockTransfers">Stock Transfers Collection</param>
        public void Delete(List<StockTransfer> stockTransfers)
        {
            foreach (var st in stockTransfers)
            {
                Delete(st);   
            }
        }

        /// <summary>
        /// Fetch All Stock Transfers
        /// </summary>
        /// <returns>Stock Transfers Collectios</returns>
        public List<StockTransfer> FetchAll()
        {
            return Accessor.Query.SelectAll<StockTransfer>() ?? new List<StockTransfer>();
        }

        /// <summary>
        /// Fetch Stock Transfer By Identity
        /// </summary>
        /// <param name="key">Identity</param>
        /// <returns>Stock Transfer</returns>
        public StockTransfer FetchById(int key)
        {
            return Accessor.Query.SelectByKey<StockTransfer>(key) ?? new StockTransfer();
        }

        /// <summary>
        /// Fetch Stock Transfer By ST CODE
        /// </summary>
        /// <param name="stCode">ST CODE</param>
        /// <returns>Stock Transfer</returns>
        public StockTransfer FetchByCode(string stCode)
        {
            return FetchAll().FirstOrDefault(st => st.StockTransferCode == stCode) ?? new StockTransfer();
        }

        public long getDRNumberSequenceNumber(int CompanyNumber)
        {
            return Accessor.getDRNumberSequenceNumber(CompanyNumber, "IRMS");
        }

        #region filter
        /// <summary>
        /// Filter POL List Collection
        /// </summary>
        /// <param name="POLDataSource">POL DataSource</param>
        /// <param name="searchParameter">search Parameter</param>
        /// <param name="searchType"></param>
        /// <param name="forSM"></param>
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
            strCmd.Append(" AND ID NOT IN (SELECT POL_ID FROM STOCK_TRANSFERS)");
            POLDataSource.SelectCommand = strCmd.ToString();
            POLDataSource.DataBind();
        }
        #endregion

    }
}
