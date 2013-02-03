using System;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.Manager
{
    public class PullOutDetailManager:LogManager<PullOutLetterDetail>, IBaseManager<PullOutLetterDetail>
    {
        #region Accessor
        /// <summary>
        /// Initialize Pull-Out Detail Accessor
        /// </summary>
        PulloutDetailAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return PulloutDetailAccessor.CreateInstance();
            }
        }

        #endregion

        public PullOutLetterDetail GetPODetailByID(long RecordNo)
        {
            return Accessor.Query.SelectByKey<PullOutLetterDetail>(RecordNo) ?? new PullOutLetterDetail();
        }

        public List<PullOutLetterDetail> GetPODetailByHDR_id(long Header_id)
        {
            return Accessor.GetPODetailByRequests(Header_id);
        }

        public List<PullOutLetterDetail> GetPODetailsByRequest(int Cust_No, DateTime PO_Date)
        {
            return Accessor.GetPODetailByRequest(Cust_No, PO_Date);
        }

        public List<PullOutLetterDetail> GetPODetailByBox_No(int Box_No)
        {
            return Accessor.GetPODetailByBoxNo(Box_No);
        }

        public List<PullOutLetterDetail> GetPODetailByStyle_No(string Style_No)
        {
            return Accessor.GetPODetailByStyle(Style_No);
        }

        public List<PullOutLetterDetail> GetPODetailByStyle_NoAndBox_No(string Style_No, int Box_no)
        {
            return Accessor.GetPODetailByStyleAndBoxNo(Style_No, Box_no);
        }

        public void SaveItems(PullOutLetterDetail PD)
        {
            using (DbManager db = new DbManager())
            {
                if (PD.RecordNumber != 0)
                {
                    Accessor.Query.Update(db, PD);
                }
                else
                {
                    Accessor.Query.Insert(db, PD);
                }
            }
        }

        public int GetIdentity(PullOutLetter PD)
        {
            int Identity = 0;
            try
            {
                using (DbManager db = new DbManager())
                {
                    Identity = Accessor.Query.InsertAndGetIdentity(PD);
                }
            }
            catch (Exception)
            {

            }

                return Identity;
        }

        public void DeleteItems(PullOutLetterDetail PD)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, PD);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="pullOutLetterDetail"></param>
        public void Save(PullOutLetterDetail pullOutLetterDetail)
        {
            using (DbManager dbm = new DbManager())
            {
                if (pullOutLetterDetail.RecordNumber >0)
                {
                    Accessor.Query.Update(dbm, pullOutLetterDetail);
                }
                else
                {
                    Accessor.Query.Insert(dbm, pullOutLetterDetail);
                }
            }
        }

        public void Save(List<PullOutLetterDetail> pullOutLetterDetails)
        {
            foreach (var pullOutLetterDetail in pullOutLetterDetails)
            {
                Save(pullOutLetterDetail);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="model"></param>
        public void Delete(PullOutLetterDetail pullOutLetterDetail)
        {
            using (DbManager dbm = new DbManager())
            {
                Accessor.Query.Delete(dbm, pullOutLetterDetail);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="collection"></param>
        public void Delete(List<PullOutLetterDetail> pullOutLetterDetails)
        {
            foreach (var pullOutLetterDetail in pullOutLetterDetails)
            {
                Delete(pullOutLetterDetail);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<PullOutLetterDetail> FetchAll()
        {
            return Accessor.Query.SelectAll<PullOutLetterDetail>() ?? new List<PullOutLetterDetail>();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public PullOutLetterDetail FetchById(int key)
        {
            return Accessor.Query.SelectByKey<PullOutLetterDetail>(key) ?? new PullOutLetterDetail();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="pullOutCode"></param>
        /// <returns></returns>
        public List<PullOutLetterDetail> PullOutLetterDetailsByPullOutCode(string pullOutCode)
        {
            var result = FetchAll().Where(s => s.PullOutLetterCode == pullOutCode).ToList() ?? new List<PullOutLetterDetail>();
            return result;
        }
    }
}
