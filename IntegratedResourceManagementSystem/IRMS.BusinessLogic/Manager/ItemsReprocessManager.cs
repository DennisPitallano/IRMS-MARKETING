using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using System.Web.UI.WebControls;

namespace IRMS.BusinessLogic.Manager
{
    public class ItemsReprocessManager
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        ItemsReprocessAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return ItemsReprocessAccessor.CreateInstance(); }
        }
        #endregion

        #region filter Styles
        public void FilterStyles(SqlDataSource StylesDataSource, string Brand="")
        {
            StringBuilder commandText = new StringBuilder();
            commandText.Append("SELECT DISTINCT(Style.StyleNo) AS STYLE_NUMBER, [StyleID] AS RECORD_NO, Style.[StyleDesc] AS DESCRIPTION, Cost AS COST_PRICE,Style.BrandName,Product.AP_Type FROM [STYLE] INNER JOIN Product on Product.StyleNo=Style.StyleNo ");
            if (Brand != "")
            {
                commandText.Append(" WHERE Style.BrandName ='" + Brand + "' ");
            }
            commandText.Append(" ORDER BY StyleID DESC");

            StylesDataSource.SelectCommand = commandText.ToString();
            StylesDataSource.SelectCommandType = SqlDataSourceCommandType.Text;
            StylesDataSource.DataBind();
        }
        public void SearchStyles(SqlDataSource StylesDataSource, string searchParameter, string Brand="ALL")
        {
            StringBuilder commandText = new StringBuilder();
            commandText.Append("SELECT DISTINCT(Style.StyleNo) AS STYLE_NUMBER, [StyleID] AS RECORD_NO, Style.[StyleDesc] AS DESCRIPTION, Cost AS COST_PRICE,Style.BrandName,Product.AP_Type FROM [STYLE] INNER JOIN Product on Product.StyleNo=Style.StyleNo ");
            if (Brand != "ALL")
            {
                commandText.Append(" WHERE Style.BrandName ='" + Brand + "' AND Style.StyleNo LIKE '%" + searchParameter + "%' ");
            }
            else
            {
                if (searchParameter != "")
                {
                    commandText.Append(" WHERE Style.StyleNo LIKE '%" + searchParameter + "%' ");
                }
            }
            commandText.Append(" ORDER BY StyleID DESC");
            StylesDataSource.SelectCommand = commandText.ToString();
            StylesDataSource.SelectCommandType = SqlDataSourceCommandType.Text;
            StylesDataSource.DataBind();
        }
        #endregion

        #region filter Customers
        public void SearchCustomers(SqlDataSource CustomerDatasource, string search_parameter, string Brand)
        {
            StringBuilder commandText = new StringBuilder();
            commandText.Append("SELECT [CustNo], [CompName],[PGNo] FROM [CustInfo] WHERE ([brand] = '" + Brand + "')");
            if (search_parameter != "")
            {
                commandText.Append(" and CompName LIKE'%"+search_parameter+"%'");
            }
            CustomerDatasource.SelectCommand = commandText.ToString();
            CustomerDatasource.DataBind();
        }
        #endregion
    }
}
