using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using IRMS.ObjectModel;
using BLToolkit.DataAccess;

namespace IRMS.BusinessLogic.DataAccess
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: December 2011
    /// Company: iServe
    /// Class Description: Fabric Data Accessor Template Class
    /// </summary>
    public abstract class FabricAccessor : AccessorBase<FabricAccessor.DB,FabricAccessor>
    {
        /// <summary>
        /// 
        /// </summary>
        public class DB : DbManager
        {
            public DB() : base("IRMSConnectionString")
            {
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [SqlQuery("SELECT * FROM FABRICS WHERE IS_ACTIVE='Yes'")]
        public abstract List<Fabric> Fabrics();
    }
}
