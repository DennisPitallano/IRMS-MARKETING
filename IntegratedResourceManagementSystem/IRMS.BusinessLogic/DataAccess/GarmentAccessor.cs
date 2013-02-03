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
    /// Class Description: Garment Data Accessor Template Class
    /// </summary>
   public abstract class GarmentAccessor : AccessorBase<GarmentAccessor.DB,GarmentAccessor>
    {
       /// <summary>
       /// 
       /// </summary>
       public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

       /// <summary>
       /// 
       /// </summary>
       /// <returns></returns>
       [SqlQuery("SELECT * FROM GARMENTS WHERE IS_ACTIVE ='Yes'")]
       public abstract  List<Garment> Garments();
    }
}
