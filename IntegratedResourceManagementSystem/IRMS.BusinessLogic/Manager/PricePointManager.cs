using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IRMS.BusinessLogic.DataAccess;
using IRMS.ObjectModel;
using BLToolkit.Data;
using IRMS.Entities.view;

namespace IRMS.BusinessLogic.Manager
{
    public class PricePointManager
    {
        #region Accessor

        PricePointAccessor Accessor
        {
            [System.Diagnostics.DebuggerStepThrough]
            get { return PricePointAccessor.CreateInstance(); }
        }

        #endregion

        public List<PricePoint> GetAllPricePoints()
        {
            return Accessor.GetAllPricePoint();
        }

        public List<PricePoint> GetPricePointPerStyle(string StyleNo)
        {
            return Accessor.GetPricePointPerStyle(StyleNo);
        }

        public List<PricePoint> GetPricePointsPerStyle_Brand(string StyleNo, string BrandName)
        {
            return Accessor.GetPricePointPerStyleandBrand(StyleNo, BrandName);
        }

        public List<PricePoint> GetPricePointsPerPGNO_Type_GRPNo_Style(string StyleNo, int PGNo)
        {
            return Accessor.GetPricePointPerPGNO_Type_GRPNo_Style(StyleNo, PGNo);
        }

        public List<PricePoint> GetPricePointsPerPGNO_Type_GRPNo_Style_Brand(string StyleNo, string BrandName, int PGNo)
        {
            return Accessor.GetPricePointPerPGNO_Type_GRPNo_Style_Brand(StyleNo, BrandName, PGNo);
        }

        public StylePrice GetStyleCurrentPrice(string STYLE_NUMBER, int PGNO, int GRPNO, int SAGRPNO, int CUSTOMERNO)
        {
            return Accessor.GetStylePrice(STYLE_NUMBER, PGNO, GRPNO, SAGRPNO, CUSTOMERNO);
        }

        public PricePoint GetStyleCurrentPrice1(string STYLE_NUMBER, string BRAND_NAME, string PriceType, int GroupNo)
        {
            return Accessor.GetLatestStylePriceByBrand(STYLE_NUMBER, BRAND_NAME, PriceType, GroupNo);
        }

        public List<int> GetDistinctGroupNoByMemoNo(string MemoNo)
        {
            return Accessor.GetDistinctGroupList(MemoNo);
        }

        public DateTime GetApprovedDate(string MemoNo)
        {
            return Accessor.GetApprovedDate(MemoNo);
        }

        public void DeleteByMemoNo(string MemoNo)
        {
            using (DbManager dbm = new DbManager())
            {
                dbm.SetCommand(string.Format("DELETE FROM PRICEPOINT WHERE MEMONO = '{0}'", MemoNo)).ExecuteNonQuery();
            }
        }

        public void Save(PricePoint Object)
        {
            using (DbManager dbm = new DbManager())
            {
                Accessor.Query.Insert(dbm, Object);
            }
        }
    }
}
