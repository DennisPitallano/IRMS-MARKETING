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
    public class PriceTypeManager:LogManager<PriceType>
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        PriceTypeAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return PriceTypeAccessor.CreateInstance(); }
        }
        #endregion

        public PriceType GetPriceTypeByKey(int id)
        {
            return Accessor.Query.SelectByKey<PriceType>(id) ?? new PriceType();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IList<PriceType> PriceTypes()
        {
            return Accessor.Query.SelectAll<PriceType>();
        }


        public void Save(PriceType PriceType)
        {
            using (DbManager db = new DbManager())
            {
                if (PriceType.PriceTypeId != 0)
                {
                    Accessor.Query.Update(db, PriceType);
                }
                else
                {
                  Identity=Accessor.Query.InsertAndGetIdentity(db, PriceType);
                }
            }
        }


        public void Delete(PriceType PriceType)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, PriceType);
            }
        }


        public void LoadPriceTypes(SqlDataSource PriceTypesDataSource, string search_parameter = "")
        {
            string CommandText = "SELECT [ID], [ListDesc] FROM [lstPriceType] ";
            if (search_parameter != "")
            {
                CommandText += " WHERE ListDesc LIKE '%" + search_parameter + "%' ";
            }
            CommandText += " ORDER BY [ID] DESC";
            PriceTypesDataSource.SelectCommand = CommandText;
            PriceTypesDataSource.DataBind();
        }
    }
}
