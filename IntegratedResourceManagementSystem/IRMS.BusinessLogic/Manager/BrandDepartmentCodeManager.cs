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
    public class BrandDepartmentCodeManager:LogManager<BrandDepartmentCode>, IBaseManager<BrandDepartmentCode>
    { 
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        BrandDepartmentCodeAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return BrandDepartmentCodeAccessor.CreateInstance(); }
        }
        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="brandDepartmentCode"></param>
        public void Save(BrandDepartmentCode brandDepartmentCode)
        {
            using (DbManager dbm = new DbManager())
            {
                if (brandDepartmentCode.RecordNumber >0)
                {
                    Accessor.Query.Update(dbm, brandDepartmentCode);
                }
                else
                {
                   Identity= Accessor.Query.InsertAndGetIdentity(dbm, brandDepartmentCode);
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="brandDepartmentCode"></param>
        public void Delete(BrandDepartmentCode brandDepartmentCode)
        {
            try
            {
                using (DbManager dbm = new DbManager())
                {
                    Accessor.Query.Delete(dbm,brandDepartmentCode);
                }
            }
            catch (Exception ex )
            {
                throw ex;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="brandDepartmentCodes"></param>
        public void Delete(List<BrandDepartmentCode> brandDepartmentCodes)
        {
            foreach (var bdc in brandDepartmentCodes)
            {
                Delete(bdc);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<BrandDepartmentCode> FetchAll()
        {
            return Accessor.Query.SelectAll<BrandDepartmentCode>() ?? new List<BrandDepartmentCode>();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public BrandDepartmentCode FetchById(int key)
        {
            return Accessor.Query.SelectByKey<BrandDepartmentCode>(key) ?? new BrandDepartmentCode();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="brandName"></param>
        /// <returns></returns>
        public BrandDepartmentCode FethByBrandName(string brandName)
        {
            var result = FetchAll().Where(e => e.BrandName == brandName).FirstOrDefault();
            return result ?? new BrandDepartmentCode();
        }

        #region sql query

        public void SearchBrandDepartmentCodes(SqlDataSource brandDepartmentCodeSource, string searchParameter)
        {
            StringBuilder strCmd = new StringBuilder();
            strCmd.Append("SELECT * FROM [BRAND_DEPT_CODES] ");
            if (!string.IsNullOrEmpty(searchParameter))
            {
                strCmd.Append(" WHERE BRAND LIKE '%"+searchParameter+"%' ");
            }
            strCmd.Append(" order by RECORD_NUMBER DESC ");
            brandDepartmentCodeSource.SelectCommand = strCmd.ToString();
            brandDepartmentCodeSource.DataBind();
        }
        #endregion
    }
}
