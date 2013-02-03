using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.Entities;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class ConcessionMarkDownMemoAccessor : AccessorBase<ConcessionMarkDownMemoAccessor.DB, ConcessionMarkDownMemoAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery(@"SELECT * FROM MDMemoCncn WHERE ID=@RecordNumber")]
        public abstract ConcessionMarkDownMemo GetConcessionMarkDownMemo(int RecordNumber);
    }
}
