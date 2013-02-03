using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.ObjectModel;
using IRMS.Entities.view;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class PricePointAccessor : AccessorBase<PricePointAccessor.DB, PricePointAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") {} }

        [SqlQuery("select * from PricePoint")]
        public abstract List<PricePoint> GetAllPricePoint();

        [SqlQuery("select * from PricePoint where styleno=@StyleNo")]
        public abstract List<PricePoint> GetPricePointPerStyle(string StyleNo);

        [SqlQuery("select * from PricePoint where styleno=@StyleNo and brandname=@BrandName")]
        public abstract List<PricePoint> GetPricePointPerStyleandBrand(string StyleNo, string BrandName);

        [SqlQuery("select * from PricePoint a inner join Rank b on a.pricetype=b.pricetype where pgno=@PGNo and (a.pricetype='Area' and grpno=1) and (dateapproved is not null) and ynoutright=0 and styleno=@StyleNo")]
        public abstract List<PricePoint> GetPricePointPerPGNO_Type_GRPNo_Style(string StyleNo, int PGNo);

        [SqlQuery("select * from PricePoint a inner join Rank b on a.pricetype=b.pricetype where pgno=@PGNo and (a.pricetype='Area' and grpno=1) and (dateapproved is not null) and ynoutright=0 and styleno=@StyleNo and brandname=@BrandName")]
        public abstract List<PricePoint> GetPricePointPerPGNO_Type_GRPNo_Style_Brand(string StyleNo, string BrandName, int PGNo);
        [SqlQuery(@"select TOP 1 id, price, fromdate,StyleNo,PGNo,GrpNo,PriceType, todate,GenMemoID  from pricepoint where ynoutright=0 and  (dateapproved is not null) and StyleNo=@STYLE_NUMBER and PGno=@PGNO and ((pricetype='Area' and grpno=@GRPNO) or (pricetype='Sub-Area' and grpno=@SAGRPNO)   or (pricetype='Customer' and grpno=@CUSTOMERNO)) order by fromdate desc")]
        public abstract StylePrice GetStylePrice(string STYLE_NUMBER, int PGNO, int GRPNO, int SAGRPNO, int CUSTOMERNO);


        [SqlQuery(@"select TOP 1 * from pricepoint where ynoutright=0 and (dateapproved is not null) 
and StyleNo=@STYLE_NUMBER and Brandname=@BRAND_NAME 
and UPPER(PriceType)=@PriceType 
and GrpNo = @GrpNo and PGNo = 2
order by fromdate desc")]
        public abstract PricePoint GetLatestStylePriceByBrand(string STYLE_NUMBER, string BRAND_NAME, string PriceType, int GrpNo);

        [SqlQuery(@"select distinct grpno from pricepoint where memono = @MemoNo")]
        public abstract List<int> GetDistinctGroupList(string MemoNo);

        [SqlQuery(@"select distinct DateApproved from pricepoint where memono = @MemoNo")]
        public abstract DateTime GetApprovedDate(string MemoNo);

    }
}
