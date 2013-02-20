using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.ObjectModel
{
    [TableName("STOCK_TRANSFERS")]
    public class StockTransfer
    {
        [MapField("ID"),PrimaryKey,NonUpdatable]
        public long RecordNumber {get;set;}
        [MapField("ST_CODE")]
        public string StockTransferCode {get;set;}
        [MapField("FROM_CUSTOMER_NUMBER")]
        public int FromCustomerNumber {get;set;}
        [MapField("FROM_CUSTOMER_NAME")]
        public string FromCustomerName {get;set;}
        [MapField("POL_ID")]
        public long PullOutLetterId {get;set;}
        [MapField("POL_SERIES_NUMBER")]
        public string PullOutLetterSeriesNumber{get;set;}
        [MapField("TO_CUSTOMER_NUMBER")]
        public int ToCustomerNumber {get;set;}
        [MapField("TO_CUSTOMER_NAME")]
        public string ToCusmtomerName {get;set;}
        [MapField("REF_NUMBER")]
        public string ReferenceNumber {get;set;}
        [MapField("BRAND_NAME")]
        public string BrandName {get;set;}
        [MapField("TOTAL_QTY")]
        public long TotalQuantity {get;set;}
        [MapField("TOTAL_AMT")]
        public double TotalAmount {get;set;}
        [MapField("ST_DATE")]
        public DateTime StockTransferDate {get;set;}
        [MapField("DATE_RECORDED")]
        public DateTime DateRecorded { get; set; }
    }
}
