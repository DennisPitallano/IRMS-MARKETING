using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;
using System.Data;

namespace IRMS.BusinessLogic.Manager
{
    public class PriceManager
    {
        #region Accessor

        PriceAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return PriceAccessor.CreateInstance(); }
        }

        #endregion

        public List<Price> GetAllPrices()
        {
            return Accessor.GetAllPrice();
        }

        public List<Price> GetPricesPerStyle(string StyleNo)
        {
            return Accessor.GetPricePerStyle(StyleNo);
        }

        public List<Price> GetPricesPerStyle_Brand(string StyleNo, string BrandName)
        {
            return Accessor.GetPricePerStylenoandBrand(StyleNo, BrandName);
        }

        public List<Price> GetPricePer_DatePosted_Style_BrandName(DateTime Date_Posted, string StyleNo, string BrandName)
        {
            return Accessor.GetPricePer_DatePosted_Styleno_BrandName(Date_Posted, StyleNo, BrandName);
        }
        public DataTable PriceCheck(string BRAND, string STYLE_NUMBER, int CUSTOMER_NUMBER)
        {
            return Accessor.PriceCheck(BRAND, STYLE_NUMBER, CUSTOMER_NUMBER);
        }

        public void Save(Price Price)
        {
            using (DbManager dbm = new DbManager())
            {
                if (Price.RecordNo > 0)
                {
                    Accessor.Query.Update(dbm,Price);
                }
                else
                {
                    Accessor.Query.Insert(dbm, Price);
                }
            }
        }

        public DataTable GetSRP(int PRICEGROUP, string STYLE_NUMBER)
        {
            return Accessor.GetCurrentPrice(PRICEGROUP, STYLE_NUMBER);
        }

        public Price GetSRPByStyle(string STYLE_NUMBER, string BRAND_NAME)
        {
            Price PResult = new Price();
            List<Price> PriceList = new List<Price>();

            PriceList = Accessor.GetPricePerStylenoandBrand(STYLE_NUMBER, BRAND_NAME);

            if (PriceList.Count > 0)
                PResult = PriceList[0];
            return PResult;
        }
    }
}
