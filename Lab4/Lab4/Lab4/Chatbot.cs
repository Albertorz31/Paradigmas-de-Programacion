using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab4
{
    class Chatbot
    {
        //ATRIBUTOS

        public int seed;
        private string nombreUsuario;
        private int HamClasica = 500;
        private int HamVegetariana = 700;
        private int HamGigante = 900;
        private int PapasChicas = 200;
        private int PapasMedianas = 400;
        private int PapasGrandes = 600;
        private int Pepsi = 250;
        private int Fanta = 250;
        private int Sprite = 250;

        // VOCABULARIO
        //Saludos 
        private string[] saludoBienvenidaAmable = { "Bueno dias bienvenido a Mr. Ham que desea ordenar?", "Buenas tardes bienvenido a Mr. Ham que desea ordenar?", "Buenas noches bienvenido a Mr. Ham que desea ordenar?"};
        private string[] saludoBienvenidaAnimado = {"Hola muy buenos dias como estas!? bienvenido a Mr. Ham en que lo puedo ayudar mi estimado", "Hola muy buenas tardes como esta? bienvenido a Mr. Ham en que lo puedo ayudar?", "Hola muy buenas noches mi estimado bienvenido a Mr. Ham en que lo puedo ayudar?"};
        private string[] saludoBienvenidaAgresivo = { "Tan temprano que es, que quieres", "buenas tardes, que quiere?", "Ya es de noche y pide algo, ya no importa que quiere"};
        //Despedida
        private string[] despedida= { "Hasta luego gracias por su pedido", "Suerte en todo y gracias por su pedido", "Chao" };
        //Respuestas
        private string[] respuesta1Palabra = { "Que mas quiere pedir?", "Mire el menu y me dice que mas quiere mi estimado?", "Oh bueno ya, que otra cosa?" };
        private string[] respuesta1PalabraNeg = { "Bueno anotado todo, el valor del pedido es: ", "Bueno estimado,anotare todo lo que pidio, la cuenta seria: ", "Ya porfin dejaste de pedir, costaria: " };
        private string[] respuestaHola = { "Hola estimado. como te llamas?", "Hola!, cual es su nombre estimado?", "Hola, dame tu nombre" };
        private string[] respuesta2Palabras = { "Que mas quiere?", "que bueno!, que mas necesita?", "oh no te llenas?, bueno que mas?" };
        private string[] respuesta2PalabrasNeg = { "Bueno anotado todo, serian: ", "oh bueno, espero que lo disfrute, serian: ", "a menos mal, son: " };
        private string[] respuestaNeg = { "Bueno anotado todo, serian: ", "oh espero que lo disfrute mi estimado, todo vale: ", "ya menos mal, son: " };
        private string[] respuestaHam = { "hay hamburguesa clasica,vegetariana y gigante", "tenemos 3 tipos estimados, clasica, vegetariana y gigante", "lee el menu y sabras" };
        private string[] respuestaHam2 = { "Cual hamburguesa especificamente?", "tenemos muchos tipos, cual desea?", "Pero que tipo quieres? especifica" };
        private string[] respuesta = { "bueno vale: ", "Ya anote todo mi estimado, vale: ", "Ya te anote todo, son: " };
        private string[] respuesta2 = { " pesos, algo mas?", " pesos, desea algo mas?", " pesos, listo o queri otra cosa?" };
        private string[] respuestaPapas = { "Que tamaños las papas", "Tenemos muchos tamaños, cual prefiere?", "No entiendo, tienes que decirme el tamaño de las papas fritas" };
        private string[] respuestaBebida = { "Tenemos Pepsi, Fanta y Sprite", "Hay Pepsi, Fanta y Sprite mi estimado", "Ve el menú para eso esta" };
        private string[] sinRespuesta = { "no te entendi, podrias repetir la pregunta", "lo siento amigo, no le entendi, podria decirme que queria decir?", "no entiendo nada, repite" };


        //METODOS


        //Constructor 
        public Chatbot(int seed)
        {
            this.seed = seed;
        }

        /*Funcion que calcula la personalidad del chatbot segun la semilla,
          puede tener 3 personalidades: amable (1), animdado(2) y agresivo(3).
          parametros de entradas: seed (entero)*/
        public int calcularSeed(int seed)
        {
            if ((seed % 3) == 0)
            {
                seed = 2;
            }
            else if ((seed % 2) == 0)
            {
                seed = 0;
            }
            else if ((seed % 2) == 1)
            {
                seed = 1;
            }
            return seed;
        }

        /* Funcion que obtiene la fecha y hora actual y la retorna en forma de string */
        public string obtenerTiempo()
        {
            string tiempo = DateTime.Now.ToString();
            string gg = DateTime.Now.Hour.ToString();
            return tiempo;
        }

        /* Funcion que obtiene el saludo de bienvenida del chatbot, para eso verifica cual es
           el mensaje correcto
           Parametros: seed(entero),hora(entero),fecha(string)
           Salida: string con el mensaje*/
        public string obtenerSaludoBienvenida(int seed,int hora,string fecha)
        {
            string mensaje="";
            if (hora >= 12 && hora < 21)
            {
                if ((seed % 3) == 0)
                {
                    mensaje = fecha + " -Chatbot: " + saludoBienvenidaAgresivo[1];
                }
                else if ((seed % 2) == 0)
                {
                    mensaje = fecha + " -Chatbot: " + saludoBienvenidaAmable[1];
                }
                else if ((seed % 2) == 1)
                {
                    mensaje = fecha + " -Chatbot: " + saludoBienvenidaAnimado[1];
                }
            }
            else if (hora < 12 && hora > 6)
            {
                if ((seed % 3) == 0)
                {
                    mensaje = fecha + " -Chatbot: " + saludoBienvenidaAgresivo[0];
                }
                else if ((seed % 2) == 0)
                {
                    mensaje = fecha + " -Chatbot: " + saludoBienvenidaAmable[0];
                }
                else if ((seed % 2) == 1)
                {
                    mensaje = fecha + " -Chatbot: " + saludoBienvenidaAnimado[0];
                }
            }
            else if (hora > 21 || hora >= 0)
            {
                if ((seed % 3) == 0)
                {
                    mensaje = fecha + " -Chatbot: " + saludoBienvenidaAgresivo[2];
                }
                else if ((seed % 2) == 0)
                {
                    mensaje = fecha + " -Chatbot: " + saludoBienvenidaAmable[2];
                }
                else if ((seed % 2) == 1)
                {
                    mensaje = fecha + " -Chatbot: " + saludoBienvenidaAnimado[2];
                }
            }
            return mensaje;
        }

        /*Funcion que obtiene el mensaje de despedida del chatbot, para eso verifica cual es
          el indicado para este
          Parametros. seed(entero),fecha(string)
          Salida: string con el mensaje*/
        public string obtenerDespedida(int seed,string fecha)
        {
            string mensaje="";
            if ((seed % 3) == 0)
            {
                mensaje = fecha + " -Chatbot: " + despedida[2];
            }
            else if ((seed % 2) == 0)
            {
                mensaje = fecha + " -Chatbot: " + despedida[0];
            }
            else if ((seed % 2) == 1)
            {
                mensaje = fecha + " -Chatbot: " + despedida[1];
            }
            return mensaje;
        }

        /*Funcion que verifica cual es la respuesta indicada del chatbot a un mensaje del usuario
          Parametros: seed(entero),mensaje(string),fecha(string),ValorFinal(entero)
          Salida: un ArrayList con el mensaje del chatbot y con el valor que lleva la cuenta*/
        public ArrayList darRespuestaChatbot(int seed,string mensaje,string fecha,int ValorFinal)
        {
            ArrayList datosUsr = new ArrayList();
            string[] mensajeSeparado;
            int sem = 0;
            mensajeSeparado = mensaje.Split();
            if((seed % 3) == 0){
                sem = 2;
            }
            else if ((seed % 2) == 0)
            {
                sem = 0;
            }
            else if ((seed % 2) == 1)
            {
                sem = 1;
            }
            if (mensajeSeparado.Length == 1)
            {
                if (mensaje.Equals("si") || mensaje.Equals("ya") || mensaje.Equals("bueno") || mensaje.Equals("Ok"))
                {
                    mensaje = fecha + " -Chatbot: " + respuesta1Palabra[sem];
                }
                else if (mensaje.Equals("no") || mensaje.Equals("nada") || mensaje.Equals("negativo"))
                {
                    mensaje = fecha + " -Chatbot: " + respuesta1PalabraNeg[sem] + ValorFinal;
                }
                else if (mensaje.Equals("hola") || mensaje.Equals("Hola"))
                {
                    mensaje = fecha + " -Chatbot: " + respuestaHola[sem];
                }
                else
                {
                    nombreUsuario = mensaje;
                    if ((seed % 3) == 0)
                    {
                        mensaje = fecha + " -Chabot: Ya " + nombreUsuario + " que quieres?";
                    }
                    else if ((seed % 2) == 0)
                    {
                        mensaje = fecha + " -Chabot: Hola " + nombreUsuario + " que desea pedir?";
                    }
                    else if ((seed % 2) == 1)
                    {
                        mensaje = fecha + " -Chabot: Hola! " + nombreUsuario + " que le gustaria mi estimado?";
                    }
                }
            }
            else if (mensajeSeparado.Length == 2)
            {
                if (mensajeSeparado[0].Equals("si") && (mensajeSeparado[1].Equals("estimado") || mensajeSeparado[1].Equals("claro") || mensajeSeparado[1].Equals("gracias")))
                {
                    mensaje = fecha + " -Chatbot: " + respuesta2Palabras[sem];
                }
                else if (mensajeSeparado[0].Equals("no") && (mensajeSeparado[1].Equals("gracias") || mensajeSeparado[1].Equals("quiero") || mensajeSeparado[1].Equals("nada")))
                {
                    mensaje = fecha + " -Chabot: " + respuesta2PalabrasNeg[sem] + ValorFinal;
                }
            }
            else
            {
                if (comprobarPalabra(mensajeSeparado, "no") == true && comprobarPalabra(mensajeSeparado, "nada") && comprobarPalabra(mensajeSeparado, "mas"))
                {
                    mensaje = fecha + " -Chatbot: " + respuestaNeg[sem] + ValorFinal;
                }
                else if ((comprobarPalabra(mensajeSeparado, "que") || comprobarPalabra(mensajeSeparado, "cual")) && (comprobarPalabra(mensajeSeparado, "hamburguesas") || comprobarPalabra(mensajeSeparado, "hamburguesa")) && comprobarPalabra(mensajeSeparado, "tiene"))
                {
                    mensaje = fecha + " -Chatbot: " + respuestaHam[sem];
                }
                else if (comprobarPalabra(mensajeSeparado, "me") && comprobarPalabra(mensajeSeparado, "gustaria") && comprobarPalabra(mensajeSeparado, "hamburguesa"))
                {
                    mensaje = fecha + " -Chatbot: " + respuestaHam2[sem];
                }
                else if (comprobarPalabra(mensajeSeparado, "quiero") && comprobarPalabra(mensajeSeparado, "clasica"))
                {
                    ValorFinal = ValorFinal + HamClasica;
                    mensaje = fecha + " -Chatbot: " + respuesta[sem] + HamClasica + respuesta2[sem];
                }
                else if (comprobarPalabra(mensajeSeparado, "quiero") && comprobarPalabra(mensajeSeparado, "vegetariana"))
                {
                    ValorFinal = ValorFinal + HamVegetariana;
                    mensaje = fecha + " -Chatbot: " + respuesta[sem] + HamVegetariana + respuesta2[sem];
                }
                else if (comprobarPalabra(mensajeSeparado, "quiero") && comprobarPalabra(mensajeSeparado, "gigante"))
                {
                    ValorFinal = ValorFinal + HamGigante;
                    mensaje = fecha + " -Chatbot: " + respuesta[sem] + HamGigante + respuesta2[sem];
                }
                else if ((comprobarPalabra(mensajeSeparado, "gustaria") || comprobarPalabra(mensajeSeparado, "quisiera")) && comprobarPalabra(mensajeSeparado, "papas"))
                {
                    mensaje = fecha + " -Chatbot: " + respuestaPapas[sem];
                }
                else if (comprobarPalabra(mensajeSeparado, "quiero") && comprobarPalabra(mensajeSeparado, "papas") && comprobarPalabra(mensajeSeparado, "chicas"))
                {
                    ValorFinal = ValorFinal + PapasChicas;
                    mensaje = fecha + " -Chatbot: " + respuesta[sem] + PapasChicas + respuesta2[sem];
                }
                else if (comprobarPalabra(mensajeSeparado, "quiero") && comprobarPalabra(mensajeSeparado, "papas") && comprobarPalabra(mensajeSeparado, "medianas"))
                {
                    ValorFinal = ValorFinal + PapasMedianas;
                    mensaje = fecha + " -Chatbot: " + respuesta[sem] + PapasMedianas + respuesta2[sem];
                }
                else if (comprobarPalabra(mensajeSeparado, "quiero") && comprobarPalabra(mensajeSeparado, "papas") && comprobarPalabra(mensajeSeparado, "grandes"))
                {
                    ValorFinal = ValorFinal + PapasGrandes;
                    mensaje = fecha + " -Chatbot: " + respuesta[sem] + PapasGrandes + respuesta2[sem];
                }
                else if (comprobarPalabra(mensajeSeparado, "bebidas") && comprobarPalabra(mensajeSeparado, "tiene"))
                {
                    mensaje = fecha + " -Chatbot: " + respuestaBebida[sem];
                }
                else if (comprobarPalabra(mensajeSeparado, "quiero") && (comprobarPalabra(mensajeSeparado, "pepsi") || comprobarPalabra(mensajeSeparado, "Pepsi")))
                {
                    ValorFinal = ValorFinal + Pepsi;
                    mensaje = fecha + " -Chatbot: " + respuesta[sem] + Pepsi + respuesta2[sem];
                }
                else if (comprobarPalabra(mensajeSeparado, "quiero") && (comprobarPalabra(mensajeSeparado, "fanta") || comprobarPalabra(mensajeSeparado, "Fanta")))
                {
                    ValorFinal = ValorFinal + Fanta;
                    mensaje = fecha + " -Chatbot: " + respuesta[sem] + Fanta + respuesta2[sem];
                }
                else if (comprobarPalabra(mensajeSeparado, "quiero") && (comprobarPalabra(mensajeSeparado, "sprite") || comprobarPalabra(mensajeSeparado, "Sprite")))
                {
                    ValorFinal = ValorFinal + Sprite;
                    mensaje = fecha + " -Chatbot: " + respuesta[sem] + Sprite + respuesta2[sem];
                }
                else
                {
                    mensaje = fecha + " -Chatbot: " + sinRespuesta[sem];
                }
            }
            string valorFinalS = ValorFinal.ToString();
            datosUsr.Add(mensaje);
            datosUsr.Add(valorFinalS);
            return datosUsr;
        }

        /*Funcion que verifica si dentro de un de uns lista de string se encuentra un string especifico
          Parametros: Palabra1 (arreglo de string), Palabra2(string)
          Salidas: Retorna un booleano si el string se encuentra dentro de la lista de string*/
        private bool comprobarPalabra(string [] Palabra1,string Palabra2)
        {
            bool val = false;
            for(int i=0;i< Palabra1.Length; i++)
            {
                if (Palabra1[i].Equals(Palabra2))
                {
                    val = true;
                    break;
                }
            }
            return val;

        }
    }
}
