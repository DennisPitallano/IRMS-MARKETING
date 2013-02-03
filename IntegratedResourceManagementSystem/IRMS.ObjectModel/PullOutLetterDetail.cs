using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Mapping;
using BLToolkit.DataAccess;

namespace IRMS.ObjectModel
{
    [TableName("PULL_OUT_LETTER_DETAILS")]
    public class PullOutLetterDetail
    {
        [MapField("ID"), PrimaryKey, NonUpdatable]
        public long RecordNumber { get; set; }

        [MapField("PULL_OUT_CODE")]
        public string PullOutLetterCode { get; set; }

        [MapField("CONTAINER_TYPE")]
        public string ContainerType { get; set; }

        [MapField("CONTAINER_NO")]
        public int ContainerNumber { get; set; }

        [MapField("STYLE_NO")]
        public string StyleNumber { get; set; }

        [MapField("STYLE_DESCRIPTION")]
        public string StyleDescription { get; set; }

        [MapField("QUANTITY")]
        public long Quantity { get; set; }

        [MapField("SRP")]
        public decimal SRP { get; set; }

        [MapField("TOTAL_AMOUNT")]
        public decimal TtlAmount { get; set; }

        [MapField("LOST_TAG")]
        public bool IsLostTag { get; set; }
    }
}
