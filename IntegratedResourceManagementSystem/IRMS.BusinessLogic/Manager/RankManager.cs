using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.Manager
{
    public class RankManager
    {
        #region Accessor
        
        RankAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return RankAccessor.CreateInstance(); }
        }
        
        #endregion

        public List<Rank> AllRanks()
        {
            return Accessor.AllRank();
        }

        public List<Rank> GetPriceType(string Type)
        { 
            return Accessor.GetPriceType(Type);
        }
    }
}
