using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;
using System.Web.UI.WebControls;
using IRMS.Entities;

namespace IRMS.BusinessLogic.Manager
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: December 2011
    /// Company : iServe
    /// Description: Manage Style Class Object
    /// Date Modified: June 06, 2012
    /// </summary>
    public class StyleManager:LogManager<ItemStyle>
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

        /// <summary>
        /// Get Style Number by Key(primary Key). From Object Model
        /// </summary>
        /// <param name="id">Key</param>
        /// <returns>Style Object</returns>
        public ItemStyle GetStyleNumberByKey(long id)
        {
            return Accessor.Query.SelectByKey<ItemStyle>(id) ?? new ItemStyle();
        }

        /// <summary>
        /// Get Style By Style Number.from Object Model Map.
        /// </summary>
        /// <param name="style_number">Style Number</param>
        /// <returns>Style</returns>
        public ItemStyle GetStyleNumberByItemStyle(string style_number)
        {
            return Accessor.GetStyleByStyleNumber(style_number);
        }

        /// <summary>
        /// Get All Styles. (Object Model)
        /// </summary>
        /// <returns>Collection of Styles</returns>
        public List<ItemStyle> Styles()
        {
            return Accessor.Query.SelectAll<ItemStyle>();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="status"></param>
        /// <returns></returns>
        public List<ItemStyle> GetStylesByStatus(string status)
        {
            return Accessor.GetStylesByStatus(status);
        }

        /// <summary>
        /// Save Style in Styles Table.
        /// </summary>
        /// <param name="style"></param>
        public void Save(ItemStyle style)
        {
            using (DbManager db = new DbManager())
            {
                if (style.RecordNo != 0)
                {
                    Accessor.Query.Update(db, style);
                }
                else
                {
                   Identity=Accessor.Query.InsertAndGetIdentity(db, style);
                }
            }
        }

        

        /// <summary>
        /// Delete Style from styles table.
        /// </summary>
        /// <param name="style">Style Object</param>
        public void Delete(ItemStyle style)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, style);
            }
        }

       
        /// <summary>
        /// 
        /// </summary>
        /// <param name="search_parameter"></param>
        /// <returns></returns>
        public List<ItemStyle> SearchStyles(string[] search_parameter)
        {
            string[] columns = new string[2];
            columns[0] = "STYLE_NUMBER";
            columns[1] = "DESCRIPTION";
            return Accessor.Query.SelectByKeyWords<ItemStyle>(search_parameter, columns);
        }

        #region filter
        /// <summary>
        /// Filter Style SqlDataSource by Status.
        /// </summary>
        /// <param name="DataSource">Style DataSource</param>
        /// <param name="Status">Style Status</param>
        public void FilterStyles( SqlDataSource DataSource ,string Status = "All")
        {
            string CommandText= string.Empty;
            CommandText = "SELECT [RECORD_NO], [STYLE_NUMBER], [DESCRIPTION] FROM [STYLES]";
            switch(Status)
            {
                case "New Created":
                    CommandText += " WHERE IS_APPROVE ='Yes'  ORDER BY RECORD_NO DESC";
                    break ;
                case "No":
                    CommandText += " WHERE IS_APPROVE ='No'  ORDER BY RECORD_NO DESC";
                    break;
                case "All":
                    break;
                default :
                    break;
            }
            DataSource.SelectCommand = CommandText;
            DataSource.DataBind();
        }
        #endregion

        #region STYLE MANIPULATION USING OLD TABLE STRUCTURE

        /// <summary>
        /// Get All Styles from Style Table.
        /// </summary>
        /// <returns>Styles</returns>
        public List<ProductStyle> StylesFromOld()
        {
            return Accessor.Query.SelectAll<ProductStyle>();
        }

        /// <summary>
        /// Save Style in Style Entities Model(Mapped to Old Style Table).
        /// </summary>
        /// <param name="style">Style Model</param>
        public void SaveToOld(ProductStyle style)
        {
            using (DbManager db = new DbManager())
            {
                if (style.RecordNumber != 0)
                {
                    Accessor.Query.Update(db, style);
                }
                else
                {
                    Accessor.Query.Insert(db, style);
                }
            }
        }

        /// <summary>
        /// Get Style By Style Number. From Entities Model
        /// </summary>
        /// <param name="style_number">Style Number</param>
        /// <returns>Style Object</returns>
        public ProductStyle GetStyleNumberByItemStyleFromOld(string style_number)
        {
            return Accessor.GetStyleByStyleNumberFromOld(style_number);
        }

        /// <summary>
        /// Get Style Number By Key.
        /// </summary>
        /// <param name="id">Key</param>
        /// <returns>Style Object</returns>
        public ProductStyle GetStyleNumberByKeyFromOld(long id)
        {
            return Accessor.Query.SelectByKey<ProductStyle>(id) ?? new ProductStyle();
        }

        /// <summary>
        /// Search Styles By Style Number from style table. Map from Entities model
        /// </summary>
        /// <param name="StyleDataSource">Style Data Source</param>
        /// <param name="search_parameter">search string parameter</param>
        /// <returns>Style SqlDataSource</returns>
        public SqlDataSource SearchStyles(SqlDataSource StyleDataSource, string search_parameter,string brandName="ALL")
        {
            StringBuilder CommandText = new StringBuilder();
            CommandText.Append(
                "SELECT [StyleID] AS RECORD_NO, [StyleNo] AS STYLE_NUMBER, [StyleDesc]  AS DESCRIPTION,Cost AS COST_PRICE,BrandName as BRAND FROM [STYLE]  ");
            if (brandName !="ALL")
            {
                CommandText.Append(" WHERE BrandName='"+brandName+"' ");
                if (search_parameter != string.Empty)
                {
                    CommandText.Append(" AND StyleNo LIKE '%" + search_parameter + "%' ");
                }
            }
            else
            {
                if (search_parameter != string.Empty)
                {
                    CommandText.Append(" WHERE StyleNo LIKE '%" + search_parameter + "%' ");
                }
            }
           
            CommandText.Append(" ORDER BY StyleID DESC");
            StyleDataSource.SelectCommand = CommandText.ToString();
            StyleDataSource.SelectCommandType = SqlDataSourceCommandType.Text;
            StyleDataSource.DataBind();
            return StyleDataSource;
        }

        public void SearchStylesForReprocess(SqlDataSource styleDataSource, string searchParameter, string brandName)
        {
            StringBuilder strCmd = new StringBuilder();
            strCmd.Append("SELECT DISTINCT(GenMemoDtl.[StyleNo]),GenMemoDtl.[BrandName] ,GenMemoDtl.[StyleDesc] FROM [IRMS-DB].[dbo].[GenMemoDtl] inner join Style on Style.StyleNo = GenMemoDtl.StyleNo where GenMemoDtl.BrandName='"+brandName+"' and Style.IsActive =1 and Style.IsGeneric=0 ");
            if (!string.IsNullOrEmpty(searchParameter))
            {
                strCmd.Append(" and GenMemoDtl.StyleNo LIKE '%" + searchParameter + "%' ");
            }
            strCmd.Append(" ORDER BY GenMemoDtl.StyleNo DESC");
            styleDataSource.SelectCommand = strCmd.ToString();
            styleDataSource.SelectCommandType = SqlDataSourceCommandType.Text;
            styleDataSource.DataBind();
        }

        /// <summary>
        /// Delete Style from Style Table.
        /// </summary>
        /// <param name="style">Style Object</param>
        public void DeleteFromOld(ProductStyle style)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, style);
            }
        }

        #endregion
    }
}
