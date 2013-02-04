﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Data;

namespace IRMS.BusinessLogic.DataAccess
{
    public abstract class BranchDepartmentCodeAccessor : AccessorBase<BranchDepartmentCodeAccessor.DB, BranchDepartmentCodeAccessor>
    {
        public class DB : DbManager { public DB() : base("IRMSConnectionString") { } }

    }
}
