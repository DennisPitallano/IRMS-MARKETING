using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;
using System.Web.UI.WebControls;

namespace IRMS.BusinessLogic.Manager
{   
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: December 2011
    /// Company: iServe
    /// Class Description: Brand Data Accessor Manager Class
    /// </summary>
    public class FabricManager:LogManager<Fabric>
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        FabricAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return FabricAccessor.CreateInstance(); }
        }
        #endregion
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Fabric GetFabricByKey(long id)
        {
            return Accessor.Query.SelectByKey<Fabric >(id) ?? new Fabric();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<Fabric> Fabrics()
        {
            return Accessor.Fabrics();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="fabric"></param>
        public void Save(Fabric fabric)
        {
            using (DbManager db = new DbManager())
            {
                if (fabric.RecordNo != 0)
                {
                    Accessor.Query.Update(db, fabric);
                }
                else
                {
                  Identity=Accessor.Query.InsertAndGetIdentity(db, fabric);
                }
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="fabric"></param>
        public void Delete(Fabric fabric)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, fabric);
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="search_parameter"></param>
        /// <returns></returns>
        public List<Fabric> SearchFabrics(string[] search_parameter)
        {
            string[] columns = new string[2];
            columns[0] = "FABRIC_CODE";
            columns[1] = "FABRIC_DESCRIPTION";
            return Accessor.Query.SelectByKeyWords<Fabric>(search_parameter, columns);
        }

        #region filter_query
        public void LoadFabrics(SqlDataSource FabricDataSource,string search_parameter="")
        {
            string CommandText = "SELECT [RECORD_NO], [FABRIC_CODE], [FABRIC_DESCRIPTION], [TOP_OR_BOTTOM], [DATE_RECORDED] FROM [FABRICS] ";
            if (search_parameter != "")
            {
                CommandText += " WHERE FABRIC_CODE LIKE '%"+ search_parameter +"%' OR FABRIC_DESCRIPTION LIKE '%"+search_parameter +"%' ";
            }
            FabricDataSource.SelectCommand = CommandText;
            FabricDataSource.SelectCommandType = SqlDataSourceCommandType.Text;
            FabricDataSource.DataBind();
        }
        #endregion
    }
}
