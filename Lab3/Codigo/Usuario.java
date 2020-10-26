import java.lang.Math;
import java.util.List;

/**
 * Clase en la cual se guardan los datos determinados de algun usuario
 * esta clase no contiene metodos, solo atributos
 */
public class Usuario {
    public Usuario(){    
    }
    
    /**
     * Atributos
     * 
     */
    
    int valorTotal;
    String cadena="";
    String nombreUsuario;
    int valorFinal;

    
    /**
     * Metodo en el cual se calcular el promedio y la desviacion estandar de las evaluciones del chatbot y usuario
     * @param usr
     * @param perso
     * @param cantEvaluaciones 
     */
    
    public void calcularEvaluaciones(List<String> usr,List<String> perso,int cantEvaluaciones){
        double suma=0,siguiente=0,media=0,varianza=0,desviacion=0,general=0,amable=0,animado=0,agresivo=0;
        int par=0,personalidad=0,tamAmable=0,tamAnimado=0,tamAgresivo=0;
        Chatbot cbot = new Chatbot();
        System.out.println("Cantidad de evaluciones: "+cantEvaluaciones);
        //Calculo de la media
        for(int i=0;i<usr.size();i++){
            siguiente = Integer.parseInt(usr.get(i));
            suma = suma + siguiente;
        }
        media= suma/usr.size();
        System.out.println("El promedio es: "+media);
        
        //Calculo de la Varianza 
        double sumatoria;
        for(int i=0;i<usr.size();i++){
            siguiente = Integer.parseInt(usr.get(i));
            sumatoria= Math.pow(siguiente - media, 2);
            varianza= varianza + sumatoria;
        }
        varianza=varianza / (usr.size()-1);
        //Caluclo de la Desviacion Estandar 
        desviacion = Math.sqrt(varianza);
        double redondeo = Math.rint(desviacion*100)/100;
        System.out.println("La Desviacion Estandar es: "+redondeo);
        for(int i=0;i<usr.size();i++){
            siguiente= Integer.parseInt(usr.get(i));
            if(i%2==0){
                personalidad = Integer.parseInt(perso.get(par));
                personalidad = cbot.calcularSeed(personalidad);
				System.out.println("perso: "+perso.get(par));
                par++;
                general=general+siguiente;
                if(personalidad==0){
                    amable=amable+siguiente;
                    tamAmable++;
                }else if(personalidad==1){
                    animado=animado+siguiente;
                    tamAnimado++;
                }else if(personalidad==2){
                    agresivo=agresivo+siguiente;
                    tamAgresivo++;
                }
            }    
        }
        general = general/(usr.size()/2);
        if(tamAmable==0){
            tamAmable=1;
        }if(tamAgresivo==0){
            tamAgresivo=1;
        }if(tamAnimado==0){
            tamAnimado=1;
        }
        amable= amable/tamAgresivo;
        animado= animado/tamAnimado;
        agresivo= agresivo/tamAgresivo;
        System.out.println("La evaluacion general es: "+general);
        System.out.println("La evalucion amable es: "+amable);
        System.out.println("La evaluacion animada es: "+animado);
        System.out.println("La evaluacion agresiva es: "+agresivo);   
    }
    
}





