using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.Entities
{
    [TableName("CustInfo")]
    public class CustomerInformation
    {
        [MapField("CustNo"),PrimaryKey,NonUpdatable]
        public int CustomerNumber {get;set;}
        [MapField("CompName")]
        public string CompanyName {get;set;}
        [MapField("MainCustNo")]
        public string MainCustomerNumber {get;set;}
        [MapField("CustCode")]
        public string CustomerCode {get;set;}
        [MapField("CustType")]
        public string CustomerType {get;set;}
        [MapField("brand")]
        public string Brand {get;set;}
        [MapField("cbrand")]
        public string CBrand {get;set;}
        [MapField("Agent")]
        public string Agent {get;set;}
        [MapField("PGNo")]
        public int PGNumber {get;set;}
        [MapField("PGMDNo")]
        public int PGMDNumber {get;set;}
        [MapField("AGNo")]
        public int AGNumber {get;set;}
        [MapField("SAGNo")]
        public int SAGNumber {get;set;}
        [MapField("BrandNameNo")]
        public int BrandNameNumber {get;set;}
        [MapField("BrandNameNo2")]
        public int BrandNameNumber2{get;set;}
        [MapField("CompNo")]
        public int CompNumber {get;set;}
        [MapField("ArrangeType")]
        public string ArrangeType {get;set;}
        [MapField("Addr1")]
        public string Address1 {get;set;}
        [MapField("Addr2")]
        public string Address2 {get;set;}
        [MapField("TIN")]
        public string TIN {get;set;}
        [MapField("ContactPerson")]
        public string ContactPerson {get;set;}
        [MapField("ContactPosition")]
        public string ContactPosition {get;set;}
        [MapField("TelNo")]
        public string TelephoneNumber {get;set;}
        [MapField("MobileNo")]
        public string MobileNumber {get;set;}
        [MapField("FaxNo")]
        public string FaxNumber {get;set;}
        [MapField("BillingAddr")]
        public string BillingAddress {get;set;}
        [MapField("ShipToAddr")]
        public string ShipToAddress {get;set;}
        [MapField("OrderedList")]
        public string OrderList {get;set;}
        [MapField("CreditLimit")]
        public float CreditLimit {get;set;}
        [MapField("Terms")]
        public string Terms {get;set;}
        [MapField("ContractDate")]
        public DateTime ContractDate {get;set;}
        [MapField("Remarks")]
        public string Remarks {get;set;}
        [MapField("Regular")]
        public float Regular {get;set;}
        [MapField("Markdown")]
        public float MarkDown{get;set;}
        [MapField("OutletName")]
        public string OuletName {get;set;}
        [MapField("ApprovedBy")]
        public string ApprovedBy {get;set;}
        [MapField("MSNo")]
        public string MSNumber {get;set;}
        [MapField("ynHeadOffice")]
        public bool YesNoHeadOffice {get;set;}
        [MapField("ynLiquidation")]
        public bool YesNoLiquidation {get;set;}
        [MapField("ynApproved")]
        public bool YesNoApproved {get;set;}
        [MapField("ynActive")]
        public bool YesNoActive { get; set; }
    }
}
