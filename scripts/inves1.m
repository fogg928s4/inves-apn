disp('<----------Ejercicio 1------------>')
syms t;
T = [10.50 29.49 42.70 60.01 75.51 91.05];
R = [10.421 10.939 11.321 11.794 12.242 12.668];
n = length(T);

sumatoriaX = sum(T);
sumatoriaY = sum(R);
multiXY=0;
X2=0;

for i=1:n
    multiXY = multiXY+(T(i)*R(i));
    X2 = X2 + T(i)^2;
end

%sacando la pendiente en mi funcion y=mx+b que se reescribe como r = mT+b
m = (multiXY-((sumatoriaX*sumatoriaY)/n))/(X2-(sumatoriaX^2/n));

%sacando b
b = (sumatoriaY-(m*sumatoriaX))/n;

%se escribe la funcion
r = m*t+b;

fprintf('La resistencia de la bobina que esta a 65°: %.15f\n', double(subs(r,65)))

%graficando La recta de minimos cuadrados
fplot(matlabFunction(r), [10.50 91.05], 'g')
hold on;

% Graficar los puntos experimentales
plot(T, R, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); 

% Etiquetas y título
xlabel('Temperatura (°C)');
ylabel('Resistencia (?)');
title('Ajuste de mínimos cuadrados: Resistencia vs Temperatura');
legend('Recta ajustada', 'Datos experimentales', 'Location', 'best');
grid on;



