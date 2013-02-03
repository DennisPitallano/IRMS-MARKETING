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
    /// July 19, 2012 11:31 AM
    /// </summary>
    public class CompanyManager:LogManager<Company>
    {
            #region Accessor
            /// <summary>
            /// 
            /// </summary>
            CompanyAccessor Accessor
            {
                [System.Diagnostics.DebuggerStepThrough]
                get { return CompanyAccessor.CreateInstance(); }
            }
            #endregion

            public Company GetComapnyByKey(int id)
            {
                return Accessor.Query.SelectByKey<Company>(id) ?? new Company();
            }

            /// <summary>
            /// 
            /// </summary>
            /// <returns></returns>
            public IList<Company> Companies()
            {
                return Accessor.Query.SelectAll<Company>();
            }


            public void Save(Company Company)
            {
                using (DbManager db = new DbManager())
                {
                    if (Company.CompanyId != 0)
                    {
                        Accessor.Query.Update(db, Company);
                    }
                    else
                    {
                       Identity=Accessor.Query.InsertAndGetIdentity(db, Company);
                    }
                }
            }

           
            public void Delete(Company Company)
            {
                using (DbManager db = new DbManager())
                {
                    Accessor.Query.Delete(db, Company);
                }
            }


            public void LoadCompanies(SqlDataSource CompanyDataSource, string search_parameter = "")
            {
                string CommandText = "SELECT [CompNo], [CompName] FROM [Company] ";
                if (search_parameter != "")
                {
                    CommandText += " WHERE CompName LIKE '%" + search_parameter + "%' ";
                }
                CommandText += " ORDER BY [CompNo] DESC";
                CompanyDataSource.SelectCommand = CommandText;
                CompanyDataSource.DataBind();
            }
        }
}
