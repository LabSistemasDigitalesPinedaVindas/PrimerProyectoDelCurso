Numeros1 = randi (5,1,10);
y=[];
% y=ConversionDecimalPuntoFijo(5);
% display (y)
archivo = fopen('Datos.txt','w');

for i = 1:length(Numeros1)
    fprintf(archivo,'%s\r\n',num2str(ConversionDecimalPuntoFijo(Numeros1(i))));
end

fclose(archivo);
length(Numeros1)