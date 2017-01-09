using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BazyDanychProgram.Database.Models
{
    public class Rezerwacja
    {
        public int id_rezerwacji { get; set; }
        public string status_rezerwacji { get; set; }
        public bool czy_oplacona { get; set; }
        public DateTime data_rezerwacji { get; set; }
        public DateTime waznosc_do { get; set; }
        public int id_wypozyczenia { get; set; }
        public Rezerwacja()
        { }
    }
}
