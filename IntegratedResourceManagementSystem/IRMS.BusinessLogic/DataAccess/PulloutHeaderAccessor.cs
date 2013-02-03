using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using IRMS.ObjectModel;
using BLToolkit.DataAccess;
using System.Web.UI.WebControls;
using System.Data;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class PullOutLetterAccessor : AccessorBase<PullOutLetterAccessor.DB, PullOutLetterAccessor>
    {
        public class DB : DbManager
        {
            public DB()
                : base("IRMSConnectionString")
            {
            }
        }

        [SqlQuery("SELECT * FROM PULL_OUT_LETTERS ORDER BY ID DESC")]
        public abstract List<PullOutLetter> GetAllPOHead();

        [SqlQuery("SELECT * FROM PULL_OUT_LETTERS WHERE customer_no = @CustNo")]
        public abstract List<PullOutLetter> GetPOHeadByCustomer(long CustNo);

        [SqlQuery("SELECT * FROM PULL_OUT_LETTERS WHERE pullout_date= @PulloutDate and customer_no = @CustNo")]
        public abstract List<PullOutLetter> GetPOHeadByPDateAndCustno(DateTime PulloutDate, long CustNo);

        [SqlQuery("SELECT * FROM PULL_OUT_LETTERS WHERE pullout_date= @PulloutDate and customer_no = @CustNo")]
        public abstract PullOutLetter GetPOHeadsByPDateAndCustno(DateTime PulloutDate, long CustNo);

        [SqlQuery("SELECT * FROM PULL_OUT_LETTERS WHERE pullout_date= @PulloutDate")]
        public abstract List<PullOutLetter> GetPOHeadByPDate(DateTime PulloutDate);

        [SqlQuery("UPDATE PULL_OUT_LETTERS SET is_active='CONFIRMED' WHERE id=@RecordNo")]
        public abstract void RequestConfirmed(long RecordNo);

        [SqlQuery("SELECT max(SERIES_per_BRAND)as SERIES FROM PULL_OUT_LETTERS WHERE BRANDNAME = @BrandName")]
        public abstract List<PullOutLetter> GetLastSeriesPerBrand(string BrandName);

        [SprocName("SP_GET_BRANCHNAME_BY_CUSTOMER_NUMBER")]
        public abstract string GetBranchNameByCustomerNumber(int CUSTOMER_NUMBER);

        [SprocName("SP_GET_PRODUCT_BY_STYLE_NUMBER"), DataSetTable("ITEM")]
        public abstract DataTable GetProductByStyleNumber(string STYLE_NUMBER);

        [SprocName("SP_GET_ACCOUNT_NAME_BY_CUSTOMER_NUMBER")]
        public abstract string GetAccountNameByCustomerNumber(int CUSTOMER_NUMBER);
    }
}
