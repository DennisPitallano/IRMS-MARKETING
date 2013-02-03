using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.ObjectModel;
using IRMS.Entities;

namespace IRMS.BusinessLogic.DataAccess
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: December 2011
    /// Company: iServe
    /// Class Description: Product Data Accessor Template Class
    /// </summary>
    public abstract class ProductAccessor : AccessorBase< ProductAccessor .DB,ProductAccessor >
    {
        /// <summary>
        /// 
        /// </summary>
        public class DB : DbManager
        {
            public DB() : base("IRMSConnectionString")
            {
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [SqlQuery(@"SELECT  DISTINCT STYLE_NO,DESCRIPTION,ITEM_CODE FROM PRODUCTS WHERE IS_ACTIVE ='Yes'")]
        //[SqlQuery("SELECT * FROM PRODUCTS WHERE IS_ACTIVE ='Yes'")]
        public abstract List<Product> Products();

        /// <summary>
        /// 
        /// </summary>
        /// <param name="StyleNumber"></param>
        /// <returns></returns>
        [SqlQuery(@"SELECT * FROM PRODUCTS WHERE IS_ACTIVE =@Status AND STYLE_NO=@StyleNumber")]
        public abstract List<Product> GetProductsByStyleNumber(string StyleNumber,string Status);

        [SqlQuery(@"SELECT * FROM PRODUCT WHERE StyleNo=@StyleNumber")]
        public abstract List<IRMSProduct> GetAllProductsByStyleNumber(string StyleNumber);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="Description"></param>
        /// <returns></returns>
        [SqlQuery(@"SELECT * FROM PRODUCTS WHERE IS_ACTIVE ='Yes' AND DESCRIPTION=@Description")]
        public abstract List<Product> GetProductsByDescription(string Description);

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [SqlQuery(@"SELECT SKU_BARCODE FROM PRODUCTS ORDER BY DATE_RECORDED DESC ")]
        public abstract string GetLastSKUCode();

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        [SqlQuery(@"SELECT  * FROM PRODUCTS WHERE IS_ACTIVE ='Yes'")]
        public abstract List<Product> AllProducts();


        [SqlQuery(@"UPDATE PRODUCTS SET IS_ACTIVE='No' WHERE RECORD_NO=@RecordNo")]
        public abstract void UpdateProductStatus(long RecordNo);

        [SqlQuery(@"UPDATE PRODUCTS SET IS_ACTIVE='Yes' WHERE RECORD_NO=@RecordNo")]
        public abstract void SetProductStatusAsActive(long RecordNo);

      
    }
}
