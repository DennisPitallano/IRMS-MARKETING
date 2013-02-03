using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.Entities;
using IRMS.ObjectModel;
using BLToolkit;
using BLToolkit.Data;
using IRMS.BusinessLogic.DataAccess;
using System.Web.UI.WebControls;

namespace IRMS.BusinessLogic.Manager
{
    /// <summary>
    /// Author : Filjay Aglipay
    /// Date Created : September 3, 2012
    /// Company : Iserve
    /// Class Description : Customer Group Data Accessor Manager Class
    /// Modified By: Dennis Pitallano
    /// Date Modified: October 23, 2012
    /// </summary>
    public class CustomerGroupsManager:LogManager<CustomerGroup>
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        CustomerGroupAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return CustomerGroupAccessor.CreateInstance();
            }
        }

        #endregion

        public CustomerGroup GetCustomerGroupByKey(int id)
        {
            return Accessor.Query.SelectByKey<CustomerGroup>(id) ?? new CustomerGroup();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IList<CustomerGroup> CustomerGroups()
        {
            return Accessor.Query.SelectAll<CustomerGroup>();

        }
        public void Save(CustomerGroup CustomerGroup)
        {
            using (DbManager db = new DbManager())
            {
                if (CustomerGroup.id != 0)
                {
                    Accessor.Query.Update(db, CustomerGroup);
                }
                else
                {
                  Identity =Accessor.Query.InsertAndGetIdentity(db, CustomerGroup);
                }
            }
        }

        public void Delete(CustomerGroup CustomerGroup)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, CustomerGroup);
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        #region filter_query
        public void LoadCustomerGroupList(SqlDataSource CustGroupDataSource, string search_parameter = "")
        {
            string CommandText = "SELECT * FROM [lstCustGroup] ";
            if (search_parameter != "")
            {
                CommandText += " WHERE Code LIKE '%" + search_parameter + "%' OR Customer LIKE '%" + search_parameter + "%' " + " OR BrandName LIKE '%" + search_parameter + "%' " + " OR ListDesc LIKE '%" + search_parameter + "%' " + " OR SAPGroup LIKE '%" + search_parameter + "%' ";
            }
            CustGroupDataSource.SelectCommand = CommandText;
            CustGroupDataSource.SelectCommandType = SqlDataSourceCommandType.Text;
            CustGroupDataSource.DataBind(); 
        }
        #endregion
      
    }
}
