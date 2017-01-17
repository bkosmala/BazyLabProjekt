using BazyDanychProgram.Database;
using BazyDanychProgram.Database.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace BazyDanychProgram
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private ObservableCollection<Kategorie> listaKategorii;
        private DataRepository repo;
        private ObservableCollection<Object> wynikProcedury;


        public MainWindow()
        {
            repo = new DataRepository();
            InitializeComponent();

            //List<Sprzet> abracadabra = DatabaseOperations.GetCollectionSQL<Sprzet>("Select * from [dbo].[Sprzet]");
            //List<string> abracadabra2 = DatabaseOperations.GetCollectionSQL<string>("Select nazwa from [dbo].[Sprzet]");

            comboBoxKategorieData();
            comboBoxKategorie.SelectedIndex = 1;
        }

        public void comboBoxKategorieData()
        {
            col1.Header = "Id sprzętu";
            col2.Header = "Nazwa sprzętu";
            col3.Header = "Id kategorii";
            col4.Header = "Nazwa kategorii";
            List<SprzetWKategorii> wynik = new List<SprzetWKategorii>();
            if (comboBoxKategorie.SelectedIndex>=0 && comboBoxKategorie.SelectedIndex<listaKategorii.Count)
            {
                wynik = repo.GetListaSprzetuWKategorii(listaKategorii.ElementAt<Kategorie>(comboBoxKategorie.SelectedIndex).id_kategorii);

            }
            wynikProcedury = new ObservableCollection<Object>();
            foreach (SprzetWKategorii k in wynik)
            {
                wynikProcedury.Add(new {column1 = k.id_sprzetu,
                                        column2 = k.nazwa,
                                        column3 = k.id_kat,
                                        column4 = k.nazwa_kat});
            }
            ProceduraWynikListView.ItemsSource = wynikProcedury;

            listaKategorii = new ObservableCollection<Kategorie>(repo.GetAllCategories());
            List<string> nazwy = new List<string>();
            foreach (var a in listaKategorii)
            {
                nazwy.Add(a.nazwa_kat);
            }
            comboBoxKategorie.ItemsSource = nazwy;

        }

        private void Tab_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            comboBoxKategorieData();
        }

        private void ComboBoxKategorieSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            comboBoxKategorieData();

        }


    }
}
