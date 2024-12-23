﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Share.DTO.ProductDTO
{
    public class UpdateProductRequestDTO
    {
        public int Id { get; set; }
        public int CategoryId { get; set; }
        public int UnitsInStock { get; set; }
        public bool? IsAvailable { get; set; }
        public int BrandId { get; set; }
    }
}
