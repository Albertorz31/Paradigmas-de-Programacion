import java.util.List;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * Clase Log en la cual se almacena la convercaion entre el usuario y el chatbot
 * Existen metodos en los cuales se modifica este log
 */
public class Log {
    public Log(){
        //Constructor
    }
    
    /**
     * Metodo que crea un archivo con la conversacion actual, 
     * el nombre de este es la fecha en la que se llama a este metodo
     * @param log
     * @param fecha 
     */
    public void guardarLog(List<String> log,String fecha){
        File Archivo;              //Para manipular al archivo
        PrintWriter escribir;      //Para escribir en el archivo
        Archivo = new File(fecha); //Preparar el archivo, le damos el nombre de la fecha
        if(!Archivo.exists()){
            System.out.println("Archivo creado");
            try {
                Archivo.createNewFile();
                escribir = new PrintWriter(Archivo,"utf-8");
                for(int i=0;i<log.size();i++){
                    escribir.println(log.get(i));
                }
                escribir.close();
            } catch (IOException e) {
            }  
        }
    } 
    
    /**
     * Metodo que lee archivo que contiene una conversacion y la imprimer por pantalla.
     * El nombre del archivo debe ingresarlo el usuario por teclado
     * @param log (ArrayList)
     * @param nombreArchivo (String)
     */
    public void leerArchivo(List<String> log,String nombreArchivo){
        File Archivo;                         //Para manipular al archivo
        FileReader leer;                      //Variable para leer
        String cadena;
        log.clear();
        Archivo = new File(nombreArchivo);   //Preparar el archivo, le damos el nombre del archivo
        try {
            leer = new FileReader(Archivo);
            BufferedReader almacenamiento= new BufferedReader(leer);
            cadena="";
            while(cadena!=null){
                try {
                    cadena=almacenamiento.readLine();    // que me almacene una linea de texto 
                    if(cadena!=null){
                        System.out.println(cadena);
                        log.add(cadena);
                    }
                } catch (IOException ex) {
                    Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
                }     
            }
            try {
                almacenamiento.close();
                leer.close();
            } catch (IOException ex) {
                Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
            } 
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }    
}


