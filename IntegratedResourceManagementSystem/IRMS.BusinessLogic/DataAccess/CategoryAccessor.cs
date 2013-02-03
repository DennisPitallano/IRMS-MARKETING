using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.ObjectModel;

namespace IRMS.BusinessLogic.DataAccess
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: December 2011
    /// Company: iServe
    /// Class Description: Category Data Accessor Template Class
    /// </summary>
    public abstract class CategoryAccessor : AccessorBase<CategoryAccessor.DB, CategoryAccessor>
    {
        /// <summary>
        /// 
        /// </summary>
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [SqlQuery("SELECT * FROM CATEGORIES WHERE IS_ACTIVE ='Yes'")]
        public abstract List<Category> Categories();
    }
}
