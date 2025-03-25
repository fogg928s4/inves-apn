syms x;
% Valores del tiempo
X = [0 4 10 19 35 55 75 85]; 
% Concentración del medicamento
Y = [100 69.62 32.32 24.1 12.54 5.63 3.74 2.99];
xEvaluar1 = 50; % En un tiempo 50 (interpolación)
xEvaluar2 = 100; % En un tiempo 100 (extrapolación)

% Se ocupará un polinomio de grado 3 como se indica
n = 3;
% Guardar el valor de la sumatoria de Y
sumY = sum(Y);
%Guardar en un vector las sumas de todos los valores de X elevadas a sus
%potencias desde 1 hasta 2n 
for i=1:2*n
    sum = 0;
   for j=1:length(X)
       sum = sum + (X(j))^i;
   end
   sumXs(i) = sum;
end
% Creando un vector que almacene los resultados de la matriz
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
   coeficientes(i) = det(newMatrix)/detM;
end

% Generando el polinomio
pol = coeficientes(1);
for i=2:k
    pol = pol + coeficientes(i)*x^(i-1);
end
estimacion1 = double(subs(pol,xEvaluar1));
estimacion2 = double(subs(pol,xEvaluar2));
fprintf('---------------polinomio-----------------\n');
pretty(vpa(pol,7))
fprintf('---------------respuesta-----------------\n');
fprintf('La concentración del medicamente a después de %d minutos es %.9f\n', xEvaluar1, estimacion1);
fprintf('La concentración del medicamente a después de %d minutos es %.9f\n', xEvaluar2, estimacion2);

 % Graficando puntos
 plot(X,Y, '*r', xEvaluar1, estimacion1, '*g', xEvaluar2, estimacion2, '*g');
 hold on; grid on;
 % Graficando la función polinomial del modelo.
 ezplot(pol, [0 105]);
 xlabel('Tiempo (min)'); ylabel('Concentración del medicamento');
 title('Concentración vs. Tiempo');
 legend('Valores iniciales', 'Valores de estimación', 'Modelo');
 