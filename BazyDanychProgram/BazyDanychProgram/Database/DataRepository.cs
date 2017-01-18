using BazyDanychProgram.Database.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BazyDanychProgram.Database
{
    public class DataRepository
    {
        
        public List<Kategorie> GetAllCategories()
        {
            return DatabaseOperations.GetCollectionSQL<Kategorie>("Select * from dbo.Kategorie");           
        }

        public List<SprzetWKategorii> GetListaSprzetuWKategorii(int id_kat)
        {
            return DatabaseOperations.GetCollectionProcedure<SprzetWKategorii>("BazyLabPojekt_PobierzListeSprzetuWKategorii", new { id = id_kat });
        }

        public List<Sprzet> GetAllSprzet()
        {
            return DatabaseOperations.GetCollectionSQL<Sprzet>("Select * from dbo.Sprzet");
        }

    }
}
