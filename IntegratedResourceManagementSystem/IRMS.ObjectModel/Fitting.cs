using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    [TableName("FITTINGS")]
    public class Fitting
    {
        [MapField("RECORD_NO"), PrimaryKey, NonUpdatable]
        public long RecordNumber { get; set; }

        [MapField("FITTING_CODE")]
        public string FiitingCode { get; set; }

        [MapField("FITTING_NAME")]
        public string FittingName { get; set; }

        [MapField("CATEGORY")]
        public string Category { get; set; }

        [MapField("BRAND_NAME")]
        public string BrandName { get; set; }

        [MapField("DATE_RECORDED")]
        public DateTime DateRecorded { get; set; }

        [MapField("FITTING_SERIES_CODE")]
        public string FittingSeriesCode { get; set; }
    }
}
