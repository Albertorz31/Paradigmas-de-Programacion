%En este programa se desarrolla el proyecto de laboratorio, osea el
% chatbot:
% Este programa logico se compone de un conjunto de clausulas de Horn o
% dicho de otra forma una coleccion de reglas

% obtiene la fecha y tiempo actual en que se ejecuta el programa
stringTiempo(Tiempo):-
    (get_time(T),convert_time(T,Y,M,D,H,Mn,S,_)),
     atomic_list_concat([D,M,Y],'/',Fecha),
     atomic_concat(Fecha,' a las ',Sep),
     atomic_list_concat([H,Mn,S],':',Hora),
     atomic_concat(Sep,Hora,Atom),
     atom_string(Atom,Tiempo).


%////////////////ESTRUCTURA DEL CHATBOT///////////////////////
% Esta estructura esta formada por hechos, donde esta el vocabulario del
% chatbot, este varia segun la personalidad que tenga el chatbot que
% sera elegida por el usuario.
% tambien con la semilla seed iran variando las respuestas que pueda
% tener el chatbot.

%Hechos
%Argumentos: Numero del seed, algunos con un numero que indica el estado
%La salida en este caso seria un String donde esta contenido el mensaje
saludoBienvenidaAmable("Bueno dias bienvenido a Mr. Ham que desea ordenar?",1).
saludoBienvenidaAmable("Buenas tardes bienvenido a Mr. Ham que desea ordenar?",2).
saludoBienvenidaAmable("Buenas noches bienvenido a Mr. Ham que desea ordenar?",3).

saludoBienvenidaAnimado("Hola muy buenos dias como estas!? bienvenido a Mr. Ham en que lo puedo ayudar mi estimado",1).
saludoBienvenidaAnimado("Hola muy buenas tardes como esta? bienvenido a Mr. Ham en que lo puedo ayudar?",2).
saludoBienvenidaAnimado("Hola muy buenas noches mi estimado bienvenido a Mr. Ham en que lo puedo ayudar?",3).

saludoBienvenidaAgresivo("Tan temprano que es, que quieres",1).
saludoBienvenidaAgresivo("buenas tardes, que quiere?",2).
saludoBienvenidaAgresivo("Ya es de noche y pide algo, ya no importa que quiere",3).

despedidaAmable("Adios que le vaya bien",1).
despedidaAmable("Hasta luego gracias por su pedido",2).

despedidaAnimado("Que le vaya super y gracias por todo!",1).
despedidaAnimado("Suerte en todo y gracias por su pedido",2).

despedidaAgresivo("Adios",1).
despedidaAgresivo("Chao",2).

