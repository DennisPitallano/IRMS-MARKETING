using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.Entities
{
    [TableName("lstTerms")]
    public class Term
    {
        [MapField("ID"),PrimaryKey,NonUpdatable]
        public virtual int TermId { get; set; }

        [MapField("ListDesc")]
        public virtual string TermName { get; set; }
    }
}
