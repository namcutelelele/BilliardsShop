﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Share.DTO.ProductImageDTO
{
    public class UpdateProductImageDTO
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public string Source { get; set; } = null!;
        public bool IsMainImage { get; set; }

    }
}
