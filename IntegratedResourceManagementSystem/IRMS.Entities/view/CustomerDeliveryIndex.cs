using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IRMS.Entities.view
{
    public class CustomerDeliveryIndex
    {
        public int CustomerNumber { get; set; }
        public string CustomerName { get; set; }
        public int DRNumberFrom { get; set; }
        public int DRNumberTo { get; set; }
        public int TotalQuantity { get; set; }
        public float TotalAmount { get; set; }
    }
}
