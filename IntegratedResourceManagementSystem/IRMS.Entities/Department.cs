using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.Entities
{
    /// <summary>
    /// Dennis Pitallano
    /// July 18, 2012
    /// </summary>
    [TableName("lstDept")]
    public class Department
    {
        [MapField("ID"),PrimaryKey,NonUpdatable]
        public virtual int Id { get; set; }
        [MapField("ListDesc")]
        public virtual string  DepartmentName { get; set; }
    }
}
