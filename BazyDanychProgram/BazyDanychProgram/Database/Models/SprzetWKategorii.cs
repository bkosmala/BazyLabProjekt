﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BazyDanychProgram.Database.Models
{
    public class SprzetWKategorii
    {
        public int id_sprzetu { get; set; }
        public string nazwa { get; set; }
        public int id_kat { get; set; }
        public string nazwa_kat { get; set; }


        public SprzetWKategorii()
        { }
    }
}
