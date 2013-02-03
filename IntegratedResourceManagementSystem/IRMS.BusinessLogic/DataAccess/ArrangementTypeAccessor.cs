using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.DataAccess
{
    /// <summary>
    /// Dennis Pitallano    
    /// </summary>
    public abstract class ArrangementTypeAccessor :AccessorBase<ArrangementTypeAccessor.DB,ArrangementTypeAccessor>
    {
          public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }
    }
}
