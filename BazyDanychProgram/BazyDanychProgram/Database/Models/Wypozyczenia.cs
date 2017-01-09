using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BazyDanychProgram.Database.Models
{
    public class Wypozyczenia
    {
        public int id_wypozyczenia { get; set; }
        public DateTime data_wypozyczenia { get; set; }
        public DateTime data_zwrotu { get; set; }
        public string uwagi { get; set; }

        public Wypozyczenia()
        { }
    }
}
