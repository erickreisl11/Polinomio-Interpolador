clc
clear

#O conjunto de pontos x,y
x2=[162.3,389.5,563.6,1017.2,1202.4];

y2=[267.0,632.7,794.0,1496.1,1849.3];
y3=[168.1,292.3,476.3,661.7,781.7];
p=length(x2)   ;   #Tamanho do vetor x2
function C2=interpol(x2,y2)



n=input("Digite o grau do polinomio: ");
t=1;

#Definindo os vetores gn=x^(n-1)
while t<=n+1 
M2(t:t,:)=[x2.^(t-1)];

t=t+1

end

#Definindo os termos Amn = gn.gm da matriz
i=1
j=1
while i<=n+1
    j=1;
while j<=n+1 
    L2(i,j)=M2(i:i,:)*M2(j:j,:)';
    j=j+1;
    
    
end
    i=i+1;
end
#Definindo o vetor B=[y.g1,y.g2,y.g3,y.g4,y.g5,y.g6.......y,gn]
i=1
while i<=n+1
  
B2(i)=y2*M2(i:i,:)';
i=i+1;
end

#vetorzão pra criar um espaço liso no eixo x 

#Obtendo os coeficientes an.
C=inv(L2)*B2';
k=1;

while k<=length(C)
  C2(k)=C((length(C))-k+1);
  k=k+1;
end

end
#-----#yp2=polyval(C2,x2);
#-----#yerro=yp2-y2;
#-----#erro=norm(yerro)/sqrt(length(x2));
#Construindo o polinomio 1

C2=interpol(x2,y2)
x6=x2(1):0.01:x2(p);
yp=polyval(C2,x6);
#Construindo o polinomio 2
C3=interpol(x2,y3)
x6=x2(1):0.01:x2(p);
yp2=polyval(C3,x6);
figure(1)
#plotando os graficos
plot(x6,yp,x2,y2,'o')

hold on 
plot(x6,yp2,'r',x2,y3,'o')
#Limita o grafico observado 
axis([100,1300,0,2000])
xlabel("Resistencia Rx","fontsize",12)
ylabel("Resistencia em ohm","fontsize",12)
title("Gráfico","fontsize",14)
legend("Rohm(Rx)","pontos","Rp(Rx)","Pontos",0)


gtext("Rp=1.4921Rx 12.5986","fontsize",12)
gtext("Rohm=0.5787Rx+90.0001","fontsize",12)

figure(2)

z=y3;
surf(x2,y2,z)