respuesta1Palabra("Que mas quiere pedir?",1,1).
respuesta1Palabra("Se le apetese alguna Harburguesa?",1,2).
respuesta1Palabra("espero su pedido",1,3).
respuesta1Palabra("yap! que otra cosa?",2,1).
respuesta1Palabra("Se le antoja una rica bebida?",2,2).
respuesta1Palabra("Mire el menu y me dice que quiere mi estimado",2,3).
respuesta1Palabra("Oh bueno ya, otra cosa?",3,1).
respuesta1Palabra("Mira el bueno luego y dime que queri",3,2).
respuesta1Palabra("Elije rapido",3,3).
respuesta1PalabraNeg("Bueno anotado todo",1,1).
respuesta1PalabraNeg("No quiere una Hamburguesa clasica? estan en oferta",1,2).
respuesta1PalabraNeg("Excelente enviare todo",1,3).
respuesta1PalabraNeg("oh, bueno espero que lo disfrute",2,1).
respuesta1PalabraNeg("seguro? tenemos unas ricas Hamburguesas clasicas en oferta!",2,2).
respuesta1PalabraNeg("Bueno mi estimado, anotare todo lo que pidio",2,3).
respuesta1PalabraNeg("ya estamos entonces",3,1).
respuesta1PalabraNeg("Ya porfin dejaste de pedir",3,2).
respuesta1PalabraNeg("Ya suficiente que bueno",3,3).
respuesta2Palabras("Que mas quiere?",1,1).
respuesta2Palabras("Quiere comprar alguna bebida?",1,2).
respuesta2Palabras("Le gustaria una papas medianas?",1,3).
respuesta2Palabras("que bueno! que mas necesita",2,1).
respuesta2Palabras("Alguna bebida estimado cliente?",2,2).
respuesta2Palabras("Que bueno que quiera otra cosa! que necesita?",2,3).
respuesta2Palabras("ya bueno, que mas?",3,1).
respuesta2Palabras("Ohh no te llenas? bueno que mas?",3,2).
respuesta2Palabras("Yayaya pide otra cosa",3,3).
respuesta2PalabrasNeg("Bueno,anotado todo",1,1).
respuesta2PalabrasNeg("Ya bueno, aunque podria pedir otra cosa si quiere",1,2).
respuesta2PalabrasNeg("Espere tenemos una oferta 2X1 de papas chicas",1,3).
respuesta2PalabrasNeg("oh bueno,espero que lo disfrute",2,1).
respuesta2PalabrasNeg("Espero lo haya disfrutado todo mi estimado",2,2).
respuesta2PalabrasNeg("Aproveche! nuestra oferta 2X1 de papas chicas!",2,3).
respuesta2PalabrasNeg("Ya estamos entonces",3,1).
respuesta2PalabrasNeg("A menos mal",3,2).
respuesta2PalabrasNeg("Ya vayase no ya no quedan promociones",3,3).
respuestaNeg("Bueno anotado todo su pedido",1,1).
respuestaNeg("Bueno, aunque podria pedir otra cosa si quiere",1,2).
respuestaNeg("Tenemos la oferta de 2X1 papas chicas, si es que quiere",1,3).
respuestaNeg("oh bueno,espero que lo dusfrute",2,1).
respuestaNeg("Espero que lo haya disfrutado mi estimado",2,2).
respuestaNeg("Aproveche! nuestra oferta 2X1 de papas chicas!",2,3).
respuestaNeg("eso es todo entonces",3,1).
respuestaNeg("Ya menos mal",3,2).
respuestaNeg("Ya porque no quedaban ofertas",3,3).
respuestaEstado("Bien, estimado gracias",1,1).
respuestaEstado("Muy bien, gracias",1,2).
respuestaEstado("He estado mejor pero estoy bien gracias",1,3).
respuestaEstado("Estoy excelente, gracias por preguntar!",2,1).
respuestaEstado("OH gracias por preguntar! estoy super bien",2,2).
respuestaEstado("gracias mi estimado se le agradece mucho, estoy bien",2,3).
respuestaEstado("Que te importa, solo pide lo que quieres",3,1).
respuestaEstado("Ando Pesado asi que no pregunti mejor",3,2).
respuestaEstado("Pide algo mejor que preguntar",3,3).
respuestaH("hay hamburguesa clasica,vegetariana y gigante",1).
respuestaH("tenemos 3 tipos estimado, clasica, vegetariana y gigante",2).
respuestaH("y el menu esta de adorno",3).
respuestaH2("Cual hamburguesa especificamente?",1).
respuestaH2("Tenemos muchos tipos cual desea?",2).
respuestaH2("Pero que tipo quieres? especifica",3).
respuestaPedidoH("Bueno Anotado,quiere algo mas?",1,1).
respuestaPedidoH("No nos queda es hamburguesa, puede pedir otra?",1,2).
respuestaPedidoH("Ya puede llevarse otra de regalo por la promocion!, que otra cosa",1,3).
respuestaPedidoH("Bueno mi estimado gracias!, otra cosa?",2,1).
respuestaPedidoH("Lo siento me estimado, no queda esa Hamburguesa puede pedir otra?",2,2).
respuestaPedidoH("Bueno, he anotado todo!",2,3).
respuestaPedidoH("Ya te anote todo",3,1).
respuestaPedidoH("No quedan jajaja, mejor pide otra",3,2).
respuestaPedidoH("Ya, le dije al cocinero, eso es todo?",3,3).
respuestaPedido("Bueno quiere algo mas?",1).
respuestaPedido("Buena eleccion! quiere algo mas?",2).
respuestaPedido("Eso nomas espero o queri otra cosa?",3).
respuestaPapas("Que tama�o las papas",1).
respuestaPapas("Tenemos muchos tama�os, cual prefiere?",2).
respuestaPapas("Papas Fritas? no entiendo, tienes que decirme el tama�o de las papas",3).
respuestaBebida("Tenemos Pepsi, Fanta y Sprite",1).
respuestaBebida("Hay Pepsi, Fanta y Sprite mi estimado",2).
respuestaBebida("Ve el menu para eso esta",3).
respuestaBebida2("Que tipo de bebida?",1).
respuestaBebida2("Tenemos 3 tipos de bebida, cual desea usted mi estimado",2).
respuestaBebida2("Ah y yo soy adivino de cual bebida quieres, especifica",3).
respuestaBebida3("bueno, quiere algo mas?",1,1).
respuestaBebida3("No nos quedan, puede pedir otra?",1,2).
respuestaBebida3("Ya buena eleccion, otra cosa?",1,3).
respuestaBebida3("rica bebida!, algo mas que quiera",2,1).
respuestaBebida3("Perdon mi estimado! se acabaron, lo lamento, pida otra mejor",2,2).
respuestaBebida3("Buena bebida, algo mas!",2,3).
respuestaBebida3("bueno, que mas?",3,1).
respuestaBebida3("no quedan, pide otra",3,2).
respuestaBebida3("YAYA anotado, algo mas?",3,3).
respuestaBebidaFanta("Tenemos una promocion asi que se lleva 2x1, algo mas?",1,1).
respuestaBebidaFanta("Se nos acabaron por la promocion, pero puede pedir otra",1,2).
respuestaBebidaFanta("Bueno esa se lleva, algo mas",1,3).
respuestaBebidaFanta("Estimado! tenemos una promocion 2X1 se llevara 2, algo mas?",2,1).
respuestaBebidaFanta("Yap anotado mi estimado,algo mas?",2,2).
respuestaBebidaFanta("No nos quedan, la promocion las agoto, perdon!, puede llevar otra cosa",2,3).
respuestaBebidaFanta("Ya que bueno,otra cosa",3,1).
respuestaBebidaFanta("No no quedan, que pena jajaj, otra cosa?",3,2).
respuestaBebidaFanta("Ya bueno como quieras, queri algo mas?",3,3).
respuestaAgresivo("Si que tanto problema?, ya mejor pide algo").
sinRespuesta("no te entendi podrias repertir la pregunta?",1).
sinRespuesta("lo siento amigo, no le entendi, podria decirme que queria decir?",2).
sinRespuesta("no entiendo nada, repite",3).


