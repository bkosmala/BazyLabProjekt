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
        public DateTime data_zakupu { get; set; }
        public Decimal cena_zakupu { get; set; } //decimal?
        public bool sprawnosc { get; set; }


        public Sprzet()
        { }
    }
}

