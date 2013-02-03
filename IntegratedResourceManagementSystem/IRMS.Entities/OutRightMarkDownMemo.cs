using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.DataAccess;
using BLToolkit.Mapping;

namespace IRMS.Entities
{
    [TableName("MDMemoOutrt")]
    public class OutRightMarkDownMemo
    {
        [MapField("ID"),PrimaryKey,NonUpdatable]
        public int RecordNo { get; set; }

        [MapField("MDMemoID")]
        public int MarDownMemoId { get; set; }

        [MapField("StyleNo")]
        public string StyleNumber { get; set; }

        [MapField("StyleDesc")]
        public string StyleDescription { get; set; }

        [MapField("NP")]
        public decimal NP { get; set; }

        [MapField("RemInv")]
        public int RemInv { get; set; }

        [MapField("Rebate")]
        public decimal Rebate { get; set; }

        [MapField("TAR")]
        public decimal TAR { get; set; }

        [MapField("SMDP")]
        public decimal SMDP { get; set; }

        [MapField("NNP")]
        public decimal NNP { get; set; }
    }
}
