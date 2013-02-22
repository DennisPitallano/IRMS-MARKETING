using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class FabricSupplierAccessor : AccessorBase<FabricSupplierAccessor.DB, FabricSupplierAccessor>
    {
        /// <summary>
        /// 
        /// </summary>
        public class DB : DbManager
        {
            public DB()
                : base("IRMSConnectionString")
            {
            }
        }
    }
}
