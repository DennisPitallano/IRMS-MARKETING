using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    [TableName("COMPANY")]
    public class CompanyClass
    {
        [MapField("COMPNO")]
        public int CompanyNumber { get; set; }

        [MapField("COMPNAME")]
        public string CompanyName { get; set; }

        [MapField("Logo")]
        public string CompanyLogo { get; set; }
    }
}
