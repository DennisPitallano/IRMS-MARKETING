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
    /// Class Description: Garment Data Accessor Manager Class
    /// </summary>
   public class GarmentManager:LogManager<Garment>
   {
       #region Accessor
       /// <summary>
       /// 
       /// </summary>
       GarmentAccessor Accessor
       {
           [System.Diagnostics.DebuggerStepThrough]
           get { return GarmentAccessor.CreateInstance(); }
       }
       #endregion
       /// <summary>
       /// 
       /// </summary>
       /// <param name="id"></param>
       /// <returns></returns>
       public Garment GetGarmentByKey(long id)
       {
           return Accessor.Query.SelectByKey<Garment>(id) ?? new Garment();
       }
       /// <summary>
       /// 
       /// </summary>
       /// <returns></returns>
       public List<Garment> Garments()
       {
           return Accessor.Garments();
       }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="garment"></param>
       public void Save(Garment garment)
       {
           using (DbManager db = new DbManager())
           {
               if (garment.RecordNo != 0)
               {
                   Accessor.Query.Update(db, garment);
               }
               else
               {
                 Identity=Accessor.Query.InsertAndGetIdentity(db, garment);
               }
           }
       }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="garment"></param>
       public void Delete(Garment garment)
       {
           using (DbManager db = new DbManager())
           {
               Accessor.Query.Delete(db, garment);
           }
       }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="search_parameter"></param>
       /// <returns></returns>
       public List<Garment> SearchGarments(string[] search_parameter)
       {
           string[] columns = new string[2];
           columns[0] = "GARMENT_CODE";
           columns[1] = "GARMENT_DESCRIPTION";
           return Accessor.Query.SelectByKeyWords<Garment>(search_parameter, columns);
       }

       #region filter_query
       public void LoadGarments(SqlDataSource GarmentDataSource, string search_parameter="")
       {
           string CommandText = "SELECT [RECORD_NO], [GARMENT_CODE], [GARMENT_DESCRIPTION], [TOP_OR_BOTTOM], [DATE_RECORDED] FROM [GARMENTS] ";
           if (search_parameter != "")
           {
               CommandText += " WHERE GARMENT_CODE LIKE '%" + search_parameter + "%' OR GARMENT_DESCRIPTION LIKE '%"+search_parameter +"%'";
           }
           GarmentDataSource.SelectCommand = CommandText;
           GarmentDataSource.SelectCommandType = SqlDataSourceCommandType.Text;
           GarmentDataSource.DataBind();
       }
       #endregion
   }
}
