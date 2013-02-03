using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.Manager
{
    public class BrandGarmentsManager
    {
        #region Accessor
        /// <summary>
        /// 
        /// </summary>
        BrandGarmentAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return BrandGarmentAccessor.CreateInstance();
            }
        }

        #endregion
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public BrandGarment GetBrandGarmentByKey(long id)
        {
            return Accessor.Query.SelectByKey<BrandGarment>(id) ?? new BrandGarment();
        }

       
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public List<BrandGarment> BrandGarments()
        {
            return Accessor.Query.SelectAll <BrandGarment>();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="BrandGarment"></param>
        public void Save(BrandGarment BrandGarment)
        {
            using (DbManager db = new DbManager())
            {
                if (BrandGarment.RecordNo != 0)
                {
                    Accessor.Query.Update(db, BrandGarment);
                }
                else
                {
                    Accessor.Query.Insert(db, BrandGarment);
                }
            }
        }

        public void Save(List<BrandGarment> BrandGarments)
        {
                foreach (BrandGarment bg in BrandGarments)
                {
                    Save(bg);
                }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="BrandGarment"></param>
        public void Delete(BrandGarment BrandGarment)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, BrandGarment);
            }
        }

        public void Delete(List<BrandGarment> BrandGarments)
        {
            foreach (BrandGarment bg in BrandGarments)
            {
                Delete(bg);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="search_parameter"></param>
        /// <returns></returns>
        public List<BrandGarment> SearchBrandGarments(string[] search_parameter)
        {
            string[] columns = new string[2];
            columns[0] = "BRAND_CODE";
            return Accessor.Query.SelectByKeyWords<BrandGarment>(search_parameter, columns);
        }
    }
}
