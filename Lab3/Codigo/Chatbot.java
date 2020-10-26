import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Clase en la cual contiene todo lo que puede hacer el chatbot, 
 * sus vocabolario, sus respuestas y todos los datos que esta necesite
 * 
 * 
 */
public class Chatbot {
    
    /**
     * Atributos
     * 
     */
    
    public int seed;
    public String seedString;
    private String mensaje;
    private String cuenta;
    private int HamClasica=500;
    private int HamVegetariana=700;
    private int HamGigante=900;
    private int PapasChicas=200;
    private int PapasMedianas=400;
    private int PapasGrandes=600;
    private int Pepsi=250;
    private int Fanta=250;
    private int Sprite=250;
    
    //VOCABULARIO 
    //Saludos
    private String saludoBienvenidaAmable[]={"Bueno dias bienvenido a Mr. Ham que desea ordenar?","Buenas tardes bienvenido a Mr. Ham que desea ordenar?","Buenas noches bienvenido a Mr. Ham que desea ordenar?"};
    private String saludoBienvenidaAnimado[]={"Hola muy buenos dias como estas!? bienvenido a Mr. Ham en que lo puedo ayudar mi estimado","Hola muy buenas tardes como esta? bienvenido a Mr. Ham en que lo puedo ayudar?","Hola muy buenas noches mi estimado bienvenido a Mr. Ham en que lo puedo ayudar?"};
    private String saludoBienvenidaAgresivo[]={"Tan temprano que es, que quieres","buenas tardes, que quiere?","Ya es de noche y pide algo, ya no importa que quiere"};
    //Despedida
    private String despedida[]={"Hasta luego gracias por su pedido","Suerte en todo y gracias por su pedido","Chao"};
    //Respuestas 
    private String respuesta1Palabra[]={"Que mas quiere pedir?","Mire el menu y me dice que mas quiere mi estimado?","Oh bueno ya, que otra cosa?"};
    private String respuesta1PalabraNeg[]={"Bueno anotado todo, el valor del pedido es: ","Bueno estimado,anotare todo lo que pidio, la cuenta seria: ","Ya porfin dejaste de pedir, costaria: "};
    private String respuestaHola[]={"Hola estimado. como te llamas?","Hola!, cual es su nombre estimado?","Hola, dame tu nombre"};
    private String respuesta2Palabras[]={"Que mas quiere?","que bueno!, que mas necesita?","oh no te llenas?, bueno que mas?"};
    private String respuesta2PalabrasNeg[]={"Bueno anotado todo, serian: ","oh bueno, espero que lo disfrute, serian: ","a menos mal, son: "};
    private String respuestaNeg[]={"Bueno anotado todo, serian: ","oh espero que lo disfrute mi estimado, todo vale: ","ya menos mal, son: "};
    private String respuestaHam[]={"hay hamburguesa clasica,vegetariana y gigante","tenemos 3 tipos estimados, clasica, vegetariana y gigante","lee el menu y sabras"};
    private String respuestaHam2[]={"Cual hamburguesa especificamente?","tenemos muchos tipos, cual desea?","Pero que tipo quieres? especifica"};
    private String respuesta[]={"bueno vale: ","Ya anote todo mi estimado, vale: ","Ya te anote todo, son: "};
    private String respuesta2[]={" pesos, algo mas?"," pesos, desea algo mas?"," pesos, listo o queri otra cosa?"};
    private String respuestaPapas[]={"Que tamaños las papas","Tenemos muchos tamaños, cual prefiere?","No entiendo, tienes que decirme el tamaño de las papas fritas"};
    private String respuestaBebida[]={"Tenemos Pepsi, Fanta y Sprite","Hay Pepsi, Fanta y Sprite mi estimado","Ve el menú par eso esta"};
    private String sinRespuesta[]={"no te entendi, podrias repetir la pregunta","lo siento amigo, no le entendi, podria decirme que queria decir?","no entiendo nada, repite"};
    
    
    public Chatbot(){
        //Constructor
    }
    
    public int calcularSeed(int seed){
        if((seed%3)==0){
            seed=2;
        }else if((seed%2)==0){
            seed=0;
        }else if((seed%2)==1){
                seed=1;
        }
        return seed;
    }
   
    
    /**
     * Metodo para obtener la fecha y la hora actual.
     * @return Un String con la fecha
     */
    public String obtenerTiempo(){
        String Fecha;
        Date sistFecha = new Date();
        SimpleDateFormat fecha = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Fecha=fecha.format(sistFecha);
        return Fecha;
    }
    
