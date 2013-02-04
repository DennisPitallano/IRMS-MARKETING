using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using System.Web.UI.WebControls;

namespace IRMS.BusinessLogic.Manager
{
    public class DeliveryReceiptsManager
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        DeliveryReceiptsAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return DeliveryReceiptsAccessor.CreateInstance(); }
        }
        #endregion

        

        #region Search Customer
        public void SeachCustomers(SqlDataSource CustomerDataSource, string search_parameter)
        {
            StringBuilder search_command = new StringBuilder();
            search_command.Append("SELECT [CustNo], [CompName] FROM [CustInfo] ");
            if (!string.IsNullOrEmpty(search_parameter))
            {
                search_command.Append(" WHERE CompName LIKE '%"+search_parameter+"%' ");
            }
            CustomerDataSource.SelectCommand = search_command.ToString();
            CustomerDataSource.DataBind();
        }

        #endregion
        #region Filter DrDetails
        public void LoadFilteredDRDetails(SqlDataSource DRDetailsDataSource, int DRID_S, int DRID_E, int CustomerNumber)
        {
            StringBuilder search_command = new StringBuilder();
            search_command.Append(" SELECT DR.DRNo, DRDtl.SKU, DRDtl.StyleNo, DR.ItemStatus, DRDtl.Quantity, DRDtl.UnitPrice FROM DR INNER JOIN DRDtl ON DR.ID = DRDtl.DRID ");
            search_command.Append(" where DR.ID between @ID_S and @ID_E and custno =@Customer_Number ");
            Parameter prmDRIDS = new Parameter
            {
                 DbType = System.Data.DbType.Int32 ,
                 Name = "ID_S",
                  DefaultValue = DRID_S.ToString(),
            };

            Parameter prmDRIDE = new Parameter
            {
                DbType = System.Data.DbType.Int32,
                Name = "ID_E",
                DefaultValue = DRID_E.ToString(),
            };
            Parameter prmCustomerNumber = new Parameter
            {
                DbType = System.Data.DbType.Int32,
                Name = "Customer_Number",
                DefaultValue = CustomerNumber.ToString(),
            };
            DRDetailsDataSource.SelectParameters.Add(prmDRIDS);
            DRDetailsDataSource.SelectParameters.Add(prmDRIDE);
            DRDetailsDataSource.SelectParameters.Add(prmCustomerNumber);
            DRDetailsDataSource.SelectCommand = search_command.ToString();
            DRDetailsDataSource.DataBind();
            //       SELECT DR.DRNo, DRDtl.SKU, DRDtl.StyleNo, DR.ItemStatus, DRDtl.Quantity, DRDtl.UnitPrice FROM DR
            //INNER JOIN DRDtl ON DR.ID = DRDtl.DRID
            //where DR.ID between @IDS and @IDE and custno =@CustomerNumber
        }
        #endregion
    }

    
}
