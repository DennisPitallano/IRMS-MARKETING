using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.ObjectModel;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class PriceGroupAccessor : AccessorBase<PriceGroupAccessor.DB, PriceGroupAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery(@"SELECT  * FROM GRPPRICE")]
        public abstract List<PriceGroup> AllPriceGroup();

        [SqlQuery(@"SELECT * FROM GRPPRICE WHERE YNCONCESSION = 1")]
        public abstract List<PriceGroup> GetPriceGroupByConcession();
    }

    public abstract class PriceGroupAddValueAccessor : AccessorBase<PriceGroupAddValueAccessor.DB, PriceGroupAddValueAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery(@"SELECT * FROM GRPPRICEADDVALUE")]
        public abstract List<PriceGroupAddValue> AllPriceGroupValue();

        [SqlQuery(@"SELECT * FROM GRPPRICEADDVALUE WHERE PGNO = @PGNo")]
        public abstract PriceGroupAddValue GetPriceGroupValueByPriceGroup(int PGNo);
    }

}
