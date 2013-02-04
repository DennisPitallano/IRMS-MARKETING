using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.ObjectModel;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class WholesalerAccessor : AccessorBase<WholesalerAccessor.DB, WholesalerAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM WHOLESALER_TBL")]
        public abstract List<WholesalerClass> Wholesaler();

        [SqlQuery("SELECT * FROM WHOLESALER_TBL where WHOLESALER_ID = @WholesalerID")]
        public abstract List<WholesalerClass> WholesalerByID(string WholesalerID);

        [SqlQuery("SELECT * FROM WHOLESALER_TBL where WHOLESALER_ID = @WholesalerID and BRAND_CODE = @BrandCode")]
        public abstract List<WholesalerClass> WholesalerByBrandCode(string WholesalerID, string BrandCode);
    }

    public abstract class WholesalerContractAccessor : AccessorBase<WholesalerContractAccessor.DB, WholesalerContractAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM WHOLESALER_CONTRACT_TBL")]
        public abstract List<WholesalerContractClass> WholesalerContract();

        [SqlQuery("SELECT * FROM WHOLESALER_CONTRACT_TBL where WHOLESALER_ID = @WholesalerID")]
        public abstract List<WholesalerContractClass> WholesalerContractByID(string WholesalerID);

        [SqlQuery("SELECT * FROM WHOLESALER_CONTRACT_TBL where WHOLESALER_ID = @WholesalerID and BRAND_CODE = @BrandCode")]
        public abstract List<WholesalerContractClass> WholesalerContractByBrandCode(string WholesalerID, string BrandCode);
    }
}