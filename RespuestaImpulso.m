%Se establece una señal escalon para estimular la entrada de los filtros 
t = (0:50.000:50000);
EntradaX = [zeros(1,100),1,zeros(1,50),1,zeros(1,50)];

%Para construir el filtro de bajas frecuencias, se toma la función paso
%alto 20Hz, utilizando como entrada la funcion escalon definida
%anteriormente, luego se toma la funcion paso bajo 200Hz, utilizando como 
%entrada la salida del paso alto anterior. 
y1 = PasoAlto20Hz (EntradaX);
SalBajasFrec = PasoBajo200Hz (y1);

%Para construir el filtro de frecuencias medias, se toma la función paso
%alto 200Hz, utilizando como entrada la funcion escalon definida
%anteriormente, luego se toma la funcion paso bajo 5kHz, utilizando como 
%entrada la salida del paso alto anterior. 
y2 = PasoAlto200Hz (EntradaX);
SalMediasFrec = PasoBajo5kHz (y2);

%Para construir el filtro de altas frecuencias, se toma la función paso
%alto 5kHz, utilizando como entrada la funcion escalon definida
%anteriormente, luego se toma la funcion paso bajo 20kHz, utilizando como 
%entrada la salida del paso alto anterior. 
y3 = PasoAlto5kHz (EntradaX);
SalAltasFrec = PasoBajo25kHz (y3);

%Se realiza la sumatoria de las señales de salida, que da por resultado la
%salida necesaria
SalidaTot = SalBajasFrec + SalMediasFrec + SalAltasFrec;

%Se procede a graficar las funciones anteriores, asi como la entrada 
%utilizada de acuerdo al tiempo t definido al inicio. 
subplot(5,1,1), plot(t(1:200), EntradaX(1:200));
subplot(5,1,2), plot(t(1:200), SalBajasFrec(1:200));
subplot(5,1,3), plot(t(1:200), SalMediasFrec(1:200));
subplot(5,1,4), plot(t(1:200), SalAltasFrec(1:200));
subplot(5,1,5), plot(t(1:200), SalidaTot(1:200));