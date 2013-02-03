using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.ObjectModel;
using BLToolkit;
using BLToolkit.Data;
using IRMS.BusinessLogic.DataAccess;
using System.Web.UI.WebControls;
namespace IRMS.BusinessLogic.Manager
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: December 2011
    /// Company: iServe
    /// Class Description: Color Data Accessor Manager Class
    /// </summary>
   public class ColorManager:LogManager<Color>
    {
        #region Accessor
       /// <summary>
       /// 
       /// </summary>
        ColorAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return ColorAccessor.CreateInstance(); }
        }
        #endregion
       /// <summary>
       /// 
       /// </summary>
       /// <param name="id"></param>
       /// <returns></returns>
        public Color GetColorByKey(long id)
        {
            return Accessor.Query.SelectByKey<Color>(id) ?? new Color();
        }
       /// <summary>
       /// 
       /// </summary>
       /// <returns></returns>
        public List<Color> Colors()
        {
            return Accessor.Colors();
        }

       public Color GetColorByCode(string Code)
        {
            Color color = new Color();
            var result = from _color in this.Colors()
                         where _color.ColorCode == Code
                         select _color;
                         //select new Color { ColorCode = _color.ColorCode, 
                         //    ColorDescription = _color.ColorDescription, 
                         //    DateCreated = _color.DateCreated, IsActive = _color.IsActive, 
                         //    RecordNo = _color.RecordNo };
            foreach (Color color_ in result)
            {
                color = color_;
            }
            return color;
        }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="color"></param>
        public void Save(Color color)
        {
            using (DbManager db = new DbManager())
            {
                if (color.RecordNo != 0)
                {
                    Accessor.Query.Update(db, color);
                }
                else
                {
                   Identity=Accessor.Query.InsertAndGetIdentity(db, color);
                }
            }
        }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="color"></param>
        public void Delete(Color color)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, color);
            }
        }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="search_parameter"></param>
       /// <returns></returns>
        public List<Color> SearchColors(string[] search_parameter)
        {
            string[] columns = new string[2];
            columns[0] = "COLOR_CODE";
            columns[1] = "COLOR_DESCRIPTION";
            return Accessor.Query.SelectByKeyWords<Color>(search_parameter, columns);
        }

        #region filter_query
        public void LoadColors(SqlDataSource ColorDataSource, string search_parameter="")
        {
            string CommandText = "SELECT [RECORD_NO], [COLOR_CODE], [COLOR_DESCRIPTION], [DATE_RECORDED] FROM [COLORS] ";
            if (search_parameter != "")
            {
                CommandText += " WHERE COLOR_CODE LIKE '%" + search_parameter + "%' OR COLOR_DESCRIPTION LIKE '%"+ search_parameter +"%'";
            }
            ColorDataSource.SelectCommand = CommandText;
            ColorDataSource.SelectCommandType = SqlDataSourceCommandType.Text;
            ColorDataSource.DataBind();
        }
        #endregion
    }
}
