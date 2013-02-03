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
    /// july 19, 2012 11:44 AM
    /// </summary>
    public class FormulaManager:LogManager<Formula>
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        FormulaAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return FormulaAccessor.CreateInstance(); }
        }
        #endregion

        public Formula GetFormulaByKey(int id)
        {
            return Accessor.Query.SelectByKey<Formula>(id) ?? new Formula();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IList<Formula> Formulas()
        {
            return Accessor.Query.SelectAll<Formula>();
        }


        public void Save(Formula Formula)
        {
            using (DbManager db = new DbManager())
            {
                if (Formula.FormulaId != 0)
                {
                    Accessor.Query.Update(db, Formula);
                }
                else
                {
                  Identity=Accessor.Query.InsertAndGetIdentity(db, Formula);
                }
            }
        }

      
        public void Delete(Formula Formula)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, Formula);
            }
        }


        public void LoadFormulas(SqlDataSource FormulaDataSource, string search_parameter = "")
        {
            string CommandText = "SELECT [ID], [ListDesc] FROM [lstFormula] ";
            if (search_parameter != "")
            {
                CommandText += " WHERE ListDesc LIKE '%" + search_parameter + "%' ";
            }
            CommandText += " ORDER BY [ID] DESC";
            FormulaDataSource.SelectCommand = CommandText;
            FormulaDataSource.DataBind();
        }
    }
}
