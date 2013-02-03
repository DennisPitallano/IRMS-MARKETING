using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    [TableName("BRAND_DEPT_CODES")]
    public class BrandDepartmentCode
    {
        [MapField("RECORD_NUMBER"), PrimaryKey,NonUpdatable]
        public long RecordNumber { get; set; }
        [MapField("BRAND")]
        public string BrandName { get; set; }
        [MapField("BRAND_CODE")]
        public string BrandCode { get; set; }
        [MapField("DEPT_CODE")]
        public string DepartmentCode { get; set; }
    }
}
