using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.ObjectModel;
using BLToolkit.Data;
using IRMS.BusinessLogic.DataAccess;

namespace IRMS.BusinessLogic.Manager
{
    public class FabricSupplierManager : LogManager<FabricSupplier>, IBaseManager<FabricSupplier>
    {
        #region Accessor
        FabricAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return FabricAccessor.CreateInstance(); }
        }
        #endregion

        public void Save(FabricSupplier fabricSupplier)
        {
            using(DbManager dbm = new DbManager())
            {
                if (fabricSupplier.RecordNumber>0)
                {
                    Accessor.Query.Update(dbm,fabricSupplier);
                }
                else
                {
                    Identity = Accessor.Query.Insert(dbm,fabricSupplier);
                }
            }
        }

        public void Delete(FabricSupplier fabricSupplier)
        {
            using (DbManager dbm = new DbManager())
            {
                Accessor.Query.Delete(dbm,fabricSupplier);   
            }
        }

        public void Delete(List<FabricSupplier> fabricSuppliers)
        {
            foreach (var fabricSupplier in fabricSuppliers)
            {
                this.Delete(fabricSupplier);
            }
        }

        public List<FabricSupplier> FetchAll()
        {
            return Accessor.Query.SelectAll<FabricSupplier>() ?? new List<FabricSupplier>();
        }

        public FabricSupplier FetchById(int key)
        {
            return Accessor.Query.SelectByKey<FabricSupplier>(key) ?? new FabricSupplier();
        }
    }
}
