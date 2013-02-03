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
    /// Class Description: Category Data Accessor Manager Class
    /// </summary>
    public class CategoryManager:LogManager<Category>
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        CategoryAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return CategoryAccessor.CreateInstance();
            }
        }

        #endregion
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Category GetCategoryByKey(long id)
        {
            return Accessor.Query.SelectByKey<Category>(id) ?? new Category();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<Category> Categories()
        {
            return Accessor.Categories();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="category"></param>
        public void Save(Category category)
        {
            using (DbManager db = new DbManager())
            {
                if (category.RecordNo != 0)
                {
                    Accessor.Query.Update(db, category);
                }
                else
                {
                 Identity=Accessor.Query.InsertAndGetIdentity(db, category);
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="category"></param>
        public void Delete(Category category)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, category);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="search_parameter"></param>
        /// <returns></returns>
        public List<Category> SearchCategories(string[] search_parameter)
        {
            string[] columns = new string[2];
            columns[0] = "CATEGORY_CODE";
            columns[1] = "CATEGORY_DESCRIPTION";
            return Accessor.Query.SelectByKeyWords<Category>(search_parameter, columns);
        }

        #region filter_query
        public void LoadCategories(SqlDataSource CategoryDataSource, string search_parameter="")
        {
            string CommandText = "SELECT [RECORD_NO], [CATEGORY_CODE], [CATEGORY_DESCRIPTION], [DATE_RECORDED] FROM [CATEGORIES] ";
            if (search_parameter != "")
            {
                CommandText += " WHERE CATEGORY_CODE LIKE '%" + search_parameter + "%' OR CATEGORY_DESCRIPTION LIKE '%"+search_parameter+"%' ";
            }
            CategoryDataSource.SelectCommand = CommandText;
            CategoryDataSource.SelectCommandType = SqlDataSourceCommandType.Text;
            CategoryDataSource.DataBind();
        }
        #endregion
    }
}
