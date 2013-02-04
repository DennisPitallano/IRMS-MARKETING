using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.Entities;
using BLToolkit.Data;
using System.Web.UI.WebControls;

namespace IRMS.BusinessLogic.Manager
{
    /// <summary>
    /// Dennis Pitallano
    /// July 19,2012 11:26 AM
    /// </summary>
    public class ArrangementTypeManager:LogManager<ArrangementType>
    {
            #region Accessor
            /// <summary>
            /// 
            /// </summary>
            ArrangementTypeAccessor Accessor
            {
                [System.Diagnostics.DebuggerStepThrough]
                get { return ArrangementTypeAccessor.CreateInstance(); }
            }
            #endregion

            public ArrangementType GetarrangementpeTyByKey(int id)
            {
                return Accessor.Query.SelectByKey<ArrangementType>(id) ?? new ArrangementType();
            }

            /// <summary>
            /// 
            /// </summary>
            /// <returns></returns>
            public IList<ArrangementType> ArrangementTypes()
            {
                return Accessor.Query.SelectAll<ArrangementType>();
            }


            public void Save(ArrangementType ArrangementType)
            {
                using (DbManager db = new DbManager())
                {
                    if (ArrangementType.ArrangementId != 0)
                    {
                        Accessor.Query.Update(db, ArrangementType);
                    }
                    else
                    {
                       Identity = Accessor.Query.InsertAndGetIdentity(db, ArrangementType);
                    }
                }
            }

            /// <summary>
            /// 
            /// </summary>
            /// <param name="fabric"></param>
            public void Delete(ArrangementType ArrangementType)
            {
                using (DbManager db = new DbManager())
                {
                    Accessor.Query.Delete(db, ArrangementType);
                }
            }


            public void LoadArrangementTypes(SqlDataSource ArrangementTypeDataSource, string search_parameter = "")
            {
                string CommandText = "SELECT [ID], [ListDesc] FROM [lstArrangeType] ";
                if (search_parameter != "")
                {
                    CommandText += " WHERE ListDesc LIKE '%" + search_parameter + "%' ";
                }
                CommandText += " ORDER BY [ID] DESC";
                ArrangementTypeDataSource.SelectCommand = CommandText;
                ArrangementTypeDataSource.DataBind();
            }
        }
}
