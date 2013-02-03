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
    /// </summary>
    [TableName("Company")]
    public class Company
    {
        [MapField("CompNo"),PrimaryKey , NonUpdatable]
        public virtual int  CompanyId { get; set; }

        [MapField("CompName")]
        public virtual string CompanyName { get; set; }

        [MapField("Logo")]
        public virtual string CompanyLogo { get; set; }
    }
}
