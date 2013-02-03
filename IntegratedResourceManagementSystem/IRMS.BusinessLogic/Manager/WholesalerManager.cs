using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.Manager
{
    public class WholesalerManager
    {
        #region Accessor
        WholesalerAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return WholesalerAccessor.CreateInstance(); }
        }
        #endregion

        private Brand brand = new Brand();
        public Brand BrandObject
        {
            set { brand = value; }
        }

        public WholesalerClass GetWholesalerByKey(long id)
        {
            return Accessor.Query.SelectByKey<WholesalerClass>(id) ?? new WholesalerClass();
        }
        public List<WholesalerClass> Wholesaler()
        {
            return Accessor.Wholesaler();
        }

        public void Save(WholesalerClass WholeSaler)
        {
            WholeSaler.BrandCode = brand.BrandCode;

            using (DbManager db = new DbManager())
            {
                try
                {
                    if (WholeSaler.RecordNo != 0)
                    {
                        Accessor.Query.Update(db, WholeSaler);
                    }
                    else
                    {
                        Accessor.Query.Insert(db, WholeSaler);
                    }
                }
                catch (Exception except)
                {
                    throw new System.ArgumentException(except.Message);
                }
            }
        }
        public void Delete(WholesalerClass WholeSaler)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, WholeSaler);
            }
        }
    }

    public class WholesalerContractManager
    {
        #region Accessor
        WholesalerContractAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return WholesalerContractAccessor.CreateInstance(); }
        }
        #endregion

        private Brand brand = new Brand();
        public Brand BrandObject
        {
            set { brand = value; }
        }

        public WholesalerContractClass GetWholesalerContractByKey(long id)
        {
            return Accessor.Query.SelectByKey<WholesalerContractClass>(id) ?? new WholesalerContractClass();
        }
        public List<WholesalerContractClass> Wholesaler()
        {
            return Accessor.WholesalerContract();
        }

        public void Save(WholesalerContractClass WholesalerContract)
        {
            WholesalerContract.BrandCode = brand.BrandCode;

            using (DbManager db = new DbManager())
            {
                try
                {
                    if (WholesalerContract.RecordNo != 0)
                    {
                        Accessor.Query.Update(db, WholesalerContract);
                    }
                    else
                    {
                        Accessor.Query.Insert(db, WholesalerContract);
                    }
                }
                catch (Exception except)
                {
                    throw new System.ArgumentException(except.Message);
                }
            }
        }
        public void Delete(WholesalerContractClass WholesalerContract)
        {
            using (DbManager db = new DbManager())
            {
                Accessor.Query.Delete(db, WholesalerContract);
            }
        }
    }
}
