using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BazyDanychProgram.Database.Models
{
    public class KategorieSprzetu
    {
        public int id_kategorii { get; set; }
        public int id_cennika { get; set; }
        public string nazwa_kat { get; set; }

        public KategorieSprzetu()
        { }
    }
}
