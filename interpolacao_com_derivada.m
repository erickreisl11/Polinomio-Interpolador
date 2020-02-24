
clc
clear

#O conjunto de pontos x,y
 x2=sort(rand([1,10])*100);
 y2=rand([1,10])*10;
p=length(x2)   ;   #Tamanho do vetor x2
function C2=interpol(x2,y2)



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

end
#yp2=polyval(C2,x2);
#yerro=yp2-y2;
#erro=norm(yerro)/sqrt(length(x2));
C2=interpol(x2,y2)
 x6=x2(1):0.01:x2(p);
 yp=polyval(C2,x6);

#Calculando as retas tangentes
k=1;
while k<=(length(x6)-1)
  


  m=(yp(k+1)-yp(k))/0.01;
  b=yp(k)-(m*x6(k));
  f1=@(x)((m*x6)+b)
  
    #plotando os graficos
plot(x6,yp,x2,y2,'o',x6,f1(x6))
axis([,,,400])
hold on 
  k=k+500;
  

  
end






#Limita o grafico observado axis([0,0.7,-0.02,1])
xlabel("1/X' m^{-1}","fontsize",12)
ylabel("1/Y' m^{-1}","fontsize",12)
title("Gráfico","fontsize",16)
legend("f(x)","Pontos",1)
gtext("f(x)=-1.0021x+8.9166","fontsize",12)
#gtext("Erro a=-4.8695 +/-0.9968 ","fontsize",12)











