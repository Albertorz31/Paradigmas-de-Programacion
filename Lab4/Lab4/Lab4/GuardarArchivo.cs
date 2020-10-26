using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace Lab4
{
    /* Clase la cual crea un archivo y dentro de el escribe el log de la conversacion actual*/
    public partial class GuardarArchivo : Form
    {
        public ArrayList Log = new ArrayList();

        //Constructor
        public GuardarArchivo(ArrayList Log)
        {
            //Se obtiene el log actual
            this.Log = Log;
            InitializeComponent();
            this.CenterToScreen();
        }

        //METODOS

        //Funcion que crea el archivo y escribe el log adentro 
        private void saveArchive(object sender, EventArgs e)
        {
            try
            {
                int inicio = 0;
                //Obtiene el nombre del archivo de la caja de texto 
                string nombreArchivo = NombreText.Text;
                //Obtiene la ubicacion del archivo de la caja de texto
                string ubicacion = UbicacionText.Text;
                using (StreamWriter archivo = new StreamWriter(ubicacion + "\\" + nombreArchivo + ".txt"))
                {
                    foreach (var item in Log)
                    {
                        if (inicio == 0)
                        {
                            archivo.WriteLine("Log:");
                            inicio = 1;
                        }
                        else
                        {
                            archivo.WriteLine(item);
                        }                   
                    }
                }
                MessageBox.Show("Se ha creado el archivo");
                this.Close();
            }
            catch
            {
                MessageBox.Show("Ingrese correctamente los datos");
            }
            
        }
    }
}
