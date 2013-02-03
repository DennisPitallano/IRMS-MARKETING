using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    [TableName("SIZE_GROUP")]
    public class SizeGroup
    {
       [MapField("RECORD_NO"),PrimaryKey,NonUpdatable]
       public long RecordNumber {get;set;}
       [MapField("SIZE_GROUP")]
       public string SizeGroupName { get; set; }
    }
}
