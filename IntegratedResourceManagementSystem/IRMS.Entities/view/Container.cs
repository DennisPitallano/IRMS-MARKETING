using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace IRMS.Entities.view
{
    public class Container
    {
        public string BoxNumber { get; set; }
        public long ItemsQuantity { get; set; }
        public int StylesQuantity { get; set; }
        public decimal TotalAmount { get; set; }
        public string Type { get; set; }
        public string ImageUrl { get; set; }
        public bool IsSelected { get; set; }
    }
}
