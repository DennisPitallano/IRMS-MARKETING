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
    public class GenericStyleManager:LogManager<GenericStyleProduct>
    {
        #region Accessor
        /// <summary>
        /// Initialize Style Accessor
        /// </summary>
        StyleAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return StyleAccessor.CreateInstance();
            }
        }
        #endregion

        public List<GenericStyleProduct> GenericStyles()
        {
            using (DbManager dbm = new DbManager())
            {
               return Accessor.Query.SelectAll<GenericStyleProduct>(dbm);
            }
        }

        public void Save(GenericStyleProduct GenericStyleProduct)
        {
            using (DbManager dbm = new DbManager())
            {
                if (GenericStyleProduct.RecordNumber > 0)
                {
                    Accessor.Query.Update(dbm, GenericStyleProduct);
                }
                else
                {
                  Identity = Accessor.Query.InsertAndGetIdentity(dbm, GenericStyleProduct);
                }
            }
        }

        public void Save(List<GenericStyleProduct> GenericStyleProducts)
        {
            foreach (GenericStyleProduct gen_style_prod in GenericStyleProducts)
            {
                Save(gen_style_prod);
            }
        }

        public void Delete(GenericStyleProduct GenericStyleProduct)
        {
            using (DbManager dbm = new DbManager())
            {
                Accessor.Query.Delete(dbm, GenericStyleProduct);
            }
        }

        public void UpdateStyleActiveStatus(bool isActive, string styleNumber)
        {
            Accessor.UpdateStyleActiveStatus(isActive, styleNumber);
        }

        #region Search Generic Style
        public void SearchGenericStyles(SqlDataSource genericStyleDataSource, string searchParameter)
        {
            StringBuilder strCommand = new StringBuilder();
            strCommand.Append("SELECT [StyleID], [StyleNo], [BrandName], [StyleDesc], [Cost] FROM [Style] WHERE ([IsGeneric] = @IsGeneric) and IsActive=1");
            if (!string.IsNullOrEmpty(searchParameter))
            {
                strCommand.Append(" and StyleNo LIKE '%"+searchParameter+"%' ");
            }
            strCommand.Append("  ORDER BY StyleID DESC");
            genericStyleDataSource.SelectCommand = strCommand.ToString();
            genericStyleDataSource.DataBind();
        }
        #endregion
    }
}
