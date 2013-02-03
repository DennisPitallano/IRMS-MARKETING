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
    /// July 19, 2012 11:49 AM
    /// </summary>
    [TableName("lstUserLevel")]
    public class UserLevel
    {
        [MapField("ID"),PrimaryKey,NonUpdatable]
        public virtual int UserLevelId { get; set; }
        [MapField("ListDesc")]
        public virtual string  UserLevelDescription { get; set; }
    }
}
