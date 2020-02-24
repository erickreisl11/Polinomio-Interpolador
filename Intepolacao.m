clc
clear

#O conjunto de pontos x,y
x2=2:1:11;
y2=[9.3,7.9,8.1,7,6,5.5,5.7,6.4,11.8,12.8];


p=length(x2)   ;   #Tamanho do vetor x2


n=input("Digite o grau do polinomio: ");
t=1;

#Definindo os vetores gn=x^(n-1)
while t<=n+1 
M2(t:t,:)=[x2.^(t-1)];

t=t+1;

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


#yp2=polyval(C2,x2);
#yerro=yp2-y2;
#erro=norm(yerro)/sqrt(length(x2));

x6=x2(1):0.001:x2(p);
yp=polyval(C2,x6);


#plotando os graficos
plot(x6,yp,x2,y2,'o')
#Limita o grafico observado axis([0,0.7,-0.02,1])
#xlabel("Valores para m ","fontsize",12)
#ylabel("Distancia do eixo do anteparo (mm)","fontsize",12)
#title("Gráfico","fontsize",16)
#legend("reta experimental f(m)","reta teorica g(m)","Pontos",0)
#gtext("f(m)=6.4571.m + 0.023810","fontsize",12)
#gtext("g(m)=7.m","fontsize",12)
#gtext("Erro a=-4.8695 +/-0.9968 ","fontsize",12)
