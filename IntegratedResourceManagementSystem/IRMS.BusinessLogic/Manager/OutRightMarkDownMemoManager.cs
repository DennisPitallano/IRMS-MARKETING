using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.Entities;
using System.Web.UI.WebControls;

namespace IRMS.BusinessLogic.Manager
{
    public class OutRightMarkDownMemoManager
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        OutRightMarkDownMemoAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return OutRightMarkDownMemoAccessor.CreateInstance(); }
        }
        #endregion

        public OutRightMarkDownMemo GetOutRightMarkDownMemoByKey(int RecordNumber)
        {
            return Accessor.GetOutRightMarkDownMemo(RecordNumber);
        }

        #region search_query
        public void SearchOutRightMarkDownMemo(SqlDataSource OutRightDataSource, string search_parameter)
        {
            OutRightDataSource.SelectCommand = "SELECT MDMemo.ID, MDMemo.MemoNo, MDMemo.MemoDate, MDMemo.Header, MDMemo.Intro, CustInfo.CompName, MDMemo.RemInvDate, MDMemo.GenMemoNo, MDMemo.Message, MDMemo.Footer FROM MDMemo INNER JOIN CustInfo ON MDMemo.CustNo = CustInfo.CustNo WHERE  "
                + "  MDMemo.MemoNo LIKE '%" + search_parameter + "%' OR CustInfo.CompName LIKE '%" + search_parameter + "%' AND (MDMemo.MemoType = 'Outright')";
            OutRightDataSource.DataBind();
        }

        public void SeachOutRightmrkDownMemoIncludeDateRange(SqlDataSource OutRightDataSource, string search_parameter, DateTime date_from, DateTime date_to)
        {
            string CommandText = string.Empty;
            if(search_parameter != string.Empty)
            {
                CommandText = "SELECT MDMemo.ID, MDMemo.MemoNo, MDMemo.MemoDate, MDMemo.Header, MDMemo.Intro, CustInfo.CompName, MDMemo.RemInvDate, MDMemo.GenMemoNo, MDMemo.Message, MDMemo.Footer FROM MDMemo INNER JOIN CustInfo ON MDMemo.CustNo = CustInfo.CustNo WHERE  "
                    + "  MDMemo.MemoNo LIKE '%" +
                    search_parameter + "%' OR CustInfo.CompName LIKE '%" +
                    search_parameter + "%' AND (MDMemo.MemoType = 'Outright') AND MDMemo.MemoDate BETWEEN '"+date_from +"' AND '"+ date_to +"'";
            }else {
                CommandText = "SELECT MDMemo.ID, MDMemo.MemoNo, MDMemo.MemoDate, MDMemo.Header, MDMemo.Intro, CustInfo.CompName, MDMemo.RemInvDate, MDMemo.GenMemoNo, MDMemo.Message, MDMemo.Footer FROM MDMemo INNER JOIN CustInfo ON MDMemo.CustNo = CustInfo.CustNo WHERE  "
                      + "  MDMemo.MemoDate BETWEEN '" + date_from + "' AND '" + date_to + "' AND (MDMemo.MemoType = 'Outright')";
            }

            OutRightDataSource.SelectCommand = CommandText;
            OutRightDataSource.DataBind();
        }
        #endregion
    }
}
