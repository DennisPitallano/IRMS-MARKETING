using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.ObjectModel;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class RankAccessor : AccessorBase<RankAccessor.DB, RankAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") {} }

        [SqlQuery("select * from Rank")]
        public abstract List<Rank> AllRank();

        [SqlQuery("select * from Ran where pricetype=@Price_Type")]
        public abstract List<Rank> GetPriceType(string Price_Type);
    }
}
