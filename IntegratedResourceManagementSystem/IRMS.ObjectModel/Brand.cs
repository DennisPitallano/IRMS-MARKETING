using System;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    /// <summary>
    /// <Author> Dennis Pitallano</Author>
    /// <DateCreated>December 2011</DateCreated>
    /// <Company>iServe </Company>
    /// <ClassDescription>Brand Class Model</ClassDescription>
    /// </summary>
    [TableName ("BRANDS")]
    public class Brand
    {
        [MapField("RECORD_NO"), PrimaryKey, NonUpdatable]
        public long RecordNo { get; set; }

        [MapField("BRAND_CODE")]
        public string BrandCode { get; set; }

        [MapField("BRAND_DESCRIPTION")]
        public string BrandDescription { get; set; }

        [MapField("DATE_RECORDED")]
        public DateTime  DateCreated { get; set; }

        [MapField("IS_ACTIVE")]
        public string IsActive { get; set; }

        [MapField("START_SERIES")]
        public string StartSeries { get; set; }

        [MapField("MEMO_CODE")]
        public string MemoCode { get; set; }
    }
}
