import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

/**
 * Clase el la cual se desarrolla la conversacion con el chatbot 
 * en esta se crean objetos de las demas clases los cuales se trabajan en conjunto
 * 
 */
public class Conversacion {
    
    public static void main(String [] args) throws FileNotFoundException, IOException{
        int num=0,count=0,resp,Hora,valorInicial=0,valorAgregar=0,notaChatbot = 0,notaUsuario=0,error=0,cantEva=0;
        String mensaje,Fecha,Saludo,Despedida,save,archivo,usr,respuestaCbot,rate;
        String[] mensajeSeparado;
        List<String> Log;
        Log = new ArrayList<>();
        List<String> Usuario;
        Usuario = new ArrayList<>();
        List<String> perso;
        perso = new ArrayList<>();
        //Se crean los objetos
        Chatbot cbot = new Chatbot();      //creo Objeto de la clase Chatbot
        Log logNuevo = new Log();          //creo Objeto de la clase Log
        Date sistFecha = new Date();       //creo Objeto de la clase importada de Java Date
        Usuario DatosUsr = new Usuario();  //creo Objeto de la clase Usuario
        DatosUsr.valorFinal=0;
        SimpleDateFormat hora = new SimpleDateFormat("HH"); //hora actual
        Hora=Integer.parseInt(hora.format(sistFecha));
        System.out.println(cbot.obtenerTiempo()+" -Chatbot: Hola!, bienvenido a una  Mr. Ham virtual, un chatbot creado con el objetivo de venderle todas las comidad incluidad en el menú del restaurante. Chatbot ya disponible para hablar");
        while(num==0){
            Scanner msn = new Scanner(System.in);
            mensaje = msn.nextLine();
            mensajeSeparado = mensaje.split(" ");
            if(mensajeSeparado[0].equals("!beginDialog")==true && count==0){ 
                for(int i = 0;i<mensajeSeparado.length;i++){
                    if(i==1){
                        cbot.seedString = mensajeSeparado[i];
                        cbot.seed = Integer.parseInt(mensajeSeparado[i]);
                    }
                }
                if(cbot.seed==0){
                    Random seedAleatorio = new Random();
                    cbot.seed= 1 + seedAleatorio.nextInt(3);
                }
                Saludo=cbot.obtenerSaludoBienvenida(cbot.seed, Hora, cbot.obtenerTiempo());
                System.out.println(Saludo);
                Log.add(Saludo);
                count++;
            }
            else if(mensaje.equals("!endDialog")==true){
                if(count==0){
                    System.out.println("Debes iniciar una conversacion primero");
                }else{
                    Despedida=cbot.obtenerDespedida(cbot.seed, cbot.obtenerTiempo());
                    System.out.println(Despedida);
                    Log.add(Despedida);
                    count=0;
                }
            }
            else if(mensaje.equals("!saveLog")==true){
                if(count==0){
                    System.out.println("Debes iniciar una conversacion primero");
                }else{
                    save=cbot.guardaTiempo()+".log";
                    logNuevo.guardarLog(Log,save);
                }   
            }else if(mensajeSeparado[0].equals("!loadLog")==true){
                archivo=mensajeSeparado[1];
                logNuevo.leerArchivo(Log, archivo);
                count++;
            }else if(mensaje.equals("Terminar")==true || mensaje.equals("terminar")==true){
                num=1;
            }else if(mensajeSeparado[0].equals("!rate")==true){
                if(count!=0){
                    System.out.println("Debes terminar la conversacion primero");
                }else{
                    for(int i = 0;i<mensajeSeparado.length;i++){
                        if(i==1){
                            notaChatbot= Integer.parseInt(mensajeSeparado[i]);
                        }if(i==2){
                            notaUsuario= Integer.parseInt(mensajeSeparado[i]);
                        }
                    }
                    if(notaChatbot <0 || notaChatbot >5){
                        System.out.println("Ingresar el valor de la nota del chatbot entre 1 y 5");
                        error++;
                    }if(notaUsuario<0 || notaUsuario>5){
                        System.out.println("Ingresar el valor de la nota del usuario entre 1 y 5");
                        error++;
                    }
                    if(error==0){
                        rate="La nota del chatbot es: "+notaChatbot+" La nota del usuario es: "+notaUsuario;
                        Log.add(rate);
                        Usuario.add(mensajeSeparado[1]);
                        Usuario.add(mensajeSeparado[2]);  
                        perso.add(cbot.seedString);
                        cantEva++;
                        System.out.println("Se han guardado las notas");
                    }
                    error=0;
                }
            }else if(mensajeSeparado[0].equals("!chatbotPerformance")==true){
                DatosUsr.calcularEvaluaciones(Usuario, perso,cantEva);
            }
            else if(count!=0){
                usr=cbot.obtenerTiempo()+" -Uruario: "+mensaje;
                Log.add(usr);
                DatosUsr.valorFinal=cbot.respuestaChatbot(cbot.seed,mensaje,cbot.obtenerTiempo(),Log,DatosUsr.valorFinal,DatosUsr.nombreUsuario);
            }else{
                System.out.println("Debes iniciar una conversacion primero");
            } 
        }                
    }
}
