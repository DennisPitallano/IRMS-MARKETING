using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;
using BLToolkit.DataAccess;
using IRMS.ObjectModel;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class GroupAreaAccessor : AccessorBase<GroupAreaAccessor.DB, GroupAreaAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM GRPAREA")]
        public abstract List<GroupAreaClass> AllGroupArea();

        [SqlQuery("SELECT * FROM GRPAREA where AGNO = @AreaNo")]
        public abstract List<GroupAreaClass> GroupAreaByAreaNo(int AreaNo);

    }


    public abstract class SubGroupAreaAccessor : AccessorBase<SubGroupAreaAccessor.DB, SubGroupAreaAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM GRPSUBAREA where AGNO = @AreaNo")]
        public abstract List<SubGroupAreaClass> SubGroupAreaByAreaNo(int AreaNo);

        [SqlQuery("SELECT * FROM GRPSUBAREA where SAGNO = @SubAreaNo")]
        public abstract List<SubGroupAreaClass> SubGroupAreaBySubAreaNo(int SubAreaNo);

        [SqlQuery("SELECT * FROM GRPSUBAREA where SAGNO in (SELECT DISTINCT SAGNO from CUSTINFO where AGNO = @AreaNo)")]
        public abstract List<SubGroupAreaClass> SubGroupAreaByCustomerAreaNo(int AreaNo);

        [SqlQuery("SELECT * FROM GRPSUBAREA where SAGNO = @SubAreaNo")]
        public abstract SubGroupAreaClass GetSubGroupArea(int SubAreaNo);
    }

    public abstract class GroupAreaMemoAccessor : AccessorBase<GroupAreaMemoAccessor.DB, GroupAreaMemoAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

        [SqlQuery("SELECT * FROM GRPAREAMEMO")]
        public abstract List<GroupAreaMemoClass> AllGroupArea();

        [SqlQuery("SELECT * FROM GRPAREAMEMO where AGNO = @AreaNo")]
        public abstract List<GroupAreaMemoClass> GroupAreaMemoByAreaNo(int AreaNo);

        [SqlQuery("SELECT * FROM GRPAREAMEMO where MEMOCODE = 'PRV' and GrpNo < 99")]
        public abstract List<GroupAreaMemoClass> GroupAreaMemoByAllProvinces();

        [SqlQuery("SELECT * FROM GRPAREAMEMO where GrpNo > 0 and GrpNo < 99")]
        public abstract List<GroupAreaMemoClass> GroupAreaMemoByAllAreas();

        [SqlQuery("SELECT * FROM GRPAREAMEMO where GrpNo = @GroupNo")]
        public abstract GroupAreaMemoClass GetGroupName(int GroupNo);
    }
}
