using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    [TableName("FABRICSUPPLIERS")]
    public class FabricSupplier
    {
      [MapField("ID"),PrimaryKey,NonUpdatable]
      public int RecordNumber {get;set;}
      [MapField("SUPPLIER_NAME"),NotNull]
      public string SupplierName {get;set;}
      [MapField("SUPPLIER_ADDRESS"),Nullable]
      public string SupplierAddress {get;set;}
      [MapField("SUPPLIER_CONTACT")]
      public string SupplierContact {get;set;}
      [MapField("DATE_RECORDED")]
      public DateTime DateRecorded { get; set; }
    }
}
