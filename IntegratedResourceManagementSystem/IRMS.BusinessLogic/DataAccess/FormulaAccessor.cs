using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.DataAccess
{
    /// <summary>
    /// Dennis Pitallano
    /// July 109, 2012 11:40 AM
    /// </summary>
    public abstract class FormulaAccessor : AccessorBase<FormulaAccessor.DB, FormulaAccessor>
    {
        public class DB: DbManager { public DB(): base("IRMSConnectionString"){}}
    }
}
