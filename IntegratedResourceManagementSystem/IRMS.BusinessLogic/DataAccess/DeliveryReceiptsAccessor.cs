using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.Entities.view;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class DeliveryReceiptsAccessor : AccessorBase<DeliveryReceiptsAccessor.DB,DeliveryReceiptsAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT CustNo, MIN(DRNo) AS FromDRNo,MAX(DRNo)AS ToDRNo,Sum(TotalAmt)AS TOTAL_AMOUNT,Sum(TotalQty) AS TOTAL_QUANTITY FROM   DR WHERE DRDate=@DateParam and CustNo=@CustomerNumber group by CustNo")]
        public abstract IList<CustomerDeliveryIndex> CustomerDeliveryIndex();
    }
}
