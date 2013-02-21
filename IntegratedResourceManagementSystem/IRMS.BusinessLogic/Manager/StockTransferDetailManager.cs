using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.DataAccess;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.Manager
{
    public class StockTransferDetailManager : LogManager<StockTransferDetail>, IBaseManager<StockTransferDetail>
    {
        #region Accessor
        /// <summary>
        /// Init Stock Transfer Detail Accessor
        /// </summary>
        StockTransferDetailAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return StockTransferDetailAccessor.CreateInstance();
            }
        }
        #endregion

        /// <summary>
        /// Save Stock Transfer Detail
        /// </summary>
        /// <param name="stockTransferDetail">Stock Transfer Detail</param>
        public void Save(StockTransferDetail stockTransferDetail)
        {
            using (DbManager dbm = new DbManager())
            {
                if (stockTransferDetail.RecordNumber >0)
                {
                    Accessor.Query.Update(dbm,stockTransferDetail);
                }
                else
                {
                    Identity = Accessor.Query.InsertAndGetIdentity(dbm, stockTransferDetail);
                }
            }
        }

        /// <summary>
        /// Save Stock Transfer Details Collection
        /// </summary>
        /// <param name="stockTransferDetails">List of Stock Transfer Details</param>
        public void Save(List<StockTransferDetail> stockTransferDetails)
        {
            foreach (var st in stockTransferDetails)
            {
                Save(st);
            }
        }

        /// <summary>
        /// Delete Stock Transfer Detail
        /// </summary>
        /// <param name="stockTransferDetail">Stock Transfer Detail</param>
        public void Delete(StockTransferDetail stockTransferDetail)
        {
            using (DbManager dbm = new DbManager())
            {
                Accessor.Query.Delete(stockTransferDetail);
            }
        }

        /// <summary>
        /// Delete Stock Transfer Details Collection
        /// </summary>
        /// <param name="stockTransferDetails">List of Stock Transfer Details</param>
        public void Delete(List<StockTransferDetail> stockTransferDetails)
        {
            foreach (var st in stockTransferDetails)
            {
                Delete(st);
            }
        }

        /// <summary>
        /// Fetch All Stock Transfer Details
        /// </summary>
        /// <returns>Stock Transfer Details Collection</returns>
        public List<StockTransferDetail> FetchAll()
        {
            return Accessor.Query.SelectAll<StockTransferDetail>() ?? new List<StockTransferDetail>();
        }

        /// <summary>
        /// Fetch Stock Transfer Detail By Key
        /// </summary>
        /// <param name="key">Identity</param>
        /// <returns>Stock Transfer Detail</returns>
        public StockTransferDetail FetchById(int key)
        {
            return Accessor.Query.SelectByKey<StockTransferDetail>(key) ?? new StockTransferDetail();
        }

        /// <summary>
        /// Fetch All Stock Transfer Details By ST Code
        /// </summary>
        /// <param name="stCode">ST CODE</param>
        /// <returns>List of Stock Transfer Details</returns>
        public List<StockTransferDetail> FetchAllByCode(string stCode)
        {
            return FetchAll().Where(st => st.StockTransferCode == stCode).ToList() ?? new List<StockTransferDetail>();
        }
    }
}
