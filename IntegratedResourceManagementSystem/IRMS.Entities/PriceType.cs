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
    /// July 19, 2012 5:01 PM
    /// </summary>
    [TableName("lstPriceType")]
    public class PriceType
    {
        [MapField("ID"),PrimaryKey,NonUpdatable]
        public virtual int  PriceTypeId { get; set; }
        [MapField("ListDesc")]
        public virtual string PriceTypeDescription { get; set; }
    }
}
