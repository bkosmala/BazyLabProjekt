using BazyDanychProgram.Database;
using BazyDanychProgram.Database.Models;
using System;
using System.Collections.Generic;
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
        public MainWindow()
        {
            InitializeComponent();

            List<Sprzet> abracadabra = DatabaseOperations.GetCollectionSQL<Sprzet>("Select * from [dbo].[Sprzet]");
            List<string> abracadabra2 = DatabaseOperations.GetCollectionSQL<string>("Select nazwa from [dbo].[Sprzet]");
        }
    }
}
