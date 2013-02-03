using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BLToolkit.Mapping;
using BLToolkit.DataAccess;

namespace IRMS.ObjectModel
{
    [TableName ("RANK")]
    public class Rank
    {
        [MapField("Rank"), PrimaryKey, NonUpdatable]
        public int Ranking { get; set; }

        [MapField("PriceType")]
        public string Price_Type { get; set; }
    }
}
