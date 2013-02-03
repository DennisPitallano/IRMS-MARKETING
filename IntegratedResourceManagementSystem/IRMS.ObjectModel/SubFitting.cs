using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    //09066009935
    [TableName("SUB_FITTINGS")]
    public class SubFitting
    {
        [MapField("RECORD_NO"), PrimaryKey, NonUpdatable]
        public long RecordNumber { get; set; }

        [MapField("FITTING_CODE")]
        public string FittingCode { get; set; }

        [MapField("SUB_FITTING_DESC")]
        public string SubFittingDesc { get; set; }

        [MapField("DATE_RECORDED")]
        public DateTime DateRecorded { get; set; }
    }
}
