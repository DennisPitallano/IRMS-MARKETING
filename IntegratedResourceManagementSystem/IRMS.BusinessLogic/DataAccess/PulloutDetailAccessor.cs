using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using IRMS.ObjectModel;
using BLToolkit.DataAccess;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class PulloutDetailAccessor : AccessorBase<PulloutDetailAccessor.DB, PulloutDetailAccessor>
    {
        public class DB : DbManager
        {
            public DB()
                : base("IRMSConnectionString")
            {
            }
        }

        [SqlQuery("SELECT * FROM Pullout_Detail WHERE pullout_id=@Identity")]
        public abstract List<PullOutLetterDetail> GetPODetailByRequests(long Identity);

        [SqlQuery("SELECT * FROM Pullout_Detail WHERE customer_no=@CustNo and Pullout_Date=@PODate")]
        public abstract List<PullOutLetterDetail> GetPODetailByRequest(int CustNo, DateTime PODate);

        //[SqlQuery("SELECT * FROM Pullout_Detail WHERE customer_no=@CustNo and Pullout_Date=@PODate")]
        //public abstract PulloutDetail GetPODetailByRequests(int CustNo, DateTime PODate);

        [SqlQuery("SELECT * FROM Pullout_Detail WHERE box_no=@BoxNo")]
        public abstract List<PullOutLetterDetail> GetPODetailByBoxNo(int BoxNo);

        [SqlQuery("SELECT * FROM Pullout_Detail WHERE styleno=@StyleNo")]
        public abstract List<PullOutLetterDetail> GetPODetailByStyle(string StyleNo);

        [SqlQuery("SELECT * FROM Pullout_Detail WHERE styleno=@StyleNo and box_no=@BoxNo")]
        public abstract List<PullOutLetterDetail> GetPODetailByStyleAndBoxNo(string StyleNo, int BoxNo);


    }
}