%Reglas

% regla de saludo,envia el mensaje de bienvenida dependiendo de
% la hora Los argumentos serian el num que indica la personalidad y la
% salida VAL, la meta es obtener ese mensaje de bienvenida
saludosBienvenida(VAL,NUM):- get_time(T),convert_time(T,_,_,_,H,_,_,_),
                              H >= 12, H < 21,
                             (saludoBienvenidaAmable(VAL,2),NUM = 1;saludoBienvenidaAnimado(VAL,2),NUM = 2;saludoBienvenidaAgresivo(VAL,2),NUM = 3);
                             get_time(T),convert_time(T,_,_,_,H,_,_,_),
                              H < 12, H > 6,
                             (saludoBienvenidaAmable(VAL,1),NUM = 1;saludoBienvenidaAnimado(VAL,1),NUM = 2;saludoBienvenidaAgresivo(VAL,1),NUM = 3);
                             get_time(T),convert_time(T,_,_,_,H,_,_,_),
                              (H > 21;H >= 0),
                             (saludoBienvenidaAmable(VAL,3),NUM = 1;saludoBienvenidaAnimado(VAL,3),NUM = 2;saludoBienvenidaAgresivo(VAL,3),NUM = 3).

% regla de despedida,envia el mensaje de despedida dependiendo,de la
% personalida y del seed,sus entradas son la personalidad y el seed
% mientras que su meta es obtener el mensaje de despedida
despedidas(VAL,NUM,SEED):- despedidaAmable(VAL,1),NUM = 1,SEED = 0;
                           despedidaAmable(VAL,2),NUM = 1;
                           despedidaAnimado(VAL,1),NUM = 2,SEED = 0;
                           despedidaAnimado(VAL,2),NUM = 2;
                           despedidaAgresivo(VAL,1), NUM = 3,SEED = 0;
                           despedidaAgresivo(VAL,2), NUM = 3.


