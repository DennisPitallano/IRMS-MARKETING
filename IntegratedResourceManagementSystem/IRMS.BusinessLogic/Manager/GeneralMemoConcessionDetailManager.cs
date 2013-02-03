using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.Entities;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.Manager
{
    public class GeneralMemoConcessionDetailManager
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        GeneralMemoConcessionDetailAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return GeneralMemoConcessionDetailAccessor.CreateInstance(); }
        }
        #endregion

        public List<GeneralMemoConcessionDetail> GetGeneralMemoConcessionDetailByID(long id)
        {
            return Accessor.GetMemoDetailsByMemoID(id);
        }

        public GeneralMemoConcessionDetail GetGeneralMemoConcessionDetailByKey(long id)
        {
            return Accessor.Query.SelectByKey<GeneralMemoConcessionDetail>(id) ?? new GeneralMemoConcessionDetail();
        }

        public void Delete( GeneralMemoConcessionDetail GMConcessionDetail )
        {
            using (DbManager dbm = new DbManager())
            {
                Accessor.Query.Delete(dbm,GMConcessionDetail);
            }
        }

        public void Delete(List<GeneralMemoConcessionDetail> GMConcessionDetails)
        {
            foreach (GeneralMemoConcessionDetail GMCD in GMConcessionDetails)
            {
                Delete(GMCD);
            }
        }

        public void DeleteByMemoID(int MemoID)
        {
            using (DbManager dbm = new DbManager())
            {
                dbm.SetCommand(string.Format("DELETE FROM GENMEMODTL WHERE GENMEMOID = {0}", MemoID)).ExecuteNonQuery();
            }
        }
        public void Save(GeneralMemoConcessionDetail Object)
        {
            using (DbManager dbm = new DbManager())
            {
                Accessor.Query.Insert(dbm, Object);
            }
        }
    }
}
