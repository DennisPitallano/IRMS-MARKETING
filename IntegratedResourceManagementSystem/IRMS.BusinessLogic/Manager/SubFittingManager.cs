using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.Manager
{
    public class SubFittingManager:LogManager<SubFitting>
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

        public List<SubFitting> SubFittings()
        {
            using (DbManager dbm = new DbManager())
            {
                return Accessor.Query.SelectAll<SubFitting>(dbm);
            }
        }

        public void Save(SubFitting SubFitting)
        {
            using (DbManager dbm = new DbManager())
            {
                if (SubFitting.RecordNumber > 0)
                {
                    Accessor.Query.Update(SubFitting);
                }
                else
                {
                   Identity = Accessor.Query.InsertAndGetIdentity(SubFitting);
                }
            }
        }

        public void Save(List<SubFitting> SubFittings)
        {
            foreach (SubFitting SubFitting in SubFittings)
            {
                Save(SubFitting);
            }
        }

        public void Delete(SubFitting SubFitting)
        {
            using (DbManager dbm = new DbManager())
            {
                Accessor.Query.Delete(SubFitting);
            }
        }
    }
}