% //////////////////////////////////SEED//////////////////////////////////

semillaAmable(1).
semillaAnimado(2).
semillaAgresivo(3).

%regla que determina que numero tendra el SEED que puede ser 1,2 o 3
%la entrada son el Seed ingresado por el usuario y un validador
%la meta es obtener el numero 1,2 o 3 como semilla
semillaDeDecisiones(Seed,SEED,VAL):- semillaAgresivo(SEED),VAL = 0,VAL is Seed mod 3;
                                     semillaAmable(SEED),VAL = 0,VAL is Seed mod 2;
                                     semillaAnimado(SEED),VAL = 1,VAL is Seed mod 2.


validar(VAL):- VAL = 0;VAL =1.

par(SEED,VAL):- VAL is SEED mod 2.



% ///////////////////////////////TDA//////////////////////////////////////
% Se trabaja con el TDA de listas en prolog, esta lista sera el log de
% conversacion compuesta de Strings
% En prolog una funcion de pertenencia es cuando en una sentencia se
% cumple los hechos en el, osea todas las reglas son funcion
% pertenencia
% en todas las reglas donde se ingrese un InputLog y se salida sea un
% OutputLog aplica el concepto de modificador del TDA de lista
% ya que modifica la lista ingresada y la transforma en una lista nueva


%constructor
% regla que construye el string de inicio de conversacion y el de
% finaliza la conversacion, sus etradas son la personalidad del chatbot,
% el log, el seed y de salida el log modificado
% su meta es convertir el mensaje en un string y agregarlo en la lista
% log
datos(Chatbot,InputLog,Seed,OutputLog):-
    String = "",(Chatbot=amable,saludosBienvenida(Saludo,1);Chatbot=animado,saludosBienvenida(Saludo,2);Chatbot=agresivo,saludosBienvenida(Saludo,3)),
    (InputLog = [],stringTiempo(Tiempo),string_concat("BeginDialog el ",Tiempo,BD),string_concat(BD," -",Espacio),
    string_concat(Espacio,"Chatbot",Log),string_concat(Log,": ",Log2),string_concat(Log2,Saludo,Log3),string_concat(String,Log3,Log4),
    logg(Log4,OutputLog));
    (InputLog \= [],stringTiempo(Tiempo),(Chatbot=amable,despedidas(Bye,1,Par);Chatbot=animado,despedidas(Bye,2,Par);
    Chatbot=agresivo,despedidas(Bye,3,Par)),par(Seed,Par),string_concat("EndDialog el ",Tiempo,ED),string_concat(ED," -",Espacio),
    string_concat(Espacio,"Chatbot",Log),string_concat(Log,": ",Log2),string_concat(Log2,Bye,Log3),logg(Log3,Log4),append(InputLog,Log4,OutputLog)).




%////////////////////Inicio de la conversacion//////////////////////////

%regla que envia datos al constructor
beginDialog(Chatbot,InputLog,Seed,OutputLog):-
    datos(Chatbot,InputLog,Seed,OutputLog).


%////////////////////Final de la conversacion///////////////////////////

endDialog(Chatbot,InputLog,Seed,OutputLog):-
    datos(Chatbot,InputLog,Seed,OutputLog).


%/////////Log//////////
%regla que envia datos a constructor
logg(L,S):- S = [L].


%/////////////////Mensaje enviado por el usuario////////////////////////
%regla que envia datos al constructor
sendMessage(Msg,Chatbot,InputLog,Seed,OutputLog):-
    datosMsn(Msg,Chatbot,InputLog,Seed,OutputLog).