    /**
     * Metodo para obtener el nombre del archivo que segun la fecha y hora en la que se crea 
     * @return Un String con la fecha
     */
    public String guardaTiempo(){
        String Fecha;
        Date sistFecha = new Date();
        SimpleDateFormat fecha = new SimpleDateFormat("yyyy-MM-dd_HH-mm");
        Fecha=fecha.format(sistFecha);
        return Fecha;
    }
    
    
    /**
     * Metodo para determinar cual es el saludo de bienvenida del chatbot, segun la semilla seed inicial
     * @param seed (int)
     * @param hora (int)
     * @param fecha (String)
     * @return Un String con el mensaje de bienvenida del chatbot
     */
    public String obtenerSaludoBienvenida(int seed,int hora,String fecha){
        if(hora>=12 && hora<21){
            if((seed%3)==0){
                mensaje=fecha+" -Chatbot: "+saludoBienvenidaAgresivo[1];
            }else if((seed%2)==0){
                mensaje= fecha+" -Chatbot: "+saludoBienvenidaAmable[1];
            }else if((seed%2)==1){
                mensaje= fecha+" -Chatbot: "+saludoBienvenidaAnimado[1];
            }
        }else if(hora<12 && hora>6){
            if((seed%3)==0){
                mensaje=fecha+" -Chatbot: "+saludoBienvenidaAgresivo[0];
            }else if((seed%2)==0){
                mensaje=fecha+" -Chatbot: "+saludoBienvenidaAmable[0];
            }else if((seed%2)==1){
                mensaje=fecha+" -Chatbot: "+saludoBienvenidaAnimado[0];
            }
        }else if(hora>21 || hora>=0){
            if((seed%3)==0){
                mensaje=fecha+" -Chatbot: "+saludoBienvenidaAgresivo[2];
            }else if((seed%2)==0){
                mensaje=fecha+" -Chatbot: "+saludoBienvenidaAmable[2];
            }else if((seed%2)==1){
                mensaje=fecha+" -Chatbot: "+saludoBienvenidaAnimado[2];
            }
        }  
        return mensaje;
    }
    
    /**
     * Metodo para determinar cual es el mensaje de despedida del chatbot, segun la semilla inicial seed
     * @param seed (int)
     * @param fecha (String)
     * @return Un String con el mensaje de despedida del chatbot
     */
    public String obtenerDespedida(int seed,String fecha){
        if((seed%3) == 0){
            mensaje=fecha+" -Chatbot: "+despedida[2];
        }else if((seed%2)==0){
            mensaje=fecha+" -Chatbot: "+despedida[0];
        }else if((seed%2)==1){
            mensaje=fecha+" -Chatbot: "+despedida[1];
        }
        return mensaje;
    }
    
