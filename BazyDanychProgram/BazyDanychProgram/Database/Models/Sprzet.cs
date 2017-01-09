using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BazyDanychProgram.Database.Models
{
    public class Sprzet
    {
        public int id_sprzetu { get; set; }
        public int id_kat { get; set; }
        public string nazwa { get; set; }
        public string stan { get; set; }
        public bool sprawnosc { get; set; }
        public string opis { get; set; }

        public Sprzet()
        { }
    }
}
