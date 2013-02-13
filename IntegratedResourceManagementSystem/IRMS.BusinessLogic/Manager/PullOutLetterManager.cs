using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;
using System.Data;

namespace IRMS.BusinessLogic.Manager
{
    public class PullOutLetterManager : LogManager<PullOutLetter>, IBaseManager<PullOutLetter>
    {
        #region Accessor
        /// <summary>
        /// Initialize Pull-Out Header Accessor
        /// </summary>
        PullOutLetterAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return PullOutLetterAccessor.CreateInstance();
            }
        }
        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="RecordNo"></param>
        /// <returns></returns>
        public PullOutLetter GetPOHeadByID(long RecordNo)
        {
            return Accessor.Query.SelectByKey<PullOutLetter>(RecordNo) ?? new PullOutLetter();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<PullOutLetter> GetRequestALL()
        {
            return Accessor.GetAllPOHead();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="BrandName"></param>
        /// <returns></returns>
        public List<PullOutLetter> GetLastSeriesperBrand(string BrandName)
        {
            return Accessor.GetLastSeriesPerBrand(BrandName);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="CustNo"></param>
        /// <returns></returns>
        public List<PullOutLetter> GetPOHeadByCustNo(long CustNo)
        {
            return Accessor.GetPOHeadByCustomer(CustNo);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="PullOutDate"></param>
        /// <returns></returns>
        public List<PullOutLetter> GetPOHeadByPODate(DateTime PullOutDate)
        {
            return Accessor.GetPOHeadByPDate(PullOutDate);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="PullOutDate"></param>
        /// <param name="CustNo"></param>
        /// <returns></returns>
        public List<PullOutLetter> GetPOHeadByPODateAndCustno(DateTime PullOutDate, Int32 CustNo)
        {
            return Accessor.GetPOHeadByPDateAndCustno(PullOutDate, CustNo);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="PullOutDate"></param>
        /// <param name="CustNo"></param>
        /// <returns></returns>
        public PullOutLetter GetPOHeadsByPODateAndCustno(DateTime PullOutDate, Int32 CustNo)
        {
            return Accessor.GetPOHeadsByPDateAndCustno(PullOutDate, CustNo);
        }

        public List<PullOutLetter> SearchOutlet(string[] search_parameter)
        {
            string[] columns = new string[1];
            columns[0] = "SERIES_PER_BRAND";
            return Accessor.Query.SelectByKeyWords<PullOutLetter>(search_parameter, columns);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="PH"></param>
        public void SaveRequest(PullOutLetter PH)
        {
            using (DbManager db = new DbManager())
            {
                if (PH.RecordNumber != 0)
                {
                    Accessor.Query.Update(db, PH);
                }
                else
                {
                    Identity = Accessor.Query.InsertAndGetIdentity(db, PH);
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="PH"></param>
        public void DeleteRequest(PullOutLetter PH)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, PH);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sql_data_source"></param>
        /// <param name="search_parameter"></param>
        /// <returns></returns>
        public SqlDataSource SearchOutletDataSource(SqlDataSource sql_data_source, string search_parameter)
        {
            if (search_parameter != string.Empty)
            {
                sql_data_source.SelectCommand = "SELECT [CustNo], [CompName], [CustCode], [CustType], [brand], [BrandNameNo], [ArrangeType], [Addr1], [BRAND_CODE] FROM [CustInfo] a inner join [BRANDS] b on a.[brand]=b.[BRAND_DESCRIPTION] where CompName Like '%" + search_parameter + "%'";
            }
            else
            {
                sql_data_source.SelectCommand = "SELECT [CustNo], [CompName], [CustCode], [CustType], [brand], [BrandNameNo], [ArrangeType], [Addr1] FROM [CustInfo]";
            }
            sql_data_source.DataBind();
            return sql_data_source;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="customerDataSource"></param>
        /// <param name="searchParameter"></param>
        /// <param name="brandName"></param>
        public void SearchCustomers(SqlDataSource customerDataSource, string searchParameter, bool forSM = true, string brandName = "")
        {
            StringBuilder strCmd = new StringBuilder();
            strCmd.Append("SELECT [CustNo], [CompName], [MainCustNo], [brand], [PGNo], [PGMDNo], [AGNo], [SAGNo] FROM [CustInfoEx] WHERE ([MainCustNo] IS NOT NULL) ");
            if (forSM)
            {
                if (!string.IsNullOrEmpty(searchParameter))
                {
                    strCmd.Append(" and CompName like '%SHOEMART " + searchParameter + "%' ");
                }
                else
                {
                    strCmd.Append(" AND CompName LIKE '%SHOEMART%' ");

                }
                if (brandName != "")
                {
                    strCmd.Append(" and brand='" + brandName + "' ");
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(searchParameter))
                {
                    strCmd.Append(" and CompName like '%" + searchParameter + "%' ");
                }
                if (brandName != "")
                {
                    strCmd.Append(" and brand='" + brandName + "' ");
                }
            }
           
            customerDataSource.SelectCommand = strCmd.ToString();
            customerDataSource.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="stylesDataSource"></param>
        /// <param name="searchParameter"></param>
        /// <param name="brandName"></param>
        public void SearchStyles(SqlDataSource stylesDataSource, string searchParameter,string brandName)
        {
            StringBuilder strCmd = new StringBuilder();
            strCmd.Append("SELECT [StyleNo], [BrandName], [StyleDesc] FROM [Style] WHERE ([IsActive] = @IsActive) and BrandName ='"+brandName+"'");
            if (!string.IsNullOrEmpty(searchParameter))
            {
                strCmd.Append(" and StyleNo like '%" + searchParameter + "%' ");
            }
            strCmd.Append(" ORDER BY StyleNo DESC");
            stylesDataSource.SelectCommand = strCmd.ToString();
            stylesDataSource.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sql_data_source"></param>
        /// <param name="search_parameter"></param>
        /// <returns></returns>
        public SqlDataSource SearchStyleDataSource(SqlDataSource sql_data_source, string search_parameter)
        {
            if (search_parameter != string.Empty)
            {
                sql_data_source.SelectCommand = "SELECT [StyleNo], [BrandName], [StyleDesc], [AP_Type], [BRAND_CODE] FROM [Style] a inner join [BRANDS] b on a.BrandName=b.BRAND_DESCRIPTION where StyleNo Like '%" + search_parameter + "%'";
            }
            else
            {
                sql_data_source.SelectCommand = "SELECT [StyleNo], [BrandName], [StyleDesc], [AP_Type], [BRAND_CODE] FROM [Style] a inner join [BRANDS] b on a.BrandName=b.BRAND_DESCRIPTION";
            }
            sql_data_source.DataBind();
            return sql_data_source;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="customerNumber"></param>
        /// <returns></returns>
        public string GetBranchNameByCustomerNumber(int customerNumber)
        {
            return Accessor.GetBranchNameByCustomerNumber(customerNumber);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="customerNumber"></param>
        /// <returns></returns>
        public string GetAccountNameByCustomerNumber(int customerNumber)
        {
            return Accessor.GetAccountNameByCustomerNumber(customerNumber);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="styleNumber"></param>
        /// <returns></returns>
        public DataTable GetProductByStyleNumber(string styleNumber)
        {
            return Accessor.GetProductByStyleNumber(styleNumber);
        }

        /// <summary>
        /// Save or Update PullOut Letter
        /// </summary>
        /// <param name="pullOutLetter">Pull Out Letter</param>
        public void Save(PullOutLetter pullOutLetter)
        {
            using (DbManager dbm = new DbManager())
            {
                if (pullOutLetter.RecordNumber>0)
                {
                    Accessor.Query.Update(dbm, pullOutLetter);
                }
                else
                {
                  Identity= Accessor.Query.InsertAndGetIdentity(dbm, pullOutLetter);
                }
            }
        }

        /// <summary>
        /// Delete Pull Out Letter
        /// </summary>
        /// <param name="pullOutLetter">Pull Out Letter</param>
        public void Delete(PullOutLetter pullOutLetter)
        {
            using (DbManager dbm = new DbManager())
            {
                Accessor.Query.Delete(dbm, pullOutLetter);
            }
        }

        /// <summary>
        /// Delete Pull Out Letters
        /// </summary>
        /// <param name="pullOutLetters">Pull Out Letters</param>
        public void Delete(List<PullOutLetter> pullOutLetters)
        {
            foreach (var pullOutLetter in pullOutLetters)
            {
                Delete(pullOutLetter);
            }
        }

        /// <summary>
        /// Fetch All Pull Out Letters
        /// </summary>
        /// <returns>List of Pull Out Letters</returns>
        public List<PullOutLetter> FetchAll()
        {
           return Accessor.Query.SelectAll<PullOutLetter>() ?? new List<PullOutLetter>();
        }

        /// <summary>
        /// Get Pull Out Letter by Key/Id.
        /// </summary>
        /// <param name="key">key/primary key</param>
        /// <returns>Pull Out Letter</returns>
        public PullOutLetter FetchById(int key)
        {
            return Accessor.Query.SelectByKey<PullOutLetter>(key) ?? new PullOutLetter() ;
        }

        
        public int lastPullOutLetterIdentity(string brandName)
        {
            int result=0;
            string seriesNumber = string.Empty;
            try
            {
                    seriesNumber = FetchAll().Where(s => s.BrandName == brandName).LastOrDefault().SeriesNumber;
                    if (seriesNumber.Split('-').ToArray().Length==3)
                    {
                        result = int.Parse(seriesNumber.Split('-')[2]);
                    }
                    else
                    {
                        result = int.Parse(seriesNumber.Split('-')[1]);
                    }
                 
            }
            catch (Exception)
            {
                result = 0;
            }
            return (result+1);
        }
    }
}
    
  

