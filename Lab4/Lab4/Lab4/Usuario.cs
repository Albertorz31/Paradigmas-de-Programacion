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
    /* Clase: Usuario, determinar el seed especifico de cada usuario*/
    public partial class Usuario : Form
    {
        //Constructor
        public Usuario()
        {
            InitializeComponent();
            this.CenterToScreen();
        }
        //Metodos

        /* Clase que obtiene el seed ingresado por el usuario, el cual es el parametro del constructor 
           de la clase ChatbotOficial*/ 
        private void botonComenzar_Click(object sender, EventArgs e)
        {
            try
            {
                string semilla = Seed.Text;
                int seed = Int32.Parse(semilla);
                this.Hide();
                ChatbotOficial cbot = new ChatbotOficial(seed);
                cbot.ShowDialog();
                this.Close();
            }
            catch
            {
                MessageBox.Show("Ingrese el tipo de dato correcto, o sea un entero");
            }
            
        }
    }
}
