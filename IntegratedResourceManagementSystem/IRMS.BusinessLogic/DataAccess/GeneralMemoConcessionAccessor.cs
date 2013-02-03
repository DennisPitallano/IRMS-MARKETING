using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.Entities;
using IRMS.ObjectModel;
using System.Data;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class GeneralMemoConcessionAccessor : AccessorBase<GeneralMemoConcessionAccessor.DB, GeneralMemoConcessionAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery(@"SELECT * FROM GenMemo WHERE MemoNo=@MemoNo")]
        public abstract GeneralMemoConcession GetConcessionMemo(string MemoNo);
    }
}
