using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    [TableName("BRANCH_DEPT_CODES")]
    public class BranchDepartmentCode
    {
        [MapField("RECORD_NUMBER"), PrimaryKey, NonUpdatable]
        public long RecordNumber { get; set; }
        [MapField("BRANCH_NAME")]
        public string  BranchName { get; set; }
        [MapField("DEPT_CODE")]
        public string  DepartmentCode { get; set; }
    }
}
