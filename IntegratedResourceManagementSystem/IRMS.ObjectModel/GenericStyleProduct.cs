using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    /// <summary>
    /// Author: Dennis Pitallano
    /// </summary>
    [TableName("GENERIC_STYLE_LIST_DTL")]
    public class GenericStyleProduct
    {
       [MapField("RECORD_NO"),PrimaryKey ,NonUpdatable]
       public int RecordNumber {get;set;} 

       [MapField("NEW_STYLE_NO")]
       public string GenericStyleNumber {get;set;}

       [MapField("BARCODE")]
       public string BarCode {get;set;}

       [MapField("OLD_STYLE_NO")]
       public string OldStyleNumber {get;set;}

       [MapField("BRAND")]
       public string Brand { get; set; }

       [MapField("DATE_GENERATED")]
       public DateTime DateGenerated { get; set; }

       [MapField("SRP")]
       public decimal SRP { get; set; }
    }
}
