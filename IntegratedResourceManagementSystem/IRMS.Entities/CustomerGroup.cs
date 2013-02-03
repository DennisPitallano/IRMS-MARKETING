using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.Entities
{
     [TableName("lstCustGroup")]
   
    public class CustomerGroup
    {
        [MapField("ID"), PrimaryKey, NonUpdatable]
        public int id { get; set; }

        [MapField("Customer")]
        public string Customer { get; set; }

        [MapField("Code")]
        public string Code { get; set; }

        [MapField("BrandName")]
        public string BrandName { get; set; }

        [MapField("ListDesc")]
        public string ListDesc { get; set; }

        [MapField("SAPGroup")]
        public string SAPGroup { get; set; }
    }
    }
