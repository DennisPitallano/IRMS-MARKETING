using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    [TableName("STOCK_TRANSFER_DETAILS")]
    public class StockTransferDetail
    {
        [MapField("ID"),PrimaryKey,NonUpdatable]
        public long RecordNumber {get;set;}
        [MapField("ST_CODE")]
        public string StockTransferCode {get;set;}
        [MapField("CONTAINER_TYPE")]
        public string ContainerType {get;set;}
        [MapField("CONTAINER_NO")]
        public int ContainerNumber {get;set;}
        [MapField("STYLE_NO")]
        public string StyleNumber {get;set;}
        [MapField("STYLE_DESCRIPTION")]
        public string StyleDescription {get;set;}
        [MapField("QUANTITY")]
        public long Quantity {get;set;}
        [MapField("SRP")]
        public decimal SRP {get;set;}
        [MapField("TOTAL_AMOUNT")]
        public decimal TotalAmount {get;set;}
        [MapField("REF_NUMBER")]
        public string ReferenceNumber {get;set;}
        [MapField("DATE_RECORDED")]
        public DateTime DateRecorded { get; set; }
    }
}
