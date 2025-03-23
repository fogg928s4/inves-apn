syms x;
X = [280 650 1000 1200 1500 1700];
Y = [32.7 45.4 52.15 53.7 52.9 50.3];
xEvaluar = 1500;
%n se ocupará para indicar el grado del polinomio
n = 3;
% Guardar el valor de la sumatoria de Y
sumY = 0;
for j=1:length(Y)
   sumY = sumY + Y(j); 
end
%Guardar en un vector las sumas de todos los valores de X elevadas a sus
%potencias desde 1 hasta 2n 
for i=1:2*n
    sum = 0;
   for j=1:length(X)
       sum = sum + (X(j))^i;
   end
   sumXs(i) = sum;
end
%Creando un vector que almacene los resultados de la matriz
for i=1: n+1
    if i == 1
        resM(i) = sumY; 
    else
        sumatoria = 0;
        for j=1:length(X)
             sumatoria = sumatoria + Y(j)*X(j)^(i-1);
        end
        resM(i) = sumatoria;
    end
end
%Creando la matriz del sistema de ecuaciones
k = length(resM);
sisM = zeros(k);
%Llenando la primera fila
for j=1:k
    if j == 1
        sisM(j,j) = length(X);
    else
        sisM(1,j) = sumXs(j-1);
    end
end
%Llenando el resto de filas
for i=2:k
   for j=1:k
       sisM
       if(i == 2)
           sisM(i,j) = sumXs(j);
       else
           sisM(i,j) = sumXs(i+j-2);
       end
   end
end
sisM(k,k) = sumXs(2*n);
%Resolver el sistema de ecuaciones
detM=det(sisM);
for i=1:k
   newMatrix = sisM;
   newMatrix(:,i) = resM;
   det(newMatrix)
   coeficientes(i) = det(newMatrix)/detM;
end
pol = coeficientes(1);
% generando el polinomio
for i=2:k
    pretty(vpa(pol, 7))
    pol = pol + coeficientes(i)*x^(i-1);
end
fprintf('---------------polinomio-----------------\n');
pretty(vpa(pol,7))
fprintf('---------------respuesta-----------------\n');
vpa(subs(pol,(xEvaluar)), 9)