    /**
     * Metodo que determina cual será el mensaje determinado de respuesta del chatbot al mensaje enviado por el usuario 
     * se agregar mensaje al log, y se muestra por pantalla el mensaje
     * @param seed (int)
     * @param mensaje (String)
     * @param fecha (String)
     * @param log (ArrayList)
     * @param ValorFinal (int)
     * @param nombreUsuario (String)
     * @return numero (int) con el precio de la cuenta de lo que va pidiendo el cliente
     */
    public int respuestaChatbot(int seed,String mensaje,String fecha,List<String> log,int ValorFinal,String nombreUsuario){
        String[] mensajeSeparado;
        int sem=0;
        mensajeSeparado=mensaje.split(" ");
        if((seed%3)==0){
            sem=2;
        }else if((seed%2)==0){
            sem=0;
        }else if((seed%2)==1){
            sem=1;
        }
        if(mensajeSeparado.length==1){
            if(mensaje.equals("si") || mensaje.equals("ya") || mensaje.equals("bueno") || mensaje.equals("Ok")){
                mensaje=fecha+" -Chatbot: "+respuesta1Palabra[sem];    
            }else if(mensaje.equals("no") || mensaje.equals("nada") || mensaje.equals("negativo")){
                mensaje=fecha+" -Chatbot: "+respuesta1PalabraNeg[sem]+ValorFinal;
            }else if(mensaje.equals("hola") || mensaje.equals("Hola")){
                mensaje=fecha+" -Chatbot: "+respuestaHola[sem];
            }else{
                nombreUsuario=mensaje;
                if((seed%3)==0){
                    mensaje=fecha+" -Chabot: Ya "+nombreUsuario+" que quieres?";
                }else if((seed%2)==0){
                    mensaje=fecha+" -Chabot: Hola "+nombreUsuario+" que desea pedir?";
                }else if((seed%2)==1){
                    mensaje=fecha+" -Chabot: Hola! "+nombreUsuario+" que le gustaria mi estimado?";
                }
            }
        }else if(mensajeSeparado.length==2){
            if(mensajeSeparado[0].equals("si") && (mensajeSeparado[1].equals("estimado") || mensajeSeparado[1].equals("claro") || mensajeSeparado[1].equals("gracias"))){
                mensaje=fecha+" -Chatbot: "+respuesta2Palabras[sem]; 
            }else if(mensajeSeparado[0].equals("no") && (mensajeSeparado[1].equals("gracias") || mensajeSeparado[1].equals("quiero") || mensajeSeparado[1].equals("nada"))){
                mensaje=fecha+" -Chabot: "+respuesta2PalabrasNeg[sem]+ValorFinal;
            }
        }else{
            if(comprobarPalabra(mensajeSeparado,"no")==true && comprobarPalabra(mensajeSeparado,"nada") && comprobarPalabra(mensajeSeparado,"mas")){
                mensaje=fecha+" -Chatbot: "+respuestaNeg[sem]+ValorFinal;   
            }else if((comprobarPalabra(mensajeSeparado,"que")|| comprobarPalabra(mensajeSeparado,"cual"))&& (comprobarPalabra(mensajeSeparado,"hamburguesas")||comprobarPalabra(mensajeSeparado,"hamburguesa"))&& comprobarPalabra(mensajeSeparado,"tiene")){
                mensaje=fecha+" -Chatbot: "+respuestaHam[sem];
            }else if(comprobarPalabra(mensajeSeparado,"me") && comprobarPalabra(mensajeSeparado,"gustaria") && comprobarPalabra(mensajeSeparado,"hamburguesa")){
                mensaje=fecha+" -Chatbot: "+respuestaHam2[sem];
            }else if(comprobarPalabra(mensajeSeparado,"quiero")&& comprobarPalabra(mensajeSeparado,"clasica")){
                ValorFinal=ValorFinal+HamClasica;
                mensaje=fecha+" -Chatbot: "+respuesta[sem]+HamClasica+respuesta2[sem];
            }else if(comprobarPalabra(mensajeSeparado,"quiero")&& comprobarPalabra(mensajeSeparado,"vegetariana")){
                ValorFinal=ValorFinal+HamVegetariana;
                mensaje=fecha+" -Chatbot: "+respuesta[sem]+HamVegetariana+respuesta2[sem];
            }else if(comprobarPalabra(mensajeSeparado,"quiero")&& comprobarPalabra(mensajeSeparado,"gigante")){
                ValorFinal=ValorFinal+HamGigante;
                mensaje=fecha+" -Chatbot: "+respuesta[sem]+HamGigante+respuesta2[sem];  
            }else if((comprobarPalabra(mensajeSeparado,"gustaria") || comprobarPalabra(mensajeSeparado,"quisiera"))&& comprobarPalabra(mensajeSeparado,"papas")){
                mensaje=fecha+" -Chatbot: "+respuestaPapas[sem];
            }else  if(comprobarPalabra(mensajeSeparado,"quiero") && comprobarPalabra(mensajeSeparado,"papas")&& comprobarPalabra(mensajeSeparado,"chicas")){
                ValorFinal=ValorFinal+PapasChicas;
                mensaje=fecha+" -Chatbot: "+respuesta[sem]+PapasChicas+respuesta2[sem];
            }else if(comprobarPalabra(mensajeSeparado,"quiero") && comprobarPalabra(mensajeSeparado,"papas")&& comprobarPalabra(mensajeSeparado,"medianas")){
                ValorFinal=ValorFinal+PapasMedianas;
                mensaje=fecha+" -Chatbot: "+respuesta[sem]+PapasMedianas+respuesta2[sem];
            }else if(comprobarPalabra(mensajeSeparado,"quiero") && comprobarPalabra(mensajeSeparado,"papas")&& comprobarPalabra(mensajeSeparado,"grandes")){
                ValorFinal=ValorFinal+PapasGrandes;
                mensaje=fecha+" -Chatbot: "+respuesta[sem]+PapasGrandes+respuesta2[sem];
            }else if(comprobarPalabra(mensajeSeparado,"bebidas")&& comprobarPalabra(mensajeSeparado,"tiene")){
                mensaje=fecha+" -Chatbot: "+respuestaBebida[sem];
            }else if(comprobarPalabra(mensajeSeparado,"quiero")&& (comprobarPalabra(mensajeSeparado,"pepsi")||comprobarPalabra(mensajeSeparado,"Pepsi"))){
                ValorFinal=ValorFinal+Pepsi;
                mensaje=fecha+" -Chatbot: "+respuesta[sem]+Pepsi+respuesta2[sem];                  
            }else if(comprobarPalabra(mensajeSeparado,"quiero")&& (comprobarPalabra(mensajeSeparado,"fanta")||comprobarPalabra(mensajeSeparado,"Fanta"))){
                ValorFinal=ValorFinal+Fanta;
                mensaje=fecha+" -Chatbot: "+respuesta[sem]+Fanta+respuesta2[sem];
            }else if(comprobarPalabra(mensajeSeparado,"quiero")&& (comprobarPalabra(mensajeSeparado,"sprite")||comprobarPalabra(mensajeSeparado,"Sprite"))){
                ValorFinal=ValorFinal+Sprite;
                mensaje=fecha+" -Chatbot: "+respuesta[sem]+Sprite+respuesta2[sem];
            }else{
                mensaje=fecha+" -Chatbot: "+sinRespuesta[sem];
            }
        }
        log.add(mensaje);
        System.out.println(mensaje); 
        return ValorFinal;
    }
    
    /**
     * Metodo que comprueba si una palabra(String) se encuentra dentro de un arreglo que es equivalente al mensaje del usuario
     * @param Palabra1
     * @param Palabra2
     * @return booleano que determina si se cumple o no la comprobacion
     */
    private boolean comprobarPalabra(String[] Palabra1,String Palabra2){
        boolean val=false;
        for(int i=0;i<Palabra1.length;i++){
            if(Palabra1[i].equals(Palabra2)){
                val=true;
                break;
            }
        }
        return val;
    }  
}