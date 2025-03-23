disp('<---------- Ejercicio 2 -------------->')
%se tiene la ecuacion v=a(?P)^b, para poder utilizar minimos cuadrados
% ocupamos propiedades de los logaritmos, quedando ln(v) = ln(a) + bln(?P)
%una vez definida esa formula realizamos un cambio de variable definiendo
%que Y = ln(v) y X = ln(?P) y asi tenemos la formula Y = bx + ln(a) donde
%ya se puede utilizar minimos cuadrados para encontrar a y b

syms p;
P = [30.00 35.5 50.5 75.0 92.0 105.0 115.0 130.0 153.5 180.0 199.5];
V = [3.83 4.17 4.97 6.06 6.71 7.17 7.51 7.98 8.67 9.39 9.89];
n = length(P);

%como se tiene que X = ln(?P) y Y = ln(v) ahora se calcula

for i=1:n
    X(i) = log(P(i));
    Y(i) = log(V(i));
end

%una ves se tiene X y Y realizamos las sumatorias para aplicar minimos
%cuadrados

sumatoriaX = sum(X);
sumatoriaY = sum(Y);
multiXY=0;
X2=0;

for i=1:n
    multiXY = multiXY + (X(i)*Y(i));
    X2 = X2 + X(i)^2;
end

%sacando la pendiente en este caso es B
B = (multiXY-((sumatoriaX*sumatoriaY)/n))/(X2-(sumatoriaX^2/n));

%sacando ln(A)
lna = (sumatoriaY-(B*sumatoriaX))/n;

%ya tenemos ln(A), pero lo que se quiere es A, por lo tanto
%aplicamos e para eliminar el ln

A = exp(lna);

%para encontrar v en un ?P = 5.5mmHg solo se aplica a la
%formula original v = a(?P)^b sus tituyendo a ?P y b se obtiene:

v = A*(p)^B;
velocidad = subs(v,5.5);
fprintf('La velocidad del fluido en P = 5.5mmHg es: %.15f\n', double(velocidad))

%graficando La recta de minimos cuadrados
fplot(matlabFunction(v), [30 199.5], 'g')
hold on;

% Graficar los puntos experimentales
plot(P, V, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); 

% Etiquetas y título
ylabel('Velocidad (pies/s)');
xlabel('Caida de presión (mmHg)');
title('Ajuste de mínimos cuadrados: Caida de presión vs Velociad Promedio');
legend('Recta ajustada', 'Datos experimentales', 'Location', 'best');
grid on;

