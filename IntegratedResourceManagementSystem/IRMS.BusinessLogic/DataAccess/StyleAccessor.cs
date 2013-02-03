using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using IRMS.ObjectModel;
using BLToolkit.DataAccess;
using IRMS.Entities;
namespace IRMS.BusinessLogic.DataAccess
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: December 2011
    /// Company: iServe
    /// Class Description: Initialize Data Access for Style Entity
    /// </summary>
    public abstract class StyleAccessor : AccessorBase<StyleAccessor.DB, StyleAccessor>
    {
        public class DB : DbManager
        {
            public DB() : base("IRMSConnectionString")
            {
            }
        }

        /// <summary>
        /// Get Style by Style Number.
        /// </summary>
        /// <param name="style_number">Style Number</param>
        /// <returns></returns>
        [SqlQuery("SELECT * FROM STYLES WHERE STYLE_NUMBER=@style_number")]
        public abstract ItemStyle GetStyleByStyleNumber(string style_number);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="style_number"></param>
        /// <returns></returns>
        [SqlQuery("SELECT * FROM Style WHERE StyleNo=@style_number")]
        public abstract ProductStyle GetStyleByStyleNumberFromOld(string style_number);

        /// <summary>
        /// Get Collection of Style by style Status
        /// </summary>
        /// <param name="status"></param>
        /// <returns></returns>
        [SqlQuery("SELECT * FROM STYLES WHERE IS_APPROVE=@status")]
        public abstract List<ItemStyle> GetStylesByStatus(string status);

        [SqlQuery(@"UPDATE STYLES SET IS_ACTIVE=@Status where STYLE_NUMBER=@StyleNumber")]
        public abstract void UpdateStyleActiveStatus(bool Status, string StyleNumber);
    }
}
