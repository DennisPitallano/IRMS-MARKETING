using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.Entities;
using System.Web.UI.WebControls;
using IRMS.ObjectModel;
using BLToolkit;
using BLToolkit.Data;


namespace IRMS.BusinessLogic.Manager
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: Apri 2011
    /// Company: iServe
    /// Class Description: GeneralMemo Concession Data Accessor Manager Class
    /// </summary>
    /// </summary>
    public class GeneralMemoConcessionManager
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        MarkDownMemoAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return MarkDownMemoAccessor.CreateInstance(); }
        }
        #endregion

        #region GMCAccessor
        /// <summary>
        /// 
        /// </summary>
        GeneralMemoConcessionAccessor GMCAccessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return GeneralMemoConcessionAccessor.CreateInstance(); }
        }
        #endregion



        public GeneralMemoConcession GetGeneralMemoConcessionByKey(long id)
        {
            return Accessor.Query.SelectByKey<GeneralMemoConcession>(id) ?? new GeneralMemoConcession();
        }
        private string GenerateMemoNumber(string MemoFormat, string BrandName)
        {
            string sResult = string.Empty;
            using (DbManager db = new DbManager())
            {

                db.SetSpCommand("GET_MARKDOWNMEMO_SEQUENCE", db.Parameter("@BrandName", BrandName)).ExecuteNonQuery();
                int iData = Convert.ToInt32(db.Parameter("@RETURN_VALUE").Value);

                sResult = string.Format("{0}-{1:000}", MemoFormat, iData);
            }
            return sResult;
        }
        public void Save(ref GeneralMemoConcession Object, bool IsNew)
        {
            using (DbManager db = new DbManager())
            {
                if (IsNew == false)
                {
                    Accessor.Query.Update(db, Object);
                }
                else
                {
                    Object.MemoNumber = GenerateMemoNumber(Object.MemoNumber, Object.BrandName);
                    Accessor.Query.Insert(db, Object);
                    Object.RecordNumber = GMCAccessor.GetConcessionMemo(Object.MemoNumber).RecordNumber;
                }
            }
        }

        #region "query filter"
        public void SearchGeneralMemoIncludeDateRange(SqlDataSource data_source, string search_parameter, DateTime from, DateTime to)
        {
            StringBuilder command_text = new StringBuilder();
            command_text.Append("SELECT [ID], [MemoNo], [MemoDate], [BrandName], [GrpNo], [PriceType], [FromDate], [ToDate], [Status] FROM [GenMemo] WHERE ");
            if (search_parameter != "")
            {
                command_text.Append(" MemoNo  LIKE '%" + search_parameter + "%' AND MemoDate BETWEEN '" + from + "' AND '" + to + "' AND Status = 'Pending' ");
            }
            else
            {
                command_text.Append(" MemoDate BETWEEN '" + from + "' AND '" + to + "' AND Status = 'Pending'");
            }
            data_source.SelectCommand = command_text.ToString();
            data_source.DataBind();
        }
        public void SearchGeneralMemo(SqlDataSource data_source, string search_parameter)
        {
            StringBuilder command_text = new StringBuilder();
            command_text.Append("SELECT [ID], [MemoNo], [MemoDate], [BrandName], [GrpNo], [PriceType], [FromDate], [ToDate], [Status] FROM [GenMemo] WHERE ");
            if (search_parameter != "")
            {
                command_text.Append(" MemoNo  LIKE '%" + search_parameter + "%' AND Status = 'Pending' ");
            }
           
            data_source.SelectCommand = command_text.ToString();
            data_source.DataBind();
        }
        public void SearchGeneralMemoByMemoNoAndBrand(SqlDataSource data_source, string BrandName, string search_parameter)
        {
            StringBuilder command_text = new StringBuilder();
            command_text.Append("SELECT [ID], [MemoNo], [MemoDate], [BrandName], [GrpNo], [PriceType], [FromDate], [ToDate], [Status] FROM [GenMemo] WHERE ");
            command_text.Append(" BrandName = '" + BrandName + "' and ");
            command_text.Append(" MemoNo  LIKE '%" + search_parameter + "%' order by fromDate Desc");

            data_source.SelectCommand = command_text.ToString();
            data_source.DataBind();
        }
        #endregion
    }
}
