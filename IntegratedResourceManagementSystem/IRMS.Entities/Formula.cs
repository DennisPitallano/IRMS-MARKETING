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
    /// July 19, 2012 11:38 AM
    /// </summary>
    [TableName("lstFormula")]
    public class Formula
    {
        [MapField("ID"),PrimaryKey,NonUpdatable ]
        public virtual int  FormulaId { get; set; }
        [MapField("ListDesc")]
        public virtual string  FormulaDescription { get; set; }
    }
}
