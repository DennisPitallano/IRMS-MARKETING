using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.Entities
{
    [TableName("MDMemoCncn")]
    public class ConcessionMarkDownMemo
    {
        [MapField("ID")]
        public int RecordNo { get; set; }
        [MapField("MDMemoID")]
        public int MarkDownMemoNnumber { get; set; }
        [MapField("StyleNo")]
        public string StyleNumber { get; set; }
        [MapField("StyleDesc")]
        public string StyleDescription { get; set; }
        [MapField("CurrPrice")]
        public decimal CurrentPrice { get; set; }
        [MapField("RemInv")]
        public int RemInvDate { get; set; }
        [MapField("Discount")]
        public decimal Discount { get; set; }
        [MapField("TtlAmtDisc")]
        public decimal TotalAmountDiscount { get; set; }
        [MapField("MDPrice")]
        public decimal MarkDownPrice { get; set; }
        [MapField("ynFurther")]
        public bool ynFurther { get; set; }
        [MapField("tmpid")]
        public int TempId { get; set; }
    }
}
