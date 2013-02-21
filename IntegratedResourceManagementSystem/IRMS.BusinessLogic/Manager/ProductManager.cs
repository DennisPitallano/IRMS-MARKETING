using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;
using IRMS.Entities;
using System.Web.UI.WebControls;

namespace IRMS.BusinessLogic.Manager
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// Date Created: December 2011
    /// Company: iServe
    /// Class Description: Product Data Accessor Manager Class
    /// </summary>
    public class ProductManager:LogManager<Product>
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        ProductAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return ProductAccessor.CreateInstance(); }
        }
        #endregion
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Product GetProductByKey(long id)
        {
            return Accessor.Query.SelectByKey<Product>(id) ?? new Product();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="StyleNumber"></param>
        /// <returns></returns>
        public List<Product> GetProductByStyleNumber(string StyleNumber,string Status)
        {
            return Accessor.GetProductsByStyleNumber(StyleNumber,Status);
        }

        public List<Product> GetProductByDescription(string Description)
        {
            return Accessor.GetProductsByDescription(Description);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<Product> Products()
        {
            return Accessor.Products();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<Product> AllProduct()
        {
            return Accessor.AllProducts();
        }

        public List<Product> GetAllProducts()
        {
            return Accessor.Query.SelectAll<Product>();
        }
         

        public Product GetProductBySKUNumber(string SKUNUmber)
        {
            var result = (from prod in GetAllProducts()
                         where prod.SKUBarcode == SKUNUmber
                         select prod).FirstOrDefault();

            return result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="product"></param>
        public void Save(Product product)
        {
            using (DbManager db = new DbManager())
            {
                if (product.RecordNo != 0)
                {
                    Accessor.Query.Update(db, product);
                }
                else
                {
                  Identity = Accessor.Query.InsertAndGetIdentity(db, product);
                }
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="product"></param>
        public void Delete(Product product)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, product);
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="search_parameter"></param>
        /// <returns></returns>
        public List<Product> SearchProducts(string[] search_parameter)
        {
            string[] columns = new string[2];
            columns[0] = "STYLE_NUMBER";
            columns[1] = "ITEM_CODE";
            return Accessor.Query.SelectByKeyWords<Product>(search_parameter, columns);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public string GetLastSKUCode()
        {
            return Accessor.GetLastSKUCode();
        }

        public void UpdateProductStatus(List<Product> product_list)
        {
            foreach (Product product in product_list)
            {
                Accessor.UpdateProductStatus(product.RecordNo);
            }
        }

        public void SetProductStatusAsActive(List<Product> product_list)
        {
            foreach (Product product in product_list)
            {
                Accessor.SetProductStatusAsActive(product.RecordNo);
            }
        }

        #region OLD PRODUCT STRUCTURE MANIPULATION
        /// <summary>
        /// Get All Products Using Old Table Structure for parameter list<>;
        /// </summary>
        /// <returns>All Produtcs</returns>
        public List<IRMSProduct> GetAllOldProducts()
        {
            return Accessor.Query.SelectAll<IRMSProduct>();
        }

        public List<IRMSProduct> GetAllProductsByStyleNumber(string StyleNumber)
        {
            return Accessor.GetAllProductsByStyleNumber(StyleNumber) ?? new List<IRMSProduct>();
        }

        public void DeleteProduct(IRMSProduct product)
        {
            using (DbManager dbm = new DbManager())
            {
                Accessor.Query.Delete(dbm, product);
            }
        }

        public void Save(IRMSProduct product)
        {
            using (DbManager db = new DbManager())
            {
                if (product.ProductNumber  != 0)
                {
                    Accessor.Query.Update(db, product);
                }
                else
                {
                    Identity = Accessor.Query.InsertAndGetIdentity(db, product);
                }
            }
        }

        public void Save(List<IRMSProduct> products)
        {
            foreach (IRMSProduct product in products)
            {
                Save(product);
            }
        }

        public void DeleteProducts(List<IRMSProduct> products)
        {
            foreach(IRMSProduct product in products)
            {
                 DeleteProduct(product);
            }
        }

        public SqlDataSource SearchSKU( SqlDataSource SKUDataSource, string search_parameter)
        {
            StringBuilder CommandText = new StringBuilder();
            CommandText.Append("SELECT [ProdNo], [StyleNo], [StyleDesc], [ItemCode], [SKU], [DateImport] FROM [Product] ");
            if (search_parameter != string.Empty)
            {
                CommandText.Append(" WHERE SKU LIKE'%" + search_parameter + "%' ");
            }
            CommandText.Append(" ORDER BY [DateImport] DESC");
            SKUDataSource.SelectCommand = CommandText.ToString();
            SKUDataSource.SelectCommandType = SqlDataSourceCommandType.Text;
            SKUDataSource.DataBind();
            return SKUDataSource;
        }

        #endregion
    }
}
