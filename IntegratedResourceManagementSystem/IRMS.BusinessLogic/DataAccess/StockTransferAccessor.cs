using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class StockTransferAccessor: AccessorBase<StockTransferAccessor.DB ,StockTransferAccessor>
    {
    public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

    [SqlQuery(@"DECLARE	@return_value int EXEC @return_value = [dbo].[GET_DR_SEQUENCE]
		@CompanyNumber =@CompanyNumber,
		@UserCode = @UserCode
        SELECT	'Return Value' = @return_value
        ")]
    public abstract long getDRNumberSequenceNumber(int CompanyNumber, string UserCode);

 
    
    }
}
