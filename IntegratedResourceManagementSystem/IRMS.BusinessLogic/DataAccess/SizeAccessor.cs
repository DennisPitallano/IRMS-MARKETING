using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using BLToolkit.DataAccess;
using BLToolkit.Data;
using IRMS.ObjectModel;
namespace IRMS.BusinessLogic.DataAccess
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: December 2011
    /// Company: iServe
    /// Class Description: Size Data Accessor Template Class
    /// </summary>
   public abstract class SizeAccessor: AccessorBase <SizeAccessor.DB,SizeAccessor>
    {
       /// <summary>
       /// 
       /// </summary>
       public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

    }
}
