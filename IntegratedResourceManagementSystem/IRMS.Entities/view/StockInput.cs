using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IRMS.Entities.view
{
    public class StockInput
    {
        string StyleNumber { get; set; }
        string BrandName { get; set; }
        string Description { get; set; }
        DateTime DatePosted { get; set; }
        double SRP { get; set; }
        int PriceGroupNumber { get; set; }
        int AreaGroupNumber { get; set; }
        double MarkDownPrice { get; set; }
        string TopOrBottom { get; set; }
        string Area { get; set; }
        string SubArea { get; set; }
    }
}
