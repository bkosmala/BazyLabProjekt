using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BazyDanychProgram.Database.Models
{
    public class Kategorie
    {
        public int id_kategorii { get; set; }
        public int id_kategoria_nadrzedna { get; set; }
        public string nazwa_kat { get; set; }

        public Kategorie()
        { }
    }
}
