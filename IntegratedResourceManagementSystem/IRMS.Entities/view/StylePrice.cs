using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IRMS.Entities.view
{
    public class StylePrice
    {
        public string StyleNo { get; set; }
        public decimal Price { get; set; }
        public string PriceType { get; set; }
       public   int ID { get; set; }
       public DateTime fromdate { get; set; }
       public string PGNo { get; set; }
       public string GrpNo { get; set; }
       public DateTime todate { get; set; }
       public int GenMemoID { get; set; }
       public string APType { get; set; }
       public decimal SRP { get; set; }
    }
}
