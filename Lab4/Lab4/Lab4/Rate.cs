using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab4
{
    /*Clase que solicita la nota del usuario*/
    public partial class Rate : Form
    {
        //Constructor
        public Rate()
        {
            InitializeComponent();
            this.CenterToScreen();
        }

        //Funcion que solicita calificar al chatbot y despues de esta funcion se cierra el programa
        private void sendRate(object sender, EventArgs e)
        {
            try
            {
                int valor = 0;
                while (valor == 0)
                {
                    string notaS = Nota.Text;
                    int nota = Int32.Parse(notaS);
                    if(nota > 0 && nota < 6)
                    {
                        MessageBox.Show("Gracias por calificar, vuelva pronto :)");
                        valor = 1;
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show("Ingrese valor entre los intervalos mencionados");
                        break;
                    }
                }
            }
            catch
            {
                MessageBox.Show("Ingrese valor numerico, por favor");
            }
        }
    }
}
