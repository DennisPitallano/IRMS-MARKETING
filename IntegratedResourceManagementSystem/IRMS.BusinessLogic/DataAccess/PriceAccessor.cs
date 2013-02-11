using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.ObjectModel;
using System.Data;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class PriceAccessor : AccessorBase<PriceAccessor.DB, PriceAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") {} }

        [SqlQuery(@"select * from Price")]
        public abstract List<Price> GetAllPrice();

        [SqlQuery(@"select * from Price where style=@StyleNo")]
        public abstract List<Price> GetPricePerStyle(string StyleNo);

        [SqlQuery(@"select * from Price where StyleNo=@StyleNo and brandname=@BrandName")]
        public abstract List<Price> GetPricePerStylenoandBrand(string StyleNo, string BrandName);

        [SqlQuery(@"select * from Price where dateposted=@Date_Posted and styleno=@StyleNo and brandname=@BrandName")]
        public abstract List<Price> GetPricePer_DatePosted_Styleno_BrandName(DateTime Date_Posted, string StyleNo, string BrandName);

        [SprocName(@"SP_PRICE_CHECK"), DataSetTable("PriceCheck")]
        public abstract DataTable PriceCheck(string BRAND,string STYLE_NUMBER,int CUSTOMER_NUMBER);

        [SqlQuery(@"select * from price where styleno =@STYLE_NUMBER order by id desc"), DataSetTable("CurrentPrice")]
        public abstract DataTable GetCurrentPrice(int PRICEGROUP, string STYLE_NUMBER);
    }
}
