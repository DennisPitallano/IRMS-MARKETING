using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using IRMS.Entities;
using BLToolkit.DataAccess;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class OutRightMarkDownMemoAccessor : AccessorBase<OutRightMarkDownMemoAccessor.DB, OutRightMarkDownMemoAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery(@"SELECT * FROM MDMemoOutrt WHERE ID=@RecordNumber")]
        public abstract OutRightMarkDownMemo GetOutRightMarkDownMemo(int RecordNumber);
    }
}
