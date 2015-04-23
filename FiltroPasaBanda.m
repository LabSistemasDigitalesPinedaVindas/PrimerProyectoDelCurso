%% Funcion Filtro Pasa Banda%

function [AvdBt] = FiltroPasaBanda(frec,a1,a2,b0,b1,b2,c1,c2,d0,d1,d2)

fNmenos1 = 0;
fNmenos2 = 0;
f2Nmenos1 = 0;
f2Nmenos2 = 0;
x= 1:1:frec;
m=0.5;
b=0;
Entrada = m*x + b;

%Entrada = 0:1:frec;
n = length(Entrada);
y = [];
y2=[];
Av=[];
Av2=[];
Avt=[];
AvdB=[];
AvdB2 = [];
AvdBt=[];

for i = 1:1:n
    
    f = Entrada(i) -a1*fNmenos1 -a2*fNmenos2;
    f1 = Entrada(i) -c1*f2Nmenos1 -c2*f2Nmenos2;
    y(i) = b0*f + b1*fNmenos1 + b2*fNmenos2;
    y2(i) = d0*f1 + d1*f2Nmenos1 + d2*f2Nmenos2;
    fNmenos2 = fNmenos1;
    fNmenos1 = f;
    f2Nmenos2 = f2Nmenos1;
    f2Nmenos1 = f1;
    Av(i)=y(i)/Entrada(i);
    Av2(i) = y2(i)/Entrada(i);
    Avt(i) = Av(i)*Av2(i);
    AvdB = -20*log10(Av);
    AvdB2 = -20*log10(Av2);
    AvdBt(i) = AvdB(i)*AvdB2(i);
end
subplot(3,1,1),plot(Entrada,x);
subplot(3,1,2),plot(Entrada,AvdBt);
subplot(3,1,3),plot(Entrada,Avt);
%disp(AvdBt)
