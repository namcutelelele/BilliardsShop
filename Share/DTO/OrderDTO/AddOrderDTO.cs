﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Share.DTO.OrderDTO
{
    public class AddOrderDTO
    {
        public DateTime Date { get; set; }
        public double Total { get; set; }
        public string ShippingAddress { get; set; } = null!;
        public string Note { get; set; } = null!;
        public int Status { get; set; }
        public int UserId { get; set; }
    }
}
