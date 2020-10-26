#!scheme
(require racket/serialize
         srfi/8/receive
         srfi/19
         srfi/27
         srfi/optional)



#|///////////////////////////////////ESTRUCTURA DEL CHATBOT /////////////////////////////////////|#
;Se define la estructura chatbot como una lista de listas que contiene sus caracteristicas

(define saludoBienvenidaAmable(list "Bueno dias bienvenido a Mr. Ham que desea ordenar?" "Buenas tardes bienvenido a Mr. Ham que desea ordenar?"
                                    "Buenas noches bienvenido a Mr. Ham que desea ordenar?" ))

(define saludoBienvenidaAnimado(list "Hola muy buenos dias como estas!? bienvenido a Mr. Ham en que lo puedo ayudar mi estimado?"
                                     "Hola muy buenas tardes como esta? bienvenido a Mr. Ham en que lo puedo ayudar?"
                                     "Hola muy buenas noches mi estimado bienvenido a Mr. Ham en que lo puedo ayudar?"))

(define saludoBienvenidaAgresivo(list "Tan temprano que es, que quieres?" "buenas tardes que quiere?" "Ya es de noche y pide algo, ya no importa que quiere?"))

(define saludosDeBienvenida(list saludoBienvenidaAmable saludoBienvenidaAnimado saludoBienvenidaAgresivo))

(define respuestaPedido(list "Bueno quiere algo mas?" "Buena eleccion! algo mas?" "Tienes muchas hambre parece jaja queri algo mas?"))

(define despedidaAmable(list "Adios que le vaya bien" "Hasta luego gracias por su pedido"))

(define despedidaAnimado(list "que le vaya super y gracias por todo!" "Suerte en todo y gracias por su pedido"))

(define despedidaAgresivo(list "Adios" "Chao"))

(define promesa 0)

(define despedidas(list despedidaAmable despedidaAnimado despedidaAgresivo))

(define personalidades(list "Amable" "Animado" "Agresivo"))

(define vocabulario (list saludosDeBienvenida  respuestaPedido despedidas))

(define evaluacionesDeDialogo (list ))

(define chatbot (list personalidades vocabulario evaluacionesDeDialogo promesa))



#|///////////////////////////////----- SEED -----//////////////////////////////////////////|#

;Funcion extraida del moodle de paradigmas
#|Funcion: myRandom transforma el numero ingresado en cualquier numero
Dominio:entero
Recorrido:entero
|#
(define a 1103515245)
(define c 12345)
(define m 2147483648)
;se ingresa un numero como num y obtendra un numero aleatorio
(define myRandom
  (lambda
    (num)
    (remainder (+ (* a num) c) m)
  )
)
#|Funcion: Calcula el resto de un numero y devuelve un numero segun el valor de ese resto, cada numero representa una personalidad
Dominio:entero
Recorrido:entero
|#
(define (semillaDeDecisiones semilla)
  (cond((= (remainder (myRandom semilla) 3) 0) 3)
       ((= (remainder (myRandom semilla) 2) 0) 1)
       ((= (remainder (myRandom semilla) 2) 1) 2)
    )
  )


