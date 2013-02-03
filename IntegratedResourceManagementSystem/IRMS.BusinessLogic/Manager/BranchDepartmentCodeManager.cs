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
    public class BranchDepartmentCodeManager:LogManager<BrandDepartmentCode>,IBaseManager<BranchDepartmentCode>
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        BranchDepartmentCodeAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return BranchDepartmentCodeAccessor.CreateInstance(); }
        }
        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="branchDepartmentCode"></param>
        public void Save(BranchDepartmentCode branchDepartmentCode)
        {
            using (DbManager dbm = new DbManager())
            {
                if (branchDepartmentCode.RecordNumber >0)
                {
                    Accessor.Query.Update(dbm,branchDepartmentCode); 
                }
                else
                {
                   Identity=Accessor.Query.InsertAndGetIdentity(dbm, branchDepartmentCode);
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="branchDepartmentCode"></param>
        public void Delete(BranchDepartmentCode branchDepartmentCode)
        {
            using (DbManager dbm = new DbManager())
            {
                Accessor.Query.Delete(dbm,branchDepartmentCode);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="branchDepartmentCodes"></param>
        public void Delete(List<BranchDepartmentCode> branchDepartmentCodes)
        {
            foreach (var bdc in branchDepartmentCodes)
            {
                Delete(bdc);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<BranchDepartmentCode> FetchAll()
        {
           return Accessor.Query.SelectAll<BranchDepartmentCode>() ?? new  List<BranchDepartmentCode>();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public BranchDepartmentCode FetchById(int key)
        {
            return Accessor.Query.SelectByKey<BranchDepartmentCode>(key) ?? new BranchDepartmentCode();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="branchName"></param>
        /// <returns></returns>
        public BranchDepartmentCode FetchByBranchName(string branchName)
        {
            var result = FetchAll().Where(e => e.BranchName == branchName).SingleOrDefault();
            return result ?? new BranchDepartmentCode();
        }

        #region branchDepartmentCodes
        public void SearchBranchDepartmentCodes(SqlDataSource branchDepartmentCodeSource , string searchParameter)
        {
            StringBuilder strCmd = new StringBuilder();
            strCmd.Append("SELECT * FROM [BRANCH_DEPT_CODES] ");
            if (!string.IsNullOrEmpty(searchParameter))
            {
                strCmd.Append(" WHERE BRANCH_NAME LIKE '%"+ searchParameter+"%' ");
            }
            strCmd.Append(" ORDER BY RECORD_NUMBER DESC");
            branchDepartmentCodeSource.SelectCommand = strCmd.ToString();
            branchDepartmentCodeSource.DataBind();
        }
        #endregion
    }
}
