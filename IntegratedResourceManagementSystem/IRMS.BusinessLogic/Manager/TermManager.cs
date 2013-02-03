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
    /// July 19, 2012 11:39 AM
    /// </summary>
    public class TermManager:LogManager<Term>
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        TermAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return TermAccessor.CreateInstance(); }
        }
        #endregion

        public Term GetTermByKey(int id)
        {
            return Accessor.Query.SelectByKey<Term>(id) ?? new Term();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IList<Term> Terms()
        {
            return Accessor.Query.SelectAll<Term>();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="fabric"></param>
        public void Save(Term Term)
        {
            using (DbManager db = new DbManager())
            {
                if (Term.TermId != 0)
                {
                    Accessor.Query.Update(db, Term);
                }
                else
                {
                   Identity=Accessor.Query.InsertAndGetIdentity(db, Term);
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="fabric"></param>
        public void Delete(Term Term)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, Term);
            }
        }


        public void LoadTerms(SqlDataSource TermDataSource, string search_parameter = "")
        {
            string CommandText = "SELECT [ID], [ListDesc] FROM [lstTerms] ";
            if (search_parameter != "")
            {
                CommandText += " WHERE ListDesc LIKE '%" + search_parameter + "%' ";
            }
            CommandText += " ORDER BY [ID] DESC";
            TermDataSource.SelectCommand = CommandText;
            TermDataSource.DataBind();
        }
    }
}
