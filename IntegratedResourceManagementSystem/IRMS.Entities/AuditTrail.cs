using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.Entities
{
    [TableName("AuditTrail")]
    public class AuditTrail
    {
        [MapField("ID"), PrimaryKey, NonUpdatable]
        public int Id { get; set; }
        [MapField("DTStamp")]
        public DateTime DateRecorded { get; set; }
        [MapField("ActionTaken")]
        public string ActionTaken { get; set; }
        [MapField("UserName")]
        public string UserName { get; set; }
    }
}
