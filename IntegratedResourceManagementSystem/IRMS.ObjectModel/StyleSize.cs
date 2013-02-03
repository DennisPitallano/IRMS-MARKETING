using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    [TableName("STYLE_SIZES")]
    public class StyleSize
    {
        [MapField("RECORD_NO"),PrimaryKey,NonUpdatable]
        public long RecordNo {get;set;}
        [MapField("STYLE_NUMBER")]
        public string StyleNumber {get;set;}
        [MapField("SIZE_CODE")]
        public string SizeCode {get;set;}
        [MapField("DATE_RECORDED")]
        public DateTime DateCreated { get; set; }
    }
}
