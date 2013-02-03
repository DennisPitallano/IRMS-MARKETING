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
    public abstract  class GeneralMemoConcessionDetailAccessor: AccessorBase<GeneralMemoConcessionDetailAccessor.DB, GeneralMemoConcessionDetailAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("select * from GenMemoDtl where GenMemoID = @GenMemoID")]
        public abstract List<GeneralMemoConcessionDetail> GetMemoDetailsByMemoID(long GenMemoID);
    }
}
