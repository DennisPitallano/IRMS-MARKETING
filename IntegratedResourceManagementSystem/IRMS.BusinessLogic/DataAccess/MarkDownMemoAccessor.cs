using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.Entities;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class MarkDownMemoAccessor : AccessorBase<MarkDownMemoAccessor.DB, MarkDownMemoAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery(@"SELECT * FROM MDMemo WHERE ID=@RecordNumber")]
        public abstract MarkDownMemo GetMarkDownMemoByIdNumber(int RecordNumber);

        [SqlQuery(@"DELETE ")]
        public abstract void DeleteMarkDownMemo(int RecordNumber);
    }
}
