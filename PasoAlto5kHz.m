%filtro de orden 2 paso alto
%frecuencia de corte 5kHz
function [y] = PasoAlto5kHz (Entrada)

fNMenos1 = 0;
fNMenos2 = 0;

a1 = -1.035;
a2 = 0.3678;
b0 = 0.6007;
b1 = -1.201;
b2 = 0.6007;

n = length(Entrada);
y = [];

for i=1:1:n  
    f=Entrada(i)-a1*fNMenos1-a2*fNMenos2;
    y(i)=b0*f+b1*fNMenos1+b2*fNMenos2;
    fNMenos2=fNMenos1;
    fNMenos1=f;
end