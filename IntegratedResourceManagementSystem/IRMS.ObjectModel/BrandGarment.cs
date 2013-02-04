using System;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    [TableName("BRAND_GARMENTS")]
    public class BrandGarment
    {
        [MapField("RECORD_NO"), PrimaryKey, NonUpdatable]
        public long RecordNo { get; set; }
        [MapField("BRAND_CODE")]
        public string BrandCode { get; set; }
        [MapField("GARMENT_CODE")]
        public string GarmentCode { get; set; }
        [MapField("DATE_RECORDED")]
        public DateTime DateRecorded { get; set; }
    }
}