%contructor
% regla que tiene como meta convertir el mensaje enviado por el usuario
% en un string y agregarlo en la lista log
% sus entradas serian la personalidad del chatbot el log,el mensaje del
% usuario,el seed. Y de salida el log modificado
datosMsn(Msg,Chatbot,InputLog,Seed,OutputLog):-
    semillaDeDecisiones(Seed,SEED,VAL),validar(VAL),stringTiempo(Tiempo),respuestaCbot(Msg,Chatbot,SEED,Resp),InputLog \= [],
    string_concat(Tiempo," -Usuario: ",Usr),string_concat(Usr,Msg,Mensaje),logg(Mensaje,Log),append(InputLog,Log,Usuario),
    string_concat(Tiempo," -",Guion),string_concat(Guion,"Chatbot",Logg),string_concat(Logg,": ",Log2),string_concat(Log2,Resp,Log3),logg(Log3,Log4),
    append(Usuario,Log4,OutputLog).


% regla que tiene como meta devolver el mensaje del chatbot de la
% pregunta del usuario
% este verificara el mensaje del usuario y cual es la respuesta correcta
% del chaatbot, esta respuesta puede variar dependiendo de la
% personalidad y el seed ingresado por el usuario
% aca tambien se usa un operador TDA de lista que es el length que
% obtiene el largo de la lista
respuestaCbot(Msg,Chatbot,SEED,Resp):-
    split_string(Msg," ", "",Str),length(Str,Largo),(Chatbot=amable,Estado is 1;Chatbot=animado,Estado is 2;Chatbot=agresivo,Estado is 3),
    ((Largo=1,comprobarPalabra(Str,"si","ya","bueno","ok"),respuesta1Palabra(Resp,Estado,SEED));
     (Largo=1,comprobarPalabra(Str,"no","nada","nop","negativo"),respuesta1PalabraNeg(Resp,Estado,SEED));
     (Largo=2,comprobarFraseCorta(Str,"si","claro","estimado","gracias"),respuesta2Palabras(Resp,Estado,SEED));
     (Largo=2,comprobarFraseCorta(Str,"no","gracias","quiero","nada"),respuesta2PalabrasNeg(Resp,Estado,SEED));
     (Largo=2,comprobarFraseCorta(Str,"que","pesado","desagradable","agresivo"),respuestaAgresivo(Resp));
     (comprobarFrase(Str,"hola","como","estas"),respuestaEstado(Resp,Estado,SEED));
     (comprobarFrase(Str,"no","nada","mas"),respuestaNeg(Resp,Estado,SEED));
     (comprobarFrase(Str,"que","hamburguesas","tiene"),respuestaH(Resp,SEED));
     (comprobarFrase(Str,"me","gustaria","hamburguesa"),respuestaH2(Resp,SEED));
     (comprobarFrase(Str,"quiero","hamburguesa","clasica"),respuestaPedidoH(Resp,Estado,SEED));
     (comprobarFrase(Str,"quiero","hamburguesa","vegetariana"),respuestaPedidoH(Resp,Estado,SEED));
     (comprobarFrase(Str,"quiero","hamburguesa","gigante"),respuestaPedidoH(Resp,Estado,SEED));
     (comprobarFrase(Str,"me","gustaria","papas"),respuestaPapas(Resp,SEED));
     (comprobarFrase(Str,"quiero","papas","chicas"),respuestaPedido(Resp,SEED));
     (comprobarFrase(Str,"quiero","papas","medianas"),respuestaPedido(Resp,SEED));
     (comprobarFrase(Str,"quiero","papas","grandes"),respuestaPedido(Resp,SEED));
     (comprobarFrase(Str,"que","bebidas","tiene"),respuestaBebida(Resp,SEED));
     (comprobarFrase(Str,"me","gustaria","bebida"),respuestaBebida2(Resp,SEED));
     (comprobarFrase(Str,"quiero","bebida","pepsi"),respuestaBebida3(Resp,Estado,SEED));
     (comprobarFrase(Str,"quiero","bebida","sprite"),respuestaBebida3(Resp,Estado,SEED));
     (comprobarFrase(Str,"quiero","bebida","fanta"),respuestaBebidaFanta(Resp,Estado,SEED));
     (sinRespuesta(Resp,SEED))).

% aplica un selector del TDA de lista ya que puede dividir a la lista en
% cabeza y la cola y asi poder obtener los elementos de ella
comprobarPalabra([X|_],Str1,Str2,Str3,Str4):-
    (X=Str1;X=Str2;X=Str3;X=Str4).

