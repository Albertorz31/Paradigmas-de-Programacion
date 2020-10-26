using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab4
{ 
    /* Clase mas importante del programa donde ocurre toda la conversacion entre el usuario
       y el chatbot, cuenta con todas los eventos que pueden llamar el usuario*/
    public partial class ChatbotOficial : Form
    {
        //Atributos
        public int seed;
        public int iniciar = 0;
        public int ValorFinal;
        //La estructura Log es un arrayList, donde se almacena toda la conversacion 
        public ArrayList Log = new ArrayList(); 
        //arraylist donde se almacena informacion especifica del usuario, como su valor de compra
        public ArrayList datosUsr = new ArrayList();

        //METODOS

        //Constructor
        public ChatbotOficial(int seed)
        {
            //se relaciona el seed ingreado por el usuario en la clase anterior 
            this.seed = seed;
            InitializeComponent();
            this.CenterToScreen();
            Pantalla.AppendText("-Chatbot: Hola!, bienvenido a una  Mr. Ham virtual, un chatbot creado con el objetivo de venderle todas las comidad incluidad en el menú del restaurante. Chatbot ya disponible para hablar\n");
        }

        /* Funcion donde se da inicio a la conversacion,envia el mensaje de bienvenida del chatbot
           es ilustrado en la pantalla de la ventana principal*/
        private void BeginDialog(object sender, EventArgs e)
        {
            if (iniciar == 0)
            {
                //Se relaciona con la clase chatbot, para poder obtener que debe responder el chatbot
                Chatbot cbot = new Chatbot(seed);
                string hour = DateTime.Now.ToString("dd");
                int hora = Int32.Parse(hour);
                string fecha = cbot.obtenerTiempo();
                string saludo = cbot.obtenerSaludoBienvenida(seed,hora,fecha);
                Pantalla.AppendText(saludo+"\n");
                Log.Add(saludo+"\n");
                iniciar = 1;
            }
            else
            {
                Pantalla.AppendText("Ya has iniciado conversación\n");
            }
        }
        /* Funcion donde se relaciona con la clase GuardarArchivo, la cual realiza el proceso de crear
           archivo*/
        private void saveLog(object sender, EventArgs e)
        {
            if (iniciar == 1)
            {
                //Se ingresa como parametro el log de la conversacion 
                GuardarArchivo saveA = new GuardarArchivo(Log);
                saveA.ShowDialog();
            }
            else
            {
                Pantalla.AppendText("Debes comenzar la conversación primero\n");
            }
        }
        /* Funcion donde se cargará un archivo de texto, la funcion abre el directorio para que el usuario 
           busque el archivo log, para despues imprimirlo por pantalla*/
        private void loadLog(object sender, EventArgs e)
        {
            string nombre="";
            int inicio = 0;
            OpenFileDialog openFileDialog1 = new OpenFileDialog();

            openFileDialog1.InitialDirectory = "c:\\";
            openFileDialog1.Filter = "txt files (*.txt)|*.txt|All files (*.*)|*.*";
            openFileDialog1.FilterIndex = 2;
            openFileDialog1.RestoreDirectory = true;

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                nombre = openFileDialog1.FileName;
            }
            using (StreamReader LeerArchivo = new StreamReader(nombre))
            {
                while (!LeerArchivo.EndOfStream)
                {
                    if (inicio == 0)
                    {
                        string x = LeerArchivo.ReadLine();
                        if (!x.Equals("Log:"))
                        {
                            Pantalla.AppendText("Este archivo no es un log");
                            break;
                        }
                        else
                        {
                            inicio = 1;
                        }
                    }
                    else
                    {
                        string x = LeerArchivo.ReadLine();
                        Pantalla.AppendText(x+"\n");
                        Log.Add(x+"\n");
                    }
                }
                iniciar = 1;
            }
        }

        /* Funcion que termina la conversacion con el chatbot enviando el mensaje de despedida por la pantalla
           de la ventana*/
        private void endDialog(object sender, EventArgs e)
        {
            if (iniciar == 1)
            {
                //Se relaciona con la clase Chatbot para obtener el mensaje de despedida indicado
                Chatbot cbot = new Chatbot(seed);
                Rate rate = new Rate();
                string fecha = cbot.obtenerTiempo();
                string despedida = cbot.obtenerDespedida(seed, fecha);
                Pantalla.AppendText(despedida);
                Log.Add(despedida + "\n");
                System.Threading.Thread.Sleep(4000);
                this.Close();
                rate.ShowDialog();

            }
            else
            {
                Pantalla.AppendText("Debes comenzar la conversación primero\n");
            }
            
        }

        /*Funcion que envia un mensaje del usuario al chatbot y este le devuelve una respuesta.
          El mensaje de ambos es mostrado por pantalla*/
        private void sendMessage(object sender, EventArgs e)
        {
            if(iniciar == 1)
            {
                //El mensaje inicial lo obtiene de la caja de texto RespuestaUsr
                //se relaciona con la clase chatbot para saber el chatbot que debe responder
                int i = 0;
                string respuesta,respuesta2="";
                Chatbot cbot = new Chatbot(seed);
                string fecha = cbot.obtenerTiempo();
                respuesta = RespuestaUsr.Text;
                string mensaje = fecha + " -Usuario: " + respuesta;
                Pantalla.AppendText(mensaje + "\n");
                Log.Add(mensaje + "\n");
                datosUsr = cbot.darRespuestaChatbot(seed,respuesta,fecha,ValorFinal);
                foreach (string item in datosUsr)
                {
                    if (i == 0)
                    {
                        respuesta2 = item;
                        i = 1;
                    }
                    else
                    {
                        string val = item;
                        ValorFinal = Int32.Parse(val);
                    }
                }
                Pantalla.AppendText(respuesta2 + "\n");
                Log.Add(respuesta2 + "\n");
                RespuestaUsr.Text = "";
            }
            else
            {
                Pantalla.AppendText("Debes comenzar la conversación primero\n");
            }     
        }
    }
}
