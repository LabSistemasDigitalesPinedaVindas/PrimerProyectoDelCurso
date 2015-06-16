%Se establece una señal senoidal para estimular la entrada de los filtros
%se crea una matriz de 0 a 5000 para simular el tiempo, en microsegundos
t = 0:1:5000;

%Se debe crear una suma de señales senoidales, para hacer esto se toman
%señales con diferente frecuencia y se superponen,la frecuencia utilizada
%esta en radianes por segundo, al realizar la operacion 
%(FrecuenciaAngular*Tiempo en microsegundos) se debe utilizar la frecuencia
%angular en Radianes por microsegundos para que las unidades se cancelen

frecuencia1=2*pi*(50/100000);%50 radianes por microsegundos (bajas)
frecuencia2=2*pi*(1000/100000);%1000 radianes por microsegundo (medias)
frecuencia3=2*pi*(10000/100000);%10000 radianes por microsegundos (altas)

%EntradaBase corresponde a la suma de las tres señales senoidales, pero 
%estas salidas van de 1 a -1 cada una, por lo que la suma y al ser una 
%suma, la señal resultante va es de 3 a -3 y como se necesitan valores
%positivos, se realiza un offset de 3, asi la señal queda de 0 a 6 pero se
%necesita una magnitud de 0 a 0.9999 entonces se divide entre 6.

EntradaBase=((sin(frecuencia1*t) + sin(frecuencia2*t) + sin(frecuencia3*t))+3)/6;

%Se elimina el offset pues este solo se utiliza para cuando la señal ingresa
%en el ADC. Para poder utilizar los filtros se debe eliminar, para esto se 
%tiene en cuenta que la señal al ser dividida entre 6 queda de -1 a 1 y por 
%esta razon el offset es la mitad, es decir 0.5

EntradaX = EntradaBase-.5;

%Para construir el filtro de bajas frecuencias, se toma la función paso
%alto 20Hz, utilizando como entrada la funcion escalon definida
%anteriormente, luego se toma la funcion paso bajo 200Hz, utilizando como 
%entrada la salida del paso alto anterior.
y1 = PasoAlto20Hz( EntradaX );
SalBajasFrec = PasoBajo200Hz( y1 );

%Para construir el filtro de frecuencias medias, se toma la función paso
%alto 200Hz, utilizando como entrada la funcion escalon definida
%anteriormente, luego se toma la funcion paso bajo 5kHz, utilizando como 
%entrada la salida del paso alto anterior. 
y2 = PasoAlto200Hz( EntradaX );
SalMediasFrec= PasoBajo5kHz( y2 );

%Para construir el filtro de altas frecuencias, se toma la función paso
%alto 5kHz, utilizando como entrada la funcion escalon definida
%anteriormente, luego se toma la funcion paso bajo 20kHz, utilizando como 
%entrada la salida del paso alto anterior. 
y3 = PasoAlto5kHz( EntradaX );
SalAltasFrec= PasoBajo25kHz( y3 );

%Se realiza la sumatoria de todas las señales que da por resultado la
%salida necesaria
SalidaTot = SalBajasFrec + SalMediasFrec + SalAltasFrec;


%Se procede a graficar las funciones anteriores, asi como la entrada 
%utilizada de acuerdo al tiempo t definido al inicio.
subplot(5,1,5), plot(t, EntradaX);
subplot(5,1,1), plot(t, SalBajasFrec);
subplot(5,1,2), plot(t, SalMediasFrec);
subplot(5,1,3), plot(t, SalAltasFrec);
subplot(5,1,4), plot(t, SalidaTot);
