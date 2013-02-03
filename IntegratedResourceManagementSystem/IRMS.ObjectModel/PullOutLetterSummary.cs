using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    [TableName("PULL_OUT_LETTER_SUMMARIES")]
    public class PullOutLetterSummary
    {
        [MapField("ID"),PrimaryKey,NonUpdatable]
        public int RecordNumber {get;set;}
        [MapField("PULL_OUT_CODE")]
        public string PullOutCode {get;set;}
        [MapField("CONTAINER_TYPE")]
        public string ContainerType {get;set;}
        [MapField("CONTAINER_NO")]
        public int ContainerNumber {get;set;}
        [MapField("TOTAL_QUANTITY")]
        public int TotalQuantity { get; set; }
    }
}
