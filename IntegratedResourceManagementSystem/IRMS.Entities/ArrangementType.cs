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
    /// July 19, 2012 11:28 AM
    /// </summary>
    [TableName("lstArrangeType")]
    public class ArrangementType
    {
        [MapField("ID"),PrimaryKey ,NonUpdatable]
        public virtual int  ArrangementId { get; set; }
        [MapField("ListDesc")]
        public virtual string  ArrangementDescription { get; set; }
    }
}
