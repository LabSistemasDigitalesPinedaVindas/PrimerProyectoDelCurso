%%Respuesta a rampa

Entrada = 1:1:1000;
%y = PasoAlto20Hz(Entrada);
y= PasoAlto20Hz(Entrada);
salidasBajas = PasoBajo200Hz(y);
plot (Entrada,salidasBajas)