#|Funcion: Da la bienvenida con un estado de animo determidado dependiendo de la semilla seed y de la hora que sea
Dominio: semilla seed (entero)
Recorrido:string con el mensaje de bienvenida
|#
(define (horaSaludo seed)
  (if (= (semillaDeDecisiones seed) 1)
      (cond((>= (string->number (date->string (current-date) "~H") )21) (caddr saludoBienvenidaAmable))
           ((<= (string->number (date->string (current-date) "~H") ) 6) (caddr saludoBienvenidaAmable))
           ((>= (string->number (date->string (current-date) "~H") )12) (cadr saludoBienvenidaAmable))
           ((>= (string->number (date->string (current-date) "~H") ) 6) (car saludoBienvenidaAmable))
       )
      (if (= (semillaDeDecisiones seed) 2)
          (cond((>= (string->number (date->string (current-date) "~H") )21) (caddr saludoBienvenidaAnimado))
               ((<= (string->number (date->string (current-date) "~H") ) 6) (caddr saludoBienvenidaAnimado))
               ((>= (string->number (date->string (current-date) "~H") )12) (cadr saludoBienvenidaAnimado))
               ((>= (string->number (date->string (current-date) "~H") ) 6) (car saludoBienvenidaAnimado) )  
           )
          (if (= (semillaDeDecisiones seed) 3)
              (cond((>= (string->number (date->string (current-date) "~H") )21) (caddr saludoBienvenidaAgresivo))
                   ((<= (string->number (date->string (current-date) "~H") ) 6) (caddr saludoBienvenidaAgresivo))
                   ((>= (string->number (date->string (current-date) "~H") )12) (cadr saludoBienvenidaAgresivo))
                   ((>= (string->number (date->string (current-date) "~H") ) 6) (car saludoBienvenidaAgresivo))
               ) 
               #f)
          )
      )
  )


#|Funcion: Chatbot se despide del usuario dependiendo de la semilla
Dominio:semilla seed(entero)
Recorrido:string con el mensaje de despedida 
|#
(define (horaDespedida seed)
  (if (= (semillaDeDecisiones seed) 1)
      (if (= (remainder seed 3)0)
          (car despedidaAmable)
          (cadr despedidaAmable))
      (if(= (semillaDeDecisiones seed) 2)
         (if (= (remainder seed 3)0)
             (car despedidaAnimado)
             (cadr despedidaAnimado))
         (if(= (semillaDeDecisiones seed) 3)
            (if (= (remainder seed 3)0)
                (car despedidaAgresivo)
                (cadr despedidaAgresivo))
           #f)
         )
      )
  )


#|Funcion: Entrega fecha y hora actual como un String
Dominio:no se ingresa nada
Recorrido: Entrega String con la fecha actual y el la hora exacta(horas:minutos:segundo)
|#
(define(fecha)
  (date->string (current-date) "[~d/~m/~Y ~H:~M:~S]"))


#|///////////////////////////////TDA//////////////////////////////////////////|#

;Se utilizara la estrucutra TDA en el transcurso de la conversacion

;Constructor

(define (datos chatbot log seed)
  (if (null? log)
      (if(and(list? chatbot)(list? log)(number? seed))
         (Log fecha (horaSaludo seed) log seed chatbot)
         #f
         )
      (if(and(list? chatbot)(list? log)(number? seed))
         (Log fecha (horaDespedida seed) log seed chatbot)
         #f
         )
    )
)

#|///////////////////////////////Inicio de la conversacion//////////////////////////////////////////|#
#|Funcion:Inicia un nuevo dialogo con el chatbot|#

(define (beginDialog chatbot log seed)
     (datos chatbot log seed)
  )

#|///////////////////////////////Final de la conversacion//////////////////////////////////////////|#
#|Funcion:Finaliza la conversacion con el chatbot|#
(define (endDialog chatbot log seed)
    (datos chatbot log seed)
  )
  


#|Log|#
(define (Log fecha horaSalDes log seed chatbot)
  (if(null? log)
     (VerificarDialog(flatten(list(append log (list(string-append "BeginDialog a las " (fecha) "-Chatbot: " horaSalDes))))) chatbot)
     (VerificarDialog(flatten(list(append log (list(string-append "EndDialog a las " (fecha) "-Chatbot: " horaSalDes))))) (autoevaluacion chatbot log)) 
     )
  )

(define (LogMsn fecha seed log mensaje chatbot)
  (VerificarDialog(flatten(list(append log (append (list (string-append (fecha) "-Usuario: " mensaje)) (list(string-append (fecha) "-Chatbot: " seed)))))) chatbot)
  )

;Funcion de pertenencia
(define (VerificarDialog lista chatbot)
  (if (list? lista)
      (list lista)
      #f
      )
  )

#|Funcion: imprime por pantalla toda la conversacion que lleva el log
Dominio: log (lista)
Recorrido: contenido de log
|#
(define (displayLog log)
  (display log)
  )


#|///////////////////////////////Mensaje enviado por el usuario//////////////////////////////////////////|#

#|Funcion:Funcion donde el usario envia el mensaje
 dominio:estructura chatbot,log(lista),seed(numero),mensaje(string)
recorrido:log modificado incluyendo mensaje del usuario y la respuesta del chatbot 
|#

(define (sendMessage  mensaje chatbot log seed)
  (datosMsn chatbot mensaje log seed)
  )


;constructor
(define (datosMsn chatbot mensaje log seed)
  (if(and(list? chatbot)(string? mensaje)(list? log)(number? seed))
     (respuestaUsr mensaje log seed)
     #f
     )
  )

#|Funcion:Funcion que verifica que palabras fueron ingresadas por el usuario
Dominio: mensaje del usuario (string) y el log de la conversacion
Recursion: probable respuesta del chatbot string
|#
(define (respuestaUsr mensaje log seed)
  (cond
    [(comprobarPalabra (mensajeLista mensaje) seed "si" "ya" "bueno" "ok")(persoRespuesta (list "Que mas quiere pedir?" "yap! que otra cosa?" "oh bueno ya, otra cosa?") log seed mensaje chatbot)]
    [(comprobarPalabra (mensajeLista mensaje) seed "no" "nada" "nop" "negativo")(persoRespuesta (list "Bueno, anotado todo" "oh bueno, espero que lo disfrute" "ya estamos entonces") log seed mensaje chatbot)]
    [(comprobarFraseCorta (mensajeLista mensaje) seed "si" "claro" "estimado" "gracias")(persoRespuesta (list "Que mas quiere?" "que bueno! que mas necesita?" "ya bueno, que mas?") log seed mensaje chatbot)]
    [(comprobarFraseCorta (mensajeLista mensaje) seed "no" "gracias" "quiero" "nada")(persoRespuesta (list "Bueno, anotado todo" "oh bueno, espero que lo disfrute" "ya estamos entonces") log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "no" "nada" "mas" 1)(persoRespuesta (list "Bueno se ha anotado todo su pedido" "bueno mi estimado, ya estamos" "eso es todo entonces") log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "cual" "tu" "nombre" 1)(persoRespuesta (list "Mi nombre es Alberto" "Que considerado me llamo Alberto!" "es importante? me llamo Alberto") log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "como" "te" "llamas" 1)(persoRespuesta (list "Me llamo Alberto estimado" "No me lo habian preguntado antes gracias!, me llamo Alberto" "te importa mucho? me llamo Alberto") log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "como" "te" "sientes" 1)(persoRespuesta (car chatbot) log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "que" "hamburguesas" "tiene" 1)(persoRespuesta (list "hay hamburguesa clasica,vegetariana y gigante" "tenemos 3 tipos estimado, clasica,vegetariana y gigante" "y el menu esta de adorno?") log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "me" "gustaria" "hamburguesa" 1)(persoRespuesta (list "Cual hamburguesa especificamente?" "Tenemos de muchos tipos cual desea?" "Pero que tipo quieres? Especifica") log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "quiero" "hamburguesa" "clasica" 1)(persoRespuesta respuestaPedido log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "quiero" "hamburguesa" "vegetariana" 1)(persoRespuesta respuestaPedido log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "quiero" "hamburguesa" "gigante" 1)(persoRespuesta respuestaPedido log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "me" "gustaria" "papas" 1)(persoRespuesta (list "Que tamaño las papas?" "Tenemos muchos tamaños cual prefiere" "Papas fritas? no entiendo sin el tamaño no se cual es") log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "quiero" "papas" "chicas" 1)(persoRespuesta respuestaPedido log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "quiero" "papas" "medianas" 1)(persoRespuesta respuestaPedido log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "quiero" "papas" "grandes" 1)(persoRespuesta respuestaPedido log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "que" "bebidas" "tiene" 1)(persoRespuesta (list "Tenemos pepsi,fanta y sprite" "hay pepsi, fanta y sprite estimado" "ve el menu para eso esta") log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "me" "gustaria" "bebida" 1)(persoRespuesta (list "Que tipo de bebida?" "Tenemos 3 tipos de bebidas cual desea usted estimado?" "ah y yo soy adivino de cual bebidas quieres, especifica") log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "quiero" "bebida" "pepsi" 1)(persoRespuesta (list "bueno, quiere algo mas?" "rica bebida! algo mas que quiera?" "bueno, que mas?") log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "quiero" "bebida" "sprite" 1)(persoRespuesta (list "bueno, quiere algo mas?" "rica bebida! algo mas que quiera?" "bueno, que mas?") log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "quiero" "bebida" "fanta" 1)(persoRespuesta (list "bueno, quiere algo mas?" "rica bebida! algo mas que quiera?" "bueno, que mas?") log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed "tiene" "alguna" "comida" 1)(crearPromesa(list "dejeme consultar que mas hay" "tendria que consultar" "para que quieres otra cosa? bueno deja consultar") log seed mensaje chatbot)]
    [(comprobarFrase (mensajeLista mensaje) seed"que" "le" "dijieron" 1)(verificarPromesa(list "no, estimado solo vendemos lo que esta enel menu, asi que eliga algo de el") log seed mensaje chatbot)]
    [(noEncontrada mensaje log seed)(persoRespuesta (list "no te entendi podrias repetir la pregunta" "lo siento amigo, no le entendi podria decirme que queria decir?" "no entiendo nada, repite") log seed mensaje chatbot)]
    )
  )

#|funcion:Verfica el mensaje ingresado por el usuario solo su mensaje tiene una palabra
Dominio:mensaje del usuario (lista) y el seed (entero)
Recorrido: booleano
;////TDA////
;FUNCIONES QUE OPERAN SOBRE LA REPRESENTACION:en esta funcion se aprecia el uso de la operacion length que opera
;sobre el TDA de lista, con la que se obtiene el largo de una lista
;///////////
|#
(define (comprobarPalabra mensaje seed string1 string2 string3 string4)
  (if (= (length mensaje) 1)
      (if (or (string-ci=? (car mensaje) string1)(string-ci=? (car mensaje) string2)(string-ci=? (car mensaje) string3)(string-ci=? (car mensaje) string4))
          #t
          #f
          )
      #f)
)


#|funcion:Verfica el mensaje ingresado por el usuraio solo si su mensaje son solo 2 palabras
Dominio:mensaje del usario(lista) y el seed (entero)
Recorrido: booleano
;////TDA////
;FUNCIONES QUE OPERAN SOBRE LA REPRESENTACION:en esta funcion se aprecia el uso de la operacion length que opera
;sobre el TDA de lista, con la que se obtiene el largo de una lista
;///////////
|#
(define (comprobarFraseCorta mensaje seed string1 string2 string3 string4)
  (if (= (length mensaje) 2)
      (if (string-ci=? (car mensaje) string1)
          (if (or (string-ci=? (cadr mensaje) string2)(string-ci=? (cadr mensaje) string3)(string-ci=? (cadr mensaje) string4))
              #t
              #f
              )
          #f)
      #f)
)

#|Funcion: Verifica el mensaje ingresado por el usuario para saber que debe responder el chatbot
Dominio: mensaje del usuario(lista) ,el seed (entero) y el acumulador (entero)
Recorrido: booleano
;////TDA////
;FUNCIONES QUE OPERAN SOBRE LA REPRESENTACION:en esta funcion se aprecia el uso de la operacion length que opera
;sobre el TDA de lista, con la que se obtiene el largo de una lista
;///////////
En esta funcion se usa recursion de cola
porque no crea ninguna funcion diferida quiere decir que no hay operaciones que tiene que realizarse despues
de la ultima llamada recursiva, existe un acumulador 
|#

(define (comprobarFrase mensaje seed string1 string2 string3 acum)
  (if (string-ci=? (car mensaje) string1)
      (if(string-ci=? (cadr mensaje) string2)
         (if (>= (length mensaje) 3)
             (if(string-ci=? (caddr mensaje) string3)
                #t
                (if(> (+ acum 2) (+ (length mensaje) 1))
                   #f
                   (comprobarFrase (eliminarElemento (caddr mensaje) mensaje) seed string1 string2 string3 (+ acum 1))
                   )
                )
             #f)
         (if(> (+ acum 1) (length mensaje) )
            #f
            (comprobarFrase (eliminarElemento (cadr mensaje) mensaje) seed string1 string2 string3 (+ acum 1))
            )
         )
      (if(> acum (+ (length mensaje) 1))
         #f
         (comprobarFrase (cdr mensaje) seed string1 string2 string3 (+ acum 1))
         )
      )      
)

#|Funcion:transforma un string en una lista y los separa por un elemento
Dominio: mensaje del usuario (string)
Recorrido:lista con las palabras del mensaje
|#
(define (mensajeLista mensaje)
  (string-split mensaje " "))

#|Funcion:Eliminar el elemento indicado en la lista y crear un nueva lista
Dominio: elemento (string), lista de mensajes
Recorrido: lista modificada
////TDA////
MODIFICADOR: trabaja con el TDA de lista se ingresa una lista y la modifica
///////////
En esta funcion se usa la recursion natural
porque para buscar el elemento que se necesita borrar se llama a si misma y va dejando de estado pendiente
que es juntar el car de la lista con el resto de la recursion a traves del operador cons
,incluso despues de realizar la ultima recursion tiene como estado pendiente realizar la operacion cons en la lista
|#
(define (eliminarElemento elem list)
    (if(equal? elem (car list))
      (cdr list)
      (cons (car list)(eliminarElemento elem (cdr list)))))


#|Funcion: el chatbot le responde al usario y la respuesta depende de la personalidad del chatbot que se decide con la semilla
Dominio: lista de respuestas posible,log (lista) y la semilla seed (entero)
Recorrido: respuesta (string)
////TDA////
SELECTORES:al llamar a la funcion LogMsn en cada caso uno de los parametros que se ingresa es una funcion selectora
esta funcion selectora nos permite obtener datos contenidos en la representacion TDA
en esta funcion usamos las funciones car, cadr,caddr que son propias del TDA de listas en Scheme
///////////
|#
(define (persoRespuesta lista log seed mensaje chatbot)
  (if (= (semillaDeDecisiones seed) 1)
          (LogMsn fecha (car lista) log mensaje chatbot)  
          (if(= (semillaDeDecisiones seed) 2) 
             (LogMsn fecha (cadr lista) log mensaje chatbot)
             (if(= (semillaDeDecisiones seed) 3)
                (LogMsn fecha (caddr lista) log mensaje chatbot)
                #f
                )
          )
      )
)

#|Funcion: ante el mensaje del usuario, esta funcion crea una promesa
 Dominio:mensaje de respuesta(lista), log (lista) ,el seed (entero) ,el mensaje del usuario(string) y el chatbot (lista)
Recorrido:respuesta (string)
|#
(define (crearPromesa lista log seed mensaje chatbot)
  (persoRespuesta lista log seed mensaje (list personalidades vocabulario evaluacionesDeDialogo 1))
  )

#|Funcion: Verifica si se encuentra la prosemesa dada, si no se ha creado la promesa el chatbot no enterdera la pregunta
Dominio: mensaje de respuesta(string), log (lista), el seed(entero) ,el mensaje del usuario(string) y el chatbot(lista)
Recorrido:respuesta (string)
|#
(define (verificarPromesa lista log seed mensaje chatbot)
  (if (= (cadddr chatbot) 1)
      (persoRespuesta lista log seed mensaje chatbot)
      (persoRespuesta (list "no te entendi podrias repetir la pregunta" "lo siento amigo, no le entendi podria decirme que queria decir?" "no entiendo nada, repite") log seed mensaje chatbot)
      )
  )



#|Funcion:comprobara que los datos introducidos son correctos y verificar que el chatbot no entendio
Dominio:mensaje del usuario (string),log (lista) y la semilla seed (entero)
Recorrido: booleano
|#
(define (noEncontrada mensaje log seed)
  (if (string? mensaje)
      #t
      #f
      )
  )

#|///////////////////////////////TEST//////////////////////////////////////////|#

(define user1(list "hola, me gustaria una hamburguesa" "quiero una hamburguesa clasica" "quiero unas papas medianas" "que bebidas tiene" "quiero una bebida fanta" "no gracias"))
(define user2(list "como te llamas" "ya bueno, me gustaria una hamburguesa" "que pesado como te sientes ?" "asi veo, quiero una bebida pepsi" "no"))
(define user3(list "hola! cual es tu nombre estimado" "que lindo nombre, bueno me gustaria unas papas" "quiero unas papas fritas chicas" "si claro" "una bebida sprite" "no nada mas"))

#|funcion: funcion TEST que entrega el desarrollo de una conversacion completa
Dominio: user (lista), chatbot (lista), log (lista), seed (entero)
Recorrido: lista con la conversacion completa
El tipo de recursion empleado es la recursion natural porque van quedando estados pendientes al ir llamando a la funcion 
|#
(define (test user chatbot log seed)
  (if (null? log)
      (test user chatbot (beginDialog chatbot log seed) seed)
      (if (null? user)
          (endDialog chatbot log seed)
          (test (cdr user) chatbot (sendMessage (car user) chatbot log seed) seed))
      )
  )

#|///////////////////////////////RATE//////////////////////////////////////////|#

;funcion F y su metrica sera que mientras mas larga sea la conversacion entre el chatbot y el usuario mayor sera la autoevaluacion
;Dominio:log (lista)
;Recorrido: entero
(define (F log)
  (cond((=  (length log) 0) 0)
       ((<= (length log) 3) 1)
       ((<= (length log) 4) 2)
       ((<= (length log) 5) 3)
       ((<= (length log) 6) 4)
       ((>= (length log) 7) 5)
    )
  )

#|Funcion: agrega la autoevaluacion del chatbot a los registro de evaluaciones del chatbot
 Dominio:chatbot(lista) y log(lista)
Recorrido:chatbot modificado
|#
(define (autoevaluacion chatbot log)
  (list personalidades vocabulario (list (list (F log))) promesa)
)

#|Funcion:Permite evaluar el desempeño del chatbot frente a las distintas conversaciones efectuadas con el chatbot
Dominio: chatbot(lista), score (entero), en f y en log ingresar en ultimo log donde se guardo endDialog
Recorrido: chatbot modificado
|#
(define (rate chatbot score f log)
  (list (list score (F f)))
  )









