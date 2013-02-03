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
    public class PullOutLetterSummaryManager : LogManager<PullOutLetterSummary>, IBaseManager<PullOutLetterSummary>
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        PullOutLetterSummaryAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return PullOutLetterSummaryAccessor.CreateInstance(); }
        }
        #endregion

        public void Save(PullOutLetterSummary pullOutLetterSummary)
        {
            using (DbManager dbm = new DbManager())
            {
                if (pullOutLetterSummary.RecordNumber>0)
                {
                    Accessor.Query.Update(pullOutLetterSummary);
                }
                else
                {
                    Identity = Accessor.Query.InsertAndGetIdentity(pullOutLetterSummary);
                }
            }
        }

        public void Save(List<PullOutLetterSummary> pullOutLetterSummaries)
        {
            foreach (var pol in pullOutLetterSummaries)
            {
                Save(pol);
            }
        }

        public void Delete(PullOutLetterSummary pullOutLetterSummary)
        {
            Accessor.Query.Delete(pullOutLetterSummary);
        }

        public void Delete(List<PullOutLetterSummary> pullOutLetterSummaries)
        {
            foreach (var pol in pullOutLetterSummaries)
            {
                Delete(pol);
            }
        }

        public List<PullOutLetterSummary> FetchAll()
        {
            return Accessor.Query.SelectAll<PullOutLetterSummary>() ?? new List<PullOutLetterSummary>();
        }

        public PullOutLetterSummary FetchById(int key)
        {
            return Accessor.Query.SelectByKey<PullOutLetterSummary>(key) ?? new PullOutLetterSummary();
        }

        public List<PullOutLetterSummary> PullOutLetterSummariesByPullOutCode(string pullOutCode)
        {
            var result = FetchAll().Where(s => s.PullOutCode == pullOutCode).ToList() ?? new List<PullOutLetterSummary>();
            return result;
        }
    }
}
