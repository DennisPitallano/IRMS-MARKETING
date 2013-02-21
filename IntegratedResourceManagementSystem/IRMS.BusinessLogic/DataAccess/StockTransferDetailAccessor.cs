using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class StockTransferDetailAccessor: AccessorBase<StockTransferDetailAccessor.DB ,StockTransferDetailAccessor>
    {
          public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }
    }
}
