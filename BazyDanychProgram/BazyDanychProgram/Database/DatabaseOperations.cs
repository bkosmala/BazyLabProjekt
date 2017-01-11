using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BazyDanychProgram.Database
{
    public class DatabaseOperations
    {
        /**
         *Dwie wersje funkcji: 
          - zakończone na Procedure do wykonywania procedur
          - zakończone na SQL do wykonywania zapytań podanych jako string

            Każda funkcja do zwrócenia złożonych danych wynikowych (składających się z kilku kolumn tabeli)
            potrzebuje modelu, czyli klasy o strukturze takiej jak zwracane dane.

            Jeśli zwracamy np. listę int nie jest potrzebny żaden model - tylko do danych złożonych

            Ważne: każda klasa model musi mieć bezparametrowy konstruktor - inaczej będzie błąd.
            
            Funkcje zwracają całe listy obiektów,
            użyć FirstOrDefault<T>() w celu uzyskania pojedynczych wartości.

            wykomentowane funkcje działają, ale nie są niezbedne
            była mała ewolucja pomysłu, ale postanowiłem sprawę maksymalnie uprościć
            
            */
        // na innym komputerze  trzeba zmienić nazwę Server w stringu poniżej
        private static readonly string _sConnectionString = "Server=HYBRYDA;Database=CentrumSportu;Trusted_Connection=True;";

        // zwraca listę rekordów 
        public static List<T> GetCollectionProcedure<T>(string storedProcedure, object args)
        {
            List<T> result = new List<T>();

            using (SqlConnection connection = new SqlConnection(DatabaseOperations._sConnectionString))
            {

                var queryResult = connection.Query<T>(storedProcedure, args, commandType: CommandType.StoredProcedure);

                if (queryResult.HasValue())
                {
                    result = queryResult.AsEnumerable().ToList<T>();
                }
            }
            return result;
        }

        // zwraca listę rekordów 
        public static List<T> GetCollectionSQL<T>(string sqlQuery)
        {
            List<T> result = new List<T>();

            using (SqlConnection connection = new SqlConnection(DatabaseOperations._sConnectionString))
            {
                var queryResult = connection.Query<T>(sqlQuery, commandType: CommandType.Text);

                if (queryResult.HasValue())
                {
                    result = queryResult.AsEnumerable().ToList<T>();
                }
            }
            return result;
        }


























        /*
        // zwraca listę rekordów czyli konkretnych klas (modeli)
        public static List<T> GetCollectionProcedure<T>(string storedProcedure, object args)
        where T : class, new()
        {
            List<T> result = new List<T>();

            using (SqlConnection connection = new SqlConnection(DatabaseOperations._sConnectionString))
            {

                var queryResult = connection.Query<T>(storedProcedure, args, commandType: CommandType.StoredProcedure);

                if (queryResult.HasValue())
                {
                    result = queryResult.AsEnumerable().ToList<T>();
                }
            }
            return result;
        }

               // zwraca listę skalarów czyli wartości takich jak int, double, bool itp 
        public static List<T> GetScalarListProcedure<T>(string storedProcedure, object args)
        where T : struct
        {
            List<T> result = new List<T>();

            using (SqlConnection connection = new SqlConnection(DatabaseOperations._sConnectionString))
            {

                var queryResult = connection.Query<T>(storedProcedure, args, commandType: CommandType.StoredProcedure);

                if (queryResult.HasValue())
                {
                    result = queryResult.AsEnumerable().ToList<T>();
                }
            }
            return result;
        }

        // zwraca listę string, 
        public static List<string> GetListOfStringProcedure(string storedProcedure, object args)
        {
            List<string> result = new List<string>();

            using (SqlConnection connection = new SqlConnection(DatabaseOperations._sConnectionString))
            {

                var queryResult = connection.Query<string>(storedProcedure, args, commandType: CommandType.StoredProcedure);

                if (queryResult.HasValue())
                {
                    result = queryResult.AsEnumerable().ToList<string>();
                }
            }
            return result;
        }

        public static List<T> GetCollectionSQL<T>(string sqlQuery)
        where T : class, new()
        {
            List<T> result = new List<T>();

            using (SqlConnection connection = new SqlConnection(DatabaseOperations._sConnectionString))
            {
                var queryResult = connection.Query<T>(sqlQuery, commandType: CommandType.Text);

                if (queryResult.HasValue())
                {
                    result = queryResult.AsEnumerable().ToList<T>();
                }
            }
            return result;
        }

        // zwraca listę string, 
        public static List<string> GetListOfStringSQL(string sqlQuery)
        {
            List<string> result = new List<string>();

            using (SqlConnection connection = new SqlConnection(DatabaseOperations._sConnectionString))
            {

                var queryResult = connection.Query<string>(sqlQuery, commandType: CommandType.Text);

                if (queryResult.HasValue())
                {
                    result = queryResult.AsEnumerable().ToList<string>();
                }
            }
            return result;
        }

        // zwraca listę skalarów czyli wartości takich jak int, string itp 
        public static List<T> GetScalarListSQL<T>(string sqlQuery)
        where T : struct
        {
            List<T> result = new List<T>();

            using (SqlConnection connection = new SqlConnection(DatabaseOperations._sConnectionString))
            {

                var queryResult = connection.Query<T>(sqlQuery, commandType: CommandType.Text);

                if (queryResult.HasValue())
                {
                    result = queryResult.AsEnumerable().ToList<T>();
                }
            }
            return result;
        }*/
        /*// zwraca pojedynczy rekord 
        public static T GetSingleObjectProcedure<T>(string storedProcedure, object args)
        where T : class, new()
        {
            T result = default(T);

            using (SqlConnection connection = new SqlConnection(DatabaseOperations._sConnectionString))
            {

                var queryResult = connection.Query<T>(storedProcedure, args, commandType: CommandType.StoredProcedure);

                if (queryResult.HasValue())
                {
                    result = queryResult.AsEnumerable().FirstOrDefault();
                }
            }
            return result;
        }*/

        /*// zwraca skalar czyli pojedyncze wartości takie jak int, string itp 
        public static T GetSingleScalarProcedure<T>(string storedProcedure, object args)
        where T : struct
        {
            T result = default(T);

            using (SqlConnection connection = new SqlConnection(DatabaseOperations._sConnectionString))
            {

                var queryResult = connection.Query<T>(storedProcedure, args, commandType: CommandType.StoredProcedure);

                if (queryResult.HasValue())
                {
                    result = queryResult.FirstOrDefault<T>();
                }
            }
            return result;
        }*/

        /*public static List<T> GetDMLClassesCollection<T>(string query)
        where T : class, new()
        {

            List<T> result = new List<T>();

            using (SqlConnection connection = new SqlConnection(DatabaseOperations._sConnectionString))
            {

                var queryResult = connection.Query<T>(query, commandType: CommandType.Text);

                if (queryResult.HasValue())
                {
                    result = queryResult.AsEnumerable<T>().ToList<T>();
                }
            }
            return result;
        }*/

        /*public static DMLResult SimpleDML(string storedProcedure, object args)
        {
            DMLResult result = new DMLResult(0, 0, 0);

            using (SqlConnection connection = new SqlConnection(DatabaseOperations._sConnectionString))
            {

                var queryResult = connection.Query<DMLResult>(storedProcedure, args, commandType: CommandType.StoredProcedure);

                if (queryResult.HasValue())
                {
                    result = queryResult.FirstOrDefault();
                }
            }
            return result;
        }*/

        /*public static void GetCollectionSQL()
        {
            using (SqlConnection connection = new SqlConnection(DatabaseOperations._sConnectionString))
            {

                var queryResult = connection.Query("Select top 1 * from [dbo].[Sprzet]", commandType: CommandType.Text);

                if (queryResult.HasValue())
                {
                    
                }
            }
        }*/
    }
}