comprobarFraseCorta([X|Xs],Str1,Str2,Str3,Str4):-
    X = Str1,comprobarFraseCorta2(Xs,Str2,Str3,Str4).

comprobarFraseCorta2([X|_],Str2,Str3,Str4):-
    X=Str2;X=Str3;X=Str4.


comprobarFrase(Mensaje,Str1,Str2,Str3):-
    contiene(Mensaje,Str1),comprobarFrase2(Mensaje,Str2,Str3).
comprobarFrase2(Mensaje,Str2,Str3):-
    contiene(Mensaje,Str2),comprobarFrase3(Mensaje,Str3).
comprobarFrase3(Mensaje,Str3):-
    contiene(Mensaje,Str3).

% aplica un selector del TDA de lista ya que puede dividir a la lista en
% cabeza y la cola y asi poder obtener los elementos de ella
contiene([X|_],X).
contiene([_|Xs],Y):- contiene(Xs,Y).


% ////////////////////////////////////TEST////////////////////////////////

user(["hola, me gustaria una hamburguesa","quiero una hamburguesa clasica","quiero unas papas medianas","que bebidas tiene","quiero una bebida fanta","no gracias"],user1).
user(["hola como estas","que bueno, me gustaria una hamburguesa","que pesado","ok..., quiero una bebida pepsi","no"],user2).
user(["hola! cual es tu nombre estimado","que lindo nombre, bueno me gustaria unas papas","quiero unas papas fritas chicas","si claro","quiero una bebida sprite","no nada mas"],user3).

% regla que tiene como meta entregar en la lista log una conversacion
% entre la lista user y el chatbot
% las entradas son la lista user que contiene los mensaje del usuario,
% la personalidad del chatbot, el log y la semilla
% la salida es una lista log
test(User,Chatbot,InputLog,Seed,OutputLog):-
    user(Lista,User),append(Lista,[""],Lista2),length(Lista2,Largo),test2(Lista2,Chatbot,InputLog,Seed,Largo,OutputLog).

test2(Lista,Chatbot,InputLog,Seed,Largo,OutputLog):-
    InputLog=[],beginDialog(Chatbot,[],Seed,BD),test3(Lista,Chatbot,BD,Seed,1,Largo,OutputLog).


test3([X|Xs],Chatbot,InputLog,Seed,Acum,Largo,OutputLog):-
    (Acum =< Largo,sendMessage(X,Chatbot,InputLog,Seed,SM),Acum2 is Acum+1,test3(Xs,Chatbot,SM,Seed,Acum2,Largo,OutputLog));
    endDialog(Chatbot,InputLog,Seed,OutputLog).

% ///////////////////////////////////LogToStr////////////////////////////
% regla que tiene como meta crear un string que contiene toda la
% conversacion log y al hacer un write en el pueda ser una
% representacion mas entendible de la conversacion entre el usuario y el
% chatbot
% las entradas con el log que es una lista y de salida un el StrRep que
% es un string
logToStr(Log,StrRep):-
    unir(Log,"",Log2),string_concat("",Log2,StrRep).

unir([],LogFinal,LogFinal).
unir([X|Xs],LogAnterior,LogFinal):-
    string_concat(LogAnterior,X,Log1),string_concat(Log1,"\n",Log2),unir(Xs,Log2,LogFinal).


%///////////////////////////PossibleResponses///////////////////////////
% regla que tienen como meta devolver una respuesta a la pregunta
% echa por el usuario,esta respuesta es una lista con las 3 posibles
% respuestas del chatbot segun su personalidad.
% las entradas son el mensaje del usuario, el log inicial que debe ser
% una lista vacia.
possibleResponses(Msg,Chatbot,InputLog,Responses):-
    InputLog=[],respuestaCbot(Msg,Chatbot,1,Resp),agregar(InputLog,Log2,Resp),respuestaCbot(Msg,Chatbot,2,Resp2),agregar(Log2,Log3,Resp2),
    respuestaCbot(Msg,Chatbot,3,Resp3),agregar(Log3,Responses,Resp3).


agregar([],[ELEM],ELEM).
agregar([X|Xs],[X|Ys],ELEM):- agregar(Xs,Ys,ELEM).








