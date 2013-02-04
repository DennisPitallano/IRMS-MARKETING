using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using IRMS.ObjectModel;
using BLToolkit.DataAccess;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class CompanyAccessor : AccessorBase<CompanyAccessor.DB, CompanyAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM COMPANY")]
        public abstract List<CompanyClass> AllCompany();

        [SqlQuery("SELECT * FROM COMPANY where CompName like @CompanyCriteria")]
        public abstract List<CompanyClass> SearchCompany(string CompanyCriteria);

        [SqlQuery("SELECT * FROM COMPANY where COMPNO = @CompanyNumber")]
        public abstract CompanyClass GetCompany(string CompanyNumber);
    }
}
