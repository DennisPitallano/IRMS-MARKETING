using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.DataAccess
{
    /// <summary>
    /// Dennis Pitallano    
    /// July 19, 2012 11:39 AM
    /// </summary>
    public abstract class TermAccessor : AccessorBase<TermAccessor.DB,TermAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }
    }
}
